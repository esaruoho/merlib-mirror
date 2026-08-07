---
title: "JBM - Calculations"
source_domain: amasci.com
source_path: ~jbm/calculations/calculations.html
order: 3610
reachable_from_entry: false
images: 0
internal_links: 19
extracted: 2026-08-07T05:56:54Z
extractor: site_to_paper.py (pandoc)
---

# JBM - Calculations

*Source page: `~jbm/calculations/calculations.html`*

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

# JBM - Calculations

**NOTE: I will not guarantee these calculations for ANY purpose. Remember to use common sense at all times and to check loading with current manufacturer's data.**

There are now two different trajectory calculations. A "basic" one with few options and the original one with a few new options. Most notably, the ability to move the zero point.

[Ballistic Coefficients (Time)](bct/bct.html)\
Calculates the ballistic coefficient for a near velocity, time of flight, atmospheric conditions and drag function.

[Ballistic Coefficients (Velocity)](bcv/bcv.html)\
Calculates the ballistic coefficient for near and far velocities, atmospheric conditions and drag function.

[Bullet Drag and Twist](drag/drag.html)\
Calculates the bullet CD, and CD components, BC required twist and stability for input twist. Inputs required are the bullet measurements including nose length, total length, boattail length, meplat diameter, base diameter, caliber, weight, atmospheric conditions and drag function. This algorithm is based on the McDrag work done by Robert McCoy. See [bibliography](../bibliography/bibliography.html)

[Maximum Bullet Range](maxdist/maxdist.html)\
Calculates the maximum range and the elevation required to achieve this range. Also calculated is the absolute maximum height for the same bullet fired "straight up".

[Point Blank Range](pbrange/pbrange.html)\
Calculates maximum point blank range and maximum point blank range zero from ballistic coefficient, muzzle velocity, vital zone radius and atmospheric conditions.

[Sunrise/Sunset](sun/sun.html)\
Calculates Sunrise and Sunset time and length of the day for a given day of the year, time zone, latitude and longitude.

[Trajectories](traj/traj.html)\
from bullet BC and firearm info. Inputs include muzzle velocity, sight heights, chronograph distance, ballistic coefficient, drag function, line of sight and cant angles and atmospheric conditions. Output options include variable ranges and choice of units for windage and drop (inches, MOA, and mils). Calculations are performed assuming the bullet is a point mass. Elevation and azimuth are iteratively corrected to ensure a correct zero.

[Trajectories -- Basic](traj_basic/traj_basic.html)\
Not really "basic", but simpler. Many people don't use all the terms in the trajectory calculation page listed above, so this page invisibly sets defaults for variables like drag function (G1), sight offset, etc. The calculation is done with the same program as the trajectory page above.

------------------------------------------------------------------------

<span class="small">Last update 3 October 2004, Copyright © 1996-2004 [JBM](mailto:jbm@eskimo.com) [\[V\]](http://www.htmlhelp.com/cgi-bin/validate.cgi?url=referer&input=yes)</span>
