---
title: "JBM - Ballistics - Equations - Crosswind"
source_domain: amasci.com
source_path: ~jbm/ballistics/crosswind.html
order: 3617
reachable_from_entry: false
images: 0
internal_links: 10
extracted: 2026-08-07T17:10:15Z
extractor: site_to_paper.py (pandoc)
---

# JBM - Ballistics - Equations - Crosswind

*Source page: `~jbm/ballistics/crosswind.html`*

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

# JBM - Ballistics - Equations - Crosswind

This derivation is taken from Bob McCoy's [paper](#REFERENCES), The Effect of Wind on Flat-Fire Trajectories. I've changed the coordinate system and elaborated a bit more in certain areas. A list of [variables](#VARIABLES) are at the bottom of this page. Where integrals are shown, I've put the integration limits in brackets beside the integral since trying to use the SUP and SUB tags doesn't work very well.

## Crosswind Derivation

From the [CD & KD](cdkd.html) discussion, the vector equations of motion are

d**u**/dt = -k v ( **u** - **w** ) + **g**

where

k = p s C<sub>D</sub> / (2 M)

If we assume that **g** is in the z direction only and the only wind is a cross wind (\|**w**\| = w<sub>x</sub>) then the first equation can be rewritten as three equations

du<sub>x</sub>/dt = -k v ( u<sub>x</sub> - w<sub>x</sub> )

du<sub>y</sub>/dt = -k v ( u<sub>y</sub> )

du<sub>z</sub>/dt = -k v ( u<sub>z</sub> ) + g<sub>z</sub>

The value v is defined as

v = \[(u<sub>x</sub> - w<sub>x</sub>)<sup>2</sup> + (u<sub>y</sub> - w<sub>y</sub>)<sup>2</sup> + (u<sub>z</sub> - w<sub>z</sub>)<sup>2</sup>\]<sup>1/2</sup>

This leads to non-linear equations that cannot be solved directly, but we can make a suitable approximation for v

S = ∫ v dt on the interval \[0,t\]

Then for the first and second equations above

du<sub>x</sub>/dS = -k ( u<sub>x</sub> - w<sub>x</sub> )

du<sub>y</sub>/dS = -k ( u<sub>y</sub> )

which can be solved:

u<sub>y</sub> = u<sub>y0</sub> e^(- ∫ k dS<sub>1</sub>) \[0,S\]

u<sub>x</sub> = e^(- ∫ k dS<sub>1</sub>) \[0,S\] ∫ w<sub>x</sub>k dS<sub>1</sub> \[0,S\] e^( ∫ k dS<sub>2</sub> \[0,S<sub>1</sub>\]

Since w<sub>x</sub> is constant, one can readily perform the integrals (assuming constant k)

u<sub>x</sub> = w<sub>x</sub> \[ 1 - u<sub>y</sub>/u<sub>x0</sub> \]

Integrate one more time with respect to t on the interval \[0,t\]

x = ∫ u<sub>x</sub> dt \[0,t\] = w<sub>x</sub> \[ t - R/u<sub>x0</sub> \]

where

R = ∫ u<sub>y</sub> dt \[0,t\]

and x is the deflection, u<sub>x0</sub> is the muzzle velocity (initial velocity in the y direction), R is the range, t is the time of flight to that range, and w<sub>x</sub> is the wind speed in the crosswind direction.

Assumptions made for this derivation include constant crosswind speed, constant C<sub>D</sub>, and the approximation that t is the time of flight along the arc of the trajectory (S) to range R. \[In reality t is the time of flight to range R for the wind in question -- which you don't know\]. For small angles (flat fire approximation) or less than 5°, these approximations are very good and can be less than 1%.

## <span id="VARIABLES">Variables</span>

|  |  |  |  |
|----|----|----|----|
| **a** | total vector acceleration, d**u**/dt | **a**<sub>D</sub> | vector acceleration due to drag |
| **g** | vector gravitational acceleration | M | bullet mass |
| p | atmospheric density | p<sub>0</sub> | sea level atmospheric density |
| s | cross sectional area (pi d<sup>2</sup>/4) | **v** | vector velocity, \| **v** \| = (**vv**)<sup>1/2</sup> and **v** = **u** - **w** |
| **w** | vector wind velocity | **u** | velocity of bullet relative to ground |
| C<sub>D</sub> | drag coefficient | S | distance along curved trajectory to range R |

## <span id="REFERENCES">References</span>

The Effect of Wind on Flat-Fire Trajectories, Robert L. McCoy, BRL Report Number 1900, Ballistic Research Laboratories, Aberdeen Proving Ground, Maryland, August 1976, \[ADB012872\]

------------------------------------------------------------------------

<span class="small">Last update 13 July 2004, Copyright © 1996-2004 [JBM](mailto:jbm@eskimo.com) [\[V\]](http://www.htmlhelp.com/cgi-bin/validate.cgi?url=referer&input=yes)</span>
