---
title: "Question 1.34"
source_domain: amasci.com
source_path: ~scs/C-faq/q1.34.html
order: 7872
reachable_from_entry: false
images: 0
internal_links: 4
extracted: 2026-08-07T17:15:32Z
extractor: site_to_paper.py (pandoc)
---

# Question 1.34

*Source page: `~scs/C-faq/q1.34.html`*

### Question 1.34

I finally figured out the syntax for declaring pointers to functions, but now how do I initialize one?

------------------------------------------------------------------------

Use something like

    extern int func();
    int (*fp)() = func;

When the name of a function appears in an expression like this, it \`\`decays'' into a pointer (that is, it has its address implicitly taken), much as an array name does.

An explicit declaration for the function is normally needed, since implicit external function declaration does not happen in this case (because the function name in the initialization is not part of a function call).

See also question [4.12](q4.12.html).

------------------------------------------------------------------------

Read sequentially: <a href="q1.32.html" rev="precedes">prev</a> <a href="q2.1.html" rel="precedes">next</a> <a href="s1.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
