---
title: "TRANSMISSION LINE CALCULATOR © 2000 Michael A. Lee and Kevin E. Schmidt"
source_domain: www.radiondistics.altervista.org
source_path: tlc.htm
order: 41
reachable_from_entry: true
images: 10
internal_links: 5
extracted: 2026-08-03T13:07:35Z
extractor: site_to_paper.py (pandoc)
---

# TRANSMISSION LINE CALCULATOR © 2000 Michael A. Lee and Kevin E. Schmidt

*Source page: `tlc.htm`*

<img src="graphics/top_left.jpg" data-border="0" width="167" height="24" />

<img src="graphics/top_right.jpg" data-border="0" height="24" />

<img src="graphics/gradient.jpg" data-border="0" width="167" height="65" />

<img src="graphics/radiondistics.jpg" data-vspace="0" data-hspace="0" data-border="0" width="613" height="48" alt="www.RADIONDISTICS.com" />

<img src="graphics/new_back.jpg" data-border="0" width="167" height="306" />

|     |
|-----|
|     |

|     |
|-----|
|     |

<table width="140" height="380" data-border="0">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td style="text-align: left;" width="140" height="380" data-valign="top" data-bgcolor="#A5A243"><p><strong>Planning a trip to Sicily? �Then, make sure you won't be feeding the Mafia!</strong></p>
<a href="http://www.addiopizzotravel.it/default.asp?hl=en" target="_blank"><img src="images/addiopizzo.jpg" data-valign="top" data-align="center" data-border="0" width="140" height="246" alt="Pizzo-free travel - brought to you by the ADDIO PIZZO&#39;s guys" /></a></td>
</tr>
</tbody>
</table>

<table data-cellspacing="0" data-cellpadding="5" width="100%" data-border="0">
<tbody>
<tr>
<td style="text-align: center;" height="20" data-valign="top" data-bgcolor="#FFFFFF"><a href="index.html">Home</a></td>
<td style="text-align: center;" height="20" data-valign="top" data-bgcolor="#FFFFFF"></td>
<td style="text-align: center;" height="20" data-valign="top" data-bgcolor="#FFFFFF"></td>
<td style="text-align: center;" height="20" data-valign="top" data-bgcolor="#FFFFFF"></td>
<td style="text-align: center;" height="20" data-valign="top" data-bgcolor="#FFFFFF"><a href="scientific_index.htm">Scientific Products</a></td>
<td style="text-align: center;" height="20" data-valign="top" data-bgcolor="#FFFFFF"></td>
<td style="text-align: center;" height="20" data-valign="top" data-bgcolor="#FFFFFF"><a href="communications_index.htm">RF Communications Products</a></td>
<td style="text-align: center;" height="20" data-valign="top" data-bgcolor="#FFFFFF"></td>
<td style="text-align: center;" height="20" data-valign="top" data-bgcolor="#FFFFFF"><a href="contact.htm">Contact</a></td>
</tr>
<tr>
<td colspan="9" style="text-align: center;" height="20" data-valign="top" data-bgcolor="#FFFFFF"></td>
</tr>
</tbody>
</table>

|  |
|:--:|
| **If you have a scientific interest in the physics of the radio, you should browse this site as an e-book!** |
| Please select a page from this menu and hit the GO button Home page A foreword by the Author A short Author's autobiography The hertzian radiation, better known as radio waves The ionizing power of the hertzian radiation. A detection by radioluminescence The radio-electric transducers, better known as radio antennas The self-antagonist transducers Authopsy of an OPEN DIPOLE antenna Authopsy of a FOLDED DIPOLE antenna The elementary radiator, also known as the Errante's virtual ground HF antenna The virtual ground BalUn, also known as the Errante's BalUn Errante's capacitive RF earth grounding system The balanced RF transmission line behaviour in a progressive wave regime Virtual ground node generator for balanced RF transmission lines Virtual ground node generator for un-balanced RF transmission lines Errante's 225 Ohm, multiband HF antenna system Errante's HF turnstile antenna broadband driver From capacitive to virtual grounding, all the Radiondistics' building block at a glance |

# A transmission line calculator

**NB: this page is an appendix to the** [***Errante*'s apparatus for the physics of the balanced transmission lines for radio-frequency signals.**](balanced_lines.htm)

<table width="100%" data-cellspacing="0" data-cellpadding="5" data-border="0">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td style="text-align: left;"><p>To use the <em>Transmission Line Calculator</em> applet below, change the values in the input fields, and click calculate.<br />
Most of the fields will be self explanatory but further explanation is provided below.</p></td>
</tr>
<tr>
<td style="text-align: left;" data-bgcolor="#C0C0C0"><p>Your browser can't run Java Applets: Here's a picture of the calculator instead. <img src="./utilities/tlc/tlc.gif" data-align="center" width="680" height="491" /></p>
<p><strong>To interrupt a calculation in progress, click stop.</strong></p></td>
</tr>
<tr>
<td style="text-align: left;"><p> </p>
<p>The cable type is a menu of common cable types that can be used. In addition <strong>two user defined entries allow you to enter custom cable types</strong> as described below.</p>
<p>You need to enter the frequency in the first text field. The label "Cable Length in Feet" can be changed to "Cable Length in Meters" which will change all the length units from feet to meters. You then enter the length in the cable length field. Similarly, the "Load Resistance" label can be changed to "Input Resistance" so that measured impedances at the input end of a cable can be converted to antenna impedances. Enter the resistance and reactance (positive for inductive, negative for capacitive) in those fields.</p>
<p>When your input is set, press calculate. If there is an input error a message will be displayed in the field to the left of the stop button. The output side only changes when you press calculate, and will display the characteristic impedance Z0 of the line, the impedance at the other end of the line, the velocity factor, the SWR at each end of the line, the matched loss of the line, and the total loss with your load impedance.</p>
<p>The bottom part of the applet is a plot. The x axis is the position along the line; x=0 is the input. The default shows the power, current and voltage on the line all on one plot. To make them all appear on a single plot, I take the current to have magnitude one at the load, I divide the voltage by the characteristic resistance of the line, and I divide the power by its value at the load. At the top of the plot is a choice menu that allows you to also select the power in watts, voltage magnitude in volts, or current magnitude in amps with 1500 watts input to the line. You can also plot the impedance in ohms seen along the line. The red curve is the resistance and the blue one is the reactance. The plotting is implemented using a stripped down version of <em>ptplot</em> by Edward A. Lee and Christopher Hylands, copyright University of California. One of the nice features of this package is that <strong>you can zoom in on a portion of the plot</strong> by holding down the left mouse button on that portion and move down and to the right to highlight the region with a little square. You can do this multiple times too. If you hold down the left mouse button and move up and to the left, you can unzoom. The easiest way to get back to the original is to click calculate again.</p>
<p>Two user defined cable types are provided. For <em>user 1</em>, you enter the resistive part of the characteristic impedance, the velocity factor and the attenuation in dB/100ft at some frequency. If you want to extrapolate to other frequencies, the exponent would be exactly 0.5 if the loss mechanism were purely conductor losses, and that should be good enough for a first guess. Otherwise, the loss at a new frequency will be the ratio of the new frequency to this frequency raised to the exponent power times this attenuation. The reactive part of the characteristic impedance is calculated assuming only conductor losses.</p>
<p><em>User 2</em> does not scale the results with frequency. Instead you input the characteristic impedance both resistive and reactive parts, the attenuation and the velocity factor. These characteristics are assumed to not change with frequency.</p>
© July 1, 2000-
  Michael A. Lee and Kevin E. Schmidt
<p><a href="balanced_lines.htm"><strong>Click here to jump back to the Errante's apparatus for the physics of the balanced transmission lines page</strong></a></p></td>
</tr>
</tbody>
</table>

�

<table data-cellspacing="0" data-cellpadding="5" width="100%" data-border="0">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td style="text-align: center;" height="20" data-valign="bottom"><hr />
All rights reserved. Copyright © 1985-
<a href="contact.htm">Francesco Errante</a><br />
www.Radiondistics.com - Tel.(+39) 339.180.1313</td>
</tr>
</tbody>
</table>

<img src="graphics/bottom_left.jpg" data-border="0" width="167" height="23" />

<img src="graphics/bottom_right.jpg" data-border="0" height="23" />

|  |
|:--:|
| <a href="http://www.statcounter.com/" target="_blank"><embed src="http://c7.statcounter.com/counter.php?sc_project=731660&amp;java=0&amp;security=fbd4ad68" data-border="0" /></a> |
