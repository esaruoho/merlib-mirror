---
title: "Question 6.19"
source_domain: amasci.com
source_path: ~scs/C-faq/q6.19.html
order: 7745
reachable_from_entry: false
images: 0
internal_links: 4
extracted: 2026-08-07T06:00:19Z
extractor: site_to_paper.py (pandoc)
---

# Question 6.19

*Source page: `~scs/C-faq/q6.19.html`*

### Question 6.19

How do I write functions which accept two-dimensional arrays when the \`\`width'' is not known at compile time?

------------------------------------------------------------------------

It's not easy. One way is to pass in a pointer to the `[0][0]` element, along with the two dimensions, and simulate array subscripting \`\`by hand:''

       f2(aryp, nrows, ncolumns)
        int *aryp;
        int nrows, ncolumns;
        { ... array[i][j] is accessed as aryp[i * ncolumns + j] ... }

This function could be called with the `array` from question [6.18](q6.18.html) as

       f2(&array[0][0], NROWS, NCOLUMNS);

It must be noted, however, that a program which performs multidimensional array subscripting \`\`by hand'' in this way is not in strict conformance with the ANSI C Standard; according to an official interpretation, the behavior of accessing `(&array[0][0])[x]` is not defined for `x >= NCOLUMNS`.

`gcc` allows local arrays to be declared having sizes which are specified by a function's arguments, but this is a nonstandard extension.

When you want to be able to use a function on multidimensional arrays of various sizes, one solution is to simulate all the arrays dynamically, as in question [6.16](q6.16.html).

See also questions [6.18](q6.18.html), [6.20](q6.20.html), and [6.15](q6.15.html).

References: ANSI Sec. 3.3.6\
ISO Sec. 6.3.6\

------------------------------------------------------------------------

Read sequentially: <a href="q6.18.html" rev="precedes">prev</a> <a href="q6.20.html" rel="precedes">next</a> <a href="s6.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
