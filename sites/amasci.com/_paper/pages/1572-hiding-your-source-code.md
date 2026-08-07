---
title: "Hiding your source code"
source_domain: amasci.com
source_path: ~bloo/indexdot/html/topics/hiding.htm
order: 1572
reachable_from_entry: false
images: 0
internal_links: 6
extracted: 2026-08-07T17:07:53Z
extractor: site_to_paper.py (pandoc)
---

# Hiding your source code

*Source page: `~bloo/indexdot/html/topics/hiding.htm`*

<span class="pagetitle">Hiding Your Source Code</span>\
= <span class="sitetitle">Index DOT Html</span> by [Brian Wilson](../../misc/email.htm) =
=========================================================================================

|  |
|:--:|
| [Main Index](../index.html) \| [Element Index](../tagindex/a.htm) \| [Element Tree](../tree/htmltree.htm) \| [HTML Support History](../supportkey/a.htm) |
| [The Problem](#problem) \| [Possible Solutions](#solution) |

\
\

------------------------------------------------------------------------

<span id="problem"></span> **The Issue**

------------------------------------------------------------------------

I always see requests by authors looking for a simple method to hide their source code from readers. Presumably the reason for this is to prevent authors from re-using wholesale pieces of other people's documents. This desire can be well-founded, but preventing people from using something you worked hard to create takes enough additional effort that it is probably not worth the effort.\
\
<span id="solution"></span> **Possible Solutions**

------------------------------------------------------------------------

It is not possible to hide document content or HTML encoding from a user in the basic case. If the data stream is downloadable by the browser to be rendered, then it is available to the user to see as well.\
\
I had always thought this was the end of the story, but several people have e-mailed to me reporting of methods which can be used to accomplish this with varying degrees of success.\
\
**Methods suggested:**\

- Use a Java applet to fetch the source code and feed the display to the browser (this will prevent the browser from viewing the source.) Someone showed me an example where this is done. This may be the safest bet, but download time is greatly increased (the applet was *NOT* small by any means.) Look around on Java code web sites for applets like this.
- Encode the data (either with simple encodings or more complex encryption) and use Javascript to decode it on the fly. Place the javascript in an external file and use the SRC attribute of the SCRIPT element to reference, effectively isolating it from the view of the browser.\
  \
  Someone suggested putting 'X' characters between all letters, reversing the content or variations on this. Some simple javascripting could decode this correctly but so can a human with a little work.
- Fool the reader into thinking the source code is not available. Pad it with spaces and linefeeds so the source looks blank initially - believe me! This may fool some (but not all) readers...

------------------------------------------------------------------------

\
[Boring Copyright Stuff...](../../misc/copyright.htm)\
