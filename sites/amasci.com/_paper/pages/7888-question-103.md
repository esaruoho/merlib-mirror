---
title: "Question 10.3"
source_domain: amasci.com
source_path: ~scs/C-faq/q10.3.html
order: 7888
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T17:15:32Z
extractor: site_to_paper.py (pandoc)
---

# Question 10.3

*Source page: `~scs/C-faq/q10.3.html`*

### Question 10.3

How can I write a generic macro to swap two values?

------------------------------------------------------------------------

There is no good answer to this question. If the values are integers, a well-known trick using exclusive-OR could perhaps be used, but it will not work for floating-point values or pointers, or if the two values are the same variable (and the \`\`obvious'' supercompressed implementation for integral types `a^=b^=a^=b` is illegal due to multiple side-effects; see question [3.2](q3.2.html)). If the macro is intended to be used on values of arbitrary type (the usual goal), it cannot use a temporary, since it does not know what type of temporary it needs (and would have a hard time naming it if it did), and standard C does not provide a `typeof` operator.

The best all-around solution is probably to forget about using a macro, unless you're willing to pass in the type as a third argument.

------------------------------------------------------------------------

Read sequentially: <a href="q10.2.html" rev="precedes">prev</a> <a href="q10.4.html" rel="precedes">next</a> <a href="s10.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
