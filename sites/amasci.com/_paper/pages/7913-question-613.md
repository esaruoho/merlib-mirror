---
title: "Question 6.13"
source_domain: amasci.com
source_path: ~scs/C-faq/q6.13.html
order: 7913
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T17:15:33Z
extractor: site_to_paper.py (pandoc)
---

# Question 6.13

*Source page: `~scs/C-faq/q6.13.html`*

### Question 6.13

How do I declare a pointer to an array?

------------------------------------------------------------------------

Usually, you don't want to. When people speak casually of a pointer to an array, they usually mean a pointer to its first element.

Instead of a pointer to an array, consider using a pointer to one of the array's elements. Arrays of type T decay into pointers to type T (see question [6.3](q6.3.html)), which is convenient; subscripting or incrementing the resultant pointer will access the individual members of the array. True pointers to arrays, when subscripted or incremented, step over entire arrays, and are generally useful only when operating on arrays of arrays, if at all. (See question [6.18](q6.18.html).)

If you really need to declare a pointer to an entire array, use something like \`\``int (*ap)[N];`'' where `N` is the size of the array. (See also question [1.21](q1.21.html).) If the size of the array is unknown, `N` can in principle be omitted, but the resulting type, \`\`pointer to array of unknown size,'' is useless.

See also question [6.12](q6.12.html).

References: ANSI Sec. 3.2.2.1\
ISO Sec. 6.2.2.1\

------------------------------------------------------------------------

Read sequentially: <a href="q6.12.html" rev="precedes">prev</a> <a href="q6.14.html" rel="precedes">next</a> <a href="s6.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
