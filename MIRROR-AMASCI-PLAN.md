# Mirroring amasci.com (William Beatty, *Science Hobbyist*) in full

**Status:** measured, not yet executed. Findings below are from
`scripts/mirror_coverage.py` on **2026-08-03**; the invariants are locked in
`test_amasci_mirror.py` (25 tests, 5 network-gated behind `MERLIB_NET=1`).

Goal: a complete-enough amasci.com corpus to run a **KeelyNet-style page-per-page
analysis via email automation on the Mac Mini**. That pipeline eats
`_paper/pages/*.md` — one markdown file per page — so the question "how do we
mirror it in full" is really "how do we get from 728 pages to the whole corpus".

---

## TL;DR

| Measure | Value |
|---|---|
| Files on disk now | 1,558 (232 MB), mirrored 2026-03-05 |
| HTML pages on disk | 728 |
| Coverage **of what the live site still links to** | **85.4%** (287 real gaps) |
| …of which actually still fetchable | **~12%** — the rest are 404 on Beatty's own server |
| Coverage **of static paths Wayback has ever seen** | **7.3%** |
| Static historical paths we do NOT hold | **17,608** (7,367 `.html` + 2,694 `.htm` + 5,854 images) |

**The live site is near its ceiling. The corpus is historical.** A live crawl
cannot finish this job no matter how well it is tuned — roughly 10,000 HTML pages
of Beatty's writing exist only in the Wayback Machine.

The 2026-03-05 run logged `downloaded 1550, failed 0`. That was true and
meaningless: "failed 0" reports that nothing errored, never that anything was
found. Same lesson as the meyl.eu splash page and the radiondistics frameset.

---

## The five findings

### 1. amasci.com is HTTP-ONLY — this is the one that breaks everything else

```
http://amasci.com/       200
https://amasci.com/      000   (no TLS at all — not a cert error, no answer)
http://www.amasci.com/   200
```

Relative links are resolved against a constructed base URL. Assume `https` and
every relative link becomes an address that does not exist, so a healthy mirror
reports as broken and every live probe fails. I hit this myself while writing the
prober: my first run reported 59% coverage and a wall of `URLError`, purely
because I had hardcoded an `https://` base.

`mirror_coverage.detect_scheme()` now derives the scheme from `SOURCE.txt`, else
from the scheme the site's own absolute self-links use. **Never pass `https` for
this domain.**

### 2. 38% of cited same-domain URLs are malformed — do not chase them

Of 3,262 same-domain URLs cited by mirrored pages, **1,249 are malformed** and 49
are dynamic. Beatty hand-wrote this HTML across 25 years; it contains unquoted
attributes and hrefs that swallow the following tag:

```
http://amasci.com/amateur/traffic/traffic1.htmlhttp://amasci.com/amateur/traffic/traffic1.html</a><br>\t<a href=
```

This matters twice over: a crawler that queues them wastes the run, and a coverage
report that counts them as misses **understates coverage by ~34 points** (51.4%
raw vs 85.4% real). `classify_missing()` splits `malformed` / `dynamic` / `gap`,
and only `gap` is a mirror deficiency.

### 3. Most of the live-site gap is genuinely dead

Live HEAD probe of 60 real gaps:

| Result | Count |
|---|---|
| 404 — dead on Beatty's server | 53 |
| 300 — Apache MultiViews (see finding 5) | 4 |
| **2xx — recoverable** | **2** |
| Malformed URL rejected by urllib | 1 |

So ~88% of the live gap is unrecoverable by any crawler. Re-running the live crawl
buys single-digit page counts, not a corpus.

### 4. The corpus is historical — Wayback is mandatory, not optional

Wayback CDX for `amasci.com`, deduped by resolved local path (CDX collapses on
urlkey, which includes the host, so `amasci.com` and `www.amasci.com` produce two
rows per file — a raw row count is ~2× inflated):

```
CDX rows                        22,765
distinct file paths             22,575
present on disk                  1,394
absent                          21,181
  of which STATIC (mirrorable)  17,608
  of which dynamic/malformed     3,573
coverage vs Wayback                7.3%
```

Static paths we lack, by extension: `.html` 7,367 · `.jpg` 3,435 · `.htm` 2,694 ·
`.gif` 2,419 · `.txt` 591 · `.shtml` 165 · `.pdf` 62.

**~10,061 HTML pages of Beatty's writing that a live crawl can never reach.**

### 5. Apache MultiViews returns HTTP 300, and the engine drops those silently

```
http://amasci.com/freenrg/tors/tors.txt      300 Multiple Choices
```

The crawler treats non-200 as failure. MultiViews paths are therefore lost without
appearing anywhere as a problem. Small in count, but it is a silent-loss class,
which is the category this repo keeps getting hurt by.

---

## Site-specific traps (locked in tests)

- **Typo-variant directories are real content, not duplicates.** amasci serves
  both `/amateur/` and `/amatuer/` — Beatty's own misspelling, kept alive for old
  links — plus `amfrm/` and `amafrm/`. Any "dedupe near-identical names" cleanup
  destroys real pages.
- **`.txt` files are prose, not assets.** 181 of them (mailing-list archives, e.g.
  `freenrg/tors/tors.txt`). An HTML-only shortcut silently drops them, and Wayback
  has 591 more.
- **Query-string filenames are legitimate.** `sanitize_path` encodes them:
  `amateur/index.html__M%3DA`, `amateur/elehob.html__proceed%3D1`. Not corruption.
- **~2,000 `.cgi` URLs in Wayback.** Beatty's discussion/guestbook scripts. No
  static bytes; excluded by design.
- **99 externally-hosted PDFs** already listed in `sites/amasci.com/_missing_pdfs.txt`
  (arxiv, NASA, TI app-notes…). Out of domain scope; a separate fetch if wanted.

---

## Recipe

### Phase 1 — refresh the live layer (cheap, low yield, do it anyway)

```sh
./mirror-submit http://amasci.com/          # NOTE: http://, never https://
```

Expect ~2 recovered pages plus whatever Beatty has added since 2026-03-05. The
real reason to run it is that the engine now follows frames and will emit
`allpages.html` + the per-page markdown.

### Phase 2 — Wayback backfill (this is the actual job)

```sh
./mirror-submit amasci.com                  # bare domain ⇒ wayback mode
```

The engine already has scoped-CDX + alt-timestamp retry (PR #38, from the
pharis/villes lessons). Two things to decide before launching:

**⚠️ It will exceed the worker's push threshold.** `mirror-worker` has
`MAX_PUSH_SIZE_KB=1048576` (1 GB, `mirror-worker:24`) and above that it *commits
locally and skips the push*, logging a warning. 17,608 more files on top of today's
232 MB will very likely cross that. Either raise the threshold for this job, split
the crawl by path, or plan to land it in chunks. This is a decision, not something
to discover at hour six.

To split by path: `mirror.py` takes `--path` (dest `path_filter`) on both the
`wayback` and `live` subcommands — *"Only download URLs containing this path"*.
`mirror-submit` does not expose a flag for it; it infers the filter from the URL
you submit (`extract_path_filter`), so submit e.g.
`http://amasci.com/freenrg/` to scope a chunk. This is the samlib.ru lesson —
without a filter, BFS spidered to 327k URLs from one seed.

**⚠️ Wayback's `statuscode:200` filter still returns soft-404s.** Beatty's server
served content for some deleted pages. Expect some fraction of the 17,608 to be
error pages; `site_to_paper` will happily consolidate them. Worth a post-pass that
flags suspiciously short/duplicate bodies before the email analysis runs.

### Phase 3 — verify, don't assume

```sh
python3 scripts/mirror_coverage.py sites/amasci.com --scheme http
python3 scripts/mirror_coverage.py sites/amasci.com --wayback
python3 scripts/audit_frame_targets.py --missing-only
python3 -m unittest test_amasci_mirror -v
```

Coverage-vs-Wayback should move from 7.3% toward 90%+. If it doesn't, the backfill
did not do what the log said. `test_wayback_holds_far_more_than_the_live_site`
asserts coverage stays *under* 25% — when the backfill succeeds that test fails on
purpose, which is the signal to update the baseline.

### Phase 4 — feed the email analysis

`site_to_paper.py` already emits `_paper/pages/<NNN>-<slug>.md` per page — that is
the per-page unit the KeelyNet-style pass consumes. After backfill this goes from
728 to ~10,000 files, so decide batching before pointing the Mini's email
automation at it. `allpages.html` / `allpages.pdf` are the human-readable
counterpart (the longform stage skips the PDF above 300 pages and says so).

---

## Honest limits of this analysis

- Live-probe figures are from a **60-URL sample** of 287 gaps, not the full set.
  The 88%-dead conclusion is a sample estimate.
- The Wayback figure counts **paths**, not verified fetchable captures. Some of the
  17,608 will fail to retrieve or return soft-404s. 7.3% is a floor on our gap, not
  a promise that 17,608 documents are waiting.
- Nothing here has been executed. No crawl was run. This is the dry pass.
