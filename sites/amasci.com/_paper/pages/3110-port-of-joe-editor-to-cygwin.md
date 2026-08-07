---
title: "Port of Joe Editor to Cygwin"
source_domain: amasci.com
source_path: ~ewu/cygwin/joe-editor/index.html
order: 3110
reachable_from_entry: false
images: 3
internal_links: 0
extracted: 2026-08-07T05:56:33Z
extractor: site_to_paper.py (pandoc)
---

# Port of Joe Editor to Cygwin

*Source page: `~ewu/cygwin/joe-editor/index.html`*

## Table of Content

Please click to select one of the following:

1.  [Joe 2.9.6 binary with wordwrap enhancement from Gerrit's server](#joe29bin)
2.  [Joe 2.9.6 source including wordwrap patch from Gerrit's server](#joe29bin)
3.  [Compiling Joe 2.9.6 source from SourceForge](#joe29)
4.  [Compiling Joe 2.8 source from a Linux archive](#joe28)

### <span id="joe28">Compiling Joe Editor on Cygwin 1.1.8+</span>

#### Joe Version 2.8

Here is the [makefile](http://www.eskimo.com/~ewu/cygwin/joe2.8/Makefile.cygwin) to build and install joe 2.8. This one does not use any configure script to build itself. You can use the makefile if you don't run configure on Cygwin.\
\
In case you have never done it before, follow these steps:

1.  Download joe-2.8-src+bin.tar.gz from [this site](http://www.ibiblio.org/pub/Linux/apps/editors/terminal/) .
2.  Create a new directory by: mkdir joe2.8
3.  Copy the tar.gz file to the joe2.8 directory
4.  Also copy Makefile.cygwin to the joe2.8 directory
5.  Change to the joe2.8 directory
6.  Unpack joe 2.8 by: tar zxvf joe-2.8-src+bin.tar.gz
7.  Apply the patch if you like, or just omit the patch if you don't use rxvt. This patch is not needed to run joe in Cygwin.
8.  Get into the joe2.8 directory if not in the directory.
9.  make -f Makefile.cygwin
10. make -f Makefile.cygwin install

That's it.

#### <span id="joe29">Joe Version 2.9.6</span>

Version 2.9.6 is the latest version at the time of this writing. If you have GNU gcc compiler installed with Cygwin, you can also compile joe for yourself. The new version uses a configure script\* to configure the makefile for Cygwin. It is available from [Sourceforge](http://sourceforge.net/projects/joe-editor). No special makefile is needed for cygwin. It builds cleanly out of the box.

In case you have never done it before, follow the instruction:

1.  Download joe 2.9.6 and unpack by: tar zxvf joe-2.9.6.tgz
2.  Chdir to the joe 2.9.6 directory
3.  ./configure
4.  make all
5.  make install

That's it!

\* In rare cases, the configure script may not run smoothly. You can just download the v2.9.6 binary package mentioned above. Another option is to compile v2.8, which can be built without a configure script on virtually any Windows platform.

### <span id="joe29bin">Wordwrap Patched Joe 2.9.6 Binary and Source</span>

This is the latest version at the time of this writing. You can download the binary tarball and the source (v2.9.6 with wordwrap patch applied) from [Gerrit P. Haase's server](http://familiehaase.de/cygwin.html). Please be aware that this is a slow link. Try to download at a later time if you cannot make connection immediately.

You are visitor number    <img src="http://counter.digits.com/wc/-d/4/joedcounter" data-align="middle" data-border="0" data-hspace="4" data-vspace="2" width="60" height="20" />since June 12, 2001. The web counter is provided by [www.digits.com<img src="./wc.gif" data-border="1" data-vspace="2" data-hspace="2" data-align="middle" width="157" height="43" />](http://www.digits.com/)

[<img src="../../icons/valid-html401.gif" width="88" height="31" alt="Valid HTML 4.01!" />](http://validator.w3.org/check/referer)

Created by: Enoch Wu
