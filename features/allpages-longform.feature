# FEATURE CARD — merlib-mirror: a mirrored site as ONE longform document (+PDF)
#
# WHAT THIS CARD SPAWNS
#   Codespace  : scripts/site_to_allpages.py · scripts/site_to_paper.py
#                (collect_html_pages + reading_order factored out for sharing)
#                · mirror-worker (longform stage after consolidation)
#   Thinkspace : features/frameset-following.session.md (same session)
#   Areaspace  : OWNS derivation of a single readable/printable document from an
#                already-mirrored tree, under <site>/_paper/ only.
#                MUST NOT touch: the crawl, queue semantics, git/PR mechanics, or
#                any originally-mirrored byte. Output is additive and derived.
#
# RESULT
#   Feature commit : 0449d5c3  feat(mirror): longform allpages.html + PDF —
#                              no more "click here to see yet another page"
#   PR             : direct-push to main (engine infrastructure, not a mirror branch)
#   Files changed  : scripts/site_to_allpages.py (new) · scripts/site_to_paper.py
#                    (refactor) · mirror-worker (+1 stage) ·
#                    sites/radiondistics.altervista.org/_paper/allpages.{html,pdf}
#   Origin         : Esa, 2026-08-03 — "can the altervista version be additionally
#                    added as a method for there to be a longform single article
#                    with all the content, instead of 'click here to see yet
#                    another page' … and print that to PDF."
#
# BACK-LINK: `FEATURE-CARD >> features/allpages-longform.feature` in
#            scripts/site_to_allpages.py and the mirror-worker longform stage.

Feature: A mirrored site reads as one document, not a maze of "click here"

  site_to_paper.py already emitted a consolidated MARKDOWN paper. That is the right
  shape for grep and for feeding a model, and the wrong shape for reading and
  printing: images gone, tables flattened, no PDF. This is the other half.

  Background:
    Given a completed mirror at sites/<domain>/ with HTML pages and assets

  @hw-verified
  Scenario: Every internal link becomes an in-document anchor
    Given a page linking to another mirrored page
    When the longform document is built
    Then that href is rewritten to "#page-NNN"
    And the reader never leaves the document to follow it
    # cite: scripts/site_to_allpages.py  BodyRewriter._rewrite()
    # verified: radiondistics.altervista.org — 772 internal links → anchors,
    #           885 asset paths rewritten to ../<relpath>
    # mechanism: python3 scripts/site_to_allpages.py sites/<domain>

  @hw-verified
  Scenario: One HTML document and one PDF
    Then <site>/_paper/allpages.html holds every page in reading order
    And <site>/_paper/allpages.pdf is the printed form
    # verified: allpages.html 1,624,963 chars / 56 pages;
    #           allpages.pdf 481 A4 pages, 5.9 MB, WeasyPrint 68.1
    # mechanism: pdfinfo sites/<domain>/_paper/allpages.pdf

  @hw-verified
  Scenario: The same reading order as the markdown paper, not a second opinion
    Then both consolidators use site_to_paper.collect_html_pages() and
         reading_order()
    And the paper and the longform document present the identical sequence
    # cite: scripts/site_to_paper.py  collect_html_pages() · reading_order()
    # Refactor verified behaviour-preserving: site_to_paper still reports the
    # identical 56 pages / 1,163,231 chars after extraction.
    # A reader comparing the two must not find two different documents.

  @built
  Scenario: Nothing is silently dropped
    Given pages the link graph never reaches from the entry page
    Then they are APPENDED after the reachable run
    And each is flagged in-document as "not linked from the entry page"
    # A page we hold but never show is a silent loss — the exact failure class
    # this repo keeps getting bitten by.

  @built
  Scenario: A frameset page says so instead of looking empty
    Given a page with no <body> of its own
    Then its section carries an explicit frameset/redirect note
    # Otherwise a blank section reads as "this page was empty", which is a lie.
    # See features/frameset-following.feature.

  @built
  Scenario: Per-page CSS cannot restyle the whole document
    Given 56 pages of independently-authored 1990s CSS
    Then <script>, <style> and stylesheet <link>s are dropped
    But inline style="" attributes are kept, being element-scoped
    # cite: scripts/site_to_allpages.py  DROP_ELEMENTS
    # In a stitched document a page's body{} / a{} selectors would restyle every
    # OTHER page too.

  @built
  Scenario: URL rewriting cannot catastrophically backtrack
    Then rewriting is done by an HTMLParser subclass, never a regex
    # cite: scripts/site_to_allpages.py  BodyRewriter
    # A regex over a whole document needs `[^>]*?` before a literal before
    # another class — the shape this project has BANNED after burning 27.6h of
    # CPU on one pattern. A parser is linear and cannot blow up.

  @built
  Scenario: The PDF is capped loudly, never silently
    Given a site larger than --pdf-max-pages
    Then the PDF is SKIPPED, the skip is logged, and the exact command to build
         it anyway is printed
    And the HTML is still complete
    # cite: scripts/site_to_allpages.py  pdf_max_pages branch
    # mirror-worker passes --pdf-max-pages 300 (git size + weasyprint cost).

  @built
  Scenario: Runs as part of the belt
    Then mirror-worker builds it after the consolidation stage, non-fatally
    # cite: mirror-worker  "longform stage"
    # A longform failure must not fail a good mirror.

  @todo
  Scenario: Dead upstream images are marked in the document
    Given an img src that exists in the source HTML but nowhere on disk
    Then the reader currently sees a broken image with no explanation
    # Measured on radiondistics: 3 such srcs (images/feynman/fig_{a,g,i}.gif),
    # all 404 on the LIVE site too — so the mirror is not at fault. Rendering a
    # visible "missing upstream" placeholder would say that out loud.
