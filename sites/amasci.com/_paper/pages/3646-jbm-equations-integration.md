---
title: "JBM - Equations - Integration"
source_domain: amasci.com
source_path: ~jbm/equations/integrate.html
order: 3646
reachable_from_entry: false
images: 0
internal_links: 12
extracted: 2026-08-07T17:10:17Z
extractor: site_to_paper.py (pandoc)
---

# JBM - Equations - Integration

*Source page: `~jbm/equations/integrate.html`*

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

# JBM - Equations - Integration

A number of people have asked how to integrate the equations of motion with and still find the parameters of the trajectory at even yards (or meters). The trick is to change the variable of integration to a range variable instead of time. A list of [variables](#VARIABLES) are at the bottom of this page.

## Changing Variables of Integration

From the discussion on [CD and KD](cdkd.html), we know that the acceleration of the bullet is

**a** = - k **v** + **g**

where

k = = p/p<sub>0</sub> G(m)/C

Rewrite the acceleration as a derivative

**a** = d **u** / dt = - k( **u** - **w**) + **g**

Define a coordinate system where y is the range variable, x and z are perpendicular to the trajectory where x is to the shooters right and z is up. Then rewrite the derivative d **u** / dt

**a** = d **u** / dt = (d **u** / dy) (dy/dt) = - k (**u** - **w**)+ **g**

But dy/dt is just the velocity in the y direction (down range) written u <sub>y</sub>, then

d **u** / dy = - \[ k (**u** - **w**)+ **g** \]/ u <sub>y</sub>

This equation now provides the vector acceleration of the bullet as a function of range. Numerical integration in yard or meter increments provides a convenient method for finding trajectory parameters at even increments.

## <span id="VARIABLES">Variables</span>

|  |  |  |  |
|----|----|----|----|
| **a** | total vector acceleration (d**u**/dt) | v<sub>y</sub> | Velocity in the y direction (down range) |
| C | ballistic coefficient | C<sub>D</sub> | drag coefficient |
| **g** | vector gravitational acceleration | G | "G" function |
| m | mach number | **v** | vector velocity, \| **v** \| = (**vv**)<sup>1/2</sup> and **v** = **u** - **w** |
| p | atmospheric density | p<sub>0</sub> | sea level atmospheric density |
| **w** | vector wind velocity | **u** | velocity of bullet relative to ground |

------------------------------------------------------------------------

<span class="small">Last update 3 October 2004, Copyright © 1996-2004 [JBM](mailto:jbm@eskimo.com) [\[V\]](http://www.htmlhelp.com/cgi-bin/validate.cgi?url=referer&input=yes)</span>
