---
title: "Chapter 5: Functions and Program Structure"
source_domain: amasci.com
source_path: ~scs/cclass/notes/sx5.html
order: 7986
reachable_from_entry: false
images: 0
internal_links: 7
extracted: 2026-08-07T17:15:37Z
extractor: site_to_paper.py (pandoc)
---

# Chapter 5: Functions and Program Structure

*Source page: `~scs/cclass/notes/sx5.html`*

# Chapter 5: Functions and Program Structure

\[This chapter corresponds to K&R chapter 4.\]

A function is a \`\`black box'' that we've locked part of our program into. The idea behind a function is that it <span class="dfn">compartmentalizes</span> part of the program, and in particular, that the code within the function has some useful properties:

1.  It performs some well-defined task, which will be useful to other parts of the program.
2.  It might be useful to other programs as well; that is, we might be able to reuse it (and without having to rewrite it).
3.  The rest of the program doesn't have to know the details of how the function is implemented. This can make the rest of the program easier to think about.
4.  The function performs its task *well*. It may be written to do a little more than is required by the first program that calls it, with the anticipation that the calling program (or some other program) may later need the extra functionality or improved performance. (It's important that a finished function do its job well, otherwise there might be a reluctance to call it, and it therefore might not achieve the goal of reusability.)
5.  By placing the code to perform the useful task into a function, and simply calling the function in the other parts of the program where the task must be performed, the rest of the program becomes clearer: rather than having some large, complicated, difficult-to-understand piece of code repeated wherever the task is being performed, we have a single simple function call, and the name of the function reminds us which task is being performed.
6.  Since the rest of the program doesn't have to know the details of how the function is implemented, the rest of the program doesn't care if the function is reimplemented later, in some different way (as long as it continues to perform its same task, of course!). This means that one part of the program can be rewritten, to improve performance or add a new feature (or simply to fix a bug), without having to rewrite the rest of the program.

Functions are probably the most important weapon in our battle against software complexity. You'll want to learn when it's appropriate to break processing out into functions (and also when it's not), and *how* to set up function interfaces to best achieve the qualities mentioned above: reuseability, information hiding, clarity, and maintainability.

<a href="sx5a.html" rel="subdocument">5.1 Function Basics</a>

<a href="sx5b.html" rel="subdocument">5.2 Function Prototypes</a>

<a href="sx5c.html" rel="subdocument">5.3 Function Philosophy</a>

<a href="sx5d.html" rel="subdocument">5.4 Separate Compilation--Logistics</a>

------------------------------------------------------------------------

Read sequentially: <a href="sx4d.html" rev="precedes">prev</a> <a href="sx5a.html" rel="precedes">next</a> <a href="top.html" rev="subdocument">up</a> [top](top.html)

This page by [Steve Summit](http://www.eskimo.com/~scs/) // [Copyright](copyright.html) 1995-1997 // [mail feedback](mailto:scs@eskimo.com)
