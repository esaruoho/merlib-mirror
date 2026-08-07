---
title: "Making EM waves go through a hole"
source_domain: amasci.com
source_path: elect/tinyhole.html
order: 240
reachable_from_entry: true
images: 3
internal_links: 8
extracted: 2026-08-07T05:53:14Z
extractor: site_to_paper.py (pandoc)
---

# Making EM waves go through a hole

*Source page: `elect/tinyhole.html`*

<table data-summary="nav links, google search window" width="100%" height="75">
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
<td><strong><a href="http://amasci.com/">TOP</a>  |</strong><br />
</td>
<td><strong><a href="http://amasci.com/tesla/tesceive.html">TESLA RCVR</a>  |</strong><br />
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

<table data-summary="format two columns" width="100%">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<tbody>
<tr>
<td style="text-align: left;" width="18" data-valign="top" data-summary="google ad"><pre><code>
</code></pre></td>
<td width="15"> </td>
<td data-valign="top" data-summary="main text content" width="800"><h1 id="big-waves-through-extremely-tiny-apertures-1999-w.-beaty">Big waves through extremely tiny apertures<br />
1999 W. Beaty</h1>
<strong>How can we cause EM waves to travel through a tiny hole in an infinite conducting plane?<br />
("Tiny" means "far far smaller than one wavelength.")</strong><br />
&#10;<p>I've always known one trivial answer to this question:<br />
</p>
<ul>
<li>Simply place a 1/2-wave dipole antenna on one side of the conducting plane, run wires from this antenna through the tiny hole in the plane, then place a second 1/2-wave dipole on the other side of the plane and connect the wires to it. The first antenna acts as a receiver and absorbs EM energy, which flows along the wire-pair, through the tiny hole, and drives the second antenna as a transmitter. The two antennas have essentially "focused" the Poynting-vector flux of the incoming EM waves so that it passes through the tiny hole.<br />
</li>
</ul>
<p>A naive description might read thus: "we turn the radio waves into 'electricity' and then back into radio waves." This is actually wrong. Since electrical energy in circuits is genuinely composed of e-fields and b-fields surrounding the circuit, the EM energy in the above description never actually "changes" into "electricity", instead the RF energy becomes coupled to the mobile charges within the pair of conductors, and so gains the ability to pass through a very small hole in a conductive plate. This is the physics behind waveguides such as coaxial cables, as well as ladder-lines and twisted-pair.<br />
</p>
<p>Note that, in an ideal case, there is no lower limit on how small the hole can be, but of course there are many practical limits in the real world case. At best, the two conductors could be metal nanowhiskers, and the hole be less than 5nM wide.<br />
</p>
<p>Also note: if we think in terms of photons, then the antennas are somehow guiding photons to flow THROUGH the tiny hole, rather than being reflected from the conductive plane. With the wires installed in the 5nM hole, FAR MORE photons can get through. This seems silly? However, when analyzed in terms of EM fields, it makes perfect sense. The EM energy-flows surrounding a 2-wire waveguide don't much care if the wires are spaced closely or wide, or if they pass through a tiny hole in a conductive plate. 60Hz AC cord can pass through a 1cm hole, even though 60Hz has a quarter-wavelength of 125,000,000 centimeters. The photons which make up those optical-frequency EM fields around the wires will happily seek out the tiny hole and flow right through with no problem, regardless of their wavelength.<br />
</p>
<hr />
Here's a second answer to the original question.
<ul>
<li>To allow EM waves to pass through the tiny hole in the infinite conductive plate, just place some molecules in the hole, but choose molecules which are resonant at the frequency of the EM waves. Suppose the EM waves are microwaves, and their frequency is at the ammonia resonance (think "ammonia maser"). If we place some ammonia molecules in that tiny hole, the molecules will strongly absorb the incoming radiation, then they will re-radiate it. Part will be scattered backwards, but part will move forwards through the hole. Like the dipole antennas and tiny wires, the presence of those ammonia molecules has allowed the EM radiation to pass through the hole.</li>
</ul>
<br />
&#10;<p>The presence of the molecule can make a big difference. Suppose we make our hole somewhat larger than a single ammonia molecule. Without that molecule present, the amount of EM wave energy which passes through such a tiny hole will be vanishingly small. However, with the molecule placed into the hole, relatively enormous amounts of EM power suddenly can get through.<br />
</p>
<p>OK, here's a third option which doesn't involve molecules.<br />
</p>
<ul>
<li>Place a very small <a href="http://amasci.com/tesla/tesceive.html">lossless loop antenna</a> in the hole, and connect it to a capacitor. Tune the LC circuit to resonate at the frequency of the incoming waves. The loop antenna will build up a very large alternating current at the resonant frequency. It will re-radiate EM waves, with part of the energy scattering backwards through the hole, but part being radiated out the other side. The presence of the tuned circuit in the tiny hole has allowed EM waves to pass through the hole.</li>
</ul>
Again note that there is no theoretical limit on how small the hole can be. Obviously any PRACTICAL applications will have many limits, but I'm not talking about practical issues here, I'm talking "physics homework questions" and "thought experiments."<br />
&#10;<p>Also note that the above loop-antenna and LC tank-circuit acts as a macroscopic analogy for a molecular or an atomic oscillator.<br />
</p>
<p>ODDITIES: <a href="http://amasci.com/tesla/nearfld1.html">Electrically-small antennas</a> absorbing large EM waves<br />
</p>
<p>If the <a href="https://groups.google.com/forum/?hl=en#!searchin/sci.electronics.design/$20Energy-sucking$20radio$20antennas!$20%7Csort:relevance">"energy sucking" controversy</a> is any guide, then one or two people will read this and say "cool", while a huge number of others will become enraged and launch personal attacks. This message is aimed at those one or two people who actually ENJOY thinking. Those who become angry and descend into ridicule can fight with each other this time, since I'm going treat their offensive behavior as it deserves, and recoil in revulsion.<br />
</p>
<blockquote>
<em>"I know that most men, including those at ease with problems of the greatest complexity, can seldom accept even the simplest and most obvious truth if it be such as would oblige them to admit the falsity of conclusions which they have delighted in explaining to colleagues, which they have proudly taught to others, and which they have woven, thread by thread, into the fabric of their lives."</em> -Tolstoy<br />
&#10;</blockquote>
<pre><code>
-
&#10;(((((((((((((((((( ( (  (   (    (O)    )   )  ) ) )))))))))))))))))))
William J. Beaty                            SCIENCE HOBBYIST website
                            http://amasci.com/
EE/programmer/sci-exhibits   amateur science, hobby projects, sci fair
Seattle, WA                  unusual phenomena, tesla coils, weird sci</code></pre>
<br />
</td>
<td></td>
</tr>
</tbody>
</table>

\

<http://amasci.com/elect/tinyhole.html>\
Created and maintained by [Bill Beaty](http://amasci.com/billb.html). Mail me at: [<img src="http://amasci.com/graphics/abc.gif" data-border="0" width="141" height="19" />](http://amasci.com/amfrm/).\
\

<div class="statcounter">

<a href="http://statcounter.com/shopify/" target="_blank" title="shopify stats"><img src="http://c.statcounter.com/10408414/0/00267183/0/" class="statcounter" alt="shopify stats" /></a>

</div>

[View My Stats](http://statcounter.com/p10408414/?guest=1)
