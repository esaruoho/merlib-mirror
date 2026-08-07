---
title: "Question 6.12"
source_domain: amasci.com
source_path: ~scs/C-faq/q6.12.html
order: 7742
reachable_from_entry: false
images: 0
internal_links: 4
extracted: 2026-08-07T06:00:19Z
extractor: site_to_paper.py (pandoc)
---

# Question 6.12

*Source page: `~scs/C-faq/q6.12.html`*

### Question 6.12

Since array references decay into pointers, if `arr` is an array, what's the difference between `arr` and `&arr`?

------------------------------------------------------------------------

The type.

In Standard C, `&arr` yields a pointer, of type pointer-to-array-of-T, to the entire array. (In pre-ANSI C, the `&` in `&arr` generally elicited a warning, and was generally ignored.) Under all C compilers, a simple reference (without an explicit `&`) to an array yields a pointer, of type pointer-to-T, to the array's first element. (See also questions [6.3](q6.3.html), [6.13](q6.13.html), and [6.18](q6.18.html).)

References: ANSI Sec. 3.2.2.1, Sec. 3.3.3.2\
ISO Sec. 6.2.2.1, Sec. 6.3.3.2\
Rationale Sec. 3.3.3.2\
H&S Sec. 7.5.6 p. 198\

------------------------------------------------------------------------

Read sequentially: <a href="q6.11.html" rev="precedes">prev</a> <a href="q6.13.html" rel="precedes">next</a> <a href="s6.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
