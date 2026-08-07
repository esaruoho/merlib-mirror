---
title: "JBM - Ballistics - FAQ"
source_domain: amasci.com
source_path: ~jbm/faq/faq.html
order: 3626
reachable_from_entry: false
images: 1
internal_links: 17
extracted: 2026-08-07T05:56:55Z
extractor: site_to_paper.py (pandoc)
---

# JBM - Ballistics - FAQ

*Source page: `~jbm/faq/faq.html`*

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

<a href="../index.html" class="outline_link">JBM</a> - FAQ

### Topics

[Why can't I calculate BC from bullet drop at different ranges?](#001)

[Why doesn't the air density change when I change the altitude?](#002)

[Where can I get the formula for these programs?](#003)

[Can I change the drag function to a better one for my bullet?](#004)

[How is the energy calculated?](#005)

[Have I found a bug?](#006)

[What are the programs written in?](#008)

[Can I have a copy of your programs?](#009)

[Where can I get an explanation of the terms used in your calculations?](#010)

[Why are my input numbers different in the output?](#011)

[How important is the measurement of sight height and offset?](#012)

**(Q)** *<span id="001">Why can't I calculate BC from bullet drop at different ranges?</span>*\
**(A)** You can, but not very accurately. If you look at the bullet drop for two bullets, one with a BC of 0.5 and the other with a BC of 0.55, you'll find that the bullet drops at 300 yards with a muzzle velocity of 3000 f/s and a 100 yard zero, are -10.9" and -10.7" respectively. So if you can shoot groups less than 0.2" at 300 yards, have at it. Of course you'll still only know the BC within about 10% (the BC calculation CGI can be as accurate as 2%!).

**(Q)** *<span id="002">Why doesn't the air density change when I change the altitude?</span>*\
**(A)** The altitude is only used when you check "Standard conditions at Altitude". If this is not checked, the density is calculated from the Temperature, Pressure and Humidity you entered.

**(Q)** *<span id="003">Where can I get the formula for these programs?</span>*\
**(A)** The source code to my old CGI programs is now available under the GNU public license -- see my downloads page. I have also put the programs that I received from Bob McCoy in the [downloads](../downloads/downloads.html) page of this site. The "formula" for the trajectory program is available in various sources, including the downloads page. It does involve "numerical integration" of the equations of motion (as I have implemented it...). The Sierra Reloading manual has a section on Exterior Ballistics which provides the differential equations of motion, as does "Exterior Ballistics" and "Mathematics for Exterior Ballistics". Calculation of a trajectory also requires calculation of atmospheric density as a function of temperature, pressure (sometimes humidity, if you want). I would recommend the ICAO Standard Atmosphere (see [U.S. Standard Atmosphere](../bibliography/misc.html) for governing equations).

I have recently written a [page](../equations/equations.html) outlining certain equations.

**(Q)** *<span id="004">Can I change the drag function to a better one for my bullet?</span>*\
**(A)** Yes and No. Ballistics Coefficient and Drag Function go hand in hand. The Drag Function specifies the "standard bullet" that the BC is comparing too. You must enter the correct Drag Function of that BC. Typically, this is the G1. There are however some manufacturers that specify different BCs using different drag functions because the force on the bullet is modeled better with the different drag function. (For instance, Berger uses the G7 for some of it's VLD bullets.)

**(Q)** *<span id="005">How is the energy calculated?</span>*\
**(A)** Energy listed in the trajectory calculations is the kinetic energy of the bullet. This is discussed more in depth on the [Topics - Energy](../equations/energy.html) page.

**(Q)** *<span id="006">Have I found a bug?</span>*\
**(A)** Possibly. I would recommend that you recheck your numbers on the data page and ensure you are calculating what you think you are. If you still can't see the problem, let [me](mailto:jbm@eskimo.com) know.

**(Q)** *<span id="008">What are the programs written in?</span>*\
**(A)** All of the on-line calculations are written in C and compiled with gcc (GNU C Compiler). Most of the calculations are math intensive and require numerical integration. This (in my opinion) makes any non-compiled language unsuitable for this kind of CGI.

**(Q)** *<span id="009">Can I have a copy of your programs?</span>*\
**(A)** Yes and No. The on-line old version of my CGI programs have been GPL'd and are freely available for download from my "Downloads" page. The source for my new versions is for sale with certain restrictions. Contact [me](mailto:jbm@eskimo.com) about purchasing the source.

**(Q)** *<span id="010">Where can I get an explanation of the terms used in your calculations?</span>*\
**(A)** At the top of each data page (the left side) are instructions for the particular calculation. Directly under the instructions paragraph is a link to an explanation of terms used in the input and output of the particular calculation.

**(Q)** *<span id="011">Why are my input numbers different in the output?</span>*\
**(A)** Each input value has a certain allowed range. This range is given above each input on the data page (the left page in the frame). The following line above the muzzle velocity input shows the name of the variable with a minimum value of 500 ft/sec and a maximum value of 4500 ft/sec.

Muzzle Velocity (500 to 4500 ft/sec) \[3000.0\]

If the value falls outside this range, it is set to the default value shown in brackets. Note the units are also given for the value.

**(Q)** *<span id="012">How important is the measurement of sight height and offset?</span>*\
**(A)** Not very. At longer ranges it can add a few inches of error. Measuring with a ruler is certainly accurate enough.

\
<span class="small">[about these ads...](/~jbm/ads/adsense_exp.html)</span>

<span class="small"><a href="/~jbm" class="footer_link">JBM Small Arms Ballistics</a>. Last update 30 June 2007, Copyright © 1996-2007 <a href="mailto:jbm@eskimo.com" class="footer_link">JBM</a> <a href="http://www.htmlhelp.com/cgi-bin/validate.cgi?url=referer&amp;input=yes" class="footer_link">[V]</a></span>
