---
title: "Stdio"
source_domain: amasci.com
source_path: ~scs/C-faq/s12.html
order: 7931
reachable_from_entry: false
images: 0
internal_links: 2
extracted: 2026-08-07T17:15:34Z
extractor: site_to_paper.py (pandoc)
---

# Stdio

*Source page: `~scs/C-faq/s12.html`*

# 12. Stdio

<a href="q12.1.html" rel="subdocument">12.1 What's wrong with the code "<code>char c; while((c = getchar()) != EOF) ...</code>"?</a>

<a href="q12.2.html" rel="subdocument">12.2 Why won't the code `` <code>while(!feof(infp)) { fgets(buf, MAXLINE, infp); fputs(buf, outfp); } </code>'' work?</a>

<a href="q12.4.html" rel="subdocument">12.4 My program's prompts and intermediate output don't always show up on the screen.</a>

<a href="q12.5.html" rel="subdocument">12.5 How can I read one character at a time, without waiting for the RETURN key?</a>

<a href="q12.6.html" rel="subdocument">12.6 How can I print a <code>'%'</code> character with <code>printf</code>?</a>

<a href="q12.9.html" rel="subdocument">12.9 How can <code>printf</code> use <code>%f</code> for type <code>double</code>, if <code>scanf</code> requires <code>%lf</code>?</a>

<a href="q12.10.html" rel="subdocument">12.10 How can I implement a variable field width with <code>printf</code>?</a>

<a href="q12.11.html" rel="subdocument">12.11 How can I print numbers with commas separating the thousands?</a>

<a href="q12.12.html" rel="subdocument">12.12 Why doesn't the call <code>scanf("%d", i)</code> work?</a>

<a href="q12.13.html" rel="subdocument">12.13 Why doesn't the code "<code>double d; scanf("%f", &amp;d);</code>" work?</a>

<a href="q12.15.html" rel="subdocument">12.15 How can I specify a variable width in a <code>scanf</code> format string?</a>

<a href="q12.17.html" rel="subdocument">12.17 When I read numbers from the keyboard with <code>scanf</code> <code>"%d\n"</code>, it seems to hang until I type one extra line of input.</a>

<a href="q12.18.html" rel="subdocument">12.18 I'm reading a number with <code>scanf</code> <code>%d</code> and then a string with <code>gets()</code>, but the compiler seems to be skipping the call to <code>gets()</code>!</a>

<a href="q12.19.html" rel="subdocument">12.19 I'm re-prompting the user if <code>scanf</code> fails, but sometimes it seems to go into an infinite loop.</a>

<a href="q12.20.html" rel="subdocument">12.20 Why does everyone say not to use <code>scanf</code>? What should I use instead?</a>

<a href="q12.21.html" rel="subdocument">12.21 How can I tell how much destination buffer space I'll need for an arbitrary <code>sprintf</code> call? How can I avoid overflowing the destination buffer with <code>sprintf</code>?</a>

<a href="q12.23.html" rel="subdocument">12.23 Why does everyone say not to use <code>gets()</code>?</a>

<a href="q12.24.html" rel="subdocument">12.24 Why does <code>errno</code> contain ENOTTY after a call to <code>printf</code>?</a>

<a href="q12.25.html" rel="subdocument">12.25 What's the difference between <code>fgetpos</code>/<code>fsetpos</code> and <code>ftell</code>/<code>fseek</code>?</a>

<a href="q12.26.html" rel="subdocument">12.26 Will <code>fflush(stdin)</code> flush unread characters from the standard input stream?</a>

<a href="q12.30.html" rel="subdocument">12.30 I'm trying to update a file in place, by using <code>fopen</code> mode <code>"r+"</code>, but it's not working.</a>

<a href="q12.33.html" rel="subdocument">12.33 How can I redirect <code>stdin</code> or <code>stdout</code> from within a program?</a>

<a href="q12.34.html" rel="subdocument">12.34 Once I've used <code>freopen</code>, how can I get the original stream back?</a>

<a href="q12.38.html" rel="subdocument">12.38 How can I read a binary data file properly?</a>

------------------------------------------------------------------------

[top](faq.html)
