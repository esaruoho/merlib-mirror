---
title: "Question 1.22"
source_domain: amasci.com
source_path: ~scs/C-faq/q1.22.html
order: 7697
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T06:00:17Z
extractor: site_to_paper.py (pandoc)
---

# Question 1.22

*Source page: `~scs/C-faq/q1.22.html`*

### Question 1.22

How can I declare a function that can return a pointer to a function of the same type? I'm building a state machine with one function for each state, each of which returns a pointer to the function for the next state. But I can't find a way to declare the functions.

------------------------------------------------------------------------

You can't quite do it directly. Either have the function return a generic function pointer, with some judicious casts to adjust the types as the pointers are passed around; or have it return a structure containing only a pointer to a function returning that structure.

------------------------------------------------------------------------

Read sequentially: <a href="q1.21.html" rev="precedes">prev</a> <a href="q1.25.html" rel="precedes">next</a> <a href="s1.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
