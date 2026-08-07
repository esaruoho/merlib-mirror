---
title: "Question 1.11"
source_domain: amasci.com
source_path: ~scs/C-faq/q1.11.html
order: 7863
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T17:15:31Z
extractor: site_to_paper.py (pandoc)
---

# Question 1.11

*Source page: `~scs/C-faq/q1.11.html`*

### Question 1.11

What does `extern` mean in a function declaration?

------------------------------------------------------------------------

It can be used as a stylistic hint to indicate that the function's definition is probably in another source file, but there is no formal difference between

       extern int f();

and

       int f();

References: ANSI Sec. 3.1.2.2, Sec. 3.5.1\
ISO Sec. 6.1.2.2, Sec. 6.5.1\
Rationale Sec. 3.1.2.2\
H&S Secs. 4.3,4.3.1 pp. 75-6\

------------------------------------------------------------------------

Read sequentially: <a href="q1.7.html" rev="precedes">prev</a> <a href="q1.12.html" rel="precedes">next</a> <a href="s1.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
