---
title: "2.4 Variable Names"
source_domain: amasci.com
source_path: ~scs/cclass/notes/sx2d.html
order: 7977
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T17:15:36Z
extractor: site_to_paper.py (pandoc)
---

# 2.4 Variable Names

*Source page: `~scs/cclass/notes/sx2d.html`*

## 2.4 Variable Names

\[This section corresponds to K&R Sec. 2.1\]

Within limits, you can give your variables and functions any names you want. These names (the formal term is \`\`identifiers'') consist of letters, numbers, and underscores. For our purposes, names must begin with a letter. Theoretically, names can be as long as you want, but extremely long ones get tedious to type after a while, and the compiler is not required to keep track of extremely long ones perfectly. (What this means is that if you were to name a variable, say, `supercalafragalisticespialidocious`, the compiler might get lazy and pretend that you'd named it `supercalafragalisticespialidocio`, such that if you later misspelled it `supercalafragalisticespialidociouz`, the compiler wouldn't catch your mistake. Nor would the compiler necessarily be able to tell the difference if for some perverse reason you *deliberately* declared a second variable named `supercalafragalisticespialidociouz`.)

The capitalization of names in C is significant: the variable names `variable`, `Variable`, and `VARIABLE` (as well as silly combinations like `variAble`) are all distinct.

A final restriction on names is that you may not use <span class="dfn">keywords</span> (the words such as `int` and `for` which are part of the syntax of the language) as the names of variables or functions (or as identifiers of any kind).

------------------------------------------------------------------------

Read sequentially: <a href="sx2c.html" rev="precedes">prev</a> <a href="sx2e.html" rel="precedes">next</a> <a href="sx2.html" rev="subdocument">up</a> [top](top.html)

This page by [Steve Summit](http://www.eskimo.com/~scs/) // [Copyright](copyright.html) 1995, 1996 // [mail feedback](mailto:scs@eskimo.com)
