---
title: "http://www.tricountyi.net/~randerse/bioholo.HTM"
source_domain: amasci.com
source_path: freenrg/bioholo.html
order: 614
reachable_from_entry: true
images: 3
internal_links: 7
extracted: 2026-08-07T05:54:06Z
extractor: site_to_paper.py (pandoc)
---

# http://www.tricountyi.net/~randerse/bioholo.HTM

*Source page: `freenrg/bioholo.html`*

<table data-summary="nav links, google search window" width="100%" height="75">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td><table data-cellpadding="5" data-summary="Navigation links">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<tbody>
<tr>
<td><strong><a href="http://amasci.com/weird.html">PREV</a>  |</strong><br />
</td>
<td><strong><a href="http://amasci.com/unew.html">GOOD STUFF</a>  |</strong><br />
</td>
<td><strong><a href="http://amasci.com/news.html">NEW STUFF</a>  |</strong><br />
</td>
<td><strong><a href="http://amasci.com/search.html">SEARCH</a></strong><br />
</td>
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

------------------------------------------------------------------------

### **An implementation of a system to produce audio frequency "Bio-Holograms"**

**Based on the ideas of Jacques Benveniste**\
9/12/99 by Rick Andersen\

This file is a mirror of <http://www.tricountyi.net/~randerse/bioholo.htm>

------------------------------------------------------------------------

*Recently, I came across a fascinating article at Bill Beaty's site, outlining the ideas and experiments of Jacques Benveniste, a scientist who claims to be able to extract, record and broadcast (e.g., over the Internet) the molecular frequency signatures of various chemicals in water solution in a test tube. This is said to be accomplished by playing white noise into a sample, via a magnetic field from a transmitting coil. A second coil receives the transmitted noise, but at the receive end the noise has been subtly altered by interaction with the molecules in the sample--- which I assert is analogous to the process behind an optical hologram; here we use audio frequencies.*

Once the signal has been "captured", it can then be transmitted to another location and played through a third coil, into a test tube of pure water. According to Benveniste, the water becomes "structured" by the electromagnetic field of the original sample's molecules, and the water will now act as if it contains the original sample.

Since this is tantamount to providing the scientific community with a plausible mechanism for the scorned "pseudoscience" of Homeopathy, Benveniste has been getting all kinds of heat for his pronouncements in this area and in his previous statements about water itself having a "memory" upon which information can be impressed-- which affects life processes.

Too close to my own ideas about EM fields around a body (see my file on the [Lorentz Force generator](http://web.archive.org/web/20050205042722/www.tricountyi.net/~randerse/lfg.htm) for me not to try and build a circuit to implement Benveniste's ideas! For more information, see [www.digibio.com](http://web.archive.org/web/2008*/http://www.digibio.com). The Bill Beaty article can be found at [amasci.com](http://amasci.com/freenrg/digibio.html).

------------------------------------------------------------------------

![](http://amasci.com/graphics/bioholo.gif)

**Circuit Operation:**

NPN transistor Q1 is connected "upside-down" to put it into the avalanche mode-- this generates white noise. Q1's noise current biases Q2's base, and Q2 amplifies the white noise signal. Q3 provides another stage of gain for the noise. VR1 serves as a "volume" control; the amount of signal picked off at the wiper is variable and is sent to IC1, a 100 mW audio power amplifier. The amplified output is sent to the output jack which will connect to the "transmit" coil. The transmit coil broadcasts a white-noise magnetic field into the sample under study.

Some distance away, a "receive" coil picks up the white noise, which we presume is altered in intensity, frequency response, and phase, in small but measurable amounts. \[An alternate, or parallel, explanation is that beat frequencies in the audio range are produced by small amounts of nonlinear mixing, as the wide range of random frequencies inherent in white noise interact with the molecular resonances in the sample.\]

Op amp IC2a amplifies the receive coil's output, which will be attenuated with increasing distance from the transmit coil. In Benveniste's experiments, the small distance between coils was occupied by a test tube filled with water and the particular chemical under study. The solution could be viewed as the core of a transformer whose windings are the transmit and receive coils.

After amplification by IC2a, the received signal is mixed (summed) with the original "reference" noise signal. The phasing (connection polarity) of the receive coil is such that the original reference noise and the altered noise from the receive coil and amplifier will "null" or cancel each other at some setting of the amplifier gain potentiometer VR2.

If the reference and the receive coil's noise signals are identical, the null should be quite deep (discounting differences in the frequency/phase response between the two signal paths); the assumption is that there will in fact be a small residual signal which cannot be cancelled out-- this "differential" signal represents the "information" impressed by the sample upon the reference noise.

This "distortion" or alteration of the "reference" noise represents absorption/reflection of energy by the sample under study. It is assumed to be analogous to an object being holographically recorded, as in laser hologram technology. We uncover the small distortions imparted to the noise by the sample, by mixing the reference back in with the altered signal, but 180 degrees out of phase. This is analogous to creating the interference patterns on film in laser holography.

The residual signals present in the differential mix are amplified by IC1b and sent to the output jack as the "differential output".

------------------------------------------------------------------------

Back to [Electronics Menu](http://web.archive.org/web/2004*/www.tricountyi.net/~randerse/lfg.hthttp://www.tricountyi.net/~randerse/electmnu.htm)\
Back to [Main Menu](http://web.archive.org/web/2004*/http://www.tricountyi.net/~randerse/mainmenu.htm)\
Back to [Homepage](http://web.archive.org/web/2004*/http://www.tricountyi.net/~randerse/default.htm)

[http://amasci.com/freenrg/bioholohtml](http://amasci.com/freenrg/bioholo.html)\
Created and maintained by [Bill Beaty](http://amasci.com/billb.html).\
Mail me at: [<img src="http://amasci.com/graphics/abc.gif" data-border="0" width="141" height="19" alt="[my email address is my website addr preceded by billb atsign]" />](http://amasci.com/amfrm/).\

<div class="statcounter">

<a href="http://statcounter.com/shopify/" target="_blank" title="shopify stats"><img src="http://c.statcounter.com/10408414/0/00267183/0/" class="statcounter" alt="shopify stats" /></a>

</div>

[View My Stats](http://statcounter.com/p10408414/?guest=1)
