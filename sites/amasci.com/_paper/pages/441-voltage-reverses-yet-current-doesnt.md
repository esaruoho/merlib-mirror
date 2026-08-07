---
title: "Voltage Reverses, Yet Current Doesn't?!"
source_domain: amasci.com
source_path: miscon/voltrev.html
order: 441
reachable_from_entry: true
images: 2
internal_links: 8
extracted: 2026-08-07T17:05:06Z
extractor: site_to_paper.py (pandoc)
---

# Voltage Reverses, Yet Current Doesn't?!

*Source page: `miscon/voltrev.html`*

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
<td><strong><a href="http://amasci.com/ele-edu.html">ELECTRICITY ARTICLES</a>  |</strong><br />
</td>
<td><strong><a href="http://amasci.com/~billb/cgi-bin/miscon/guestbok.html">COMMENT</a>  |</strong><br />
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
<td style="text-align: left;" width="180" data-valign="top" data-summary="google ad"><pre><code></code></pre>
<pre><code></code></pre></td>
<td width="15"> </td>
<td data-valign="top" data-summary="main text content" width="800"><h1 id="voltage-reverses-yet-current-doesnt-wha-w.-beaty-1999">Voltage Reverses, Yet<br />
Current Doesn't? Wha?!<br />
W. Beaty 1999</h1>
<p>On Tue, 30 Mar 1999, Wes M. wrote:<br />
</p>
<p>&gt; How can the Voltage polarity reverse, and the flow of electricity<br />
&gt; (talkin' about electric charge here) not change direction?<br />
&gt; This statement was made in the article entitled "Electricity is not<br />
&gt; Electrical Energy". If anyone can answer my question, I'd be eternally<br />
&gt; greatful. Thanks!<br />
</p>
<p>Hi Wes. Glad you like my "stuff!"<br />
</p>
<p>[Lurkers, see <a href="http://amasci.com/miscon/energ1.html">http:// amasci.com /miscon /energ1.html</a>]<br />
</p>
<p>The direction of electric charge-flow vs. the direction of energy flow... it's easy to mix up these two. I suspect that this is a major reason why people wrongly believe that electric current is flow of energy.<br />
</p>
<p>In most electric circuits, whenever we want to reverse the direction of the flowing energy, we must reverse the direction of the electric current. For example, to "recharge" a battery, we force the charge to reverse its direction of flow. Doesn't this prove that electric current is a flow of energy? No, because the flow of energy is not the current, instead it's the current MULTIPLIED BY voltage. To reverse the energy flow, we can reverse the current, but we can also reverse the voltage. Maintaining the current while reversing of the voltage is a common trick in electronic equipment, such as...<br />
</p>
when coils are driven by capacitors
when coils dump energy into resistors
and when standing waves appear on radio transmitter cables (known as 'SWR' with CB and ham radios.)<br />
&#10;<p>As you suspected, this effect does NOT appear when batteries drive purely resistive loads such as light bulbs and electric heaters. In that case the polarity of the voltage directly controls the direction of the charge flow. Therefore the battery voltage and charge flow must change polarity together, leaving the energy flowing in the same direction during the change. For example, when a light bulb is plugged into the AC lines, the alternating voltage and charge-flow both reverse together, and so the energy keeps going forward and does not vibrate back and forth. The energy always flows FROM the generators and INTO the light bulbs, even though the charge carriers in the metal are wiggling back and forth.<br />
</p>
<p>Here's one situation where energy flow is revered by the change of VOLTAGE polarity, rather than by changing the CURRENT direction. Suppose we have an enormous coil of wire wrapped around an iron core. We can store energy in this coil by temporarily connecting it to a battery. At the moment we connect it, electric charges in the coil begin to slowly flow, and a magnetic field forms around the coil. As time goes on, the current builds up faster and and faster, and the magnetic field grows in strength and energy. If we multiply the voltage across the battery by the current in the circuit, we get watts, and the polarity of the wattage shows us that electrical energy is flowing OUT of the battery and INTO the coil. Makes sense. The electrical energy from the battery is being stored in the coil's magnetic field.<br />
</p></td>
<td></td>
</tr>
</tbody>
</table>

<table width="100%">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td width="800"><pre><code>
       ------&gt;   Charge-flow is circular
     ________________________
    |                        |    LARGE
    |                        |_    COIL
  __|__  +                     --____
   ___                       ----____----
  _____                      ----____----
   ___  BATTERY              ----____----
  _____                      ----____----
   ___                       ----____----
    |    -                   ----____----
    |                                --_
    |        &lt;------                    |
    |___________________________________|
</code></pre>
<br />
&#10;<p>Now let's reverse the direction of the energy by letting the coil power a light bulb. Connect a light bulb across the coil, then disconnect the battery. The flow of charge continues through the coil in the same direction as before, and the light bulb lights up. (Coils behave somewhat like flywheels: they provide a sort of "electrical inertia" which resists any change in the flow rate of the charge.) When the light bulb lights up, the current still has the same direction as before, but THE VOLTAGE IS REVERSED. The polarity of voltage across the light bulb (below) is opposite that of the battery above.<br />
</p>
<pre><code>
&#10;           current  ------&gt;
      ______________________
     |                      |      LARGE
     |                      |_      COIL
   __|__  -                   --____
  /  \  \                   ----____----
 |   /   |   LIGHT          ----____----
|    \    |  BULB           ----____----
 |   /   |                  ----____----
  \__\__/                   ----____----
     |    +                 ----____----
     |                              --_
     |    &lt;------  current             |
     |_________________________________|
</code></pre>
<br />
&#10;<p>Which way does the energy flow? When the coil is lighting the bulb, if we multiply the current by the voltage, we discover that the direction of the energy flow has reversed: energy is now flowing FROM the coil and INTO the light bulb. Yet the flow of charge has not reversed. "Electricity" still flows the same, and only the voltage and the energy has been reversed. The coil is powering the light bulb, the magnetic field collapses, current becomes less and less, the light bulb grows dimmer, and the coil's magnetic field eventually disappears.<br />
</p>
<hr />
Here's another, more complicated situation: coil/capacitor oscillations. When a coil drains a charged capacitor, the flow of charge in the coil does not stop, and the coil will "charge up" the capacitor again, but with reversed voltage. The voltage across the capacitor reverses, and the energy flow reverses, yet the direction of charge flow stays the same while this is happening.<br />
&#10;<p>Suppose we have a coil of wire and a capacitor. Suppose that we "charge" the capacitor at the start, then we connect it to the coil. If we measure the voltage across the capacitor, we will find that it is going plus and minus over and over, and the coil/capacitor circuit is "ringing" like some sort of electromagnetic bell. Clear enough? Charge up capacitor, touch it to the coil, and the circuit goes "dingggggggg....." This happens because the energy in the capacitor "sloshes" into the coil, and then the energy in the coil "sloshes" back into the capacitor, over and over very rapidly. (Eventually the ringing dies away.)<br />
</p>
<p>Now for the fun part. When we touched the capacitor to the coil, the capacitor's voltage caused charge to begin flowing in the circuit. However, the coil acts as a kind of electrical flywheel, and the charge does not flow all at once, instead the flow rate slowly builds up, and a magnetic field balloons into existence around the coil. The voltage across the capacitor falls and falls, and the charge flow in the circuit slowly gets faster (more amps.) THE CAPACITOR IS LOSING ENERGY. Where does the energy go? It is stored in the coil, because a large magnetic field is building up in the coil at the same time that the electric field between the capacitor plates is decreasing. The energy is moving from the capacitor to the coil.<br />
</p>
<pre><code>
          &#10;           current  ------&gt;
     ________________________
    |                        |      LARGE
    |                        |_      COIL
    |  CAPACITOR               --____
    |                        ----____----
 ___|___ +                   ----____----
 _______                     ----____----
    |    -                   ----____----
    |                        ----____----
    |                        ----____----
    |                                --_
    |    &lt;------  current               |
    |___________________________________|
&#10;    A PRE-CHARGED CAPACITOR POWERS A COIL
</code></pre>
<br />
&#10;<p>Finally the capacitor voltage reaches zero, and no more energy is left in the capacitor. Yet the flowing charge in the circuit is at maximum. All the energy has moved into the coil (stored in its magnetic field.)<br />
</p>
<pre><code>
&#10;              ------&gt;
      _______________________
     |                       |      LARGE
     |                       |_     COIL
     |                         --____
     | CAPACITOR             ----____----
  ___|___                    ----____----
  _______                    ----____----
     |                       ----____----
     |                       ----____----
     |                       ----____----
     |                               --_
     |        &lt;------                   |
     |__________________________________|
&#10;    THE CAPACITOR VOLTAGE REACHES ZERO, BUT
    THE CURRENT IS AT MAXIMUM
</code></pre>
<br />
&#10;<p>What happens next? THE CAPACITOR VOLTAGE BECOMES REVERSED, THE ENERGY FLOW REVERSES, AND THE COIL STARTS "CHARGING UP" THE CAPACITOR. Yet the current does not change direction.<br />
</p>
<pre><code>
&#10;
            ------&gt;
    ________________________
   |                        |
   |                        |_
   |                          --____
   | CAPACITOR              ----____----
___|___ -                   ----____----
_______              LARGE  ----____----
   |    +            COIL   ----____----
   |                        ----____----
   |                        ----____----
   |                                --_
   |       &lt;------                     |
   |___________________________________|
&#10;THE CURRENT CONTINUES, THE VOLTAGE ACROSS 
THE CAPACITOR GETS REVERSED, AND THE 
COIL POWERS THE CAPACITOR
</code></pre>
<br />
&#10;<p>This is not a rare situation: coil/capacitor pairs are used throughout the circuitry of radio receivers and transmitters, in TV sets, etc. The electric companies even use them, adding "phase correcting" capacitors to their substations when industrial customers have too many large motor coils as part of their factories. It makes the electrical energy slosh between the coils and nearby capacitors, rather than wasting energy by heating up the long power lines that reach back to the distant generators.<br />
</p></td>
<td></td>
</tr>
</tbody>
</table>

\

\

[http:// amasci.com/miscon/ voltrev.html](http://amasci.com/miscon/voltrev.html)\
Created and maintained by [Bill Beaty](http://amasci.com/billb.html). Mail me at: [<img src="http://amasci.com/graphics/abc.gif" data-border="0" width="141" height="19" />](http://amasci.com/amfrm/).\

<div class="statcounter">

<a href="http://statcounter.com/shopify/" target="_blank" title="shopify stats"><img src="http://c.statcounter.com/10408414/0/00267183/0/" class="statcounter" alt="shopify stats" /></a>

</div>

[View My Stats](http://statcounter.com/p10408414/?guest=1)
