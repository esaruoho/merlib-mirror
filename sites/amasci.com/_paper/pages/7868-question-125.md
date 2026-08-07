---
title: "Question 1.25"
source_domain: amasci.com
source_path: ~scs/C-faq/q1.25.html
order: 7868
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T17:15:31Z
extractor: site_to_paper.py (pandoc)
---

# Question 1.25

*Source page: `~scs/C-faq/q1.25.html`*

### Question 1.25

My compiler is complaining about an invalid redeclaration of a function, but I only define it once and call it once.

------------------------------------------------------------------------

Functions which are called without a declaration in scope (perhaps because the first call precedes the function's definition) are assumed to be declared as returning `int` (and without any argument type information), leading to discrepancies if the function is later declared or defined otherwise. Non-`int` functions must be declared before they are called.

Another possible source of this problem is that the function has the same name as another one declared in some header file.

See also questions [11.3](q11.3.html) and [15.1](q15.1.html).

References: K&R1 Sec. 4.2 p. 70\
K&R2 Sec. 4.2 p. 72\
ANSI Sec. 3.3.2.2\
ISO Sec. 6.3.2.2\
H&S Sec. 4.7 p. 101\

------------------------------------------------------------------------

Read sequentially: <a href="q1.22.html" rev="precedes">prev</a> <a href="q1.30.html" rel="precedes">next</a> <a href="s1.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
