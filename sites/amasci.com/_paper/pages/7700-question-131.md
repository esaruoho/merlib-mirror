---
title: "Question 1.31"
source_domain: amasci.com
source_path: ~scs/C-faq/q1.31.html
order: 7700
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T06:00:17Z
extractor: site_to_paper.py (pandoc)
---

# Question 1.31

*Source page: `~scs/C-faq/q1.31.html`*

### Question 1.31

This code, straight out of a book, isn't compiling:

    f()
    {
        char a[] = "Hello, world!";
    }

------------------------------------------------------------------------

Perhaps you have a pre-ANSI compiler, which doesn't allow initialization of \`\`automatic aggregates'' (i.e. non-`static` local arrays, structures, and unions). As a workaround, you can make the array global or `static` (if you won't need a fresh copy during any subsequent calls), or replace it with a pointer (if the array won't be written to). (You can always initialize local `char *` variables to point to string literals, but see question [1.32](q1.32.html).) If neither of these conditions hold, you'll have to initialize the array by hand with `strcpy` when `f` is called. See also question [11.29](q11.29.html).

------------------------------------------------------------------------

Read sequentially: <a href="q1.30.html" rev="precedes">prev</a> <a href="q1.32.html" rel="precedes">next</a> <a href="s1.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
