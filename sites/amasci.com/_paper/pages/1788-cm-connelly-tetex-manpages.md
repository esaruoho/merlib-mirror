---
title: "C.M. Connelly: teTeX Manpages"
source_domain: amasci.com
source_path: ~c/debian/tetex-manpages/index.html
order: 1788
reachable_from_entry: false
images: 3
internal_links: 5
extracted: 2026-08-07T05:55:26Z
extractor: site_to_paper.py (pandoc)
---

# C.M. Connelly: teTeX Manpages

*Source page: `~c/debian/tetex-manpages/index.html`*

<span id="top"> </span>

<div id="navbar">

<a href="../../blog/index.html" class="navbar">Blog</a> \| <a href="../index.html" class="navbar">Debian</a> \| <a href="../../work/index.html" class="navbar">Work</a> \| <a href="../../work/resume/index.html" class="navbar">Résumé</a> \| <a href="../../about/index.html" class="navbar">About...</a>

</div>

<div id="header">

[<img src="../../images/logo-light.png" data-border="0" width="200" height="85" alt="Link to Home" />](../../index.html)

# teTeX Manpages

</div>

<div id="content">

I'm working on writing manpages for Debian's `tetex-bin` package. Here's a table showing the missing man pages (based on the links to `/usr/share/man/man1/dh_undocumented.1.gz` created by the `dh_undocumented` script) and the status of these manpages:

## Progress

| Manpage | `tetex-bin_1.06` | `tetex-bin_1.07` | Status |
|----|----|----|----|
| e2pall.1 | X | X | [fourth draft](e2pall.1.html) |
| fmtutil.cnf.5 | X | X | [second draft](fmtutil.cnf.5.html) |
| fmtutil.8 | X | X | [second draft](fmtutil.8.html) |
| fontinst.1 | X | X | [fourth draft](fontinst.1.html) |
| kpsepath.1 | X | X | [second draft](kpsepath.1.html) |
| kpsetool.1 | X | X | [second draft](kpsetool.1.html) |
| kpsexpand.1 | X | X | [second draft](kpseexpand.1.html) |
| mkfontdesc.8 | X | X | [second draft](mkfontdesc.8.html) |
| mkindex.1 | X | X | [second draft](mkindex.1.html) |
| mkocp.1 | X | X | [second draft](mkocp.1.html) |
| mkofm.1 | X | X | [second draft](mkofm.1.html) |
| ofm2opl.1 | X | X | [second draft](ofm2opl.1.html) |
| opl2ofm.1 | X | X | [second draft](opl2ofm.1.html) |
| otp2ocp.1 | X | X | [second draft](otp2ocp.1.html) |
| outocp.1 | X | X | [second draft](outocp.1.html) |
| ovf2ovp.1 | X | X | [second draft](ovf2ovp.1.html) |
| ovp2ovf.1 | X | X | [second draft](ovp2ovf.1.html) |
| pslatex.1 | X | X | [second draft](pslatex.1.html) |
| rubibtex.1 | X | X | [second draft](rubibtex.1.html) |
| rumakeindex.1 | X | X | [second draft](rumakeindex.1.html) |
| texdoc.1 | X | X | [second draft](texdoc.1.html) |
| texexec.1 |   | X | [second draft](texexec.1.html) |
| texi2pdf.1 | X | X | [second draft](texi2pdf.1.html) |
| texlinks.8 |   | X | [second draft](texlinks.8.html) |
| texshow.1 |   | X | [second draft](texshow.1.html) |
| texutil.1 |   | X | [second draft](texutil.1.html) |
| thumbpdf.1 |   | X | [second draft](thumbpdf.1.html) |
| ttf2afm.1 | X | X | [second draft](ttf2afm.1.html) |

Take a look at the [complete changelog](ChangeLog).

The “fourth draft” consists of changes in the author information for [`e2pall`](e2pall.1.html)(1) and [`fontinst`](fontinst.1.html)(1).

The “third draft” was changes to the Makefile, addition of a changelog, and so forth, and wasn't actually released.

The “second draft” was the first draft that was “ready to go”. The main changes were

- Adding information about authorship/bug-fixing responsibility for various programs
- Replacement of stylistic markup with semantic markup (in the Yodl files)
- New manpages for [`texexec`](texexec.1.html)(1), [`texshow`](texshow.1.html)(1), and [`texutil`](texutil.1.html)(1) (the ConTeXt manpages) written by Tobias Burnus based on the PDF documentation for ConTeXt and rewritten by me.
- A new manpage for [`fmtutil.cnf`](fmtutil.cnf.5.html)(5)

## Feedback!

I would greatly appreciate feedback on these manpages, especially from people who use or the authors of the scripts or programs being documented. Please send any such feedback to [me](mailto:c@eskimo.com?Subject=teTeX%20Manpages). Thanks!

If you want to look at the source, you can download one (or both) of the following tar files:

- [tetex-manpages.tar.gz](tetex-manpages.tar.gz)—\*roff sources (20 kB)
- [tetex-manpages-yodl.tar.gz](tetex-manpages-yodl.tar.gz)—yodl sources (24 kB)

<div id="footer">

[<img src="../../images/Valid_XHTML10.png" data-border="0" width="88" height="31" alt="Valid XHTML 1.0!" />](http://validator.w3.org/check?uri=http://www.eskimo.com/~c/debian/tetex-manpages/index.html;ss)

Copyright © 1998–2002, C.M. Connelly.

Last modified at 10:02 AM PST, Monday, March 25, 2002; last rendered at 2:41 PM PDT, Monday, September 2, 2002 with [Mason](http://www.masonhq.com/) and [Perl](http://www.perl.org/).

Please [e-mail me about problems with this page](mailto:c@eskimo.com?Subject=Problem%20with%20/eskimo/debian/tetex-manpages/index.html). Thanks.

</div>

[<img src="../../images/scrollup.gif" data-border="0" width="9" height="11" alt="Return to Top of Page" />](#top)

</div>
