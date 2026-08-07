---
title: "Structures, Unions, and Enumerations"
source_domain: amasci.com
source_path: ~scs/C-faq/s2.html
order: 7769
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T06:00:20Z
extractor: site_to_paper.py (pandoc)
---

# Structures, Unions, and Enumerations

*Source page: `~scs/C-faq/s2.html`*

# 2. Structures, Unions, and Enumerations

<a href="q2.1.html" rel="subdocument">2.1 What's the difference between <code>struct x1 { ... };</code> and <code>typedef struct { ... } x2;</code> ?</a>

<a href="q2.2.html" rel="subdocument">2.2 Why doesn't "<code>struct x { ... }; x thestruct;</code>" work?</a>

<a href="q2.3.html" rel="subdocument">2.3 Can a structure contain a pointer to itself?</a>

<a href="q2.4.html" rel="subdocument">2.4 What's the best way of implementing opaque (abstract) data types in C?</a>

<a href="q2.6.html" rel="subdocument">2.6 I came across some code that declared a structure with the last member an array of one element, and then did some tricky allocation to make it act like the array had several elements. Is this legal or portable?</a>

<a href="q2.7.html" rel="subdocument">2.7 I heard that structures could be assigned to variables and passed to and from functions, but K&amp;R1 says not.</a>

<a href="q2.8.html" rel="subdocument">2.8 Why can't you compare structures?</a>

<a href="q2.9.html" rel="subdocument">2.9 How are structure passing and returning implemented?</a>

<a href="q2.10.html" rel="subdocument">2.10 Can I pass constant values to functions which accept structure arguments?</a>

<a href="q2.11.html" rel="subdocument">2.11 How can I read/write structures from/to data files?</a>

<a href="q2.12.html" rel="subdocument">2.12 How can I turn off structure padding?</a>

<a href="q2.13.html" rel="subdocument">2.13 Why does <code>sizeof</code> report a larger size than I expect for a structure type?</a>

<a href="q2.14.html" rel="subdocument">2.14 How can I determine the byte offset of a field within a structure?</a>

<a href="q2.15.html" rel="subdocument">2.15 How can I access structure fields by name at run time?</a>

<a href="q2.18.html" rel="subdocument">2.18 I have a program which works correctly, but dumps core after it finishes. Why?</a>

<a href="q2.20.html" rel="subdocument">2.20 Can I initialize unions?</a>

<a href="q2.22.html" rel="subdocument">2.22 What is the difference between an enumeration and a set of preprocessor <code>#define</code>s?</a>

<a href="q2.24.html" rel="subdocument">2.24 Is there an easy way to print enumeration values symbolically?</a>

------------------------------------------------------------------------

[top](faq.html)
