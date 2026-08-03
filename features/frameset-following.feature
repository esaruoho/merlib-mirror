# FEATURE CARD — merlib-mirror: follow <frame>/<iframe> src, and say so when the content is off-domain
#
# WHAT THIS CARD SPAWNS
#   Codespace  : mirror.py (extract_frame_targets · _LinkExtractorHTML · extract_links ·
#                run_live crawl loop · write_source_info) · scripts/site_to_paper.py (reachability)
#                · mirror-worker (NORMALISED_FROM staging)
#   Thinkspace : features/frameset-following.session.md
#   Areaspace  : OWNS which URLs a crawl considers reachable from an HTML page, and how a
#                mirror declares content it deliberately did NOT capture.
#                MUST NOT touch: fetch/retry policy, queue semantics, Wayback CDX logic,
#                or should_skip_url's domain rule (off-domain frames stay OUT of scope —
#                this feature makes the exclusion LOUD, it does not widen the crawl).
#
# RESULT
#   Feature commits : eb34f2c4  fix(mirror): follow <frame>/<iframe> src — a frameset mirrored
#                               as ONE file and reported success
#                     68dd37f7  fix(worker): record BOTH halves of the www.<domain> -> <domain>
#                               rename
#   PR              : direct-push to main (no PR — mirror.py/mirror-worker are engine
#                     infrastructure; mirror OUTPUT still goes through mirror/* PRs)
#   Files changed   : mirror.py · test_mirror.py (+13 tests, 67 → 80) ·
#                     scripts/site_to_paper.py · mirror-worker ·
#                     features/frameset-following.feature (new) ·
#                     features/frameset-following.session.md (new)
#   Superseded PRs  : #49 (mirror/radiondistics.altervista.org), #50 (mirror/radiondistics.com)
#                     — both carried only _mirror_worker.log; closed with the diagnosis, and
#                     re-run through the fixed belt (queue commit 2250f794)
#   Origin          : Esa, 2026-08-03 — "you have not succeeded in using merlib-mirror to mirror,
#                     properly, the radiondistics, please. figure out what the errors are, and fix them"
#
# BACK-LINK: greppable marker `FEATURE-CARD >> features/frameset-following.feature`
#            is present in mirror.py (extract_frame_targets) and in the mirror-worker
#            NORMALISED_FROM staging comment.

Feature: A frameset site cannot mirror as one file and call itself complete

  radiondistics.com's entire body is

    <frameset><frame src="https://www.radiondistics.altervista.org/">

  extract_links looked at a/img/link/script and meta-refresh, never at frame or
  iframe src. So the crawl found 0 links, stopped at 1 page / 688 bytes, and
  logged "LIVE MIRROR COMPLETE ... Downloaded: 1, OK: 1, Failed: 0". A total
  content miss that reads as success — the worst possible failure shape for an
  archive, because nothing ever asks to be re-run.

  This is the same shape as the meyl.eu meta-refresh splash page, which already
  got its own extractor (_extract_meta_refresh_targets). Frames are the other
  half of "pages with no <a> tags", and 1990s/2000s engineering sites — exactly
  this archive's target class — are full of them.

  Background:
    Given a live-mode crawl of a domain

  @hw-verified
  Scenario: A same-domain frame is crawled
    Given a page containing <frame src="mismatching_simulator.htm">
    When links are extracted from that page
    Then the resolved URL is queued and downloaded
    And should_skip_url does not drop it
    # cite: mirror.py  extract_frame_targets() · _LinkExtractorHTML.handle_starttag (frame/iframe)
    #       · extract_links() (both parser backends)
    # verified: live re-crawl of www.radiondistics.altervista.org recovered
    #           mismatching_simulator.htm (1,583 bytes, HTTP 200, iframed from
    #           balanced_lines.htm + linee_bilanciate.htm) — 214 → 215 files.
    #           It had been silently missing since the site was first mirrored.
    # mechanism: python3 mirror.py live <url> --output-dir sites

  @hw-verified
  Scenario: An off-domain frame target is EXCLUDED but declared, never silently dropped
    Given a frameset whose frame src points at another host
    When the crawl finishes
    Then the target is NOT downloaded (it is out of scope for this domain)
    And the log ends with a FRAMESET block naming every off-domain target
    And SOURCE.txt carries a `frame_target: <url>` line for each
    # cite: mirror.py  run_live() offsite_frames set · the FRAMESET log block ·
    #       write_source_info(frame_targets=...)
    # verified: www.radiondistics.com → 1 file, and SOURCE.txt now says
    #           `frame_target: https://www.radiondistics.altervista.org/`.
    #           www.radiondistics.altervista.org → 4 declared targets
    #           (2 YouTube embeds, 1 Vimeo, 1 unitconverters.net calculator).
    # mechanism: python3 mirror.py live <url> --output-dir sites; cat <site>/SOURCE.txt

  @hw-verified
  Scenario: A 1-file mirror is correct when the site really is one page
    Given radiondistics.com, which is a pure frameset and nothing else
    When it is mirrored
    Then the mirror is 1 file — and that is the right answer
    And the mirror declares where its content actually lives
    # This is the point of the feature. The bug was never "1 file is wrong";
    # it was that 1 file was indistinguishable from a complete mirror.

  @hw-verified
  Scenario: A framed-in page counts as reachable in the consolidated paper
    Given a page reachable only via an iframe from another page
    When site_to_paper.py builds the reading order
    Then that page is reachable_from_entry, not an orphan
    # cite: scripts/site_to_paper.py  handle_starttag (frame/iframe → links)
    # verified: www.radiondistics.altervista.org consolidated paper 55 → 56 pages,
    #           "reachable=56 · unreached=0" (was reachable=55 · unreached=1).
    # mechanism: python3 scripts/site_to_paper.py sites/<domain>

  @built
  Scenario: Non-navigable frame schemes are ignored
    Given iframes with src of javascript:, about:blank, data:, mailto: or #
    When frame targets are extracted
    Then none of them are queued
    # cite: mirror.py  extract_frame_targets() scheme filter
    # mechanism: python3 -m unittest test_mirror.TestExtractFrameTargets

  @built
  Scenario: The www. rename is recorded in BOTH halves
    Given main tracks a site under sites/www.<domain>/ from an earlier buggy run
    When the worker normalises it to sites/<domain>/
    Then the commit adds the canonical path AND removes the stale www. path
    And the add stays path-scoped — never git add -A
    # cite: mirror-worker  NORMALISED_FROM (set in normalisation, staged in commit_and_push)
    # Without this the rename was half-recorded: a duplicate site on main plus
    # unstaged phantom deletions for the repo-puller to fight.

  @hw-verified
  Scenario: The whole archive is audited for this class of loss, not just the site that exposed it
    Given the gap was silent — a framed-in page has no <a> pointing at it, so a
          mirror missing one looks complete and its log says "Failed: 0"
    When scripts/audit_frame_targets.py re-reads every mirrored HTML page with
          the fixed extractor
    Then every same-domain frame target must exist on disk
    And off-domain frame targets are listed as referenced-but-not-held
    # cite: scripts/audit_frame_targets.py
    # verified 2026-08-03, all 40+ mirrored sites:
    #   same-domain framed pages MISSING = 0  (radiondistics was the only victim,
    #   recovered in eb34f2c4 — so the archive is now clean for this bug class)
    #   off-domain embeds referenced but not held = 335, across amasci.com,
    #   tesla.hu, vivavortex.wordpress.com, www.radiondistics.altervista.org,
    #   www.radiondistics.com (mostly YouTube/Vimeo)
    # Exit status is 1 if anything is missing, so this can gate CI.
    # mechanism: python3 scripts/audit_frame_targets.py --missing-only

  @built
  Scenario: Regression coverage
    Then test_mirror.py covers absolute/relative/iframe/multi-frame extraction,
         scheme filtering, bytes input, the real radiondistics.com frameset,
         the same-domain-crawlable case, and SOURCE.txt frame_target lines
    And the suite is 80 tests, up from 67
    # mechanism: python3 -m unittest test_mirror

  @todo
  Scenario: Off-domain frame targets are auto-queued as their own jobs
    Given a frameset declaring content on another host
    Then the operator is told to queue it — but nothing queues it automatically
    # Deliberately manual for now: auto-queueing an arbitrary off-domain host from
    # a frame src is how a crawl escapes its scope. The declaration in SOURCE.txt
    # is the safe half. Revisit only with an allowlist.
