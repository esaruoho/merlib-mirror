#!/usr/bin/env python3
"""Find directory-listing pages in sites/ whose listed children were never mirrored.

WHY THIS EXISTS
---------------
mirror.py used to resolve relative links against the URL it *requested* rather than
the URL the server actually *served*. Apache/nginx 301 a bare directory path to the
trailing-slash form, so a listing fetched as `/a/b/free-energy` had its children
resolved against `/a/b/` — one directory too high. Every child 404'd, the crawl
reported "complete", and a whole subtree was silently absent. See
MIRROR-BUG-redirect-base-url.md.

That bug is fixed, but mirrors taken BEFORE the fix can still be holed. This script
finds them by content rather than by filename convention: it parses each saved
directory listing, reads the entries the server said were there, and checks whether
those entries exist on disk.

Deliberately NOT keyed on Apache's `?C=N;O=D` sort-variant files. That heuristic was
tried first and misses any server whose autoindex does not emit sort links (plain
nginx does not), which would report a clean archive while holes remained.

Usage:
    python3 scripts/find_holed_listings.py [sites_dir] [--verbose]
"""

import os
import re
import sys
import html
import json
import urllib.parse
from collections import defaultdict

# Extensions should_skip_url() refuses by design. A listing naming these is not a
# hole — the crawler was told not to take them.
SKIP_EXTS = {'.exe', '.msi', '.dmg', '.zip', '.tar', '.gz', '.iso'}

# A listing page announces its own directory in the title or h1.
INDEX_OF_RE = re.compile(
    r'<(?:title|h1)\b[^>]*>\s*Index of\s+(/[^<\r\n]*?)\s*</(?:title|h1)>', re.I)
# nginx autoindex has no h1 — it uses <title>Index of /path</title> plus a <pre>.
HREF_RE = re.compile(r'<a\s+href="([^"]+)"', re.I)

# Links in a listing that are chrome, not content.
SORT_QUERY = ('?c=', '?C=')
NOT_CONTENT = {'..', '../', '.', './'}


def is_listing(head_text):
    return INDEX_OF_RE.search(head_text) is not None


def listing_dir(head_text):
    m = INDEX_OF_RE.search(head_text)
    return html.unescape(m.group(1)).strip() if m else None


def listing_entries(text):
    """The child names a directory listing claims to contain."""
    out = []
    for href in HREF_RE.findall(text):
        href = html.unescape(href).strip()
        if not href or href in NOT_CONTENT:
            continue
        low = href.lower()
        if low.startswith(('http://', 'https://', 'mailto:', 'javascript:', '#', '?')):
            continue
        if any(s in href for s in SORT_QUERY):
            continue
        if href.startswith('/'):        # "Parent Directory" is usually absolute
            continue
        if href.startswith('./'):
            href = href[2:]
        out.append(href)
    return out


def listing_base_dir(listing_path):
    """Where this listing's children live ON DISK.

    Derived from the listing file's own location, NOT from the `Index of /path`
    heading. The heading is the URL path, which routinely disagrees with the mirror
    layout — `sites/pharis/Dynamic/index.html` announces itself as
    `Index of /~pharis/Dynamic`, and trusting that produced a phantom
    `sites/pharis/~pharis/Dynamic/` where nothing could ever be found, reporting
    all 12 real chapters as missing.

    Two save shapes, both from sanitize_path():
      `X/index.html` (URL had the trailing slash) -> children in `X/`
      `X.html`       (URL was the bare form)      -> children also in `X/`
    """
    if os.path.basename(listing_path).lower() in ('index.html', 'index.htm'):
        return os.path.dirname(listing_path)
    return os.path.splitext(listing_path)[0]


def local_candidates(base, entry):
    """Every on-disk path that would satisfy `entry` inside `base`.

    sanitize_path() appends `.html` to any basename with no extension, and a
    subdirectory can be saved as either `X/` or `X.html` — so one logical child has
    several legitimate spellings.
    """
    name = urllib.parse.unquote(entry)
    if name.endswith('/'):
        stem = name.rstrip('/')
        return [os.path.join(base, stem),
                os.path.join(base, stem, 'index.html'),
                os.path.join(base, stem + '.html')]
    cands = [os.path.join(base, name)]
    if '.' not in os.path.basename(name):
        cands.append(os.path.join(base, name + '.html'))
    return cands


def exists(path):
    if os.path.isdir(path):
        try:
            return any(os.scandir(path))
        except OSError:
            return False
    return os.path.isfile(path) and os.path.getsize(path) > 0


def site_source(site_root):
    """'live', 'web.archive.org', or None — from the mirror's own _meta.json.

    This is the difference between a bug and a fact of life. A LIVE mirror that is
    missing a listed child means the crawler failed to reach a URL that was there to
    be reached — that is the redirect bug's signature, and it is fixable by re-running.
    A WAYBACK mirror missing one means the Internet Archive never captured that file;
    no amount of re-crawling will produce it. Reporting both as "holed" would put a
    5,000-entry number on the board that no fix can move.
    """
    try:
        with open(os.path.join(site_root, '_meta.json')) as fh:
            return json.load(fh).get('source')
    except Exception:
        return None


def scan(sites_dir, verbose=False):
    holes = defaultdict(list)
    listings = 0
    sources = {}

    for site in sorted(os.listdir(sites_dir)):
        site_root = os.path.join(sites_dir, site)
        if not os.path.isdir(site_root):
            continue
        sources[site] = site_source(site_root)
        for root, _dirs, files in os.walk(site_root):
            if os.sep + '_paper' in root:
                continue
            for fname in files:
                if not fname.lower().endswith(('.html', '.htm')):
                    continue
                path = os.path.join(root, fname)
                try:
                    if os.path.getsize(path) > 2_000_000:
                        continue
                    with open(path, 'rb') as fh:
                        raw = fh.read(400_000)
                except OSError:
                    continue
                text = raw.decode('utf-8', errors='replace')
                if not is_listing(text[:4096]):
                    continue
                listings += 1
                dir_rel = listing_dir(text[:4096])
                if dir_rel is None:
                    continue
                entries = listing_entries(text)
                base = listing_base_dir(path)
                missing = [e for e in entries
                           if os.path.splitext(e)[1].lower() not in SKIP_EXTS
                           and not any(exists(c) for c in
                                       local_candidates(base, e))]
                if missing:
                    holes[site].append((os.path.relpath(path, sites_dir),
                                        dir_rel, len(entries), missing))
                elif verbose:
                    print(f"  ok  {os.path.relpath(path, sites_dir)} "
                          f"({len(entries)} entries)")
    return holes, listings, sources


def main():
    args = [a for a in sys.argv[1:] if not a.startswith('--')]
    verbose = '--verbose' in sys.argv
    sites_dir = args[0] if args else os.path.join(
        os.path.dirname(os.path.dirname(os.path.abspath(__file__))), 'sites')

    holes, listings, sources = scan(sites_dir, verbose)

    print(f"\nScanned {sites_dir}")
    print(f"Directory listings found: {listings}")
    if not holes:
        print("No holed listings. Every listed child is present on disk.")
        return 0

    live = {s: v for s, v in holes.items() if sources.get(s) == 'live'}
    archived = {s: v for s, v in holes.items() if sources.get(s) != 'live'}

    def summarise(group, heading, note):
        if not group:
            return
        n_miss = sum(len(m) for v in group.values() for *_, m in v)
        print(f"\n{heading}: {sum(len(v) for v in group.values())} listing(s) "
              f"across {len(group)} site(s); {n_miss} missing entries")
        print(f"  {note}")
        for site in sorted(group):
            src = sources.get(site) or 'unknown source'
            print(f"\n=== {site}  [{src}]")
            for relpath, dir_rel, n, missing in sorted(group[site]):
                print(f"  {relpath}")
                print(f"      lists {dir_rel}  ({n} entries, {len(missing)} MISSING)")
                for m in missing[:25]:
                    print(f"        - {m}")
                if len(missing) > 25:
                    print(f"        … and {len(missing) - 25} more")

    summarise(live, "ACTIONABLE (live mirrors)",
              "The crawler could have fetched these and did not. Re-run to fill.")
    summarise(archived, "NOT ACTIONABLE (wayback/unknown mirrors)",
              "The listing is a snapshot of what the ORIGIN held; the Internet "
              "Archive never captured these. Re-running will not produce them.")
    return 1 if live else 0


if __name__ == '__main__':
    sys.exit(main())
