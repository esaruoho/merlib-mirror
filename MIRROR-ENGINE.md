# mirror.py — Unified Mirror Engine

## Why this exists

Websites disappear. Servers go offline. Domains expire. Researchers die and their life's work vanishes from the internet. In fields like LENR, zero-point energy, electrogravitics, and advanced electromagnetic research, this happens constantly — small personal sites run by physicists, engineers, and independent researchers simply stop resolving one day, and decades of experimental data, papers, circuit diagrams, and correspondence are gone.

This tool exists to prevent that loss. It systematically archives these sites — from the Wayback Machine when they're already gone, or directly when they're still live but at risk — so that the next generation of researchers doesn't have to start from scratch.

The value isn't just preservation. It's discovery. Most people working in these fields don't know that sites like cheniere.org, riess.org, or amasci.com existed, let alone what they contained. By mirroring and indexing this material, we make it findable. A researcher studying Moray's radiant energy work can stumble into Tesla's longitudinal wave experiments, or Puthoff's zero-point papers, or Shoulders' charge cluster documentation — connections that would never happen if each site lived and died in isolation.

This is a library project, not piracy. We're preserving publicly-available scientific research, experimental data, and educational material that is actively disappearing from the web. The same work that archive.org does, focused on a field where the stakes are highest because the material exists nowhere else.

## Features

- **Wayback mode** — CDX API discovery + multi-timestamp fallback download
- **Live mode** — BFS link-discovery crawl of live websites
- **Smart auto-detect** — pass a bare domain, Wayback URL, or live URL and the mode is inferred
- **Wayback toolbar stripping** — 9 regex patterns remove all Wayback Machine artifacts
- **URL rewriting** — converts archived URLs to local relative paths
- **Text extraction** — generates `.txt` alongside every `.html` for full-text search
- **WordPress PDF extraction** — finds and downloads PDFs hidden behind plugin obfuscation
- **Resumable downloads** — atomic progress saves; interrupt and `--resume` anytime
- **Dry-run mode** — preview CDX discovery results before committing to a full download
- **Rate-limit handling** — exponential backoff on 429/503, automatic delay escalation
- **Zero dependencies** — Python 3.8+ stdlib only

## Usage

### Wayback mode (archive.org)

```bash
# Mirror a domain from Wayback Machine
python3 mirror.py wayback riess.org

# Resume an interrupted mirror
python3 mirror.py wayback riess.org --resume

# Limit to a date range
python3 mirror.py wayback cheniere.org --from 20200101 --to 20221231

# Preview what would be downloaded (CDX discovery only)
python3 mirror.py wayback riess.org --dry-run

# Custom output directory
python3 mirror.py wayback riess.org --output-dir /tmp/mirrors
```

### Live mode (direct crawl)

```bash
# Crawl a live website
python3 mirror.py live https://example.com

# With additional seed URLs
python3 mirror.py live https://example.com --seeds urls.txt

# Limit discovery depth
python3 mirror.py live https://example.com --max-pages 100
```

### Status

```bash
# Check mirror progress for a domain
python3 mirror.py status riess.org
```

### Smart auto-detect

Skip the subcommand — mirror.py infers the mode from the input:

```bash
python3 mirror.py riess.org                          # -> wayback
python3 mirror.py https://example.com                # -> live
python3 mirror.py https://web.archive.org/web/2022/https://foo.org/  # -> wayback foo.org
```

## Options

| Flag | Subcommands | Description |
|------|-------------|-------------|
| `--resume` | wayback | Resume interrupted download |
| `--from YYYYMMDD` | wayback | Start date filter for CDX query |
| `--to YYYYMMDD` | wayback | End date filter for CDX query |
| `--dry-run` | wayback | Run CDX discovery only, show URL count without downloading |
| `--delay SECONDS` | wayback, live | Delay between requests (default: 1.0 / 0.5) |
| `--seeds FILE` | live | File with additional seed URLs |
| `--max-pages N` | live | Max pages to crawl for link discovery (default: 500) |
| `--output-dir DIR` | all | Override base output directory (default: `./output`) |
| `--version` | all | Show version and exit |

## Output Structure

```
<output-dir>/<domain>/
  index.html              # Site root
  about.html              # Page files
  about.txt               # Extracted plain text
  articles/
    page.html
    page.txt
  images/
    logo.png
  _pdfs/                  # WordPress-extracted PDFs
    paper.pdf
  _progress.json          # Resumable state
  _meta.json              # Mirror metadata + file type breakdown
  _mirror.log             # Session log
  _failed_downloads.txt   # URLs that couldn't be retrieved
  ALLFILES.txt            # Complete file listing
```

## Requirements

- Python 3.8+
- No pip dependencies (stdlib only)

## Running Tests

```bash
python3 scripts/test_mirror.py -v
```

67 tests covering all pure functions: auto-detect, URL parsing, path sanitization, toolbar stripping, URL rewriting, text extraction, content validation, and directory conflict resolution.

## License

MIT
