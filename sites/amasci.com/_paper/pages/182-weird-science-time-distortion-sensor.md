---
title: "Weird Science: time distortion sensor"
source_domain: amasci.com
source_path: freenrg/timeflo1.html
order: 182
reachable_from_entry: true
images: 2
internal_links: 9
extracted: 2026-08-07T05:53:10Z
extractor: site_to_paper.py (pandoc)
---

# Weird Science: time distortion sensor

*Source page: `freenrg/timeflo1.html`*

<table data-summary="nav links, google search window" width="100%">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td><table data-cellpadding="5" data-summary="Navigation links">
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<tbody>
<tr>
<td><strong><a href="http://amasci.com/weird/const.html">WEIRD DEVICES</a>  |</strong><br />
</td>
<td><strong><a href="http://amasci.com/weird/oddsensor.html">ODD SENSORS LIST</a>  |</strong><br />
</td>
<td><strong><a href="http://amasci.com/freenrg/tors">TORSION</a>  |</strong><br />
</td>
<td><strong><a href="http://amasci.com/news.html">NEW STUFF</a>  |</strong><br />
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

<table data-summary="main text content" width="100%">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr data-valign="top">
<td width="15" data-summary="spacer"></td>
<td width="800"><h1 id="simple-time-distortion-detector-51997---william-j.-beaty">SIMPLE TIME-DISTORTION DETECTOR<br />
5/1997 - William J. Beaty</h1>
<h3 id="other-links">OTHER LINKS:</h3>
<ul>
<li><a href="http://amasci.com/freenrg/bindet.html">W. Smith "Binding Force Anomaly Detector"</a>, Bill B's version</li>
<li><a href="http://jnaudin.free.fr/html/tsd.htm" rel="nofollow">Time Shift Detector</a> J L Naudin's 1999 replication of the following article</li>
<li><a href="http://amasci.com/weird/xtal10m.txt">PTS-40 NMR Xtal oven 10MHz</a>, Vectron labs, pinout</li>
<li>For Sale, <a href="http://www.intalek.com/Index/Projects/SmartSPOT/SmartSPOT.htm" rel="nofollow">Intalek</a> detector, Accutron tuning-fork watch, $1000</li>
</ul>
<blockquote>
BOOK: <a href="http://www.amazon.com/exec/obidos/ISBN%3D0930808045/sciencehobbyist/" rel="nofollow">Gravitational Mystery Spots</a>, Vogt, 1996 PPBK pp82 Mr. Vogt <a href="http://web.archive.org/web/20010110003100/http://www.wolfe.net/~archive/gravity.html" rel="nofollow">performs oscillator-comparison tests</a> at many "Gravity Hills" and discovered a small effect at the Oregon Vortex, and at the Santa Cruz Mystery Spot in CA.
</blockquote>
<p>Several inventions in the "fringe" sciences have been claimed to locally distort the speed of light or the "flow" of time. One way to detect this phenomena would be to directly observe optical distortion of images of the surroundings of an operating device, use a "Schelerien" or "foucault mirror test" optical system to observe small light deflections. Another method would be to make a long "optical lever" and look for deflections of a laser beam. However, what if the effect is real, but is far too weak to detect by this method?<br />
</p>
<p>Here's a simple yet sensitive way to sense possible local changes in the flow of time. Build two crystal oscillators. Use one as a reference, the other as a probe. Beat the output of the oscillators together and measure the difference frequency, or even listen to it via a loudspeaker. Place the reference in a distant location, then use the probe to examine the environment surrounding a purported "weird device." (A Cheops pyramid model would qualify as a "weird device".) Local changes in time will be revealed as changes in the beat note. The size of the affected area could be investigated by changing the distance between oscillators. (Note: I have NOT tested any "weird devices" yet, I make no guarantees of positive results!) (Another note: unexplained changes to the binding force of quartz would also be detected as changes to "time flow.")<br />
</p>
<p>In 1993 I put together a crude version of this device based upon a CD4049 CMOS inverter and a couple of 32KHz digital watch crystals.(1) Initial tests revealed a small problem: when adjusted to produce a beat note, the crystals would lock together in synch. Constructing two oscillators on separate inverter chips did not eliminate the effect. Power supply coupling seemed to be the problem. Two separate power supplies helped, but coupling between the oscillator outputs still caused phase-lock. Use of two separate LM78L05 regulators, buffering the oscillator outputs, and building them on two separate CD4049 chips cured the problem.<br />
</p>
<p>To "bend" the frequency of one crystal in order to syncronize them, one method is to vary the power supply voltage. Another way is to vary the bias point of the input pin of the CMOS inverter. I didn't explore this enough, but I intended to use those LM317 adjustable regulators in TO-92 packages to trim the frequency of each oscillator.<br />
</p>
<p>Yes, just as you'd expect, these crystals are temperature sensitive. Blowing warm breath on them throws the frequency way off. Just the IR radiation of your body seems to have a small effect, which would be a large effect if you use 50MHz crystals. And so you'll have to build a "crystal oven" for each oscillator circuit if you intend to build a real instrument. I've not tried this, but I would put the whole CMOS chip and crystal in a small metal can, and include a positive temp-co thermistor as a combination heater/thermostat. A PTC thermistor tends to self heat and settle to a particular temperature where changes in temperature cause negative feedback changes in resistance, which maintain constant temperature even if the outside environment's temperature changes.<br />
</p>
<p>Later, after playing with the 32KHZ crystals, I found a box of surplus 30MHz 5-volt oscillators. These appear as low profile 1cm x 2cm shielded "cans" intended to go onto processor circuit boards. They are buffered and contain some supply regulation, so they don't tend to phase-lock when mounted near each other. Most suprising, I found that out of ten oscillator cans, one pair's frequencies matched within a few Hz! These oscillator cans seem to have some temperature compensation, but they still require a constant-temperature enclosure to minimize errors from temperature differential between "probe" and "reference" oscillator.<br />
</p>
<p>To display the difference frequency, I used one oscillator to trigger an oscilloscope, and displayed the output of the other on the scope. When adjusted for identical frequencies, the oscillators produce a static square wave on the scope. Small changes in either oscillator frequency causes the square wave to begin drifting. Other possible display methods: set the difference freq to a few hundred Hz, add the outputs through a diode or and-gate, and listen to them with an audio amp and headphones. Another: apply the square waves to the Clock and Data inputs of a "D" flipflop, connect the output to an LED, then adjust for zero beat. The LED will flash slowly as the phase of oscillators drift. Another method (from an 'aha!' or 'Duh!' realization,) is to use the reference crystal in a commercial frequency counter and simply measure the "probe" crystal's frequency! No separate reference oscillator need be built. The counter's numeric output should stay stable unless something causes either the counter's internal crystal or the "probe's" crystal frequency to change. Doh! [Later note: a 100MHz crystal, if beating against a second one, is moving the display of your freq-counter up by nine digits! Then, even if your counter only has a few-digits display, still its resolution is less than parts-per-billion. Unless your freq-counter has ten display digits, the 2-crystals beat-freq technique gives far more sensitivity than simply measuring the oscillator.]<br />
</p>
<p>My actual device? As usual I didn't get past the breadboard stage, and have yet to use it to look for changes in time flow around a "free energy" device, or meditating person, or pyramid model. There didn't seem to be any unexplained time flow variations around my test bench at work. Proximity to a human being (aura?) had no easily detected effect. And if psychokinesis can alter quartz crystal frequencies, the circuit shows that I personally have no fantastic abilities along those lines! ;)<br />
</p>
<hr />
<blockquote>
<p>(1) An oscillator crystal is typically a thin quartz disk with electrodes plated on each surface, and they range in frequency from about 200KHz to tens of MHz. However, 32KHz digital watch crystals have an entirely different structure. They're a small "tuning fork" about 4mm long and and 1mm across, with thin electrodes plated onto the tines of the fork. This gives interesting possibilities. If you open the crystal's metal enclosure, you can immerse the crystal in gases of various densities, and this should affect the frequency. Maybe make a CO2 or mercury vapor detector, or a pressure sensor? If you reflect a laser off the tines, the beam should be scanned back and forth at the crystal's frequency. Rotation of the crystal should produce tiny frequency deviations, so these crystals could possibly be used to construct some sort of gyroscopic rotation detector. The crystals produce ultrasound (they really *are* tuning forks, after all) and perhaps this effect can be used. Try them as cheap microphones, and build large grids of them for a sound camera image sensor? If two bare crystals are held near each other, they probably will lock in synch through audio coupling. If one crystal is held near a moving object while oscillating, there will probably be voltage changes because of sound echoes from the object's moving surface.<br />
</p>
<blockquote>
&#10;</blockquote>
</blockquote></td>
<td></td>
</tr>
</tbody>
</table>

------------------------------------------------------------------------

<http://amasci.com/freenrg/timeflo1.html>\
Created and maintained by [Bill Beaty](http://amasci.com/billb.html). Mail me at: [<img src="http://amasci.com/graphics/abc.gif" data-border="0" width="141" height="19" />](http://amasci.com/amfrm/).\

<div class="statcounter">

<a href="http://statcounter.com/shopify/" target="_blank" title="shopify stats"><img src="http://c.statcounter.com/10408414/0/00267183/0/" class="statcounter" alt="shopify stats" /></a>

</div>

[View My Stats](http://statcounter.com/p10408414/?guest=1)
