#!/usr/bin/env python3
"""KeelyNet-style: email each page to cloudcity-llm@agentmail.to, reply lands in your inbox.

FEATURE-CARD >> features/mirror-coverage.feature

THE LOOP (this is the thing, not a substitute for it):

    cloudcity-foundationmodels@agentmail.to      (sender — an approved address in
      │                                           fa-spaces-allowlist.json)
      ├── To:  cloudcity-llm@agentmail.to        → freellmask-mail picks it up
      └── Cc:  esaruoho@gmail.com                → you see the ORIGINAL page
                    │
                    ▼
            freellmask-mail answers, and its FREELLMASK_MAIL_BCC defaults to
            esaruoho@gmail.com
                    │
                    ▼
            → you see the RESPONSE, threaded against the original

So both halves land in one thread with no extra plumbing.

THE VOICES NEED THE SPACE TAG — this was wrong in an earlier version of this file
and it is the whole point of the exercise. FREE_ENERGY_LENS_VOICES=1 is necessary
but NOT sufficient: the four voices (Walter Russell, Tom Bearden, Ilya Prigogine,
Hilarion) come from the `free-energy` SpaceCard's "personas":True,"headings":True,
and freellmask's router says outright "NEVER silently defaults to free-energy — it
only wins when routed". Untagged mail takes the off-corpus branch: a plain answer,
no tones.

Proven, not assumed: the first attachment-format reply came back a clean
6,221-char analysis with ZERO voices and no "## Thought about it" heading. Every
message therefore carries `[space:free-energy]` (see --space).

Sender note: convey's _agentmail_send normally sends FROM cloudcity-llm itself,
which would be self-mail. CONVEY_DIGEST_INBOX overrides the sending inbox, so this
reuses convey's sender rather than adding a second mail path to keep working.

Paced and resumable. A ledger records every sent page, so re-running continues
instead of re-mailing — mailing the same page twice costs an LLM answer and clutters
the thread, and freellmask has a recorded storm failure worth not re-enacting.

Usage:
  scripts/email_corpus_to_llm.py sites/amasci.com --limit 3      # try it
  scripts/email_corpus_to_llm.py sites/amasci.com --every 180
  scripts/email_corpus_to_llm.py sites/amasci.com --dry-run
"""

import argparse
import base64
import json
import os
import re
import sys
import time
from datetime import datetime, timezone

sys.path.insert(0, os.path.expanduser("~/work/convey"))

LLM_TO = "cloudcity-llm@agentmail.to"
SENDER_INBOX = "cloudcity-foundationmodels@agentmail.to"
DEFAULT_CC = "esaruoho@gmail.com"
# freellmask escalates big context to a 1M-window model, but an email is still an
# email; keep the body sane and say so in-message when it is clipped.
MAX_BODY = 90_000


def load_pages(site_dir, want_all):
    man = os.path.join(site_dir, "_paper", "_manifest.json")
    if not os.path.exists(man):
        sys.exit(f"no manifest at {man} — run scripts/site_to_paper.py first")
    pages = json.load(open(man)).get("pages", [])
    return pages if want_all else [p for p in pages if p.get("reachable_from_entry")]


_TAG = re.compile(r"<[^>]+>")
_MDLINK = re.compile(r"\[([^\]]*)\]\([^)]*\)")


def extract_prose(md):
    """Turn a per-page markdown file into the TEXT a reader would actually read.

    site_to_paper runs pandoc html→gfm, and pandoc keeps tables as LITERAL HTML.
    On a 1990s site built out of nav tables that means the "markdown" page is
    <table>/<colgroup>/<td><a href> scaffolding with the writing buried in it.
    Measured over amasci's 685 entry-reachable pages: median prose ratio 12%,
    and 304 pages (44%) are under 10% — i.e. pure navigation. sitemap.html is
    177 links and ZERO prose.

    Mailing that to an analyst is asking it to summarise a menu bar. So:
      • drop the YAML frontmatter and the "*Source page:*" line
      • strip HTML tags outright (nav tables become nothing)
      • unwrap [text](url) to just text — a link's words are content, its URL is not
      • keep only lines that read like sentences (long enough, enough spaces),
        which is what removes link lists, button rows and table cells

    Returns (prose_text, prose_chars, total_chars).
    """
    body = md.split("---", 2)[-1] if md.lstrip().startswith("---") else md
    kept = []
    for ln in body.splitlines():
        s = ln.strip()
        if not s or s.startswith(("|", "*Source page", ":::")):
            continue
        s = _MDLINK.sub(r"\1", s)          # link text survives, URL does not
        s = _TAG.sub(" ", s)               # nav tables evaporate
        s = re.sub(r"\s+", " ", s).strip()
        if s.startswith("#"):              # headings are real structure — keep
            kept.append(s)
            continue
        # a sentence-ish line: long enough and with enough words to be prose
        if len(s) >= 60 and s.count(" ") >= 8:
            kept.append(s)
    text = "\n\n".join(kept).strip()
    return text, len(text), len(body)


def load_sent(ledger):
    if not os.path.exists(ledger):
        return set()
    out = set()
    for line in open(ledger, errors="replace"):
        line = line.strip()
        if not line:
            continue
        try:
            out.add(json.loads(line)["slug"])
        except Exception:
            pass
    return out


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("site_dir")
    ap.add_argument("--all", action="store_true", help="every page, not just entry-reachable")
    ap.add_argument("--limit", type=int, default=None)
    ap.add_argument("--every", type=float, default=180.0,
                    help="seconds between sends (default 180). Each mail costs freellmask one "
                         "LLM answer; pacing keeps replies flowing instead of queueing a wall.")
    ap.add_argument("--space", default="free-energy",
                    help="freellmask space to route to (default free-energy). This is what "
                         "turns the voices on — personas+headings are a per-space property, "
                         "never a global default.")
    ap.add_argument("--min-prose", type=int, default=1000,
                    help="skip pages with fewer than N chars of actual prose (default 1000). "
                         "44%% of amasci's pages are nav tables; analysing a menu is worse than "
                         "useless because the answer looks real.")
    ap.add_argument("--cc", default=DEFAULT_CC)
    ap.add_argument("--ledger", default=None)
    ap.add_argument("--dry-run", action="store_true")
    a = ap.parse_args()

    site = os.path.abspath(a.site_dir.rstrip("/"))
    domain = os.path.basename(site)
    pages_dir = os.path.join(site, "_paper", "pages")
    ledger = a.ledger or os.path.join(site, "_paper", "emailed-to-llm.jsonl")

    pages = load_pages(site, a.all)
    sent = load_sent(ledger)
    todo = [p for p in pages if p["slug"] not in sent]
    if a.limit:
        todo = todo[:a.limit]

    print(f"== email {domain} pages → {LLM_TO} ==")
    print(f"  from            {SENDER_INBOX}")
    print(f"  cc (original)   {a.cc}")
    print(f"  reply           freellmask BCCs {a.cc} — voices ON by default")
    print(f"  pages in scope  {len(pages):>6,}")
    print(f"  already sent    {len(sent):>6,}  (ledger: {os.path.basename(ledger)})")
    print(f"  to send         {len(todo):>6,}   one every {a.every:.0f}s"
          f"  ≈ {len(todo)*a.every/3600:.1f}h", flush=True)

    if a.dry_run:
        for p in todo[:10]:
            print(f"    would email  {p['slug']}  — {p.get('title','')[:50]}")
        print("\ndry run — nothing sent")
        return 0
    if not todo:
        print("\nnothing to send — every page in scope is already in the ledger")
        return 0

    os.environ["CONVEY_DIGEST_INBOX"] = SENDER_INBOX      # send FROM, not self-mail
    from convey.cli import _agentmail_send

    ok = fail = skipped = 0
    started = time.time()
    for i, p in enumerate(todo, 1):
        slug, title = p["slug"], (p.get("title") or p["slug"])
        src = os.path.join(pages_dir, f"{slug}.md")
        if not os.path.exists(src):
            print(f"  [{i}/{len(todo)}] MISSING {slug}.md", flush=True)
            fail += 1
            continue
        raw = open(src, errors="replace").read()
        body, prose_chars, total_chars = extract_prose(raw)

        # ── refuse to mail a navigation menu ──────────────────────────────────
        # 44% of amasci's entry-reachable pages are under 10% prose. Asking an
        # analyst to read a nav table wastes an LLM answer, clutters the thread,
        # and — worst — produces a confident-looking summary of nothing, which is
        # indistinguishable from real output until you read it.
        if prose_chars < a.min_prose:
            with open(ledger, "a") as fh:
                fh.write(json.dumps({
                    "slug": slug, "title": title, "order": p.get("order"),
                    "sent": False, "skipped": "no-prose",
                    "prose_chars": prose_chars, "total_chars": total_chars,
                    "at": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
                }) + "\n")
            skipped += 1
            print(f"  [{i}/{len(todo)}] SKIP  {title[:50]} — only {prose_chars} prose "
                  f"chars of {total_chars} (nav/menu)", flush=True)
            continue

        # ── send the page as an ATTACHED text FILE, not inlined HTML ──────────
        # The first version wrapped the whole page in <pre> and shipped it as the
        # HTML body. That is wrong twice over: freellmask then reads markup noise
        # instead of a document (it answered "unable to generate a reliable
        # answer… unusable response on every attempt"), and the human CC gets an
        # unreadable wall instead of the source file.
        #
        # freellmask reads text/markdown attachments DIRECTLY (see its
        # _attachment_text: markdown read as-is, PDFs/images via on-Mini Vision
        # OCR), caps each at FREELLMASK_MAIL_MAX_ATT_CHARS=12,000 for free-tier
        # context, and escalates to the big-context model past BIG_ATT_CAP. So an
        # attachment is the format it actually wants.
        #
        # The body is now a short human-readable instruction — nothing else — so
        # the mail is legible to Esa and unambiguous to the model.
        attachment = [{
            "filename": f"{slug}.txt",
            "content_type": "text/plain",
            "content": base64.b64encode(body.encode("utf-8")).decode("ascii"),
        }]

        # ── ROUTE TO THE SPACE, or there are no voices ────────────────────────
        # The four-voice layer (Walter Russell, Tom Bearden, Ilya Prigogine,
        # Hilarion) is NOT a global default. In freellmask-mail the `free-energy`
        # space is declared with "personas":True,"headings":True, and the router
        # comments say plainly: "NEVER silently defaults to free-energy — it only
        # wins when routed." Untagged mail falls to the off-corpus branch, which
        # is a plain answer with no tones.
        #
        # Verified the hard way: the first attachment-format reply came back as a
        # clean 6,221-char analysis with ZERO voices and no "## Thought about it"
        # heading — correct prose, wrong shape. The tag below is what turns the
        # analysis into the KeelyNet-style voiced reading.
        #
        # Router accepts [space:X] / x-space: X / space=X anywhere in the text.
        space_tag = f"[space:{a.space}]"

        subject = f"[{domain}] {title[:90]}"
        text = (f"{space_tag}\n\n"
                f"Please analyse the attached page from the {domain} mirror.\n\n"
                f"  file    {slug}.txt\n"
                f"  source  {domain}/{p.get('path','')}\n"
                f"  page    {p.get('order','?')} of {len(pages)}"
                f"{' (reachable from the entry page)' if p.get('reachable_from_entry') else ''}\n"
                f"  prose   {prose_chars:,} chars (from {total_chars:,} raw)\n")
        html = (f"<p>{space_tag}</p>"
                "<p>Please analyse the attached page from the <b>" + domain + "</b> mirror.</p>"
                f"<ul><li>file <code>{slug}.txt</code></li>"
                f"<li>source <code>{domain}/{p.get('path','')}</code></li>"
                f"<li>page {p.get('order','?')} of {len(pages)}</li>"
                f"<li>{prose_chars:,} prose chars</li></ul>")
        clipped = False   # nothing is clipped by us now; freellmask applies its own caps

        good = _agentmail_send(subject, text, html, LLM_TO,
                               attachments=attachment, cc=[a.cc])
        with open(ledger, "a") as fh:
            fh.write(json.dumps({
                "slug": slug, "title": title, "order": p.get("order"),
                "sent": good, "clipped": clipped,
                "at": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
            }) + "\n")
        ok, fail = (ok + 1, fail) if good else (ok, fail + 1)
        el = time.time() - started
        eta = (len(todo) - i) * a.every / 3600
        print(f"  [{i}/{len(todo)}] {'SENT' if good else 'FAIL'} {title[:56]} "
              f"| ok={ok} fail={fail} | ETA {eta:.1f}h", flush=True)
        if i < len(todo):
            time.sleep(a.every)

    print(f"\n== done: sent={ok} skipped={skipped} failed={fail} ==")
    print(f"Replies arrive in {a.cc}, threaded, with the voices layer applied.")
    return 0 if fail == 0 else 1


if __name__ == "__main__":
    sys.exit(main())
