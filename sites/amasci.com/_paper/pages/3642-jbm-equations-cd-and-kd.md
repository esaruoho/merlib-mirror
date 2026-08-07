---
title: "JBM - Equations - CD and KD"
source_domain: amasci.com
source_path: ~jbm/equations/cdkd.html
order: 3642
reachable_from_entry: false
images: 0
internal_links: 11
extracted: 2026-08-07T17:10:16Z
extractor: site_to_paper.py (pandoc)
---

# JBM - Equations - CD and KD

*Source page: `~jbm/equations/cdkd.html`*

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

# JBM - Equations - CD and KD

This page attempts to explain the uses of the various quantities that I have used in ballistics calculations, such as KD, G functions, CD, etc. The equations here deal mainly with the acceleration of a bullet when treated as a point mass. [References](#REFERENCES) and a list of [variables](#VARIABLES) are at the bottom of this page.

## Drag Force and Acceleration

The force on the bullet due to drag, using K<sub>D</sub>, can be given as:

**F**<sub>D</sub> = M **a**<sub>D</sub> = -i K<sub>D</sub>(m) p d<sup>2</sup> \| **v** \| **v**

where K<sub>D</sub> is a function of mach number. In terms of K<sub>D</sub>, the G function can be written as

G(m) = K<sub>D</sub>(m) p<sub>0</sub> \| **v** \|

so that the drag force on the bullet may be written as

**F**<sub>D</sub> = M **a**<sub>D</sub> = -i p/p<sub>0</sub> G(m) d<sup>2</sup> **v**

Defining the ballistic coefficient, C, as

C = M/(i d<sup>2</sup>) = SD<sub>M</sub>/i

\[M is the mass, and not the weight -- to convert to the standard sectional density, multiply by g, the acceleration due to gravity\] we can rewrite the previous equation in terms of the bullet acceleration, G function and C

**a**<sub>D</sub> = -p/p<sub>0</sub> G(m)/C **v**

To find a trajectory, we have to sum all forces (and therefore all the accelerations) on the bullet and integrate the resulting equation. For point mass trajectories, the only other force we need to account for is due to gravity:

**a** = -p/p<sub>0</sub> G(m)/C **v** + **g**

This expression can be integrated from the muzzle to the target to obtain a three dimensional point mass trajectory.

## K<sub>D</sub> and C<sub>D</sub>

In terms of the newer ballistic nomenclature, C<sub>D</sub>, we may rewrite K<sub>D</sub> as

C<sub>D</sub> = 8/pi K<sub>D</sub>

so that the the equation for G is

G(m) = pi/8 C<sub>D</sub>(m) p<sub>0</sub> \| **v** \|

The acceleration of the bullet, due to drag, in terms of C<sub>D</sub> is

**a**<sub>D</sub> = -p pi/8 C<sub>D</sub>(m)/C \| **v** \| **v**

NOTE: that in the preceding equation, the C<sub>D</sub> is that of the "standard" bullet, for which K<sub>D</sub> was defined.

For the C<sub>D</sub> of the given bullet (as output in the Drag calculations, and McDrag program)

**a**<sub>D</sub> = -p s C<sub>D</sub>(m)/(2 M) \| **v** \| **v**

or plugging in for the cross sectional area (or reference area)

**a**<sub>D</sub> = -p pi d<sup>2</sup> C<sub>D</sub>(m)/(8 M) \| **v** \| **v**

and finally with the sectional density

**a**<sub>D</sub> = -p pi/8 C<sub>D</sub>(m)/SD<sub>M</sub> \| **v** \| **v**

## <span id="VARIABLES">Variables</span>

|  |  |  |  |
|----|----|----|----|
| **a** | total vector acceleration (d**u**/dt) | **a**<sub>D</sub> | vector acceleration due to drag |
| C | ballistic coefficient | C<sub>D</sub> | drag coefficient |
| d | bullet diameter | **F** | vector drag force |
| **g** | vector gravitational acceleration | G | "G" function |
| i | form factor | K<sub>D</sub> | drag coefficient |
| m | mach number | M | bullet mass |
| p | atmospheric density | p<sub>0</sub> | sea level atmospheric density |
| pi | 3.14159... | SD<sub>M</sub> | sectional density (with mass) |
| s | cross sectional area (pi d<sup>2</sup>/4) | **v** | vector velocity, \| **v** \| = (**vv**)<sup>1/2</sup> and **v** = **u** - **w** |
| **w** | vector wind velocity | **u** | velocity of bullet relative to ground |

## <span id="REFERENCES">References</span>

The Effect of Wind on Flat-Fire Trajectories, Robert L. McCoy, BRL Report Number 1900, Ballistic Research Laboratories, Aberdeen Proving Ground, Maryland, August 1976, \[ADB012872\]

Exterior Ballistics, McShane, Kelley and Reno, Univeristy of Denver Press, 1953.

Exterior Ballistics of Small Arms Projectiles, E. D. Lowry, Research Dept., Winchester-Western Division, Olin Mathieson Chemical Corporation, May 4, 1965.

Sierra Rifle Reloading Manual, 4th Edition, Sierra Bullets, L.P., 1995.

------------------------------------------------------------------------

<span class="small">Last update 3 October 2004, Copyright © 1996-2004 [JBM](mailto:jbm@eskimo.com) [\[V\]](http://www.htmlhelp.com/cgi-bin/validate.cgi?url=referer&input=yes)</span>
