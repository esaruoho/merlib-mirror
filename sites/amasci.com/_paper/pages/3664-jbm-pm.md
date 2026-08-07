---
title: "JBM - PM"
source_domain: amasci.com
source_path: ~jbm/pm/pm.html
order: 3664
reachable_from_entry: false
images: 0
internal_links: 12
extracted: 2026-08-07T17:10:18Z
extractor: site_to_paper.py (pandoc)
---

# JBM - PM

*Source page: `~jbm/pm/pm.html`*

[\[Ballistics\]](../ballistics/ballistics.html)

[\[Bibliography\]](../bibliography/bibliography.html)

[\[Downloads\]](../downloads/downloads.html)

[\[JBM\]](../index.html)

[\[Links\]](../links/links.html)

[\[MPM\]](../mpm/mpm.html)

[\[PM\]](../pm/pm.html)

[\[Personal\]](../personal/personal.html)

[\[Software\]](../software/software.html)

------------------------------------------------------------------------

# JBM - PM

PM is a Windows DLL designed for writing point mass small arms ballistics programs. PM is written in the C language and compiled with Borland C++.

*NOTE: This version is really a beta version. All functionality is included, all have been tested (by me) and no more functionality will be added, but there may be some bugs which I will fix as soon as I know about them (I don't currently know of any!) As I fix bugs, I'll note the [changes](pm_changes.html).*

Some of the functionality includes:

- Automatic unit conversion
- Multiple ballistic coefficients (linear interpolation)
- ICAO atmosphere routines
- Multiple drag functions or user defined CD vs Mach Number
- Muzzle velocity correction for distance to chronograph
- Variable sight height and offset
- Wind profiles (3D wind as a function of range)
- Output includes range, drop, windage, velocity, mach number, energy, momentum and time, corrected muzzle velocity and point blank range
- Drop and windage unit calculations including inches, feet, cm, MOA, mils, etc.

An example [program](text/example1.c) is provided that produces very simple [output](text/example1.txt). All the input values are "hard-wired" and this example is only designed to show some of the function calls. [Here](text/example1.dpr) is a Delphi (Object Pascal) console application that produces the same output as [example1.c](text/example1.c) using the [pm.pas](text/pm.pas) import unit.

If you're using something other than a C compiler, you will probably need to know that the DLL is compiled with all functions export with a prefixed underscore. A [.DEF](text/pm.def) shows the exported functions and ordinal numbers.

The DLL is downloadable [here](binary/pm_dll.zip). The Linux shared library is available [here](binary/pm-1.0.so.tgz). Documentation for the PM DLL is a group of HTML files, downloadable [here](binary/pm_doc.zip). Documentation is also [online](help/pm_contents.html).

The PM DLL is free for private and non-profit use. If you make money (in any way) from this DLL, you must purchase the source code. Please read the [license](help/pm_license.html).

If you would like to purchase the source, or have questions about it, contact [me](mailto:jbm@eskimo.com). You will be required to sign a license and non-disclosure agreement. An example of the source code is provided [here](text/interp.c). The file interp.c includes the interpolation routines used for wind and drag interpolation. The file [pm.h](text/pm.h) is the include file providing prototypes for all exported functions. After you purchase the source code, you may modify it, use all of it, parts of it for anything you see fit. You may NOT redistribute the source code in source/printed form.

------------------------------------------------------------------------

<span class="small">Last update 29 June 2004, Copyright © 1996-2004 [JBM](mailto:jbm@eskimo.com) [\[V\]](http://www.htmlhelp.com/cgi-bin/validate.cgi?url=referer&input=yes)</span>
