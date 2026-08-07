---
title: "C Programming Notes"
source_domain: amasci.com
source_path: ~scs/cclass/krnotes/top.html
order: 7791
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T06:00:21Z
extractor: site_to_paper.py (pandoc)
---

# C Programming Notes

*Source page: `~scs/cclass/krnotes/top.html`*

# C Programming Notes

Notes to Accompany *The C Programming Language*, by Kernighan and Ritchie (\`\`K&R'')\
\
Steve Summit\
\

*The C Programming Language*, or K&R as it is affectionately known, is widely praised by experienced C programmers as one of the best books on C there is. (It was also the first; it also happens to be a best-seller.) The only real criticism K&R ever receives is that it may not be the best tutorial for beginners; it seems to assume a certain amount of programming savvy and familiarity with computers. Actually, if you read it carefully, you'll find that is constantly dispensing wisdom about programming in general, from basic concepts to deep insights to impeccable commentary on imponderable topics such as programming style, at the same time it teaches the specifics of the C language. Therefore, the fundamental criticism may simply be that K&R is not suitable for those who read carelessly.

The authors are not out to save the world or to convert it to their philosophy of programming. When they say something, they say it once, without theatrics or undue emphasis. If you read the book too quickly, or skim it, or look only for specific answers to what you think you're trying to learn today, you will miss much of the excellent advice which the authors have to offer.

These notes were prepared (beginning in Spring, 1995) for the University of Washington Experimental College course in Introductory C Programming. They are meant to supplement K&R for the reader who is new to C and perhaps to programming, and who wants a slightly more detailed, less pithy presentation. I'll add insights from my own experience, in particular by pointing out those areas where people traditionally misunderstand something about C or K&R's presentation of it. I'll also call out a few of the very deep sentences, which you might overlook at first even if you're not skimming (perhaps because their significance only becomes apparent once you've begun writing bigger or more complicated programs), but which contain advice which is absolutely vital to successful real-world programming and which, if you can take it to heart early, will save you from a lot of misery out in the school of hard knocks later on.

Note that most of these notes merely amplify on the things K&R is saying; there isn't much to say that it doesn't already say, usually better. In particular, many of the things that I'll comment on in the early chapters are discussed in more detail in the later chapters; by barging in with my know-it-all comments, I'm partially destroying the authors' careful progression from an initial, slightly superficial overview to a more detailed, complete presentation. If these notes present more detail than you want to see at first, don't worry (but please do let me know); just come back to them later to see if they clear up anything you're still uncertain on. (Also, if you find the description in K&R adequately clear, you don't have to read all of these notes, but do take note of the highlighted \`\`deep sentences.'')

------------------------------------------------------------------------

<a href="sx1.html" rel="subdocument">Preface</a>

<a href="sx2.html" rel="subdocument">Preface to the First Edition</a>

<a href="sx3.html" rel="subdocument">Introduction</a>

<a href="sx4.html" rel="subdocument">Chapter 1. A Tutorial Introduction</a>

<a href="sx5.html" rel="subdocument">Chapter 2: Types, Operators, and Expressions</a>

<a href="sx6.html" rel="subdocument">Chapter 3: Control Flow</a>

<a href="sx7.html" rel="subdocument">Chapter 4: Functions and Program Structure</a>

<a href="sx8.html" rel="subdocument">Chapter 5: Pointers and Arrays</a>

<a href="sx9.html" rel="subdocument">Chapter 6: Structures</a>

<a href="sx10.html" rel="subdocument">Chapter 7: Input and Output</a>

------------------------------------------------------------------------

<a href="sx1.html" rel="precedes">Read Sequentially</a>

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs/) // [Copyright](copyright.html) 1995, 1996 // [mail feedback](mailto:scs@eskimo.com)
