---
title: "JBM - Equations - Energy"
source_domain: amasci.com
source_path: ~jbm/equations/energy.html
order: 3621
reachable_from_entry: false
images: 0
internal_links: 11
extracted: 2026-08-07T05:56:55Z
extractor: site_to_paper.py (pandoc)
---

# JBM - Equations - Energy

*Source page: `~jbm/equations/energy.html`*

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

# JBM - Equations - Energy

Questions about energy come up on USENET (specifically rec.guns) often enough that I thought it might be worth putting a page here in an attempt to explain how the energy is calculated used. [References](#REFERENCES) and a list of [variables](#VARIABLES) are at the bottom of this page. I haven't put in the derivations of the equations, but they are presented in the references listed below.

## Definitions

Energy is defined as the ability to do work. The more energy something has, the more work it can do. Within the guise of small arms, the work done by the bullet includes the work done on the air in traveling through it (that's why a bullet loses energy as it travels down range) and the work done on the target (deformation, sound, etc).

Within in kinematics, energy is divided into two parts, kinetic and potential. Potential energy is generally defined by position within a potential, e.g. height in a gravitational field, but also includes systems like compressed springs, etc. Kinetic energy is that energy associated with the motion of an object.

## Potential Energy

The potential energy of a bullet is represented by the following equation:

PE = M g h

where h is the height above the point of zero potential energy, usually the "ground". For a bullet weight of 300 grains, 6 feet above the ground, the potential energy can be found using the next two equations.

The mass of the bullet is calculated using the following equation which converts the bullet weight in grains to pounds (the factor of 7000) and divides by the acceleration due to gravity to find the mass:

M = w/g = (300 gr)/\[7000 gr/lb 32.2 ft/sec<sup>2</sup>\] = 0.00133 lb sec<sup>2</sup>/ft

Then potential energy is...

PE = \[0.00133 lb sec<sup>2</sup>/ft\] \* \[32.2 ft/sec<sup>2</sup>\] \* \[6 ft\] = 0.26 ft-lbs

...not much. This is why potential energy is always neglected in small arms calculations. The bullet mass is the weight divided by the acceleration due to gravity and a conversion from grains to pounds.

## Kinetic Energy

Kinetic energy is a function of the bullet mass and motion. This motion involves the velocity and rotations. It is represented by the following equation.

KE = 1/2 M v<sup>2</sup> + 1/2 I w<sup>2</sup>

NOTE: this assumes a single rotational axis and forward motion of the bullet. For multiple rotations and non-symmetric bodies, things get a little more complicated. For most bullets, the contribution of the rotational kinetic energy is on the order of a few foot pounds and is neglected, leaving the following equation for energy of the bullet:

KE = 1/2 M v<sup>2</sup>

where the mass is calculated as above.

So for the same 300 grain bullet, traveling at 3000 ft/sec, the energy (neglecting potential and rotational kinetic energy) is:

KE = 1/2 M v<sup>2</sup> = \[0.5\] \[0.00133 lb sec<sup>2</sup>/ft\] \[3000 ft/sec\]<sup>2</sup> = 5985 ft lbs

If we assume units of grains for the bullet weight and feet/sec for the speed, we can combine the constants to get a simplified equation:

KE = M v<sup>2</sup>/450800

where

450800 = 2 \* 7000 \* 32.2

## <span id="VARIABLES">Variables</span>

|     |                                       |     |                |
|-----|---------------------------------------|-----|----------------|
| PE  | potential energy                      | KE  | kinetic energy |
| g   | vector gravitational acceleration     | M   | bullet mass    |
| h   | bullet height                         | v   | bullet speed   |
| I   | moment of inertia about rotation axis | w   | rotation speed |

## <span id="REFERENCES">References</span>

Classical Mechanics A Modern Perspective, V. Barger, Ph.D. and M. Olsson, Ph.D., McGraw-Hill Book Company, 1973.

------------------------------------------------------------------------

<span class="small">Last update 3 October 2004, Copyright © 1996-2004 [JBM](mailto:jbm@eskimo.com) [\[V\]](http://www.htmlhelp.com/cgi-bin/validate.cgi?url=referer&input=yes)</span>
