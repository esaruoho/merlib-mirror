---
title: "Linear motor for toy magnetic levitation train"
source_domain: amasci.com
source_path: maglev/linmot.html
order: 337
reachable_from_entry: true
images: 2
internal_links: 11
extracted: 2026-08-07T17:04:59Z
extractor: site_to_paper.py (pandoc)
---

# Linear motor for toy magnetic levitation train

*Source page: `maglev/linmot.html`*

<table height="77" data-summary="nav links, google search window" width="100%">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td data-summary="nav"><table data-cellpadding="4" data-summary="Navigation links">
<tbody>
<tr>
<td><a href="http://amasci.com/maglev/magschem.html">MAGLEV</a></td>
<td><a href="http://amasci.com/sc/kidproj1.html">SCI. PROJS</a></td>
<td><a href="http://amasci.com/unew.html">GOOD STUFF</a></td>
<td><a href="http://amasci.com/news.html">NEW STUFF</a></td>
<td><a href="http://amasci.com/search.html">SEARCH</a></td>
</tr>
</tbody>
</table></td>
<td style="text-align: right;" data-summary="google search" data-valign="top"><div id="google_translate_element">
&#10;</div>
<div>
&#10;</div></td>
</tr>
</tbody>
</table>

<table data-summary="main text content" width="100%">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td data-summary="linear motor article" data-valign="top" width="800"><div data-summary="google ad" style="height:700px;margin-right:1px;margin-top:1px;float:left;">
&#10;</div>
<h1 id="linear-motor-for-maglev-train-1997-w.-beaty">LINEAR MOTOR FOR MAGLEV TRAIN<br />
1997 W. Beaty</h1>
<p>Here's a possible way to add an electrical drive motor to a <a href="http://amasci.com/maglev/train.html">model maglev train</a>. Note that I have NOT tried this myself. It may or may not be difficult to build, and there may or may not be hidden problems in this method. (But see the note at the end of this article.)<br />
</p>
<p>Normal (rotary) DC motors are made of three parts: an outer magnet, an inner rotating coil, and a commutator switch. A DC linear motor is also made up of three parts: a long magnetic "stator" track, a moving coil, and some sort of "commutator" to reverse the poles of the coil. Linear motors are like normal motors which have been unwrapped and flattened out.<br />
</p>
<p>My "<a href="http://amasci.com/maglev/magschem.html">maglev cradle</a>" device already contains electronic commutators in the form of <a href="http://amasci.com/maglev/hall.html">hall effect switches</a> and transistors. It also contains <a href="http://amasci.com/maglev/levgif.html">coil electromagnets</a>. Therefore, it should be possible take one of the segments of the "levitation cradle" circuit and morph it into a linear drive motor. Rather than lifting a magnet, it will apply sideways thrust to a magnet.</p></td>
<td></td>
</tr>
</tbody>
</table>

                                      __________________________
                     electromagnet   |                          |
                          _____ n    |drive circuit & batteries |
                         |     |     |__________________________|
                         |     |    
                         |_____|             hall sensor
             force <-----  |_| s          === 
     ___________________________________________________________
    |  S  |  N  |  S  |  N  |  S  |  N  |  S  |  N  |  S  |  N  |
    |_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|

Fig. 1 Central thrust track, coil, and sensor\

(See [Magnetic levitator](http://amasci.com/maglev/magschem.html) for more info.)\

<table data-summary="main text content" width="100%">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td data-summary="linear motor article" data-valign="top" width="800"><p>In figure 1 above, we've built a "stator" track out of permanent magnets. Hovering over the magnet strip is an electromagnet coil, a hall sensor, and the rest of the 3-transistor "magnet cradle" circuit discussed elsewhere. (see magschem.gif) The position of the hall sensor chip and the tip of the magnet is important. The hall sensor is next to an "S" pole of the magnet track. It turns the coil on, and the coil is oriented so its bottom pole becomes "S". The tip of the iron core of the coil is between an "N" and an "S" pole of the permanent the magnet track, so it is attracted/repelled from right to left.<br />
</p>
<div style="width:320px;height:260px;margin-right:1px;margin-top:1px;float:left;">
&#10;</div>
<p>Since the coil, sensor, and battery circuitry is all riding on the levitated cart, the entire cart moves forward. As the cart moves forward, the hall sensor moves away from the "S" pole of the track, and approaches the "N" pole. This turns the coil off, then turns it back on again with its poles reversed. But now the tip of the coil's iron core is between opposite poles of the magnet track, so the fields still force the coil to move from right to left. The cart keeps moving, the sensor keeps switching the coil polarity, and the fields always force the cart from right to left.<br />
</p>
<p>When placed on the maglev track, the cart should take off fast, accelerating as it goes. At some point the speed should level off because of air friction or switching speed of the coil circuit. Battery voltage should control the acceleration (reduce voltage to reduce the coil current and the magnetic force.) Rather than the two separate 24V power supplies used for the cradle device, I bet that a pair of 9v batteries would work OK.<br />
</p>
<p>It might help things if you first develop your linear motor on a wheeled cart. Once it is all working, you can move to the levitated car.<br />
</p>
<p>Note that the linear motor's magnet strip is not part of the main levitation system. Figure 2 below shows where it should be positioned in my "train.txt" permanent magnet levitation project.<br />
</p>
<p>I don't know if the attraction between the drive coil and the NSNS magnet track will cause troubles. It might attract the drive coil so that it drags along the magnets. You'll have to experiment. If the drive coil and the NSNS magnets are fairly weak, then their downward pull should not overpower the main levitator magnets. If they do, you might need to change the linear motor so the central magnet track sticks up, and two drive coils face it from the sides, with one coil on either side. This would eliminate any vertical forces (but add some horizontal forces, as well as adding complexity.) Or instead you could try removing the iron rod from the coil, and perhaps use a coil which is as large in diameter as one of the magnets in the NSNS strip.<br />
</p></td>
<td></td>
</tr>
</tbody>
</table>

      side  ____            (end view)                ____  side
      rail |    |                                    |    | rail
           |    |      levitated cart                |    |
           |    | __________________________________ |    |
           |    ||__________________________________||    |
           |    |    |_____|              |_____|    |    |
           |    |     _____       __       _____     |    |
         __|____|____|_____|_____|__|_____|_____|____|____|__
        |____________________________________________________|
                                  /\ 
                                   central NSNS thrust track

Fig. 2 Maglev train with central thrust track\

<table data-summary="main text content" width="100%">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td data-summary="linear motor article" data-valign="top" width="800"><p>If all of this is a bit too much to contemplate, then here's a hint:<br />
</p>
<p><strong>Propellor and rubber band from a toy balsa wood airplane!</strong><br />
</p>
<p>&gt; Date: Tue, 7 Jun 2005 14:14:36 -0400 (EDT)<br />
&gt; From: Stacey Benson<br />
&gt; To: billbamascicom<br />
&gt; Subject: linear drive maglev<br />
&gt;<br />
&gt; Good afternoon,<br />
&gt;<br />
&gt; I just wanted to let you know that the plans provided work well! I had a<br />
&gt; summer research group successfully construct a fully functional train using<br />
&gt; your directions. This summer we plan on making improvements and may even<br />
&gt; attempt driving the trains around a curved track. going straight was no<br />
&gt; problem.<br />
&gt;<br />
&gt; Stacey Benson<br />
&gt; Special Lecturer/Lab Technician<br />
&gt; Carnegie Mellon University<br />
&gt;</p>
<table data-summary="google ads" width="100%" height="95">
<tbody>
<tr>
<td style="text-align: center;" data-summary="google banner ad"></td>
</tr>
</tbody>
</table></td>
<td></td>
</tr>
</tbody>
</table>

<http://amasci.com/maglev/linmot.html>\
Created and maintained by [Bill Beaty](http://amasci.com/billb.html). Mail me at: [<img src="http://amasci.com/graphics/abc.gif" data-border="0" width="141" height="19" />](http://amasci.com/amfrm/).\

<div class="statcounter">

<a href="http://statcounter.com/shopify/" target="_blank" title="shopify stats"><img src="http://c.statcounter.com/10408414/0/00267183/0/" class="statcounter" alt="shopify stats" /></a>

</div>

[View My Stats](http://statcounter.com/p10408414/?guest=1)
