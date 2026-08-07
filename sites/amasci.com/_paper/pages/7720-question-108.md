---
title: "Question 10.8"
source_domain: amasci.com
source_path: ~scs/C-faq/q10.8.html
order: 7720
reachable_from_entry: false
images: 0
internal_links: 4
extracted: 2026-08-07T06:00:18Z
extractor: site_to_paper.py (pandoc)
---

# Question 10.8

*Source page: `~scs/C-faq/q10.8.html`*

### Question 10.8

Where are header (\`\``#include`'') files searched for?

------------------------------------------------------------------------

The exact behavior is implementation-defined (which means that it is supposed to be documented; see question [11.33](q11.33.html)). Typically, headers named with `<>` syntax are searched for in one or more standard places. Header files named with `""` syntax are first searched for in the \`\`current directory,'' then (if not found) in the same standard places.

Traditionally (especially under Unix compilers), the current directory is taken to be the directory containing the file containing the `#include` directive. Under other compilers, however, the current directory (if any) is the directory in which the compiler was initially invoked. Check your compiler documentation.

References: K&R2 Sec. A12.4 p. 231\
ANSI Sec. 3.8.2\
ISO Sec. 6.8.2\
H&S Sec. 3.4 p. 55\

------------------------------------------------------------------------

Read sequentially: <a href="q10.7.html" rev="precedes">prev</a> <a href="q10.9.html" rel="precedes">next</a> <a href="s10.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
