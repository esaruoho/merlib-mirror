---
title: "Question 6.3"
source_domain: amasci.com
source_path: ~scs/C-faq/q6.3.html
order: 7749
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T06:00:19Z
extractor: site_to_paper.py (pandoc)
---

# Question 6.3

*Source page: `~scs/C-faq/q6.3.html`*

### Question 6.3

So what is meant by the \`\`equivalence of pointers and arrays'' in C?

------------------------------------------------------------------------

Much of the confusion surrounding arrays and pointers in C can be traced to a misunderstanding of this statement. Saying that arrays and pointers are \`\`equivalent'' means neither that they are identical nor even interchangeable.

\`\`Equivalence'' refers to the following key definition:

> An lvalue of type array-of-T which appears in an expression decays (with three exceptions) into a pointer to its first element; the type of the resultant pointer is pointer-to-T.

(The exceptions are when the array is the operand of a `sizeof` or `&` operator, or is a string literal initializer for a character array.)

As a consequence of this definition, the compiler doesn't apply the array subscripting operator `[]` that differently to arrays and pointers, after all. In an expression of the form `a[i]`, the array decays into a pointer, following the rule above, and is then subscripted just as would be a pointer variable in the expression `p[i]` (although the eventual memory accesses will be different, as explained in question [6.2](q6.2.html)). If you were to assign the array's address to the pointer:

       p = a;

then `p[3]` and `a[3]` would access the same element.

See also question [6.8](q6.8.html).

References: K&R1 Sec. 5.3 pp. 93-6\
K&R2 Sec. 5.3 p. 99\
ANSI Sec. 3.2.2.1, Sec. 3.3.2.1, Sec. 3.3.6\
ISO Sec. 6.2.2.1, Sec. 6.3.2.1, Sec. 6.3.6\
H&S Sec. 5.4.1 p. 124\

------------------------------------------------------------------------

Read sequentially: <a href="q6.2.html" rev="precedes">prev</a> <a href="q6.4.html" rel="precedes">next</a> <a href="s6.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
