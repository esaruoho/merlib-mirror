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

Tested, not assumed: 60 random Wayback-only HTML paths, HEADed against the live
server — **57 returned 404, 3 returned 200.** The pages are gone from Beatty's
own server, not merely undiscovered. But see Phase 1b: that live 5% is real, and
Wayback earns its place as a URL *index* even for pages you then fetch live.

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

### Phase 1 — SEEDED live crawl (this turned out to be the big win, not Wayback)

Correction to an earlier version of this plan, which called Phase 1 "cheap, low
yield". It is not low yield, because **the site publishes its own inventory** and
BFS from the entry page never reads it:

| Discovery channel | Seeds contributed |
|---|---|
| `robots.txt` → `Sitemap: http://amasci.com/googmap.xml` (Beatty's own sitemap, 899 URLs) | **897** |
| `/sitemap.html` — found via the **HTTP 300 MultiViews** response, which *names the real file* | 15 |
| Internal-link gap (pages we cite but lack) | 272 |
| The site's own index/stats pages (`stats/idbylink2.html` alone has 1,517 links) | 201 |
| — excluded by `robots.txt` Disallow (72 rules) | −1 |
| **Total** | **1,384** |

**209 of the 899 URLs in Beatty's own sitemap (23%) were absent from our mirror** —
`blog.html`, `books1.html`, `feynexpt.txt`, `feyntape.html`, `buscards.html`. All
live. None reachable by link-following.

```sh
python3 scripts/build_seed_list.py amasci.com --out amasci-seeds.txt
python3 mirror.py live http://amasci.com/ --seeds amasci-seeds.txt \
        --max-pages 40000 --output-dir sites
```

Two things that matter here:

- **`--seeds` already existed** in `mirror.py live`. Check before building.
- **`--max-pages` must be raised.** `MAX_DISCOVER_PAGES` defaults to **500**, which
  silently caps link discovery far below this site's size. Left at the default, the
  crawl stops long before the corpus does — another quiet-ceiling failure.

The HTTP 300 handling is worth generalising: Apache's MultiViews body lists
`Available documents`, so a 300 is not a dead end, it is a *rename hint*. Today
`build_seed_list.py` parses it; the crawler still treats 300 as a failure.

#### ⚠️ Explicit seeds get starved by BFS discoveries

Observed live during the run. In `run_live`, a discovered link that is
`is_under_seed_path()` is **`queue.appendleft`**-ed as a priority — and when the
seed path is `/` (a whole-domain crawl) *every* discovered link qualifies. So each
newly-found URL is prepended ahead of the remaining explicit seeds, and the
1,384-URL seed list sinks to the back of the deque.

That matters here because `stats/idbylink2.html` is an index of the site's
*historical* pages, so BFS immediately floods the front of the queue with
thousands of URLs that are **404**, while the authoritative
sitemap seeds — which are live and are the whole reason for seeding — wait behind
them. Measured: after 560 URLs processed, ~70 failures and only **2** new files,
with known-live sitemap pages (`buscards.html`, `books1.html`, `devices.txt`,
`eaton.txt`, `feynexpt.txt` — all HTTP 200) not yet reached.

Not a correctness bug: with a high `--max-pages` the crawl still reaches them, and
nothing is lost. But the ordering is backwards — an explicit seed came from the
owner's own inventory and should outrank a link scraped from a stats page. Worth
fixing as "seeds first, discoveries after", i.e. keep seeds in their own queue that
drains before the discovery queue.

### Phase 1b — Wayback as an INDEX, fetched from the LIVE server

**"Why use Wayback when amasci is online right now?"** — the right question, and it
splits Wayback's job in two. Wayback is a **URL index** as well as a content store,
and the index part is useful *even for pages you then fetch live*: BFS from the
entry page cannot reach a page nothing links to.

Measured proof — `http://amasci.com/refs.html` (William Beaty's own résumé, at the
site root) is **live right now**, absent from our mirror, and was never discovered
by link-following because nothing surviving links to it. Same for
`weird/unusual/blll.html` and `tesla/tespics.html`.

```sh
python3 scripts/mirror_coverage.py sites/amasci.com --wayback \
        --probe-wayback 200 --seed-list amasci-live-seeds.txt
```

That HEADs Wayback-only paths against the live server and splits them:

| | 60-path sample | extrapolated over 17,608 |
|---|---|---|
| still LIVE → **fetch from live** | 3 (5%) | ~880, minus junk paths |
| gone → Wayback is the only source | 57 (95%) | ~16,700 |

Fetch the seed list from the **live** server: canonical bytes, current content, no
Wayback toolbar to strip, no CDX rate limits. Only go to Wayback for what is
actually gone.

*(Caveat: one of the three "live" hits was `http://www.amasci.com/%20` — a junk
path, not a page. The real live yield is a bit under 5%, so treat ~880 as a
ceiling. `classify_missing` does not currently reject whitespace-only paths.)*

### Phase 2 — Wayback backfill for the ~95% that are genuinely gone

```sh
./mirror-submit amasci.com                  # bare domain ⇒ wayback mode
```

The engine already has scoped-CDX + alt-timestamp retry (PR #38, from the
pharis/villes lessons). Two things to decide before launching:

**Size, measured rather than feared.** CDX also returns record lengths
(`fl=original,length`), so the backfill can be sized before running it. Summed over
the 17,605 absent static paths: **0.42 GB** WARC-compressed.

| | files | MB |
|---|---|---|
| `.jpg` | 3,435 | 112.3 |
| `.zip` | 70 | 50.6 |
| `.mvr` | 14 | 45.9 |
| `.pdf` | 62 | 37.4 |
| `.html` | 7,364 | **29.7** |
| `.gif` | 2,419 | 21.9 |

Two things fall out of that:

- **The whole text corpus is tiny.** 7,364 HTML pages total 29.7 MB. The bulk is
  images and a handful of `.zip`/`.mvr`/`.r00`–`.r02` archive blobs.
- **`.zip` is already excluded** by `should_skip_url`'s `skip_exts`, so ~50 MB of
  that never downloads.

So the realistic landing zone is **232 MB (now) + ~370 MB ≈ 600 MB** — *under* the
1 GB gate. The threshold concern below is therefore probably moot for amasci, but
it is still worth knowing, because it is silent when it trips.

**⚠️ If it does exceed the worker's push threshold.** `mirror-worker` has
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

## Wayback CDX is flaky, and a truncated response lies in the safe direction

While writing this, one CDX call returned **208** HTML paths where the true figure
is **10,061** — a 50× under-report — and the next call returned `HTTP 504`. A
truncated inventory is worse than an error: it makes the archive look *better*
covered than it is, silently. Same failure class as `Failed: 0`.

`wayback_inventory()` now caches to `.cache/cdx-<domain>.txt` (gitignored, 24 h),
retries with backoff, and **refuses a fresh response less than half the size of one
it has already seen**, falling back to the known-good cached copy. The tests skip
rather than fail when CDX is unreachable, so a Wayback outage never reads as a
finding about amasci.

Verified stable across repeated calls once cached: 22,765 rows, 7,471 `.html`,
2,702 `.htm`.

## Honest limits of this analysis

- Live-probe figures are from a **60-URL sample** of 287 gaps, not the full set.
  The 88%-dead conclusion is a sample estimate.
- The Wayback figure counts **paths**, not verified fetchable captures. Some of the
  17,608 will fail to retrieve or return soft-404s. 7.3% is a floor on our gap, not
  a promise that 17,608 documents are waiting.
- Nothing here has been executed. No crawl was run. This is the dry pass.
