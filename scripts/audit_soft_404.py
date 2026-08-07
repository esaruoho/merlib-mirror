#!/usr/bin/env python3
"""Find pages that are NOT content: soft-404s, stubs, and mass-duplicated bodies.

FEATURE-CARD >> features/mirror-coverage.feature

A mirror's page count is not a content count. Three ways a file lands in a mirror
while carrying nothing worth analysing:

  soft-404   The server answered 200 with an error page. Wayback's CDX
             `filter=statuscode:200` cannot see this — the status was 200 — so
             these arrive in a backfill looking exactly like real pages.
  stub       A real page with almost nothing in it. Some are legitimate pointers
             (amasci's exhibits/vort.html is 80 bytes of "Look <a>here</a>" and is
             genuinely Beatty's), so size alone must not condemn a page.
  duplicate  One body served under many URLs — a parked page, a redirect shell, a
             directory-listing template. N copies of one thing, counted as N pages.

This matters because the next step is a page-per-page pass over ~10,000 files. Each
junk page costs a full analysis cycle and returns noise, and a corpus that is 15%
error pages will quietly skew any aggregate drawn from it.

Reports only — deletes nothing. The judgement of what to exclude belongs to whoever
runs the analysis, so this writes a list and leaves the mirror untouched.

Usage:
    python3 scripts/audit_soft_404.py sites/<domain>
    python3 scripts/audit_soft_404.py sites/<domain> --json suspect.json
    python3 scripts/audit_soft_404.py sites/<domain> --min-chars 200
"""

import argparse
import collections
import hashlib
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

HTML_EXT = {".html", ".htm", ".shtml", ".xhtml"}

# Phrases that mean "this is an error page", checked against the visible text of
# a page rather than its markup. Deliberately narrow: "not found" appears in real
# prose, so it only counts when the page is also short.
ERROR_PHRASES = (
    "404 not found", "page not found", "file not found", "not found on this server",
    "the requested url", "object not found", "403 forbidden", "access denied",
    "no longer available", "has been moved", "account suspended",
    "under construction", "coming soon", "index of /",
    "got an error", "database error", "internal server error",
)

# Wayback's own failure pages, which a backfill can capture as if they were content.
WAYBACK_ERROR_PHRASES = (
    "wayback machine has not archived",
    "this url has been excluded",
    "hrm. the wayback machine has not archived",
    "the wayback machine is an initiative",
    "robots.txt query exclusion",
)

_TAG = re.compile(r"<[^>]+>")
_WS = re.compile(r"\s+")


def visible_text(raw):
    """Crude but adequate: strip script/style, strip tags, collapse whitespace."""
    t = re.sub(r"(?is)<(script|style)\b.*?</\1>", " ", raw)
    t = _TAG.sub(" ", t)
    t = (t.replace("&nbsp;", " ").replace("&amp;", "&")
          .replace("&lt;", "<").replace("&gt;", ">").replace("&quot;", '"'))
    return _WS.sub(" ", t).strip()


def read_text(path):
    raw = open(path, "rb").read()
    for enc in ("utf-8", "cp1252", "latin-1"):
        try:
            return raw.decode(enc)
        except UnicodeDecodeError:
            continue
    return raw.decode("utf-8", errors="replace")


def classify(text, nchars, min_chars):
    """Return a reason string, or None if the page looks like real content."""
    low = text.lower()
    for p in WAYBACK_ERROR_PHRASES:
        if p in low:
            return "wayback-error-page"
    # An error phrase in a SHORT page is an error page. In a long page it is prose.
    if nchars < 1200:
        for p in ERROR_PHRASES:
            if p in low:
                return f"soft-404 ({p!r})"
    if nchars == 0:
        return "empty"
    if nchars < min_chars:
        return f"stub (<{min_chars} chars)"
    return None


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("site_dir")
    ap.add_argument("--min-chars", type=int, default=120,
                    help="below this many visible chars a page is a stub (default 120)")
    ap.add_argument("--dup-threshold", type=int, default=5,
                    help="a body repeated at least this many times is mass-duplicated")
    ap.add_argument("--json", default=None, metavar="PATH")
    ap.add_argument("--top", type=int, default=12)
    a = ap.parse_args()

    site = os.path.abspath(a.site_dir.rstrip("/"))
    pages = []
    for root, dirs, files in os.walk(site):
        dirs[:] = [d for d in dirs if d not in ("_paper", "_pdfs") and not d.startswith(".")]
        for f in files:
            if f.startswith("_"):
                continue
            if os.path.splitext(f)[1].lower() in HTML_EXT:
                pages.append(os.path.relpath(os.path.join(root, f), site))
    pages.sort()

    suspect = {}
    by_hash = collections.defaultdict(list)
    total_chars = 0

    for rel in pages:
        try:
            text = visible_text(read_text(os.path.join(site, rel)))
        except OSError:
            continue
        n = len(text)
        total_chars += n
        reason = classify(text, n, a.min_chars)
        if reason:
            suspect[rel] = reason
        if n:
            by_hash[hashlib.sha1(text.encode("utf-8", "replace")).hexdigest()].append(rel)

    # Mass-duplicated bodies: one page's worth of content wearing N filenames.
    dup_groups = {h: v for h, v in by_hash.items() if len(v) >= a.dup_threshold}
    dup_pages = sum(len(v) for v in dup_groups.values())
    for h, v in dup_groups.items():
        for rel in v[1:]:            # keep one representative, flag the copies
            suspect.setdefault(rel, f"duplicate-body (x{len(v)})")

    print(f"== content audit: {os.path.basename(site)} ==")
    print(f"  HTML pages scanned        {len(pages):>7,}")
    print(f"  visible text total        {total_chars:>7,} chars")
    print(f"  SUSPECT (not content)     {len(suspect):>7,}"
          f"   = {100.0 * len(suspect) / max(1, len(pages)):.1f}%")
    print(f"  analysable pages          {len(pages) - len(suspect):>7,}")

    kinds = collections.Counter(r.split(" (")[0] for r in suspect.values())
    print("\n  by reason:")
    for k, v in kinds.most_common():
        print(f"    {k:<26} {v:>6,}")

    if dup_groups:
        print(f"\n  mass-duplicated bodies: {len(dup_groups)} distinct body(ies) "
              f"across {dup_pages:,} files")
        for h, v in sorted(dup_groups.items(), key=lambda kv: -len(kv[1]))[:5]:
            print(f"    x{len(v):<5} e.g. {v[0]}")

    if suspect:
        print(f"\n  first {min(a.top, len(suspect))} suspect pages:")
        for rel in sorted(suspect)[:a.top]:
            print(f"    {suspect[rel]:<28} {rel}")

    if a.json:
        with open(a.json, "w") as fh:
            json.dump({"site": os.path.basename(site),
                       "pages_scanned": len(pages),
                       "suspect_count": len(suspect),
                       "analysable": len(pages) - len(suspect),
                       "suspect": dict(sorted(suspect.items()))}, fh, indent=2)
        print(f"\nwrote {a.json}")

    print("\nNothing was deleted. Exclude these from a per-page analysis rather "
          "than from the mirror — a soft-404 is still part of what the site served.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
