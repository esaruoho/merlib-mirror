---
title: "Question 10.4"
source_domain: amasci.com
source_path: ~scs/C-faq/q10.4.html
order: 7889
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T17:15:32Z
extractor: site_to_paper.py (pandoc)
---

# Question 10.4

*Source page: `~scs/C-faq/q10.4.html`*

### Question 10.4

What's the best way to write a multi-statement macro?

------------------------------------------------------------------------

The usual goal is to write a macro that can be invoked as if it were a statement consisting of a single function call. This means that the \`\`caller'' will be supplying the final semicolon, so the macro body should not. The macro body cannot therefore be a simple brace-enclosed compound statement, because syntax errors would result if it were invoked (apparently as a single statement, but with a resultant extra semicolon) as the if branch of an if/else statement with an explicit else clause.

The traditional solution, therefore, is to use

       #define MACRO(arg1, arg2) do {  \
            /* declarations */  \
            stmt1;          \
            stmt2;          \
            /* ... */       \
            } while(0)  /* (no trailing ; ) */

When the caller appends a semicolon, this expansion becomes a single statement regardless of context. (An optimizing compiler will remove any \`\`dead'' tests or branches on the constant condition 0, although `lint` may complain.)

If all of the statements in the intended macro are simple expressions, with no declarations or loops, another technique is to write a single, parenthesized expression using one or more comma operators. (For an example, see the first `DEBUG()` macro in question [10.26](q10.26.html).) This technique also allows a value to be \`\`returned.''

References: H&S Sec. 3.3.2 p. 45\
CT&P Sec. 6.3 pp. 82-3\

------------------------------------------------------------------------

Read sequentially: <a href="q10.3.html" rev="precedes">prev</a> <a href="q10.6.html" rel="precedes">next</a> <a href="s10.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
