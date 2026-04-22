# MERLib Archive Strategy — Inventory + Self-Organizing Site Plan

_Generated 2026-04-22 during pharis/villes/magnetricity/tesla.hu mirror session._

## 1. Current mirror state (sites/)

Completed archives (sorted by size):

| Site | Size | Notes |
|---|---|---|
| torkado.de | 823 MB | Schauberger ecosystem |
| www.ifi.unicamp.br | 619 MB | Assis / Weber electrodynamics |
| matpitka.blogspot.com | 535 MB | Pitkänen TGD theory |
| amasci.com | 232 MB | Beaty / mad-science lib |
| vivavortex.wordpress.com | 229 MB | Vortex studies |
| perlenschnur.org | 133 MB | — |
| primalwater.com.au | 41 MB | Water structuring |
| johnbedini.net | 39 MB | Bedini motor |
| meyl.eu | 35 MB | Meyl scalar waves |
| evert.de | 26 MB | Evert vortex |
| iet-community.org | 23 MB | INE tradition |
| padrak.com | 3.6 MB | INE papers |
| elmer.unibas.ch | 3.6 MB | — |
| vortexscience.com | 3.3 MB | Schappeller tradition (dead) |
| magnetricity.com | 2.4 MB | Magnetic flux / Tesla / Keely |
| pharis | 2.1 MB | Dean Pharis Dynamic Theory |
| jvmoloney.com | 1.1 MB | Moloney |
| www.vortex-world.org | 440 KB | — |
| riess.org | 224 KB | Riess |

Stubs to re-mirror:
- infohost.nmt.edu (8 KB, only logs) → scope confined to /~pharis/ done; wider host not indexed
- tom-c-tesla copy (20 KB) → incomplete Tom C. Tesla material
- theverylastpageoftheinternet.com (16 KB) → single-page by design? verify

## 2. Queued / in progress
- **tesla.hu** — queued 2026-04-22. Dead site. 3794 wayback URLs (239 htm, 203 doc, 12 rar, 110 jpg, 99 png, 4 pdf, 3 mp4). Expected ~1 hr download time.

## 3. Strong candidates still missing (based on Free Energy / vortex lineage)

Dead/at-risk, should be mirrored:
- **cheniere.org** — Bearden's site. Listed as "legacy" in merlib-dump (1.1 GB). Pull into merlib-mirror proper?
- **energyfromthevacuum.com** — Also legacy in merlib-dump (34 MB). Same question.
- **rexresearch.com** — Alternative energy compendium. Large. Check status.
- **keelynet.com** — Jerry Decker's site. Historic collection.
- **worldwideflood.com / wfloodflood.com** — Walter Russell derivative, check.
- **ramaswami.org / Sabastosa** — Weber-related.
- **thunderbolts.info** — Electric Universe community. Large.
- **bioelectromagnetic / bion** research portals.

Unknown status, verify:
- **Samer's Weber-Torricelli-Beltrami contributions** — scattered across BBS conversations, worth consolidating into a dedicated archive page.
- **Hensel, Kortela, Mueller archives** — primary sources for RBI/Free-Energy cross-validation.
- **Schumann, Crile, Sweet, Dollard, Moray primary-source archives** — user's free-energy skill lists these.

Action: produce a CHECKLIST file listing each candidate, its current status (live/dead/partial), CDX URL count, and decision (mirror/skip/dump-only).

## 4. Self-organizing content site — architectural options

The user's vision: a single coherent GitHub-hosted site that ingests the mirrors, cross-links related content (Tesla ↔ Schauberger ↔ Russell ↔ Weber), supports text display, audio playback (transcripts + media), and eventually voice/chat over the corpus.

### Realistic phases

**Phase 1 — Static index (do this first, weeks, not months)**
- Generate a top-level `index.md` per site folder listing articles, PDFs, media
- Build a root `README.md` with ontology: themes → sites → specific pages
- Link sites to each other via cross-reference tags (e.g. `tags: [weber, torricelli, schauberger]` in frontmatter)
- Serve as plain GitHub Pages — no server, no JS framework needed
- **Cost:** ~1 week. **Benefit:** instant navigable archive, no maintenance burden.

**Phase 2 — Search + transcript integration**
- Run `whisp` over every audio/video file (already partially done per project notes)
- Generate full-text search index (Lunr, Pagefind, or static Tantivy)
- Cross-link transcripts to their source pages
- Tag each document by extracted keywords (names, concepts)
- **Cost:** ~2-4 weeks. **Benefit:** queryable archive.

**Phase 3 — RAG / chat**
- Vectorize the text corpus (Voyage / OpenAI / local sentence-transformers)
- Build a Q&A endpoint: "what does Russell say about magnetic monopoles?" → retrieves passages, cites Magnetricity + Torkado + Russell archives
- Could run as Claude API tool-use with citations (SKILL: claude-api)
- **Cost:** ~1-2 months part-time. **Benefit:** the "conversation with the archive" the user wants.

**Phase 4 — Voice**
- `say`/TTS for output, ElevenLabs or local for higher quality
- Dictation (Whisper in streaming mode) for input
- Wrap Phase 3 pipeline
- **Cost:** ~2 weeks on top of Phase 3.

### Key architectural principle
**Generate from mirrors, don't fork them.** Every site in `sites/` stays as-is (reproducible from source). The site/app layer lives in a separate directory (e.g. `site/` or new repo `merlib-archive-web`) and consumes mirrors via globs + frontmatter.

This avoids: corrupting source archives, re-running mirrors on every site change, losing reproducibility.

### Immediate recommendation
Start Phase 1 — generate per-site indexes with YAML frontmatter and a root ontology README. This is the highest-leverage step: turns 22 disconnected folders into one navigable map. Defer Phase 2+ until the archive itself stabilizes (finishing tesla.hu, checking other candidates, deciding what stays public vs private).

Two sub-decisions needed from user before Phase 1:
1. **Same repo or new one?** merlib-mirror is ~3+ GB of content. A separate `merlib-site` repo that pulls from it as a git submodule keeps concerns clean. Alternative: one repo, `site/` folder.
2. **Private material handling.** merlib-dump has private metadata; public site must respect that boundary.

## 5. Skill work: pakettibot-agent

Not yet investigated. Previous `!pk mirror` bug (stray `/about.html` filter on villesresearch) still uncaused. Should trace when we move beyond mirror engine fixes.
