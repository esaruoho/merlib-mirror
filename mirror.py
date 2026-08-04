#!/usr/bin/env python3
# SPDX-License-Identifier: MIT
"""
Unified Mirror Engine — merge best features from all mirror scripts.

Modes:
  wayback DOMAIN [--resume] [--from YYYYMMDD] [--to YYYYMMDD] [--delay 1.0]
  live URL [--seeds file.txt] [--delay 0.5]
  status DOMAIN

Optional: pip install scrapling (better TLS fingerprinting for live sites)
Falls back to stdlib urllib if scrapling is not installed.
"""

import concurrent.futures
import os
import re
import sys
import json
import threading
import time
import shutil
import hashlib
import argparse
import subprocess
import urllib.request
import urllib.parse
from datetime import datetime
from html.parser import HTMLParser

try:
    from scrapling.fetchers import Fetcher as _ScraplingFetcher
    _fetcher = _ScraplingFetcher()
    HAS_SCRAPLING = True
except ImportError:
    HAS_SCRAPLING = False

try:
    from scrapling.parser import Selector as _ScraplingSelector
    HAS_SCRAPLING_PARSER = True
except ImportError:
    HAS_SCRAPLING_PARSER = False

# ── 1. Constants ─────────────────────────────────────────────────────────────

ARCHIVE_DIR = os.path.join(os.getcwd(), "output")

IMAGE_EXTS = {'.jpg', '.jpeg', '.gif', '.png', '.bmp', '.ico', '.svg', '.webp'}
DOC_EXTS = {'.pdf', '.doc', '.docx', '.ppt', '.pptx', '.xls', '.xlsx', '.txt', '.rtf'}
MEDIA_EXTS = {'.wmv', '.mp4', '.avi', '.mov', '.wav', '.mp3', '.swf', '.flv', '.webm'}
WEB_EXTS = {'.html', '.htm', '.php', '.asp', '.aspx', '.jsp', '.css', '.js', '.xml'}

DEFAULT_WAYBACK_DELAY = 1.0
DEFAULT_LIVE_DELAY = 0.5
MAX_DISCOVER_PAGES = 500
# Wayback replay is ~13s/URL; single-threaded that is days for a big site.
# Modest on purpose — this reads someone else's archive.
DEFAULT_WAYBACK_WORKERS = 4
MAX_LINK_DEPTH = 5
BATCH_SIZE = 50
# Checkpoint at least this often regardless of counter multiples — concurrent
# workers skip past `count % BATCH_SIZE == 0`, which stranded a resume point 80
# minutes behind reality on the amasci run.
SAVE_INTERVAL_S = 120
BATCH_PAUSE = 10
MAX_TIMESTAMP_ATTEMPTS = 8
CONSECUTIVE_FAIL_BAIL = 8
MIN_CONTENT_SIZE = 50

VERSION = "1.0.0"

USER_AGENT = f"mirror.py/{VERSION} (https://github.com/esaruoho/merlib-dump)"

# Progress snapshot path — mirror-worker reads / clears this. Syncthing
# carries it to the laptop for merlib-mirror-status.sh. Same shape as
# ocr-heartbeat / whisp-heartbeat: ts + ts_iso + counters + current URL.
PROGRESS_FILE = os.path.expanduser("~/work/comms/queue/merlib-mirror-progress.json")
PROGRESS_INTERVAL = 20  # write every N URLs visited (cheap, ~one disk write per ~20s)


def write_progress_snapshot(domain, target, mode, visited, ok, queued, last_url, path_filter=None):
    """Atomic write of a small JSON status file for the laptop's status pane.
    Failure (disk full, permission, etc.) must never crash the crawler — we
    swallow exceptions silently."""
    import datetime
    try:
        payload = {
            "ts": int(time.time()),
            "ts_iso": datetime.datetime.utcnow().strftime("%Y-%m-%dT%H:%M:%SZ"),
            "domain": domain,
            "target": target,
            "mode": mode,
            "path_filter": path_filter or "",
            "urls_visited": visited,
            "urls_ok": ok,
            "urls_queued": queued,
            "last_url": last_url or "",
        }
        os.makedirs(os.path.dirname(PROGRESS_FILE), exist_ok=True)
        tmp = PROGRESS_FILE + ".tmp"
        with open(tmp, "w") as f:
            json.dump(payload, f)
        os.replace(tmp, PROGRESS_FILE)
    except Exception:
        pass

# Wayback toolbar stripping patterns (from mirror_tesla_hu.py)
WAYBACK_STRIP_PATTERNS = [
    (r'<!-- BEGIN WAYBACK TOOLBAR INSERT -->.*?<!-- END WAYBACK TOOLBAR INSERT -->', re.DOTALL),
    (r'<!-- FILE ARCHIVED ON.*?-->', re.DOTALL),
    (r'<script[^>]*wombat\.js[^>]*>.*?</script>', re.DOTALL | re.IGNORECASE),
    (r'<script[^>]*wm\.js[^>]*>.*?</script>', re.DOTALL | re.IGNORECASE),
    (r'<script[^>]*>.*?__wm\..*?</script>', re.DOTALL | re.IGNORECASE),
    (r'<script[^>]*>.*?WB_wombat_Init.*?</script>', re.DOTALL | re.IGNORECASE),
    (r'<link[^>]*_static/css/banner[^>]*>', re.IGNORECASE),
    (r'<div[^>]*id="wm-ipp[^"]*"[^>]*>.*?</div>\s*</div>\s*</div>', re.DOTALL | re.IGNORECASE),
    (r'<noscript>.*?wayback.*?</noscript>', re.DOTALL | re.IGNORECASE),
]

# URL patterns to skip during CDX discovery
SKIP_PATTERNS = [
    '.well-known/', '?subject=', '?mc_cid=', '?problem',
    '&quot', '%20%20', 'mailto:', '/cgi-bin/', 'robots.txt',
]


# ── 2. Logging ───────────────────────────────────────────────────────────────

_log_file = None


def log(msg):
    """Dual logging: console + _mirror.log"""
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    line = f"[{timestamp}] {msg}"
    print(line, flush=True)
    if _log_file:
        try:
            with open(_log_file, 'a') as f:
                f.write(line + '\n')
        except OSError:
            pass


def init_logging(output_dir):
    global _log_file
    os.makedirs(output_dir, exist_ok=True)
    _log_file = os.path.join(output_dir, "_mirror.log")


# ── 3. State management ─────────────────────────────────────────────────────

def load_progress(progress_file):
    """Load 3-phase progress state."""
    if os.path.exists(progress_file):
        with open(progress_file, 'r') as f:
            return json.load(f)
    return {'downloaded': [], 'failed': [], 'phase': 'init'}


def save_progress(progress, progress_file):
    """Atomic save: write .tmp then rename to prevent corruption on kill."""
    tmp = progress_file + '.tmp'
    with open(tmp, 'w') as f:
        json.dump(progress, f, indent=2)
    os.rename(tmp, progress_file)


# ── 4. HTTP fetching ────────────────────────────────────────────────────────

_current_delay = None  # tracks rate-limit escalation


def _fetch_scrapling(url, timeout, retries):
    """Fetch using Scrapling (TLS fingerprint spoofing, stealth headers)."""
    response = _fetcher.get(
        url,
        timeout=timeout,
        retries=retries,
        retry_delay=2,
        stealthy_headers=True,
        follow_redirects=True,
    )
    status = response.status
    content_type = response.headers.get('content-type', '')
    body = response.body if isinstance(response.body, bytes) else response.body.encode('utf-8')
    return body, content_type, status


def _fetch_urllib(url, timeout, retries):
    """Fetch using stdlib urllib (zero dependencies)."""
    headers = {'User-Agent': USER_AGENT}
    for attempt in range(retries):
        try:
            req = urllib.request.Request(url, headers=headers)
            with urllib.request.urlopen(req, timeout=timeout) as resp:
                return resp.read(), resp.headers.get('Content-Type', ''), resp.status
        except urllib.error.HTTPError as e:
            if attempt < retries - 1:
                time.sleep(2 * (attempt + 1))
                continue
            return None, '', e.code
        except Exception as e:
            if attempt < retries - 1:
                time.sleep(2 * (attempt + 1))
                continue
            return None, str(e), 0

    # HTTPS failed — try HTTP fallback
    if url.startswith('https://'):
        http_url = 'http://' + url[8:]
        try:
            req = urllib.request.Request(http_url, headers=headers)
            with urllib.request.urlopen(req, timeout=timeout) as resp:
                return resp.read(), resp.headers.get('Content-Type', ''), resp.status
        except Exception:
            pass

    return None, "Max retries exceeded", 0


def fetch_url(url, timeout=60, retries=3):
    """Fetch URL with retries + 429/503 handling.

    Uses Scrapling if installed (TLS fingerprint spoofing), falls back to urllib.
    Returns (content_bytes, content_type_str, success_bool).
    """
    global _current_delay

    if HAS_SCRAPLING:
        try:
            body, content_type, status = _fetch_scrapling(url, timeout, retries)
        except Exception:
            # Scrapling failed entirely — fall back to urllib for this request
            body, content_type, status = _fetch_urllib(url, timeout, retries)
    else:
        body, content_type, status = _fetch_urllib(url, timeout, retries)

    if status in (429, 503):
        if _current_delay is not None:
            _current_delay = min(_current_delay * 2, 10.0)
        return None, f"Rate limited ({status})", False
    if isinstance(status, int) and status >= 400:
        return None, f"HTTP {status}", False
    if body is None:
        return None, content_type, False

    return body, content_type, True


# ── 5. Content validation ───────────────────────────────────────────────────

def is_valid_content(content, ext):
    """Check content is real, not a Wayback error page."""
    if not content or len(content) < MIN_CONTENT_SIZE:
        return False

    ext = ext.lower()

    # PDF magic check
    if ext == '.pdf':
        return content[:4] == b'%PDF'

    # Web pages should contain HTML
    if ext in WEB_EXTS or ext == '':
        return b'<' in content[:200]

    # Binary files should NOT be Wayback error pages
    if b'<!DOCTYPE' in content[:500] or b'<html' in content[:500].lower():
        if b'Wayback Machine' in content[:2000]:
            return False

    return True


def is_valid_content_url(url, domain):
    """Filter out junk URLs from CDX results."""
    url_lower = url.lower()
    for pat in SKIP_PATTERNS:
        if pat in url_lower:
            return False
    # Must belong to the target domain
    domain_lower = domain.lower()
    if domain_lower not in url_lower:
        return False
    return True


# ── 6. Path handling ────────────────────────────────────────────────────────

def get_wayback_modifier(ext):
    """Return Wayback modifier: im_ for images, id_ for everything else."""
    ext = ext.lower()
    if ext in IMAGE_EXTS:
        return "im_"
    return "id_"


def sanitize_path(url):
    """Convert URL to local file path, handling query strings."""
    parsed = urllib.parse.urlparse(url)
    path = urllib.parse.unquote(parsed.path).lstrip('/')

    if not path or path == '/':
        path = 'index.html'
    elif path.endswith('/'):
        path = path + 'index.html'

    # Encode query strings (from mirror_free_energy_ws.py)
    if parsed.query:
        safe_query = urllib.parse.quote(parsed.query, safe='')
        path = f"{path}__{safe_query}"

    # Add .html if no extension
    if '.' not in os.path.basename(path):
        path = path + '.html'

    # Sanitize characters
    path = re.sub(r'[<>:"|?*]', '_', path)

    # Truncate over-long basenames (filesystems limit filenames to 255 bytes).
    # Preserve extension and append a short hash of the original name for uniqueness.
    MAX_NAME_BYTES = 200
    dir_part, base = os.path.split(path)
    if len(base.encode('utf-8', errors='ignore')) > MAX_NAME_BYTES:
        stem, ext = os.path.splitext(base)
        if len(ext.encode('utf-8', errors='ignore')) > 20:
            # absurdly long "extension" (query-string-as-ext) — treat whole base as stem
            stem, ext = base, ''
        h = hashlib.sha1(base.encode('utf-8', errors='ignore')).hexdigest()[:10]
        budget = MAX_NAME_BYTES - len(ext.encode('utf-8', errors='ignore')) - 1 - len(h)
        stem_bytes = stem.encode('utf-8', errors='ignore')[:max(budget, 1)]
        stem = stem_bytes.decode('utf-8', errors='ignore')
        base = f"{stem}_{h}{ext}"
        path = os.path.join(dir_part, base) if dir_part else base

    return path


def ensure_dir_path(local_path):
    """Create directory, resolving file/directory conflicts (from mirror_free_energy_ws.py)."""
    dir_path = os.path.dirname(local_path)
    if not dir_path:
        return

    if dir_path.startswith('/'):
        current = '/'
        parts = dir_path[1:].split(os.sep)
    else:
        current = ''
        parts = dir_path.split(os.sep)

    for part in parts:
        if not part:
            continue
        current = os.path.join(current, part)
        if os.path.exists(current) and os.path.isfile(current):
            new_name = current + ".html"
            if os.path.exists(new_name):
                os.remove(current)
                log(f"  Removed conflicting file: {current}")
            else:
                os.rename(current, new_name)
                log(f"  Renamed conflicting file: {current} -> {new_name}")

    os.makedirs(dir_path, exist_ok=True)


# ── 7. Wayback toolbar stripping ────────────────────────────────────────────

def strip_wayback_toolbar(html):
    """Remove all Wayback Machine toolbar artifacts (9 regex patterns)."""
    if isinstance(html, bytes):
        html = html.decode('utf-8', errors='ignore')

    for pattern, flags in WAYBACK_STRIP_PATTERNS:
        html = re.sub(pattern, '', html, flags=flags)

    return html


# ── 8. URL rewriting ────────────────────────────────────────────────────────

def rewrite_urls(html, domain):
    """Rewrite Wayback URLs to local paths, domain-parameterized."""
    if isinstance(html, bytes):
        html = html.decode('utf-8', errors='ignore')

    escaped = re.escape(domain)

    # 3 pattern families: absolute wayback, relative /web/, protocol-relative
    patterns = [
        rf'https?://web\.archive\.org/web/\d+(?:im_|cs_|js_|id_|if_)?/(https?://(?:www\.)?{escaped}[^"\'>\s]*)',
        rf'/web/\d+(?:im_|cs_|js_|id_|if_)?/(https?://(?:www\.)?{escaped}[^"\'>\s]*)',
        rf'//web\.archive\.org/web/\d+(?:im_|cs_|js_|id_|if_)?/(https?://(?:www\.)?{escaped}[^"\'>\s]*)',
    ]

    for pattern in patterns:
        html = re.sub(pattern, r'\1', html, flags=re.IGNORECASE)

    # Convert absolute domain URLs to relative
    html = re.sub(
        rf'https?://(?:www\.)?{escaped}/([^"\'>\s]*)',
        r'/\1',
        html,
        flags=re.IGNORECASE
    )

    return html


# ── 9. Text extraction ──────────────────────────────────────────────────────

def extract_text(html):
    """Extract plain text from HTML: strip scripts/styles, tags, decode entities."""
    if isinstance(html, bytes):
        html = html.decode('utf-8', errors='ignore')

    html = re.sub(r'<script[^>]*>.*?</script>', '', html, flags=re.DOTALL | re.IGNORECASE)
    html = re.sub(r'<style[^>]*>.*?</style>', '', html, flags=re.DOTALL | re.IGNORECASE)

    text = re.sub(r'<[^>]+>', ' ', html)

    for entity, char in [('&nbsp;', ' '), ('&amp;', '&'), ('&lt;', '<'),
                         ('&gt;', '>'), ('&quot;', '"'), ('&#39;', "'")]:
        text = text.replace(entity, char)

    text = re.sub(r'[ \t]+', ' ', text)
    text = re.sub(r'\n\s*\n', '\n\n', text)

    return text.strip()


# ── 10. Live crawl support ──────────────────────────────────────────────────

class _LinkExtractorHTML(HTMLParser):
    """Extract links from HTML using stdlib HTMLParser (fallback)."""

    def __init__(self, base_url):
        super().__init__()
        self.base_url = base_url
        self.links = set()

    def handle_starttag(self, tag, attrs):
        attrs_dict = dict(attrs)
        href = None
        if tag == 'a':
            href = attrs_dict.get('href')
        elif tag == 'img':
            href = attrs_dict.get('src') or attrs_dict.get('data-lazy-src')
        elif tag == 'link':
            href = attrs_dict.get('href')
        elif tag == 'script':
            href = attrs_dict.get('src')
        elif tag in ('frame', 'iframe'):
            href = attrs_dict.get('src')

        if href and not href.startswith(('#', 'javascript:', 'mailto:', 'data:')):
            full = urllib.parse.urljoin(self.base_url, href)
            self.links.add(full)


_META_REFRESH_RE = re.compile(
    r'<meta[^>]+http-equiv\s*=\s*["\']?refresh["\']?[^>]*content\s*=\s*["\']?\s*\d+\s*;\s*url\s*=\s*([^"\'>\s]+)',
    re.IGNORECASE,
)


def _extract_meta_refresh_targets(text, base_url):
    """Return URLs from <meta http-equiv="refresh" content="0; URL=..."> tags.

    Redirect splash pages (e.g. meyl.eu/) have zero <a> tags — without this we
    crawl one file and stop. The browser follows the refresh instantly; so do we.
    """
    urls = set()
    for m in _META_REFRESH_RE.finditer(text):
        target = m.group(1).strip().strip('"\'')
        if target:
            urls.add(urllib.parse.urljoin(base_url, target))
    return urls


_FRAME_SRC_RE = re.compile(
    r'<(?:frame|iframe)\b[^>]*?\bsrc\s*=\s*["\']?([^"\'>\s]+)',
    re.IGNORECASE,
)


def extract_frame_targets(html_content, base_url):
    """Return URLs from <frame src=...> / <iframe src=...>.

    A frameset page has zero <a> tags — its entire content is behind the
    frame's src. Without this we crawl exactly one file and stop, and the
    mirror looks "complete" while holding nothing. This is the same failure
    shape as _extract_meta_refresh_targets (meyl.eu), and it is what made
    the radiondistics.com mirror 1 file / 688 bytes: its only body is
    <frameset><frame src="https://www.radiondistics.altervista.org/">.

    Kept separate from extract_links (which also folds these in) so the
    crawler can notice when a frame points OFF-domain — the real content
    lives at another host and needs its own mirror job.

    FEATURE-CARD >> features/frameset-following.feature
    """
    text = html_content if isinstance(html_content, str) else html_content.decode('utf-8', errors='replace')
    urls = set()
    for m in _FRAME_SRC_RE.finditer(text):
        target = m.group(1).strip().strip('"\'')
        if target and not target.startswith(('#', 'javascript:', 'mailto:', 'data:', 'about:')):
            urls.add(urllib.parse.urljoin(base_url, target))
    return urls


def extract_links(html_content, base_url):
    """Extract links from HTML. Uses Scrapling if available, else HTMLParser."""
    text = html_content if isinstance(html_content, str) else html_content.decode('utf-8', errors='replace')

    if HAS_SCRAPLING_PARSER:
        page = _ScraplingSelector(text)
        links = set()
        for a in page.css('a[href]'):
            href = a.attrib.get('href', '')
            if href:
                links.add(urllib.parse.urljoin(base_url, href))
        for img in page.css('img[src]'):
            src = img.attrib.get('src', '')
            if src:
                links.add(urllib.parse.urljoin(base_url, src))
        for img in page.css('img[data-lazy-src]'):
            src = img.attrib.get('data-lazy-src', '')
            if src:
                links.add(urllib.parse.urljoin(base_url, src))
        for link in page.css('link[href]'):
            href = link.attrib.get('href', '')
            if href:
                links.add(urllib.parse.urljoin(base_url, href))
        for script in page.css('script[src]'):
            src = script.attrib.get('src', '')
            if src:
                links.add(urllib.parse.urljoin(base_url, src))
        links |= _extract_meta_refresh_targets(text, base_url)
        links |= extract_frame_targets(text, base_url)
        links = {l for l in links if not l.startswith(('javascript:', 'mailto:', 'data:', '#'))}
        return links

    # Fallback: stdlib HTMLParser
    extractor = _LinkExtractorHTML(base_url)
    extractor.feed(text)
    return (extractor.links
            | _extract_meta_refresh_targets(text, base_url)
            | extract_frame_targets(text, base_url))


def normalize_url(url):
    """Lowercase scheme+host, drop the default port, drop the fragment.

    The crawler's `seen` set is keyed by URL STRING, so an uppercase host is a
    different key and the whole site gets re-queued and re-fetched under it.
    amasci.com links to itself as `http://www.AMASCI.COM` from one page, and that
    single link re-added 68 URLs and drove the queue from ~980 to ~3,000. Hostnames
    are case-insensitive per RFC 3986; paths are NOT, so the path is left alone.
    """
    try:
        p = urllib.parse.urlsplit(url)
    except ValueError:
        return url
    if not p.hostname:
        return urllib.parse.urldefrag(url)[0]
    host = p.hostname.lower()
    if p.port and not ((p.scheme == 'http' and p.port == 80) or
                       (p.scheme == 'https' and p.port == 443)):
        host = f"{host}:{p.port}"
    return urllib.parse.urlunsplit(
        (p.scheme.lower(), host, p.path, p.query, ''))


def dedup_key(url):
    """The identity of a URL *for mirroring purposes*: its output file path.

    Two URLs that would be written to the same file ARE the same resource here —
    save_page() already treats them that way and skips the second. Keying `seen` on
    the URL string instead meant the crawler walked amasci.com in full and then
    walked www.amasci.com in full, doubling `total known` from 1,752 to 3,088. No
    content was lost (the second pass was all cached skips) but every page's links
    were re-extracted and re-queued.

    Deliberately NOT solved by stripping `www.` inside normalize_url: that would
    change the URL we actually FETCH, and plenty of hosts answer on www and not on
    the bare name (www.radiondistics.altervista.org is one). So the fetch URL stays
    verbatim and only the dedup identity is canonical.
    """
    try:
        return sanitize_path(url)
    except Exception:
        return url


# Path extensions that mean we sliced a hostname out of broken markup, not a file.
_HOSTNAME_EXTS = {'.com', '.co', '.c', '.org', '.net', '.ne', '.edu', '.gov',
                  '.uk', '.de', '.ru', '.n', '.o', '.or'}


def is_malformed_url(url):
    """True for URLs that only exist because the source HTML is broken.

    Hand-written 1990s sites are full of unquoted attributes and hrefs that swallow
    the following tag, and mailing-list archives leak quoted-printable `=3D` into
    links. The extractor faithfully surfaces those, and without this the crawler
    spends real requests on addresses that never existed — and each junk page can
    yield more junk. amasci.com produced e.g.
        http://www.amasci.com/weird2/3D"https:/www.nass.usda.gov/=
    Rejecting these at queue time is the same judgement scripts/mirror_coverage.py
    makes when it refuses to count them as coverage gaps.
    """
    if not url:
        return True
    # A second scheme past the first means two URLs ran together.
    if url.count('://') > 1 or 'http://' in url[8:] or 'https://' in url[8:]:
        return True
    if any(c in url for c in ('"', "'", '<', '>', '\n', '\r', '\t')):
        return True
    # quoted-printable leakage: `=3D` becomes `3D"` / `3D%22` in extracted hrefs
    if '3D"' in url or '=3D' in url:
        return True
    try:
        path = urllib.parse.urlsplit(url).path
    except ValueError:
        return True
    if path.endswith('='):
        return True
    if os.path.splitext(path.lower())[1] in _HOSTNAME_EXTS:
        return True
    return False


def should_skip_url(url, domain):
    """Skip URLs that don't belong to the target domain or are junk."""
    if is_malformed_url(url):
        return True
    parsed = urllib.parse.urlparse(url)
    host = (parsed.hostname or '').lower()
    if domain.lower() not in host:
        return True
    # Skip common junk
    path = parsed.path.lower()
    skip_exts = {'.exe', '.msi', '.dmg', '.zip', '.tar', '.gz', '.iso'}
    ext = os.path.splitext(path)[1]
    if ext in skip_exts:
        return True
    # Skip Blogspot/Blogger noise: search pagination, comment permalinks, feeds
    query = parsed.query.lower()
    if 'blogspot.com' in host or 'blogger.com' in host:
        if '/search' in path and ('updated-max=' in query or 'reverse-paginate' in query):
            return True
        if 'showcomment=' in query:
            return True
        if '/feeds/' in path and '/comments/' in path:
            return True
    return False


# ── 11. WordPress PDF extraction ────────────────────────────────────────────

def extract_wordpress_pdfs(output_dir, domain):
    """Find and download PDFs hidden behind WordPress plugin obfuscation.

    Handles:
    - Unicode deobfuscation (U+FE55, U+A937, U+FE56)
    - WP Rocket data-lazy-src
    - %PDF magic validation
    """
    pdf_urls = set()

    for root, _dirs, files in os.walk(output_dir):
        for fname in files:
            if not fname.endswith('.html'):
                continue
            path = os.path.join(root, fname)
            try:
                with open(path, 'r', errors='ignore') as fh:
                    content = fh.read()
            except OSError:
                continue

            # Pattern 1: PDF Viewer for Elementor iframes (Unicode-obfuscated)
            for match in re.finditer(r'(?:src|data-lazy-src)="([^"]*)"', content):
                url = urllib.parse.unquote(match.group(1))
                file_match = re.search(r'file=(https?[\ufE55:][^\s&"]+\.pdf)', url)
                if file_match:
                    pdf_path = file_match.group(1)
                    pdf_path = pdf_path.replace('\ufe55', ':').replace('\ua937', '/').replace('\ufe56', '?')
                    pdf_urls.add(pdf_path)

            # Pattern 2: Normal href links to PDFs
            for match in re.finditer(r'href="([^"]*\.pdf[^"]*)"', content):
                url = urllib.parse.unquote(match.group(1))
                if url.startswith('http'):
                    pdf_urls.add(url)

    if not pdf_urls:
        return

    log(f"WordPress PDF extraction: found {len(pdf_urls)} PDF(s)")

    pdfs_dir = os.path.join(output_dir, '_pdfs')
    os.makedirs(pdfs_dir, exist_ok=True)

    downloaded = 0
    failed = 0
    skipped = 0
    failed_list = []

    for pdf_url in sorted(pdf_urls):
        basename = os.path.basename(urllib.parse.urlparse(pdf_url).path)
        dest = os.path.join(pdfs_dir, basename)

        if os.path.exists(dest) and os.path.getsize(dest) > 0:
            skipped += 1
            continue

        content, _ct, ok = fetch_url(pdf_url)
        if ok and content and content[:4] == b'%PDF':
            with open(dest, 'wb') as f:
                f.write(content)
            downloaded += 1
            log(f"  PDF OK: {basename}")
        else:
            failed += 1
            failed_list.append(pdf_url)

    log(f"  PDFs: {downloaded} downloaded, {skipped} cached, {failed} failed")

    if failed_list:
        manifest = os.path.join(output_dir, '_missing_pdfs.txt')
        with open(manifest, 'w') as f:
            f.write(f"# PDFs referenced on {domain} but not available for download\n")
            f.write(f"# Generated: {datetime.utcnow().strftime('%Y-%m-%dT%H:%M:%SZ')}\n\n")
            f.write('\n'.join(failed_list) + '\n')
        log(f"  Missing PDFs list: {manifest}")

    # Clean up empty dir
    if downloaded == 0 and skipped == 0:
        try:
            os.rmdir(pdfs_dir)
        except OSError:
            pass


# ── 12. Wayback download engine ─────────────────────────────────────────────

# Default fallback timestamps (newest first)
FALLBACK_TIMESTAMPS = [
    "20231015", "20220428", "20211028", "20210518", "20200128",
    "20191221", "20190804", "20190411", "20180601", "20170601",
    "20160726", "20140719", "20131028", "20121210", "20110518",
    "20101007", "20091008", "20080928", "20070223", "20040914",
]


def download_wayback_url(url, cdx_timestamp, domain, output_dir, delay):
    """Download one URL from Wayback with modifier + timestamp fallback.

    Returns (success, size, timestamp_used, throttled).

    `throttled` exists because archive.org answers 429 under load and fetch_url
    reports that as an ordinary failure — indistinguishable from a 404. The caller
    then recorded it as "all timestamps failed", i.e. a THROTTLED request was
    written down as a permanently dead URL. On amasci that produced 185 "failures"
    against 65 successes and would have condemned thousands of recoverable pages.
    A throttle is a "come back later", never a verdict about the content.
    """
    global _current_delay

    parsed = urllib.parse.urlparse(url)
    path = sanitize_path(url)
    ext = os.path.splitext(parsed.path)[1].lower()
    modifier = get_wayback_modifier(ext)

    # Already on disk (e.g. from a prior live crawl) → nothing to fetch. Without
    # this the backfill re-downloads everything the live pass already got, and
    # 20,440 CDX rows collapse to far fewer distinct local paths anyway.
    existing = os.path.join(output_dir, path)
    if os.path.exists(existing) and os.path.getsize(existing) > 0:
        return True, os.path.getsize(existing), 'on-disk', False

    clean_url = url.replace(':80', '')

    # Build timestamp list: CDX first, then fallbacks
    timestamps = [cdx_timestamp[:8]] if cdx_timestamp else []
    timestamps += [t for t in FALLBACK_TIMESTAMPS if t not in timestamps]

    consecutive_fails = 0
    throttled = False
    cdx_extras_loaded = False
    attempts_made = 0
    # Cap grows once CDX extras are loaded so we can actually try them.
    max_attempts = MAX_TIMESTAMP_ATTEMPTS
    i = 0

    while i < len(timestamps) and attempts_made < max_attempts:
        ts = timestamps[i]
        i += 1
        attempts_made += 1
        wayback_url = f"https://web.archive.org/web/{ts}{modifier}/{clean_url}"
        content, _ct, ok = fetch_url(wayback_url)
        if not ok and isinstance(_ct, str) and 'Rate limited' in _ct:
            # archive.org is asking us to slow down. Record it and stop trying
            # more timestamps for this URL — every further attempt is also 429.
            throttled = True
            break

        if ok and is_valid_content(content, ext):
            # Process HTML
            is_html = ext in ('.html', '.htm', '') or (
                content and b'<html' in content[:500].lower()
            )
            if is_html and ext not in (DOC_EXTS | MEDIA_EXTS | IMAGE_EXTS):
                content_str = strip_wayback_toolbar(content)
                content_str = rewrite_urls(content_str, domain)
                content = content_str.encode('utf-8') if isinstance(content_str, str) else content_str

            local_path = os.path.join(output_dir, path)
            ensure_dir_path(local_path)

            with open(local_path, 'wb') as f:
                f.write(content)

            # Text extraction for HTML
            if is_html and ext not in (DOC_EXTS | MEDIA_EXTS | IMAGE_EXTS):
                text = extract_text(content)
                if text and len(text) > MIN_CONTENT_SIZE:
                    txt_path = local_path.rsplit('.', 1)[0] + '.txt'
                    with open(txt_path, 'w', encoding='utf-8') as f:
                        f.write(text)

            return True, len(content), ts, False

        consecutive_fails += 1
        if consecutive_fails >= CONSECUTIVE_FAIL_BAIL:
            break

        time.sleep(0.2)

        # After exhausting the initial list, do one CDX lookup for ALL known
        # snapshots of this URL and append any we haven't tried yet.
        if i >= len(timestamps) and not cdx_extras_loaded:
            cdx_extras_loaded = True
            try:
                q = f"https://web.archive.org/cdx/search/cdx?url={urllib.parse.quote(clean_url, safe='')}&output=json&fl=timestamp,statuscode&filter=statuscode:200"
                snap_content, _ct, snap_ok = fetch_url(q, timeout=30)
                if snap_ok:
                    snap_data = json.loads(snap_content)
                    known = {t[:8] for t in timestamps}
                    added = 0
                    for row in snap_data[1:]:
                        t8 = row[0][:8]
                        if t8 not in known:
                            timestamps.append(t8)
                            known.add(t8)
                            added += 1
                    if added:
                        # Allow up to 8 more attempts to try the new timestamps.
                        max_attempts += min(added, 8)
                        consecutive_fails = 0
            except Exception:
                pass

    return False, 0, None, throttled


# ── 13. Live download engine ────────────────────────────────────────────────

def download_live_url(url, domain, output_dir):
    """Download a single live URL."""
    path = sanitize_path(url)
    local_path = os.path.join(output_dir, path)

    if os.path.exists(local_path) and os.path.getsize(local_path) > 0:
        return True, os.path.getsize(local_path)

    content, ct, ok = fetch_url(url)
    if not ok or not content:
        return False, 0

    ensure_dir_path(local_path)
    with open(local_path, 'wb') as f:
        f.write(content)

    return True, len(content)


# ── 14. Index & metadata generation ─────────────────────────────────────────

def write_source_info(output_dir, target_url, mode, path_filter=None, label=None,
                      page_title=None, frame_targets=None):
    """Write SOURCE.txt — human-readable provenance file alongside ALLFILES.txt.
    Answers 'what URL was this directory mirrored from, in what mode, when'.
    Idempotent overwrite — last run wins, which matches mirror semantics.
    """
    import datetime
    lines = []
    lines.append(f"target: {target_url}")
    lines.append(f"mode: {mode}")
    if path_filter:
        lines.append(f"path_filter: {path_filter}")
    if label:
        lines.append(f"label: {label}")
    if page_title:
        lines.append(f"title: {page_title}")
    # A frameset whose <frame src> points at another host: the content is NOT
    # here. Record where it actually lives so the mirror can't be mistaken for
    # complete (radiondistics.com → radiondistics.altervista.org).
    for frame_url in (frame_targets or []):
        lines.append(f"frame_target: {frame_url}")
    lines.append(f"mirror_date: {datetime.datetime.utcnow().strftime('%Y-%m-%dT%H:%M:%SZ')}")
    try:
        os.makedirs(output_dir, exist_ok=True)
        with open(os.path.join(output_dir, 'SOURCE.txt'), 'w') as f:
            f.write('\n'.join(lines) + '\n')
    except Exception as e:
        log(f"WARNING: could not write SOURCE.txt: {e}")


def extract_html_title(html_bytes):
    """Best-effort <title> extraction from raw HTML bytes. Returns None if no
    title or unparseable. Doesn't import a full HTML parser — uses a small
    regex against the bytes decoded as utf-8 (with fallback to latin-1)."""
    import re
    try:
        text = html_bytes.decode('utf-8', errors='replace')
    except Exception:
        try:
            text = html_bytes.decode('latin-1', errors='replace')
        except Exception:
            return None
    m = re.search(r'<title[^>]*>(.*?)</title>', text, re.IGNORECASE | re.DOTALL)
    if not m:
        return None
    title = m.group(1).strip()
    # Collapse whitespace
    title = ' '.join(title.split())
    return title[:300] if title else None


def generate_index(output_dir, domain, source='web.archive.org', progress=None):
    """Generate ALLFILES.txt and _meta.json."""
    log("Generating index...")

    all_files = []
    for root, _dirs, files in os.walk(output_dir):
        for fname in files:
            if not fname.startswith('_') and fname not in ('ALLFILES.txt', 'SOURCE.txt', 'error.log'):
                rel = os.path.relpath(os.path.join(root, fname), output_dir)
                all_files.append(rel)

    all_files.sort()
    with open(os.path.join(output_dir, 'ALLFILES.txt'), 'w') as f:
        f.write('\n'.join(all_files) + '\n')

    # File type breakdown
    exts = {}
    for fp in all_files:
        ext = os.path.splitext(fp)[1].lower() or '(none)'
        exts[ext] = exts.get(ext, 0) + 1

    meta = {
        'source': source,
        'domain': domain,
        'mirror_date': datetime.now().isoformat(),
        'total_urls': progress.get('total', 0) if progress else 0,
        'downloaded': len(progress.get('downloaded', [])) if progress else len(all_files),
        'failed': len(progress.get('failed', [])) if progress else 0,
        'files': len(all_files),
        'file_types': exts,
    }

    meta_file = os.path.join(output_dir, '_meta.json')
    with open(meta_file, 'w') as f:
        json.dump(meta, f, indent=2)

    log(f"Index: {len(all_files)} files")
    for ext, count in sorted(exts.items(), key=lambda x: -x[1])[:15]:
        log(f"  {ext}: {count}")

    return meta


# ── 15. Main loop — wayback mode ────────────────────────────────────────────

def run_wayback(domain, resume=False, ts_from=None, ts_to=None, delay=None, output_base=None, dry_run=False, path_filter=None, workers=None):
    """3-phase wayback mirror: CDX discovery -> download -> index."""
    global _current_delay

    base = output_base or ARCHIVE_DIR
    output_dir = os.path.join(base, domain)
    progress_file = os.path.join(output_dir, '_progress.json')
    failed_file = os.path.join(output_dir, '_failed_downloads.txt')

    init_logging(output_dir)

    _current_delay = delay or DEFAULT_WAYBACK_DELAY
    workers = max(1, int(workers or DEFAULT_WAYBACK_WORKERS))

    log("=" * 60)
    log(f"WAYBACK MIRROR: {domain}")
    log(f"Output: {output_dir}")
    log(f"Delay: {_current_delay}s")
    log("=" * 60)

    # Load or init progress
    if resume:
        progress = load_progress(progress_file)
        log(f"Resuming: phase={progress['phase']}, "
            f"{len(progress.get('downloaded', []))} already done")
    else:
        progress = load_progress(progress_file)
        if progress['phase'] != 'init' and not resume:
            # Fresh start requested but progress exists
            log("Previous progress found. Use --resume to continue, or delete _progress.json to restart.")
            log("Continuing from existing progress...")

    # ── Phase 1: CDX Discovery ──
    if progress['phase'] == 'init':
        log("\n=== PHASE 1: URL Discovery ===")

        all_urls = []
        # When a path filter is given, scope the CDX query to that subpath directly.
        # Avoids the 50k per-query cap eating the subpath on large hosts.
        if path_filter:
            sub = path_filter.strip('/')
            url_patterns = [f'{domain}/{sub}/*', f'www.{domain}/{sub}/*']
        else:
            url_patterns = [f'{domain}/*', f'www.{domain}/*']

        for url_pattern in url_patterns:
            log(f"Querying CDX for {url_pattern}...")

            params = {
                'url': url_pattern,
                'output': 'json',
                'collapse': 'urlkey',
                'filter': 'statuscode:200',
                'limit': '50000',
                'fl': 'timestamp,original,mimetype,statuscode,length',
            }
            if ts_from:
                params['from'] = ts_from
            if ts_to:
                params['to'] = ts_to

            query = urllib.parse.urlencode(params)
            cdx_url = f"https://web.archive.org/cdx/search/cdx?{query}"

            content, _ct, ok = fetch_url(cdx_url, timeout=120)
            if not ok:
                log(f"  CDX query failed for {url_pattern}")
                continue

            try:
                data = json.loads(content)
                if len(data) < 2:
                    log(f"  No results for {url_pattern}")
                    continue

                for row in data[1:]:
                    if len(row) >= 4:
                        all_urls.append({
                            'timestamp': row[0],
                            'original': row[1],
                            'mimetype': row[2] if len(row) > 2 else '',
                            'statuscode': row[3] if len(row) > 3 else '',
                            'length': row[4] if len(row) > 4 else '',
                        })

                log(f"  Found {len(data) - 1} URLs for {url_pattern}")
            except json.JSONDecodeError as e:
                log(f"  JSON parse error for {url_pattern}: {e}")

        # Also check root domain
        for root_domain in [domain, f"www.{domain}"]:
            params_root = {
                'url': root_domain,
                'output': 'json',
                'filter': 'statuscode:200',
                'limit': '10',
                'fl': 'timestamp,original,mimetype,statuscode,length',
            }
            query = urllib.parse.urlencode(params_root)
            cdx_url = f"https://web.archive.org/cdx/search/cdx?{query}"
            content, _ct, ok = fetch_url(cdx_url, timeout=60)
            if ok:
                try:
                    data = json.loads(content)
                    for row in data[1:]:
                        if len(row) >= 4:
                            all_urls.append({
                                'timestamp': row[0],
                                'original': row[1],
                                'mimetype': row[2] if len(row) > 2 else '',
                                'statuscode': row[3] if len(row) > 3 else '',
                                'length': row[4] if len(row) > 4 else '',
                            })
                except json.JSONDecodeError:
                    pass

        # Deduplicate by URL, keep latest timestamp
        seen = {}
        for u in all_urls:
            orig = u['original']
            if orig not in seen or u['timestamp'] > seen[orig]['timestamp']:
                seen[orig] = u

        # Filter valid URLs
        valid = [u for u in seen.values() if is_valid_content_url(u['original'], domain)]

        # Apply path filter if specified (e.g. --path /ine/ only keeps URLs with /ine/ in path)
        if path_filter:
            before = len(valid)
            valid = [u for u in valid if path_filter in urllib.parse.urlparse(u['original']).path]
            log(f"Path filter '{path_filter}': {before} -> {len(valid)} URLs")

        log(f"Total unique valid URLs: {len(valid)}")

        if not valid:
            log("ERROR: No URLs found!")
            return

        # Show mimetype breakdown
        mimetypes = {}
        for u in valid:
            mt = u.get('mimetype', 'unknown')
            mimetypes[mt] = mimetypes.get(mt, 0) + 1
        for mt, count in sorted(mimetypes.items(), key=lambda x: -x[1]):
            log(f"  {mt}: {count}")

        progress['urls'] = valid
        progress['phase'] = 'downloading'
        progress['total'] = len(valid)
        save_progress(progress, progress_file)

    if dry_run:
        total = progress.get('total', 0)
        log(f"\n--dry-run: {total} URLs discovered. Exiting without downloading.")
        return

    # ── Phase 2: Download ──
    if progress['phase'] == 'downloading':
        log("\n=== PHASE 2: Downloading ===")

        urls = progress.get('urls', [])
        downloaded = set(progress.get('downloaded', []))
        failed = progress.get('failed', [])

        total = len(urls)
        count = 0
        new_downloads = 0
        start_time = time.time()

        # ── concurrency ───────────────────────────────────────────────────────
        # Wayback replay latency, not our politeness delay, is the wall here.
        # Measured on amasci.com 2026-08-04: 60 URLs in 14m15s = 14.25s per URL
        # with ZERO failures, i.e. one request each — so there is no retry waste
        # to remove, the fetch itself is just slow. Single-threaded, 20,440 URLs
        # projects to ~81 HOURS (3.4 days). At 6 workers it is ~13h.
        #
        # So the download phase is a bounded thread pool. Deliberately modest:
        # this is someone else's archive being read, and hammering it earns 429s
        # and helps nobody. Each worker still sleeps `delay` after its fetch, so
        # the effective request rate is workers/delay, not unbounded.
        # ── drop what cannot be mirrored before spending requests on it ───────
        # CDX discovery returns whatever archive.org recorded a 200 for, which on a
        # WordPress-era site includes the blog's own plumbing: wp-includes/*.php,
        # wp-admin CSS and images, plus server-side endpoints generally. There is no
        # static content behind a .php, and wp-admin assets are not archive material.
        #
        # Measured on amasci.com: 1,890 of 20,440 discovered URLs (9%) are this.
        # They cost MORE than a success, because a miss walks the whole
        # FALLBACK_TIMESTAMPS list before giving up — 45 of the first 79 failures
        # were /amblog/wp-includes alone. Skipping them also keeps
        # _failed_downloads.txt meaningful instead of a wall of WordPress noise.
        def unmirrorable(u):
            parsed = urllib.parse.urlparse(u)
            low = parsed.path.lower()
            base = os.path.basename(low)

            # Server-side endpoints and WordPress plumbing — no static content.
            if any(seg in low for seg in ('/wp-includes/', '/wp-admin/',
                                          '/wp-content/plugins/')):
                return True
            if os.path.splitext(low)[1] in ('.php', '.asp', '.aspx', '.jsp',
                                            '.pl', '.cgi'):
                return True

            # Apache mod_autoindex sort links (?D=A, ?C=S;O=D, ?N=D…) and tracking
            # params. These are the SAME directory listing re-sorted — not content,
            # and each one costs a full FALLBACK_TIMESTAMPS walk before failing.
            if parsed.query:
                return True

            # Apache's own directory-listing icons, not the author's material.
            if '/icons/' in low:
                return True

            # The author's working detritus: editor backups and scratch files that
            # happen to have been served once. amasci has weird.html.save,
            # maglev.html.save, we-nerds.html.save, indexphp.old, temp1, temp2,
            # newsrc. Measured: 13 of the first 91 failures were these.
            if base in ('temp', 'temp1', 'temp2', 'newsrc'):
                return True
            if low.endswith(('.save', '.old', '.bak', '~')):
                return True

            return False

        pending = [u for u in urls if u['original'] not in downloaded]
        skipped_unmirrorable = [u for u in pending if unmirrorable(u['original'])]
        if skipped_unmirrorable:
            pending = [u for u in pending if not unmirrorable(u['original'])]

        # One fetch per OUTPUT FILE. amasci.com/x, www.amasci.com/x and
        # www.amasci.com:80/x all write the same path, so fetching all three is
        # two wasted requests — and on a miss each costs a full timestamp walk.
        # `temp1` failed three times for exactly this reason.
        # Modest in aggregate here (20,440 -> 20,249 distinct paths; CDX had
        # already collapsed most host variants) but it is free and it stops the
        # failure list double-counting one lost file as three.
        seen_keys, deduped = set(), []
        for u in pending:
            k = dedup_key(u['original'])
            if k in seen_keys:
                continue
            seen_keys.add(k)
            deduped.append(u)
        if len(deduped) != len(pending):
            log(f"Collapsed {len(pending) - len(deduped):,} host-variant "
                f"duplicate(s) to one fetch each")
            pending = deduped
            log(f"Skipping {len(skipped_unmirrorable):,} unmirrorable URL(s) "
                f"(server-side / WordPress plumbing) — not fetched, not counted "
                f"as failures")
        count = total - len(pending) - len(skipped_unmirrorable)
        log(f"Downloading {len(pending):,} of {total:,} with {workers} worker(s) "
            f"(delay {_current_delay}s each)")

        lock = threading.Lock()
        last_save = time.time()

        def fetch_one(url_info):
            original = url_info['original']
            try:
                ok, size, ts, thr = download_wayback_url(
                    original, url_info.get('timestamp', ''), domain, output_dir,
                    _current_delay)
            except Exception as e:                      # never let one URL kill the pool
                return original, False, 0, '', repr(e), False
            time.sleep(_current_delay)                  # politeness, per worker
            return original, ok, size, ts, None, thr

        # Retry PASSES rather than one shot. A 429 means "come back later", so a
        # throttled URL stays pending instead of being written down as dead, and
        # each pass backs off further and uses fewer workers. Bounded, so a
        # genuinely-blocked run still terminates and says so.
        MAX_PASSES = 6
        for pass_no in range(1, MAX_PASSES + 1):
            if not pending:
                break
            pass_workers = max(1, workers // (2 ** (pass_no - 1)))
            throttled_again = []
            log(f"--- pass {pass_no}/{MAX_PASSES}: {len(pending):,} URL(s), "
                f"{pass_workers} worker(s) ---")

            with concurrent.futures.ThreadPoolExecutor(max_workers=pass_workers) as pool:
                futures = {pool.submit(fetch_one, ui): ui for ui in pending}
                for fut in concurrent.futures.as_completed(futures):
                    original, ok, size, ts, err, thr = fut.result()
                    with lock:
                        if thr:
                            # Not counted, not failed — retried next pass.
                            throttled_again.append(futures[fut])
                            continue
                        count += 1
                        if ok:
                            downloaded.add(original)
                            new_downloads += 1
                            if new_downloads % 25 == 0:
                                path = sanitize_path(original)
                                log(f"[{count}/{total}] OK {path[:70]} "
                                    f"({size:,}b) @{ts}")
                        else:
                            failed.append({'url': original,
                                           'error': err or 'all timestamps failed'})

                        # Checkpoint on ELAPSED TIME, not on `count` hitting an exact
                        # multiple. With concurrent workers the counter jumps past
                        # multiples, so `count % BATCH_SIZE == 0` fires erratically —
                        # measured on the amasci run: _progress.json went 80 MINUTES
                        # without a save while the crawl was visibly working. Two
                        # costs: the resume point silently rots that far behind, and
                        # anything watching the progress file (a stall detector, a
                        # status pane) reads "no movement" on a healthy crawl.
                        now = time.time()
                        if now - last_save >= SAVE_INTERVAL_S or count % BATCH_SIZE == 0:
                            last_save = now
                            progress['downloaded'] = list(downloaded)
                            progress['failed'] = failed
                            save_progress(progress, progress_file)
                            elapsed = time.time() - start_time
                            rate = count / max(elapsed, 1) * 60
                            pct = count * 100 // max(total, 1)
                            eta_h = ((total - count) / max(rate, 0.01)) / 60
                            log(f"--- Progress: {count}/{total} ({pct}%) | "
                                f"New: {new_downloads} | Fail: {len(failed)} | "
                                f"Throttled-deferred: {len(throttled_again)} | "
                                f"Rate: {rate:.0f}/min | ETA {eta_h:.1f}h ---")

            pending = throttled_again
            if pending:
                backoff = 60 * (2 ** (pass_no - 1))
                log(f"archive.org throttled {len(pending):,} URL(s) — "
                    f"backing off {backoff}s before pass {pass_no + 1}. "
                    f"These are NOT recorded as failures.")
                time.sleep(backoff)

        if pending:
            log(f"WARNING: {len(pending):,} URL(s) still throttled after "
                f"{MAX_PASSES} passes — left PENDING, not marked failed. "
                f"Re-run with --resume later; this crawl is NOT complete.")

        progress['downloaded'] = list(downloaded)
        progress['failed'] = failed
        progress['phase'] = 'complete'
        save_progress(progress, progress_file)

        # Write failed URLs file
        failed_urls = [f.get('url', f) if isinstance(f, dict) else f for f in failed]
        if failed_urls:
            with open(failed_file, 'w') as fout:
                fout.write('\n'.join(failed_urls) + '\n')

    # ── Phase 3: Index ──
    log("\n=== PHASE 3: Generating Index ===")

    # WordPress PDF extraction
    extract_wordpress_pdfs(output_dir, domain)

    progress = load_progress(progress_file)
    # Wayback's "target URL" is the wayback CDX query for the domain.
    write_source_info(output_dir, f"https://web.archive.org/web/*/{domain}/*",
                      'wayback', path_filter=path_filter)
    meta = generate_index(output_dir, domain, progress=progress)

    log("\n" + "=" * 60)
    log("MIRROR COMPLETE")
    log(f"Total URLs: {meta.get('total_urls', '?')}")
    log(f"Downloaded: {meta.get('downloaded', '?')}")
    log(f"Failed: {meta.get('failed', '?')}")
    log(f"Files: {meta.get('files', '?')}")
    log("=" * 60)
    log(f"\nNext step: fe-ingest.sh {output_dir}")


# ── 16. Main loop — live mode ───────────────────────────────────────────────

def run_live(url, seeds_file=None, delay=None, max_pages=None, output_base=None, path_filter=None):
    """Live crawl: download-as-you-go BFS from seed URL(s).

    Priority: download everything under the seed path first, then
    follow outbound links up to MAX_LINK_DEPTH hops away.

    If `path_filter` is set (e.g. `/u/utkin_w_m`), links whose URL path
    does NOT contain that substring are dropped at queueing time. This
    is the difference between "download utkin_w_m's pages" and "spider
    across the whole site from utkin_w_m's outbound links" (the latter
    is what happens without the filter — on samlib.ru that means 300k+
    queued URLs for a single user).
    """
    global _current_delay

    parsed = urllib.parse.urlparse(url)
    domain = parsed.hostname or ''
    seed_path = parsed.path.rstrip('/') or '/'
    base = output_base or ARCHIVE_DIR
    output_dir = os.path.join(base, domain)

    init_logging(output_dir)

    _current_delay = delay or DEFAULT_LIVE_DELAY
    max_depth = MAX_LINK_DEPTH

    log("=" * 60)
    log(f"LIVE MIRROR: {domain}")
    log(f"Seed: {url}")
    log(f"Seed path: {seed_path}")
    log(f"Max link depth: {max_depth}")
    if path_filter:
        log(f"Path filter: '{path_filter}' (links not containing this are dropped)")
    log(f"Output: {output_dir}")
    log("=" * 60)

    # Collect seed URLs. Normalised on the way in so a seed and a discovered link
    # for the same page cannot become two different `seen` keys.
    seed_urls = {normalize_url(url)}
    if seeds_file and os.path.exists(seeds_file):
        with open(seeds_file) as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith('#'):
                    seed_urls.add(normalize_url(line))
        log(f"Loaded {len(seed_urls)} seed URLs")

    # robots.txt Disallow — the site owner asked. amasci.com Disallows /weird2/
    # among 72 rules, and that directory is mailing-list archive full of
    # quoted-printable junk links, so honouring robots also stops the crawler
    # wandering into a link swamp. Set MIRROR_IGNORE_ROBOTS=1 to override.
    robots_disallow = []
    if os.environ.get('MIRROR_IGNORE_ROBOTS') != '1':
        try:
            rb, _ct, rb_ok = fetch_url(
                f"{parsed.scheme or 'http'}://{domain}/robots.txt",
                timeout=20, retries=1)
            if rb_ok and rb:
                text = rb.decode('utf-8', errors='replace') if isinstance(rb, bytes) else rb
                for line in text.splitlines():
                    line = line.strip()
                    if not line or line.startswith('#'):
                        continue
                    k, _, v = line.partition(':')
                    if k.strip().lower() == 'disallow' and v.strip():
                        robots_disallow.append(v.strip())
        except Exception:
            pass
    if robots_disallow:
        log(f"robots.txt: honouring {len(robots_disallow)} Disallow rule(s) "
            f"(MIRROR_IGNORE_ROBOTS=1 to override)")

    def robots_blocked(u):
        if not robots_disallow:
            return False
        p = urllib.parse.urlsplit(u).path or '/'
        return any(p.startswith(d) for d in robots_disallow)

    # BFS queue: (url, depth) — depth 0 = seed path content
    from collections import deque
    queue = deque()
    seen = set()
    downloaded_count = 0
    ok_count = 0
    failed_urls = []
    # Frame targets that live on ANOTHER host. should_skip_url drops them (as
    # it must — they're out of scope for this domain), but silently: a pure
    # frameset site then mirrors as one file and looks fine. Collect them so
    # we can say out loud where the content actually is.
    offsite_frames = set()

    # Explicit seeds get their OWN queue, drained before any discovered link.
    #
    # Why: a discovered link that is_under_seed_path() gets queue.appendleft() as a
    # priority — and on a whole-domain crawl (seed_path == '/') EVERY discovered
    # link qualifies, so each new find is prepended ahead of the seeds that have not
    # been visited yet. The explicit seed list sinks to the back and starves.
    #
    # On amasci.com that inverted the run completely: stats/idbylink2.html is an
    # index of the site's HISTORICAL pages, so BFS flooded the front of the queue
    # with thousands of 404s while the authoritative sitemap seeds waited behind
    # them. Measured: 560 URLs processed → ~70 failures, 2 new files, and
    # known-live sitemap pages (buscards.html, books1.html, devices.txt, eaton.txt,
    # feynexpt.txt — all HTTP 200) not yet reached.
    #
    # A seed came from the owner's own sitemap. It outranks a link scraped off a
    # stats page. Seeds first, discoveries after.
    seed_queue = deque()
    for seed in sorted(seed_urls):
        seed_queue.append((seed, 0))
        seen.add(dedup_key(seed))

    def is_under_seed_path(u):
        """Check if URL is under the seed path."""
        p = urllib.parse.urlparse(u)
        return (p.path or '/').startswith(seed_path)

    def save_page(page_url, content):
        """Save downloaded content to disk."""
        path = sanitize_path(page_url)
        local_path = os.path.join(output_dir, path)
        if os.path.exists(local_path) and os.path.getsize(local_path) > 0:
            return True
        ensure_dir_path(local_path)
        with open(local_path, 'wb') as f:
            f.write(content)
        return True

    log(f"Crawling {seed_path} (download-as-you-go)...")
    if len(seed_queue) > 1:
        log(f"Seed queue: {len(seed_queue)} explicit seed(s) drain before discoveries")

    while seed_queue or queue:
        # Explicit seeds first, then BFS discoveries. See the seed_queue comment.
        page_url, depth = seed_queue.popleft() if seed_queue else queue.popleft()

        # `--max-pages` used to be accepted, advertised in --help with a default of
        # 500, and then never read — so it silently did nothing and anyone tuning it
        # (including me) was tuning air. Now it is a real ceiling, and it says so
        # when it stops rather than looking like a finished crawl.
        if max_pages and downloaded_count >= max_pages:
            log(f"STOPPING: --max-pages {max_pages} reached. "
                f"{len(seed_queue) + len(queue)} URL(s) left unvisited — "
                f"this crawl is NOT complete.")
            break

        if depth > max_depth:
            continue

        # Strip fragments — they're the same page
        page_url = normalize_url(page_url)

        # Skip if already downloaded on disk
        local_path = os.path.join(output_dir, sanitize_path(page_url))
        if os.path.exists(local_path) and os.path.getsize(local_path) > 0:
            ok_count += 1
            downloaded_count += 1
            # Still extract links from cached HTML
            try:
                with open(local_path, 'rb') as f:
                    cached = f.read()
                ct_guess = 'text/html' if local_path.endswith(('.html', '.htm')) else ''
                content, ct, ok = cached, ct_guess, True
            except Exception:
                continue
            # Fall through to link extraction below
        else:
            # Download the page
            content, ct, ok = fetch_url(page_url, timeout=30, retries=1)
            downloaded_count += 1

            if not ok or not content:
                failed_urls.append(page_url)
                if downloaded_count % 20 == 0:
                    log(f"  [{downloaded_count}] {ok_count} OK, {len(failed_urls)} failed, {len(queue)} queued")
                    if failed_urls:
                        log(f"    last fail: {failed_urls[-1]}")
                time.sleep(_current_delay)
                continue

            save_page(page_url, content)
            ok_count += 1

        # Determine label for logging
        under_seed = is_under_seed_path(page_url)
        label = f"d{depth}" if not under_seed else f"d{depth}*"
        if downloaded_count % 5 == 0 or downloaded_count <= 10:
            log(f"  [{downloaded_count} {label}] {page_url}  ({ok_count} OK, {len(queue)} queued)")

        # Update the laptop-side status snapshot on a slightly slower cadence
        # than the log (one write per ~PROGRESS_INTERVAL URLs).
        if downloaded_count % PROGRESS_INTERVAL == 0:
            write_progress_snapshot(domain, url, "live",
                                    downloaded_count, ok_count, len(queue),
                                    page_url, path_filter=path_filter)

        # Extract links from HTML pages
        is_html = (ct and 'html' in ct.lower()) or (not ct and not os.path.splitext(
            urllib.parse.urlparse(page_url).path)[1])
        if is_html:
            try:
                found_links = extract_links(content, page_url)
                for frame_url in extract_frame_targets(content, page_url):
                    if should_skip_url(frame_url, domain):
                        offsite_frames.add(frame_url)
                new_count = 0
                for link in found_links:
                    link = normalize_url(link)
                    lkey = dedup_key(link)
                    if lkey in seen:
                        continue
                    if should_skip_url(link, domain):
                        continue
                    if robots_blocked(link):
                        seen.add(lkey)
                        continue
                    # Path filter: drop links whose path doesn't contain
                    # the filter substring. Marks them as seen too so we
                    # don't re-evaluate them on every page that links to
                    # them. Without this, the BFS spiders across the
                    # whole site (this is the samlib.ru 327k-URL bug).
                    if path_filter:
                        link_path = urllib.parse.urlparse(link).path
                        if path_filter not in link_path:
                            seen.add(lkey)
                            continue
                    seen.add(lkey)

                    # Links under seed path stay at same depth (priority)
                    if is_under_seed_path(link):
                        queue.appendleft((link, depth))
                    else:
                        queue.append((link, depth + 1))
                    new_count += 1
                if new_count > 0 and (downloaded_count <= 10 or downloaded_count % 10 == 0):
                    log(f"    +{new_count} links ({len(seen)} total known)")
            except Exception:
                pass

        time.sleep(_current_delay)

    # Post-crawl
    extract_wordpress_pdfs(output_dir, domain)

    # Try to extract a page title from the seed URL's downloaded HTML so the
    # PR description (and SOURCE.txt) can show something more human than the
    # URL. Best-effort — silent on failure.
    seed_title = None
    try:
        seed_local = os.path.join(output_dir, sanitize_path(url))
        if os.path.exists(seed_local) and os.path.getsize(seed_local) > 0:
            with open(seed_local, 'rb') as f:
                seed_title = extract_html_title(f.read(200_000))
    except Exception:
        pass

    write_source_info(output_dir, url, 'live', path_filter=path_filter,
                      page_title=seed_title, frame_targets=sorted(offsite_frames))
    generate_index(output_dir, domain, source='live')

    log("\n" + "=" * 60)
    log("LIVE MIRROR COMPLETE")
    log(f"Downloaded: {downloaded_count}, OK: {ok_count}, Failed: {len(failed_urls)}")
    log(f"Total URLs seen: {len(seen)}")
    if offsite_frames:
        log("-" * 60)
        log(f"FRAMESET: this site's content is framed in from {len(offsite_frames)} "
            f"off-domain target(s) — NOT included in this mirror:")
        for frame_url in sorted(offsite_frames):
            log(f"  → {frame_url}")
        log("Queue those hosts as their own mirror jobs to capture the content.")
    log("=" * 60)
    log(f"\nNext step: fe-ingest.sh {output_dir}")


# ── 17. Status command ──────────────────────────────────────────────────────

def run_status(domain, output_base=None):
    """Show mirror progress for a domain."""
    base = output_base or ARCHIVE_DIR
    output_dir = os.path.join(base, domain)
    progress_file = os.path.join(output_dir, '_progress.json')
    meta_file = os.path.join(output_dir, '_meta.json')

    if not os.path.exists(output_dir):
        print(f"No mirror found for {domain}")
        return

    print(f"Mirror status: {domain}")
    print(f"Directory: {output_dir}")
    print()

    if os.path.exists(progress_file):
        with open(progress_file) as f:
            progress = json.load(f)
        phase = progress.get('phase', 'unknown')
        total = progress.get('total', 0)
        dl = len(progress.get('downloaded', []))
        fl = len(progress.get('failed', []))
        print(f"Phase: {phase}")
        print(f"Total URLs: {total}")
        print(f"Downloaded: {dl}")
        print(f"Failed: {fl}")
        if total > 0:
            print(f"Progress: {dl * 100 // total}%")
    else:
        print("No progress file found")

    if os.path.exists(meta_file):
        with open(meta_file) as f:
            meta = json.load(f)
        print(f"\nFiles: {meta.get('files', '?')}")
        ft = meta.get('file_types', {})
        if ft:
            print("File types:")
            for ext, count in sorted(ft.items(), key=lambda x: -x[1])[:10]:
                print(f"  {ext}: {count}")

    # Count actual files
    file_count = 0
    for _root, _dirs, files in os.walk(output_dir):
        file_count += len([f for f in files if not f.startswith('_')])
    print(f"\nActual files on disk: {file_count}")


# ── 17b. Dropbox mode ─────────────────────────────────────────────────────

def extract_dropbox_id(url):
    """Extract folder/file ID from a Dropbox shared URL."""
    # https://www.dropbox.com/scl/fo/FOLDER_ID/...
    m = re.search(r'dropbox\.com/scl/fo/([a-zA-Z0-9_-]+)', url)
    if m:
        return m.group(1), 'folder'
    # https://www.dropbox.com/scl/fi/FILE_ID/...
    m = re.search(r'dropbox\.com/scl/fi/([a-zA-Z0-9_-]+)', url)
    if m:
        return m.group(1), 'file'
    # Legacy: https://www.dropbox.com/sh/HASH/...
    m = re.search(r'dropbox\.com/sh/([a-zA-Z0-9_-]+)', url)
    if m:
        return m.group(1), 'folder'
    # Legacy: https://www.dropbox.com/s/HASH/filename
    m = re.search(r'dropbox\.com/s/([a-zA-Z0-9_-]+)', url)
    if m:
        return m.group(1), 'file'
    return None, None


def run_dropbox(url, output_base=None, label=None):
    """Download a Dropbox shared folder or file."""
    dropbox_id, item_type = extract_dropbox_id(url)
    if not dropbox_id:
        log(f"ERROR: Could not extract Dropbox ID from: {url}")
        sys.exit(1)

    domain = label if label else f"dropbox-{dropbox_id}"
    base = output_base or ARCHIVE_DIR
    output_dir = os.path.join(base, domain)
    os.makedirs(output_dir, exist_ok=True)

    log(f"Dropbox download: {item_type} {dropbox_id}")
    log(f"Output: {output_dir}")

    # Force direct download: set dl=1
    # Remove existing dl= parameter and add dl=1
    dl_url = re.sub(r'[?&]dl=[01]', '', url)
    separator = '&' if '?' in dl_url else '?'
    dl_url = f"{dl_url}{separator}dl=1"

    zip_path = os.path.join(output_dir, '_dropbox_download.zip')

    # Download with curl
    cmd = [
        'curl', '-L', '-o', zip_path,
        '--max-time', '3600',
        '--retry', '3',
        '--retry-delay', '5',
        '-#',  # progress bar
        dl_url,
    ]
    log(f"Running: curl -L -o {zip_path} ... (URL truncated)")

    result = subprocess.run(cmd, capture_output=False)
    if result.returncode != 0:
        log(f"ERROR: curl exited with code {result.returncode}")
        sys.exit(1)

    # Check if we got a ZIP file
    if not os.path.isfile(zip_path) or os.path.getsize(zip_path) < 100:
        log("ERROR: Download too small or missing — may need authentication")
        sys.exit(1)

    # Check if it's actually a ZIP
    with open(zip_path, 'rb') as f:
        magic = f.read(4)

    if magic[:2] == b'PK':
        # It's a ZIP — extract it
        log(f"Extracting ZIP ({os.path.getsize(zip_path)} bytes)...")
        import zipfile
        with zipfile.ZipFile(zip_path, 'r') as zf:
            zf.extractall(output_dir)
        os.remove(zip_path)
        log("ZIP extracted and removed.")
    else:
        # Single file download (not zipped) — rename from .zip
        # Try to figure out the real filename from content-disposition or URL
        log("Download is not a ZIP — keeping as single file.")
        # Try to extract filename from URL
        from urllib.parse import urlparse, unquote
        parsed = urlparse(url)
        path_parts = parsed.path.rstrip('/').split('/')
        if path_parts:
            real_name = unquote(path_parts[-1])
            if real_name and real_name != dropbox_id:
                real_path = os.path.join(output_dir, real_name)
                os.rename(zip_path, real_path)
                log(f"Saved as: {real_name}")
            else:
                log(f"Saved as: _dropbox_download.zip (could not determine filename)")

    # Generate index
    write_source_info(output_dir, url, 'dropbox', label=label)
    generate_index(output_dir, domain, source='dropbox.com')

    log(f"Done: {domain}")


# ── 17c. Google Drive mode ────────────────────────────────────────────────

def extract_gdrive_id(url):
    """Extract file/folder ID from a Google Drive URL."""
    # https://drive.google.com/drive/folders/FOLDER_ID
    m = re.search(r'drive\.google\.com/drive/folders/([a-zA-Z0-9_-]+)', url)
    if m:
        return m.group(1), 'folder'
    # https://drive.google.com/file/d/FILE_ID
    m = re.search(r'drive\.google\.com/file/d/([a-zA-Z0-9_-]+)', url)
    if m:
        return m.group(1), 'file'
    # https://drive.google.com/open?id=ID
    m = re.search(r'drive\.google\.com.*[?&]id=([a-zA-Z0-9_-]+)', url)
    if m:
        return m.group(1), 'file'
    return None, None


def find_gdown():
    """Find gdown executable."""
    gdown_path = shutil.which('gdown')
    if gdown_path:
        return gdown_path
    # Common pipx location
    candidates = [
        os.path.expanduser('~/.local/bin/gdown'),
        os.path.expanduser('~/Library/Python/3.9/bin/gdown'),
        '/opt/homebrew/bin/gdown',
    ]
    for c in candidates:
        if os.path.isfile(c) and os.access(c, os.X_OK):
            return c
    return None


def _gdrive_curl_download(file_id, dest_path):
    """Download a single Google Drive file by ID.

    When GDRIVE_API_KEY is set, use the authenticated Drive v3 media endpoint
    (`files/{id}?alt=media&key=...`). This bypasses the public-share virus-scan
    HTML interstitial that blocks files >100MB on the legacy uc?export=download
    endpoint — exactly the case where mp4/mp3 archives fail silently with the
    HTML guard below. Fall back to the legacy endpoint when no API key is set.
    """
    api_key = os.environ.get('GDRIVE_API_KEY')
    if api_key:
        url = f"https://www.googleapis.com/drive/v3/files/{file_id}?alt=media&key={api_key}"
    else:
        url = f"https://drive.google.com/uc?export=download&id={file_id}&confirm=t"
    try:
        result = subprocess.run(
            ['curl', '-sL', '-o', dest_path, url],
            capture_output=True, timeout=600,
        )
        if result.returncode != 0:
            return False
        # Verify it's not an HTML error page (legacy endpoint can still return
        # the virus-scan interstitial; the API endpoint can return a JSON error).
        if os.path.exists(dest_path) and os.path.getsize(dest_path) > 0:
            with open(dest_path, 'rb') as f:
                header = f.read(16)
            if header.startswith(b'<!') or header.startswith(b'<html') or header.startswith(b'{\n  "error"') or header.startswith(b'{"error"'):
                os.remove(dest_path)
                return False
            return True
    except Exception:
        pass
    return False


def _gdrive_rescue_missing(output_dir, gdown_output):
    """After gdown finishes, find files it listed but failed to download, retry with curl.

    gdown prints 'Processing file <ID> <filename>' for each file.
    We check which of those files actually exist on disk and retry missing ones.
    """
    # Parse all "Processing file <id> <name>" lines from gdown output
    listed_files = []
    for line in gdown_output.splitlines():
        m = re.match(r'Processing file (\S+)\s+(.+)', line)
        if m:
            listed_files.append((m.group(1), m.group(2)))

    if not listed_files:
        return 0

    # Find which files are missing from disk (search recursively)
    existing_files = set()
    for root, dirs, files in os.walk(output_dir):
        for f in files:
            existing_files.add(f)

    missing = [(fid, fname) for fid, fname in listed_files if fname not in existing_files]

    if not missing:
        log(f"All {len(listed_files)} listed files are present on disk")
        return 0

    log(f"Rescuing {len(missing)} files that gdown failed to download...")

    # Determine the deepest content directory (where PDFs should go)
    # Walk to find where most files already exist
    rescue_dir = output_dir
    for root, dirs, files in os.walk(output_dir):
        if len(files) > 5:
            rescue_dir = root
            break

    rescued = 0
    for i, (fid, fname) in enumerate(missing, 1):
        dest = os.path.join(rescue_dir, fname)
        if os.path.exists(dest):
            continue
        log(f"  [{i}/{len(missing)}] Downloading: {fname}")
        if _gdrive_curl_download(fid, dest):
            size_kb = os.path.getsize(dest) // 1024
            log(f"    OK ({size_kb}KB)")
            rescued += 1
        else:
            log(f"    FAILED — could not retrieve {fname} (ID: {fid})")

    log(f"Rescue complete: {rescued}/{len(missing)} recovered")
    return rescued


def _gdrive_api_list_folder(folder_id, api_key):
    """List ALL files in a Google Drive folder using the API v3. No 50-file limit."""
    all_items = []
    page_token = None

    while True:
        params = {
            'q': f"'{folder_id}' in parents and trashed = false",
            'key': api_key,
            'pageSize': '1000',
            'fields': 'nextPageToken,files(id,name,mimeType,size)',
        }
        if page_token:
            params['pageToken'] = page_token

        query = urllib.parse.urlencode(params)
        url = f"https://www.googleapis.com/drive/v3/files?{query}"
        req = urllib.request.Request(url)
        resp = urllib.request.urlopen(req, timeout=30)
        data = json.loads(resp.read().decode('utf-8'))

        for item in data.get('files', []):
            all_items.append({
                'id': item['id'],
                'name': item['name'],
                'mime': item['mimeType'],
                'size': int(item.get('size', 0)),
                'is_folder': item['mimeType'] == 'application/vnd.google-apps.folder',
            })

        page_token = data.get('nextPageToken')
        if not page_token:
            break

    return all_items


def _gdrive_api_list_recursive(folder_id, api_key, path='', depth=0):
    """Recursively list all files in a folder tree using the Google Drive API."""
    items = _gdrive_api_list_folder(folder_id, api_key)
    indent = '  ' * depth
    log(f"{indent}Found {len(items)} items in folder")

    all_files = []
    for item in items:
        full_path = os.path.join(path, item['name']) if path else item['name']

        if item['is_folder']:
            log(f"{indent}  Entering: {item['name']}/")
            sub = _gdrive_api_list_recursive(item['id'], api_key, full_path, depth + 1)
            all_files.extend(sub)
        else:
            all_files.append({
                'id': item['id'],
                'name': item['name'],
                'path': full_path,
                'size': item.get('size', 0),
            })

    return all_files


def _gdrive_api_download_all(files, output_dir):
    """Download all listed files via curl, preserving folder structure."""
    total = len(files)
    ok = 0
    failed = []

    for i, f in enumerate(files, 1):
        dest = os.path.join(output_dir, f['path'])
        os.makedirs(os.path.dirname(dest), exist_ok=True)

        if os.path.exists(dest) and os.path.getsize(dest) > 0:
            ok += 1
            continue

        size_str = f" ({f['size'] // 1024}KB)" if f.get('size') else ''
        log(f"  [{i}/{total}] {f['name']}{size_str}")

        if _gdrive_curl_download(f['id'], dest):
            actual_kb = os.path.getsize(dest) // 1024
            log(f"    OK ({actual_kb}KB)")
            ok += 1
        else:
            log(f"    FAILED — {f['name']} (ID: {f['id']})")
            failed.append(f)

    log(f"Download complete: {ok}/{total}")
    if failed:
        log(f"Failed: {len(failed)} files")
        failed_path = os.path.join(output_dir, '_failed_downloads.txt')
        with open(failed_path, 'w') as fp:
            for f in failed:
                fp.write(f"{f['id']}\t{f['path']}\n")
        log(f"Failed list written to: {failed_path}")

    return failed


def run_gdrive(url, output_base=None, label=None):
    """Download a Google Drive file or folder.

    Strategy:
      1. If GDRIVE_API_KEY is set: use Google Drive API for complete listing + curl downloads
         (no 50-file limit, no gdown dependency)
      2. Otherwise: use gdown + curl rescue pass (limited to ~50 files per folder level)
    """
    gdrive_id, item_type = extract_gdrive_id(url)
    if not gdrive_id:
        log(f"ERROR: Could not extract Google Drive ID from: {url}")
        sys.exit(1)

    domain = label if label else f"gdrive-{gdrive_id}"
    base = output_base or ARCHIVE_DIR
    output_dir = os.path.join(base, domain)
    os.makedirs(output_dir, exist_ok=True)

    log(f"Google Drive download: {item_type} {gdrive_id}")
    log(f"Output: {output_dir}")

    api_key = os.environ.get('GDRIVE_API_KEY')

    # ── Strategy 1: API + curl (complete, reliable) ──
    if api_key and item_type == 'folder':
        log("Using Google Drive API for complete folder listing")
        try:
            all_files = _gdrive_api_list_recursive(gdrive_id, api_key)
            log(f"Total files found: {len(all_files)}")
            _gdrive_api_download_all(all_files, output_dir)
            write_source_info(output_dir, url, 'gdrive', label=label)
            generate_index(output_dir, domain, source='drive.google.com')
            log(f"Done: {domain}")
            return
        except Exception as e:
            log(f"WARNING: API listing failed ({e}), falling back to gdown")

    # ── Strategy 2: gdown + curl rescue (fallback, 50-file cap) ──
    gdown_path = find_gdown()
    if not gdown_path:
        log("ERROR: gdown not found and no GDRIVE_API_KEY set.")
        log("Either: pip install gdown  OR  set GDRIVE_API_KEY env var")
        sys.exit(1)

    if not api_key:
        log("WARNING: No GDRIVE_API_KEY set — gdown is limited to ~50 files per folder.")
        log("For complete downloads, set GDRIVE_API_KEY (free from Google Cloud Console).")

    # Build gdown command — capture output so we can parse file listings
    cmd = [gdown_path, url, '-O', output_dir + '/', '--fuzzy', '--continue']
    if item_type == 'folder':
        cmd.append('--folder')
        cmd.append('--remaining-ok')

    log(f"Running: {' '.join(cmd)}")

    # Run gdown with retries (it skips already-downloaded files on each retry)
    max_retries = 3
    gdown_output = ''
    for attempt in range(1, max_retries + 1):
        process = subprocess.Popen(
            cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
            text=True, bufsize=1,
        )
        attempt_lines = []
        for line in process.stdout:
            print(line, end='', flush=True)
            attempt_lines.append(line)
        process.wait()
        gdown_output += ''.join(attempt_lines)

        if process.returncode == 0:
            break
        log(f"WARNING: gdown attempt {attempt}/{max_retries} exited with code {process.returncode}")
        if attempt < max_retries:
            log("Retrying (gdown will skip already-downloaded files)...")

    # Rescue any files gdown listed but failed to download
    if item_type == 'folder':
        _gdrive_rescue_missing(output_dir, gdown_output)

    # Generate index
    generate_index(output_dir, domain, source='drive.google.com')

    log(f"Done: {domain}")


# ── 18. CLI ─────────────────────────────────────────────────────────────────

def parse_wayback_url(url):
    """Extract domain from a web.archive.org URL.

    Handles formats like:
      https://web.archive.org/web/20081104000746/http://tesla.hu/
      https://web.archive.org/web/20220428030850/https://www.cheniere.org/
      https://web.archive.org/web/*/riess.org
    Returns (domain, timestamp_or_None).
    """
    m = re.match(
        r'https?://web\.archive\.org/web/(\d+|\*)[^/]*/(?:https?://)?(?:www\.)?([^/]+)',
        url,
    )
    if m:
        ts = m.group(1) if m.group(1) != '*' else None
        domain = m.group(2).rstrip('/')
        return domain, ts
    return None, None


def auto_detect(arg):
    """Detect mode from the first positional argument.

    Returns (mode, parsed_info) where parsed_info is a dict.
    """
    # web.archive.org URL -> wayback
    if 'web.archive.org' in arg:
        domain, ts = parse_wayback_url(arg)
        if domain:
            return 'wayback', {'domain': domain, 'ts_from': ts[:8] if ts else None}
        return None, {}

    # Google Drive URL -> gdrive
    if 'drive.google.com' in arg:
        return 'gdrive', {'url': arg}

    # Dropbox URL -> dropbox
    if 'dropbox.com' in arg:
        return 'dropbox', {'url': arg}

    # Bare domain (no protocol, has a dot, no slashes)
    if '/' not in arg and '.' in arg and not arg.startswith('http'):
        return 'wayback', {'domain': arg}

    # Full URL with protocol -> live
    if arg.startswith('http://') or arg.startswith('https://'):
        return 'live', {'url': arg}

    return None, {}


def main():
    # ── Smart auto-detect: if first arg isn't a subcommand, figure it out ──
    subcommands = {'wayback', 'live', 'gdrive', 'dropbox', 'status'}
    if len(sys.argv) > 1 and sys.argv[1] not in subcommands and sys.argv[1] not in ('-h', '--help'):
        first = sys.argv[1]
        mode, info = auto_detect(first)
        if mode == 'wayback':
            # Rebuild argv as: prog wayback DOMAIN [remaining flags]
            new_argv = [sys.argv[0], 'wayback', info['domain']]
            if info.get('ts_from'):
                new_argv += ['--from', info['ts_from']]
            new_argv += sys.argv[2:]  # pass through --resume, --delay, etc.
            sys.argv = new_argv
        elif mode == 'live':
            new_argv = [sys.argv[0], 'live', info['url']] + sys.argv[2:]
            sys.argv = new_argv
        elif mode == 'gdrive':
            new_argv = [sys.argv[0], 'gdrive', info['url']] + sys.argv[2:]
            sys.argv = new_argv
        elif mode == 'dropbox':
            new_argv = [sys.argv[0], 'dropbox', info['url']] + sys.argv[2:]
            sys.argv = new_argv
        # else: fall through to argparse which will show usage

    parser = argparse.ArgumentParser(
        description="Unified Mirror Engine — wayback + live modes",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""Examples:
  %(prog)s wayback riess.org
  %(prog)s wayback riess.org --resume
  %(prog)s wayback cheniere.org --from 20200101 --to 20221231
  %(prog)s live https://example.com --delay 0.5
  %(prog)s gdrive https://drive.google.com/drive/folders/FOLDER_ID
  %(prog)s dropbox https://www.dropbox.com/scl/fo/FOLDER_ID/...
  %(prog)s status riess.org

Smart mode (auto-detects):
  %(prog)s riess.org                          -> wayback riess.org
  %(prog)s https://example.com                -> live https://example.com
  %(prog)s https://web.archive.org/web/2022/https://foo.org/  -> wayback foo.org
  %(prog)s https://drive.google.com/drive/folders/ID  -> gdrive
  %(prog)s https://www.dropbox.com/scl/fo/ID/...     -> dropbox
""",
    )
    parser.add_argument('--version', action='version', version=f'%(prog)s {VERSION}')

    sub = parser.add_subparsers(dest='mode', required=True)

    # wayback
    wb = sub.add_parser('wayback', help='Mirror from Wayback Machine')
    wb.add_argument('domain', help='Domain to mirror (e.g. riess.org)')
    wb.add_argument('--resume', action='store_true', help='Resume interrupted download')
    wb.add_argument('--from', dest='ts_from', help='Start timestamp (YYYYMMDD)')
    wb.add_argument('--to', dest='ts_to', help='End timestamp (YYYYMMDD)')
    wb.add_argument('--delay', type=float, help=f'Delay between requests (default: {DEFAULT_WAYBACK_DELAY}s)')
    wb.add_argument('--dry-run', action='store_true', help='Run CDX discovery only, show URL count without downloading')
    wb.add_argument('--output-dir', dest='output_dir', help='Override output base directory')
    wb.add_argument('--path', dest='path_filter', help='Only download URLs containing this path (e.g. /ine/)')
    wb.add_argument('--workers', type=int, default=None, help=f'Concurrent Wayback fetches (default: {DEFAULT_WAYBACK_WORKERS}). Wayback replay is ~13s/URL, so this is the only real speed lever.')

    # live
    lv = sub.add_parser('live', help='Live crawl a website')
    lv.add_argument('url', help='Seed URL to crawl')
    lv.add_argument('--seeds', help='File with additional seed URLs')
    lv.add_argument('--delay', type=float, help=f'Delay between requests (default: {DEFAULT_LIVE_DELAY}s)')
    lv.add_argument('--max-pages', type=int, help=f'Max pages to crawl for link discovery (default: {MAX_DISCOVER_PAGES})')
    lv.add_argument('--output-dir', dest='output_dir', help='Override output base directory')
    lv.add_argument('--path', dest='path_filter', help='Only follow links containing this path substring (e.g. /u/utkin_w_m). Without it, BFS spiders across the whole domain via outbound links — on community sites that means 100k+ URLs from one seed.')

    # gdrive
    gd = sub.add_parser('gdrive', help='Download from Google Drive')
    gd.add_argument('url', help='Google Drive folder or file URL')
    gd.add_argument('--label', help='Custom directory name (instead of gdrive-ID)')
    gd.add_argument('--output-dir', dest='output_dir', help='Override output base directory')

    # dropbox
    db = sub.add_parser('dropbox', help='Download from Dropbox shared link')
    db.add_argument('url', help='Dropbox shared folder or file URL')
    db.add_argument('--label', help='Custom directory name (instead of dropbox-ID)')
    db.add_argument('--output-dir', dest='output_dir', help='Override output base directory')

    # status
    st = sub.add_parser('status', help='Show mirror progress')
    st.add_argument('domain', help='Domain to check')
    st.add_argument('--output-dir', dest='output_dir', help='Override output base directory')

    args = parser.parse_args()

    output_base = os.path.expanduser(args.output_dir) if getattr(args, 'output_dir', None) else None

    if args.mode == 'wayback':
        run_wayback(args.domain, resume=args.resume,
                    ts_from=args.ts_from, ts_to=args.ts_to, delay=args.delay,
                    output_base=output_base, dry_run=getattr(args, 'dry_run', False),
                    path_filter=getattr(args, 'path_filter', None),
                    workers=getattr(args, 'workers', None))
    elif args.mode == 'live':
        run_live(args.url, seeds_file=args.seeds, delay=args.delay,
                 max_pages=args.max_pages, output_base=output_base,
                 path_filter=getattr(args, 'path_filter', None))
    elif args.mode == 'gdrive':
        run_gdrive(args.url, output_base=output_base, label=getattr(args, 'label', None))
    elif args.mode == 'dropbox':
        run_dropbox(args.url, output_base=output_base, label=getattr(args, 'label', None))
    elif args.mode == 'status':
        run_status(args.domain, output_base=output_base)


if __name__ == '__main__':
    main()
