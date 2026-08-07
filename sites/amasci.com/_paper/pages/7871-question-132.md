---
title: "Question 1.32"
source_domain: amasci.com
source_path: ~scs/C-faq/q1.32.html
order: 7871
reachable_from_entry: false
images: 0
internal_links: 8
extracted: 2026-08-07T17:15:32Z
extractor: site_to_paper.py (pandoc)
---

# Question 1.32

*Source page: `~scs/C-faq/q1.32.html`*

### Question 1.32

What is the difference between these initializations?

    char a[] = "string literal";
    char *p  = "string literal";

My program crashes if I try to assign a new value to `p[i]`.

------------------------------------------------------------------------

A string literal can be used in two slightly different ways. As an array initializer (as in the declaration of `char a[]`), it specifies the initial values of the characters in that array. Anywhere else, it turns into an unnamed, static array of characters, which may be stored in read-only memory, which is why you can't safely modify it. In an expression context, the array is converted at once to a pointer, as usual (see section [6](s6.html)), so the second declaration initializes `p` to point to the unnamed array's first element.

(For compiling old code, some compilers have a switch controlling whether strings are writable or not.)

See also questions [1.31](q1.31.html), [6.1](q6.1.html), [6.2](q6.2.html), and [6.8](q6.8.html).

References: K&R2 Sec. 5.5 p. 104\
ANSI Sec. 3.1.4, Sec. 3.5.7\
ISO Sec. 6.1.4, Sec. 6.5.7\
Rationale Sec. 3.1.4\
H&S Sec. 2.7.4 pp. 31-2\

------------------------------------------------------------------------

Read sequentially: <a href="q1.31.html" rev="precedes">prev</a> <a href="q1.34.html" rel="precedes">next</a> <a href="s1.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
