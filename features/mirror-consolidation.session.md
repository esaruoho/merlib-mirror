# Session — mirror-consolidation

Card: [features/mirror-consolidation.feature](mirror-consolidation.feature)
Date: 2026-07-29, ~16:20–17:15 EEST (Finnish time)
Repo: `~/work/merlib-mirror`

## How to get back

- Project: `/Users/esaruoho/work/merlib-dump` (the session ran from the merlib-dump project dir)
- Resume: `claude --resume <session-id>` — session id not stamped by the harness in this
  transcript; recover via `/sessions merlib-dump` and pick the 2026-07-29 afternoon entry.
  **Not fabricated here** — the RTFC/report-card rule forbids inventing a session id.
- Companion archive output: `~/work/merlib-dump/articles/2026-07-29-radiondistics-francesco-errante-preliminary-pass.md`

## What the human asked, in order

1. Mirror `https://www.radiondistics.altervista.org/` fully, then analyse it for free-energy
   content; do preliminary deep looking into the open-system / free-energy work in it and what
   the VRx papers already bring.
2. Mid-turn: *"get the house of moray from archive.org, its really important, too."*
3. Mid-turn: *"so the convey keelynet system should be used for the altervista thing. and is it
   possible to somehow connect cohesively the content together so its a larger single paper
   instead of multiple pages separated and chaotic. would make it easier to synthesize. i think
   this should be a "convey mirror" feature so that the original content is stored and mirrored,
   but then the result is also created automatically and anotnomously."*

Request 3 is the origin of this card. Two distinct demands in it, both honoured: **cohesive single
paper** (not N pages) and **automatic + autonomous** (a stage of the mirror, not a chore).

## What actually happened — faithfully, including the misses

- Pre-flight grep found radiondistics in neither `merlib-dump` nor `merlib-mirror/sites/`. Correct
  to call it new. `convey mirror` queued both domains; the Mini's worker picked them up in seconds.
- **I initially read the mirror-queue state wrong.** `thehouseofmoray.org` sat in `queue/pending/`
  dated Jun 10 with an empty `done/`, and I reported that as a worker that wasn't draining. It was
  not: the heartbeat showed `status: processing`, `done: 44`, `failed: 7`. The real story was that
  the June run had **succeeded** and landed on branch `mirror/thehouseofmoray.org` as **PR #48**,
  never merged. Merged it; 27 files landed in main.
- **I also published a wrong number and corrected it.** I said Wayback had "30 unique URLs" for
  thehouseofmoray.org based on `wc -l` over a CDX response that was actually a 503 HTML error page.
  Re-queried with JSON output and retries: genuinely 30 URLs, 2 of them 404s. The number happened
  to be right; the evidence for it had been garbage. Fetched the 2 genuinely-missing assets
  (`css/moray.css`, `hp_script.js`) → 28/28 non-404 assets held.
- **The bug that motivated half this card.** radiondistics PR #49 contained exactly one file:
  `_mirror_worker.log`. The log showed the crawl had *succeeded* — 214 OK / 4 failed, 218 URLs.
  Root cause: `mirror.py:1073 run_live` names its output dir from `urlparse().hostname`
  (`www.radiondistics.altervista.org`); `mirror-worker` stages `$output_dir/$domain` where `domain`
  is the www-stripped host. So a live crawl of any www-hosted site committed only its own log.
  218 files were sitting uncommitted on the Mini. Recovered via `!pk run --direct`, then fixed
  properly as the www-normalisation stage.
- **Channel discipline, one stumble.** Recovery went over the Syncthing pakettibot file-bridge, not
  SSH — correct. First attempt failed `exit 128` because my `&&` chain hit
  `git pull --rebase` with the worker's own drained job-file deletions unstaged. Second drop staged
  `queue/` first and pushed clean. I did preflight SSH as the documented fallback but never needed it.
- Consolidation built and run: 55 HTML pages (more than the 30-odd I'd expected), entry `index.htm`,
  **all 55 reachable**, 1,163,049 chars.
- **The consolidation immediately paid for itself analytically.** It surfaced pages my 5-page manual
  read had missed entirely — `antenna_errante.htm` is not an antenna page at all but *"Rivelatore
  passivo di radiazione hertziana a fluorescenza da ionizzazione secondaria"* (the passive
  radioluminescence detector — i.e. Errante's PROBE, which is the crux of the acoustic-dipole
  link), `suppressor.htm` = *"Open dipole antenna: electrodynamics and radiation mechanism revealed
  © 2003"*, plus hosted third-party Nobel lectures (Feynman 1965, Marconi 1909 in both languages)
  and a Fessenden-vs-Marconi history page. That is the argument for the feature, made by the feature.
- **First code slip:** wrote the worker stage against `$SCRIPT_DIR`, which does not exist in
  `mirror-worker` — the variable is `$REPO_DIR`. Caught by `bash -n` + grep before commit, not by
  a runtime failure. Fixed.

## Decisions and why

- **Reading order = BFS over the site's own link graph, from the entry page.** Alphabetical
  filenames scramble authorial sequence; the author's nav order is the real structure. Orphans are
  appended under an explicit heading rather than dropped — the no-silent-caps rule applied to a
  machine stage.
- **Stage placement: after the success path, before `commit_and_push`.** So `_paper/` is part of the
  mirror's own PR. A consolidation failure logs a WARNING and never fails a good mirror — the
  original bytes are the irreplaceable thing.
- **No restart command needed.** `mirror-worker`'s `sync_repo` hashes itself and `exec`s on change,
  so pushing deploys the stage. This respects the NO-NOHUP ground rule by not introducing any new
  process at all — the stage runs inside the existing visible pane.
- **Extended, did not invent.** Per the convey anti-invention loop: `convey mirror` already exists
  and already delegates to `merlib-mirror/mirror-worker`; the new behaviour is a station on that
  belt. No new verb was added.
- **Deliberately NOT built:** boilerplate suppression (nav repeats 19× on radiondistics) and
  auto-feeding the consolidated paper into `convey ingest` / DreamGraph / the needs-analysis ledger.
  Both are `@todo` on the card. One stage at a time.

## Rejected / not asked

- No `AskUserQuestion` was used. Two readings of "single paper" were possible — one document per
  language, or one document for the whole site. Chose whole-site with language visible in the page
  titles, because the site interleaves EN/IT versions of the same argument and splitting them would
  destroy the very cohesion that was requested. Flagging it here rather than silently.

## Honest state at hand-off

The stage is `@built` and `@verified` on one real corpus (radiondistics, live mode). It is
`@untested` on wayback mode — mode-agnostic by construction, but no observed run, so the grade
stays down. The archive-side analysis of radiondistics is explicitly a **preliminary pass at ~10%
page coverage**, not a deep-read; the consolidated paper now exists precisely so the real
deep-read can be done against one text.
