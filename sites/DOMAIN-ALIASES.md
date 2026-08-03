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
