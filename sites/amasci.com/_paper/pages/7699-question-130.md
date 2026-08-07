---
title: "Question 1.30"
source_domain: amasci.com
source_path: ~scs/C-faq/q1.30.html
order: 7699
reachable_from_entry: false
images: 0
internal_links: 6
extracted: 2026-08-07T06:00:17Z
extractor: site_to_paper.py (pandoc)
---

# Question 1.30

*Source page: `~scs/C-faq/q1.30.html`*

### Question 1.30

What can I safely assume about the initial values of variables which are not explicitly initialized? If global variables start out as \`\`zero,'' is that good enough for null pointers and floating-point zeroes?

------------------------------------------------------------------------

Variables with <span class="dfn">static</span> duration (that is, those declared outside of functions, and those declared with the storage class `static`), are guaranteed initialized (just once, at program startup) to zero, as if the programmer had typed \`\``= 0`''. Therefore, such variables are initialized to the null pointer (of the correct type; see also section [5](s5.html)) if they are pointers, and to 0.0 if they are floating-point.

Variables with <span class="dfn">automatic</span> duration (i.e. local variables without the `static` storage class) start out containing garbage, unless they are explicitly initialized. (Nothing useful can be predicted about the garbage.)

Dynamically-allocated memory obtained with `malloc` and `realloc` is also likely to contain garbage, and must be initialized by the calling program, as appropriate. Memory obtained with `calloc` is all-bits-0, but this is not necessarily useful for pointer or floating-point values (see question [7.31](q7.31.html), and section [5](s5.html)).

References: K&R1 Sec. 4.9 pp. 82-4\
K&R2 Sec. 4.9 pp. 85-86\
ANSI Sec. 3.5.7, Sec. 4.10.3.1, Sec. 4.10.5.3\
ISO Sec. 6.5.7, Sec. 7.10.3.1, Sec. 7.10.5.3\
H&S Sec. 4.2.8 pp. 72-3, Sec. 4.6 pp. 92-3, Sec. 4.6.2 pp. 94-5, Sec. 4.6.3 p. 96, Sec. 16.1 p. 386\

------------------------------------------------------------------------

Read sequentially: <a href="q1.25.html" rev="precedes">prev</a> <a href="q1.31.html" rel="precedes">next</a> <a href="s1.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
