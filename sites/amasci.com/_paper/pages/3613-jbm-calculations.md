---
title: "JBM - Calculations"
source_domain: amasci.com
source_path: ~jbm/ballistics/calculations.html
order: 3613
reachable_from_entry: false
images: 1
internal_links: 19
extracted: 2026-08-07T17:10:15Z
extractor: site_to_paper.py (pandoc)
---

# JBM - Calculations

*Source page: `~jbm/ballistics/calculations.html`*

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

<a href="../index.html" class="outline_link">JBM</a> - Calculations

**NOTE: I will not guarantee these calculations for ANY purpose. Remember to use common sense at all times and to check loading with current manufacturer's data.**

If you think the functionality has changed, check the list of [changes](changes.html) because it probably has!

[Ballistic Coefficients (Time)](bct/bct.html)\
Calculates the ballistic coefficient for a near velocity, time of flight, atmospheric conditions and drag function.

[Ballistic Coefficients (Velocity)](bcv/bcv.html)\
Calculates the ballistic coefficient for near and far velocities, atmospheric conditions and drag function.

[Bullet Drag and Twist](drag/drag.html)\
Calculates the bullet CD, and CD components, BC required twist and stability for input twist. Inputs required are the bullet measurements including nose length, total length, boattail length, meplat diameter, base diameter, caliber, weight, atmospheric conditions and drag function. This algorithm is based on the McDrag work done by Robert McCoy. See [bibliography](../bibliography/bibliography.html)

[Drag Function Conversion](gf/gf.html)\
Converts a ballistic coefficient for one drag function to a ballistic coefficient for another drag function.

[Maximum Distance](maxdist/maxdist.html)\
Calculates the maximum range a bullet can travel given the muzzle velocity, ballistic coefficient, weight and atmospheric conditions.

[Modified Point Mass Trajectory](mpm/mpm.html)\
Calculates a trajectory from bullet dimensions. This type of trajectory provides a good estimate for things like spin drift and stability. I have also added coriolis effects. It has a considerable number of inputs, so beware. This online calculation replaces my previously available MPM program.

[Power Factor](pf/pf.html)\
Calculates the power factor and checks divisions for IDPA, IPSC, TSA and USPSA.

[Recoil](recoil/recoil.html)\
Calculates the free recoil energy and velocity using firearm weight, charge weight, bullet weight and firearm velocity.

[Trajectories](traj/traj.html)\
from bullet BC and firearm info. Inputs include muzzle velocity, sight heights, chronograph distance, ballistic coefficient, drag function, line of sight and cant angles and atmospheric conditions. Output options include variable ranges and choice of units for windage and drop (inches, MOA, and mils). Calculations are performed assuming the bullet is a point mass. Elevation and azimuth are iteratively corrected to ensure a correct zero.

[Trajectories -- Basic](traj_basic/traj_basic.html)\
Not really "basic", but simpler. Many people don't use all the terms in the trajectory calculation page listed above, so this page invisibly sets defaults for variables like drag function (G1), sight offset, etc. The calculation is done with the same program as the trajectory page above.

[Trajectory Cards](traj_card/traj_card.html)\
Very similar to the other trajectory programs on input, but the output is currently limited to range, drop and windage (if you have suggestions email [me](mailto:jbm@eskimo.com)) suitable for printing on a 3"x5" card.

\
<span class="small">[about these ads...](/~jbm/ads/adsense_exp.html)</span>

<span class="small"><a href="/~jbm" class="footer_link">JBM Small Arms Ballistics</a>. Last update 30 June 2007, Copyright © 1996-2007 <a href="mailto:jbm@eskimo.com" class="footer_link">JBM</a> <a href="http://www.htmlhelp.com/cgi-bin/validate.cgi?url=referer&amp;input=yes" class="footer_link">[V]</a></span>
