#!/usr/bin/env python3
"""
# FEATURE-CARD >> features/mirror-consolidation.feature
site_to_paper.py — mirror site -> ONE cohesive paper (+ per-page markdown).

The "KeelyNet system" (merlib-dump/scripts/convert_keelynet.py) turned ~994
scattered BBS .ASC files into per-file markdown with YAML frontmatter. This is
the same move for a mirrored WEBSITE, plus the step KeelyNet never had: the
per-page markdown is then STITCHED, in the site's own reading order, into a
single consolidated document so the corpus can be synthesised as one text
instead of read as N chaotic pages.

Reading order is derived from the site's own link graph (BFS from the entry
page, following in-document link order) — not alphabetical filenames, which
scramble the author's intended sequence. Pages the graph never reaches are
appended in a clearly-labelled trailing section so nothing is silently dropped.

Outputs, all under <site>/_paper/ :
  <domain>-CONSOLIDATED.md   the single paper: frontmatter + provenance + TOC + every page
  pages/<NNN>-<slug>.md      per-page markdown, KeelyNet-style YAML frontmatter
  _manifest.json             machine-readable: order, titles, links, coverage counts

Zero tokens. stdlib + pandoc (falls back to a built-in HTML stripper if pandoc
is absent). Idempotent — safe to re-run over an existing mirror.

Usage:
  site_to_paper.py <site-dir> [--title "..."] [--author "..."] [--quiet]
"""

import argparse
import html
import html.parser
import json
import os
import re
import shutil
import subprocess
import sys
import unicodedata
from datetime import datetime, timezone

HTML_EXT = {".htm", ".html", ".xhtml"}
# Mirror bookkeeping files that are not site content.
SKIP_NAMES = {"ALLFILES.txt", "SOURCE.txt", "index.txt"}
# GitHub hard-rejects blobs over 100 MB. Stay well under, and skip loudly rather
# than emit a file that makes the whole mirror unpushable.
MAX_CONSOLIDATED_MB = 60


# ── HTML parsing ────────────────────────────────────────────────────────────

class PageParser(html.parser.HTMLParser):
    """Pull <title>, in-document-order links, and image refs from one page."""

    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.title = ""
        self._in_title = False
        self.links = []          # hrefs, in document order, duplicates kept out
        self._seen = set()
        self.images = []
        self._text = []
        self._skip_depth = 0

    def handle_starttag(self, tag, attrs):
        a = dict(attrs)
        if tag == "title":
            self._in_title = True
        elif tag == "a":
            href = (a.get("href") or "").strip()
            if href and href not in self._seen:
                self._seen.add(href)
                self.links.append(href)
        elif tag in ("frame", "iframe"):
            # A framed-in page IS reachable — the reader sees it embedded in
            # the parent. Counting only <a> made mismatching_simulator.htm an
            # orphan even though balanced_lines.htm displays it inline.
            src = (a.get("src") or "").strip()
            if src and src not in self._seen:
                self._seen.add(src)
                self.links.append(src)
        elif tag == "img":
            src = (a.get("src") or "").strip()
            if src:
                self.images.append(src)
        elif tag in ("script", "style"):
            self._skip_depth += 1

    def handle_endtag(self, tag):
        if tag == "title":
            self._in_title = False
        elif tag in ("script", "style") and self._skip_depth:
            self._skip_depth -= 1

    def handle_data(self, data):
        if self._in_title:
            self.title += data
        elif not self._skip_depth:
            self._text.append(data)

    @property
    def text(self):
        return re.sub(r"\n{3,}", "\n\n", "\n".join(self._text))


def read_html(path):
    """Read a mirrored page tolerantly — these files are old and mis-encoded."""
    raw = open(path, "rb").read()
    for enc in ("utf-8", "cp1252", "latin-1"):
        try:
            return raw.decode(enc)
        except UnicodeDecodeError:
            continue
    return raw.decode("utf-8", errors="replace")


def parse_page(path):
    p = PageParser()
    try:
        p.feed(read_html(path))
    except Exception:
        pass
    return p


# ── html -> markdown ────────────────────────────────────────────────────────

_PANDOC = shutil.which("pandoc")


def to_markdown(path):
    """pandoc when available (keeps headings/tables/emphasis); else plain text."""
    if _PANDOC:
        try:
            # Feed pandoc DECODED text on stdin, never the raw path. pandoc assumes
            # UTF-8 input; these mirrors are largely cp1252, so byte-level reading
            # replaces every high byte with U+FFFD. That silently destroys ¼ ½ ¾ °
            # µ Ω — i.e. exactly the glyphs a radio-engineering corpus depends on.
            # (2026-07-29: Errante's "¼ of a wavelength" arrived as "� of a
            # wavelength", which would have made a quarter-wave grep return nothing.)
            r = subprocess.run(
                [_PANDOC, "-f", "html", "-t", "gfm", "--wrap=none"],
                input=read_html(path).encode("utf-8"),
                capture_output=True, timeout=90,
            )
            if r.returncode == 0 and r.stdout.strip():
                md = r.stdout.decode("utf-8", errors="replace")
                # Drop pandoc's empty-link and anchor noise.
                md = re.sub(r"\n{3,}", "\n\n", md)
                return md.strip()
        except Exception:
            pass
    return parse_page(path).text.strip()


# ── helpers ─────────────────────────────────────────────────────────────────

def slugify(s, fallback="page"):
    s = unicodedata.normalize("NFKD", s or "").encode("ascii", "ignore").decode()
    s = re.sub(r"[^\w\s-]", "", s).strip().lower()
    s = re.sub(r"[\s_-]+", "-", s)
    return s[:80] or fallback


def clean_title(raw, relpath):
    t = html.unescape(re.sub(r"\s+", " ", (raw or "")).strip())
    return t or os.path.splitext(os.path.basename(relpath))[0].replace("_", " ")


def local_target(href, from_rel, html_set):
    """Resolve an href to a mirrored page's relpath, or None if external/asset."""
    href = href.split("#", 1)[0].split("?", 1)[0].strip()
    if not href or href.startswith(("http://", "https://", "mailto:", "javascript:", "//", "tel:")):
        return None
    base = os.path.dirname(from_rel)
    cand = os.path.normpath(os.path.join(base, href)) if base else os.path.normpath(href)
    cand = cand.lstrip("./")
    if cand in html_set:
        return cand
    for idx in ("index.htm", "index.html"):
        j = os.path.normpath(os.path.join(cand, idx))
        if j in html_set:
            return j
    return None


def find_entry(html_pages):
    """Entry page = shallowest index.*, else shallowest page overall."""
    def depth(p):
        return p.count(os.sep)
    idx = [p for p in html_pages if os.path.basename(p).lower() in
           ("index.htm", "index.html", "default.htm", "default.html")]
    pool = idx or html_pages
    return sorted(pool, key=lambda p: (depth(p), len(p), p))[0]


# ── main ────────────────────────────────────────────────────────────────────

def clear_stale_pages(pages_dir, say):
    """Empty _paper/pages/ before writing it.

    Per-page filenames encode a sequence number and a title slug
    (`001-some-title.md`). Both change when the corpus changes: adding pages
    renumbers everything after the insertion point, so a re-run writes NEW
    filenames and leaves the previous run's files sitting beside them.

    That is not cosmetic. Measured on amasci.com: a refresh wrote 10,303 current
    files into a directory that then held 18,704 — 8,401 stale orphans under old
    numbering. A page-per-page analysis pointed at that directory would consume
    both, treating superseded duplicates as if they were distinct pages, and any
    aggregate drawn from it would be silently wrong.

    The directory is wholly derived from the mirror, so clearing it is safe: every
    file is about to be regenerated. Confined to *.md inside pages/ — never the
    mirror itself.
    """
    if not os.path.isdir(pages_dir):
        return 0
    removed = 0
    for name in os.listdir(pages_dir):
        if not name.endswith(".md"):
            continue
        try:
            os.remove(os.path.join(pages_dir, name))
            removed += 1
        except OSError:
            pass
    if removed:
        say(f"site_to_paper: cleared {removed:,} previous per-page file(s) "
            f"— they are regenerated below, and stale numbering would otherwise "
            f"accumulate as phantom pages")
    return removed


def collect_html_pages(site_dir):
    """Every mirrored HTML page, as relpaths, sorted. Skips derived/meta files.

    Shared with scripts/site_to_allpages.py so both consolidators see exactly
    the same page set — a page in one and not the other would be a silent gap.
    """
    html_pages = []
    for root, dirs, files in os.walk(site_dir):
        dirs[:] = [d for d in dirs if d not in ("_paper", "__pycache__") and not d.startswith(".")]
        for f in files:
            if f in SKIP_NAMES or f.startswith("_"):
                continue
            if os.path.splitext(f)[1].lower() in HTML_EXT:
                html_pages.append(os.path.relpath(os.path.join(root, f), site_dir))
    html_pages.sort()
    return html_pages


def reading_order(site_dir, html_pages):
    """The site's OWN reading order: BFS from the entry page, honouring
    in-document link order. Returns (entry, order, orphans, parsed, titles).

    Shared with scripts/site_to_allpages.py — the markdown paper and the
    single-page HTML must present the same sequence, or a reader comparing
    them finds two different documents.
    """
    html_set = set(html_pages)
    parsed, titles = {}, {}
    for rel in html_pages:
        p = parse_page(os.path.join(site_dir, rel))
        parsed[rel] = p
        titles[rel] = clean_title(p.title, rel)

    entry = find_entry(html_pages)
    order, seen, queue = [], {entry}, [entry]
    while queue:
        cur = queue.pop(0)
        order.append(cur)
        for href in parsed[cur].links:
            tgt = local_target(href, cur, html_set)
            if tgt and tgt not in seen:
                seen.add(tgt)
                queue.append(tgt)
    orphans = [p for p in html_pages if p not in seen]
    return entry, order, orphans, parsed, titles


def build(site_dir, title=None, author=None, quiet=False):
    site_dir = os.path.abspath(site_dir)
    domain = os.path.basename(site_dir.rstrip("/"))

    def say(m):
        if not quiet:
            print(m, flush=True)

    html_pages = collect_html_pages(site_dir)

    if not html_pages:
        say(f"site_to_paper: no HTML pages under {site_dir} — nothing to consolidate")
        return None

    html_set = set(html_pages)
    say(f"site_to_paper: {domain} — {len(html_pages)} HTML page(s)")

    entry, order, orphans, parsed, titles = reading_order(site_dir, html_pages)
    reachable = set(order)
    say(f"site_to_paper: entry={entry} · reachable={len(order)} · unreached={len(orphans)}")

    paper_dir = os.path.join(site_dir, "_paper")
    pages_dir = os.path.join(paper_dir, "pages")
    os.makedirs(pages_dir, exist_ok=True)
    clear_stale_pages(pages_dir, say)

    source_url = ""
    src_txt = os.path.join(site_dir, "SOURCE.txt")
    if os.path.exists(src_txt):
        m = re.search(r"https?://\S+", open(src_txt, errors="replace").read())
        if m:
            source_url = m.group(0)

    sequence = order + orphans
    manifest, sections = [], []

    for i, rel in enumerate(sequence, 1):
        p = parsed[rel]
        t = titles[rel]
        md = to_markdown(os.path.join(site_dir, rel))
        slug = f"{i:03d}-{slugify(t, os.path.splitext(os.path.basename(rel))[0])}"
        reached = rel in reachable

        outlinks = []
        for href in p.links:
            tgt = local_target(href, rel, html_set)
            if tgt:
                outlinks.append(tgt)

        # Per-page markdown, KeelyNet-style frontmatter.
        fm = [
            "---",
            f'title: "{t.replace(chr(34), chr(39))}"',
            f"source_domain: {domain}",
            f"source_path: {rel}",
            f"order: {i}",
            f"reachable_from_entry: {'true' if reached else 'false'}",
            f"images: {len(p.images)}",
            f"internal_links: {len(outlinks)}",
            f"extracted: {datetime.now(timezone.utc).strftime('%Y-%m-%dT%H:%M:%SZ')}",
            f"extractor: site_to_paper.py ({'pandoc' if _PANDOC else 'builtin'})",
            "---",
            "",
            f"# {t}",
            "",
            f"*Source page: `{rel}`*",
            "",
            md,
            "",
        ]
        open(os.path.join(pages_dir, slug + ".md"), "w").write("\n".join(fm))

        sections.append((i, t, rel, md, p.images, reached))
        manifest.append({
            "order": i, "title": t, "path": rel, "slug": slug,
            "reachable_from_entry": reached,
            "images": p.images, "internal_links": outlinks,
            "chars": len(md),
        })

    # ── the consolidated paper ──
    total_chars = sum(len(s[3]) for s in sections)
    doc_title = title or f"{domain} — consolidated site corpus"

    out = [
        "---",
        f'title: "{doc_title}"',
        f"source_domain: {domain}",
        f"source_url: {source_url}",
        f"author_of_source: {author or 'unattributed — see site'}",
        f"generated: {datetime.now(timezone.utc).strftime('%Y-%m-%dT%H:%M:%SZ')}",
        "generator: merlib-mirror/scripts/site_to_paper.py",
        f"pages_total: {len(sequence)}",
        f"pages_reachable_from_entry: {len(order)}",
        f"pages_unreached: {len(orphans)}",
        f"body_chars: {total_chars}",
        "type: consolidated-site-corpus",
        "status: MACHINE-GENERATED consolidation of a mirror — not an analysis, not a deep-read",
        "---",
        "",
        f"# {doc_title}",
        "",
        "## Provenance and honesty note",
        "",
        f"This document is a **mechanical consolidation** of the mirrored site `{domain}`",
        f"({len(sequence)} HTML pages, {total_chars:,} characters of extracted body text).",
        "It exists so the corpus can be read and synthesised as ONE text instead of N",
        "scattered pages. It is **not** an analysis and carries no judgement about the",
        "content's correctness.",
        "",
        f"- Source URL: {source_url or '(see SOURCE.txt)'}",
        f"- Extraction: `{'pandoc html->gfm' if _PANDOC else 'builtin HTML text stripper'}`",
        f"- Reading order: breadth-first from `{entry}`, following each page's links in",
        "  document order — the site's own sequence, not alphabetical filenames.",
        f"- Pages reached from the entry page: **{len(order)}**.",
        f"- Pages NOT reached (orphans — no inbound link found): **{len(orphans)}**."
        + (" Listed in the trailing section; nothing is dropped." if orphans else ""),
        "- Images are referenced by their mirrored relative paths, not inlined.",
        "",
        "## Contents",
        "",
    ]
    for i, t, rel, md, imgs, reached in sections:
        mark = "" if reached else "  *(orphan)*"
        out.append(f"{i}. [{t}](#{i:03d}-{slugify(t)}) — `{rel}` · {len(md):,} chars"
                   + (f" · {len(imgs)} img" if imgs else "") + mark)
    out.append("")

    first_orphan = True
    for i, t, rel, md, imgs, reached in sections:
        if not reached and first_orphan:
            out += ["", "---", "",
                    "## Unreached pages (no inbound link from the entry page)",
                    "",
                    "These were mirrored but the link graph never reaches them from the entry",
                    "page. They may be orphaned drafts, older revisions, or pages linked only",
                    "from assets. Included so the consolidation is complete.",
                    ""]
            first_orphan = False
        out += ["", "---", "", f"## {i:03d}-{slugify(t)}", "", f"### {t}", "",
                f"*Mirrored page: `{rel}`*"
                + (f" · *{len(imgs)} image(s): " + ", ".join(f"`{x}`" for x in imgs[:8])
                   + ("…" if len(imgs) > 8 else "") + "*" if imgs else ""),
                "", md, ""]

    # The single consolidated paper does not scale, and failing to notice that
    # would break the repo rather than just bloat it. amasci.com: 824 pages made a
    # 44 MB file, so its full 10,060-page corpus projects to ~540 MB — past
    # GitHub's 100 MB HARD limit, so the push would be REJECTED and the whole
    # mirror would fail to land over a derived artifact nobody can open anyway.
    #
    # The per-page markdown under _paper/pages/ is the real product (it is what
    # the page-per-page analysis consumes); the stitched file is a convenience.
    # So: write it when it is a sane size, and when it is not, say so loudly and
    # skip it rather than producing something unpushable.
    paper_path = os.path.join(paper_dir, f"{domain}-CONSOLIDATED.md")
    body = "\n".join(out)
    size_mb = len(body.encode("utf-8")) / 1048576.0
    if size_mb > MAX_CONSOLIDATED_MB:
        say(f"site_to_paper: CONSOLIDATED.md SKIPPED — would be {size_mb:,.0f} MB "
            f"(limit {MAX_CONSOLIDATED_MB} MB; GitHub rejects >100 MB).")
        say(f"site_to_paper: the {len(sequence):,} per-page files in _paper/pages/ "
            f"ARE written — that is the analysable product.")
        paper_path = None
    else:
        open(paper_path, "w").write(body)
    json.dump({
        "domain": domain, "source_url": source_url, "entry": entry,
        "pages_total": len(sequence), "pages_reachable": len(order),
        "pages_unreached": len(orphans), "body_chars": total_chars,
        "extractor": "pandoc" if _PANDOC else "builtin",
        "generated": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
        "pages": manifest,
    }, open(os.path.join(paper_dir, "_manifest.json"), "w"), indent=2)

    if paper_path:
        say(f"site_to_paper: wrote {paper_path} "
            f"({total_chars:,} chars from {len(sequence)} pages)")
    say(f"site_to_paper: wrote {len(sequence)} per-page markdown files to {pages_dir}")
    return paper_path


def main():
    ap = argparse.ArgumentParser(description="Consolidate a mirrored site into one paper.")
    ap.add_argument("site_dir")
    ap.add_argument("--title")
    ap.add_argument("--author")
    ap.add_argument("--quiet", action="store_true")
    a = ap.parse_args()
    if not os.path.isdir(a.site_dir):
        print(f"site_to_paper: not a directory: {a.site_dir}", file=sys.stderr)
        return 2
    return 0 if build(a.site_dir, a.title, a.author, a.quiet) else 0


if __name__ == "__main__":
    sys.exit(main())
