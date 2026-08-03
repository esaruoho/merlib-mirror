# FEATURE CARD — merlib-mirror: is a mirror COMPLETE? measure it, don't assume it
#
# WHAT THIS CARD SPAWNS
#   Codespace  : scripts/mirror_coverage.py · test_amasci_mirror.py ·
#                MIRROR-AMASCI-PLAN.md
#   Thinkspace : features/frameset-following.session.md (same session)
#   Areaspace  : OWNS measurement of mirror completeness and the taxonomy of why
#                a referenced URL is absent.
#                MUST NOT touch: the crawl itself, should_skip_url's domain rule,
#                queue semantics, or any mirrored byte. This tool only READS.
#
# RESULT
#   Feature commit : see git log for scripts/mirror_coverage.py +
#                    test_amasci_mirror.py + MIRROR-AMASCI-PLAN.md
#   PR             : direct-push to main (engine infrastructure)
#   Origin         : Esa, 2026-08-03 — "please write dry-tests on how to get
#                    william beatty amasci.com/ fully mirrored, cos we need to
#                    trigger another keelynet.com type page per page analysis via
#                    email automation using macmini, and for that, we need to
#                    learn how to mirror the site in full."
#
# BACK-LINK: `FEATURE-CARD >> features/mirror-coverage.feature` in
#            scripts/mirror_coverage.py.

Feature: "Failed: 0" is not evidence of completeness

  A mirror log that says "Failed: 0" reports only that nothing errored. It says
  nothing about what was never discovered. This repo has been bitten three times
  by that gap being invisible: the meyl.eu meta-refresh splash, the radiondistics
  frameset, and amasci.com — which logged "downloaded 1550, failed 0" while
  holding 7.3% of the static paths Wayback has ever seen for the domain.

  So completeness needs a measurement, not a feeling.

  Background:
    Given a mirrored site on disk

  @hw-verified
  Scenario: Internal-link coverage, free and offline
    When every same-domain URL cited by a mirrored page is resolved through
         mirror.sanitize_path and checked against the disk
    Then present / absent counts are reported with the citing page for each miss
    And no network is touched
    # cite: scripts/mirror_coverage.py  internal_link_coverage()
    # verified: amasci.com — 728 pages scanned, 3,262 same-domain URLs cited
    # mechanism: python3 scripts/mirror_coverage.py sites/<domain>

  @hw-verified
  Scenario: A raw missing-count is NOT a coverage figure
    Given a hand-written 1990s site full of genuinely broken hrefs
    Then absences are classified malformed / dynamic / gap
    And only 'gap' counts against the mirror
    # cite: scripts/mirror_coverage.py  classify_missing()
    # verified: amasci.com — 1,249 of 3,262 cited URLs are MALFORMED (unquoted
    #           attributes, two hrefs concatenated) and 49 are dynamic. Counting
    #           them as misses reports 51.4% coverage; the honest figure is 85.4%.
    #           A 34-point error that would send a re-crawl chasing addresses
    #           that never existed.

  @hw-verified
  Scenario: The base scheme is derived, never guessed
    Then the scheme comes from SOURCE.txt, else from the scheme the site's own
         absolute self-links use, else http
    # cite: scripts/mirror_coverage.py  detect_scheme()
    # verified: amasci.com is HTTP-ONLY — https://amasci.com/ returns 000, no TLS
    #           at all. My first run hardcoded an https base and reported 59%
    #           coverage plus a wall of URLError, purely from that assumption.
    #           Relative links resolve against the base, so this one wrong guess
    #           invalidates the entire report.

  @hw-verified
  Scenario: The historical corpus is visible, not just the live one
    When --wayback is passed
    Then the CDX inventory is compared against disk, deduped by resolved path
    # cite: scripts/mirror_coverage.py  wayback_inventory() + the dedupe
    # CDX collapses on urlkey, which INCLUDES the host — a site served at both
    # amasci.com and www.amasci.com yields two rows per file, so a raw row count
    # is ~2x inflated. sanitize_path is host-independent, so dedupe on it.
    # verified: amasci.com — 22,765 rows → 22,575 distinct paths; 1,394 on disk;
    #           17,608 absent AND static. ~10,061 HTML pages a live crawl can
    #           never reach. This is the finding that answers the question.

  @hw-verified
  Scenario: Absent-but-recoverable is distinguished from absent-and-dead
    When --live N is passed
    Then N missing URLs are HEAD-probed and bucketed 2xx / 4xx / error
    # verified: amasci.com, 60 sampled gaps — 53 dead (404 on Beatty's own
    #           server), 4 HTTP 300 (Apache MultiViews), 2 live, 1 invalid URL.
    #           So ~88% of the live gap is unrecoverable and re-crawling buys
    #           single-digit pages, not a corpus.
    # LIMIT: this is a 60-of-287 SAMPLE, not the full set. The 88% is an estimate.

  @hw-verified
  Scenario: Wayback is a URL INDEX, not only a content store
    Given a page nothing surviving links to
    Then BFS from the entry page can never find it, however well tuned
    And --probe-wayback splits Wayback-only paths into fetch-from-LIVE and
        fetch-from-Wayback, and --seed-list writes the live ones out
    # Esa, 2026-08-03: "why use wayback for amasci when amasci is online right now?"
    # Correct question, and it splits Wayback's job in two.
    # verified: amasci.com/refs.html — William Beaty's own résumé, at the SITE
    #           ROOT — is live right now (HTTP 200), absent from our mirror, and
    #           was never discovered by link-following. Also weird/unusual/blll.html
    #           and tesla/tespics.html.
    # verified: 60 Wayback-only HTML paths HEADed against the LIVE server →
    #           57x 404, 3x 200. So ~95% really are gone from Beatty's server
    #           (Wayback is the only source), but the live 5% is real and should
    #           be fetched LIVE — canonical bytes, no toolbar to strip, no CDX
    #           rate limits. One of the 3 was junk (/%20), so 5% is a ceiling.
    # mechanism: python3 scripts/mirror_coverage.py sites/amasci.com --wayback \
    #              --probe-wayback 200 --seed-list amasci-live-seeds.txt

  @hw-verified
  Scenario: A truncated CDX response is refused, not believed
    Given Wayback CDX is flaky under repeated calls
    When a fresh inventory is less than half the size of one already seen
    Then it is rejected as truncated and the cached known-good copy is used
    And the inventory is cached 24h in .cache/ with retry + backoff
    And the tests SKIP rather than fail when CDX is unreachable
    # cite: scripts/mirror_coverage.py  wayback_inventory()
    # verified the hazard for real: one call returned 208 HTML paths where the
    #          true figure is 10,061 — a 50x under-report — and the next returned
    #          HTTP 504. A truncated inventory is WORSE than an error: it makes
    #          the archive look BETTER covered than it is. Same failure class as
    #          "Failed: 0". Stable once cached: 22,765 rows / 7,471 .html.

  @hw-verified
  Scenario: Discovery does not rely on link-following alone
    Given BFS from one entry page cannot reach a page nothing links to
    Then seeds are gathered from robots.txt Sitemap: directives, the sitemaps they
         name, conventional /sitemap.* locations, the site's own index/stats pages,
         the internal-link gap, and optionally Wayback
    And robots.txt Disallow paths are EXCLUDED unless --ignore-robots
    # cite: scripts/build_seed_list.py
    # verified on amasci.com — 1,384 seeds:
    #   897 from robots.txt -> Sitemap: http://amasci.com/googmap.xml (899 URLs,
    #       Beatty's OWN sitemap — 209 of them, 23%, were absent from our mirror:
    #       blog.html, books1.html, feynexpt.txt, feyntape.html, buscards.html)
    #    15 from /sitemap.html
    #   272 from the internal-link gap
    #   201 from the site's own index/stats pages (stats/idbylink2.html alone
    #       carries 1,517 links — an auto-generated index of the whole site)
    #    -1 excluded by robots.txt Disallow (72 rules)
    # mechanism: python3 scripts/build_seed_list.py amasci.com --out seeds.txt

  @hw-verified
  Scenario: An HTTP 300 is a rename hint, not a dead end
    Given Apache MultiViews answering 300 for /sitemap.xml
    Then its body lists "Available documents" naming the real file
    And those alternatives are followed
    # verified: http://amasci.com/sitemap.xml -> 300, body names /sitemap.html,
    #           which exists and yielded 15 seeds. So the 300s measured earlier
    #           are RECOVERABLE, not lost — the server is telling us the filename.
    # cite: scripts/build_seed_list.py  the 300/"Available documents" branch
    # NOTE: build_seed_list.py parses this; mirror.py still treats 300 as a
    #       failure. See the @todo below.

  @built
  Scenario: Exit status is actionable
    Then exit 1 when a real gap exists, exit 0 otherwise
    # Keyed on 'gap', not raw absences: a repo full of the source site's broken
    # hrefs must not fail forever, or a true miss stops being actionable.

  @hw-verified
  Scenario: The findings are locked as tests, not left in a chat log
    Then test_amasci_mirror.py asserts the five findings and the measured floors
    # verified: 25 tests, 20 dry + 5 network-gated behind MERLIB_NET=1; all pass
    # mechanism: python3 -m unittest test_amasci_mirror -v
    #            MERLIB_NET=1 python3 -m unittest test_amasci_mirror -v
    # One test asserts coverage-vs-Wayback stays UNDER 25% — when the historical
    # backfill succeeds it fails ON PURPOSE, as the signal to update the baseline.

  @todo
  Scenario: The engine handles HTTP 300 MultiViews instead of dropping it
    Given Apache content negotiation answering 300 for some paths
    Then those pages are currently treated as failures and lost without a trace
    # Measured: 4 of 60 sampled amasci gaps. Small in count, but it is a
    # SILENT-loss class, which is the category this repo keeps getting hurt by.

  @todo
  Scenario: Coverage runs as a belt stage
    Then a mirror job should end by reporting its own coverage
    # Today the tool is manual. Wiring it into mirror-worker would put a real
    # completeness number in every PR body, replacing "Failed: 0" as the thing a
    # reviewer looks at. Not done yet.

  @todo
  Scenario: Wayback soft-404s are detected
    Given Wayback's statuscode:200 filter still returns pages that were error
          pages served with 200
    Then a backfilled corpus will contain them and site_to_paper will consolidate
         them as if they were content
    # Needs a post-pass flagging suspiciously short/duplicate bodies before any
    # per-page analysis runs. Relevant the moment the amasci backfill happens.
