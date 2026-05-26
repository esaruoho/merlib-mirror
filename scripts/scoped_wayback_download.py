#!/usr/bin/env python3
"""Scoped Wayback downloader.

Use when the built-in mirror.py wayback engine fails because:
- Domain-wide CDX query hits the 50000-URL cap and drops the subpath, or
- Initial CDX timestamp 404s and the fixed fallback list doesn't cover the URL.

Queries CDX directly against `domain[/subpath]/*`, dedups www/non-www, skips
fbclid-tagged variants, and retries per-URL failures by looking up all
snapshots of that URL via a second CDX call.

Usage:
    scoped_wayback_download.py <domain-or-prefix> [--label <out-dir>]

Examples:
    scoped_wayback_download.py infohost.nmt.edu/~pharis/ --label pharis
    scoped_wayback_download.py magnetricity.com --label magnetricity.com
"""
import argparse, json, os, sys, urllib.parse, urllib.request
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import mirror


def cdx(url_pattern):
    q = f"https://web.archive.org/cdx/search/cdx?url={urllib.parse.quote(url_pattern, safe='/*')}&output=json&fl=timestamp,original,mimetype,statuscode&filter=statuscode:200&collapse=urlkey"
    with urllib.request.urlopen(q, timeout=120) as r:
        return json.loads(r.read())[1:]


def cdx_snapshots(url):
    q = f"https://web.archive.org/cdx/search/cdx?url={urllib.parse.quote(url, safe='')}&output=json&fl=timestamp,statuscode&filter=statuscode:200"
    try:
        with urllib.request.urlopen(q, timeout=30) as r:
            return [row[0] for row in json.loads(r.read())[1:]]
    except Exception:
        return []


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("prefix", help="domain or domain/subpath/")
    ap.add_argument("--label", help="output dir under sites/ (default: first path segment of prefix)")
    ap.add_argument("--delay", type=float, default=1.0)
    args = ap.parse_args()

    prefix = args.prefix.strip()
    if prefix.endswith("/"):
        prefix = prefix[:-1]
    # domain = everything before first /
    domain = prefix.split("/", 1)[0]
    label = args.label or domain

    repo = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    out = os.path.join(repo, "sites", label)
    os.makedirs(out, exist_ok=True)

    pattern = f"{prefix}/*"
    print(f"CDX query: url={pattern}")
    rows = cdx(pattern)
    print(f"CDX returned {len(rows)} URLs", flush=True)

    # dedup by (path, query), keeping latest timestamp. drop fbclid variants.
    by_key = {}
    for ts, orig, mime, code in rows:
        p = urllib.parse.urlparse(orig)
        if "fbclid=" in (p.query or ""):
            continue
        key = (p.path, p.query)
        if key not in by_key or ts > by_key[key][0]:
            by_key[key] = (ts, orig, mime, code)
    merged = list(by_key.values())
    print(f"After dedup: {len(merged)} URLs", flush=True)

    ok = fail = 0
    failures = []
    for ts, orig, mime, code in merged:
        success, size, ts_used = mirror.download_wayback_url(orig, ts, domain, out, delay=args.delay)
        if success:
            ok += 1
            print(f"  OK   [{size:>9}] {orig}  (ts={ts_used})", flush=True)
        else:
            fail += 1
            failures.append((ts, orig))
            print(f"  FAIL              {orig}", flush=True)

    if failures:
        print(f"\nRetrying {len(failures)} failures with alternate timestamps...", flush=True)
        for ts, orig in failures[:]:
            snaps = cdx_snapshots(orig)
            tried = {ts[:8]}
            for alt_ts in snaps:
                if alt_ts[:8] in tried:
                    continue
                tried.add(alt_ts[:8])
                success, size, ts_used = mirror.download_wayback_url(orig, alt_ts, domain, out, delay=args.delay)
                if success:
                    ok += 1
                    fail -= 1
                    failures.remove((ts, orig))
                    print(f"  RETRY OK [{size:>9}] {orig}  (ts={ts_used})", flush=True)
                    break
            else:
                print(f"  RETRY FAIL    {orig}  (tried {len(tried)} timestamps)", flush=True)

    print(f"\nDone: {ok} ok, {fail} failed  → {out}")
    if failures:
        print("Final failures:")
        for ts, orig in failures:
            print(f"  {orig}")
        sys.exit(1)


if __name__ == "__main__":
    main()
