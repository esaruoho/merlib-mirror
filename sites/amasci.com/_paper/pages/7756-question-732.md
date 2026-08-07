---
title: "Question 7.32"
source_domain: amasci.com
source_path: ~scs/C-faq/q7.32.html
order: 7756
reachable_from_entry: false
images: 0
internal_links: 3
extracted: 2026-08-07T06:00:19Z
extractor: site_to_paper.py (pandoc)
---

# Question 7.32

*Source page: `~scs/C-faq/q7.32.html`*

### Question 7.32

What is `alloca` and why is its use discouraged?

------------------------------------------------------------------------

`alloca` allocates memory which is automatically freed when the function which called `alloca` returns. That is, memory allocated with `alloca` is local to a particular function's \`\`stack frame'' or context.

`alloca` cannot be written portably, and is difficult to implement on machines without a conventional stack. Its use is problematical (and the obvious implementation on a stack-based machine fails) when its return value is passed directly to another function, as in `fgets(alloca(100), 100, stdin)`.

For these reasons, `alloca` is not Standard and cannot be used in programs which must be widely portable, no matter how useful it might be.

See also question [7.22](q7.22.html).

References: Rationale Sec. 4.10.3\

------------------------------------------------------------------------

Read sequentially: <a href="q7.31.html" rev="precedes">prev</a> <a href="q8.1.html" rel="precedes">next</a> <a href="s7.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
