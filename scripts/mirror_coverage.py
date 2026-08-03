#!/usr/bin/env python3
"""Is a mirror actually COMPLETE? Measure it, don't assume it.

FEATURE-CARD >> features/mirror-coverage.feature

A mirror log that says "Failed: 0" only means nothing errored. It says nothing
about what was never discovered. This project has now been bitten twice by that
gap being invisible (the meyl.eu meta-refresh splash, the radiondistics frameset),
so completeness needs a measurement rather than a feeling.

The strongest available signal costs nothing and needs no network: **the mirror's
own pages reference URLs we can check against the disk.** If amasci.com's pages
link to 400 same-domain pages we don't hold, the mirror is not complete, and the
log's "Failed: 0" was never evidence that it was.

Three probes, cheapest first:

  (dry, default)  internal-link coverage — every same-domain URL referenced by a
                  mirrored page, resolved through mirror.sanitize_path, checked
                  against the disk. No network. This is the one the tests use.
  --wayback       Wayback CDX inventory — finds pages nothing surviving links to.
                  One HTTP request per domain.
  --live N        HEAD-probe N missing URLs to split recoverable (2xx) from dead
                  (4xx). Tells you whether a re-crawl would actually get them.

Usage:
    python3 scripts/mirror_coverage.py sites/amasci.com
    python3 scripts/mirror_coverage.py sites/amasci.com --live 40
    python3 scripts/mirror_coverage.py sites/amasci.com --wayback --json out.json

Exit status: 0 if internal-link coverage is complete, 1 if pages are missing.
"""

import argparse
import collections
import json
import os
import sys
import urllib.parse
import urllib.request

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import mirror  # noqa: E402

HTML_EXT = {".html", ".htm"}
# Extensions mirror.should_skip_url deliberately refuses; not counted as gaps.
SKIPPED_EXT = {".exe", ".msi", ".dmg", ".zip", ".tar", ".gz", ".iso"}


def classify_missing(url):
    """Why is this URL not on disk? A raw missing-count is not a coverage figure.

    amasci.com is hand-written HTML from the 1990s and is full of genuinely broken
    markup — unquoted attributes, two hrefs concatenated into one, stray `=`. The
    extractor faithfully surfaces those as URLs, so counting them as "missing
    pages" would understate coverage badly and send a re-crawl chasing addresses
    that never existed. Equally, .cgi endpoints are not static pages and cannot be
    mirrored at all. Only what is left is a real gap.

    Returns one of: 'malformed', 'dynamic', 'gap'.
    """
    parsed = urllib.parse.urlparse(url)
    path, query = parsed.path, parsed.query

    # Two URLs run together, or raw markup captured inside the href: the source
    # HTML is broken, not our mirror. ('http' appearing again past the scheme.)
    if url.count("://") > 1 or "http://" in url[8:] or "https://" in url[8:]:
        return "malformed"
    if any(c in url for c in ('"', "'", "<", ">", "\n", "\r", "\t")):
        return "malformed"
    # An href that got cut mid-attribute, e.g. ".../foo.com=" or "...&amp;a=".
    if path.endswith("=") or (not query and url.rstrip().endswith("=")):
        return "malformed"
    # Nonsense extensions produced by truncation: ".com", ".co", ".c" as the
    # *extension* of a path segment means we sliced a hostname, not a file.
    ext = os.path.splitext(path.lower())[1]
    if ext in (".com", ".co", ".c", ".n", ".o", ".ne", ".or", ".org", ".edu", ".gov"):
        return "malformed"

    # Server-side endpoints: no static byte to mirror.
    if ext in (".cgi", ".pl", ".php", ".asp", ".jsp", ".exe"):
        return "dynamic"
    if query:
        return "dynamic"

    return "gap"


def site_domain(site_dir):
    name = os.path.basename(os.path.abspath(site_dir).rstrip("/"))
    return name[4:] if name.startswith("www.") else name


def mirrored_html(site_dir):
    """Every mirrored HTML file, as (relpath, absolute path)."""
    out = []
    for root, dirs, files in os.walk(site_dir):
        dirs[:] = [d for d in dirs if d not in ("_paper", "_pdfs", "__pycache__")
                   and not d.startswith(".")]
        for f in files:
            if f.startswith("_"):
                continue
            if os.path.splitext(f)[1].lower() in HTML_EXT:
                p = os.path.join(root, f)
                out.append((os.path.relpath(p, site_dir), p))
    out.sort()
    return out


def detect_scheme(site_dir, host):
    """http or https — do NOT guess. Getting this wrong invalidates the report.

    Relative links are resolved against a base URL we construct, so if we assume
    https for an HTTP-only host, every relative link becomes an https URL that
    resolves oddly and fails every live probe. amasci.com is exactly that case:
    `https://amasci.com/` does not answer at all (no TLS), so an https base makes
    a healthy mirror look broken. Prefer the recorded target, then the scheme the
    mirrored pages themselves use in absolute self-links, then http.
    """
    src = os.path.join(site_dir, "SOURCE.txt")
    if os.path.exists(src):
        for line in open(src, errors="ignore"):
            if line.startswith("target:"):
                t = line.split(":", 1)[1].strip()
                if t.startswith("http://"):
                    return "http"
                if t.startswith("https://"):
                    return "https"
    # Fall back to whichever scheme the site's own absolute self-links use.
    http_n = https_n = 0
    for rel, path in mirrored_html(site_dir)[:60]:
        try:
            with open(path, "rb") as fh:
                blob = fh.read(200_000)
        except OSError:
            continue
        http_n += blob.count(f"http://{host}".encode())
        https_n += blob.count(f"https://{host}".encode())
    return "https" if https_n > http_n else "http"


def internal_link_coverage(site_dir, host=None, scheme=None):
    """Same-domain URLs referenced by mirrored pages vs what is on disk.

    Returns dict with 'referenced', 'present', 'missing' (url -> [citing pages]).
    """
    site_dir = os.path.abspath(site_dir.rstrip("/"))
    dirname = os.path.basename(site_dir)
    domain = site_domain(site_dir)
    host = host or dirname  # the hostname the crawl actually used
    scheme = scheme or detect_scheme(site_dir, host)

    referenced = collections.defaultdict(list)
    pages = mirrored_html(site_dir)

    for rel, path in pages:
        try:
            with open(path, "rb") as fh:
                raw = fh.read()
        except OSError:
            continue
        # Mirrored pages are largely cp1252; decode tolerantly like the engine does.
        text = None
        for enc in ("utf-8", "cp1252", "latin-1"):
            try:
                text = raw.decode(enc)
                break
            except UnicodeDecodeError:
                continue
        if text is None:
            text = raw.decode("utf-8", errors="replace")

        base = f"{scheme}://{host}/{rel.replace(os.sep, '/')}"
        try:
            links = mirror.extract_links(text, base)
        except Exception:
            continue
        for url in links:
            url = urllib.parse.urldefrag(url)[0]
            if mirror.should_skip_url(url, domain):
                continue
            ext = os.path.splitext(urllib.parse.urlparse(url).path.lower())[1]
            if ext in SKIPPED_EXT:
                continue
            referenced[url].append(rel)

    present, missing = {}, {}
    for url, citers in referenced.items():
        local = os.path.join(site_dir, mirror.sanitize_path(url))
        if os.path.exists(local) and os.path.getsize(local) > 0:
            present[url] = citers
        else:
            missing[url] = sorted(set(citers))

    # Split the gap by cause. Only 'gap' is a mirror deficiency; 'malformed' is
    # the source site's own broken markup and 'dynamic' has no static byte.
    buckets = {"gap": {}, "malformed": {}, "dynamic": {}}
    for url, citers in missing.items():
        buckets[classify_missing(url)][url] = citers

    return {"scheme": scheme,
            "pages_scanned": len(pages),
            "referenced": len(referenced),
            "present": len(present),
            "missing": missing,
            "gap": buckets["gap"],
            "malformed": buckets["malformed"],
            "dynamic": buckets["dynamic"]}


def wayback_inventory(domain, limit=200000, timeout=180):
    """Every URL the Wayback Machine ever saw for this domain (deduped)."""
    q = ("https://web.archive.org/cdx/search/cdx"
         f"?url={urllib.parse.quote(domain)}/*&output=text&fl=original"
         f"&collapse=urlkey&filter=statuscode:200&limit={limit}")
    req = urllib.request.Request(q, headers={"User-Agent": "merlib-mirror/coverage"})
    with urllib.request.urlopen(req, timeout=timeout) as r:
        body = r.read().decode("utf-8", errors="replace")
    return sorted({ln.strip() for ln in body.splitlines() if ln.strip()})


def live_probe(urls, timeout=15):
    """HEAD each URL; return {url: status-or-error}. Recoverable vs dead."""
    out = {}
    for url in urls:
        req = urllib.request.Request(url, method="HEAD",
                                     headers={"User-Agent": "merlib-mirror/coverage"})
        try:
            with urllib.request.urlopen(req, timeout=timeout) as r:
                out[url] = r.status
        except urllib.error.HTTPError as e:
            out[url] = e.code
        except Exception as e:
            out[url] = type(e).__name__
    return out


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("site_dir")
    ap.add_argument("--host", default=None,
                    help="hostname the crawl used (default: the sites/ dir name)")
    ap.add_argument("--scheme", default=None, choices=["http", "https"],
                    help="base scheme (default: auto-detect; see detect_scheme)")
    ap.add_argument("--wayback", action="store_true", help="also fetch the CDX inventory")
    ap.add_argument("--live", type=int, default=0, metavar="N",
                    help="HEAD-probe N missing URLs to split recoverable from dead")
    ap.add_argument("--json", default=None, metavar="PATH", help="write full report")
    ap.add_argument("--top", type=int, default=25, help="how many missing URLs to print")
    a = ap.parse_args()

    site_dir = os.path.abspath(a.site_dir.rstrip("/"))
    domain = site_domain(site_dir)
    cov = internal_link_coverage(site_dir, host=a.host, scheme=a.scheme)
    missing, gap = cov["missing"], cov["gap"]

    # Denominator excludes what can never be mirrored: the source site's own
    # broken hrefs and its server-side endpoints. Counting those as misses would
    # understate coverage and send a re-crawl chasing addresses that never existed.
    mirrorable = cov["referenced"] - len(cov["malformed"]) - len(cov["dynamic"])

    print(f"== internal-link coverage: {domain} ==")
    print(f"  base scheme              {cov['scheme']:>7}"
          f"   {'(HTTP-ONLY host)' if cov['scheme'] == 'http' else ''}")
    print(f"  pages scanned            {cov['pages_scanned']:>7,}")
    print(f"  same-domain URLs cited   {cov['referenced']:>7,}")
    print(f"    - malformed (broken source markup) {len(cov['malformed']):>7,}")
    print(f"    - dynamic (.cgi / query strings)   {len(cov['dynamic']):>7,}")
    print(f"  mirrorable URLs cited    {mirrorable:>7,}")
    print(f"  present on disk          {cov['present']:>7,}")
    print(f"  REAL GAP                 {len(gap):>7,}")
    if mirrorable:
        print(f"  coverage                 {100.0 * cov['present'] / mirrorable:>6.1f}%"
              "   <- of mirrorable URLs")
    if cov["referenced"]:
        print(f"  (raw, incl. unmirrorable {100.0 * cov['present'] / cov['referenced']:>6.1f}%)")

    # Group the real gap by extension — tells you WHAT is missing, not just how much.
    if gap:
        by_ext = collections.Counter(
            os.path.splitext(urllib.parse.urlparse(u).path.lower())[1] or "(no ext / dir)"
            for u in gap)
        print("\n  real gap by extension:")
        for ext, n in by_ext.most_common(12):
            print(f"    {ext:<16} {n:>6,}")

        print(f"\n  first {min(a.top, len(gap))} genuinely-missing URLs (with a citing page):")
        for url in sorted(gap)[:a.top]:
            print(f"    {url}\n        cited by: {gap[url][0]}")

    report = {"domain": domain,
              "coverage": {k: v for k, v in cov.items()
                           if k not in ("missing", "gap", "malformed", "dynamic")},
              "mirrorable": mirrorable,
              "gap": {u: c for u, c in sorted(gap.items())},
              "malformed": sorted(cov["malformed"]),
              "dynamic": sorted(cov["dynamic"])}

    if a.live and gap:
        sample = sorted(gap)[:a.live]
        print(f"\n== live probe of {len(sample)} missing URL(s) ==")
        res = live_probe(sample)
        buckets = collections.Counter(
            "recoverable (2xx)" if isinstance(v, int) and 200 <= v < 300
            else f"dead ({v})" if isinstance(v, int)
            else f"error ({v})" for v in res.values())
        for k, n in buckets.most_common():
            print(f"    {k:<24} {n:>5}")
        recoverable = [u for u, v in res.items() if isinstance(v, int) and 200 <= v < 300]
        if recoverable:
            print(f"\n  {len(recoverable)} of {len(sample)} sampled are LIVE — a re-crawl "
                  f"would recover them. Example:\n    {recoverable[0]}")
        report["live_probe"] = res

    if a.wayback:
        print(f"\n== wayback CDX inventory: {domain} ==")
        try:
            inv = wayback_inventory(domain)
            # CDX collapses by urlkey, which INCLUDES the host — so a site served
            # at both amasci.com and www.amasci.com yields two entries per file and
            # a raw count is ~2x inflated. sanitize_path is host-independent, so
            # dedupe on the resolved local path to count distinct FILES.
            present_paths, missing_paths = set(), {}
            for url in inv:
                lp = mirror.sanitize_path(url)
                local = os.path.join(site_dir, lp)
                if os.path.exists(local) and os.path.getsize(local) > 0:
                    present_paths.add(lp)
                elif lp not in missing_paths:
                    missing_paths[lp] = url
            static = {lp: u for lp, u in missing_paths.items()
                      if classify_missing(u) == "gap"}
            distinct = len(present_paths) + len(missing_paths)
            print(f"  CDX rows (host-dup)      {len(inv):>7,}")
            print(f"  distinct file paths      {distinct:>7,}")
            print(f"  present on disk          {len(present_paths):>7,}")
            print(f"  absent                   {len(missing_paths):>7,}")
            print(f"    of which STATIC (mirrorable) {len(static):>7,}")
            print(f"    of which dynamic/malformed   "
                  f"{len(missing_paths) - len(static):>7,}")
            if distinct:
                mirrorable_wb = len(present_paths) + len(static)
                print(f"  coverage vs Wayback      "
                      f"{100.0 * len(present_paths) / mirrorable_wb:>6.1f}%"
                      "   <- of static paths Wayback ever saw")
            by_ext = collections.Counter(
                os.path.splitext(p.lower())[1] or "(no ext)" for p in static)
            print("\n  static paths Wayback has that we do NOT, by extension:")
            for ext, n in by_ext.most_common(12):
                print(f"    {ext:<16} {n:>6,}")
            report["wayback"] = {"cdx_rows": len(inv), "distinct_paths": distinct,
                                 "on_disk": len(present_paths),
                                 "absent": len(missing_paths),
                                 "absent_static": len(static),
                                 "static_urls": sorted(static.values())[:8000]}
        except Exception as e:
            print(f"  CDX fetch failed: {type(e).__name__}: {e}")

    if a.json:
        with open(a.json, "w") as fh:
            json.dump(report, fh, indent=2)
        print(f"\nwrote {a.json}")

    # Keyed on the REAL gap: a repo full of the source site's own broken hrefs
    # must not make this fail forever, or nobody will ever act on a true miss.
    return 1 if gap else 0


if __name__ == "__main__":
    sys.exit(main())
