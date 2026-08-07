---
title: "C.M. Connelly: About this Site..."
source_domain: amasci.com
source_path: ~c/about/index.html
order: 1761
reachable_from_entry: false
images: 15
internal_links: 13
extracted: 2026-08-07T17:08:04Z
extractor: site_to_paper.py (pandoc)
---

# C.M. Connelly: About this Site...

*Source page: `~c/about/index.html`*

<span id="top"> </span>

<div id="navbar">

<a href="../blog/index.html" class="navbar">Blog</a> \| <a href="../debian/index.html" class="navbar">Debian</a> \| <a href="../work/index.html" class="navbar">Work</a> \| <a href="../work/resume/index.html" class="navbar">Résumé</a> \| <span class="thispagelink">About...</span>

<a href="index.html#software" class="navbar">Software</a> \| <a href="index.html#weblog" class="navbar">Weblog</a> \| <a href="index.html#standards" class="navbar">Standards</a> \| <a href="index.html#hardware" class="navbar">Hardware</a> \| <a href="index.html#claire" class="navbar">Me</a> \| <a href="index.html#comments" class="navbar">Comments</a> \| <a href="index.html#badges" class="navbar">Badges</a>

</div>

<div id="header">

[<img src="../images/logo-light.png" data-border="0" width="200" height="85" alt="Link to Home" />](../index.html)

# About this Site...

</div>

<div id="content">

## Software

This site is maintained with [HTML::Mason](http://www.masonhq.com/), a Perl <span class="abbr" title="Content Management System">CMS</span> that is also used by [Salon](http://www.salon.com/) as the basis of their CMS.

As of February 2002, all the code outside of Mason itself was written by me. Although I have considered using some components written by others, I haven't found any that would be more useful than those I've written myself.

Probably the most notable components are `gr`, which provides a shortcut for adding links, and `img`, which provides a short way of inserting images (with or without links). Both components replace similar functionality in [UserLand Frontier](http://frontier.userland.com/), which I used to generate earlier versions of my site (ca. 1997–1999).

[HTML::Mason](http://www.masonhq.com/) is a complicated beast, but with the complexity comes the full power of [Perl](http://www.perl.com/). Anything that can be done in Perl (which is pretty much anything) can be done in Mason with a bit of coding and stick-to-it-ivness. I miss some of the simplicity of using Frontier (for example, typing `"foo"` instead of `<& /gr, 'foo' &>`), but I have much more control over everything that goes on in the site (because I wrote all the code, and I know there isn't any weird magic happening in some mysterious script being called as part of the rendering process) and that's worth it. (Being free from Dave's closed source, expensive products, and weird idea of “support” are icing on the cake.)

All the PDF documents on this site were created using [LaTeX](http://www.latex-project.org/) and processed into PDF files using [ps2pdf](http://www.cs.wisc.edu/~ghost/doc/AFPL/6.50/Ps2pdf.htm). By and large, the typefaces used are Robert Slimbach's [Adobe Kepler MM](http://www.adobe.com/type/browser/P/P_409.html) (serif) and [Adobe Cronos MM](http://www.adobe.com/type/browser/P/P_416.html) (sans-serif).

[<img src="../images/scrollup.gif" data-border="0" width="9" height="11" alt="Return to Top of Page" />](#top)

## The Weblog

As of this writing, my weblog consists of several Mason components that provide the page layout and the content of the sidebar.

The blog content (current page and archives) consists of several Mason components that are assembled by a Perl script (currently *not* part of the Mason site) from a series of files stored in a hierarchical directory structure. Using files instead of a database gives me all the benefits of a database without actually having to waste time and energy getting a complex database server up and running for what is, after all, a rather modest job. ([Jamie Zawinkski](http://www.jwz.org/gronk/) would be proud (notice the last feature).)

[<img src="../images/scrollup.gif" data-border="0" width="9" height="11" alt="Return to Top of Page" />](#top)

## Standards

I care a lot about [standards](http://www.w3.org/) and accessibility. The most recent retrofit of this site (February, 2002) involved tearing out the old `<table>`-based layout (inherited from older tools) and replacing it with a clean <span class="abbr" title="Cascading Style Sheets">CSS</span>-based layout.

I'm also looking at moving the site to use <span class="abbr" title="eXtensible HyperText Markup Language">XHTML</span>, as well, making it easier to move to <span class="abbr" title="eXtensible Markup Language">XML</span> when the time is right. In the meantime, the site uses the [HTML 4.01 Transitional](http://www.w3.org/TR/html401/) <span class="abbr" title="Document Type Definition">DTD</span>.

If you're seeing exceptionally plain pages, and you're not using a text browser, you're probably using an older browser that isn't completely standards-compliant. If you can, I recommend that you upgrade your browser to one that is standards-compliant—you'll see benefits immediately.

If you can't upgrade your browser, I apologize. I'm stuck with an old, buggy version of Netscape on `diziet` myself, but I'm running [Mozilla](http://www.mozilla.org/) on `perosteck`, and it's great. Newer versions of Microsoft's Internet Explorer browser also work pretty well.

[<img src="../images/scrollup.gif" data-border="0" width="9" height="11" alt="Return to Top of Page" />](#top)

## Hardware

I'm currently running two computers. Mason is running on my main system: `diziet`, a [PowerComputing PowerCenter 132](http://www.everymac.com/systems/powercc/powercenter/powercenter132.html). That's a Macintosh clone (from the brief reign of Mac clones) with a 132 MHz PowerPC 604e processor. Diziet has 300 MB of RAM, and a variety of hard drives, one of which holds my primary operating system, [Debian GNU/Linux](http://www.debian.org/). I also have a cool monitor, the [Portrait Display Labs Pivot 1700](http://www.macworld.com/1996/03/reviews/1875.html), whose coolest feature—pivoting between landscape and portrait mode—I can't actually use under Linux.

The new machine, `perosteck`, is a shiny [Apple](http://www.apple.com/) Quicksilver G4 running [Mac OS X](http://www.apple.com/macosx/). I'm using that machine more and more for web browsing and, of course, any image editing I need to do. `diziet` is still my main machine, however, as the text-editing and mail-reading options available for Mac OS X don't suit my needs and preferences just yet.

It's also fair to say that I would feel guilty abandoning `diziet` outright, and also that I feel much more comfortable with the power and flexibility offered by Debian's file-system layout and packaging system, for which there is no truly viable alternative for Mac OS X at this time.

Other fun facts: I have a [Kensington TurboMouse trackball](http://www.kensington.com/products/pro_mic_d1328.html) on `diziet` (and a [TurboMouse Pro](http://www.kensington.com/products/pro_mic_d1399.html) on `perosteck`), and listen to music with [Harman Kardon SoundSticks]().

I usually sit on a [PostureBall](http://www.postureball.com/index2.html) when working at my [Ikea](http://www.ikea.com/) [Effectiv desk](http://www.ikea-usa.com/product_presentation/show.asp?ProductNumber=00004734&type=III).

[<img src="../images/scrollup.gif" data-border="0" width="9" height="11" alt="Return to Top of Page" />](#top)

## Me

You can learn plenty about me by checking out my my [blog](../blog/) (and maybe my [work](../work/) section), but here's a brief summary:

> I'm a thirty-something generalist. My degree is in anthropology, but I've worked at archaeological sites, museums, nonprofit associations, computer startups, and as a freelance book editor. I love to read and listen to music; my other interests (really on-again–off-again obsessions) vary widely and include (but are hardly limited to) archaeology, computers, folklore, geography, geology, history, modern art, particle physics, typography, and writing.
>
> I'm lucky enough to have found [Melissa](http://www.cs.hmc.edu/~oneill/) (AKA “M”), an amazingly cool individual with whom I joyously duel verbally, mentally, and emotionally every day.

[<img src="../images/scrollup.gif" data-border="0" width="9" height="11" alt="Return to Top of Page" />](#top)

## Questions? Problems? Complaints?

Please e-mail questions, complaints, or corrections to *[c@eskimo.com](mailto:c+web@eskimo.com).*

[<img src="../images/scrollup.gif" data-border="0" width="9" height="11" alt="Return to Top of Page" />](#top)

## Badges of Distinction

<div id="badgearray">

[<img src="../images/Valid_XHTML10.png" data-border="0" width="88" height="31" alt="Valid XHTML 1.0!" />](http://validator.w3.org/) [<img src="../images/MadeWithMason.gif" data-border="0" width="122" height="41" alt="Made With HTML::Mason" />](http://www.masonhq.com/) [<img src="../images/MWCSS.gif" data-border="0" width="88" height="31" alt="Made With Cascading Style Sheets" />](http://www.w3.org/Style/CSS/Buttons/)\
[<img src="../images/ContentEnhanced.gif" data-border="0" width="96" height="32" alt="Best Viewed With Any Browser Campaign" />](http://www.anybrowser.org/campaign/) [<img src="../images/PerlRepublicBlue.gif" data-border="0" width="90" height="90" alt="The Perl Republic Logo" />](http://www.perl.com/) [<img src="../images/GetAcrobat.gif" data-border="0" width="88" height="31" alt="Get Adobe Acrobat" />](http://www.adobe.com/prodindex/acrobat/readstep.html)

</div>

<div id="footer">

[<img src="../images/Valid_XHTML10.png" data-border="0" width="88" height="31" alt="Valid XHTML 1.0!" />](http://validator.w3.org/check?uri=http://www.eskimo.com/~c/about/index.html;ss)

Copyright © 1998–2002, C.M. Connelly.

Last modified at 1:43 PM PDT, Monday, September 22, 2003; last rendered at 9:22 PM PST, Sunday, November 30, 2003 with [Mason](http://www.masonhq.com/) and [Perl](http://www.perl.org/).

Please [e-mail me about problems with this page](mailto:c@eskimo.com?Subject=Problem%20with%20/eskimo/about/index.html). Thanks.

</div>

[<img src="../images/scrollup.gif" data-border="0" width="9" height="11" alt="Return to Top of Page" />](#top)

</div>
