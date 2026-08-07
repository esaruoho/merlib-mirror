---
title: "JBM - Downloads"
source_domain: amasci.com
source_path: ~jbm/downloads/downloads.html
order: 3640
reachable_from_entry: false
images: 1
internal_links: 13
extracted: 2026-08-07T17:10:16Z
extractor: site_to_paper.py (pandoc)
---

# JBM - Downloads

*Source page: `~jbm/downloads/downloads.html`*

![JBM Small Arms Ballistics](/~jbm/graphics/title.png)

<a href="/~jbm/bibliography/bibliography.html" class="menu_link">Bibliography</a>

\|

<a href="/~jbm/calculations/calculations.html" class="menu_link">Calculations</a>

\|

<a href="/~jbm/downloads/downloads.html" class="menu_link">Downloads</a>

\|

<a href="/~jbm/faq/faq.html" class="menu_link">FAQ</a>

\|

<a href="/~jbm/index.html" class="menu_link">JBM</a>

\|

<a href="/~jbm/links/links.html" class="menu_link">Links</a>

\|

<a href="/~jbm/personal/personal.html" class="menu_link">Personal</a>

\|

<a href="/~jbm/software/software.html" class="menu_link">Software</a>

\|

<a href="/~jbm/topics/topics.html" class="menu_link">Topics</a>

A new topic, [Elevation](/~jbm/topics/elevation.html), has been added. It shows the differences in trajectories when zeroing at different atmospheric conditions and how to calculate a trajectory for different atmospheric conditions.

\

\
<span class="small">[about these ads...](/~jbm/ads/adsense_exp.html)</span>

<a href="../index.html" class="outline_link">JBM</a> - Downloads

Downloads of acquired information, ongoing work, etc. Feedback is appreciated. (Things that are readily available in print will not appear here -- I would like to keep this area for information not readily available...)

These programs were given to me by Robert L. McCoy and posted here with his knowledge. He worked at the US Army's Ballistics Research Lab for many years, where he wrote these programs as part of his work. I have made some changes to these programs (with Bob's knowledge) only as necessary to fix bugs. There are also some tabulated drag functions some of which Bob sent me and others from the Winchester text (see citation below).

[Drag Functions](text/olin.txt)\
Tabulated values of the G1, G5, G6, and GL drag (G) functions, taken from Exterior Ballistics of Small Arms Projectiles , E. D. Lowry, Research Dept., Winchester-Western Division, Olin Mathieson Chemical Corporation, May 4, 1965.

More Drag Functions\
Tabulated values of CD vs. Mach Number for the [G1](text/mcg1.txt), [G2](text/mcg2.txt), [G5](text/mcg5.txt), [G6](text/mcg6.txt), [G7](text/mcg7.txt), [G8](text/mcg8.txt), and [GI](text/mcgi.txt) (G) functions (e.g. CD of the standard G1 bullet, etc). Additionally, I have a list of CD vs. Mach Number for a 9/16" [sphere](text/mcgs.txt). I obtained these from BRL. Note that the mach numbers are not the same for all the tables. The first column is the mach number, the second column is the drag coefficient.

[IntLift](text/intlift.txt)\
A modified (modified by R. L. McCoy) version of M. A. Morris' RARDLIFT code with corrections for small arms bullets and medium caliber cannon projectiles. Provides interim estimates of lift, overturning moment and yaw drag coefficients. Inputs are very similar to McDrag (above) but it does require the center of gravity location.

[IntLift2](text/intlift2.txt)\
A modified version of INTLIFT.BAS that has some bug fixes. The original version was written to run on a Tandy1000. There were a few problems with floating point comparisons, etc. I believe that this version fixes those bugs.

[McDrag](text/mcdrag.txt)\
Calculates bullet CD versus mach number based on bullet dimensions. For more information on this particular program see "McDrag" - A Computer Program for Estimating the Drag Coefficients of Projectiles, Robert L. McCoy, Technical Report ARBRL-TR-02293, February 1981, \[ADA098110\].

[McGyro](text/mcgyro.txt)\
Stability program. Calculates required twist and bullet stability. This is not Greenhill's formula.

[McTraj](text/mctraj.txt)\
Trajectory calculation program using a second order Huene predictor corrector method, and a table of CD vs. Mach number to calculate point mass trajectories.

Other programs and items of interest, written by me.

[CGIs](binary/jbmcgi-2.1.tgz)\
This is a gzip'd tar distribution of the old versions of my online CGI programs released free under the [GNU](http://www.gnu.org) Public License (GPL). I've added a couple of bug fixes -- hence the new version, 2.1. I won't be fixing these anymore. NOTE: This is "C" source code for my online programs. They must be compiled and run through a webserver.\

\
<span class="small">[about these ads...](/~jbm/ads/adsense_exp.html)</span>

<span class="small"><a href="/~jbm" class="footer_link">JBM Small Arms Ballistics</a>. Last update 30 June 2007, Copyright © 1996-2007 <a href="mailto:jbm@eskimo.com" class="footer_link">JBM</a> <a href="http://www.htmlhelp.com/cgi-bin/validate.cgi?url=referer&amp;input=yes" class="footer_link">[V]</a></span>
