---
title: "Chapter 12: Input and Output"
source_domain: amasci.com
source_path: ~scs/cclass/notes/sx12.html
order: 7797
reachable_from_entry: false
images: 0
internal_links: 2
extracted: 2026-08-07T06:00:21Z
extractor: site_to_paper.py (pandoc)
---

# Chapter 12: Input and Output

*Source page: `~scs/cclass/notes/sx12.html`*

# Chapter 12: Input and Output

So far, we've been calling `printf` to print formatted output to the \`\`standard output'' (wherever that is). We've also been calling `getchar` to read single characters from the \`\`standard input,'' and `putchar` to write single characters to the standard output. \`\`Standard input'' and \`\`standard output'' are two predefined I/O <span class="dfn">streams</span> which are implicitly available to us. In this chapter we'll learn how to take control of input and output by opening our own streams, perhaps connected to data files, which we can read from and write to.

<a href="sx12a.html" rel="subdocument">12.1 File Pointers and <code>fopen</code></a>

<a href="sx12b.html" rel="subdocument">12.2 I/O with File Pointers</a>

<a href="sx12c.html" rel="subdocument">12.3 Predefined Streams</a>

<a href="sx12d.html" rel="subdocument">12.4 Closing Files</a>

<a href="sx12e.html" rel="subdocument">12.5 Example: Reading a Data File</a>

------------------------------------------------------------------------

Read sequentially: <a href="sx11d.html" rev="precedes">prev</a> <a href="sx12a.html" rel="precedes">next</a> <a href="top.html" rev="subdocument">up</a> [top](top.html)

This page by [Steve Summit](http://www.eskimo.com/~scs/) // [Copyright](copyright.html) 1995, 1996 // [mail feedback](mailto:scs@eskimo.com)
