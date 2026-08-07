---
title: "Question 6.4"
source_domain: amasci.com
source_path: ~scs/C-faq/q6.4.html
order: 7750
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T06:00:19Z
extractor: site_to_paper.py (pandoc)
---

# Question 6.4

*Source page: `~scs/C-faq/q6.4.html`*

### Question 6.4

Then why are array and pointer declarations interchangeable as function formal parameters?

------------------------------------------------------------------------

It's supposed to be a convenience.

Since arrays decay immediately into pointers, an array is never actually passed to a function. Allowing pointer parameters to be declared as arrays is a simply a way of making it look as though the array was being passed--a programmer may wish to emphasize that a parameter is traditionally treated as if it were an array, or that an array (strictly speaking, the address) is traditionally passed. As a convenience, therefore, any parameter declarations which \`\`look like'' arrays, e.g.

       f(a)
        char a[];
        { ... }

are treated by the compiler as if they were pointers, since that is what the function will receive if an array is passed:

       f(a)
        char *a;
        { ... }

This conversion holds only within function formal parameter declarations, nowhere else. If the conversion bothers you, avoid it; many people have concluded that the confusion it causes outweighs the small advantage of having the declaration \`\`look like'' the call or the uses within the function.

See also question [6.21](q6.21.html).

References: K&R1 Sec. 5.3 p. 95, Sec. A10.1 p. 205\
K&R2 Sec. 5.3 p. 100, Sec. A8.6.3 p. 218, Sec. A10.1 p. 226\
ANSI Sec. 3.5.4.3, Sec. 3.7.1, Sec. 3.9.6\
ISO Sec. 6.5.4.3, Sec. 6.7.1, Sec. 6.9.6\
H&S Sec. 9.3 p. 271\
CT&P Sec. 3.3 pp. 33-4\

------------------------------------------------------------------------

Read sequentially: <a href="q6.3.html" rev="precedes">prev</a> <a href="q6.7.html" rel="precedes">next</a> <a href="s6.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
