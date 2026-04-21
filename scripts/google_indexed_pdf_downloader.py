#!/usr/bin/env python3
"""
Discover PDF URLs via Google's Programmable Search JSON API and download them.

This is meant for queries like:
  site:newenergytimes.com filetype:pdf

Required environment variables, unless passed as flags:
  GOOGLE_API_KEY  or CUSTOM_SEARCH_API_KEY
  GOOGLE_CSE_ID
"""

import argparse
import hashlib
import json
import os
import re
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path


SEARCH_ENDPOINT = "https://customsearch.googleapis.com/customsearch/v1"
USER_AGENT = "merlib-mirror/1.0 (+https://github.com/esaruoho/merlib-mirror)"


def parse_args():
    parser = argparse.ArgumentParser(
        description="Download PDFs indexed by Google for a domain."
    )
    parser.add_argument("--domain", default="newenergytimes.com")
    parser.add_argument("--api-key", default=os.environ.get("GOOGLE_API_KEY") or os.environ.get("CUSTOM_SEARCH_API_KEY"))
    parser.add_argument("--cx", default=os.environ.get("GOOGLE_CSE_ID"))
    parser.add_argument("--query", default=None, help="Override the Google query.")
    parser.add_argument(
        "--query-file",
        help="Optional file containing one query per line. Useful for sharding around Google's 100-result cap.",
    )
    parser.add_argument("--output-dir", default="sites")
    parser.add_argument("--delay", type=float, default=1.0)
    parser.add_argument("--download-delay", type=float, default=0.25)
    parser.add_argument("--max-results-per-query", type=int, default=100)
    parser.add_argument("--discover-only", action="store_true")
    parser.add_argument(
        "--download-only",
        help="Skip Google discovery and download URLs from a text file, one URL per line.",
    )
    parser.add_argument("--overwrite", action="store_true")
    parser.add_argument("--filter-duplicates", action="store_true")
    return parser.parse_args()


def search_google(api_key, cx, query, domain, delay, max_results, filter_duplicates):
    results = []
    start = 1
    max_results = min(max_results, 100)
    while start <= max_results:
        num = min(10, max_results - start + 1)
        params = {
            "key": api_key,
            "cx": cx,
            "q": query,
            "num": str(num),
            "start": str(start),
            "fileType": "pdf",
            "siteSearch": domain,
            "siteSearchFilter": "i",
            "safe": "off",
        }
        if not filter_duplicates:
            params["filter"] = "0"

        url = SEARCH_ENDPOINT + "?" + urllib.parse.urlencode(params)
        data = fetch_json(url)
        items = data.get("items", [])
        results.extend(items)

        next_pages = data.get("queries", {}).get("nextPage", [])
        if not items or not next_pages:
            break
        start = int(next_pages[0]["startIndex"])
        time.sleep(delay)
    return results


def fetch_json(url):
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    try:
        with urllib.request.urlopen(req, timeout=60) as response:
            return json.loads(response.read().decode("utf-8"))
    except urllib.error.HTTPError as exc:
        body = exc.read().decode("utf-8", errors="replace")
        raise SystemExit(f"Google API request failed: HTTP {exc.code}\n{body}") from exc


def read_queries(args):
    if args.query_file:
        with open(args.query_file, "r", encoding="utf-8") as handle:
            return [line.strip() for line in handle if line.strip() and not line.startswith("#")]
    if args.query:
        return [args.query]
    return [f"site:{args.domain} filetype:pdf"]


def normalize_pdf_urls(items):
    seen = set()
    urls = []
    for item in items:
        link = item.get("link")
        if not link:
            continue
        link = link.strip()
        parsed = urllib.parse.urlparse(link)
        if parsed.scheme not in {"http", "https"}:
            continue
        if link in seen:
            continue
        seen.add(link)
        urls.append(link)
    return urls


def url_to_local_path(base_dir, url):
    parsed = urllib.parse.urlparse(url)
    path = urllib.parse.unquote(parsed.path).strip("/")
    if not path:
        path = "index.pdf"

    parts = [sanitize_path_part(part) for part in path.split("/") if part]
    if not parts:
        parts = ["index.pdf"]

    filename = parts[-1]
    if not filename.lower().endswith(".pdf"):
        suffix = hashlib.sha1(url.encode("utf-8")).hexdigest()[:10]
        filename = f"{filename}_{suffix}.pdf"
    parts[-1] = filename
    return base_dir.joinpath(*parts)


def sanitize_path_part(part):
    part = re.sub(r"[\x00-\x1f<>:\"|?*]", "_", part)
    part = part.strip().strip(".")
    return part or "_"


def download_pdf(url, destination, overwrite):
    if destination.exists() and not overwrite:
        return "exists"

    destination.parent.mkdir(parents=True, exist_ok=True)
    temp_destination = destination.with_suffix(destination.suffix + ".part")
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    try:
        with urllib.request.urlopen(req, timeout=120) as response:
            data = response.read()
    except urllib.error.HTTPError as exc:
        return f"http-{exc.code}"
    except urllib.error.URLError as exc:
        return f"url-error:{exc.reason}"
    except TimeoutError:
        return "timeout"

    if not data.startswith(b"%PDF-"):
        content_type = response.headers.get("content-type", "")
        if "pdf" not in content_type.lower():
            return "not-pdf"

    with open(temp_destination, "wb") as handle:
        handle.write(data)
    temp_destination.replace(destination)
    return "downloaded"


def write_manifest(site_dir, domain, queries, items, urls):
    site_dir.mkdir(parents=True, exist_ok=True)
    manifest_path = site_dir / "_google_indexed_pdfs.json"
    urls_path = site_dir / "_google_indexed_pdf_urls.txt"
    manifest = {
        "domain": domain,
        "queries": queries,
        "result_count": len(items),
        "unique_pdf_url_count": len(urls),
        "items": items,
    }
    with open(manifest_path, "w", encoding="utf-8") as handle:
        json.dump(manifest, handle, indent=2, sort_keys=True)
        handle.write("\n")
    with open(urls_path, "w", encoding="utf-8") as handle:
        for url in urls:
            handle.write(url + "\n")
    return manifest_path, urls_path


def read_urls(path):
    with open(path, "r", encoding="utf-8") as handle:
        return [line.strip() for line in handle if line.strip() and not line.startswith("#")]


def main():
    args = parse_args()
    site_dir = Path(args.output_dir) / args.domain

    if args.download_only:
        queries = []
        items = []
        urls = read_urls(args.download_only)
    else:
        if not args.api_key or not args.cx:
            raise SystemExit(
                "Missing Google credentials. Set GOOGLE_API_KEY and GOOGLE_CSE_ID, "
                "or pass --api-key and --cx."
            )
        queries = read_queries(args)
        items = []
        for query in queries:
            print(f"Searching: {query}", file=sys.stderr)
            items.extend(
                search_google(
                    args.api_key,
                    args.cx,
                    query,
                    args.domain,
                    args.delay,
                    args.max_results_per_query,
                    args.filter_duplicates,
                )
            )
        urls = normalize_pdf_urls(items)
        manifest_path, urls_path = write_manifest(site_dir, args.domain, queries, items, urls)
        print(f"Wrote {manifest_path}", file=sys.stderr)
        print(f"Wrote {urls_path}", file=sys.stderr)

    if args.discover_only:
        print(f"Discovered {len(urls)} unique PDF URLs")
        return

    failures = []
    counts = {"downloaded": 0, "exists": 0, "failed": 0}
    for index, url in enumerate(urls, start=1):
        destination = url_to_local_path(site_dir, url)
        status = download_pdf(url, destination, args.overwrite)
        if status in {"downloaded", "exists"}:
            counts[status] += 1
        else:
            counts["failed"] += 1
            failures.append({"url": url, "status": status})
        print(f"[{index}/{len(urls)}] {status}: {url}", file=sys.stderr)
        time.sleep(args.download_delay)

    if failures:
        failures_path = site_dir / "_google_indexed_pdf_failures.json"
        with open(failures_path, "w", encoding="utf-8") as handle:
            json.dump(failures, handle, indent=2, sort_keys=True)
            handle.write("\n")
        print(f"Wrote {failures_path}", file=sys.stderr)

    print(json.dumps(counts, sort_keys=True))


if __name__ == "__main__":
    main()
