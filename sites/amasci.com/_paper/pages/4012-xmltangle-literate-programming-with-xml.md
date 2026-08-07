---
title: "xmltangle - literate programming with XML"
source_domain: amasci.com
source_path: ~johnnyb/computers/xmltangle/index.html
order: 4012
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T17:10:45Z
extractor: site_to_paper.py (pandoc)
---

# xmltangle - literate programming with XML

*Source page: `~johnnyb/computers/xmltangle/index.html`*

# xmltangle - literate programming with XML

xmltangle is a program to do a somewhat [literate programming](http://www.literateprogramming.com/) style using [XML DocBook](http://www.docbook.org/). For those of you who don't know, in literate programming, you essentially write an essay about your program which also contains your program. This way, you are forced to think more clearly about the decisions you make, and how you design your program. It makes your programs better structured and better thought out. xmltangle does not include all of Knuth's web system, but it is at least a good start. The way xmltangle works, is that within a DocBook document, if it finds a `<programlisting>` tag, it copies the code listed there into the filename specified by the `role` attribute. The next version of xmltange will probably use XML processing instructions instead of specific tags, and support more of the "literate programming" concept.

# NEWS FLASH!

Rafael Sevilla has built his own version of xmltangle which fixes some problems in mine. You can get it [at his site](ftp://dido.engr.internet.org.ph/pub/xml-lit.tar.gz) or I have a [local copy](xml-lit.tar.gz). This fixes a CDATA bug in my code, and adds `#line` directives to the generated C code. Great job Rafael! I will probably add his enhancements to my version at some point, but until then, you're probably better off using his version. Just to note, it uses expat instead of libxml as its parser.

# Documentation

Comprehensive documentation on the program is available [here](xmltangle.htm), or you can view it in [postscript](xmltangle.ps) or [PDF](xmltangle.pdf) format.

# Requirements

Running the program requires:

- libxml
- glib

Building the program requires:

- a working gnome installation with development libraries (because I'm too lazy to figure out autoconf, and gnome-config is real easy to do)
- gcc

Building the documentation requires:

- a full installation (EVERYTHING) of RedHat 6.2. This is the only easy way to describe how to get all of the SGML stylesheets to work

# Getting the Program

## Source

- [Source for version 0.1](xmltangle-0.1.tar.gz)

## Binaries

- [xmltangle version 0.1 program for i386 glibc linux machines](xmltangle-linux-i386-0.1.tar.gz)
- [xmltangle version 0.1 program for LinuxPPC 2000 machines](xmltangle-linux-ppc-0.1.tar.gz)

# Questions or Comments

If you have **ANY** questions or comments, please email me at <johnnyb@wolfram.com>. If I do not reply, EMAIL ME AGAIN. Most likely, your letter looked like spam so I deleted it. So, make the subject line be as far from spam as possible. I want your input, so please let me know, even just to say that it works on your machine (or doesn't work, for that matter)

------------------------------------------------------------------------

Go to my [main page](http://members.wri.com/johnnyb/)
