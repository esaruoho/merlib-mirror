# MERLib Mirror

**Mirroring the Internet's Modern Energy Research into a Library.**

Using the Wayback Machine and other tools to preserve rare websites from the most experimental physicists, professors, experimenters, electrical engineers, students, inventors, and innovators — retaining this combined knowledge for future generations.

### Why this exists

Websites disappear. Servers go offline. Domains expire. Researchers die and their life's work vanishes from the internet. In fields like LENR, zero-point energy, electrogravitics, and advanced electromagnetic research, this happens constantly — small personal sites run by physicists, engineers, and independent researchers simply stop resolving one day, and decades of experimental data, papers, circuit diagrams, and correspondence are gone.

This tool exists to prevent that loss. It systematically archives these sites — from the Wayback Machine when they're already gone, or directly when they're still live but at risk — so that the next generation of researchers doesn't have to start from scratch.

The value isn't just preservation. It's discovery. Most people working in these fields don't know that sites like cheniere.org, riess.org, or amasci.com existed, let alone what they contained. By mirroring and indexing this material, we make it findable. A researcher studying Moray's radiant energy work can stumble into Tesla's longitudinal wave experiments, or Puthoff's zero-point papers, or Shoulders' charge cluster documentation — connections that would never happen if each site lived and died in isolation.

This is a library project, not piracy. We're preserving publicly-available scientific research, experimental data, and educational material that is actively disappearing from the web. The same work that archive.org does, focused on a field where the stakes are highest because the material exists nowhere else.

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
git clone git@github.com:esaruoho/merlib-mirror.git
cd merlib-mirror
./start-mirror.sh
```

## Size Limits

Sites under 1 GB are automatically committed and pushed to GitHub. Sites over 1 GB are committed locally but not pushed, to stay within GitHub's repository size guidelines.

## License

MIT
