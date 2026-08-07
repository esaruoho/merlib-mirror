---
title: "2.3 Declarations"
source_domain: amasci.com
source_path: ~scs/cclass/notes/sx2c.html
order: 7976
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T17:15:36Z
extractor: site_to_paper.py (pandoc)
---

# 2.3 Declarations

*Source page: `~scs/cclass/notes/sx2c.html`*

## 2.3 Declarations

\[This section corresponds to K&R Sec. 2.4\]

Informally, a <span class="dfn">variable</span> (also called an <span class="dfn">object</span>) is a place you can store a value. So that you can refer to it unambiguously, a variable needs a name. You can think of the variables in your program as a set of boxes or cubbyholes, each with a label giving its name; you might imagine that storing a value \`\`in'' a variable consists of writing the value on a slip of paper and placing it in the cubbyhole.

A <span class="dfn">declaration</span> tells the compiler the name and type of a variable you'll be using in your program. In its simplest form, a declaration consists of the type, the name of the variable, and a terminating semicolon:

        char c;
        int i;
        float f;

You can also declare several variables of the same type in one declaration, separating them with commas:

        int i1, i2;

Later we'll see that declarations may also contain <span class="dfn">initializers</span>, <span class="dfn">qualifiers</span> and <span class="dfn">storage classes</span>, and that we can declare <span class="dfn">arrays</span>, <span class="dfn">functions</span>, <span class="dfn">pointers</span>, and other kinds of data structures.

The placement of declarations is significant. You can't place them just anywhere (i.e. they cannot be interspersed with the other statements in your program). They must either be placed at the beginning of a function, or at the beginning of a brace-enclosed block of statements (which we'll learn about in the next chapter), or outside of any function. Furthermore, the placement of a declaration, as well as its storage class, controls several things about its <span class="dfn">visibility</span> and <span class="dfn">lifetime</span>, as we'll see later.

You may wonder *why* variables must be declared before use. There are two reasons:

1.  It makes things somewhat easier on the compiler; it knows right away what kind of storage to allocate and what code to emit to store and manipulate each variable; it doesn't have to try to intuit the programmer's intentions.
2.  It forces a bit of useful discipline on the programmer: you cannot introduce variables willy-nilly; you must think about them enough to pick appropriate types for them. (The compiler's error messages to you, telling you that you apparently forgot to declare a variable, are as often helpful as they are a nuisance: they're helpful when they tell you that you misspelled a variable, or forgot to think about exactly how you were going to use it.)

Although there are a few places where declarations can be omitted (in which case the compiler will assume an implicit declaration), making use of these removes the advantages of reason 2 above, so I recommend always declaring everything explicitly.

Most of the time, I recommend writing one declaration per line. For the most part, the compiler doesn't care what order declarations are in. You can order the declarations alphabetically, or in the order that they're used, or to put related declarations next to each other. Collecting all variables of the same type together on one line essentially orders declarations by type, which isn't a very useful order (it's only slightly more useful than random order).

A declaration for a variable can also contain an initial value. This <span class="dfn">initializer</span> consists of an equals sign and an expression, which is usually a single constant:

        int i = 1;
        int i1 = 10, i2 = 20;

------------------------------------------------------------------------

Read sequentially: <a href="sx2b.html" rev="precedes">prev</a> <a href="sx2d.html" rel="precedes">next</a> <a href="sx2.html" rev="subdocument">up</a> [top](top.html)

This page by [Steve Summit](http://www.eskimo.com/~scs/) // [Copyright](copyright.html) 1995-1997 // [mail feedback](mailto:scs@eskimo.com)
