---
title: "power factor"
source_domain: amasci.com
source_path: elect/pfactor.html
order: 772
reachable_from_entry: false
images: 3
internal_links: 0
extracted: 2026-08-07T05:54:20Z
extractor: site_to_paper.py (pandoc)
---

# power factor

*Source page: `elect/pfactor.html`*

<table height="77" data-summary="nav links, google search window" width="100%">
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
<td><strong><a href="http://amasci.com/">TOP</a>  |</strong><br />
</td>
<td><strong><a href="http://amasci.com/unew.html">GOOD STUFF</a>  |</strong><br />
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

<table data-summary="format two columns" width="100%">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<tbody>
<tr>
<td style="text-align: left;" width="180" data-nowrap="" data-valign="top" data-summary="google ad"><img src="http://amasci.com/graphics/vertstr7.gif" data-align="right" />
<pre><code></code></pre>
<pre><code></code></pre></td>
<td width="15"> </td>
<td data-valign="top" data-summary="main text content" width="800"><h1 id="power-factor">Power Factor</h1>
<pre><code>
&gt;Rob Sedgwick wrote at 11:38 AM 3/4/2013:
&gt;
&gt; Hi,
&gt; I feel I have a valid and major concern regarding some universal energy
&gt; measurement standards that are used in certain consumer devices,
&gt; residential service meters and potentially (as my inquiry is yet
&gt; unanswered) appliance ratings, (such as &#39;Energuide&#39; in Canada).
&gt;
&gt; Todays existing, typical energy consumption measurements use a watt-hour
&gt; (Wh) or kilo-watt-hour (kWh) unit. Although the Wh or kWh unit is accurate
&gt; for 100% linear (resistive) loads or the resistive portion of all loads,
&gt; accurate and true measurements will need to calculate the total flow of
&gt; electrons (amperage) through both the resistive and reactive portions of
&gt; loads.
&gt;
&gt; The reactive portion of inductive loads (most electronics, microwaves,
&gt; fluorescent lights, refrigerators/freezers, pumps, etc) will increase the
&gt; current flow to the load based on the power factor (electrical efficiency)
&gt; of the load. Adding a capacitive load (such as a capacitor) can offset the
&gt; increased current flow by improving the power factor.
&gt; There is no &#39;free-lunch&#39; when using the &#39;watt&#39; consumption of a load and
&gt; not accounting for any extra energy consumed from its inefficiency</code></pre>
<p>Hi Rob!<br />
</p>
<p>Here's the central issue: Power Factor is not electrical efficiency.<br />
</p>
<p>The two are distantly related, but PF and efficiency are entirely different concepts. Because of Power Factor effects, any volt-amp meter measurements will often be wrong. Volt-amps gives an incorrect OVERestimation of the rate of actual energy consumption.<br />
</p>
<p>What's Power Factor? It's based on the idea that an (ideal) inductor consumes zero energy... yet whenever we plug inductors into AC outlets, the inductors draw significant current. (Same applies to capacitors.) If we multiply their voltage and current measurements, we'll see major watts of energy flow. But this wattage is wrong, and for ideal or non-lossy coils and capacitors, the actual energy consumption is zero.<br />
</p>
<p>The problem is that inductors do draw energy from the utility grid ...but then they turn around and give back every bit! During each cycle of AC, the electrical energy will be "sloshing" back and forth between the distant generator and the inductor. Resistors don't act like this. A resistor's current alternates, but the voltage alternates at the same time, so the energy flows in just one direction: from generator to load. With capacitors and coils, this doesn't happen.<br />
</p>
<p>Let's take a straightforward view which avoids imaginary numbers. We can investigate zero Power Factor by driving an inductor with a battery, then instantly swap the battery leads back and forth to create AC square waves. What happens?<br />
</p>
<p>[Diagram, four simple schematics 1a, 1b, 1c, 1d]<br />
</p>
<p>When first connected in [1a] above, the current rises smoothly, and the battery is dumping energy into the inductor as expected. In [1b] we flip the battery instantly. Since inductors act like "electricity flywheels" they have a large "inertia effect" on the flowing charges within them. The voltage polarity reverses, yet the direction of current does not. In [1b], the battery terminals have swapped, and the energy stored in the inductor flows back into the battery, charging it up.<br />
</p>
<p>If we leave the inductor connected, the current decreases, eventually goes through zero, and becomes negative, as in [1c]. The reversed battery voltage is driving a negative current, and negative times negative gives positive watts: this means that energy is again flowing from the battery into the inductor. Next, flip the battery again in [1d]. Again the current stays momentarily the same. But reversing the voltage has reversed the energy flow, and the inductor's stored energy is again being dumped back to the battery. Finally, wait until the current goes to zero, and we've created one complete "AC cycle."<br />
</p>
<p>See the problem? A large current exists in the power line, but our inductor uses up zero energy. On each half-cycle of AC, the inductor first draws some electrical energy from the power supply, but then it dumps it all back again. Volt-amperes remains large, yet energy consumption is zero, so PF is zero. We can't just look at volt-amperes, since it wrongly predicts that inductors consume immense energy. In fact, inductors consume very low energy (ideally it's zero.)<br />
</p>
<pre><code>
&gt; 
&gt; For the purpose of illustration, let&#39;s look at non-linear loads that
&gt; basically have static consumptions (fluorescent lights, televisions).
&gt; Let&#39;s neglect cyclic, variable or high starting loads such as
&gt; refrigerators or pumps for now.
&gt; I&#39;ve used my 120VAC circuit measurement device (a standard tool on the
&gt; consumer market) to read the energy consumption of a static-load
&gt; appliance. This device is simply taking the measured_wattage_ of the
&gt; appliance and multiplying it by the cumulative time recorded in the
&gt; device. Although this same device has the capability to measure current,
&gt; voltage and power factor it isn&#39;t using these values for proper energy
&gt; consumption calculations.
&gt; I believe this results in very inaccurate readings and misleading
&gt; information for the consumer.</code></pre>
<br />
&#10;<p>Nope, the energy meter is doing it right.<br />
</p>
<p>When connected to an inductor, it ignores the volt-amperes and the reversing energy flow. We don't want to measure the "sloshing energy" created by an inductor or a capacitor. We only care about the total energy which moves, on average, from generator to appliance. (And, if the capacitor or inductor is getting hot, that heat is caused by genuine one-way wattage being drawn from the power grid.)<br />
</p>
<pre><code>
&#10;
&#10;</code></pre>
<br />
&#10;<table data-summary="google ad">
<tbody>
<tr>
<td style="text-align: center;" data-summary="google ad"></td>
<td> </td>
</tr>
</tbody>
</table></td>
<td></td>
</tr>
</tbody>
</table>

\

<http://amasci.com/elect/pfactor.html>\
Created and maintained by [Bill Beaty](http://amasci.com/billb.html). Mail me at: [<img src="http://amasci.com/graphics/abc.gif" data-border="0" width="141" height="19" />](http://amasci.com/amfrm/).\

<div class="statcounter">

<a href="http://statcounter.com/shopify/" target="_blank" title="shopify stats"><img src="http://c.statcounter.com/10408414/0/00267183/0/" class="statcounter" alt="shopify stats" /></a>

</div>

[View My Stats](http://statcounter.com/p10408414/?guest=1)
