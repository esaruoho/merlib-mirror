---
title: "Chapter 7: More Operators"
source_domain: amasci.com
source_path: ~scs/cclass/notes/sx7.html
order: 7826
reachable_from_entry: false
images: 0
internal_links: 3
extracted: 2026-08-07T06:00:22Z
extractor: site_to_paper.py (pandoc)
---

# Chapter 7: More Operators

*Source page: `~scs/cclass/notes/sx7.html`*

# Chapter 7: More Operators

In this chapter we'll meet some (though still not all) of C's more advanced arithmetic operators. The ones we'll meet here have to do with making common patterns of operations easier.

It's extremely common in programming to have to <span class="dfn">increment</span> a variable by 1, that is, to add 1 to it. (For example, if you're processing each element of an array, you'll typically write a loop with an index or pointer variable stepping through the elements of the array, and you'll increment the variable each time through the loop.) The classic way to increment a variable is with an assignment like

        i = i + 1

Such an assignment is perfectly common and acceptable, but it has a few slight problems:

1.  As we've mentioned, it looks a little odd, especially from an algebraic perspective.

2.  If the object being incremented is not a simple variable, the idiom can become cumbersome to type, and correspondingly more error-prone. For example, the expression

            a[i+j+2*k] = a[i+j+2*k] + 1

    is a bit of a mess, and you may have to look closely to see that the similar-looking expression

            a[i+j+2*k] = a[i+j+2+k] + 1

    probably has a mistake in it.

3.  Since incrementing things is *so* common, it might be nice to have an easier way of doing it.

In fact, C provides not one but two other, simpler ways of incrementing variables and performing other similar operations.

<a href="sx7a.html" rel="subdocument">7.1 Assignment Operators</a>

<a href="sx7b.html" rel="subdocument">7.2 Increment and Decrement Operators</a>

<a href="sx7c.html" rel="subdocument">7.3 Order of Evaluation</a>

------------------------------------------------------------------------

Read sequentially: <a href="sx6d.html" rev="precedes">prev</a> <a href="sx7a.html" rel="precedes">next</a> <a href="top.html" rev="subdocument">up</a> [top](top.html)

This page by [Steve Summit](http://www.eskimo.com/~scs/) // [Copyright](copyright.html) 1995-1997 // [mail feedback](mailto:scs@eskimo.com)
