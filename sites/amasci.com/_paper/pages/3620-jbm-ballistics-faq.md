---
title: "JBM - Ballistics - FAQ"
source_domain: amasci.com
source_path: ~jbm/ballistics/faq.html
order: 3620
reachable_from_entry: false
images: 0
internal_links: 11
extracted: 2026-08-07T17:10:16Z
extractor: site_to_paper.py (pandoc)
---

# JBM - Ballistics - FAQ

*Source page: `~jbm/ballistics/faq.html`*

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

# JBM - Ballistics - FAQ

## Topics

[Ballistics...](#Ballistics)

[CGI/Bugs](#CGI)

[Using the programs](#Usage)

## <span id="Ballistics">Ballistics</span>

**(Q)** *Why can't I calculate BC from bullet drop at different ranges?*\
**(A)** You can, but not very accurately. If you look at the bullet drop for two bullets, one with a BC of 0.5 and the other with a BC of 0.55, you'll find that the bullet drops at 300 yards with a muzzle velocity of 3000 f/s and a 100 yard zero, are -10.9" and -10.7" respectively. So if you can shoot groups less than 0.2" at 300 yards, have at it. Of course you'll still only know the BC within about 10% (the BC calculation CGI can be as accurate as 2%!).

**(Q)** *Why doesn't the air density change when I change the altitude?*\
**(A)** The altitude is only used when you check "Standard conditions at Altitude". If this is not checked, the density is calculated from the Temperature, Pressure and Humidity you entered.

**(Q)** *Where can I get the formula for these programs?*\
**(A)** The source code to my CGI programs is now available under the GNU public license -- see my downloads page. I have also put the programs that I received from Bob McCoy in the [downloads](../downloads/downloads.html) page of this site. The "formula" for the trajectory program is available in various sources, including the downloads page. It does involve "numerical integration" of the equations of motion (as I have implemented it...). The Sierra Reloading manual has a section on Exterior Ballistics which provides the differential equations of motion, as does "Exterior Ballistics" and "Mathematics for Exterior Ballistics". Calculation of a trajectory also requires calculation of atmospheric density as a function of temperature, pressure (sometimes humidity, if you want). I would recommend the ICAO Standard Atmosphere (see [U.S. Standard Atmosphere](../bibliography/misc.html) for governing equations).

I have recently written a [page](../ballistics/equations.html) outlining certain equations.

**(Q)** *Can I change the drag function to a better one for my bullet?*\
**(A)** Yes and No. Ballistics Coefficient and Drag Function go hand in hand. The Drag Function specifies the "standard bullet" that the BC is comparing too. You must enter the correct Drag Function of that BC. Typically, this is the G1. There are however some manufacturers that specify different BCs using different drag functions because the force on the bullet is modeled better with the different drag function. (For instance, Berger uses the G7 for some of it's VLD bullets.)

**(Q)** *How is the energy calculated?*\
**(A)** Energy listed in the trajectory calculations is the kinetic energy of the bullet. This is discussed more in depth on the [Equations - Energy](energy.html) page.

## <span id="CGI">CGI/Bugs</span>

**(Q)** *Have I found a bug?*\
**(A)** Possibly. I would recommend that you recheck your numbers on the data page and ensure you are calculating what you think you are. If you still can't see the problem, let [me](mailto:jbm@eskimo.com) know.

**(Q)** *The requested URL /cgi-bin/jbm/jbmtraj was not found on this server*\
**(A)** My ISP recently changed domain names. Although I believe it is supposed to work with the old addresses (roadrunner.com and lascruces.com) it appears to only work with the newest address: <http://www.eskimo.com/~jbm> .

**(Q)** *What are the programs written in?*\
**(A)** All of the on-line calculations are written in C and compiled with gcc (GNU C Compiler). Most of the calculations are math intensive and require numerical integration. This (in my opinion) makes any non-compiled language unsuitable for this kind of CGI.

**(Q)** *Can I have a copy of your programs?*\
**(A)** Yes and No. The on-line CGI programs have been GPL'd and are freely available for download from my "Downloads" page. The MPM program, I have not released publicly (source code that is). I may again write ballistics programs for commercial use and therefore don't really want to give away my MPM source code. Besides, you'll learn much more doing it yourself. (Now, if you want to buy it, that's a different story...)

## <span id="Usage">Using the programs</span>

**(Q)** *Where can I get an explanation of the terms used in your calculations?*\
**(A)** At the top of each data page (the left side) are instructions for the particular calculation. Directly under the instructions paragraph is a link to an explanation of terms used in the input and output of the particular calculation.

**(Q)** *Why doesn't the text print?*\
**(A)** The output of the programs has white lettering on a dark background. Printing white lettering on white paper will result in nothing being printed. To fix this, configure your browser to print black text. (Netscape users can configure this from the *Page Setup* dialog opened from *File \| Page Setup* menu command.) NOTE: I've changed to a white background and this shouldn't even be an issue anymore.

**(Q)** *Why are my input numbers different in the output?*\
**(A)** Each input value has a certain allowed range. This range is given above each input on the data page (the left page in the frame). The following line above the muzzle velocity input shows the name of the variable with a minimum value of 500 ft/sec and a maximum value of 4500 ft/sec.

Muzzle Velocity (500 to 4500 ft/sec) \[3000.0\]

If the value falls outside this range, it is set to the default value shown in brackets. Note the units are also given for the value.

**(Q)** *How important is the measurement of sight height and offset?*\
**(A)** Not very. At longer ranges it can add a few inches of error. Measuring with a ruler is certainly accurate enough.

------------------------------------------------------------------------

<span class="small">Last update 4 August 2004, Copyright © 1996-2004 [JBM](mailto:jbm@eskimo.com) [\[V\]](http://www.htmlhelp.com/cgi-bin/validate.cgi?url=referer&input=yes)</span>
