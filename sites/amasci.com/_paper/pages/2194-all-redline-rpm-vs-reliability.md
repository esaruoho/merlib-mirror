---
title: "all_redline_rpm_vs_reliability"
source_domain: amasci.com
source_path: ~dalus/bmw/all/engine/all_redline_rpm_vs_reliability.html
order: 2194
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T05:55:50Z
extractor: site_to_paper.py (pandoc)
---

# all_redline_rpm_vs_reliability

*Source page: `~dalus/bmw/all/engine/all_redline_rpm_vs_reliability.html`*

[UnofficialBMW.com](http://www.unofficialbmw.com)

\[an error occurred while processing this directive\]

------------------------------------------------------------------------

Date: Fri, 12 Jan 1996 09:43:23 -0500\
**[From: read@engr05.comsys.rockwell.com (Pete Read)](mailto:read@engr05.comsys.rockwell.com%20(Pete%20Read))**\
To: jrallen@halcyon.com\
**[Subject: Redline RPM versus Reliability](mailto:read@engr05.comsys.rockwell.com%20(Pete%20Read)?SUBJECT=Redline%20RPM%20versus%20Reliability)**\

John Allen commented on the higher redline and longer stroke of the '91-'93 M5 engine:

\>It's interesting that the longer-stroke motor (S38B36) also\
\>has the higher redline. Any thoughts?

John,

Yes, I can give you some "rules of thumb" about engine reliability versus rpm. I happened to research this some during the past week, so your question is timely.

The Metric Mechanic (MM) Catalog got me started with its section on engine rpm versus life. Basically, high rpm operation wears out engines faster, but there's more to it than that. MM also mentions the critical top piston ring area.

This sounded very familiar -- so familiar that I searched my attic for Gordon Jenning's "Two Stroke Tuner's Handbook". Now, M5s have four stroke engines, but the basics of pistons and rings are the same for either. <span id="null"></span>

# Mean Piston Speed

The best known "rule of thumb" is mean piston speed (average speed the piston travels at a fixed rpm). It goes like this:

      Mean Piston Speed      Result 
      ------------------     ------ 
      Under 3,500 ft/min     Good reliability 
      3,500-4,000 ft/min     Stressful, needs good design 
      Over  4,000 ft/min     Very short life 

Mean piston speed is easy to determine. It's based on the piston stroke and rpm.

Cm = 0.167 x L x N

Cm = mean piston speed in feet per min L = stroke in inches\
N = crankshaft speed in rpm

Using the 1988 E28 M5 as an example:\
E28 M5, Bore and stroke 3.68 x 3.31 in (93.4 x 84 mm) At 6,900 rpm (factory redline)

Cm = 0.167 x 3.31 x 6900 = 3,814 ft/min

At 7,200 rpm (Dinan chip redline) = 3,980 ft/min At 6,500 rpm (max constant speed) = 3,593 ft/min

Here are some other piston speeds I figured for comparison.

                 Redline   Stroke     Piston Speed 
      Engine      (rpm)    in,mm       (ft/min) 
      --------   -------  --------    ------------ 
      BMW 2002   6,400    3.15, 80      3,367  
      BMW 318i   6,500    3.19, 81      3,463 
      BMW 325i   6,500    2.95, 75      3,202 
      BMW 3.0    6,400    3.15, 80      3,367  
      BMW 535i   6,200    3.39, 86      3,510 
     
      MM 4000    6,000    3.70, 94      3,707  
      MM 3500    6,400    3.39, 86      3,623 

**BMW E36 M3 6,800 3.38, 85.8 3,838**

      BMW E28 M5 6,900    3.31, 84      3,814 
      BMW E34 M5 7,200    3.39, 86      4,076 

CBR600 13,250 1.78, 45.2 3,939 (motorcycle)

Notice that most production cars stay below 3,500 ft/min, while the E36 M3 has the same 3,800 ft/min piston speed as the E28 M5. With its longer stroke, the E34 M5 piston speed is even higher than the screaming Honda CBR600 motorcycle! The two Metric Mechanic (MM) engines also go above 3,500 ft/min.

\>From the MM Catalog Engine Specification table, MM uses\
thinner (lighter) 1.5 mm (0.059 in) top rings than the standard BMW 1.75 mm (0.069 in) top rings. Lighter weight reduces vertical ring acceleration force at high rpm. MM talks about less "hammering" of the ring groove from the lighter ring, but it also reduces piston and ring overheating. <span id="null"></span>

# How Piston Rings Work

Most people know that piston rings provide a seal for upper cylinder gas pressure. Have you ever thought about how the relatively light ring spring tension (about 30 psi) keeps the high gas pressures (about 750 psi max) from rushing past the piston.

Rings don't seal just by their spring properties. Gas pressure above the ring forces it down against the bottom of its groove in the piston. The gas pressure also gets behind the ring, in the back of its groove, and forces it out against the cylinder wall. Normally this works well.

However, when piston ring acceleration exceeds the gas pressure holding it in place, the ring lifts upward in its groove (piston nears top of stroke and is being slowed to a halt at TDC). As the ring lifts, gas pressure releases above and behind the ring, causing the ring to hit up against the top of its groove. When the pressure behind the ring is released, high temperature and pressure combustion gases escape down the side of the cylinder wall causing piston and ring overheating. This hammering of the ring groove and overheating shortens engine life.

Here's a picture of how it works.

1.  Normal Condition

    Gas pressure in the upper cylinder holds the ring down against the bottom of its groove and out against the cylinder wall, forming a seal.

<!-- -->

            Gas Pressure     
                  : 
                  :      
               \| :  
               \| v 
               \| :|----------------------------| 
               \| v|                            . 
               \| :|             Left           .   Right  
               \| v|-------   Cross-section     .  Side of 
               \| :.v.... |     of Piston       .  Piston 
               \|[[[]] <: |\                    .  (not shown) 
               \|  |-\----- \                   .  
               \|  |  \       Ring Groove       .   
     Cylinder  \|  |   \                        . 
       Wall    \|  |     Piston Ring            . 
               \|  |                            . 
               \|  |                            . 
               \|  |                            . 
               \|  |----------------------------. 
               \|   
                     \|   

2\. Too Much Piston Acceleration

Piston acceleration lifts the ring, shutting off pressure behind the ring and breaking the seal. The ring groove is damaged by constant mechanical pounding. Hot

       combustion g           \|v |  \       Ring Groove       .   
     Cylinder  \|  |   \                        . 

Wall \\ \| rings.

How much piston acceleration is too much for a piston ring? Well, first figure piston acceleration, and then use another "rule of thumb" for ring thickness versus piston acceleration.

The ma A = ratio of rod length, between centers, to stroke

For example, the E28 M5:

L = 3.31 inch stroke\
A = 2 (estimated) rod length/stroke\
N = 6,900 rpm redline

Gmax = 6900^2 x 3.31/2189 x (1 + (1/2x2))= 89,989 ft/sec^2

Now use the following "rule of thumb" table from the "Two Stroke Tuner's Handbook" and interpolate to find the ring thickness for the M5's 90,000 ft/sec^2 piston acceleration.

Max Piston\
Ring Thickness Acceleration\
(inch) (ft/sec^2)

------------------------------------------------------------------------

         0.125            40,000  
         0.094            53,000 
         0.063            80,000 
         0.047           106,000 
         0.039           138,000 

The E28 M5 "rule of thumb" ring thickness works out to 0.057 inches. After figuring this, I hoped the actual rings were at least as thin as\
I quickly measured the M5 piston (with no rings) on my desk. Using a feeler gauge, the top ring groove measured 0.061 inch. Ring groove clearance is usually about 0.002 inch, so the M5 ring must be 0.059 inchspeed and acceleration calculations and ring thickness, M5 engine design allows reasonable reliability under high engine revs, but the word "understressed" doesn't come to mind.

My suggestion is be most careful about sustained high (redline) rprecommended redline (6,900 versus Dinan 7,200 rpm). Even shifting at 7,200 rpm won't cause any immediate consequences, but over time it causes extra wear.

M-engines are pretty rugged. Just don't expect miracles if you run hard all the time.

Regards,

Pete Read\
88 M5
