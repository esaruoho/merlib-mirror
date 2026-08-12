# Mirror bug: relative links resolved against the *requested* URL, not the redirected one

**Found:** 2026-08-12, on the `mirror/newphysics.se` PR branch.
**Status:** FIXED 2026-08-12. Root cause confirmed, fix applied to `mirror.py` and
verified live against the failing URL. See "The fix — as applied" below.

## The question that surfaced it

> Does the newphysics.se PR contain `https://www.newphysics.se/archives/old-archive/free-energy/`?

**No.** The branch has the directory *listing* page and its 8 Apache sort-variants:

```
sites/newphysics.se/archives/old-archive/free-energy.html
sites/newphysics.se/archives/old-archive/free-energy__C%3D{D,M,N,S}%3BO%3D{A,D}.html
```

and **zero** of its contents. No `APerpetuumMobile.txt`, no `Bearden/`, no `Hyde/`,
no `Puthoff/`, no `Bailey/`, no `transmutation/`.

## Root cause

`mirror.py:1599`

```python
found_links = extract_links(content, page_url)
```

`page_url` is the URL that was **requested**. `fetch_url()` (mirror.py:246) returns
only `(content, content_type, ok)` — it never surfaces the URL that was actually
*served* after redirects.

Apache on newphysics.se 301-redirects bare directory paths to the trailing-slash form:

```
$ curl -o /dev/null -w "%{http_code} -> %{redirect_url}" \
    https://www.newphysics.se/archives/old-archive/free-energy
301 -> https://www.newphysics.se/archives/old-archive/free-energy/
```

So the crawler requests `.../old-archive/free-energy`, urllib silently follows the
301, and the listing HTML for `free-energy/` comes back. That HTML contains relative
hrefs — `APerpetuumMobile.txt`, `Bearden/`, `Hyde/`. Those get `urljoin`ed against the
**pre-redirect** base `.../old-archive/free-energy`, whose directory is
`.../old-archive/`. Every child link therefore resolves **one directory too high**:

| link in HTML | should resolve to | actually resolved to |
|---|---|---|
| `Hyde/` | `/archives/old-archive/free-energy/Hyde/` | `/archives/old-archive/Hyde/` |
| `APerpetuumMobile.txt` | `.../free-energy/APerpetuumMobile.txt` | `.../old-archive/APerpetuumMobile.txt` |

Verified live:

```
/archives/old-archive/free-energy/APerpetuumMobile.txt -> 200
/archives/old-archive/APerpetuumMobile.txt             -> 404
```

This is exactly the shape of the 72 failures in `_mirror.log`. The logged
`last fail:` samples are all one-level-too-high paths:

```
last fail: https://www.newphysics.se/archives/old-archive/Hyde/
last fail: https://www.newphysics.se/archives/old-archive/Rognerud/
last fail: https://www.newphysics.se/archives/old-archive/ColdFusionFAQ.html
last fail: https://www.newphysics.se/archives/old-archive/NewHydrogenTechnologiesandSpaceDrives2001.pdf
```

Sibling directories (`gravitation/`, `diverse/`, `conferences/`) *did* get their
children — because they happened to also be linked from somewhere with the trailing
slash already present, so a correct base was used on that visit.

## Blast radius on this mirror

Four Apache listings on the branch have no mirrored children at all:

- `archives/old-archive/free-energy.html`
- `archives/old-archive/parapsychological-effects.html`
- `archives/old-archive/quantum-mechanics.html`
- `archives/old-archive/relativity.html`

Re-walking those four subtrees live gives **47 URLs (~45 real files) across 17
directories** that the mirror does not have. Archive-central content among them:

- `free-energy/Bearden/` — 11 items incl. *The Final Secret of Free Energy with
  Comment*, *Additional Info on the Secret of Free Energy*, *Practical Overunity
  Electrical Device*, *Redefinition of Energy Ansatz*, *On A Testable*,
  `beard12/13/14`, `BeardenGivesUpOnPhaseConjugation.txt`,
  `NoringsForewordToAdditionalInfo.txt`
- `free-energy/Puthoff/` — *Everything for Nothing*, plus **Stockholm 1994 audio**
  (`Puthoff_on_Vacuum_in_Stockholm_1994.mp3`,
  `Vacuum_press_conference_Stockholm_1994.mp3` + .ram/.m3u/.asx)
- `free-energy/Hyde/` — `HYDEPTNT.doc`, `hydeptnt.txt`, `HydesPictures.html`,
  FIG1–FIG6 GIFs
- `free-energy/Bailey/A Critical Review reg ZPE.txt`
- `free-energy/` top level — `APerpetuumMobile.txt`, `FreeEnergyBooks.txt`,
  `FreeEnergyNewsJuly94.txt` (50K), `MonopolePerpetuumMobile.txt`,
  `PatentsOnPerpetuumMobiles.txt`
- `quantum-mechanics/` — `BellOnQFT16Jul94.txt`, `GellMan_Flapdoodle.txt`,
  `LaViolette/sqk-adv.txt`
- `relativity/Rognerud/ff.pdf`
- `parapsychological-effects/remote-viewing/CIA-on-RV.txt`

The `_paper/` consolidation was built from the incomplete crawl, so it is missing
this material too.

## The fix — as applied

1. **`_fetch_urllib()` / `_fetch_scrapling()` now return a 4-tuple** ending in
   `final_url` — `resp.geturl()` for urllib, `response.url` for Scrapling. Every
   return path sets it, including the https→http transport fallback and the
   HTTP-status error paths.

2. **`fetch_url(..., with_final=False)`** — opt-in 4-tuple. Twelve callers only want
   the body and keep the old 3-tuple unchanged; the crawl loop is the one place that
   must know the post-redirect URL, so only it passes `with_final=True`.

3. **New `effective_base_url(content, page_url, final_url)`** decides what relative
   links resolve against, three sources, most authoritative first:
   - `<base href>` — the page's own explicit declaration, always wins.
   - An `Index of /path` `<title>`/`<h1>` — a server-generated listing states its own
     directory. This is what rescues the **cached** branch of the crawl, which
     re-reads pages from disk and has no response object to consult.
   - `final_url`, else the requested URL.

4. **Crawl loop** (`extract_links` / `extract_frame_targets`) now takes that base
   instead of `page_url`. The cached branch passes `final_url=None` and relies on the
   `Index of` heuristic.

5. **Redirect targets are marked seen.** After a redirect, the body for `final_url` is
   already in hand, so `seen.add(dedup_key(final_url))` stops a later link to the
   trailing-slash form from being a second round-trip.

6. **`save_page()` deliberately still writes under the REQUESTED path.** Switching to
   the final path would relocate files across every already-mirrored site and would
   break the on-disk cache check (`sanitize_path(page_url)`), causing a full refetch
   on every subsequent run. The listing lands at `free-energy.html` and its children
   at `free-energy/…` — the same shape `gravitation` already has.

### Verification

```
$ python3 -c "... fetch_url(.../old-archive/free-energy, with_final=True) ..."
ok= True final= https://www.newphysics.se/archives/old-archive/free-energy/
base=            https://www.newphysics.se/archives/old-archive/free-energy/
   .../free-energy/APerpetuumMobile.txt
   .../free-energy/Bailey/
   .../free-energy/Bearden/
   .../free-energy/FreeEnergyBooks.txt
   .../free-energy/FreeEnergyNewsJuly94.txt
   .../free-energy/Hyde/
   .../free-energy/JosephNewman/
   .../free-energy/MonopolePerpetuumMobile.txt
   .../free-energy/PatentsOnPerpetuumMobiles.txt
   .../free-energy/Puthoff/
   .../free-energy/transmutation/
--- 3-tuple compat --- 3
```

Unit-checked separately: `<base href>` overrides the `Index of` heading; an ordinary
page with neither falls through to the requested URL unchanged.

## Still open

This is not newphysics-specific. **Every already-mirrored site whose server
301s `/dir` → `/dir/` has the same hole.** A sweep across `sites/` for `X.html` files
that have `X__C%3D…` sort-variants but no `X/` directory would find them. Not done yet.

## The open PR

Superseded by the re-run on the fixed crawler rather than merged as-is — the missing
5% was the Bearden/Puthoff/Hyde free-energy core, which is the reason to mirror this
site at all.
