---
title: "Chapter 9: The C Preprocessor"
source_domain: amasci.com
source_path: ~scs/cclass/notes/sx9.html
order: 7828
reachable_from_entry: false
images: 0
internal_links: 3
extracted: 2026-08-07T06:00:22Z
extractor: site_to_paper.py (pandoc)
---

# Chapter 9: The C Preprocessor

*Source page: `~scs/cclass/notes/sx9.html`*

# Chapter 9: The C Preprocessor

Conceptually, the \`\`preprocessor'' is a translation phase that is applied to your source code before the compiler proper gets its hands on it. (Once upon a time, the preprocessor was a separate program, much as the compiler and linker may still be separate programs today.) Generally, the preprocessor performs textual substitutions on your source code, in three sorts of ways:

- File inclusion: inserting the contents of another file into your source file, as if you had typed it all in there.
- Macro substitution: replacing instances of one piece of text with another.
- Conditional compilation: Arranging that, depending on various circumstances, certain parts of your source code are seen or not seen by the compiler at all.

The next three sections will introduce these three preprocessing functions.

The syntax of the preprocessor is different from the syntax of the rest of C in several respects. First of all, the preprocessor is \`\`line based.'' Each of the preprocessor directives we're going to learn about (all of which begin with the `#` character) must begin at the beginning of a line, and each ends at the end of the line. (The rest of C treats line ends as just another whitespace character, and doesn't care how your program text is arranged into lines.) Secondly, the preprocessor does not know about the structure of C--about functions, statements, or expressions. It is possible to play strange tricks with the preprocessor to turn something which does not look like C into C (or vice versa). It's also possible to run into problems when a preprocessor substitution does not do what you expected it to, because the preprocessor does not respect the structure of C statements and expressions (but you expected it to). For the simple uses of the preprocessor we'll be discussing, you shouldn't have any of these problems, but you'll want to be careful before doing anything tricky or outrageous with the preprocessor. (As it happens, playing tricky and outrageous games with the preprocessor is considered sporting in some circles, but it rapidly gets out of hand, and can lead to bewilderingly impenetrable programs.)

<a href="sx9a.html" rel="subdocument">9.1 File Inclusion</a>

<a href="sx9b.html" rel="subdocument">9.2 Macro Definition and Substitution</a>

<a href="sx9c.html" rel="subdocument">9.3 Conditional Compilation</a>

------------------------------------------------------------------------

Read sequentially: <a href="sx8.html" rev="precedes">prev</a> <a href="sx9a.html" rel="precedes">next</a> <a href="top.html" rev="subdocument">up</a> [top](top.html)

This page by [Steve Summit](http://www.eskimo.com/~scs/) // [Copyright](copyright.html) 1995, 1996 // [mail feedback](mailto:scs@eskimo.com)
