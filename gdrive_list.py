#!/usr/bin/env python3
"""List and download all files in a public Google Drive folder.

Two listing strategies:
  1. Google Drive API v3 with API key (unlimited, requires GDRIVE_API_KEY env var)
  2. Web scraping fallback (capped at 50 files per folder — gdown's limitation)

Downloads use curl with confirm=t trick (no auth needed for public files).

Usage:
    # List only
    python3 gdrive_list.py list FOLDER_URL

    # Download all files
    python3 gdrive_list.py download FOLDER_URL --output /path/to/dir

    # Download with API key (gets ALL files, not just first 50)
    GDRIVE_API_KEY=xxx python3 gdrive_list.py download FOLDER_URL --output /path/to/dir
"""

import itertools
import json
import os
import re
import subprocess
import sys
import urllib.request
import urllib.parse
import warnings


# ── Google Drive API v3 listing (unlimited, requires API key) ────────────

def _api_list_folder(folder_id, api_key):
    """List all files in a folder using Google Drive API v3. No 50-file limit."""
    all_files = []
    page_token = None

    while True:
        params = {
            "q": f"'{folder_id}' in parents and trashed = false",
            "key": api_key,
            "pageSize": "1000",
            "fields": "nextPageToken,files(id,name,mimeType,size)",
        }
        if page_token:
            params["pageToken"] = page_token

        url = "https://www.googleapis.com/drive/v3/files?" + urllib.parse.urlencode(params)
        req = urllib.request.Request(url)
        resp = urllib.request.urlopen(req, timeout=30)
        data = json.loads(resp.read().decode("utf-8"))

        for item in data.get("files", []):
            all_files.append({
                "id": item["id"],
                "name": item["name"],
                "type": item["mimeType"],
                "size": int(item.get("size", 0)),
                "is_folder": item["mimeType"] == "application/vnd.google-apps.folder",
            })

        page_token = data.get("nextPageToken")
        if not page_token:
            break

    return all_files


def api_list_recursive(folder_id, api_key, path="", depth=0):
    """Recursively list all files using the API."""
    files = _api_list_folder(folder_id, api_key)
    indent = "  " * depth
    print(f"  {indent}Found {len(files)} items", file=sys.stderr)

    all_files = []
    for f in files:
        full_path = os.path.join(path, f["name"]) if path else f["name"]

        if f["is_folder"]:
            print(f"  {indent}Entering folder: {f['name']}", file=sys.stderr)
            subfolder_files = api_list_recursive(f["id"], api_key, full_path, depth + 1)
            all_files.extend(subfolder_files)
        else:
            all_files.append({
                "id": f["id"],
                "name": f["name"],
                "path": full_path,
                "size": f.get("size", 0),
            })

    return all_files


# ── Web scraping fallback (50-file cap per folder) ──────────────────────

def _scrape_folder(folder_id):
    """Parse Google Drive folder page for file data. Limited to 50 items."""
    try:
        import requests
        import bs4

        url = f"https://drive.google.com/drive/folders/{folder_id}?hl=en"
        sess = requests.Session()
        sess.headers.update({
            "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) "
                          "AppleWebKit/537.36 (KHTML, like Gecko) "
                          "Chrome/98.0.4758.102 Safari/537.36",
        })
        res = sess.get(url)
        if res.status_code != 200:
            return None

        soup = bs4.BeautifulSoup(res.text, features="html.parser")
        encoded_data = None
        for script in soup.select("script"):
            inner = script.decode_contents()
            if "_DRIVE_ivd" in inner:
                regex_iter = re.compile(r"'((?:[^'\\]|\\.)*)'").finditer(inner)
                try:
                    encoded_data = next(itertools.islice(regex_iter, 1, None)).group(1)
                except StopIteration:
                    continue
                break

        if encoded_data is None:
            return None

        with warnings.catch_warnings():
            warnings.filterwarnings("ignore", category=DeprecationWarning)
            decoded = encoded_data.encode("utf-8").decode("unicode_escape")

        folder_arr = json.loads(decoded)
        contents = folder_arr[0] if folder_arr[0] else []

        files = []
        for entry in contents:
            files.append({
                "id": entry[0],
                "name": entry[2].encode("raw_unicode_escape").decode("utf-8"),
                "type": entry[3],
                "is_folder": entry[3] == "application/vnd.google-apps.folder",
            })
        return files

    except Exception as e:
        print(f"  Scrape error: {e}", file=sys.stderr)
        return None


def scrape_list_recursive(folder_id, path="", depth=0):
    """Recursively list files via web scraping (50-file cap per folder)."""
    files = _scrape_folder(folder_id)
    if files is None:
        return []

    indent = "  " * depth
    print(f"  {indent}Found {len(files)} items (web scrape, max 50)", file=sys.stderr)

    all_files = []
    for f in files:
        full_path = os.path.join(path, f["name"]) if path else f["name"]
        if f["is_folder"]:
            print(f"  {indent}Entering folder: {f['name']}", file=sys.stderr)
            all_files.extend(scrape_list_recursive(f["id"], full_path, depth + 1))
        else:
            all_files.append({"id": f["id"], "name": f["name"], "path": full_path})

    return all_files


# ── Download ─────────────────────────────────────────────────────────────

def download_file(file_id, dest_path):
    """Download a single file from Google Drive using curl."""
    os.makedirs(os.path.dirname(dest_path) or ".", exist_ok=True)

    if os.path.exists(dest_path) and os.path.getsize(dest_path) > 0:
        return True  # Already downloaded

    url = f"https://drive.google.com/uc?export=download&id={file_id}&confirm=t"
    result = subprocess.run(
        ["curl", "-sL", "-o", dest_path, url],
        capture_output=True, timeout=600,
    )

    if result.returncode != 0 or not os.path.exists(dest_path):
        return False

    # Verify it's not an HTML error page
    if os.path.getsize(dest_path) > 0:
        with open(dest_path, "rb") as f:
            header = f.read(16)
        if header.startswith(b"<!") or header.startswith(b"<html"):
            os.remove(dest_path)
            return False

    return True


def download_all(files, output_dir):
    """Download all files to output_dir, preserving path structure."""
    total = len(files)
    ok = 0
    failed = []

    for i, f in enumerate(files, 1):
        dest = os.path.join(output_dir, f["path"])

        if os.path.exists(dest) and os.path.getsize(dest) > 0:
            ok += 1
            continue

        size_str = ""
        if f.get("size"):
            size_str = f" ({f['size'] // 1024}KB)"

        print(f"  [{i}/{total}] {f['name']}{size_str}")

        if download_file(f["id"], dest):
            actual_size = os.path.getsize(dest) // 1024
            print(f"    OK ({actual_size}KB)")
            ok += 1
        else:
            print(f"    FAILED")
            failed.append(f)

    print(f"\nDownloaded: {ok}/{total}", file=sys.stderr)
    if failed:
        print(f"Failed: {len(failed)}", file=sys.stderr)
        for f in failed:
            print(f"  {f['id']}\t{f['path']}", file=sys.stderr)

    return failed


# ── CLI ──────────────────────────────────────────────────────────────────

def extract_folder_id(url_or_id):
    m = re.search(r"folders/([a-zA-Z0-9_-]+)", url_or_id)
    return m.group(1) if m else url_or_id


def main():
    if len(sys.argv) < 3:
        print(__doc__, file=sys.stderr)
        sys.exit(1)

    command = sys.argv[1]
    folder_id = extract_folder_id(sys.argv[2])
    output_dir = None

    # Parse --output
    for i, arg in enumerate(sys.argv):
        if arg == "--output" and i + 1 < len(sys.argv):
            output_dir = sys.argv[i + 1]

    api_key = os.environ.get("GDRIVE_API_KEY")

    # List files
    if api_key:
        print(f"Using Google Drive API (unlimited listing)", file=sys.stderr)
        all_files = api_list_recursive(folder_id, api_key)
    else:
        print(f"WARNING: No GDRIVE_API_KEY set. Using web scrape (50 files/folder max).", file=sys.stderr)
        print(f"Set GDRIVE_API_KEY env var for complete listings.", file=sys.stderr)
        all_files = scrape_list_recursive(folder_id)

    print(f"\nTotal files: {len(all_files)}", file=sys.stderr)

    if command == "list":
        for f in all_files:
            print(f"{f['id']}\t{f['path']}")

    elif command == "download":
        if not output_dir:
            print("ERROR: --output DIR required for download", file=sys.stderr)
            sys.exit(1)
        os.makedirs(output_dir, exist_ok=True)
        failed = download_all(all_files, output_dir)
        if failed:
            # Write failed list for retry
            failed_path = os.path.join(output_dir, "_failed_downloads.txt")
            with open(failed_path, "w") as fp:
                for f in failed:
                    fp.write(f"{f['id']}\t{f['path']}\n")
            print(f"Failed files written to: {failed_path}", file=sys.stderr)
    else:
        print(f"Unknown command: {command}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
