---
title: "Question 7.23"
source_domain: amasci.com
source_path: ~scs/C-faq/q7.23.html
order: 7755
reachable_from_entry: false
images: 0
internal_links: 3
extracted: 2026-08-07T06:00:19Z
extractor: site_to_paper.py (pandoc)
---

# Question 7.23

*Source page: `~scs/C-faq/q7.23.html`*

### Question 7.23

I'm allocating structures which contain pointers to other dynamically-allocated objects. When I free a structure, do I have to free each subsidiary pointer first?

------------------------------------------------------------------------

Yes. In general, you must arrange that each pointer returned from `malloc` be individually passed to `free`, exactly once (if it is freed at all).

A good rule of thumb is that for each call to `malloc` in a program, you should be able to point at the call to `free` which frees the memory allocated by that `malloc` call.

See also question [7.24](q7.24.html).

------------------------------------------------------------------------

Read sequentially: <a href="q7.22.html" rev="precedes">prev</a> <a href="q7.24.html" rel="precedes">next</a> <a href="s7.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
