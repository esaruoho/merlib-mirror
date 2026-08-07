---
title: "Chapter 3: Statements and Control Flow"
source_domain: amasci.com
source_path: ~scs/cclass/notes/sx3.html
order: 7810
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T06:00:21Z
extractor: site_to_paper.py (pandoc)
---

# Chapter 3: Statements and Control Flow

*Source page: `~scs/cclass/notes/sx3.html`*

# Chapter 3: Statements and Control Flow

Statements are the \`\`steps'' of a program. Most statements compute and assign values or call functions, but we will eventually meet several other kinds of statements as well. By default, statements are executed in sequence, one after another. We can, however, modify that sequence by using <span class="dfn">control flow constructs</span> which arrange that a statement or group of statements is executed only if some condition is true or false, or executed over and over again to form a <span class="dfn">loop</span>. (A somewhat different kind of control flow happens when we call a function: execution of the caller is suspended while the called function proceeds. We'll discuss functions in chapter 5.)

My definitions of the terms <span class="dfn">statement</span> and <span class="dfn">control flow</span> are somewhat circular. A statement is an element within a program which you can apply control flow to; control flow is how you specify the order in which the statements in your program are executed. (A weaker definition of a statement might be \`\`a part of your program that does something,'' but this definition could as easily be applied to expressions or functions.)

<a href="sx3a.html" rel="subdocument">3.1 Expression Statements</a>

<a href="sx3b.html" rel="subdocument">3.2 <code>if</code> Statements</a>

<a href="sx3c.html" rel="subdocument">3.3 Boolean Expressions</a>

<a href="sx3d.html" rel="subdocument">3.4 <code>while</code> Loops</a>

<a href="sx3e.html" rel="subdocument">3.5 <code>for</code> Loops</a>

<a href="sx3f.html" rel="subdocument">3.6 <code>break</code> and <code>continue</code></a>

------------------------------------------------------------------------

Read sequentially: <a href="sx2g.html" rev="precedes">prev</a> <a href="sx3a.html" rel="precedes">next</a> <a href="top.html" rev="subdocument">up</a> [top](top.html)

This page by [Steve Summit](http://www.eskimo.com/~scs/) // [Copyright](copyright.html) 1995, 1996 // [mail feedback](mailto:scs@eskimo.com)
