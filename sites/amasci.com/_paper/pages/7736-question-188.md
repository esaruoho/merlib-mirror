---
title: "Question 18.8"
source_domain: amasci.com
source_path: ~scs/C-faq/q18.8.html
order: 7736
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T06:00:19Z
extractor: site_to_paper.py (pandoc)
---

# Question 18.8

*Source page: `~scs/C-faq/q18.8.html`*

### Question 18.8

Don't ANSI function prototypes render `lint` obsolete?

------------------------------------------------------------------------

Not really. First of all, prototypes work only if they are present and correct; an inadvertently incorrect prototype is worse than useless. Secondly, `lint` checks consistency across multiple source files, and checks data declarations as well as functions. Finally, an independent program like `lint` will probably always be more scrupulous at enforcing compatible, portable coding practices than will any particular, implementation-specific, feature- and extension-laden compiler.

If you do want to use function prototypes instead of `lint` for cross-file consistency checking, make sure that you set the prototypes up correctly in header files. See questions [1.7](q1.7.html) and [10.6](q10.6.html).

------------------------------------------------------------------------

Read sequentially: <a href="q18.7.html" rev="precedes">prev</a> <a href="q18.9.html" rel="precedes">next</a> <a href="s18.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
