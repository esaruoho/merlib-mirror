---
title: "Question 6.2"
source_domain: amasci.com
source_path: ~scs/C-faq/q6.2.html
order: 7916
reachable_from_entry: false
images: 0
internal_links: 7
extracted: 2026-08-07T17:15:33Z
extractor: site_to_paper.py (pandoc)
---

# Question 6.2

*Source page: `~scs/C-faq/q6.2.html`*

### Question 6.2

But I heard that `char a[]` was identical to `char *a`.

------------------------------------------------------------------------

Not at all. (What you heard has to do with formal parameters to functions; see question [6.4](q6.4.html).) Arrays are not pointers. The array declaration `char a[6]` requests that space for six characters be set aside, to be known by the name \`\``a`.'' That is, there is a location named \`\``a`'' at which six characters can sit. The pointer declaration `char *p`, on the other hand, requests a place which holds a pointer, to be known by the name \`\``p`.'' This pointer can point almost anywhere: to any `char`, or to any contiguous array of `char`s, or nowhere (see also questions [5.1](q5.1.html) and [1.30](q1.30.html)).

As usual, a picture is worth a thousand words. The declarations

       char a[] = "hello";
        char *p = "world";

would initialize data structures which could be represented like this:

          +---+---+---+---+---+---+
        a: | h | e | l | l | o |\0 |
           +---+---+---+---+---+---+
           +-----+     +---+---+---+---+---+---+
        p: |  *======> | w | o | r | l | d |\0 |
           +-----+     +---+---+---+---+---+---+

It is important to realize that a reference like *x*`[3]` generates different code depending on whether *x* is an array or a pointer. Given the declarations above, when the compiler sees the expression `a[3]`, it emits code to start at the location \`\``a`,'' move three past it, and fetch the character there. When it sees the expression `p[3]`, it emits code to start at the location \`\``p`,'' fetch the pointer value there, add three to the pointer, and finally fetch the character pointed to. In other words, `a[3]` is three places past (the start of) the object *named* `a`, while `p[3]` is three places past the object *pointed to* by `p`. In the example above, both `a[3]` and `p[3]` happen to be the character 'l', but the compiler gets there differently.

References: K&R2 Sec. 5.5 p. 104\
CT&P Sec. 4.5 pp. 64-5\

------------------------------------------------------------------------

Read sequentially: <a href="q6.1.html" rev="precedes">prev</a> <a href="q6.3.html" rel="precedes">next</a> <a href="s6.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
