---
title: "JBM - MPM - Input"
source_domain: amasci.com
source_path: ~jbm/mpm/input.html
order: 3632
reachable_from_entry: false
images: 0
internal_links: 11
extracted: 2026-08-07T05:56:55Z
extractor: site_to_paper.py (pandoc)
---

# JBM - MPM - Input

*Source page: `~jbm/mpm/input.html`*

[\[Bibliography\]](../bibliography/bibliography.html)

[\[Calculations\]](../calculations/calculations.html)

[\[Downloads\]](../downloads/downloads.html)

[\[Equations\]](../equations/equations.html)

[\[FAQ\]](../faq/faq.html)

[\[JBM\]](../index.html)

[\[Links\]](../links/links.html)

[\[MPM\]](../mpm/mpm.html)

[\[PM\]](../pm/pm.html)

[\[Personal\]](../personal/personal.html)

[\[Software\]](../software/software.html)

------------------------------------------------------------------------

# JBM - MPM - Input

MPM is currently a command line driven program. It reads it's input data from specified files and produces the output based on options in each file. There are three files for use with MPM. The first is a bullet file. It holds all the parameters associated with a particular projectile. The second is the trajectory file which holds trajectory parameters, firearm paramters, etc. The third and last file is an options which holds default filenames, and output formatting options.

All three files have the same format. Each parameter is on it's own line, with the syntax "name = value", where "name" is the parameter name (e.g. muzzle_velocity, chron_velocity) and "value" is the desired value (e.g. 2600.0). Blank lines, and lines beginning with a pound sign, "#", are ignored. Similarly, on any other line, the "#" denotes a beginning of a comment and all characters after it are ignored. Fields (name and value) are not required to be in any particular order. In the example files with MPM, the like fields are grouped together. The sample files, [trajectory file](text/mpm.trj), [bullet file](text/mpm.blt), [options file](text/mpm.opt), [velocity file](text/mpm.vel), [output file](text/mpm.txt) and an [wind file](text/mpm.wnd). are heavily commented and make a good starting point for your own files.

As of version 0.9.19, bullet input units can be inches or calibers. The default is calibers so that old files still work, but newer files can set the variable "bullet_units" to "1" to use inches. An example of the file mpm.blt with inches instead of calibers is [in.blt](text/in.blt). Note that all the variables in the DIMENSIONS section are in units of inches. Also, the center of gravity is inches from the nose.

Also included in the download are the [README](text/README), and the [LICENSE](text/LICENSE) file.

------------------------------------------------------------------------

<span class="small">Last update 26 January 2005, Copyright © 1996-2005 [JBM](mailto:jbm@eskimo.com) [\[V\]](http://www.htmlhelp.com/cgi-bin/validate.cgi?url=referer&input=yes)</span>
