---
title: "Null Pointers"
source_domain: amasci.com
source_path: ~scs/C-faq/s5.html
order: 7773
reachable_from_entry: false
images: 0
internal_links: 2
extracted: 2026-08-07T06:00:20Z
extractor: site_to_paper.py (pandoc)
---

# Null Pointers

*Source page: `~scs/C-faq/s5.html`*

# 5. Null Pointers

<a href="q5.1.html" rel="subdocument">5.1 What is this infamous null pointer, anyway?</a>

<a href="q5.2.html" rel="subdocument">5.2 How do I get a null pointer in my programs?</a>

<a href="q5.3.html" rel="subdocument">5.3 Is the abbreviated pointer comparison ``<code>if(p)</code>'' to test for non-null pointers valid?</a>

<a href="q5.4.html" rel="subdocument">5.4 What is <code>NULL</code> and how is it <code>#define</code>d?</a>

<a href="q5.5.html" rel="subdocument">5.5 How should <code>NULL</code> be defined on a machine which uses a nonzero bit pattern as the internal representation of a null pointer?</a>

<a href="q5.6.html" rel="subdocument">5.6 If <code>NULL</code> were defined as ``<code>((char *)0)</code>,'' wouldn't that make function calls which pass an uncast <code>NULL</code> work?</a>

<a href="q5.9.html" rel="subdocument">5.9 If <code>NULL</code> and <code>0</code> are equivalent as null pointer constants, which should I use?</a>

<a href="q5.10.html" rel="subdocument">5.10 But wouldn't it be better to use <code>NULL</code>, in case the value of <code>NULL</code> changes?</a>

<a href="q5.12.html" rel="subdocument">5.12 I use the preprocessor macro "<code>#define Nullptr(type) (type *)0</code>" to help me build null pointers of the correct type.</a>

<a href="q5.13.html" rel="subdocument">5.13 This is strange. <code>NULL</code> is guaranteed to be <code>0</code>, but the null pointer is not?</a>

<a href="q5.14.html" rel="subdocument">5.14 Why is there so much confusion surrounding null pointers?</a>

<a href="q5.15.html" rel="subdocument">5.15 I'm confused. I just can't understand all this null pointer stuff.</a>

<a href="q5.16.html" rel="subdocument">5.16 Given all the confusion surrounding null pointers, wouldn't it be easier simply to require them to be represented internally by zeroes?</a>

<a href="q5.17.html" rel="subdocument">5.17 Seriously, have any actual machines really used nonzero null pointers?</a>

<a href="q5.20.html" rel="subdocument">5.20 What does a run-time ``null pointer assignment'' error mean?</a>

------------------------------------------------------------------------

[top](faq.html)
