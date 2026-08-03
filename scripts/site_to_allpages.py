#!/usr/bin/env python3
"""Stitch a mirrored site into ONE longform HTML page (+ PDF).

FEATURE-CARD >> features/allpages-longform.feature

site_to_paper.py already emits a consolidated *markdown* paper. That is the right
shape for grep and for feeding a model. It is the wrong shape for READING and for
printing: the images are gone, the tables are flattened, and there is no PDF.

This emits the other half:

    <site>/_paper/allpages.html   one document, every page, in the site's own
                                  reading order, images inline
    <site>/_paper/allpages.pdf    the same, printed (weasyprint)

The point Esa made: a mirrored site is a maze of "click here to see yet another
page". So every internal link that points at another mirrored page is rewritten
to an **in-document anchor** (`#page-007`). Nothing to click away to — the whole
site is one scroll, and the links still work, jumping within the document.

Reading order and page set come from site_to_paper's `reading_order()` /
`collect_html_pages()`, so this document and the markdown paper are the same
document in two shapes — never two different ones.

Usage:
    python3 scripts/site_to_allpages.py sites/<domain> [--no-pdf] [--max-pages N]
"""

import argparse
import html
import html.parser
import os
import shutil
import subprocess
import sys
from datetime import datetime, timezone

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import site_to_paper as stp  # noqa: E402

# Dropped outright. <script> is inert here and only bloats the file. Stylesheets
# and <style> are dropped because in a stitched document a page's global selectors
# (body{...}, a{...}) would restyle every OTHER page too — 56 pages of 1990s CSS
# fighting each other. We impose one readable print stylesheet instead. Inline
# style="" attributes are KEPT, since those are scoped to their own element.
DROP_ELEMENTS = {"script", "style", "noscript"}

# Rewritten to point at the mirrored file (or an in-document anchor).
URL_ATTRS = {"src", "href", "background", "data-lazy-src", "poster", "longdesc"}

VOID = {"area", "base", "br", "col", "embed", "hr", "img", "input", "link",
        "meta", "param", "source", "track", "wbr"}


class BodyRewriter(html.parser.HTMLParser):
    """Reconstruct a page's <body> HTML, rewriting URLs as it goes.

    Deliberately a parser and not a regex: rewriting attributes with a regex over
    a whole document means a pattern with `[^>]*?` before a literal before another
    class, which is the shape this project has banned for catastrophic
    backtracking. A parser is linear and cannot blow up.
    """

    def __init__(self, rel, anchors, site_dir, prefix):
        super().__init__(convert_charrefs=False)
        self.rel = rel                # this page's relpath within the site
        self.anchors = anchors        # {page relpath: "#page-NNN"}
        self.site_dir = site_dir
        self.prefix = prefix          # path prefix from _paper/ back to site root
        self.html_set = set(anchors)
        self.out = []
        self._in_body = False
        self._saw_body = False
        self._drop_depth = 0
        self.rewritten_links = 0
        self.rewritten_assets = 0

    # ── URL rewriting ────────────────────────────────────────────────────────
    def _rewrite(self, value):
        if not value:
            return value
        raw = value.strip()
        low = raw.lower()
        if low.startswith(("http://", "https://", "//", "mailto:", "javascript:",
                           "tel:", "data:", "#")):
            return value  # external or already an anchor — leave alone

        # Split off any fragment so "page.htm#sec" still resolves to the page.
        path_part = raw.split("#", 1)[0]

        # Does it point at another mirrored PAGE? Then it becomes an anchor.
        tgt = stp.local_target(path_part, self.rel, self.html_set)
        if tgt and tgt in self.anchors:
            self.rewritten_links += 1
            return self.anchors[tgt]

        # Otherwise it may point at a mirrored ASSET (image, pdf, txt). Make it
        # relative to the _paper/ dir where this document lives.
        base = os.path.dirname(self.rel)
        cand = os.path.normpath(os.path.join(base, path_part.split("?", 1)[0])) \
            if base else os.path.normpath(path_part.split("?", 1)[0])
        cand = cand.lstrip("./")
        if cand and os.path.exists(os.path.join(self.site_dir, cand)):
            self.rewritten_assets += 1
            return self.prefix + cand
        return value

    def _attrs_str(self, attrs):
        parts = []
        for name, value in attrs:
            if name.lower() == "base":
                continue
            if value is None:
                parts.append(f" {name}")
                continue
            if name.lower() in URL_ATTRS:
                value = self._rewrite(value)
            parts.append(f' {name}="{html.escape(value, quote=True)}"')
        return "".join(parts)

    # ── reconstruction ───────────────────────────────────────────────────────
    def handle_starttag(self, tag, attrs):
        if tag == "body":
            self._in_body = True
            self._saw_body = True
            return
        if tag in ("html", "head", "base"):
            return
        if tag in DROP_ELEMENTS:
            self._drop_depth += 1
            return
        if not self._in_body or self._drop_depth:
            return
        self.out.append(f"<{tag}{self._attrs_str(attrs)}>")

    def handle_startendtag(self, tag, attrs):
        if tag in DROP_ELEMENTS or not self._in_body or self._drop_depth:
            return
        self.out.append(f"<{tag}{self._attrs_str(attrs)} />")

    def handle_endtag(self, tag):
        if tag == "body":
            self._in_body = False
            return
        if tag in ("html", "head"):
            return
        if tag in DROP_ELEMENTS:
            self._drop_depth = max(0, self._drop_depth - 1)
            return
        if not self._in_body or self._drop_depth or tag in VOID:
            return
        self.out.append(f"</{tag}>")

    def handle_data(self, data):
        if self._in_body and not self._drop_depth:
            self.out.append(data)

    def handle_entityref(self, name):
        if self._in_body and not self._drop_depth:
            self.out.append(f"&{name};")

    def handle_charref(self, name):
        if self._in_body and not self._drop_depth:
            self.out.append(f"&#{name};")

    def handle_comment(self, data):
        pass  # 1990s pages are full of editor cruft

    def body_html(self):
        return "".join(self.out).strip()


STYLE = """
:root { color-scheme: light; }
body { background:#fff; color:#111; margin:0;
       font:16px/1.6 Georgia,"Times New Roman",serif; }
.wrap { max-width: 46em; margin: 0 auto; padding: 2em 1.5em 6em; }
h1.doc-title { font-size:2em; line-height:1.2; margin:0 0 .2em; }
.doc-meta { color:#555; font-size:.85em; margin-bottom:2.5em;
            border-bottom:2px solid #111; padding-bottom:1em; }
nav.toc { margin:0 0 3em; }
nav.toc h2 { font-size:1.1em; text-transform:uppercase; letter-spacing:.08em; }
nav.toc ol { padding-left:1.6em; }
nav.toc li { margin:.25em 0; }
nav.toc a { color:#0b4; color:#06c; text-decoration:none; }
nav.toc a:hover { text-decoration:underline; }
section.page { border-top:1px solid #ccc; padding-top:2em; margin-top:3em; }
section.page > h2.page-title { font-size:1.45em; line-height:1.25; margin:0 0 .15em; }
section.page > .page-src { color:#777; font-size:.75em; font-family:ui-monospace,Menlo,monospace;
                           margin:0 0 1.4em; word-break:break-all; }
section.page > .page-src a { color:#777; }
img { max-width:100%; height:auto; }
table { max-width:100%; border-collapse:collapse; }
td, th { padding:.2em .5em; }
pre { white-space:pre-wrap; word-wrap:break-word; font-size:.85em; }
a { color:#06c; }
.backtotop { font-size:.75em; color:#999; }
.frameset-note { background:#f6f6f6; border-left:3px solid #999;
                 padding:.8em 1em; color:#555; font-size:.9em; }

@media print {
  .wrap { max-width:none; padding:0; }
  nav.toc { page-break-after: always; }
  section.page { page-break-before: always; border-top:none; margin-top:0; }
  a { color:#000; text-decoration:none; }
  .backtotop { display:none; }
  @page { margin: 18mm 16mm; }
}
"""


def build(site_dir, make_pdf=True, max_pages=None, pdf_max_pages=None, quiet=False):
    site_dir = os.path.abspath(site_dir.rstrip("/"))
    domain = os.path.basename(site_dir)
    out_dir = os.path.join(site_dir, "_paper")

    def say(m):
        if not quiet:
            print(m, flush=True)

    html_pages = stp.collect_html_pages(site_dir)
    if not html_pages:
        say(f"site_to_allpages: no HTML pages under {site_dir} — nothing to build")
        return None

    entry, order, orphans, parsed, titles = stp.reading_order(site_dir, html_pages)

    # Orphans are appended after the reachable run so NOTHING is dropped — same
    # policy as the markdown paper. A page we hold but never show would be a
    # silent loss, which is the exact failure this repo keeps getting bitten by.
    sequence = order + orphans
    truncated = 0
    if max_pages and len(sequence) > max_pages:
        truncated = len(sequence) - max_pages
        sequence = sequence[:max_pages]

    anchors = {rel: f"#page-{i:03d}" for i, rel in enumerate(sequence, 1)}
    prefix = "../"  # allpages.html lives in _paper/, assets are one level up

    say(f"site_to_allpages: {domain} — {len(html_pages)} page(s), "
        f"entry={entry}, reachable={len(order)}, orphans={len(orphans)}")
    if truncated:
        say(f"site_to_allpages: WARNING — capped at {max_pages}, "
            f"{truncated} page(s) NOT included")

    parts, total_links, total_assets, empty = [], 0, 0 , []
    for i, rel in enumerate(sequence, 1):
        rw = BodyRewriter(rel, anchors, site_dir, prefix)
        try:
            rw.feed(stp.read_html(os.path.join(site_dir, rel)))
        except Exception:
            pass
        body = rw.body_html()
        total_links += rw.rewritten_links
        total_assets += rw.rewritten_assets

        if not body:
            # A frameset page has no <body> at all. Say so rather than emitting a
            # blank section that reads as "this page was empty".
            empty.append(rel)
            body = ('<p class="frameset-note">This page carries no body content of '
                    'its own — it is a frameset or redirect. Its content appears as '
                    'its own section in this document.</p>')

        title = html.escape(titles.get(rel) or rel)
        flag = "" if rel in set(order) else ' <em>(not linked from the entry page)</em>'
        parts.append(
            f'<section class="page" id="page-{i:03d}">\n'
            f'  <h2 class="page-title">{i}. {title}</h2>\n'
            f'  <p class="page-src"><a href="{prefix}{html.escape(rel)}">{html.escape(rel)}</a>'
            f'{flag}</p>\n'
            f'{body}\n'
            f'  <p class="backtotop"><a href="#toc">↑ contents</a></p>\n'
            f'</section>'
        )

    toc = "\n".join(
        f'    <li><a href="{anchors[rel]}">{html.escape(titles.get(rel) or rel)}</a></li>'
        for rel in sequence
    )
    stamp = datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M:%SZ")
    src_url = ""
    src_path = os.path.join(site_dir, "SOURCE.txt")
    if os.path.exists(src_path):
        for line in open(src_path, errors="ignore"):
            if line.startswith("target:"):
                src_url = line.split(":", 1)[1].strip()
                break

    doc = f"""<!doctype html>
<html lang="en"><head><meta charset="utf-8">
<title>{html.escape(domain)} — all pages</title>
<style>{STYLE}</style>
</head><body><div class="wrap">
<h1 class="doc-title">{html.escape(domain)}</h1>
<p class="doc-meta">
  Every mirrored page of this site, in the site's own reading order, as one
  document. Internal links jump within this page.<br>
  {'Source: <code>' + html.escape(src_url) + '</code><br>' if src_url else ''}
  Pages: {len(sequence)} ({len(order)} reachable from <code>{html.escape(entry)}</code>,
  {len(orphans)} not linked){' — CAPPED, ' + str(truncated) + ' omitted' if truncated else ''}<br>
  Generated {stamp} by <code>scripts/site_to_allpages.py</code>
</p>
<nav class="toc" id="toc"><h2>Contents</h2><ol>
{toc}
</ol></nav>
{chr(10).join(parts)}
</div></body></html>
"""

    os.makedirs(out_dir, exist_ok=True)
    out_html = os.path.join(out_dir, "allpages.html")
    with open(out_html, "w", encoding="utf-8") as fh:
        fh.write(doc)
    say(f"site_to_allpages: wrote {out_html} "
        f"({len(doc):,} chars, {len(sequence)} pages, "
        f"{total_links} internal links → anchors, {total_assets} asset paths fixed)")
    if empty:
        say(f"site_to_allpages: {len(empty)} page(s) had no body (frameset/redirect): "
            + ", ".join(empty[:5]) + ("…" if len(empty) > 5 else ""))

    out_pdf = None
    if make_pdf and pdf_max_pages and len(sequence) > pdf_max_pages:
        # Loud, never silent: a very large site produces a PDF big enough to be a
        # problem in git, and weasyprint's layout cost grows with it. The HTML is
        # the durable artifact; the PDF is derivable on demand.
        say(f"site_to_allpages: PDF SKIPPED — {len(sequence)} pages exceeds "
            f"--pdf-max-pages {pdf_max_pages}. HTML is complete. To build it anyway:"
            f"\n    python3 scripts/site_to_allpages.py {site_dir}")
        make_pdf = False
    if make_pdf:
        out_pdf = os.path.join(out_dir, "allpages.pdf")
        wp = shutil.which("weasyprint")
        if not wp:
            say("site_to_allpages: weasyprint not found — skipping PDF "
                "(install it, or open allpages.html and ⌘P → Save as PDF)")
            out_pdf = None
        else:
            try:
                r = subprocess.run([wp, out_html, out_pdf],
                                   capture_output=True, timeout=1800)
                if r.returncode == 0 and os.path.exists(out_pdf):
                    say(f"site_to_allpages: wrote {out_pdf} "
                        f"({os.path.getsize(out_pdf):,} bytes)")
                else:
                    tail = r.stderr.decode("utf-8", "replace").strip().splitlines()
                    say("site_to_allpages: PDF failed — " +
                        (tail[-1] if tail else f"exit {r.returncode}"))
                    out_pdf = None
            except subprocess.TimeoutExpired:
                say("site_to_allpages: PDF timed out (site too large) — HTML is fine")
                out_pdf = None

    return {"html": out_html, "pdf": out_pdf, "pages": len(sequence),
            "reachable": len(order), "orphans": len(orphans),
            "truncated": truncated}


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("site_dir")
    ap.add_argument("--no-pdf", action="store_true", help="HTML only")
    ap.add_argument("--max-pages", type=int, default=None,
                    help="cap page count (omitted pages are reported, never silent)")
    ap.add_argument("--pdf-max-pages", type=int, default=None,
                    help="skip the PDF above this page count (reported, not silent)")
    ap.add_argument("--quiet", action="store_true")
    a = ap.parse_args()
    res = build(a.site_dir, make_pdf=not a.no_pdf, max_pages=a.max_pages,
                pdf_max_pages=a.pdf_max_pages, quiet=a.quiet)
    return 0 if res else 1


if __name__ == "__main__":
    sys.exit(main())
