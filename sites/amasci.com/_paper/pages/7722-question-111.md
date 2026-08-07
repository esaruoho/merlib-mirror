---
title: "Question 11.1"
source_domain: amasci.com
source_path: ~scs/C-faq/q11.1.html
order: 7722
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T06:00:18Z
extractor: site_to_paper.py (pandoc)
---

# Question 11.1

*Source page: `~scs/C-faq/q11.1.html`*

### Question 11.1

What is the \`\`ANSI C Standard?''

------------------------------------------------------------------------

In 1983, the American National Standards Institute (ANSI) commissioned a committee, X3J11, to standardize the C language. After a long, arduous process, including several widespread public reviews, the committee's work was finally ratified as ANS X3.159-1989 on December 14, 1989, and published in the spring of 1990. For the most part, ANSI C standardizes existing practice, with a few additions from C++ (most notably function prototypes) and support for multinational character sets (including the controversial trigraph sequences). The ANSI C standard also formalizes the C run-time library support routines.

More recently, the Standard has been adopted as an international standard, ISO/IEC 9899:1990, and this ISO Standard replaces the earlier X3.159 even within the United States. Its sections are numbered differently (briefly, ISO sections 5 through 7 correspond roughly to the old ANSI sections 2 through 4). As an ISO Standard, it is subject to ongoing revision through the release of Technical Corrigenda and Normative Addenda.

In 1994, Technical Corrigendum 1 amended the Standard in about 40 places, most of them minor corrections or clarifications. More recently, Normative Addendum 1 added about 50 pages of new material, mostly specifying new library functions for internationalization. The production of Technical Corrigenda is an ongoing process, and a second one is expected in late 1995. In addition, both ANSI and ISO require periodic review of their standards. This process is beginning in 1995, and will likely result in a completely revised standard (nicknamed \`\`C9X'' on the assumption of completion by 1999).

The original ANSI Standard included a \`\`Rationale,'' explaining many of its decisions, and discussing a number of subtle points, including several of those covered here. (The Rationale was \`\`not part of ANSI Standard X3.159-1989, but... included for information only,'' and is not included with the ISO Standard.)

------------------------------------------------------------------------

Read sequentially: <a href="q10.26.html" rev="precedes">prev</a> <a href="q11.2.html" rel="precedes">next</a> <a href="s11.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
