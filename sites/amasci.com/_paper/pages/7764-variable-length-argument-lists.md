---
title: "Variable-Length Argument Lists"
source_domain: amasci.com
source_path: ~scs/C-faq/s15.html
order: 7764
reachable_from_entry: false
images: 0
internal_links: 2
extracted: 2026-08-07T06:00:20Z
extractor: site_to_paper.py (pandoc)
---

# Variable-Length Argument Lists

*Source page: `~scs/C-faq/s15.html`*

# 15. Variable-Length Argument Lists

<a href="q15.1.html" rel="subdocument">15.1 I heard that you have to <code>#include</code> <code>&lt;stdio.h&gt;</code> before calling <code>printf</code>. Why?</a>

<a href="q15.2.html" rel="subdocument">15.2 How can <code>%f</code> be used for both <code>float</code> and <code>double</code> arguments in <code>printf</code>?</a>

<a href="q15.3.html" rel="subdocument">15.3 Why don't function prototypes guard against mismatches in <code>printf</code>'s arguments?</a>

<a href="q15.4.html" rel="subdocument">15.4 How can I write a function that takes a variable number of arguments?</a>

<a href="q15.5.html" rel="subdocument">15.5 How can I write a function that takes a format string and a variable number of arguments, like <code>printf</code>, and passes them to <code>printf</code> to do most of the work?</a>

<a href="q15.6.html" rel="subdocument">15.6 How can I write a function analogous to <code>scanf</code>, that calls <code>scanf</code> to do most of the work?</a>

<a href="q15.7.html" rel="subdocument">15.7 I have a pre-ANSI compiler, without <code>&lt;stdarg.h&gt;</code>. What can I do?</a>

<a href="q15.8.html" rel="subdocument">15.8 How can I discover how many arguments a function was actually called with?</a>

<a href="q15.9.html" rel="subdocument">15.9 My compiler isn't letting me declare a function that accepts <em>only</em> variable arguments.</a>

<a href="q15.10.html" rel="subdocument">15.10 Why isn't "<code>va_arg(argp, float)</code>" working?</a>

<a href="q15.11.html" rel="subdocument">15.11 I can't get <code>va_arg</code> to pull in an argument of type pointer-to-function.</a>

<a href="q15.12.html" rel="subdocument">15.12 How can I write a function which takes a variable number of arguments and passes them to some other function ?</a>

<a href="q15.13.html" rel="subdocument">15.13 How can I call a function with an argument list built up at run time?</a>

------------------------------------------------------------------------

[top](faq.html)
