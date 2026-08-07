---
title: "Chapter 2: Basic Data Types and Operators"
source_domain: amasci.com
source_path: ~scs/cclass/notes/sx2.html
order: 7803
reachable_from_entry: false
images: 0
internal_links: 9
extracted: 2026-08-07T06:00:21Z
extractor: site_to_paper.py (pandoc)
---

# Chapter 2: Basic Data Types and Operators

*Source page: `~scs/cclass/notes/sx2.html`*

# Chapter 2: Basic Data Types and Operators

The <span class="dfn">type</span> of a variable determines what kinds of values it may take on. An <span class="dfn">operator</span> computes new values out of old ones. An <span class="dfn">expression</span> consists of variables, constants, and operators combined to perform some useful computation. In this chapter, we'll learn about C's basic types, how to write constants and declare variables of these types, and what the basic operators are.

As Kernighan and Ritchie say, \`\`The type of an object determines the set of values it can have and what operations can be performed on it.'' This is a fairly formal, mathematical definition of what a type is, but it is traditional (and meaningful). There are several implications to remember:

1.  The \`\`set of values'' is finite. C's `int` type can not represent *all* of the integers; its `float` type can not represent *all* floating-point numbers.
2.  When you're using an object (that is, a variable) of some type, you may have to remember what values it can take on and what operations you can perform on it. For example, there are several operators which play with the binary (bit-level) representation of integers, but these operators are not meaningful for and may not be applied to floating-point operands.
3.  When declaring a new variable and picking a type for it, you have to keep in mind the values and operations you'll be needing.

In other words, picking a type for a variable is not some abstract academic exercise; it's closely connected to the way(s) you'll be using that variable.

<a href="sx2a.html" rel="subdocument">2.1 Types</a>

<a href="sx2b.html" rel="subdocument">2.2 Constants</a>

<a href="sx2c.html" rel="subdocument">2.3 Declarations</a>

<a href="sx2d.html" rel="subdocument">2.4 Variable Names</a>

<a href="sx2e.html" rel="subdocument">2.5 Arithmetic Operators</a>

<a href="sx2f.html" rel="subdocument">2.6 Assignment Operators</a>

<a href="sx2g.html" rel="subdocument">2.7 Function Calls</a>

------------------------------------------------------------------------

Read sequentially: <a href="sx1c.html" rev="precedes">prev</a> <a href="sx2a.html" rel="precedes">next</a> <a href="top.html" rev="subdocument">up</a> [top](top.html)

This page by [Steve Summit](http://www.eskimo.com/~scs/) // [Copyright](copyright.html) 1995, 1996 // [mail feedback](mailto:scs@eskimo.com)
