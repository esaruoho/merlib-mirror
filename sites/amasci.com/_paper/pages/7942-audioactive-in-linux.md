---
title: "Audioactive in Linux"
source_domain: amasci.com
source_path: ~slack/audioactive.html
order: 7942
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T06:00:27Z
extractor: site_to_paper.py (pandoc)
---

# Audioactive in Linux

*Source page: `~slack/audioactive.html`*

Audioactive in Linux

This little kludge allows linux users to play Telos' [Audioactive](http://www.audioactive.com) streams.\
Download the .m3u link, then type mp3stream \`cat whatever.m3u\`. You might have to adjust the speed in wavplay (-s option) for some streams\

    #!/bin/sh
    rm -f /tmp/stream.in /tmp/stream.out
    webget $1 | l3dec -wav -fn 0 -sti  /tmp/stream.in
    mkmp3head /tmp/stream.in /tmp/stream.out
    webget $1 | l3dec -wav -sto -sti 2>/dev/null | cat /tmp/stream.out - | wavplay $2 $3 $4
    rm -f /tmp/stream.in /tmp/stream.out

some streams:\
WCSB (college station): http://wcsb.org/cgi-bin/swsend/tmp/source2\
WCLV (classical): http://207.170.133.100/cgi-bin/swsend/tmp/source3\
\
I've included wavplay, l3dec, webget, mkmp3head, and the script [here](download/mp3stream.tgz)(103569 bytes).

News:

\* From the audioactive faq:\
G11. Is there a version for UNIX?\
Version 2.0 of the player (due in the Fall of 1997) supports most common UNIX platforms.

\* [Mpg123](http://www.sfs.nphil.uni-tuebingen.de/~hipp/mpg123.html), a unix mp3 player, can now stream audioactive streams (-y option), but it dosn't sound as good as the webget/l3dec hack.\
