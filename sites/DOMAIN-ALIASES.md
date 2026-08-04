# Domain aliases — pointer domains that hold no content of their own

Some domains in this archive's target list are not sites. They are **pointers**:
a frameset, a meta-refresh splash, or a bare redirect whose only payload is the
address of the real site. Mirroring one produces a single file of a few hundred
bytes and a `_paper/CONSOLIDATED.md` of a `<frameset>` tag — noise, not archive.

But the pointer itself is real provenance. It is often the domain people cite,
print on a business card, or link from a forum post. If it lapses, the archive
should still record where it resolved and when we last saw it do so.

So: **pointer domains are recorded here instead of getting a `sites/<domain>/`
directory.** One line, durable.

> Why here and not in the site's `SOURCE.txt`: `mirror.py` regenerates
> `SOURCE.txt` on every run (`write_source_info`, idempotent overwrite — last
> run wins), so a hand-added line there is wiped by the next re-mirror. This
> file is never touched by the engine.

## How these get found

The crawler declares, but does not follow, off-domain pointers:

- `<frame src>` / `<iframe src>` → `extract_frame_targets()`, reported in the
  `FRAMESET` block at the end of a crawl and written as `frame_target:` lines
  in the mirrored site's `SOURCE.txt`.
  See `features/frameset-following.feature`.
- `<meta http-equiv="refresh">` → `_extract_meta_refresh_targets()`.

Audit the whole archive for these with:

```sh
python3 scripts/audit_frame_targets.py            # all frame targets
python3 scripts/audit_frame_targets.py --missing-only   # only real content loss
```

## Aliases

| Pointer domain | Resolves to | Kind | Last verified | Mirror of the real site |
|---|---|---|---|---|
| `radiondistics.com` (`www.radiondistics.com`) | `www.radiondistics.altervista.org` | frameset (`rows="100%"`, single frame) | 2026-08-03 | [`sites/radiondistics.altervista.org/`](radiondistics.altervista.org/) |
| `free-energy.ws` (`www.free-energy.ws`) | `web.archive.org/web/20201022053921/http://free-energy.ws/index.php` | retirement notice → author-designated Wayback snapshot | 2026-08-04 | **already held**: `merlib-dump/free-energy.ws/` (Wayback, 1,862 CDX URLs, crawled 2026-02-04) |

### radiondistics.com

Francesco Errante, *Radiondistics* — physics of the radio waves,
radio-electrical & radio-electronics engineering.

The whole document is:

```html
<html><head><title>Radiondistics - Physics of the radio waves, radio-electrical
&amp; radio-electronics engineering - Errante - www.Radiondistics.com</title>
...</head>
<frameset rows="100%" border="0" framespacing="0" frameborder="0">
<frame name="main" src="https://www.radiondistics.altervista.org/"
       marginwidth="0" marginheight="0" scrolling="auto" noresize="noresize">
</frameset><noframes></noframes></html>
```

688 bytes, HTTP 200 as of 2026-08-03. `.com` is the identity Errante himself
used — the altervista site's own page titles read *"www.Radiondistics.com"* —
which is why the alias is worth recording even though the domain serves nothing.

History: this domain was PR #50 (empty — the frameset bug that
`features/frameset-following.feature` documents) and then PR #53 (correct, but
a 3-file site dir for a pointer). Both closed. The content lives in PR #52,
merged: `sites/radiondistics.altervista.org/`.

The verbatim 688-byte mirror (with its `meta description` / `keywords`) is kept
in git history rather than on disk — recover it with:

```sh
git show eb34f2c4:sites/www.radiondistics.com/index.html
```

### free-energy.ws

**Peter Lindemann, D.Sc.** — *Free Energy | Advanced Alternative Energy Solutions*. Clear Tech Inc,
Metaline Falls, WA. Copyright line still reads `2000-2026 Clear Tech Inc`.

**The domain is live and serves HTTP 200, but it is not the site.** It is a one-page retirement
notice; a live-mode mirror captures ~9.6 KB of WordPress shell and none of the content. Exactly the
trap this file exists to record.

Lindemann's own words on that page:

> "Former site of PETER LINDEMANN'S FREE ENERGY WEBSITE. As of **December 31, 2020**, Dr. Lindemann
> has **retired** from his public role in the Advanced Alternative Energy Research Community. The
> closing of this website, as well as the discontinuation of his periodic Newsletter service,
> consulting services, and role as a **public educator** are all a part of this retirement. If you
> would like access to the content that used to be here, you may follow this link to the 'Wayback
> Machine' and its archive copy of what the site looked like in **October 2020**."

🔴 **He RETIRED. He did not die.** Record it that way everywhere — cf. the archive rule that
"no longer with us" means left the group, not deceased.

**The content is ALREADY HELD, and not in this repo.** It lives in the archive repo, not
`merlib-mirror/sites/`:

```
~/work/merlib-dump/free-energy.ws/          # Wayback mirror: 857 files, 81 MB, 113 HTML, 60 PDF
~/work/merlib-dump/mirror_free_energy_ws.py # the bespoke crawler that made it
~/work/merlib-dump/free-energy.ws/_paper/   # consolidation, run 2026-08-04
```

Crawled 2026-02-04 by a bespoke script (`FREE-ENERGY.WS WAYBACK MIRROR`, 1,862 URLs from CDX,
snapshots from `20010302` onward) — so it spans the site's whole history, not just the October 2020
snapshot Lindemann points at. **Consolidated 2026-08-04** with this repo's own
`scripts/site_to_paper.py` + `scripts/site_to_allpages.py`: 113 pages → one 478-page PDF, one
longform HTML with 3,779 internal links rewritten to in-document anchors.

Analysis: `merlib-dump/articles/2026-08-04-what-peter-lindemann-did-free-energy-ws-corpus-analysis.md`.

Two further notes from the retirement page:
- Products moved to the original publisher: `https://emediapress.com/ref/3/`
- "This referral page will remain here until the **Fall of 2021**, after which it will be removed as
  well." Still up as of 2026-08-04, ~5 years past its own stated removal date. Don't rely on it.

Caveats Lindemann flags for the archived copy: some links stop forwarding, product links are dead,
newsletter sign-up forms no longer enrol anyone.
