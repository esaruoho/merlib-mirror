# MERLib Mirror

**Mirroring the Internet's Modern Energy Research into a Library.**

Using the Wayback Machine and other tools to preserve rare websites from the most experimental physicists, professors, experimenters, electrical engineers, students, inventors, and innovators — retaining this combined knowledge for future generations.

## How It Works

MERLib Mirror is a queue-based mirroring daemon. Submit a domain or URL, and the worker fetches a complete site archive using the bundled [Unified Mirror Engine](MIRROR-ENGINE.md) (`mirror.py`). Results are committed and pushed to this repo so they're accessible from anywhere.

### Supported Modes

- **Wayback** — Mirror from the Internet Archive's Wayback Machine (CDX discovery + multi-timestamp fallback)
- **Live** — BFS crawl of live websites with link discovery

### Queue Architecture

```
queue/pending/     → .job files waiting to be processed
queue/processing/  → currently being mirrored
queue/done/        → completed successfully
queue/failed/      → failed (check .job file for error)
sites/             → mirror output (one subdirectory per domain)
```

## Usage

### Submit a mirror job

```bash
# Bare domain → Wayback Machine mode
./mirror-submit riess.org

# Wayback URL → auto-detects domain + mode
./mirror-submit https://web.archive.org/web/2022/https://cheniere.org/

# Live URL → BFS crawl mode
./mirror-submit https://some-live-site.org

# Queue without pushing to git
./mirror-submit --no-push riess.org
```

### Check queue status

```bash
./mirror-submit status
```

### Start the worker daemon

```bash
./start-mirror.sh
```

### Via Discord (PakettiBot)

```
!pk mirror riess.org
!pk mirror status
```

## Setup

`mirror.py` is bundled in this repo. The worker finds it automatically. If you need to override:

1. **`$MIRROR_PY` environment variable** — set to a custom path
2. **PATH lookup** — if `mirror.py` is on your `$PATH`
3. **Default** — uses `./mirror.py` from the repo directory

```bash
# Clone and start — that's it
git clone https://github.com/esaruoho/merlib-mirror.git
cd merlib-mirror
./start-mirror.sh
```

## Size Limits

Sites under 1 GB are automatically committed and pushed to GitHub. Sites over 1 GB are committed locally but not pushed, to stay within GitHub's repository size guidelines.

## License

MIT
