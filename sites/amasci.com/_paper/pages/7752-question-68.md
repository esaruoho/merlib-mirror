---
title: "Question 6.8"
source_domain: amasci.com
source_path: ~scs/C-faq/q6.8.html
order: 7752
reachable_from_entry: false
images: 0
internal_links: 7
extracted: 2026-08-07T06:00:19Z
extractor: site_to_paper.py (pandoc)
---

# Question 6.8

*Source page: `~scs/C-faq/q6.8.html`*

### Question 6.8

Practically speaking, what is the difference between arrays and pointers?

------------------------------------------------------------------------

Arrays automatically allocate space, but can't be relocated or resized. Pointers must be explicitly assigned to point to allocated space (perhaps using `malloc`), but can be reassigned (i.e. pointed at different objects) at will, and have many other uses besides serving as the base of blocks of memory.

Due to the so-called equivalence of arrays and pointers (see question [6.3](q6.3.html)), arrays and pointers often seem interchangeable, and in particular a pointer to a block of memory assigned by `malloc` is frequently treated (and can be referenced using `[]`) exactly as if it were a true array. See questions [6.14](q6.14.html) and [6.16](q6.16.html). (Be careful with `sizeof`, though.)

See also questions [1.32](q1.32.html) and [20.14](q20.14.html).

------------------------------------------------------------------------

Read sequentially: <a href="q6.7.html" rev="precedes">prev</a> <a href="q6.9.html" rel="precedes">next</a> <a href="s6.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
