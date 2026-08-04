---
title: "SCIENCE HOBBYIST: how transistors work, an alternate viewpoint"
source_domain: amasci.com
source_path: amateur/trshort.html
order: 209
reachable_from_entry: true
images: 2
internal_links: 9
extracted: 2026-08-03T18:11:39Z
extractor: site_to_paper.py (pandoc)
---

# SCIENCE HOBBYIST: how transistors work, an alternate viewpoint

*Source page: `amateur/trshort.html`*

<table data-summary="site nav" width="100%" height="75">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr data-valign="top">
<td><table data-cellpadding="5" data-summary="Navigation links">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<tbody>
<tr>
<td><a href="http://amasci.com/amateur/transis.html">MAIN TRANSISTOR ARTICLE</a></td>
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

<table data-summary="main text" width="100%">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<tbody>
<tr>
<td data-bgcolor="#FFF0E8" width="170" data-summary="google ad" data-valign="top"><pre><code>
&#10;
&#10;
&#10;
</code></pre>
<pre><code>
&#10;</code></pre></td>
<td data-summary="spacer" width="15"> </td>
<td data-summary="transistor article" data-valign="top" width="800"><h1 id="how-do-bipolar-transistors-work-2003-william-j.-beaty">How Do Bipolar Transistors Work?<br />
©2003 William J. Beaty</h1>
<strong>EXCESSIVELY SHORT VERSION</strong><br />
&#10;<blockquote>
<p>A transistor is essentially a diode. In diodes, the rate of charge flow is determined by the height of the potential barrier at the junction. It's voltage controlled: place the right polarity of voltage across the diode terminals to turn it on. But a transistor a very weird diode: if you turn it on with 0.7V placed across two terminals here, then the main diode current goes through a totally <em>different</em> terminal over there! Vbe determines Ic (as well as Ib.) When Bell Labs had an informal contest to name their new invention, one engineer pointed out that it acts like a resistor, but a resistor where the input voltage is transferred across the device to control the resulting current. A "Transfer Resistor" or "Trans-sistor."<br />
</p>
<p>ALSO:<br />
  - <a href="http://amasci.com/amateur/cap1.html">How capacitors REALLY work</a><br />
  - <a href="http://amasci.com/ele-edu.html">How electricity really works</a> articles index<br />
</p>
</blockquote>
<br />
&#10;<hr />
<h3 id="longer-more-detailed-short-version...">LONGER, MORE DETAILED SHORT VERSION...</h3>
- Seen from outside, Bipolar Transistors look like current amplifiers. Engineers and technicians can treat transistors as if they are current amplifiers. That's fine as long as we're viewing the transistor as a sealed 3-wire component: a small black box. But inside, transistors are actually voltage amplifiers. (Most non-physics books get this wrong.) In fact, transistors are like diodes: they're voltage-controlled insulators. [Those who disagree can start by investigating the physics behind the Ebers-Moll and Gummel-Poon models, or by referring to Horowitz &amp; Hill's book THE ART OF ELECTRONICS, or even see what author <a href="http://en.wikipedia.org/wiki/Talk:Bipolar_junction_transistor/Archive_1#Winfield_Hills_Response" rel="nofollow">W. Win Hill himself says when people insist that BJTs are "current controlled."</a> Here's some <a href="http://cr4.globalspec.com/comment/720033/Re-Voltage-vs-Current" rel="nofollow">more Win Hill on CR4 forum</a>, and even <a href="http://cr4.globalspec.com/comment/720374/Re-Voltage-vs-Current" rel="nofollow">more</a>. And his <a href="http://books.google.com/books?id=bkOMDgwFA28C&amp;printsec=frontcover#v=onepage&amp;q&amp;f=false" rel="nofollow">textbook AOE</a>, partial preview on google books.<br />
&#10;<p>- Overall, bipolar transistors act like a thin layer of insulator. The thickness of the insulating layer can be electrically altered in order to control electric current. It's like closing a switch: if we make the insulator between the switch contacts thin enough, the transistor turns "on." Make it slightly thicker, and the transistor turns partially on.<br />
</p>
<p>- A bipolar transistor is like three hunks of silicon in a row. Usually it's NPN; two hunks of n-type separated by a hunk of p-type. Doped silicon is a good conductor. At the places where the n-type silicon is touching the p-type, a very thin layer of insulator spontaneously appears. Because the three hunks of silicon are normally separated by these insulating layers, an unpowered transistor starts out in the "turned off" state.<br />
</p>
<p>- In the three hunks of silicon, the center region is called the "Base." One of the side regions is called the "Emitter." By applying a small voltage between Base and Emitter, we can make the thin layer of insulator become even thinner. If it's thin enough, it stops insulating, and some charges flow across it. (Imagine bringing two wires closer and closer until the electrons start jumping across the microscopic gap.)<br />
</p>
<p>- The transistor's Base/Emitter voltage controls the insulator thickness. This insulator then controls the whole transistor. A large Base/Emitter voltage will shrink the insulating region and turn the transistor on. A smaller voltage can turn the transistor half-way on, and this gives us linear amplifying action rather than just purely on-off switching.<br />
</p>
<p>- But a transistor is not a simple diode! Exactly. There's a the third hunk of silicon (the hunk called the "Collector.") And another insulating layer appears between Base and Collector. Since it doesn't block the charges coming from the Base, is it even an insulator? It acts just like an insulating vacuum; it doesn't block charges, but it's insulating because it contains no charges of its own. However, the Base-Collector insulator layer does keep the other sections from seeing any effects of the large power supply voltage placed between Collector and Base. Whether the Collector voltage is low or high, we get the same amperage through that insulating layer. Therefore the Base acts as if it is being shielded from the Collector. Yet charges flow right through the insulating region, going from Emitter through Base and into Collector. Therefore the Collector acts as if it's NOT insulated from the Base. Which is it? Both!<br />
</p>
<p>- Why do transistors act as amplifiers? That's simple to explain: <em>all valves</em> are amplifiers. Water valves, air valves, and vacuum tubes are amplifiers. Carbon microphones are amplifiers (paired with a loudspeaker, the carbon microphone was the first audio amp, and was placed in long distance telephone lines. Thomas Edison made big bucks!) It takes very little energy to open or close a valve, yet this tiny energy controls huge pressures and huge flows. A transistor is like a valve, a valve where a tiny change in voltage can open or close the large valve by different amounts. A small amount of "signal" energy causes the transistor to control the large current which is pumped by a battery. The shape of the output waveform is the same as the shape of the input waveform. We usually say that the signal has been "amplified," when really it has been created from the battery's energy. And if battery voltage stays the same, then any changes in charge flow are changes in the output energy flow. Wattage. Small watts in, big watts out. That's what amplifiers are all about. But any valve can do this.<br />
</p>
<p>- Most transistors are Silicon, and Silicon junctions "turn on" at around 0.4V to 0.8V. Place half a volt on the Base of a transistor and the transistor barely starts turning on.<br />
</p>
<p>- But why do so many books say "Transistors Amplify Current?" Because it's an incredibly useful rule of thumb. It's part of a mental model which treats transistors as black boxes. The base current can be used to determine the BE voltage, and the BE voltage then sets the collector current's value. As long as we don't look inside the black box, we can pretend that the charges injected into the base are directly affecting the collector current. But some misguided authors go farther, they try to use current-amplification to explain the stuff inside the box. Those authors are ignoring the role played by the Emitter depletion layer, and ignoring the role played by Vbe. They are confused by the leakage current going through the Base wire. Yes, the Base/Emitter voltage controls the thickness of the insulating region and thus controls the main transistor current. But also a tiny bit of charge leaks through the Base connection. It SEEMS like this leakage can directly collide against the collector's flowing charges.<br />
</p>
<p>- It just so happens that the tiny leakage current in the Base connection is proportional to the transistor's main Emitter/Collector current. (This makes perfect sense, since both the Base leakage current and the main Emitter/Collector current are controlled by the insulator thickness, which is set by the Base/Emitter voltage.) ...so it SEEMS as though the Collector current is directly controlled by the Base current. You can even simplify things by pretending that this is true. But in reality, Base current communicates with Collector current via changes in Base-Emitter voltage. It's the Base/Emitter voltage which runs things. You'll never understand "transistor action" and the simple physics inside the box if you think that Base current directly controls the Collector current. It doesn't. The control is there, of course, but it's one stage separated.<br />
</p>
<p>- A bipolar transistor has a voltage-controlled input, while it's output is a variable control system which creates a constant current. It's vaguely like a resistor, but where the voltage in one place creates a current in a second place ...yet the voltage in that second place does not affect the output current. Change the collector voltage, and the collector current remains relatively constant. It's not like a transformer where volts and current are swapped, and where wattage stays the same. In transistors, the effects of voltage are TRANSFERRED to another separate path in the circuitry. "Transfer Resistor." Transistor.<br />
</p>
<p><a href="http://amasci.com/amateur/transis.html">MAIN, MUCH LONGER ARTICLE</a><br />
</p>
<p>SEE ALSO:<br />
<br />
  - <a href="http://amasci.com/emotor/cap1.html">How capacitors REALLY work</a><br />
<br />
  - <a href="http://amasci.com/ele-edu.html">How electricity really works</a> articles index<br />
</p></td>
<td> </td>
</tr>
</tbody>
</table>

<http://amasci.com/amateur/trshort.html>\
Created and maintained by [Bill Beaty](http://amasci.com/billb.html). Mail me at: [<img src="http://amasci.com/graphics/abc.gif" data-border="0" width="141" height="19" />](http://amasci.com/amfrm/).\

<div class="statcounter">

<a href="http://statcounter.com/shopify/" target="_blank" title="shopify stats"><img src="http://c.statcounter.com/10408414/0/00267183/0/" class="statcounter" alt="shopify stats" /></a>

</div>

[View My Stats](http://statcounter.com/p10408414/?guest=1)
