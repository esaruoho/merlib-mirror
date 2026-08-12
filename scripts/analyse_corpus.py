#!/usr/bin/env python3
"""Run `convey soft` over a mirror's pages — resumable, batched, digest-emailed.

FEATURE-CARD >> features/mirror-coverage.feature

`convey soft` gives one file two machine legs (fm-mlx :8080 + freellmapi :3001 on
the Mini) and writes `<stem>.{fm-mlx,freellmapi}.analysis.md` beside it. This drives
it across a whole corpus without the two things that would go wrong at scale:

  a mail storm — the KeelyNet precedent this duplicates was FIVE analyses. amasci
                 has ~9,290 analysable pages. One email per page through
                 cloudcity-llm@agentmail.to is a storm, and freellmask has a
                 recorded storm failure. So: one DIGEST per batch, not per page.
  a lost run   — two LLM calls per page over hundreds of pages is many hours. Any
                 interruption must cost one page, not the run. A page with both
                 legs already on disk is skipped, so re-running resumes.

Default scope is the pages reachable from the entry page — the author's actual
site, not 25 years of historical snapshots and other people's hosted homepages.
`--all` takes everything.

Usage:
  scripts/analyse_corpus.py sites/amasci.com
  scripts/analyse_corpus.py sites/amasci.com --batch 25 --email esa@example.com
  scripts/analyse_corpus.py sites/amasci.com --limit 25        # pilot
  scripts/analyse_corpus.py sites/amasci.com --dry-run
"""

import argparse
import concurrent.futures
import json
import os
import subprocess
import sys
import threading
import time
from datetime import datetime, timezone

CONVEY = os.path.expanduser("~/work/apple/bin/convey")
LEGS = ("fm-mlx", "freellmapi")


def load_pages(site_dir, want_all):
    """Pages to analyse, in the site's own reading order."""
    man = os.path.join(site_dir, "_paper", "_manifest.json")
    if not os.path.exists(man):
        sys.exit(f"no manifest at {man} — run scripts/site_to_paper.py first")
    m = json.load(open(man))
    pages = m.get("pages", [])
    if not want_all:
        pages = [p for p in pages if p.get("reachable_from_entry")]
    return pages


def leg_paths(pages_dir, slug):
    return [os.path.join(pages_dir, f"{slug}.{leg}.analysis.md") for leg in LEGS]


def done_already(pages_dir, slug):
    """Both legs present and non-empty. Partial work is redone, not trusted."""
    return all(os.path.exists(p) and os.path.getsize(p) > 0
               for p in leg_paths(pages_dir, slug))


def send_digest(to_addr, subject, body):
    """One digest per batch, through convey's OWN AgentMail transport.

    Deliberately not `mail(1)`: it exists on macOS but is usually not configured
    for real delivery, so a digest would silently vanish. convey._agentmail_send is
    the path `convey soft --email` and the rest of the fleet already use — reusing
    it means one mail channel to keep working, not two.

    Failure is logged and never fatal: an unsent digest must not lose analyses that
    are already safely on disk.
    """
    snippet = (
        "import sys; sys.path.insert(0, %r)\n"
        "from convey.cli import _agentmail_send\n"
        "subject, to = sys.argv[1], sys.argv[2]\n"
        "body = sys.stdin.read()\n"
        "html = '<pre>' + body.replace('&','&amp;').replace('<','&lt;') + '</pre>'\n"
        "print('SENT' if _agentmail_send(subject, body, html, to) else 'FAILED')\n"
    ) % os.path.expanduser("~/work/convey")
    try:
        p = subprocess.run([sys.executable, "-c", snippet, subject, to_addr],
                           input=body.encode("utf-8"),
                           capture_output=True, timeout=180)
        return b"SENT" in p.stdout
    except Exception:
        return False


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("site_dir")
    ap.add_argument("--all", action="store_true",
                    help="every page, not just those reachable from the entry page")
    ap.add_argument("--limit", type=int, default=None, help="stop after N pages (pilot)")
    ap.add_argument("--batch", type=int, default=25, help="digest every N pages (default 25)")
    ap.add_argument("--email", default=None, help="send per-batch digests here")
    ap.add_argument("--timeout", type=int, default=900, help="per-page seconds")
    ap.add_argument("--workers", type=int, default=4,
                    help="pages analysed concurrently (default 4). Sequential projects to "
                         "~368h for 684 pages; the legs queue, so this is the real lever. "
                         "Modest on purpose — shared brains on the Mini.")
    ap.add_argument("--delay", type=float, default=2.0, help="pause between pages")
    ap.add_argument("--dry-run", action="store_true")
    a = ap.parse_args()

    site = os.path.abspath(a.site_dir.rstrip("/"))
    pages_dir = os.path.join(site, "_paper", "pages")
    domain = os.path.basename(site)
    pages = load_pages(site, a.all)

    todo = [p for p in pages if not done_already(pages_dir, p["slug"])]
    skipped = len(pages) - len(todo)
    if a.limit:
        todo = todo[:a.limit]

    print(f"== analyse {domain} ==")
    print(f"  scope            {'ALL pages' if a.all else 'reachable from entry'}")
    print(f"  pages in scope   {len(pages):>6,}")
    print(f"  already analysed {skipped:>6,}  (both legs on disk — skipped)")
    print(f"  to analyse       {len(todo):>6,}")
    print(f"  digest every     {a.batch} page(s)"
          + (f" to {a.email}" if a.email else "  (no --email: files only)"))
    if a.dry_run:
        for p in todo[:15]:
            print(f"    would analyse  {p['slug']}")
        print(f"\ndry run — nothing executed")
        return 0
    if not todo:
        print("\nnothing to do — every page in scope already has both legs")
        return 0

    started = time.time()
    ok = fail = 0
    batch_lines = []
    lock = threading.Lock()
    done_n = 0

    # ── concurrency ──────────────────────────────────────────────────────────
    # Sequential was the wall, not the input size. Measured over the first 30
    # pages: median 2,295s per page (38 min), mean 1,938s, max 4,205s — while the
    # median page is only 11.8 KB and just 7% of pages reach the 60,000-char feed
    # cap. So the text volume is not the driver; the two LLM calls are, and the
    # free-tier 120B gateway queues. 684 pages sequentially projects to ~368 HOURS
    # (15 days).
    #
    # Each page is an independent pair of HTTP calls, so this parallelises cleanly.
    # Modest by default: these are shared brains on someone else's machine, and
    # over-driving archive.org earlier in this project produced 429s that were then
    # mis-recorded as missing data. Same discipline here.
    def run_one(idx, p):
        slug = p["slug"]
        src = os.path.join(pages_dir, f"{slug}.md")
        if not os.path.exists(src):
            return idx, p, False, 0.0, "missing source"
        t0 = time.time()
        try:
            r = subprocess.run([CONVEY, "soft", src, "--no-wiki"],
                               capture_output=True, timeout=a.timeout)
            good = r.returncode == 0 and done_already(pages_dir, slug)
            err = None if good else (r.stderr.decode("utf-8", "replace")[-160:] or "no legs written")
        except subprocess.TimeoutExpired:
            good, err = False, f"timeout >{a.timeout}s"
        return idx, p, good, time.time() - t0, err

    with concurrent.futures.ThreadPoolExecutor(max_workers=a.workers) as pool:
        futures = [pool.submit(run_one, i, p) for i, p in enumerate(todo, 1)]
        for fut in concurrent.futures.as_completed(futures):
            idx, p, good, dt, err = fut.result()
            slug = p["slug"]
            with lock:
                done_n += 1
                i = done_n
                if good:
                    ok += 1
                    batch_lines.append(f"  OK   {p.get('title','')[:60]}  ({dt:.0f}s)")
                else:
                    fail += 1
                    batch_lines.append(f"  FAIL {p.get('title','')[:60]}  ({dt:.0f}s)  {err or ''}")
                rate = i / max(time.time() - started, 1) * 3600
                eta_h = (len(todo) - i) / max(rate, 0.01)
                print(f"  [{i}/{len(todo)}] {'OK  ' if good else 'FAIL'} {slug[:52]} "
                      f"({dt:.0f}s) | ok={ok} fail={fail} | {rate:.0f}/h ETA {eta_h:.1f}h",
                      flush=True)

        if a.email and (i % a.batch == 0 or i == len(todo)):
            stamp = datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M UTC")
            body = (f"{domain} — soft analysis batch\n"
                    f"{stamp}\n\n"
                    f"progress {i}/{len(todo)}   ok={ok} fail={fail}\n"
                    f"rate {rate:.0f}/h   ETA {eta_h:.1f}h\n\n"
                    + "\n".join(batch_lines)
                    + f"\n\nAnalyses are written beside each page in\n{pages_dir}\n"
                    + "Two legs per page: .fm-mlx.analysis.md and .freellmapi.analysis.md\n"
                    + "Neither satisfies Needs-Analysis — the Claude-deep leg is still owed "
                      "(principle 0056).\n")
            sent = send_digest(a.email, f"[{domain}] soft analysis {i}/{len(todo)}", body)
            print(f"  -- digest {'sent' if sent else 'FAILED to send'} to {a.email} --",
                  flush=True)
            batch_lines = []


    el = (time.time() - started) / 3600
    print(f"\n== done: ok={ok} fail={fail} in {el:.1f}h ==")
    print(f"Analyses beside each page in {pages_dir}")
    print("Needs-Analysis stays OPEN for every page — these are the SOFT legs only.")
    return 0 if fail == 0 else 1


if __name__ == "__main__":
    sys.exit(main())
