---
title: "Question 6.21"
source_domain: amasci.com
source_path: ~scs/C-faq/q6.21.html
order: 7748
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T06:00:19Z
extractor: site_to_paper.py (pandoc)
---

# Question 6.21

*Source page: `~scs/C-faq/q6.21.html`*

### Question 6.21

Why doesn't `sizeof` properly report the size of an array when the array is a parameter to a function?

------------------------------------------------------------------------

The compiler pretends that the array parameter was declared as a pointer (see question [6.4](q6.4.html)), and `sizeof` reports the size of the pointer.

References: H&S Sec. 7.5.2 p. 195\

------------------------------------------------------------------------

Read sequentially: <a href="q6.20.html" rev="precedes">prev</a> <a href="q7.1.html" rel="precedes">next</a> <a href="s6.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
