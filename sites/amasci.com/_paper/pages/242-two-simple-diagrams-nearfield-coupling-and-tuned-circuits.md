---
title: "Two Simple Diagrams: nearfield coupling and tuned circuits"
source_domain: amasci.com
source_path: tesla/nearfld1.html
order: 242
reachable_from_entry: true
images: 7
internal_links: 13
extracted: 2026-08-03T18:11:41Z
extractor: site_to_paper.py (pandoc)
---

# Two Simple Diagrams: nearfield coupling and tuned circuits

*Source page: `tesla/nearfld1.html`*

<table width="100%" height="75">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td width="70%" data-summary="nav links"><table data-cellpadding="5">
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<tbody>
<tr>
<td><a href="http://amasci.com/tesla/tesceive.html">TESLA RECEIVE</a><br />
</td>
<td><a href="http://amasci.com/tesla/high_voltage3.html#tfiles">TESLA ARTICLES</a><br />
</td>
<td><a href="http://amasci.com/unew.html">GOOD STUFF</a><br />
</td>
<td><a href="http://amasci.com/news.html">NEW STUFF</a><br />
</td>
<td><a href="http://amasci.com/search.html">SEARCH</a><br />
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

<table data-summary="two columns" width="100%">
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<tbody>
<tr data-valign="top">
<td data-summary="spacer" width="15"></td>
<td data-summary="main text" width="730"><h1 id="energy-received-by-electrically-small-capacitive-antennas-1999-w.-beaty-bsee">Energy Received by Electrically Small<br />
Capacitive "Antennas"<br />
1999 <a href="http://amasci.com/me.html">W. Beaty BSEE</a></h1>
The ongoing Feb/2000 "energy-sucking antenna" controversy on <a href="https://groups.google.com/g/sci.physics.electromag">SCI.PHYSICS.ELECTROMAG</a> (see <a href="https://groups.google.com/g/sci.physics.electromag/c/n31rE90qCtQ/m/mowMKkfiK8MJ">Feb/2000 thread</a>) , and <a href="https://groups.google.com/g/sci.electronics.design/c/cBLfoRXSN7U/m/qAD64rYCvBMJ">earlier Aug/1999 on sci.electronics.design</a> prompted me to put together this brief article. It concerns the amount of energy which a tiny, capacitively-coupled antenna can intercept from nearby metal plates.<br />
&#10;<p>Since we're having serious disagreements over simple EM physics, first I want to see if everyone can agree on the reality of some basic phenomena which DO NOT involve EM radiation. If we cannot agree on something this simple, then there certainly is no point to fighting over EM travelling waves and any possible "energy sucking" effects involving waves. In addition, if anyone finds a big flaw in the simple stuff below, then that will impact the "energy sucking" idea itself. So first let's fight about simple resonant circuitry! [grin!]</p></td>
<td width="50"> </td>
<td data-summary="google ad" data-valign="top"><pre><code>
&#10;
&#10;</code></pre></td>
<td></td>
</tr>
</tbody>
</table>

\

Here are the abstracts for the physics papers which provoked the whole fight:\

1.  1\. C. F. Bohren, "[How can a particle absorb more than the light incident](http://amasci.com/tesla/dipole1.html) on it?", Am J Phys, 51 \#4, pp323 Apr 1983
2.  2\. H. Paul and R. Fischer "[Light Absorption by a dipole](http://amasci.com/tesla/dipole1.html)", SOV. PHYS. USP., 26(10) Oct. 1983 pp 923-926

And here is my first article, the one regarding Nikola Tesla's attempt to broadcast megawatt-levels of EM power between continents using VLF radio: [Tesla's Power Receiver](http://amasci.com/tesla/tesceive.html)\

\

> **Question: if a capacitively-coupled "antenna" becomes part of an\
> LC resonator, can it actually receive more energy from an\
> AC e-field than it otherwise would if the resonator wasn't there?**

\

\

|  |  |  |
|:--:|----|:--:|
| [<img src="http://amasci.com/tesla/reson1.gif" style="width:100.0%" data-align="center" data-border="0" alt="[Large metal plates connected to AC voltage, two small floating plates nearby connected to resistor]" />](http://amasci.com/tesla/reson1.gif) |   | [<img src="http://amasci.com/tesla/reson2.gif" style="width:100.0%" data-align="center" data-border="0" alt="[Large metal plates connected to AC voltage, two small floating plates nearby connected to resistor and coil]" />](http://amasci.com/tesla/reson2.gif) |
| **Fig. 1** A capacitive antenna drives a resistor |   | **Fig. 2** An inductor is added, forming a tuned circuit |

\

Above we have two variations on a theme: a pair of LARGE parallel metal plates creates a strong AC e-field between themselves, and a pair of SMALL metal plates intercepts a bit of energy from this field. The received energy heats up a load resistor. Assume that all this takes place in the nearfield, where all plate-sizes and distances are far smaller than c/500KHz = 600 meters. Imagine the big plates to be a couple of feet across.\

In Fig. 2 on the right, an inductor has been added, and its value is chosen in order to create a tuned circuit with a center frequency the same as the frequency of the voltage-source which drives the large metal plates. In both diagrams the load resistor has been adjusted for maximum received energy. Assume that any stray capacitance of the resistor and inductor are included in other capacitances.\

Analysis is very straightforward. Let's add the parasitic capacitances and plug in some real numbers. I'm arbitrarily making the capacitances form a 100:1 voltage divider. If you object, feel free to choose some other ratio.\

<table width="100%">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td width="161"></td>
<td style="text-align: center;" width="400"><a href="http://amasci.com/tesla/reson3.gif"><img src="http://amasci.com/tesla/reson3.gif" style="width:100.0%" data-align="center" data-border="0" alt="[Comparing the two circuits, w/parasitic capacitance added.]" /></a><br />
</td>
<td></td>
</tr>
<tr>
<td></td>
<td style="text-align: center;"><strong>Fig. 3</strong> Comparing the two circuits</td>
<td></td>
</tr>
</tbody>
</table>

\

First let's choose a value for R1 on the left. Note that the parasitic capacitances **"Ca"** happen to form a capacitive voltage divider with C1. To adjust R1 for maximum power, we set R1 equal to the Thevinin series reactance created by the Ca-C1 voltage divider, which equals 1/(2\*pi\*f\*100pF) or approximately 3.2K ohms. The voltage which appears across R1 will be .707 times 100V, times the 1:100 voltage division, so V(r1) = 0.7v. Knowing that power = V^2/R, the power received by R1 will be around 160 microwatts. It's fairly small, as you probably expected. After all, the voltage across the C1 plates obviously should be *far* smaller than the 100V applied to the large plates.\

OK, on the right we've added L1, and adjusted it to resonance. Something interesting occurs: the resonant circuit acts like a pure resistor, C2 essentially "vanishes," and the voltage across R2 becomes very large. C2 becomes part of the reactance of the LC circuit, and since I'm assuming lossless components, its reactance is infinite. To adjust R2 for maximum energy, we set it equal to the series reactance of the voltage source, which is two Ca capacitors (2pf) in series, or 1/(2\*pi\*f\*1pf) = 320K ohms. Since C2 and L1 "vanish", the voltage across R2 is simply .707 times the 100v drive, or 71v, and the received power is around 16 milliwatts.\

We've found that the maximum power intercepted by each of the two circuits is very different. The circuit with the resonator works better by a factor of 100! By adding a tuned circuit, we've eliminated the 100:1 capacitive voltage divider. And if the large plates were even further apart (but still in the 500KHz nearfield), then the 100x difference between the two circuits would be even greater.\

To check my numbers, I divide the power equation for one circuit by the power equation for the other. I find that everything cancels out except the 100:1 from the capacitive voltage divider. The circuit with the resonator receives 100x more power.\

Also note that the voltage across C2 is higher than the voltage across C1 by a factor of 100. This implies something interesting. If you held a little bitty electrostatic field meter near C1, it would indicate a low value; a value just about as low as if the C1 plates were not present at all. On the other hand, if you used the same meter to measure the field strength near C2 on the right, you would find it to be very large, almost as if the small plates forming C2 were directly connected to the large, distant driver plates! All this is a consequence of high-Q resonance. Detune the circuit, and the large voltage across C2 goes away.\

> **Pd without tuned circuit: 0.16 mW\**
>
> Pd with tuned circuit: 16 mW\
>
> Increase in received energy: 100x\
>
> Increase in e-field near the small plates: 100x

Conclusion: a short dipole antenna doesn't intercept much RF power, but this situation can be amazingly enhanced by adding a resonant circuit. Cool!\
\

------------------------------------------------------------------------

<table width="90%" data-border="" data-cellpadding="10">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td><strong>New info:3/18/2000<br />
Engineers on SCI.ELECTRONICS.DESIGN have pointed out that my above analysis of FIG.2 is missing a lot more power: the R2 resonant power is NOT limited to only 16 milliwatts as I have calculated. This is true because the voltage across L2 is NOT limited to 71V like I thought. Instead, it is limited only by the Q factor of the resonator, and this is proportional to the value of R2. If the resistance of R2 is made very large, then the Q becomes large. (The resonant frequency of L2-C2 must be retuned slightly to maximize the power in R2.) By making the value of R2 larger, the Q becomes larger, and the voltage across R2 will rise proportionally. Because the power dissipation for R2 depends upon the *square* of the voltage across it, increasing the value of R2 doesn't result constant received Pd, instead it lets the antenna receive far larger power.<br />
</strong>
<p>If lossless superconducting components could be used (particularly for the coil L2,) the voltage across R2 can be FAR higher than 71V, and the Pd received by resistor R2 can be FAR higher than 16 milliwatts.<br />
</p>
<p>As a result, my calculation of 100:1 power difference between Fig. 1 and Fig. 2 is perfectly correct as it stands. However, if the above changes are made, then the 100:1 difference could be immensely larger, even far higher than 100V. And because the voltage across R2 and C2 rises much higher, the e-field near the C2 plates is much higher too. Obviously this would require a tightly-controlled broadcast frequency, and actively controlled receiver tuning, since any tiny change in receiver resonance would entirely miss the incoming signal.<br />
</p>
<p>This change does not alter my conclusion: R2 dissipates far more power than R1, and the e-field adjacent to the small C2 plates in Fig. 2 has a far larger value than the e-field adjacent to the small C1 plates in Fig 1.</p></td>
</tr>
</tbody>
</table>

\

OK sci.physics people, all interpretations of the "Energy Sucking" phenomenon aside, do you agree with the following?:

1.  Adding a (lossless) tuned circuit can significantly increase the energy throughput capabilities of a small capacitive antenna.
2.  The strength of the e-field next to a small capacitive antenna can be much larger when a (lossless) tuned circuit is present.
3.  The theory is sound: this effect is real, and is not forbidden by QED, or wave/particle duality, or superposition, or any other well-verified physics principles.
4.  If you ACTUALLY BUILT this thing, it would work, although practical considerations might mess things up. The finite value of Q created by real-world coils would reduce the theoretical 100x factor, and it might be hard to keep such sharp tuning from drifting without adding active feedback control.

\

Feel free to check my calculations. I'm a digital designer and my analog math is rusty.\

SIDE NOTE: This is the electrostatic case. The entire article can be rewritten so that the "transmitter" is a large hoop-shaped coil driven by a 500KHz current, and the two receivers are smaller coils nearby, one of which features a tuning capacitor connected across it. Rather than coupled capacitors, we can form loosely- coupled transformers, and the results will be similar. The tuned "antenna coil" will intercept more energy than the RL circuit. And the b-field near the tuned "antenna coil" will be much larger than the b-field near the other.\

ANOTHER NOTE: this might explain why crystal radios work much better if a tuned circuit is used. A tuned circuit is not just a filter. Instead it creates a higher signal voltage in the radio circuit. This is not magic, because in order to help to exceed the Vf of the crystal diode, we could instead place a step-up transformer between the antenna/ground section and the rest of the circuit. But there is some magic to be had: if we place a parallel LC circuit between the antenna and ground, we can eliminate the antenna/ground capacitance, and we can actually increase the net amount of energy received by the antenna as if the antenna was electrically larger. The tuned circuit in a crystal radio is \*not\* simply a bandpass filter. Instead its oscillations grow as it takes in energy, which \*drives\* the receiving antenna and creates a strong EM field. And this EM field then "funnels" the incoming EM waves to the antenna which would otherwise pass right by. (Or from another viewpoint, the resonator drives the receiving antenna, causing it to emit an EM sphere-wave which superposes with the incoming waves to form a diffraction pattern... and this diffraction pattern takes the form of an "EM shadow" which appears downstream from the receiving antenna: a shadow-region where some EM energy is missing. The missing energy has gone inside the crystal radio.)\

<span id="flux"></span>\

------------------------------------------------------------------------

<table width="100%">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<tbody>
<tr data-valign="top">
<td width="362"><a href="http://amasci.com/graphics/dp-absb1.gif"><img src="http://amasci.com/graphics/dp-absb1.gif" style="width:100.0%" data-align="left" data-hspace="10" alt="[Parallel lines flow in from the left, bend inwards, and dive into a central point]" /></a><br />
<strong>Fig 4. Energy flux lines for the nearfield region of a resonant absorber</strong><br />
[from <a href="http://iopscience.iop.org/article/10.1070/PU1983v026n10ABEH004523/meta">ref#2</a> above]</td>
<td width="15"></td>
<td>In figure 4 we see the energy flux (Poynting vector field) surrounding a very small resonant antenna. Plane waves enter from the left, and the antenna occupies a point in the center of the diagram. Clearly the EM energy is being deflected inwards by the dipole field of the small resonator. As the phase of the wave advances with time, so does the phase of the resonator, and the absorbsion occurs during both halves of a 360deg cycle. In this diagram the resonator's dipole pattern is oriented vertically.</td>
<td></td>
</tr>
<tr>
<td><br />
&#10;<p><br />
</p></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr data-valign="top">
<td width="362"><a href="http://amasci.com/graphics/dp-absb2.gif"><img src="http://amasci.com/graphics/dp-absb2.gif" style="width:100.0%" data-align="left" data-hspace="10" alt="[Same as above, with circle enclosing the parallel lines which later are absorbed]" /></a><br />
<strong>Fig 5. Circle shows the approximate size of an "absorber disk" which has an area equal to the Effective Aperature (EA) of the resonant antenna.</strong><br />
</td>
<td width="15"></td>
<td>In Fig 5 I've sketched in the profile of an "absorber disk" which has an effective aperture equal to that of the small resonator. Lines of Poynting flux which pass through this disk are deflected so as to strike the tiny resonant absorber. For high-Q absorbers at very long EM wavelengths, the effective aperature can be enormous. In theory a loop antenna a few inches across could gather the same amount of energy as a long-wire antenna hundreds of feet wide. It's just a matter of achiving a high enough "Q" rating.</td>
<td></td>
</tr>
</tbody>
</table>

------------------------------------------------------------------------

Suggested by A. Boswell, regarding small-antenna physics:

> [LJ Chu, "Physical limitations of omni-directional antennas."](http://aip.scitation.org/doi/abs/10.1063/1.1715038) J. Appl. Phys. 19, 1163- 1175 (1948).
>
> [RC Hansen, "Fundamental limitations in antennas,"](https://ieeexplore.ieee.org/abstract/document/1456218) Proc.IEEE V69 No2 (1981.)

\

Suggested by Winfield Hill:\

> [ZB Wang "Energy flow around a small particle investigated by classical Mie theory"](https://scholar.google.com/scholar?cites=7757642966731638982) 2004 PRB V70, in [Phys Rev B](http://journals.aps.org/prb/abstract/10.1103/PhysRevB.70.035418)\
> \
> [S Papernov, "Correlations between embedded single gold nanoparticles in..."](https://scholar.google.com/scholar?cites=13173840491193629816) J App Phys V92 2002., in [J. Applied Phys](http://scitation.aip.org/content/aip/journal/jap/92/10/10.1063/%0A1.1512691)

\

### LINKS

- [N. Tesla's Power Receiver](http://amasci.com/tesla/tesceive.html)
- [Two conventional research papers on the above](http://amasci.com/tesla/dipole1.html)
- <a href="http://gerdbreitenbach.de/gallery/photon_what_is_a.pdf" rel="nofollow">What Is A Photon?</a> collected articles, OPN Trends, S1 supplement 2003 and <a href="http://web.archive.org/web/20110718000351/http://www.fen.bilkent.edu.tr/~bulutay/442-612/opn-oct03.pdf" rel="nofollow">archive.org</a>
- [Lots more links: photons](http://amasci.com/freenrg/sukdynam.html#links)
- [EM waves through a tiny hole](http://amasci.com/elect/tinyhole.html)
- [Tesla's Big Mistake?](http://amasci.com/tesla/tmistk.html)
- [More Tesla craziness...](http://amasci.com/tesla/high_voltage3.html#tfiles)

<!-- -->

<http://amasci.com/tesla/nearfld1.html>\
Created and maintained by [Bill Beaty](http://amasci.com/billb.html). Mail me at: [<img src="http://amasci.com/graphics/abc.gif" data-border="0" width="141" height="19" />](http://amasci.com/amfrm/).\

<div class="statcounter">

<a href="http://statcounter.com/shopify/" target="_blank" title="shopify stats"><img src="http://c.statcounter.com/10408414/0/00267183/0/" class="statcounter" alt="shopify stats" /></a>

</div>

[View My Stats](http://statcounter.com/p10408414/?guest=1)
