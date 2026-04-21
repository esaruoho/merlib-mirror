#!/usr/bin/env python3
"""Targeted wayback download for infohost.nmt.edu/~pharis/."""
import json, os, sys, urllib.request, urllib.parse
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import mirror

CDX = "https://web.archive.org/cdx/search/cdx?url=infohost.nmt.edu/~pharis/*&output=json&fl=timestamp,original,mimetype,statuscode&filter=statuscode:200&collapse=urlkey"
REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(REPO, "sites", "infohost.nmt.edu")

def main():
    os.makedirs(OUT, exist_ok=True)
    with urllib.request.urlopen(CDX, timeout=60) as r:
        data = json.loads(r.read())
    rows = data[1:]
    print(f"CDX returned {len(rows)} URLs", flush=True)
    ok = fail = skip = 0
    for ts, orig, mime, code in rows:
        parsed = urllib.parse.urlparse(orig)
        if parsed.query.startswith("C="):
            skip += 1
            continue
        if orig.endswith("/"):
            # fetch as index.html
            pass
        success, size, ts_used = mirror.download_wayback_url(orig, ts, "infohost.nmt.edu", OUT, delay=1.0)
        if success:
            ok += 1
            print(f"  OK   [{size:>9}] {orig}  (ts={ts_used})", flush=True)
        else:
            fail += 1
            print(f"  FAIL              {orig}", flush=True)
    print(f"\nDone: {ok} ok, {fail} failed, {skip} skipped")

if __name__ == "__main__":
    main()
