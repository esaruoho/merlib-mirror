---
title: "VISIBLE ELECTRIC CURRENT: device construction"
source_domain: amasci.com
source_path: viselect/vistxt.html
order: 352
reachable_from_entry: true
images: 5
internal_links: 8
extracted: 2026-08-07T05:53:22Z
extractor: site_to_paper.py (pandoc)
---

# VISIBLE ELECTRIC CURRENT: device construction

*Source page: `viselect/vistxt.html`*

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
<td><a href="http://amasci.com/viselect/viselect.html">BACK</a>  |<br />
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
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<tbody>
<tr>
<td data-summary="spacer" width="15"> </td>
<td data-valign="top" data-summary="main text content" width="800"><h1 id="visual-electricity-william-j.-beaty-62895">VISUAL ELECTRICITY<br />
William J. Beaty<br />
6/28/95</h1>
<p>While working on an Electricity/Electronics exhibit for the Museum of Science in Boston I discovered a number of serious problems in attempting to explain simple electricity. One problem was the obscure way that exhibit devices typically present electrical effects: by using meters. Ammeters and voltsmeters, with large moving needles, or worse, with LED display numerals. Unfortunately, some advanced student skills are required to interpret meter,readings, and to somehow imagine the invisible events they imply.<br />
</p>
<p>Exhibit designers who are familiar with electronics sometimes fall into the trap believing that the general public also has their own same advanced skills. And so designers often include all sorts of digital and needle-meters as part of a physics display. But a skilled electronics specialist sees a meter needle in quite a different way than does the general public. Meter readings usually serve more to obscure and complex-ify the exhibit, than to reveal and enlighten. Think about it: if an exhibit makes you feel stupid, will you end up <em>liking</em> science? No. The opposite occurs.<br />
</p>
<p>A second problem: nearly all of the electricity explanations I found in children's science textbooks were flagrently wrong, so I couldn't use these textbooks as a guide for explaining electricity at a simple level. Go <a href="http://amasci.com/miscon/elect.html">here</a> for more about this.<br />
</p>
<p>And third, as an electrical engineer I'd attained a gut-level feel for the math behind electronics, yet my entire non-math picture of electricity was mostly based on the incorrect explanations I'd learned in old K-6 textbooks. As a designer, I'd been exclusively living in a world of electronics math, never realizing that my incorrect verbal and visual explanations for electrical phenomena were totally incompatible with the mathematical description. My verbal and visual explanations were WRONG. But so long as I stuck with engineering, using design equations and CAD software, I was fine. but if I tried to employ any non-math concepts to educate others about electrical physics, I would be spreading misinformation.<br />
</p>
<table width="100%">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td width="330"><img src="http://amasci.com/viselect/arbvis.jpg" style="width:100.0%" alt="[generator in series with supercapacitor and visielect device]" /><br />
&#10;Product version (Arbor Science)</td>
<td></td>
</tr>
</tbody>
</table>
<br />
&#10;<p><a href="http://amasci.com/viselect/viselect.html">Visible Electricity</a><br />
</p>
<p>The device depicted here was my best shot at a solution. It's an interactive realtime simulation of the behavior of charges within a wire. Rather than explaining anything, instead it simply makes the electric charges visible, so museum visitors can play with them. The motion of its pattern of lights follows the actual motion of charges in the wires, and when the device is connected into a real functional electrical circuit, it provides a window on the true nature of "electricity." If all the individual conductors in a complex schematic were replaced by a number of these devices, the operation of a complicated electrical device can be directly observed and intuitively understood.<br />
</p>
<p>"Visual Electricity" is simply an amp-meter having a "chaselight" circuit as a readout device.<br />
</p>
<p>A Chaselight is identical to a movie marquee lightbulb border, with a pattern of on and off lights which advance along and simulate motion. The input terminals of my device are physically placed near the ends of a row of LEDs, and electric current passing between the terminals is measured and used to drive some logic circuitry. The current being measured does not drive the LEDs directly of course. The logic circuitry lights every fourth LED, and by advancing this pattern of LEDs, a row of glowing "electrons" can be made to flow along. The direction and speed of chaselight action is proportional to the direction and amperage of electric current inside the wire. To the observer this device behaves as a wire which contains large, visible, movable electrons.<br />
</p>
<table width="100%">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td width="760"><a href="http://amasci.com/viselect/schem1.gif"><img src="http://amasci.com/viselect/schem1.gif" style="width:100.0%" alt="[Schematic]" /></a><br />
</td>
<td></td>
</tr>
</tbody>
</table>
<br />
&#10;<h3 id="schematic">SCHEMATIC</h3>
The input to the device is a standard current-meter circuit: a low-value sampling resistor connected to an opamp. The voltage from this first stage is adjusted in amplitude and zero-level by the next stage. The signal is then applied to a precision rectifier circuit which outputs a fullwave signal and a polarity signal. The polarity signal is level-shifted and is used to control the fwd/rev direction of a shift register. The fullwave signal is applied to a Voltage-to-Frequency (V/F) converter whose output is used to drive the clock of the shift register. The four outputs of the shift register are buffered and applied to four interleaved strings of LEDs.<br />
&#10;<h3 id="operation">OPERATION</h3>
When a small positive current is applied via the input terminals, the opamps drive the V/F converter at a pulse frequency proportional to the amperage, the shift register begins advancing, and the pattern of lights starts moving slowly along the row of LEDs. If the current is doubled, the frequency doubles and the pattern "flows" twice as fast. If the direction of current is reversed, the polarity signal changes state, the shift register starts decrementing, and the LED pattern flows in the opposite direction. If a very slow (1 Hz) sine wave is applied to the input, the LED pattern will swerve back and forth, just like the charges actually do within the wire.<br />
&#10;<p>The above device is a wire with visible electrons. It also is an electric current microscope, since it greatly amplifies the speed of electron motion which occurs in wires. Contrary to popular belief, electric current is a very slow flow of electric charge. At normal densities of electric current, electrons move at speeds on the order of inches per hour, like the minute hand on a clock. Even if individual electrons could be seen by human eyes, their flowing motion would be invisible because it's just too slow. Visual Electricity depicts this motion several thousand times faster than it actually is.<br />
</p>
<p>The whole circuit could be made cheap and simple through use of a single chip microcomputer having a A/D input, such as PIC16C7x. Right now the price is very high. If the sales volume went up, I could change over to SMT packages and automatic production; maybe get the production price down below $10 each, so each student could have one, as opposed to a single expensive device for one classroom as things stand now.<br />
</p>
<p>The next advancement is to make the LED pattern stop jumping. Electrons in wires don't jump (they behave more like water molecules; moving along smoothly but also jittering around with thermal/quantum vibrations.) Also, one common misconception involves the (wrong) idea that electrons jump from atom to atom. So I need to get rid of the jumping. Add a PWM cross-fader algorithm, so the light pattern moves smoothly from LED to LED without jumping.<br />
</p>
<p>A further advancement is to add a "visible voltage" function. This could be done through use of red/green LEDs, by measuring the voltage on the input terminals with respect to a third "ground" terminal connected to conductive rubber legs, then driving the R/G LEDs with a pulse-width modulated signal. If Visual Electricity as a "wire" is then connected to a positive voltage source, the display turns red. If negative, it turns green. If disconnected, it could either maintain an "electrostatic charge" like a real wire and remain at its last color, or it could turn yellow (50-50 red/green). The voltage and current on a single wire could then be displayed simultaneously with "electrons" which change color, flow along, or both. A square wave voltage signal would be a red/green flashing. A sine wave signal would change smoothly: red/yellow/green and back again.<br />
</p>
<p>- Bill Beaty, 6/28/95<br />
</p>
<hr />
<pre><code>
&#10;
Brief history:
&#10;1987  Brainstorm!   While on a trip to Exploratorium in California, I 
      realize that their displays with current meters could be replaced 
      with schematics having &quot;chaselight&quot; LEDs, with current probes to 
      move the LED-pattern proportional to the actual speed of electrons.
&#10;1988  I design an etch PCBs as &quot;chaselight&quot; current meters, and build a
      temporary exhibit: a motor-generator pair with green LED chaselights
      to indicate the electron-flow as one crank or the other is turned.
      I want to build a microprocessor version but don&#39;t know assembler
      language for the MC68705.  I also want to build a version with 
      rd/grn LEDs controlled by conductor voltage (with some sort of 
      reference conductor, perhaps use metal magnets on the bottom and 
      stick them to a metal board mounted on the wall.)
&#10;1989  Chaselight meters are built into two exhibits in the VandeGraaff
      Hall at Museum of Science (this just after I moved to Seattle.) 
&#10;1990  At Dinamation Inc., I demonstrate the device to the company pres.
      I imagine building a hall-effect current sensor or clamp-on probe, 
      so the LEDs will flow in the correct direction regardless of which 
      way the physical device is oriented.
&#10;1992  I etch a long thin two-PCB version using bar-graph LED modules and
      rechargable batteries.  TEKNOS Inc. sells a set of ten &quot;chaselight
      current meters&quot; to LLNL (or was it LANL?), delivered Jan/93.
&#10;1993  Arbor Scientific produces a less expensive version in a plastic tube 
      using discrete LEDs and 9V battery, advertised in their &#39;94 catalog.
&#10;1994  I learn assembler for MC68705 and microchip PIC, but *still* haven&#39;t
      got off my butt to build a one-chip version or a red/green version.
&#10;1995  I start a webpage; upload my schematics and PCBs so anyone can
      build the device.
&#10;?1996? Arbor Scientific starts a website store, so finally teachers on 
      internet can buy my invention.
&#10;2004  I talk with D. Durlach, who uses the electric current chaselight 
      idea in an exhibit for science musuem New York Hall of Science.
&#10;2005  Completely independantly, Kamata and Hara of Tokyo Gakugei University 
      invent a much improved color-changing version with voltage/current 
      sensing, based on a PIC microprocessor.  See:
      https://iopscience.iop.org/article/10.1088/0031-9120/40/2/005/meta
</code></pre>
<div data-summary="google ad" style="width:310px;height:290px;margin-left:10px;margin-top:30px;float:right;">
&#10;</div></td>
<td width="15"></td>
<td data-summary="google ad" data-valign="top"><pre><code></code></pre>
MORE PAGES HERE:<br />
&#10;<u></u></td>
<td></td>
</tr>
</tbody>
</table>

\

\

<div summary="google ad" style="width:200px;height:350px;margin-left:3px;margin-top:1px;float:right;">

[](http://www.lateralscience.co.uk/glitch/)

\
VICTORIAN\
SCIENTI - FICTION!!!\
<img src="http://amasci.com/graphics/eglitch.jpg" data-align="right" />\
(Natural philoso-fiction?)

</div>

|     |     |
|:---:|-----|
|     |     |

<http://amasci.com/viselect/vistxt.html>\
Created and maintained by [Bill Beaty](http://amasci.com/billb.html).\
Mail me at: [<img src="http://amasci.com/graphics/abc.gif" data-border="0" width="141" height="19" alt="[my email address is my website addr preceded by billb atsign]" />](http://amasci.com/amfrm/).\

<div class="statcounter">

<a href="http://statcounter.com/shopify/" target="_blank" title="shopify stats"><img src="http://c.statcounter.com/10408414/0/00267183/0/" class="statcounter" alt="shopify stats" /></a>

</div>

[View My Stats](http://statcounter.com/p10408414/?guest=1)
