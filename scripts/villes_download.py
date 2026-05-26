#!/usr/bin/env python3
"""Targeted wayback download for villesresearch.com (all 77 URLs)."""
import json, os, sys, urllib.request, urllib.parse
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import mirror

CDX = "https://web.archive.org/cdx/search/cdx?url=villesresearch.com/*&output=json&fl=timestamp,original,mimetype,statuscode&filter=statuscode:200&collapse=urlkey"
REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(REPO, "sites", "villesresearch.com")

def main():
    os.makedirs(OUT, exist_ok=True)
    with urllib.request.urlopen(CDX, timeout=60) as r:
        data = json.loads(r.read())
    rows = data[1:]
    print(f"CDX returned {len(rows)} URLs", flush=True)

    # collapse www / non-www duplicates — keep latest timestamp per (host-stripped path)
    by_key = {}
    for ts, orig, mime, code in rows:
        p = urllib.parse.urlparse(orig)
        key = (p.path, p.query)
        # strip fbclid junk
        if "fbclid=" in (p.query or ""):
            continue
        if key not in by_key or ts > by_key[key][0]:
            by_key[key] = (ts, orig, mime, code)

    merged = list(by_key.values())
    print(f"After dedup: {len(merged)} URLs", flush=True)

    ok = fail = 0
    failures = []
    for ts, orig, mime, code in merged:
        success, size, ts_used = mirror.download_wayback_url(orig, ts, "villesresearch.com", OUT, delay=1.0)
        if success:
            ok += 1
            print(f"  OK   [{size:>9}] {orig}  (ts={ts_used})", flush=True)
        else:
            fail += 1
            failures.append((ts, orig))
            print(f"  FAIL              {orig}", flush=True)

    if failures:
        print("\nRetrying failures with alternate timestamps...", flush=True)
        for ts, orig in failures[:]:
            # look up all snapshots for this URL
            try:
                q = f"https://web.archive.org/cdx/search/cdx?url={urllib.parse.quote(orig, safe='')}&output=json&fl=timestamp,statuscode&filter=statuscode:200"
                with urllib.request.urlopen(q, timeout=30) as r:
                    snaps = json.loads(r.read())[1:]
            except Exception as e:
                print(f"  CDX lookup failed for {orig}: {e}")
                continue
            for alt_ts, _ in snaps:
                if alt_ts[:8] == ts[:8]:
                    continue
                success, size, ts_used = mirror.download_wayback_url(orig, alt_ts, "villesresearch.com", OUT, delay=1.0)
                if success:
                    ok += 1
                    fail -= 1
                    failures.remove((ts, orig))
                    print(f"  RETRY OK [{size:>9}] {orig}  (ts={ts_used})", flush=True)
                    break

    print(f"\nDone: {ok} ok, {fail} failed")
    if failures:
        print("Final failures:")
        for ts, orig in failures:
            print(f"  {orig}")

if __name__ == "__main__":
    main()
