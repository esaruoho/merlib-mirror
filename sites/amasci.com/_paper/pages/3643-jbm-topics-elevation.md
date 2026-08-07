---
title: "JBM - Topics - Elevation"
source_domain: amasci.com
source_path: ~jbm/topics/elevation.html
order: 3643
reachable_from_entry: false
images: 1
internal_links: 16
extracted: 2026-08-07T05:56:56Z
extractor: site_to_paper.py (pandoc)
---

# JBM - Topics - Elevation

*Source page: `~jbm/topics/elevation.html`*

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

<a href="../index.html" class="outline_link">JBM</a> - <a href="./topics.html" class="outline_link">Topics</a> - Elevation

This example shows how to find a bullet's trajectory at atmospheric conditions different from the zero conditions. For this example, it is assumed that the shooter is zeroing at some atmospheric conditions and then hunting at different atmospheric conditions. The idea is to find the elevation angle for zero conditions and apply this angle to the hunting conditions. For this example, the [standard (not Basic) trajectory](/~jbm/calculations/traj/traj.html) calculation is used. This is required because the [basic trajectory](/~jbm/calculations/traj_basic/traj_basic.html) does not have an elevation angle input.

### Conditions at Zero Range

The first calculation finds the values of interest at the zero conditions. For this example, assume that the shooting conditions are as follows:

Ballistic Coefficient:

0.5

Bullet Weight:

220 grains

Caliber:

0.308

Muzzle Velocity:

2600 f/s

Sight Height:

1.5 in

LOS Angle:

0 deg

Cant Angle:

0 deg

Wind Speed:

10.0 mph

Target Speed:

10.0 mph

Minimum Range:

0

Maximum Range:

1000 yd

Range Increment:

50 yd

Zero Range:

200 yd

Temperature:

80°F

Pressure:

29.92 in Hg

Relative Humidity:

30%

Additionally, only the boxes "Corrected Pressure", "Elevation Correction for Zero Range" and "Drop and Windage Relative to Target" are checked. These atmospheric conditions are typical Fall conditions in Southern New Mexico. All other values are the default.

This gives the following trajectory:

Range

Drop

Drop

Windage

Windage

Velocity

Mach

Energy

Time

Lead

Lead

(yds)

(in)

(moa)

(in)

(moa)

(ft/s)

(none)

(ft·lbs)

\(s\)

(in)

(moa)

0

-1.5

\*\*\*

0.0

\*\*\*

2600.0

2.283

3301.7

0.000

0.0

\*\*\*

100

2.2

2.1

0.7

0.7

2429.0

2.133

2881.7

0.119

21.0

20.1

200

-0.0

-0.0

2.9

1.4

2264.5

1.988

2504.6

0.247

43.5

20.8

300

-9.0

-2.9

6.8

2.2

2106.3

1.849

2166.8

0.385

67.7

21.5

400

-25.8

-6.2

12.5

3.0

1954.7

1.716

1866.2

0.533

93.7

22.4

500

-51.8

-9.9

20.3

3.9

1810.3

1.590

1600.7

0.692

121.8

23.3

600

-88.4

-14.1

30.3

4.8

1673.9

1.470

1368.4

0.864

152.1

24.2

700

-137.4

-18.7

42.8

5.8

1546.4

1.358

1168.0

1.051

185.0

25.2

800

-201.0

-24.0

58.0

6.9

1429.2

1.255

997.6

1.253

220.5

26.3

900

-281.6

-29.9

76.1

8.1

1323.9

1.162

856.0

1.471

258.9

27.5

1000

-382.1

-36.5

97.2

9.3

1232.1

1.082

741.4

1.706

300.3

28.7

Additionally, the calculated elevation is 6.10 MOA. This calculated value is shown above the trajectory table in the output of the calculation. This is the important part. The elevation is the angle between the line of sight (the axis of the sights/scope) and the barrel. This does not change so long as the sights are not adjusted.

### Hunting Conditions

For the hunting trajectory assume that we are going hunting later in the year in much colder conditions (changed values are in red):

Ballistic Coefficient:

0.5

Bullet Weight:

220 grains

Caliber:

0.308

Muzzle Velocity:

2500 f/s

Sight Height:

1.5 in

LOS Angle:

0 deg

Cant Angle:

0 deg

Wind Speed:

10.0 mph

Target Speed:

10.0 mph

Minimum Range:

0

Maximum Range:

1000 yd

Range Increment:

50 yd

Zero Range:

200 yd

Temperature:

0°F

Pressure:

29.92 in Hg

Relative Humidity:

30%

With the same 6.10 MOA elevation angle. The difference is that for the hunting trajectory, we are going to input this elevation angle and not have the calculation find a new elevation angle for us, so uncheck "Elevation Correction for Zero Range". The difference in muzzle velocity is due to the change in powder temperature (and could be greater than this).

The calculated trajectory for these new atmospheric conditions with the rifle zeroed at the old atmospheric conditions is then:

Range

Drop

Drop

Windage

Windage

Velocity

Mach

Energy

Time

Lead

Lead

(yds)

(in)

(moa)

(in)

(moa)

(ft/s)

(none)

(ft·lbs)

\(s\)

(in)

(moa)

0

-1.5

\*\*\*

0.0

\*\*\*

2506.5

2.385

3068.4

0.000

0.0

\*\*\*

100

2.0

1.9

0.8

0.8

2316.4

2.204

2620.8

0.125

21.9

20.9

200

-1.0

-0.5

3.5

1.7

2134.8

2.031

2225.9

0.259

45.7

21.8

300

-11.7

-3.7

8.3

2.6

1961.3

1.866

1878.7

0.406

71.5

22.7

400

-31.4

-7.5

15.3

3.7

1796.2

1.709

1575.8

0.566

99.6

23.8

500

-62.0

-11.8

25.0

4.8

1640.4

1.561

1314.2

0.741

130.4

24.9

600

-105.5

-16.8

37.7

6.0

1495.0

1.422

1091.6

0.932

164.1

26.1

700

-164.5

-22.4

53.7

7.3

1361.8

1.296

905.8

1.143

201.1

27.4

800

-242.4

-28.9

73.2

8.7

1243.0

1.183

754.6

1.373

241.7

28.9

900

-342.8

-36.4

96.5

10.2

1141.0

1.086

635.9

1.626

286.1

30.4

1000

-470.0

-44.9

123.6

11.8

1058.3

1.007

547.0

1.899

334.3

31.9

For most people and most hunting scenarios, this example shows that we don't have to worry about the change in atmospheric conditions. The second trajectory is no more than 2.7" different from the zero trajectory from 0 to 300 yards.

The longer ranges though, the trajectories do not line up so well and an error is introduced. The following table shows the *differences* in the trajectories and shows that we would be shooting low at farther ranges.

Range

Drop

Drop

Windage

Windage

(yds)

(in)

(moa)

(in)

(moa)

0

0.0

0.0

0.0

0.0

100

-0.2

-0.2

0.1

0.1

200

-1.0

-0.5

0.6

0.3

300

-2.7

-0.8

1.5

0.4

400

-5.6

-1.3

2.8

0.7

500

-10.2

-1.9

4.7

0.9

600

-17.1

-2.7

7.4

1.2

700

-27.1

-3.7

10.9

1.5

800

-41.4

-4.9

15.2

1.8

900

-61.2

-6.5

20.4

2.1

1000

-87.9

-8.4

26.4

2.5

A common mistake is to use the hunting conditions to calculate a new trajectory, but not input the elevation angle for the zero conditions or an adjusted muzzle velocity. This yields a trajectory with the following values (use the hunting conditions with 2600 f/s muzzle velocity and check "Elevation Correction for Zero Range"):

Range

Drop

Drop

Windage

Windage

Velocity

Mach

Energy

Time

Lead

Lead

(yds)

(in)

(moa)

(in)

(moa)

(ft/s)

(none)

(ft·lbs)

\(s\)

(in)

(moa)

0

-1.5

\*\*\*

0.0

\*\*\*

2606.6

2.480

3318.6

0.000

0.0

\*\*\*

100

2.2

2.1

0.8

0.8

2412.1

2.295

2841.6

0.120

21.1

20.1

200

-0.0

-0.0

3.3

1.6

2226.2

2.118

2420.6

0.249

43.8

20.9

300

-9.3

-3.0

7.8

2.5

2048.6

1.949

2049.7

0.390

68.6

21.8

400

-26.9

-6.4

14.5

3.5

1879.1

1.788

1724.6

0.543

95.5

22.8

500

-54.3

-10.4

23.6

4.5

1718.5

1.635

1442.4

0.709

124.9

23.8

600

-93.6

-14.9

35.5

5.7

1567.6

1.491

1200.2

0.892

157.0

25.0

700

-147.0

-20.1

50.6

6.9

1428.0

1.359

995.9

1.093

192.4

26.2

800

-217.5

-26.0

69.1

8.2

1301.5

1.238

827.4

1.313

231.1

27.6

900

-308.6

-32.7

91.3

9.7

1190.7

1.133

692.4

1.554

273.6

29.0

1000

-424.3

-40.5

117.3

11.2

1097.9

1.045

588.8

1.817

319.8

30.5

The *differences* between this trajectory and the hunting trajectory just above are shown below:

Range

Drop

Drop

Windage

Windage

(yds)

(in)

(moa)

(in)

(moa)

0

0.0

0.0

0.0

0.0

100

0.2

0.2

0.0

0.0

200

1.0

0.5

-0.2

-0.1

300

2.4

0.7

-0.5

-0.1

400

4.5

1.1

-0.8

-0.2

500

7.7

1.4

-1.4

-0.3

600

11.9

1.9

-2.2

-0.3

700

17.5

2.3

-3.1

-0.4

800

24.9

2.9

-4.1

-0.5

900

34.2

3.7

-5.2

-0.5

1000

45.7

4.4

-6.3

-0.6

Again, for short ranges, it probably won't make any difference. For longer ranges, we would be shooting low. For example, at 500 yards, we would use a holdover of 10.4 moa, but the actual (from the hunting trajectory) holdover is 11.8 moa which would give us an error of 7.7 inches low, because we didn't holdover high enough.

The errors introduced by zeroing at different atmospheric conditions can be minimized by zeroing in conditions that are as close as possible to the shooting conditions. If this is not possible, the elevation angle should be used from the zero conditions to accurately calculate a trajectory at the hunting conditions.

This example focuses primarily on the influence of the change in elevation angle, but one should remember that the muzzle velocity was changed which can have a large affect also.

\
<span class="small">[about these ads...](/~jbm/ads/adsense_exp.html)</span>

<span class="small"><a href="/~jbm" class="footer_link">JBM Small Arms Ballistics</a>. Last update 30 June 2007, Copyright © 1996-2007 <a href="mailto:jbm@eskimo.com" class="footer_link">JBM</a> <a href="http://www.htmlhelp.com/cgi-bin/validate.cgi?url=referer&amp;input=yes" class="footer_link">[V]</a></span>
