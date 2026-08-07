---
title: "Question 6.20"
source_domain: amasci.com
source_path: ~scs/C-faq/q6.20.html
order: 7747
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T06:00:19Z
extractor: site_to_paper.py (pandoc)
---

# Question 6.20

*Source page: `~scs/C-faq/q6.20.html`*

### Question 6.20

How can I use statically- and dynamically-allocated multidimensional arrays interchangeably when passing them to functions?

------------------------------------------------------------------------

There is no single perfect method. Given the declarations

       int array[NROWS][NCOLUMNS];
        int **array1;       /* ragged */
        int **array2;       /* contiguous */
        int *array3;        /* "flattened" */
        int (*array4)[NCOLUMNS];

with the pointers initialized as in the code fragments in question [6.16](q6.16.html), and functions declared as

       f1(int a[][NCOLUMNS], int nrows, int ncolumns);
        f2(int *aryp, int nrows, int ncolumns);
        f3(int **pp, int nrows, int ncolumns);

where `f1` accepts a conventional two-dimensional array, `f2` accepts a \`\`flattened'' two-dimensional array, and `f3` accepts a pointer-to-pointer, simulated array (see also questions [6.18](q6.18.html) and [6.19](q6.19.html)), the following calls should work as expected:

       f1(array, NROWS, NCOLUMNS);
        f1(array4, nrows, NCOLUMNS);

        f2(&array[0][0], NROWS, NCOLUMNS);
        f2(*array, NROWS, NCOLUMNS);
        f2(*array2, nrows, ncolumns);
        f2(array3, nrows, ncolumns);
        f2(*array4, nrows, NCOLUMNS);

        f3(array1, nrows, ncolumns);
        f3(array2, nrows, ncolumns);

The following two calls would probably work on most systems, but involve questionable casts, and work only if the dynamic `ncolumns` matches the static `NCOLUMNS`:

       f1((int (*)[NCOLUMNS])(*array2), nrows, ncolumns);
        f1((int (*)[NCOLUMNS])array3, nrows, ncolumns);

It must again be noted that passing `&array[0][0]` (or, equivalently, `*array`) to `f2` is not strictly conforming; see question [6.19](q6.19.html).

If you can understand why all of the above calls work and are written as they are, and if you understand why the combinations that are not listed would not work, then you have a *very* good understanding of arrays and pointers in C.

Rather than worrying about all of this, one approach to using multidimensional arrays of various sizes is to make them *all* dynamic, as in question [6.16](q6.16.html). If there are no static multidimensional arrays--if all arrays are allocated like `array1` or `array2` in question [6.16](q6.16.html)--then all functions can be written like `f3`.

------------------------------------------------------------------------

Read sequentially: <a href="q6.19.html" rev="precedes">prev</a> <a href="q6.21.html" rel="precedes">next</a> <a href="s6.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
