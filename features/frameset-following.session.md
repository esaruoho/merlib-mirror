# SESSION — frameset-following (the radiondistics PRs that shipped nothing)

Spawning conversation for `features/frameset-following.feature`.
Faithful, not flattering — this is the audit trail behind the card's grades.

## How to get back

- Transcript: `file:///Users/esaruoho/.claude/projects/-Users-esaruoho-work-convey/ae2447a0-9162-4e7b-a921-5d5f0ca1d17c.jsonl`
- Session ID: `ae2447a0-9162-4e7b-a921-5d5f0ca1d17c`
- Resume: `claude --resume ae2447a0-9162-4e7b-a921-5d5f0ca1d17c`
- Date: **2026-08-03**, ~16:00–17:40 EEST (13:00–14:40 UTC)
- CWD at the time: `/Users/esaruoho/work/convey` (work done in `/Users/esaruoho/work/merlib-mirror`)

## The request

Esa, opening message:

> so hey i want you to look at merlib-mirror and the mirror: radiondistics.com and
> mirror: radiondistics.altervista.org PRs which both failed. you have not succeeded
> in using merlib-mirror to mirror, properly, the radiondistics, please. figure out
> what the errors are, and fix them

Note the framing he chose: **"you have not succeeded."** Both PRs sat OPEN since
2026-07-29 with a green-looking worker log and zero content. That is the failure
mode this card exists to make impossible.

## What I found, in order

1. **PRs #49/#50 were not "failed" in the CI sense** — no checks, `mergeStateStatus:
   CLEAN`. They were *empty*: `files` showed exactly one entry each, a
   `_mirror_worker.log`. PR body said `Files: 0`. So the belt reported success and
   delivered nothing.

2. **Two distinct causes, not one.** I initially assumed a single bug. Wrong.

   - **#49 (altervista): the www. path mismatch.** mirror.py named its output dir
     from `urlparse().hostname` → `sites/www.radiondistics.altervista.org`, while
     `commit_and_push` staged `sites/$domain` → the *non-www* path. 214 files
     crawled fine; the commit picked up only the log it had written to the empty
     non-www dir.

     **This was already fixed** before I got here — the "www. normalisation" block
     in `mirror-worker`, and the content was manually recovered onto main in
     `902cbe1e`. I should record that I did not fix this one; I verified it.

   - **#50 (radiondistics.com): frames were never followed.** This one was live.
     `extract_links` handled `a`/`img`/`link`/`script` + meta-refresh, and nothing
     else. The site's whole body is
     `<frameset><frame src="https://www.radiondistics.altervista.org/">`.
     0 links found → 1 page → `Downloaded: 1, OK: 1, Failed: 0`.

3. **A correction I had to make to my own first read.** My first instinct was
   "radiondistics.com is under-mirrored, go get the rest." Then I curl'd it: there
   *is* no rest. It is a frameset and nothing more, and the frame points
   **cross-domain**, where `should_skip_url` correctly refuses to go. So the fix is
   NOT "crawl the frame." 1 file is the right answer. The bug is that 1 file was
   indistinguishable from a complete mirror. That reframing is what produced the
   `FRAMESET` log block and the `frame_target:` line in SOURCE.txt rather than a
   scope-widening crawl change.

4. **The unplanned find — real content had been missing all along.** Having written
   `extract_frame_targets`, I ran it over the *already-mirrored* altervista pages to
   see whether the gap had cost anything there. It had: `balanced_lines.htm` and
   `linee_bilanciate.htm` both iframe `mismatching_simulator.htm` — **same domain**,
   live (HTTP 200), and absent from the mirror. Nobody would ever have noticed; no
   `<a>` anywhere points at it. Re-crawl recovered it. 214 → 215 files.

   This is the argument for the whole card. The frameset bug's visible symptom was
   a 1-file mirror of a throwaway domain. Its *invisible* symptom was a missing page
   inside the mirror everyone thought was complete.

5. **A third bug, found by thinking through the re-run rather than by testing.**
   Before requeueing I traced what the worker would actually do. The www.
   normalisation `rm -rf`s the www dir — but on main that dir is **tracked**. And
   `commit_and_push` stages only `$site_dir`. So the rename would be *half-recorded*:
   the PR adds `sites/radiondistics.altervista.org/`, never drops
   `sites/www.radiondistics.altervista.org/`. Result: duplicate site on main, plus
   275 unstaged phantom deletions in the Mini's working tree for the repo-puller to
   fight. Fixed with `NORMALISED_FROM` (`68dd37f7`), cleared per job so a rename
   can't leak into the next domain's commit.

## The decision I put to Esa

`AskUserQuestion` — what to do with the two empty PRs. I recommended "close both
with an explanation." He chose **"Re-run both jobs through the worker to make fresh,
correct PRs."** Recommendation not taken; his call, and it forced the better path —
it is what made me trace the worker's actual behaviour and find bug #3 above.

Consequence of his choice that I had to work out: `commit_and_push` does
`git checkout -B "$branch" main`, so the recreated branch diverges from the stale
`origin/mirror/radiondistics.*`, and `git push -u` (no `--force`) would be **rejected
non-fast-forward** → "Push failed, will retry next cycle", forever. So the stale
remote branches had to be deleted for his chosen path to work at all. I commented the
full diagnosis on #49 and #50 first so the record survives the branch deletion, then
deleted the branches (which auto-closed both PRs).

## Rejected / not done

- **Auto-queueing off-domain frame targets.** Tempting — radiondistics.com's frame
  literally names the domain that holds the content. Left `@todo` on the card: taking
  an arbitrary host out of a frame src and queueing it is how a crawl escapes its
  scope. The SOURCE.txt declaration is the safe half. Revisit with an allowlist.
- **Widening `should_skip_url` to admit frame hosts.** Same reason. Explicitly listed
  in the card's Areaspace as MUST NOT touch.
- **Deleting the mis-named `sites/www.radiondistics.*` from main first** to make the
  worker's PR clean. Rejected: it puts main in a lossy state during the window before
  merge. Handled inside the worker instead (bug #3), which fixes it for every future
  www-hosted site rather than just this one.
- **Local OCR / anything on the Mini via nohup or SSH.** Not applicable here, but for
  the record: delivery was git-push → repo-puller → Boot pane worker. The queue
  travels in git (`queue/pending/` is tracked; `mirror-submit` commits and pushes).
  `mirror-submit`'s USR1 wake is a no-op from the laptop since the PID file is local
  and the worker is on the Mini — so drain waits on the worker's 300s idle poll.

## Verification actually run

- `python3 -m unittest test_mirror` → **80 tests OK** (was 67; +13 new).
- Live re-crawl `https://www.radiondistics.com/` → 1 file, and the new FRAMESET block
  printed `→ https://www.radiondistics.altervista.org/`; SOURCE.txt carries
  `frame_target:`.
- Live re-crawl `https://www.radiondistics.altervista.org/` → 215 files (was 214),
  `mismatching_simulator.htm` present at 1,583 bytes; 4 off-domain frame targets
  declared (2 YouTube, 1 Vimeo, 1 unitconverters.net).
- `site_to_paper.py` → `reachable=56 · unreached=0` (was `reachable=55 · unreached=1`).
- `bash -n mirror-worker` → syntax OK.

Not verified at the time of writing: the end-to-end belt run on the Mini. Jobs were
queued in `2250f794`; the worker was confirmed alive (heartbeat 51s old, idle,
pid 77988) but had not yet drained. The card grades the engine scenarios
`@hw-verified` on the direct crawls above — **not** on the belt run.

## The lesson worth keeping

A crawler that reports `Failed: 0` after fetching one page is not reporting success,
it is reporting that it had nothing to do. Both the meyl.eu meta-refresh splash page
and this frameset are the same class: **a page with no `<a>` tags is a page whose
navigation lives somewhere the extractor isn't looking.** Every future extractor gap
in this engine will present as a suspiciously small mirror with a clean log. That is
the thing to be suspicious of.
