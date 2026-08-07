---
title: "Question 5.1"
source_domain: amasci.com
source_path: ~scs/C-faq/q5.1.html
order: 7740
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T06:00:19Z
extractor: site_to_paper.py (pandoc)
---

# Question 5.1

*Source page: `~scs/C-faq/q5.1.html`*

### Question 5.1

What is this infamous null pointer, anyway?

------------------------------------------------------------------------

The language definition states that for each pointer type, there is a special value--the \`\`null pointer''--which is distinguishable from all other pointer values and which is \`\`guaranteed to compare unequal to a pointer to any object or function.'' That is, the address-of operator `&` will never yield a null pointer, nor will a successful call to `malloc`. (`malloc` does return a null pointer when it fails, and this is a typical use of null pointers: as a \`\`special'' pointer value with some other meaning, usually \`\`not allocated'' or \`\`not pointing anywhere yet.'')

A null pointer is conceptually different from an uninitialized pointer. A null pointer is known not to point to any object or function; an uninitialized pointer might point anywhere. See also questions [1.30](q1.30.html), [7.1](q7.1.html), and [7.31](q7.31.html).

As mentioned above, there is a null pointer for each pointer type, and the internal values of null pointers for different types may be different. Although programmers need not know the internal values, the compiler must always be informed which type of null pointer is required, so that it can make the distinction if necessary (see questions [5.2](q5.2.html), [5.5](q5.5.html), and [5.6](q5.6.html)).

References: K&R1 Sec. 5.4 pp. 97-8\
K&R2 Sec. 5.4 p. 102\
ANSI Sec. 3.2.2.3\
ISO Sec. 6.2.2.3\
Rationale Sec. 3.2.2.3\
H&S Sec. 5.3.2 pp. 121-3\

------------------------------------------------------------------------

Read sequentially: <a href="q4.12.html" rev="precedes">prev</a> <a href="q5.2.html" rel="precedes">next</a> <a href="s5.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
