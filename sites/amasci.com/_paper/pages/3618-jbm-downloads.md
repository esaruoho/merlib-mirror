---
title: "JBM - Downloads"
source_domain: amasci.com
source_path: ~jbm/downloads/downloads_body.html
order: 3618
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T05:56:55Z
extractor: site_to_paper.py (pandoc)
---

# JBM - Downloads

*Source page: `~jbm/downloads/downloads_body.html`*

# JBM - Downloads

Downloads of acquired information, ongoing work, etc. Feedback is appreciated. (Things that are readily available in print will not appear here -- I would like to keep this area for information not readily available...)

These programs were given to my by Robert L. McCoy and posted here with his knowledge. He worked at the US Army's Ballistics Research Lab for many years, where he wrote these programs as part of his work. I have made some changes to these programs (with Bob's knowledge) only as necessary to fix bugs. There are also some tabulated drag functions some of which Bob sent me and others from the Winchester text (see citation below).

For those of you that don't know, Bob was working on a Ballistics book before he died. The publisher is <a href="http://www.schifferbooks.com" target="_top">Schiffer Publishing</a>, Ltd., 77 Lower Valley Road, Atglen, PA 19310. (610) 593-1777. It is now available and costs \$95.00.

<a href="text/olin.txt" target="_top"><strong>Drag Functions</strong></a>\
Tabulated values of the G1, G5, G6, and GL drag (G) functions, taken from Exterior Ballistics of Small Arms Projectiles , E. D. Lowry, Research Dept., Winchester-Western Division, Olin Mathieson Chemical Corporation, May 4, 1965.

**More Drag Functions**\
Tabulated values of CD vs. Mach Number for the <a href="text/mcg1.txt" target="_top">G1</a>, <a href="text/mcg2.txt" target="_top">G2</a>, <a href="text/mcg5.txt" target="_top">G5</a>, <a href="text/mcg6.txt" target="_top">G6</a>, <a href="text/mcg7.txt" target="_top">G7</a>, <a href="text/mcg8.txt" target="_top">G8</a>, and <a href="text/mcgi.txt" target="_top">GI</a> (G) functions (e.g. CD of the standard G1 bullet, etc). Additionally, I have a list of CD vs. Mach Number for a 9/16" <a href="text/mcgs.txt" target="_top">sphere</a>. I obtained these from BRL. Note that the mach numbers are not the same for all the tables. The first column is the mach number, the second column is the drag coefficient.

<a href="text/intlift.txt" target="_top"><strong>IntLift</strong></a>\
A modified (modified by R. L. McCoy) version of M. A. Morris' RARDLIFT code with corrections for small arms bullets and medium caliber cannon projectiles. Provides interim estimates of lift, overturning moment and yaw drag coefficients. Inputs are very similar to McDrag (above) but it does require the center of gravity location.

<a href="text/intlift2.txt" target="_top"><strong>IntLift2</strong></a>\
A modified version of INTLIFT.BAS that has some bug fixes. The original version was written to run on a Tandy1000. There were a few problems with floating point comparisons, etc. I believe that this version fixes those bugs.

<a href="text/mcdrag.txt" target="_top"><strong>McDrag</strong></a>\
Calculates bullet CD versus mach number based on bullet dimensions. For more information on this particular program see "McDrag" - A Computer Program for Estimating the Drag Coefficients of Projectiles, Robert L. McCoy, Technical Report ARBRL-TR-02293, February 1981, \[ADA098110\].

<a href="text/mcgyro.txt" target="_top"><strong>McGyro</strong></a>\
Stability program. Calculates required twist and bullet stability. This is not Greenhill's formula.

<a href="text/mctraj.txt" target="_top"><strong>McTraj</strong></a>\
Trajectory calculation program using a second order Huene predictor corrector method, and a table of CD vs. Mach number to calculate point mass trajectories.

Other programs and items of interest, written by me.

<a href="../mpm/mpm.html" target="_top"><strong>MPM</strong></a>\
My modified point mass program. This link is actually to the MPM pages, but follow the download links and you'll find the files.

<a href="binary/jbmcgi-2.0.tgz" target="_top"><strong>CGIs</strong></a>\
This is a gzip'd tar distribution of my online CGI programs released free under the [GNU](http://www.gnu.org) Public License (GPL).\
