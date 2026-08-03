#!/usr/bin/env python3
"""Dry-tests: what it takes to mirror amasci.com (William Beatty) IN FULL.

Run:  python3 -m unittest test_amasci_mirror -v
      MERLIB_NET=1 python3 -m unittest test_amasci_mirror -v   # + live probes

"Dry" means: no network, no crawling. These tests read the mirror already on disk
and assert the things a full-coverage crawl depends on. They exist because
amasci.com cannot be mirrored by pointing the engine at it and trusting the log —
the 2026-03-05 run reported "downloaded 1550, failed 0" while holding 7.3% of the
pages Wayback has ever seen for the domain.

Every number below was MEASURED with scripts/mirror_coverage.py on 2026-08-03,
not estimated. Baselines are asserted as floors so a future regression is loud.
Findings and the actual recipe: MIRROR-AMASCI-PLAN.md

The five findings these tests lock in:

  1. amasci.com is HTTP-ONLY. https://amasci.com/ does not answer at all (no TLS).
     Assume https anywhere and every relative link resolves to a dead address.
  2. 1,249 of 3,262 cited same-domain URLs are MALFORMED — Beatty's hand-written
     HTML has unquoted attributes and concatenated hrefs. A crawler that chases
     them wastes the run; a coverage report that counts them lies about the gap.
  3. Of the genuinely-missing URLs the live site links to, ~88% are 404 on
     Beatty's own server. The live site is 85.4% covered — close to its ceiling.
  4. The real corpus is HISTORICAL. Wayback has 17,608 static paths we do not
     hold (7,367 .html + 2,694 .htm). Live crawling CANNOT reach them.
  5. Apache MultiViews returns HTTP 300 for some paths. Non-200 is currently
     treated as failure, so those are dropped silently.
"""

import os
import sys
import unittest

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "scripts"))
import mirror  # noqa: E402
import mirror_coverage as mc  # noqa: E402

REPO = os.path.dirname(os.path.abspath(__file__))
SITE = os.path.join(REPO, "sites", "amasci.com")
NET = os.environ.get("MERLIB_NET") == "1"

# Measured 2026-08-03 by scripts/mirror_coverage.py sites/amasci.com
BASELINE = {
    "pages_scanned": 728,
    "referenced": 3262,
    "malformed": 1249,
    "dynamic": 49,
    "mirrorable": 1964,
    "present": 1677,
    "gap": 287,
    "coverage_pct": 85.4,
    # --wayback, deduped by resolved path
    "wayback_distinct_paths": 22575,
    "wayback_on_disk": 1394,
    "wayback_absent_static": 17608,
    "wayback_coverage_pct": 7.3,
}


@unittest.skipUnless(os.path.isdir(SITE), "sites/amasci.com not mirrored here")
class TestAmasciSchemeIsHttpOnly(unittest.TestCase):
    """FINDING 1 — the single most important fact about mirroring this site.

    Get this wrong and nothing else matters: every relative link is resolved
    against a base URL, so an https base turns a healthy mirror into a report
    full of unreachable addresses. It also silently poisons any live probe.
    """

    def test_detect_scheme_says_http(self):
        self.assertEqual(mc.detect_scheme(SITE, "amasci.com"), "http")

    def test_pages_self_reference_over_http(self):
        # Beatty's absolute self-links are http://; that is the evidence
        # detect_scheme falls back on when SOURCE.txt is absent (as it is here).
        http_n = 0
        for _rel, path in mc.mirrored_html(SITE)[:60]:
            with open(path, "rb") as fh:
                http_n += fh.read(200_000).count(b"http://amasci.com")
        self.assertGreater(http_n, 0, "no http:// self-links found — re-check finding 1")

    @unittest.skipUnless(NET, "network test; set MERLIB_NET=1")
    def test_https_really_does_not_answer(self):
        import urllib.request
        with self.assertRaises(Exception):
            urllib.request.urlopen("https://amasci.com/", timeout=20)

    @unittest.skipUnless(NET, "network test; set MERLIB_NET=1")
    def test_http_does_answer(self):
        import urllib.request
        with urllib.request.urlopen("http://amasci.com/", timeout=20) as r:
            self.assertEqual(r.status, 200)


class TestMalformedHrefClassification(unittest.TestCase):
    """FINDING 2 — Beatty's markup is broken; the crawler must not chase it.

    These are REAL strings extracted from the mirror, not invented ones.
    """

    def test_two_urls_concatenated(self):
        # From stats/idbypag2.html — an unterminated href swallowed the next tag.
        u = ("http://amasci.com/amateur/traffic/traffic1.htmlhttp://amasci.com/"
             "amateur/traffic/traffic1.html")
        self.assertEqual(mc.classify_missing(u), "malformed")

    def test_markup_captured_inside_href(self):
        self.assertEqual(
            mc.classify_missing('http://amasci.com/x.html</a><br>\t<a href='),
            "malformed")

    def test_hostname_sliced_as_extension(self):
        # ".com" / ".co" / ".c" as a path extension means we cut a hostname.
        for u in ("http://amasci.com/foo.com", "http://amasci.com/foo.co",
                  "http://amasci.com/foo.c"):
            self.assertEqual(mc.classify_missing(u), "malformed", u)

    def test_href_truncated_at_equals(self):
        self.assertEqual(mc.classify_missing("http://amasci.com/foo.com="), "malformed")

    def test_cgi_is_dynamic_not_a_gap(self):
        # amasci.com has ~2,000 .cgi URLs in Wayback. None are mirrorable.
        self.assertEqual(mc.classify_missing("http://amasci.com/cgi-bin/x.cgi"), "dynamic")

    def test_query_string_is_dynamic(self):
        self.assertEqual(
            mc.classify_missing("http://amasci.com/amateur/holo1.html?=dupe"), "dynamic")

    def test_a_plain_missing_page_is_a_real_gap(self):
        self.assertEqual(mc.classify_missing("http://amasci.com/oldtech/"), "gap")

    def test_directory_url_resolves_to_index(self):
        # A trailing-slash URL must map to <dir>/index.html, or every directory
        # link would be miscounted as missing.
        self.assertEqual(mirror.sanitize_path("http://amasci.com/oldtech/"),
                         "oldtech/index.html")


@unittest.skipUnless(os.path.isdir(SITE), "sites/amasci.com not mirrored here")
class TestAmasciLiveSiteCoverage(unittest.TestCase):
    """FINDING 3 — measured coverage of what the LIVE site still links to.

    Floors, not equalities: the mirror may improve. A drop means a regression in
    the extractor or a lost mirror, and should fail loudly.
    """

    @classmethod
    def setUpClass(cls):
        cls.cov = mc.internal_link_coverage(SITE, host="amasci.com", scheme="http")
        cls.mirrorable = (cls.cov["referenced"] - len(cls.cov["malformed"])
                          - len(cls.cov["dynamic"]))

    def test_scheme_used_was_http(self):
        self.assertEqual(self.cov["scheme"], "http")

    def test_pages_scanned_at_least_baseline(self):
        self.assertGreaterEqual(self.cov["pages_scanned"], BASELINE["pages_scanned"])

    def test_malformed_bulk_is_real_and_large(self):
        # If this collapses toward zero, classify_missing regressed and the
        # coverage figure silently became a lie.
        self.assertGreater(len(self.cov["malformed"]), 1000)

    def test_coverage_of_mirrorable_urls_holds(self):
        pct = 100.0 * self.cov["present"] / self.mirrorable
        self.assertGreaterEqual(round(pct, 1), BASELINE["coverage_pct"] - 1.0,
                                f"live-site coverage fell to {pct:.1f}%")

    def test_raw_coverage_is_misleading_and_we_know_it(self):
        # Documents WHY the report separates the two: the raw number is ~34
        # points worse and would send a re-crawl chasing addresses that never
        # existed. This asserts the gap between the two figures is real.
        raw = 100.0 * self.cov["present"] / self.cov["referenced"]
        real = 100.0 * self.cov["present"] / self.mirrorable
        self.assertGreater(real - raw, 20.0)

    def test_exit_status_keys_on_real_gap_not_noise(self):
        # A repo full of the source site's broken hrefs must not make the tool
        # fail forever, or a true miss stops being actionable.
        self.assertGreater(len(self.cov["gap"]), 0)
        self.assertLess(len(self.cov["gap"]), len(self.cov["missing"]))


@unittest.skipUnless(os.path.isdir(SITE), "sites/amasci.com not mirrored here")
class TestAmasciKnownPathologies(unittest.TestCase):
    """Site-specific traps a full-mirror run has to survive."""

    def test_query_string_filenames_exist_on_disk(self):
        # sanitize_path encodes query strings into the filename. These are real
        # files in the mirror and are why ".html__proceed%3D1" appears in the
        # file-type census. A re-crawl must not treat them as corruption.
        hits = []
        for root, _d, files in os.walk(SITE):
            for f in files:
                if "%3D" in f or "__" in f:
                    hits.append(os.path.join(root, f))
        self.assertTrue(hits, "expected sanitize_path query-string artifacts")

    def test_typo_variant_directories_are_distinct_content(self):
        # amasci.com genuinely serves BOTH /amateur/ and /amatuer/ (Beatty's own
        # typo, kept working for old links), plus amfrm/ and amafrm/. A dedupe
        # pass that "cleans up" near-identical names would destroy real pages.
        present = [d for d in ("amateur", "amatuer", "amfrm", "amafrm")
                   if os.path.isdir(os.path.join(SITE, d))]
        self.assertGreaterEqual(len(present), 3, f"only found {present}")

    def test_txt_files_are_part_of_the_corpus(self):
        # 181 .txt files — Beatty's mailing-list archives. Any "HTML only"
        # shortcut would drop them, and they are prose, not assets.
        n = sum(1 for _r, _d, fs in os.walk(SITE) for f in fs if f.endswith(".txt")
                and not f.startswith("_") and f != "ALLFILES.txt")
        self.assertGreater(n, 100)

    def test_no_https_urls_were_used_as_bases(self):
        # Guard against the bug this suite was written after: constructing an
        # https base for an HTTP-only host.
        self.assertEqual(mc.detect_scheme(SITE, "amasci.com"), "http")


@unittest.skipUnless(NET, "network test; set MERLIB_NET=1")
class TestAmasciServerBehaviour(unittest.TestCase):
    """FINDING 5 — Apache MultiViews. Live, so opt-in."""

    def _status(self, url):
        import urllib.request
        req = urllib.request.Request(url, method="HEAD",
                                     headers={"User-Agent": "merlib-mirror/test"})
        try:
            with urllib.request.urlopen(req, timeout=20) as r:
                return r.status
        except urllib.error.HTTPError as e:
            return e.code

    def test_multiviews_returns_300_for_some_paths(self):
        # Measured: 4 of 60 sampled gaps answered 300. The engine treats non-200
        # as failure, so MultiViews paths are dropped without a trace.
        self.assertEqual(self._status("http://amasci.com/freenrg/tors/tors.txt"), 300)

    def test_most_of_the_live_gap_is_genuinely_dead(self):
        # ~88% of the live-site gap is 404 on Beatty's server. Confirms the live
        # mirror is near its ceiling and that the corpus must come from Wayback.
        dead = sum(1 for u in ("http://amasci.com/lenses.html",
                               "http://amasci.com/nerdsmax.html",
                               "http://amasci.com/oldtech/")
                   if self._status(u) == 404)
        self.assertGreaterEqual(dead, 2)


@unittest.skipUnless(NET, "network test; set MERLIB_NET=1")
class TestAmasciHistoricalCorpus(unittest.TestCase):
    """FINDING 4 — the corpus is historical, and that is the whole ballgame.

    One CDX request. This is the test that says "a live crawl can never finish
    this job", which is the actual answer to 'how do we mirror it in full'.
    """

    def test_wayback_holds_far_more_than_the_live_site(self):
        inv = mc.wayback_inventory("amasci.com")
        self.assertGreater(len(inv), 20000)

        present, missing = set(), {}
        for url in inv:
            lp = mirror.sanitize_path(url)
            if os.path.exists(os.path.join(SITE, lp)) and \
                    os.path.getsize(os.path.join(SITE, lp)) > 0:
                present.add(lp)
            elif lp not in missing:
                missing[lp] = url
        static = [u for u in missing.values() if mc.classify_missing(u) == "gap"]

        # We hold a small fraction of the static paths Wayback ever saw.
        self.assertGreater(len(static), 10000,
                           "expected >10k static historical paths we lack")
        pct = 100.0 * len(present) / (len(present) + len(static))
        self.assertLess(pct, 25.0,
                        f"coverage vs Wayback is {pct:.1f}% — if this improved a lot, "
                        "the historical backfill has been done; update the baseline")


if __name__ == "__main__":
    unittest.main()
