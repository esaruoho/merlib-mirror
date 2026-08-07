---
title: "MAGLEV MAGNETIC LEVITATION: CIRCUIT SCHEMATIC"
source_domain: amasci.com
source_path: maglev/magschem.html
order: 76
reachable_from_entry: true
images: 3
internal_links: 13
extracted: 2026-08-07T17:04:21Z
extractor: site_to_paper.py (pandoc)
---

# MAGLEV MAGNETIC LEVITATION: CIRCUIT SCHEMATIC

*Source page: `maglev/magschem.html`*

<table height="77" data-summary="nav links, google search window" width="100%">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td data-summary="nav"><table data-cellpadding="4" data-summary="Navigation links">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<tbody>
<tr>
<td><a href="http://amasci.com/maglev/maglev.html">MAGLEV</a><br />
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

<table data-summary="main text content" width="100%">
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<tbody>
<tr>
<td style="text-align: left;" width="18" data-summary="google ad" data-valign="top"></td>
<td data-summary="maglev article" width="700"><h2 id="magnetic-levitation-device-duplicates-superconductive-levitation-w.-beaty-1994">MAGNETIC LEVITATION DEVICE<br />
Duplicates superconductive levitation<br />
W. Beaty 1994</h2>
<br />
&#10;MAGLEV CRADLE ARTICLE:   <a href="http://amasci.com/maglev/">Page 1</a>  | <a href="http://amasci.com/maglev/levgif.html">Page 2</a>  | Page 3  | <a href="http://amasci.com/maglev/hall.html">Page 4</a><br />
&#10;<table data-border="" width="100%">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td></td>
<td width="434"><a href="http://amasci.com/maglev/magschem.gif"><img src="http://amasci.com/maglev/magschem.gif" style="width:100.0%" data-hspace="10" data-vspace="10" alt="[Schematic: Hall sensor drives NPN which drives power stage which drives coil which affects Hall sensor.]" /></a><br />
Above: null-coil circuit, a room-temperature superconductor<br />
created by active negative feedback.</td>
<td></td>
</tr>
</tbody>
</table>
<h2 id="parts">Parts:</h2>
<h3 id="hall-effect-field-sensor">Hall-effect field sensor</h3>
Here's the schematic of the device depicted in the <a href="http://amasci.com/maglev/levgif.html">photo.</a> Each of the ten coil-assemblies has its own copy of the above circuit. The SS41 is a Microswitch <a href="http://amasci.com/maglev/hall.html">Hall Effect magnetic field sensor IC</a> that I found in <a href="http://amasci.com/suppliers.html#rd">Surplus</a> catalog for $.50 each. Any similar hall IC should work, as long as it is fairly sensitive and is magnetically bipolar. No need for expensive analog or ratiometric versions. Just use PWM and logic-switching. <a href="http://www.allcorp.com/" rel="nofollow">All Electronics</a> currently has one for $.50, HESW-5, but it is a surface-mount package with tiny, hard-to-solder leads. The professional supplier for hall-effect devices is <a href="http://www.allegromicro.com" rel="nofollow">Allegro Micro</a>. They probably have a minimum $$ for mail order though. Here are some common <a href="http://amasci.com/maglev/hall.html">Hall</a> effect magnetic field sensors. Also, page down to <a href="http://amasci.com/maglev/magschem.html#hal1">here.</a><br />
&#10;<h3 id="coil">Coil</h3>
Each electromagnet coil was from a 24V DC solenoid, and I used steel 1/4-20 bolts as "iron cores" for the coils, threading the two rows of bolts into rows of holes drilled into two 1" x 1/4" x 10" iron bars. I cut the heads off the bolts and cut them so they were about an inch longer than the coils. The coils' resistance were 80ohms each, which gives about 6watts per coil when turned fully on at 24v (but normally the current is not stuck at the max. value.) A 12-volt system should be easier to build since 12V power supplies are more common than 24v, and lower voltage transistors are cheaper. Pick a solenoid coil from a catalog or wind your own so that it draws around 6watts when powered at whatever supply voltage you decide to use. (example: at 12v, coil R should be about 20 ohms.) You'd have to be extremely lucky to find the same surplus solenoid as I did, so you're going to need to mess with the circuit to adapt it to your parts. Either that, or do a whole lot of hand-winding of coils! (To make a giant version, perhaps use thin iron hexagons or even mu-metal, and wind the wire loop around the edges?)<br />
&#10;<h3 id="power-supply">Power Supply</h3>
The power supply is "bipolar", meaning that you need TWO supplies, one pos and one neg. The coils I used needed 24 volts DC each, so my supply was +-24 (or 48 v with a center common). I could run it for short periods using eight 9v batteries ( +- 36 v). If you use 12 volt coils, you'll be able to use a more common 12V dc supply. Note for experimenters: if you always use the SAME polarity of magnet, you could get rid of one power supply, and the entire circuit becomes simple: just drive the coil with a Darlington transistor switched by the Hall chip and a pullup resistor. The maglev cradle could be built this way if the bar magnet was always inserted in the same direction (but then you could never use this as a maglev train system.)<br />
&#10;<h3 id="transistors-diodes">Transistors, diodes</h3>
My two power transistors were tiny Zetex types from DigiKey, but they were too small and ran too hot. I used small transistors because I built the entire circuit on a PCB which was laid on top of the coils (you can see these PCBs in the photograph of the levitating bar magnet.) From <a href="http://www.digikey.com" rel="nofollow">www.digikey.com</a>, they were Zetex types ZTX603 for the NPN, and ZTX705 for the PNP. The third NPN was a ZTX651. The 'flywheel' diodes were 1N4933.<br />
&#10;<p>These Zetex power transistors are tiny plastic-case types, and I found that they run fairly hot. The overheating problem would be even worse if we used a 12v solenoid with its smaller resisitance, or if we tried to levitate a larger bar magnet. If I were to build this device again, I would use TO-220 style power transistors, such as the TIP-120 series. Metal heat-sinks are probably not required for these TIP types. For example, try these:</p>
<ul>
<li>NPN Darlington: TIP120, or ECG261, or SK3180, or NTE261</li>
<li>PNP Darlington: TIP125, or ECG262, or SK3181A, or NTE262</li>
</ul>
Digi-key has the Zetex types but not the others. See <a href="http://amasci.com/supliers.html">http://amasci.com/supliers.html</a> on my site, look for Mouser, or Jameco.<br />
&#10;<h3 id="sensor-position">Sensor position</h3>
Each Hall-effect sensor is placed on the end of each steel bolt which faces the floating magnet. The position of the SS41 is important. If the coil doesn't start oscillating at a few hundred Hz, flip the Hall device over and try again. You want negative feedback and proportional control rather than positive feedback and latchup. When it is working properly, you can LISTEN to the coil while waving the end of a bar magnet near the hall sensor, and the coil will make various buzzing and squealing sounds.<br />
&#10;<p>I was able to float a 2" long by .25" diameter alnico bar magnet with as little as five coil assemblies (two under each end of the magnet and one extra assembly positioned on axis with the magnet, to stop end-to-end motion.) VERY unstable though; the levitation lasted just long enough to snap a photo before the magnet wiggled out of the coils. The 12-coil, two-rail device was better, but still unstable. Placing bulk copper or aluminum near the floating magnet (a copper rod or thick plate, or even stacks of pennies) can give E/M damping and partially prevent the wiggling motion.</p></td>
<td width="15"></td>
<td data-valign="top" data-summary="goog ad">MORE PAGES HERE:<br />
<br />
ad</td>
<td></td>
</tr>
</tbody>
</table>

<table data-summary="main text cont." data-valign="top" width="100%">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td width="800"><h3 id="how-it-works">HOW IT WORKS</h3>
When powered up, each "null coil" produces perfect magnetic shielding. Unlike copper slabs, the shielding still works all the way down to zero Hz. But the effect only works in a small spot located at each Hall sensor. We're simulating tiny bits of superconductor.<br />
&#10;<p>First the basic circuit operation: each magnetic field sensor controls the polarity of one electromagnet coil, and also the polarity of the coil affects the magnetic field sensor. This forms a feedback loop which controls the average current in the coil. When the end of the coil's iron core becomes "north", the sensor detects this and makes the current in the coil reverse direction. Then, when the end of the core tries to become "south", the sensor reverses the current again. In other words, the sensor trys to keep the magnetic field turned off! It's a feedback system which dynamically creates *zero* magnetic field. "Null coils," with active drive to produce DC shielding.<br />
</p>
<p>What good is this? A device that creates zero magnetic field? Very useful, actually. Superconductive plates also create zero field inside themselves and thereby repel both poles of a permanent magnet. That's how superconductive levitation works: a substance with zero-field is a natural repeller of magnet-poles. Therefore the above null-coil assemblies in my maglev device will repel a bar magnet's pole regardless of whether it is an N or an S pole.<br />
</p>
<p>OK, so normally the feedback is working, and the coil's polarity is rapidly changing slightly back and forth, giving a triangle or square wave with an overall average of zero field. When the N pole of a bar magnet approaches the Hall sensor, the circuit will still try to keep the field inside the Hall switch at zero. To do this, it sends a current through the coil, so now the current is more in one direction than the other, which makes the coil's magnetic pole, on the average, become "N" rather than zero, and it repels the magnet. (Alike poles repel, so the North pole on the end of the coil repels the North pole on the magnet.) The two oppositely-pointing magnetic fields cancel out to zero right between the magnet and the coil, right where the Hall sensor sits.<br />
</p>
<p>If the N pole of the bar magnet gets even closer, the Hall sensor will tell the electromagnet to repel the bar magnet even more strongly. It's somewhat like an operational amplifier, but for b-fields. The Hall sensor acts as the summing-junction, and the powered electromagnet provides a feedback-field which keeps the field zero at the sensor's location. The Hall sensor is now behaving like a little piece of superconductive material. And if instead we hold the "S" pole of the bar magnet near the sensor, the average current in the electromagnet will reverse, and the bar magnet will still be repelled. No analog amplifiers or boiling-hot transistors required. It's a negative feedback system based upon a naturally occuring square-wave oscillator and PWM Pulse-Width-Modulation. Cool, eh?<br />
</p>
<p>Before undertaking a huge maglev railroad project, build a single "repulsor" null-coil to get a feel for operation, and to demonstrate the interesting repulsion effect. If you build large numbers of coil circuits and they turn out not to work, you'll have to debug ALL of them. Better to get the bugs out of a single one first.<br />
</p>
<h3 id="details-of-operation">DETAILS OF OPERATION</h3>
When each Hall switch is turned on, it pulls down on the voltage at the base of the first NPN transistor. This turns that transistor off. As a result, the 10K resistor can pull up on the base terminals of the two power transistors. This turns the NPN PWR transistor on, and it turns the PNP PWR transistor off. This connects +24 volts to the electromagnet coil, and a current appears in the coil. A magnetic field appears, which turns the Hall switch off, and this causes all of the transistors to change state. The current in the electromagnet coil reverses, which turns off the Hall switch, and the whole cycle repeats. As a result, the device acts like a buzzer, the Hall switch turns on and off very rapidly, and the magnetic field wiggles north and south a little, but the average field is zero. When a magnet pole approaches, the Hall sensor starts keeping the coil switched to north longer than to south (or vice versa) in order to cancel out the field, keeping the field inside the sensor averaging at just about zero.<br />
&#10;<p>A pair of rows of these devices acts as a maglev railroad track. A bar magnet will fly along above them if it is gently thrown between the rows.<br />
</p>
<p>Other ideas: build one coil into a hollow silver plastic rod, run it from batteries in the rod, then and show your physics teacher that one end of your "metal rod" repels BOTH ends of any bar magnet. He/she will freak, because only a room-temperature superconductor can do this. Room-temp superconductors don't exist. Yet.<br />
</p>
<h3 id="its-simple-but-unstable">It's simple, but unstable</h3>
<p>One serious problem with the maglev device: instability. Magnet wobbling builds up until the magnet is thrown clear. This occurs because tiny movements in the suspended bar magnet trigger the compensating magnetic field after a small time delay. This will trigger slightly larger movements, which triggers even larger movements, and after a few seconds the magnet will be wiggling so violently that it will be thrown out of the device. It's like the opposite of friction. The device has slight "negative stability." If you can get the magnet to stop moving initially, the oscillations will build up very slowly or not at all.</p>
<p>A simple cure for the wobbling: place a thick non-ferrous bar or plate right below the bar magnet. A hunk of aluminum works fine, and copper works even better. The electrical resistance of the bar will offer some mechanical damping to changing fields, this will dampen the magnet motion, and the quivering will die away. Another solution: Replace each circuit with an ANALOG Hall sensor and a DC power amp (needs big heat sinks,) route the analog hall sensor signal through the amp and to the coil, and use op-amp chips to add a bit of differentiated Hall-sensor signal into the main signal going to the DC power amp. This will create some programmable damping via analog computation, and will cancel out the effects of the loop-delay which causes the oscillation in the first place. And if you succeed in all this, you will be an expert in linear control theory and proportional motion control systems!<br />
<span id="hal1"></span></p>
<h3 id="hall-effect-sensors-for-maglev-cradle">Hall effect sensors for Maglev Cradle</h3>
Choose a sensor which has a digital switching output (not a proportional analog voltage output.) The sensor should respond equally to fields of either polarity, so choose a "bidirectional" type that has equal and opposite B(on) and B(off)ratings. I suspect that high-sensitivity detectors might work better than insensitive ones, since this should reduce the "dither" current in the levitation coil and make the system run a bit cooler. Anything below 10mT (100 gauss) is high-sensitivity. I've not tried swapping insensitive for sensitive detectors. Maybe a more sensitive detector would give less time delay, more negative damping, and therefor better stability. That's an experiment for someone to try.<br />
&#10;<p><a href="http://amasci.com/maglev/hall.html">OTHER HALL-EFFECT SENSORS</a><br />
</p>
<p><a href="https://web.archive.org/web/20060118035918/http://www.web-ee.com/Schematics/GaussMeter/GaussMeter.htm">BUILD A GAUSSMETER</a> , via <a href="http://www.web-ee.com" rel="nofollow">Web EE</a><br />
</p>
<p>Hmmm, these null-coil circuits ARE magnetometers, are gaussmeters. Ignore the AC part, and instead just measure the DC volts across the coil. Normally it should be near zero. Bring a magnet near, and the volts go neg or pos. (Or rotate the entire device, to see if it responds to Earth's magetic field.) Perhaps make them even more sensitive by using two iron-core coils, and placing the Hall sensor in a small gap between them. And the use very long ferrous cores, so they act as a sort of "magnetic antenna," to give far better sensitivity. (Then amplify the audio coming from the coil, so you can hear any small changes in the ambient b-field.)<br />
</p>
<h3 id="hal102-nd-hall-effect-sensor-ic">HAL102-ND Hall effect sensor IC</h3>
<pre><code>
Price: about $1.00
Supplier: digikey.com
Output type: sinking (O.C)
V(supply) = +.3V to +13.5V
I(supply) = 20mA
Io(max) = 250mA
Bon = +6.5mT, +65gauss
Boff = -6.5mT, 65gauss
Hyst = 4.5mT, 45gauss
Max freq = 50KHz
&#10;     _
    / |
   |[]| Pin 1 output
   |  |
   |[]| Pin 3 GND
   |  |
   |[]| Pin 2 Pwr (+12Vdc)
    \_|
   Bottom
   View
&#10;
</code></pre>
For projects involving large arrays of pcb-mounted sensors, see Panasonic DN6849S-ND from Digi-key. That sensor has a 4-lead surface mount package and costs about $1.50<br />
<br />
</td>
<td></td>
</tr>
</tbody>
</table>

<http://amasci.com/maglev/magschem.html>\
Created and maintained by [Bill Beaty](http://amasci.com/billb.html).\
Mail me at: [<img src="http://amasci.com/graphics/abc.gif" data-border="0" width="141" height="19" />](http://amasci.com/amfrm/).\

<div class="statcounter">

<a href="http://statcounter.com/shopify/" target="_blank" title="shopify stats"><img src="http://c.statcounter.com/10408414/0/00267183/0/" class="statcounter" alt="shopify stats" /></a>

</div>

[View My Stats](http://statcounter.com/p10408414/?guest=1)
