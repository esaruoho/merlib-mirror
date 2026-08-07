---
title: "Memory Allocation"
source_domain: amasci.com
source_path: ~scs/C-faq/s7.html
order: 7944
reachable_from_entry: false
images: 0
internal_links: 4
extracted: 2026-08-07T17:15:35Z
extractor: site_to_paper.py (pandoc)
---

# Memory Allocation

*Source page: `~scs/C-faq/s7.html`*

# 7. Memory Allocation

<a href="q7.1.html" rel="subdocument">7.1 Why doesn't the code ``<code>char *answer; gets(answer);</code>'' work?</a>

<a href="q7.2.html" rel="subdocument">7.2 I can't get <code>strcat</code> to work. I tried ``<code>char *s3 = strcat(s1, s2);</code>'' but I got strange results.</a>

<a href="q7.3.html" rel="subdocument">7.3 But the man page for <code>strcat</code> says that it takes two <code>char *</code>'s as arguments. How am I supposed to know to allocate things?</a>

<a href="q7.5.html" rel="subdocument">7.5 I have a function that is supposed to return a string, but when it returns to its caller, the returned string is garbage.</a>

<a href="q7.6.html" rel="subdocument">7.6 Why am I getting ``warning: assignment of pointer from integer lacks a cast'' for calls to <code>malloc</code>?</a>

<a href="q7.7.html" rel="subdocument">7.7 Why does some code carefully cast the values returned by <code>malloc</code> to the pointer type being allocated?</a>

<a href="q7.8.html" rel="subdocument">7.8 Why does so much code leave out the multiplication by <code>sizeof(char)</code> when allocating strings?</a>

<a href="q7.14.html" rel="subdocument">7.14 I've heard that some operating systems don't actually allocate <code>malloc</code>'ed memory until the program tries to use it. Is this legal?</a>

<a href="q7.16.html" rel="subdocument">7.16 I'm allocating a large array for some numeric work, but <code>malloc</code> is acting strangely.</a>

<a href="q7.17.html" rel="subdocument">7.17 I've got 8 meg of memory in my PC. Why can I only seem to <code>malloc</code> 640K or so?</a>

<a href="q7.19.html" rel="subdocument">7.19 My program is crashing, apparently somewhere down inside <code>malloc</code>.</a>

<a href="q7.20.html" rel="subdocument">7.20 You can't use dynamically-allocated memory after you free it, can you?</a>

<a href="q7.21.html" rel="subdocument">7.21 Why isn't a pointer null after calling <code>free</code>?</a>

<a href="q7.22.html" rel="subdocument">7.22 When I call <code>malloc</code> to allocate memory for a local pointer, do I have to explicitly <code>free</code> it?</a>

<a href="q7.23.html" rel="subdocument">7.23 When I free a dynamically-allocated structure containing pointers, do I have to free each subsidiary pointer first?</a>

<a href="q7.24.html" rel="subdocument">7.24 Must I free allocated memory before the program exits?</a>

<a href="q7.25.html" rel="subdocument">7.25 Why doesn't my program's memory usage go down when I free memory?</a>

<a href="q7.26.html" rel="subdocument">7.26 How does <code>free</code> know how many bytes to free?</a>

<a href="q7.27.html" rel="subdocument">7.27 So can I query the malloc package to find out how big an allocated block is?</a>

<a href="q7.30.html" rel="subdocument">7.30 Is it legal to pass a null pointer as the first argument to <code>realloc</code>?</a>

<a href="q7.31.html" rel="subdocument">7.31 What's the difference between <code>calloc</code> and <code>malloc</code>?</a>

<a href="q7.32.html" rel="subdocument">7.32 What is <code>alloca</code> and why is its use discouraged?</a>

------------------------------------------------------------------------

[top](faq.html)
