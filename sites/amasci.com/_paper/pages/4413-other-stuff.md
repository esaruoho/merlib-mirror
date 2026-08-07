---
title: "Other Stuff"
source_domain: amasci.com
source_path: ~ksh/algae/stuff.html
order: 4413
reachable_from_entry: false
images: 2
internal_links: 1
extracted: 2026-08-07T05:57:30Z
extractor: site_to_paper.py (pandoc)
---

# Other Stuff

*Source page: `~ksh/algae/stuff.html`*

# <img src="brown.gif" data-align="middle" /> Other Stuff

Below are listed some of the libraries and packages that are used with Algae.

**gnuplot**  
Algae's "plot" function is a front end for [gnuplot](ftp://ftp.dartmouth.edu/pub/gnuplot/). This package is optional, but you can't plot without it.

**Readline**  
The GNU [Readline](ftp://prep.ai.mit.edu/pub/gnu/readline/) library is a command-line editing and history utility. It isn't required, but it's pretty handy.

**BLAS**  
The [BLAS](http://netlib.org/netlib/blas/) (Basic Linear Algebra Subroutines) library is optional in that Algae supplies its own if you don't have it. The version that Algae supplies is a subset of the generic version that comes with [LAPACK](http://netlib.org/netlib/lapack/). If your system provides a BLAS library, it may be faster than the one that comes with Algae. Some systems, though, have BLAS libraries that are broken or that contain only a subset of the routines you'll need.

**LAPACK**  
The [LAPACK](http://netlib.org/netlib/lapack/) library is also optional, as Algae supplies its own if you don't have it. It contains routines for many numerical linear algebra operations. Version 3.0 is required.

**BCSLIB**  
BCSLIB is a package of high-quality linear algebra routines from [Boeing](http://www.boeing.com/). (BCS was the acronym for "Boeing Computer Services".) If you have BCSLIB, Algae can use its sparse matrix capabilities to good advantage. Actually, it's BCSLIB-EXT that we use -- it then calls BCSLIB. I've been told that all [Cray](http://www.cray.com/) machines have this.

**Info**  
Algae provides its documentation in both html and info formats. You probably already have an html browser (like [Netscape](http://www.netscape.com/)); if you prefer, the info format can be read either within [Emacs](ftp://prep.ai.mit.edu/pub/gnu/emacs/) or with one of the stand-alone Info programs such as [Info](ftp://prep.ai.mit.edu/pub/gnu/texinfo/) or [tkinfo](http://math-www.uni-paderborn.de/~axel/tkinfo/).

------------------------------------------------------------------------

[<img src="icon.gif" data-border="0" data-align="middle" /> Algae Home](index.html)
