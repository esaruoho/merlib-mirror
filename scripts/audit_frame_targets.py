#!/usr/bin/env python3
"""Archive-wide audit: are any framed-in pages missing from our mirrors?

FEATURE-CARD >> features/frameset-following.feature

Until 2026-08-03 the crawler never followed <frame>/<iframe> src (see the card).
That gap is silent by construction: a framed-in page has no <a> pointing at it,
so a mirror missing it looks complete and its log says "Failed: 0". This script
is the completeness check for that class of loss — it re-reads every mirrored
HTML page with the now-fixed extractor and reports:

  MISSING      same-domain frame target that is NOT on disk  → real content loss,
               re-run that domain's mirror to recover it
  off-domain   frame target on another host → correctly out of scope, listed so
               the archive knows what it references but does not hold

Read-only. No network. Safe to run any time.

Usage:
    python3 scripts/audit_frame_targets.py [--missing-only] [SITES_DIR]

Exit status is 1 if any same-domain page is missing, else 0 — so it can gate CI.
"""

import os
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import mirror  # noqa: E402


def audit(sites_dir):
    """Return {site: {'missing': sorted[...], 'offsite': sorted[...]}}."""
    report = {}
    for site in sorted(os.listdir(sites_dir)):
        root = os.path.join(sites_dir, site)
        if not os.path.isdir(root):
            continue
        # sites/ dirs are named by hostname; the job's domain is the stripped host.
        domain = site[4:] if site.startswith('www.') else site
        missing, offsite = set(), set()

        for dirpath, _dirs, files in os.walk(root):
            # Derived output, not mirrored bytes — skip.
            if '_paper' in dirpath or '_pdfs' in dirpath:
                continue
            for fname in files:
                if not fname.lower().endswith(('.htm', '.html')):
                    continue
                path = os.path.join(dirpath, fname)
                try:
                    with open(path, errors='ignore') as fh:
                        text = fh.read()
                except OSError:
                    continue
                rel = os.path.relpath(path, root).replace(os.sep, '/')
                base = f'https://{site}/{rel}'
                for url in mirror.extract_frame_targets(text, base):
                    if mirror.should_skip_url(url, domain):
                        offsite.add(url)
                        continue
                    local = os.path.join(root, mirror.sanitize_path(url))
                    if not (os.path.exists(local) and os.path.getsize(local) > 0):
                        missing.add(url)

        if missing or offsite:
            report[site] = {'missing': sorted(missing), 'offsite': sorted(offsite)}
    return report


def main(argv):
    missing_only = '--missing-only' in argv
    args = [a for a in argv[1:] if not a.startswith('--')]
    sites_dir = args[0] if args else os.path.join(
        os.path.dirname(os.path.dirname(os.path.abspath(__file__))), 'sites')

    report = audit(sites_dir)
    total_missing = sum(len(v['missing']) for v in report.values())
    total_offsite = sum(len(v['offsite']) for v in report.values())

    for site, found in report.items():
        if missing_only and not found['missing']:
            continue
        print(site)
        for url in found['missing']:
            print(f'   MISSING (same-domain, never fetched): {url}')
        if not missing_only:
            for url in found['offsite']:
                print(f'   off-domain embed (out of scope): {url}')

    print()
    print(f'same-domain framed pages MISSING from the archive: {total_missing}')
    print(f'off-domain embeds referenced but not held:         {total_offsite}')
    if total_missing:
        print('\nRe-run the affected domains to recover the missing pages:')
        for site, found in report.items():
            if found['missing']:
                print(f'  ./mirror-submit https://{site}/')
    return 1 if total_missing else 0


if __name__ == '__main__':
    sys.exit(main(sys.argv))
