# FEATURE CARD — merlib-mirror: mirror → ONE cohesive paper, autonomously
#
# WHAT THIS CARD SPAWNS
#   Codespace  : scripts/site_to_paper.py · mirror-worker (two new stages before commit_and_push)
#   Thinkspace : features/mirror-consolidation.session.md
#   Areaspace  : OWNS post-crawl derivation of readable text from an already-mirrored site tree.
#                MUST NOT touch: the crawl itself (mirror.py), queue semantics, git/PR mechanics,
#                or any originally-mirrored byte. Derived output is additive, under <site>/_paper/ only.
#
# RESULT
#   Feature commits : see RESULT-LOG / git log for scripts/site_to_paper.py + mirror-worker
#   PR              : direct-push to main (no PR — mirror-worker/scripts are infrastructure,
#                     not a mirror branch; mirror OUTPUT still goes through mirror/* PRs)
#   Files changed   : scripts/site_to_paper.py (new), mirror-worker (+2 stages),
#                     features/mirror-consolidation.feature (new),
#                     features/mirror-consolidation.session.md (new)
#   Origin          : Esa, 2026-07-29 — "would make it easier to synthesize. i think this should be
#                     a convey mirror feature so that the original content is stored and mirrored,
#                     but then the result is also created automatically and autonomously."
#
# BACK-LINK: greppable marker `FEATURE-CARD >> features/mirror-consolidation.feature`
#            is present in scripts/site_to_paper.py and in the mirror-worker stage comments.

Feature: A mirrored site is also delivered as one cohesive, synthesisable document

  The mirror preserves the original. That is half the job. A site arrives as N
  scattered pages in filesystem order, which is not the author's order — so
  synthesis starts by re-deriving a reading sequence by hand, every time. This
  feature makes the consolidated result a product of the mirror run itself, not
  a follow-up task. Same move as the KeelyNet converter
  (merlib-dump/scripts/convert_keelynet.py: ~994 scattered .ASC files → per-file
  markdown with YAML frontmatter), plus the step KeelyNet never had: stitching.

  Background:
    Given a completed mirror at sites/<domain>/ containing HTML pages and assets

  @built
  Scenario: Per-page markdown in the KeelyNet shape
    When the consolidation stage runs
    Then each HTML page becomes _paper/pages/<NNN>-<slug>.md
    And each carries YAML frontmatter: title, source_domain, source_path, order,
        reachable_from_entry, images, internal_links, extracted, extractor
    And the body is pandoc html→gfm when pandoc is present
    # cite: scripts/site_to_paper.py  build() per-page loop
    # mechanism: script python3 scripts/site_to_paper.py <site-dir>

  @built
  Scenario: One consolidated paper in the site's OWN reading order
    When the consolidation stage runs
    Then _paper/<domain>-CONSOLIDATED.md contains frontmatter, a provenance note,
         a linked table of contents, and every page as a section
    And the order is breadth-first from the entry page following each page's links
         in document order — NOT alphabetical filenames
    # cite: scripts/site_to_paper.py  find_entry() + BFS in build()
    # mechanism: script python3 scripts/site_to_paper.py <site-dir>

  @built
  Scenario: Nothing is silently dropped
    Given pages that the link graph never reaches from the entry page
    When the consolidation stage runs
    Then those pages are appended under an explicit "Unreached pages" heading
    And the counts pages_total / pages_reachable_from_entry / pages_unreached
         appear in the frontmatter and in _manifest.json
    # cite: scripts/site_to_paper.py  orphans handling
    # Honesty: this is the no-silent-caps rule applied to a machine stage.

  @built
  Scenario: The consolidation is a stage of the mirror, not a separate chore
    Given mirror-worker has finished a crawl successfully
    When it reaches the success path before commit_and_push
    Then it runs site_to_paper.py against the site dir
    And a consolidation failure is logged as a WARNING and does NOT fail the mirror
    And the worker self-updates on script change (sync_repo hash → exec), so pushing
        this file deploys the stage with no restart command
    # cite: mirror-worker:503-513 consolidation stage
    # cite: mirror-worker:171-192 get_worker_hash + sync_repo self-update

  @built
  Scenario: A live crawl of a www-hosted site no longer loses its files
    Given mirror.py's run_live names its output dir from urlparse().hostname
    And the job's `domain:` field is the www-stripped host
    When the two disagree
    Then mirror-worker folds sites/www.<domain>/ into sites/<domain>/ before committing
    # cite: mirror-worker:486-501 www. normalisation
    # cite: mirror.py:1073 run_live — `domain = parsed.hostname or ''`
    # Incident: 2026-07-29 radiondistics — 214 files crawled OK, PR #49 contained
    #           ONLY _mirror_worker.log. Recovered by hand; this stage prevents recurrence.

  @verified
  Scenario: Verified on a real corpus
    Given the radiondistics.altervista.org mirror (218 files)
    When site_to_paper.py runs against it
    Then it reports 55 HTML pages, entry=index.htm, reachable=55, unreached=0
    And writes a 1,163,049-character consolidated document plus 55 per-page files
    # Observed 2026-07-29 16:58 EEST. Byte counts from the run, not estimated.

  @untested
  Scenario: Wayback-mode mirrors
    # The stage is mode-agnostic by construction (it walks a finished site dir),
    # but it has NOT been exercised on a wayback-mode job yet. Grade stays
    # @untested until one runs. Do not upgrade this without an observed run.

  @todo
  Scenario: Boilerplate suppression
    # Site-wide nav/footer text repeats once per page (radiondistics: the nav
    # phrase appears 19×), inflating the consolidated body. A shingle-based
    # repeated-block detector would strip it. Not built — the raw consolidation
    # is correct and complete, just fatter than necessary.

  @todo
  Scenario: Feed the consolidated paper onward automatically
    # Natural next stations: `convey ingest` / DreamGraph feed / needs-analysis
    # ledger registration, so a mirror lands in the analysis queue with no
    # command. Deliberately NOT wired yet — one stage at a time.
