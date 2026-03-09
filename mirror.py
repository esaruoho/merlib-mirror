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

import os
import re
import sys
import json
import time
import shutil
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
MAX_LINK_DEPTH = 5
BATCH_SIZE = 50
BATCH_PAUSE = 10
MAX_TIMESTAMP_ATTEMPTS = 8
CONSECUTIVE_FAIL_BAIL = 8
MIN_CONTENT_SIZE = 50

VERSION = "1.0.0"

USER_AGENT = f"mirror.py/{VERSION} (https://github.com/esaruoho/merlib-dump)"

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

        if href and not href.startswith(('#', 'javascript:', 'mailto:', 'data:')):
            full = urllib.parse.urljoin(self.base_url, href)
            self.links.add(full)


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
        links = {l for l in links if not l.startswith(('javascript:', 'mailto:', 'data:', '#'))}
        return links

    # Fallback: stdlib HTMLParser
    extractor = _LinkExtractorHTML(base_url)
    extractor.feed(text)
    return extractor.links


def should_skip_url(url, domain):
    """Skip URLs that don't belong to the target domain or are junk."""
    parsed = urllib.parse.urlparse(url)
    host = parsed.hostname or ''
    if domain not in host:
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

    Returns (success, size, timestamp_used).
    """
    global _current_delay

    parsed = urllib.parse.urlparse(url)
    path = sanitize_path(url)
    ext = os.path.splitext(parsed.path)[1].lower()
    modifier = get_wayback_modifier(ext)

    clean_url = url.replace(':80', '')

    # Build timestamp list: CDX first, then fallbacks
    timestamps = [cdx_timestamp[:8]] if cdx_timestamp else []
    timestamps += [t for t in FALLBACK_TIMESTAMPS if t not in timestamps]

    consecutive_fails = 0

    for ts in timestamps[:MAX_TIMESTAMP_ATTEMPTS]:
        wayback_url = f"https://web.archive.org/web/{ts}{modifier}/{clean_url}"
        content, _ct, ok = fetch_url(wayback_url)

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

            return True, len(content), ts

        consecutive_fails += 1
        if consecutive_fails >= CONSECUTIVE_FAIL_BAIL:
            break

        time.sleep(0.2)

    return False, 0, None


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

def generate_index(output_dir, domain, source='web.archive.org', progress=None):
    """Generate ALLFILES.txt and _meta.json."""
    log("Generating index...")

    all_files = []
    for root, _dirs, files in os.walk(output_dir):
        for fname in files:
            if not fname.startswith('_') and fname != 'ALLFILES.txt':
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

def run_wayback(domain, resume=False, ts_from=None, ts_to=None, delay=None, output_base=None, dry_run=False, path_filter=None):
    """3-phase wayback mirror: CDX discovery -> download -> index."""
    global _current_delay

    base = output_base or ARCHIVE_DIR
    output_dir = os.path.join(base, domain)
    progress_file = os.path.join(output_dir, '_progress.json')
    failed_file = os.path.join(output_dir, '_failed_downloads.txt')

    init_logging(output_dir)

    _current_delay = delay or DEFAULT_WAYBACK_DELAY

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
        for query_domain in [domain, f"www.{domain}"]:
            log(f"Querying CDX for {query_domain}...")

            params = {
                'url': f'{query_domain}/*',
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
                log(f"  CDX query failed for {query_domain}")
                continue

            try:
                data = json.loads(content)
                if len(data) < 2:
                    log(f"  No results for {query_domain}")
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

                log(f"  Found {len(data) - 1} URLs for {query_domain}")
            except json.JSONDecodeError as e:
                log(f"  JSON parse error for {query_domain}: {e}")

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

        for url_info in urls:
            original = url_info['original']

            if original in downloaded:
                count += 1
                continue

            success, size, ts = download_wayback_url(
                original, url_info.get('timestamp', ''), domain, output_dir, _current_delay
            )

            if success:
                downloaded.add(original)
                new_downloads += 1
                if new_downloads % 10 == 0:
                    path = sanitize_path(original)
                    log(f"[{count+1}/{total}] OK {path[:70]} ({size:,}b) @{ts}")
            else:
                failed.append({'url': original, 'error': 'all timestamps failed'})
                log(f"[{count+1}/{total}] FAIL {original[:70]}")

            count += 1
            time.sleep(_current_delay)

            # Batch pause + atomic save
            if count % BATCH_SIZE == 0:
                progress['downloaded'] = list(downloaded)
                progress['failed'] = failed
                save_progress(progress, progress_file)
                elapsed = time.time() - start_time
                rate = count / max(elapsed, 1) * 60
                pct = count * 100 // max(total, 1)
                log(f"--- Progress: {count}/{total} ({pct}%) | New: {new_downloads} | Rate: {rate:.0f}/min ---")
                time.sleep(BATCH_PAUSE)

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

def run_live(url, seeds_file=None, delay=None, max_pages=None, output_base=None):
    """Live crawl: download-as-you-go BFS from seed URL(s).

    Priority: download everything under the seed path first, then
    follow outbound links up to MAX_LINK_DEPTH hops away.
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
    log(f"Output: {output_dir}")
    log("=" * 60)

    # Collect seed URLs
    seed_urls = {url}
    if seeds_file and os.path.exists(seeds_file):
        with open(seeds_file) as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith('#'):
                    seed_urls.add(line)
        log(f"Loaded {len(seed_urls)} seed URLs")

    # BFS queue: (url, depth) — depth 0 = seed path content
    from collections import deque
    queue = deque()
    seen = set()
    downloaded_count = 0
    ok_count = 0
    failed_urls = []

    for seed in seed_urls:
        queue.append((seed, 0))
        seen.add(seed)

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

    while queue:
        page_url, depth = queue.popleft()

        if depth > max_depth:
            continue

        # Strip fragments — they're the same page
        original = page_url
        page_url = urllib.parse.urldefrag(page_url)[0]
        if page_url != original and page_url in seen:  # dedup only if defrag changed the URL
            continue

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

        # Extract links from HTML pages
        is_html = (ct and 'html' in ct.lower()) or (not ct and not os.path.splitext(
            urllib.parse.urlparse(page_url).path)[1])
        if is_html:
            try:
                found_links = extract_links(content, page_url)
                new_count = 0
                for link in found_links:
                    link = urllib.parse.urldefrag(link)[0]
                    if link in seen:
                        continue
                    if should_skip_url(link, domain):
                        continue
                    seen.add(link)

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
    generate_index(output_dir, domain, source='live')

    log("\n" + "=" * 60)
    log("LIVE MIRROR COMPLETE")
    log(f"Downloaded: {downloaded_count}, OK: {ok_count}, Failed: {len(failed_urls)}")
    log(f"Total URLs seen: {len(seen)}")
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


# ── 17b. Google Drive mode ────────────────────────────────────────────────

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
        '/opt/homebrew/bin/gdown',
    ]
    for c in candidates:
        if os.path.isfile(c) and os.access(c, os.X_OK):
            return c
    return None


def run_gdrive(url, output_base=None, label=None):
    """Download a Google Drive file or folder using gdown."""
    gdown_path = find_gdown()
    if not gdown_path:
        log("ERROR: gdown not found. Install with: pipx install gdown")
        sys.exit(1)

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

    # Build gdown command
    cmd = [gdown_path, url, '-O', output_dir + '/', '--fuzzy', '--continue']
    if item_type == 'folder':
        cmd.append('--folder')
        # --remaining-ok: don't fail if some files can't be downloaded
        cmd.append('--remaining-ok')

    log(f"Running: {' '.join(cmd)}")

    result = subprocess.run(cmd, capture_output=False)

    if result.returncode != 0:
        log(f"WARNING: gdown exited with code {result.returncode}")

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

    # Bare domain (no protocol, has a dot, no slashes)
    if '/' not in arg and '.' in arg and not arg.startswith('http'):
        return 'wayback', {'domain': arg}

    # Full URL with protocol -> live
    if arg.startswith('http://') or arg.startswith('https://'):
        return 'live', {'url': arg}

    return None, {}


def main():
    # ── Smart auto-detect: if first arg isn't a subcommand, figure it out ──
    subcommands = {'wayback', 'live', 'gdrive', 'status'}
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
  %(prog)s status riess.org

Smart mode (auto-detects):
  %(prog)s riess.org                          -> wayback riess.org
  %(prog)s https://example.com                -> live https://example.com
  %(prog)s https://web.archive.org/web/2022/https://foo.org/  -> wayback foo.org
  %(prog)s https://drive.google.com/drive/folders/ID  -> gdrive
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

    # live
    lv = sub.add_parser('live', help='Live crawl a website')
    lv.add_argument('url', help='Seed URL to crawl')
    lv.add_argument('--seeds', help='File with additional seed URLs')
    lv.add_argument('--delay', type=float, help=f'Delay between requests (default: {DEFAULT_LIVE_DELAY}s)')
    lv.add_argument('--max-pages', type=int, help=f'Max pages to crawl for link discovery (default: {MAX_DISCOVER_PAGES})')
    lv.add_argument('--output-dir', dest='output_dir', help='Override output base directory')

    # gdrive
    gd = sub.add_parser('gdrive', help='Download from Google Drive')
    gd.add_argument('url', help='Google Drive folder or file URL')
    gd.add_argument('--label', help='Custom directory name (instead of gdrive-ID)')
    gd.add_argument('--output-dir', dest='output_dir', help='Override output base directory')

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
                    path_filter=getattr(args, 'path_filter', None))
    elif args.mode == 'live':
        run_live(args.url, seeds_file=args.seeds, delay=args.delay,
                 max_pages=args.max_pages, output_base=output_base)
    elif args.mode == 'gdrive':
        run_gdrive(args.url, output_base=output_base, label=getattr(args, 'label', None))
    elif args.mode == 'status':
        run_status(args.domain, output_base=output_base)


if __name__ == '__main__':
    main()
