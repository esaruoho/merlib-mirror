---
title: "Question 6.16"
source_domain: amasci.com
source_path: ~scs/C-faq/q6.16.html
order: 7744
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T06:00:19Z
extractor: site_to_paper.py (pandoc)
---

# Question 6.16

*Source page: `~scs/C-faq/q6.16.html`*

### Question 6.16

How can I dynamically allocate a multidimensional array?

------------------------------------------------------------------------

It is usually best to allocate an array of pointers, and then initialize each pointer to a dynamically-allocated \`\`row.'' Here is a two-dimensional example:

       #include <stdlib.h>

        int **array1 = (int **)malloc(nrows * sizeof(int *));
        for(i = 0; i < nrows; i++)
            array1[i] = (int *)malloc(ncolumns * sizeof(int));

(In real code, of course, all of `malloc`'s return values would be checked.)

You can keep the array's contents contiguous, while making later reallocation of individual rows difficult, with a bit of explicit pointer arithmetic:

       int **array2 = (int **)malloc(nrows * sizeof(int *));
        array2[0] = (int *)malloc(nrows * ncolumns * sizeof(int));
        for(i = 1; i < nrows; i++)
            array2[i] = array2[0] + i * ncolumns;

In either case, the elements of the dynamic array can be accessed with normal-looking array subscripts: `arrayx[i][j]` (for 0 \<= `i` \< `NROWS` and 0 \<= `j` \< `NCOLUMNS`).

If the double indirection implied by the above schemes is for some reason unacceptable, you can simulate a two-dimensional array with a single, dynamically-allocated one-dimensional array:

       int *array3 = (int *)malloc(nrows * ncolumns * sizeof(int));

However, you must now perform subscript calculations manually, accessing the `i`,`j`th element with `array3[i * ncolumns + j]`. (A macro could hide the explicit calculation, but invoking it would require parentheses and commas which wouldn't look exactly like multidimensional array syntax, and the macro would need access to at least one of the dimensions, as well. See also question [6.19](q6.19.html).)

Finally, you could use pointers to arrays:

       int (*array4)[NCOLUMNS] =
            (int (*)[NCOLUMNS])malloc(nrows * sizeof(*array4));

but the syntax starts getting horrific and at most one dimension may be specified at run time.

With all of these techniques, you may of course need to remember to free the arrays (which may take several steps; see question [7.23](q7.23.html)) when they are no longer needed, and you cannot necessarily intermix dynamically-allocated arrays with conventional, statically-allocated ones (see question [6.20](q6.20.html), and also question [6.18](q6.18.html)).

All of these techniques can also be extended to three or more dimensions.

------------------------------------------------------------------------

Read sequentially: <a href="q6.15.html" rev="precedes">prev</a> <a href="q6.17.html" rel="precedes">next</a> <a href="s6.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
