---
title: "Question 6.1"
source_domain: amasci.com
source_path: ~scs/C-faq/q6.1.html
order: 7741
reachable_from_entry: false
images: 0
internal_links: 3
extracted: 2026-08-07T06:00:19Z
extractor: site_to_paper.py (pandoc)
---

# Question 6.1

*Source page: `~scs/C-faq/q6.1.html`*

### Question 6.1

I had the definition `char a[6]` in one source file, and in another I declared `extern char *a`. Why didn't it work?

------------------------------------------------------------------------

The declaration `extern char *a` simply does not match the actual definition. The type pointer-to-type-T is not the same as array-of-type-T. Use `extern char a[]`.

References: ANSI Sec. 3.5.4.2\
ISO Sec. 6.5.4.2\
CT&P Sec. 3.3 pp. 33-4, Sec. 4.5 pp. 64-5\

------------------------------------------------------------------------

Read sequentially: <a href="q5.20.html" rev="precedes">prev</a> <a href="q6.2.html" rel="precedes">next</a> <a href="s6.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
