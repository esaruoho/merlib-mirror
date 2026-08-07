---
title: "Question 4.3"
source_domain: amasci.com
source_path: ~scs/C-faq/q4.3.html
order: 7909
reachable_from_entry: false
images: 0
internal_links: 3
extracted: 2026-08-07T17:15:33Z
extractor: site_to_paper.py (pandoc)
---

# Question 4.3

*Source page: `~scs/C-faq/q4.3.html`*

### Question 4.3

Does `*p++` increment `p`, or what it points to?

------------------------------------------------------------------------

Unary operators like `*`, `++`, and `--` all associate (group) from right to left. Therefore, `*p++` increments `p` (and returns the value pointed to by `p` before the increment). To increment the value pointed to by `p`, use `(*p)++` (or perhaps `++*p`, if the order of the side effect doesn't matter).

References: K&R1 Sec. 5.1 p. 91\
K&R2 Sec. 5.1 p. 95\
ANSI Sec. 3.3.2, Sec. 3.3.3\
ISO Sec. 6.3.2, Sec. 6.3.3\
H&S Sec. 7.4.4 pp. 192-3, Sec. 7.5 p. 193, Secs. 7.5.7,7.5.8 pp. 199-200\

------------------------------------------------------------------------

Read sequentially: <a href="q4.2.html" rev="precedes">prev</a> <a href="q4.5.html" rel="precedes">next</a> <a href="s4.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
