---
title: "Question 1.4"
source_domain: amasci.com
source_path: ~scs/C-faq/q1.4.html
order: 7873
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T17:15:32Z
extractor: site_to_paper.py (pandoc)
---

# Question 1.4

*Source page: `~scs/C-faq/q1.4.html`*

### Question 1.4

What should the 64-bit type on new, 64-bit machines be?

------------------------------------------------------------------------

Some vendors of C products for 64-bit machines support 64-bit `long int`s. Others fear that too much existing code is written to assume that `int`s and `long`s are the same size, or that one or the other of them is exactly 32 bits, and introduce a new, nonstandard, 64-bit `long long` (or `__longlong`) type instead.

Programmers interested in writing portable code should therefore insulate their 64-bit type needs behind appropriate typedefs. Vendors who feel compelled to introduce a new, longer integral type should advertise it as being \`\`at least 64 bits'' (which is truly new, a type traditional C does not have), and not \`\`exactly 64 bits.''

References: ANSI Sec. F.5.6\
ISO Sec. G.5.6\

------------------------------------------------------------------------

Read sequentially: <a href="q1.1.html" rev="precedes">prev</a> <a href="q1.7.html" rel="precedes">next</a> <a href="s1.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
