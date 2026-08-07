---
title: "Question 1.21"
source_domain: amasci.com
source_path: ~scs/C-faq/q1.21.html
order: 7696
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T06:00:17Z
extractor: site_to_paper.py (pandoc)
---

# Question 1.21

*Source page: `~scs/C-faq/q1.21.html`*

### Question 1.21

How do I declare an array of N pointers to functions returning pointers to functions returning pointers to characters?

------------------------------------------------------------------------

The first part of this question can be answered in at least three ways:

1.  `char *(*(*a[N])())(); `

2.  Build the declaration up incrementally, using typedefs:

           typedef char *pc;   /* pointer to char */
            typedef pc fpc();   /* function returning pointer to char */
            typedef fpc *pfpc;  /* pointer to above */
            typedef pfpc fpfpc();   /* function returning... */
            typedef fpfpc *pfpfpc;  /* pointer to... */
            pfpfpc a[N];        /* array of... */

3.  Use the `cdecl` program, which turns English into C and vice versa:

           cdecl> declare a as array of pointer to function returning
                 pointer to function returning pointer to char
            char *(*(*a[])())()

    `cdecl` can also explain complicated declarations, help with casts, and indicate which set of parentheses the arguments go in (for complicated function definitions, like the one above). Versions of `cdecl` are in volume 14 of comp.sources.unix (see question [18.16](q18.16.html)) and K&R2.

Any good book on C should explain how to read these complicated C declarations \`\`inside out'' to understand them (\`\`declaration mimics use'').

The pointer-to-function declarations in the examples above have not included parameter type information. When the parameters have complicated types, declarations can *really* get messy. (Modern versions of `cdecl` can help here, too.)

References: K&R2 Sec. 5.12 p. 122\
ANSI Sec. 3.5ff (esp. Sec. 3.5.4)\
ISO Sec. 6.5ff (esp. Sec. 6.5.4)\
H&S Sec. 4.5 pp. 85-92, Sec. 5.10.1 pp. 149-50\

------------------------------------------------------------------------

Read sequentially: <a href="q1.14.html" rev="precedes">prev</a> <a href="q1.22.html" rel="precedes">next</a> <a href="s1.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
