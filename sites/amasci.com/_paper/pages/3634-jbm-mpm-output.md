---
title: "JBM - MPM - Output"
source_domain: amasci.com
source_path: ~jbm/mpm/output.html
order: 3634
reachable_from_entry: false
images: 0
internal_links: 11
extracted: 2026-08-07T05:56:55Z
extractor: site_to_paper.py (pandoc)
---

# JBM - MPM - Output

*Source page: `~jbm/mpm/output.html`*

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

# JBM - MPM - Output

Program [output](text/mpm.txt) is divided into a number of sections:

### <span id="output_file_header">Output File Header</span>

The output file header provides the date and time the file was created, the name of the program, version and platform (either Linux or Windows) and the input files. The header is always produced.

### <span id="bullet_information">Bullet Information</span>

The bullet information section prints the input values for the selected bullet and any calculated single values (those not dependent on mach number). This includes all the dimensions, selected drag function, design twist, boundary layer, specific gravities, sectional density, moments of inertia, center of gravity and the nose radii ratio.

Bullet dimension units are dependent on the variable "bullet_units" in the bullet file. If this value is one, dimensions and the center of gravity position must be in inches. If it is zero, the dimensions must be in calibers.

For more information, see the explanations in the sample [bullet file](text/mpm.blt).

### <span id="coefficient_output">Coefficient Output</span>

The Coefficient Output section lists the calculated coefficients as a function of mach number. The listed coefficients are:

1.  Mach number
2.  CD, Drag coefficient
3.  Nose, portion of CD from nose drag
4.  Bttl, portion of CD from boattail drag
5.  Skin, portion of CD from skin friction
6.  Base, portion of CD from base drag
7.  Rbnd, portion of CD from rotating band
8.  Total, sum of components (= CD).
9.  CDa2, Drag coefficient, second derivative
10. BC, Ballistic coefficient for the input drag function.
11. FF, Form factor
12. Cla, Lift coefficient
13. Cma, Pitching moment coeffient
14. Clp, Spin damping moment coefficient
15. Cnpa, Magnus force coefficient
16. Cmpa, Magnus moment coefficient
17. Cmpa3, Magnus moment coefficient at 3 degrees
18. Cmpa5, Magnus moment coefficient at 5 degrees
19. Cpn, Location of center of pressure from nose, calibers

### <span id="stability_output">Stability Output</span>

This section lists the various stability values calculated. These values come from the program SPINNER. (I still don't claim to understand the importance of all of these!)

1.  Mach number
2.  Stab, gyroscopic stability factor at standard atmospheric conditions with the input "design twist".
3.  Sbar1, dynamic stability factor at yaw level of 1 degree
4.  Sbar5, dynamic stability factor at yaw level of 5 degrees
5.  Recp1, 1.0 / \[ Sbar1 \* ( 2.0 - Sbar1 ) \]
6.  Recp5, 1.0 / \[ Sbar5 \* ( 2.0 - Sbar5 ) \]
7.  W1, nutation frequency, \[pI<sub>x</sub>/2I<sub>y</sub>\]\*\[1 + sigma\]
8.  W2, nutation frequency, \[pI<sub>x</sub>/2I<sub>y</sub>\]\*\[1 - sigma\]
9.  A1, A2, B1, B2, quasi linear nutation precession damping factors, at 1 and 5 degrees.
10. Disp, radius in mils of a circle which a projectile will impact in a vertical plane when disturbed to a first maximum yaw angle of 5 degrees or less.

where sigma = (1 - 1/Stab)<sup>1/2</sup>

### <span id="trajectory_output">Trajectory Output</span>

The Trajectory Output section lists the input values for the trajectory and firearm. Corrected muzzle velocity is listed only if the variable "correct_velocity" is set. This section also lists the calculated atmospheric conditions and a list of all options.

The atmospheric conditions are calculated from the input conditions at the shooter's position. During calculation, these values are corrected for the bullet height.

### <span id="maximum_point_blank_range">Maximum Point Blank Range</span>

The Maximum Point Blank Range section lists the calculated maximum point blank range for the input vital zone radius. It also lists the required zero range to achieve this point blank range, the time to the maximum point blank range, and the velocity and energy at this point, and the range at maximum height. This section is only printed when the variable "point_blank_range" is set.

### <span id="target_hold">Target Hold</span>

The Target Hold section provides elevation and windage hold values to hit a moving target at the input range. This section lists all input values followed by the holds, and the impact ballistics. This section is only printed if the variable "target_hold" is set.

### <span id="trajectory_table">Trajectory Table</span>

The trajectory table lists the trajectory parameters as a function of range (either yards or meters, depending on input file). Due to width restrictions (I don't want 160 character lines...), it is now broken up into two tables. The first one has the normal trajectory values:

1.  Range, distance from shooter along the line of sight
2.  Wind, horizontal bullet position relative to the line of sight. Left of the line of sight is negative, right is positive.
3.  Drop, vertical bullet position relative to the line of sight.
4.  Vel, bullet velocity
5.  Mach, bullet mach number
6.  Energy, bullet energy in foot pounds
7.  Mom. bullet momentum
8.  Spin, rate of spin, in revolutions per minute
9.  Time, time to range, seconds
10. Stab, calculated stability -- should be greater than 1.5 for stability.

Windage and drop units depend on the value of the variable "drop_windage_units". This section is only printed if the "include_trajectory" variable is set in the input trajectory file.

A second part of this table has been recently added and includes the following values:

1.  Range, distance from shooter along the line of sight
2.  Bx, absolute X position of the bullet relative to the shooter's position.
3.  By, absolute Y position of the bullet relative to the shooter's position.
4.  Bz, absolute Z position of the bullet relative to the shooter's position.
5.  Wx, calculated wind in X direction
6.  Wy, calculated wind in Y direction
7.  Wz, calculated wind in Z direction
8.  G, magnitude of the gravity vector
9.  Error, a measure of the "truncation error" of the trajectory integration. It's NOT really the error -- we would have to know the exact answer to really know the error. Instead, it is the difference in the value between successive iterations.

------------------------------------------------------------------------

<span class="small">Last update 26 January 2005, Copyright © 1996-2005 [JBM](mailto:jbm@eskimo.com) [\[V\]](http://www.htmlhelp.com/cgi-bin/validate.cgi?url=referer&input=yes)</span>
