---
title: "Gauge tube pinouts, vacuum gauge pins"
source_domain: amasci.com
source_path: amateur/gauge_tubes.html
order: 693
reachable_from_entry: false
images: 2
internal_links: 10
extracted: 2026-08-03T18:12:57Z
extractor: site_to_paper.py (pandoc)
---

# Gauge tube pinouts, vacuum gauge pins

*Source page: `amateur/gauge_tubes.html`*

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
<td><strong><a href="http://amasci.com/amateur/belljar.html">VACUUM: the bell jar</a>   |</strong><br />
</td>
<td><strong><a href="http://amasci.com/">TOP</a>  |</strong><br />
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
<td style="text-align: left;" width="180" data-valign="top" data-summary="google ad"><pre><code>
</code></pre></td>
<td width="15"> </td>
<td data-valign="top" data-summary="main text content" width="800"><h1 id="gauge-tube-pinouts-thermocouple-vacuum-gauges-2015-w.-beaty">Gauge-tube Pinouts, Thermocouple Vacuum Gauges<br />
2015 <a href="http://amasci.com/me.html">W. Beaty</a></h1>
<h4 id="refs">Refs:</h4>
<ul>
<li><a href="http://www.repairfaq.org/sam/lasercva.htm#cvagtc">Sam's Laser FAQ</a> gauge tubes</li>
<li><a href="http://amasci.com/amateur/chemsupl.html#vac">Vacuum supply companies</a></li>
</ul>
<hr />
<p>LESKER KJL-1518 4-wire tube</p>
<pre><code>
 pin   function
  1    heater  18.5mA AC or DC,
  7    heater  ...0.7VAC w/200ohms
  3    -meter  10mV DC,
  5    +meter  ...max at vacuum ( 0.1mT )</code></pre>
Also see THE BELL JAR on a diy <a href="http://www.belljar.net/tcgauge.htm" rel="nofollow">KJL-1518 thermocouple vac meter</a><br />
&#10;<br />
&#10;<hr />
<p>Consolodated Vacuum CVC PRODUCTS GTC-100 milliTorr meter, GTC-004 tube<br />
</p>
<pre><code>
  pin
   1 - Heater .22V @ 20mA, 11 ohm
   7 - Heater
   3 - T.C. neg out 13.5mV @ 1mT
   5 - T.C. pos out</code></pre>
<p>1/8" NPT<br />
Similar tubes: 1504, TVT-1504, KJL-1504, DST-004, VT-1M<br />
</p>
<p>GTC-100 milliTorr meter is a 6.3VAC transformer with heater current regulated by Amperex ballast tube (~90 ohms hot,) and 10-ohm pots for heater-voltage adjustment: 0VAC to 0.4VAC.<br />
The gauge-tube thermocouple output feeds a panel meter: 220 microamps full scale, 55-ohm coil<br />
</p>
<hr />
<p>TELEVAC "2A" 2-2100-10 see <a href="http://frederickscompany.com/documentation/data-sheets/televac/2a/4-2a-ds/file" rel="nofollow">pdf datasheet</a><br />
</p>
<pre><code>
 pin   function
  1    heater   6ohm 89mA  0.57V,   6.3VAC w/75ohm (47ohm min) 
  8    heater         ...or 3.3VAC w/50ohm (33ohm min)
  2    -meter  10mV DC, max is at a
  7    +meter  ...good vacuum ( 0.1mT )</code></pre>
<table data-summary="televac 2A part numbers">
<tbody>
<tr>
<td>2A sensor, brass with 1/8" NPT        </td>
<td>2-2100-10</td>
</tr>
<tr>
<td>2A sensor, s. steel w/ 1/8" NPT        </td>
<td>2-2126-001</td>
</tr>
<tr>
<td>VacuMini 2A miniature sensor</td>
<td>2-2100-102</td>
</tr>
<tr>
<td>NASA 2A miniature sensor</td>
<td>2-2100-31</td>
</tr>
</tbody>
</table>
<hr />
<p>VARIAN DV531, HASTINGS 531, KJL 5311<br />
</p>
<p>The sensor is a pair of wires of two differetn materials in "X" shape, welded in the center, giving a symmetrical pattern. Thermocouple voltage is taken between the two wires. Apparently the heater current can be applied between any two pins, see note.</p>
<pre><code>
  pin  
   1 - wire 1 (and TC pos)  1.6ohm to pin5
   2 - 
   3 - wire 2 (and TC neg)  1.2ohm to pin7
   4 - 
   5 - wire 1 (and TC pos)
   6 - 
   7 - wire 2 (And TC neg)
   8 - </code></pre>
Tube output: 14mV DC full scale (when below 1 milliTorr)<br />
Heater drive: 165mA at 0 mTorr, (400mA max at 1atm ~750mV)<br />
&#10;<blockquote>
<p>NOTE: Various suppliers use various pins for heater and TC, no two the same!.<br />
<br />
</p>
<p>For example, old Hastings-type needle-meters (sold by Duniway, <a href="https://www.duniway.com/search/node/thermocouple%20controller%20531">type 531</a>) apply AC heater current through wire2 (pin-3 to pin-7) then they short pin-1 to pin-5, take TC+ from pin 1/5 and TC- from the centertap of the transformer heater winding.<br />
</p>
<p>But Varian instead wants us to take TC signal from between pin-7 and pin-5 while applying AC heater supply between pin-3 and pin-5 (which sends 165mA through the weld between the crossed wires! Did Varian make a mistake, and publish the DV6 pinout for DV0531 tube?)<br />
</p>
<p>Yet the KJLC531 vacuum gauge meter applies AC heater across pin-1 and pin-7 (through the weld,) then takes +TC from pin-5, and -TC from pin-3.<br />
</p>
<p>LVG-200TC gauge applies various DC to pins 1-7 (through the weld,) then takes red/grn TC signal from red (pin 5) and green (pin 3,) while controlling the heater current (120mADC at vacuum, to 750mADC at 1ATM.)</p>
</blockquote>
<br />
&#10;<hr />
<p>EDWARDS D35501000 (actually D355-01-000,) METER MODEL 507<br />
</p>
<p>WARNING: no longer sold. <a href="http://staff.washington.edu/wbeaty/chem_edwards507.html" rel="nofollow">See 507 Meter mod to use Televac 2A gauge tube</a><br />
</p>
<pre><code>
    DIN cable pinout:
      1 - n.c. 
      2 - TC+ (sensor rd wire, 10mV out)
      3 - heater (sensor bn wire, 10mA)
      4 - TC- (sensor bk wire, gnd return)
      5 - heater (sensor gn wire, gnd return)</code></pre>
Tube output: 10mV DC full scale (below 1 milliTorr)<br />
Heater drive: ~10mA ~0.8V (+5VDC with series resistor = 450 to 650 ohms adj)<br />
&#10;<blockquote>
NOTE: the heater is isolated from TC junction, so any modified version of Model 507 must use a floating panel meter, or a floating heater supply for the NON-isolated 4-wire gauge tubes "2A" or "KJL-1518"
</blockquote>
<br />
&#10;<br />
&#10;<hr />
<p>SARGENT WELCH-ALLYN 1515A, METER MODEL HWB1515<br />
</p>
<p>Still sold, try <a href="https://www.welchvacuum.com/en-us/rough-vacuum-gauges/gauge-thermocouple-model-1515" rel="nofollow">Welch Vacuum</a>, <a href="https://www.berktree.com/gauge-tube-for-model-1515-accessory-for-welch-thermocouple-vacuum-gauge-model-1515a-each.html" rel="nofollow">try berktree.com</a> and <a href="https://www.ldsvacuumshopper.com/vgt800.html" rel="nofollow">LDS vacuum</a><br />
</p>
<pre><code>
  Standard octal tube base, orange plastic
  Pins:
      1 - n.c. 
      2 - + TC
      3 - n.c.
      4 - + TC
      5 - n.c.
      6 - heater -TC
      8 - heater -TC</code></pre>
<p>Tube output: 13mV DC full scale (below 1 milliTorr)<br />
Heater drive: ~40mA 1.2KHz ~0.24VAC (400C deg)<br />
</p>
<p>CALIBRATE:<br />
With the 1515a TC tube vented to 1-ATM, connect the meter's cable-socket to the TC and apply power. On the front of the meter, use the black plastic meter-set screw to adjust the needle to 1ATM reading. (If using a new TC tube, first set the pin6,8 AC drive to about 250mV.)<br />
</p>
<p>Next, use a pump w/turbo to pump down the TC tube to below 1mTorr. Remove the top of the meter's black metal case (4 screws.) Use grabber-probes (or similar) to connect an AC voltmeter between pin-6 and pin-8 on the TC tube base, then plug in the 8pin socket and turn on the meter. You should see an AC reading between 230mVAC and 300mvAC. Observe the Vac gauge pressure reading on the meter-needle, it should be within the low-pressure end of the scale. Monitor the AC millivolt reading, then use a tiny screwdriver to change the 10turn trimmer, KEEPING THE AC mV BELOW 350mV, while setting the pressure reading to zero. (If the pressure reading won't descend to zero mTorr, even with the AC set to 350mV, then your TC tube is aging, and either has a contaminated filament or a thinned filament with too-high resistance.)</p>
<blockquote>
NOTE:<br />
- 10VDC recorder output (rd bk test-tip plugs)<br />
- similar to Teledyne-Hastings DV-23<br />
- The meter applies adjustable 1.2KHz AC across pins 6 and 8, via a center-tapped transformer winding. The AC volts is adjusted via a blue 10-turn trimmer inside the case (located on the back of the meter movement.) The tube socket has a shorting bar from pin-2 to pin-4, and this common connection gives the (+) thermocouple voltage, with the (-) voltage taken from pin-6 or pin-8 (or from the C.T. transformer coil.<br />
&#10;</blockquote>
<br />
</td>
<td></td>
</tr>
</tbody>
</table>

<table data-summary="Continued, hastings tc tubes" width="100%">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td width="15"> </td>
<td data-valign="top" data-summary="main text content" width="800"><hr />
<p>TELEDYNE-HASTINGS TC TUBES DV-6 ETC.<br />
The following is from <a href="http://www.repairfaq.org/sam/lasercva.htm#cvagtc">SAM'S LASER FAQ</a>, see that page for extensive info<br />
</p>
<table data-summary="pinouts of Hastings gauge tubes" data-align="center">
<tbody>
<tr>
<td colspan="9">TC Gauge Tube Model:</td>
</tr>
<tr data-align="center">
<td style="text-align: left;">Metal- case</td>
<td>DV -3M</td>
<td>DV -4AM</td>
<td>DV -4D</td>
<td>DV- 5M</td>
<td>DV- 6M</td>
<td>DV -8M</td>
<td>DV -23</td>
<td>DV -24</td>
</tr>
<tr data-align="center">
<td style="text-align: left;">Ruggedized</td>
<td>-</td>
<td>-</td>
<td>DV- 4R</td>
<td>-</td>
<td>DV- 6R</td>
<td>-</td>
<td>-</td>
<td>-</td>
</tr>
<tr data-align="center">
<td style="text-align: left;">SS / Ceramic</td>
<td>-</td>
<td>-</td>
<td>DV-34</td>
<td>-</td>
<td>DV-36</td>
<td>-</td>
<td>-</td>
<td>-</td>
</tr>
<tr data-align="center">
<td style="text-align: left;">Pyrex- case</td>
<td>DV -17</td>
<td>DV -16</td>
<td>DV- 16D</td>
<td>DV -18</td>
<td>DV -20</td>
<td>DV -31</td>
<td>DV -43</td>
<td>DV -44</td>
</tr>
<tr>
<td> </td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td colspan="9">Some of the Readout-meter Models:</td>
</tr>
<tr data-align="center">
<td></td>
<td>GV-3</td>
<td>SP-1</td>
<td>VT-4</td>
<td>VT-5</td>
<td>VT-6</td>
<td>SL-1</td>
<td>VH-3</td>
<td>VH-4</td>
</tr>
<tr data-align="center">
<td></td>
<td>SV-1</td>
<td>VC-14</td>
<td>TP-7A</td>
<td>LV-1</td>
<td>TV-4A</td>
<td>NV-8B</td>
<td></td>
<td></td>
</tr>
<tr data-align="center">
<td></td>
<td>VC-23</td>
<td>VC-24</td>
<td>RV-9</td>
<td>VC-15</td>
<td>TV-5A</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr data-align="center">
<td></td>
<td>RV-2C</td>
<td>RV-4C</td>
<td>RV-14</td>
<td>VC-25</td>
<td>RV-8</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr data-align="center">
<td></td>
<td>RV-2S</td>
<td>RV-4S</td>
<td>TV-47</td>
<td>RV-15</td>
<td>RV-16</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td colspan="5"></td>
<td>TV-47</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr data-align="center">
<td> </td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td colspan="9">Some of the Controller Models:</td>
</tr>
<tr data-align="center">
<td style="text-align: left;">Single Set-Point</td>
<td></td>
<td></td>
<td>CVT -14</td>
<td>CVT -15</td>
<td>CVT -16</td>
<td></td>
<td>CVH -3</td>
<td>CVH- 4</td>
</tr>
<tr data-align="center">
<td style="text-align: left;">Dual Set-Point</td>
<td></td>
<td></td>
<td>CVT -24</td>
<td>CVT -25</td>
<td>CVT -26</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td> </td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Pressures (mT):</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr data-align="center">
<td style="text-align: left;">Best Sens Range</td>
<td>20 - 200</td>
<td>200 - 5k</td>
<td>200 - 5k</td>
<td>2 - 20</td>
<td>10 - 200</td>
<td>0.1 - 10</td>
<td>5 - 1k</td>
<td>100 - 5k</td>
</tr>
<tr data-align="center">
<td style="text-align: left;">Useful Range</td>
<td>1 - 1k</td>
<td>100 - 20k</td>
<td>100 - 20k</td>
<td>0.2 - 100</td>
<td>1 - 1k</td>
<td>0.1 - 10</td>
<td>5 - 5k</td>
<td>100 - 50k</td>
</tr>
<tr>
<td> </td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr data-align="center">
<td style="text-align: left;">Volume (cu.in.):</td>
<td>1/2</td>
<td>1/20</td>
<td>1/20</td>
<td>1/2</td>
<td>1/2</td>
<td>1/2</td>
<td>1/2</td>
<td>1/2</td>
</tr>
<tr>
<td> </td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Heater:</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr data-align="center">
<td style="text-align: left;">Current (AC mA)</td>
<td>125</td>
<td>40</td>
<td>29</td>
<td>30</td>
<td>21</td>
<td>53</td>
<td>40/40</td>
<td>30/40</td>
</tr>
<tr data-align="center">
<td style="text-align: left;">Voltage (AC mV)</td>
<td>300</td>
<td>370</td>
<td>320</td>
<td>200</td>
<td>380</td>
<td>320</td>
<td>200 / 200</td>
<td>190 / 190</td>
</tr>
<tr data-align="center">
<td style="text-align: left;">Power (mW)</td>
<td>37</td>
<td>15</td>
<td>9</td>
<td>6</td>
<td>8</td>
<td>17</td>
<td>16</td>
<td>11</td>
</tr>
<tr data-align="center">
<td style="text-align: left;">Resistance (ohms)</td>
<td>2.2</td>
<td>8</td>
<td>11</td>
<td>6</td>
<td>18</td>
<td>6</td>
<td>5/6</td>
<td>6.5 / 7.5</td>
</tr>
<tr>
<td> </td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td colspan="9">TC Temperature (°C):</td>
</tr>
<tr data-align="center">
<td style="text-align: left;">At high vacuum</td>
<td>260</td>
<td>275</td>
<td>250</td>
<td>48</td>
<td>300</td>
<td>120</td>
<td>400</td>
<td>400</td>
</tr>
<tr data-align="center">
<td style="text-align: left;">At atmos</td>
<td>15</td>
<td>30</td>
<td>30</td>
<td>1.5</td>
<td>6</td>
<td>10</td>
<td>10</td>
<td>35</td>
</tr>
<tr>
<td> </td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr data-align="center">
<td colspan="9" style="text-align: left;">TC Output at High Vacuum</td>
</tr>
<tr data-align="center">
<td style="text-align: left;">(DC mV):</td>
<td>10</td>
<td>10</td>
<td>10</td>
<td>2</td>
<td>10</td>
<td>2</td>
<td>13</td>
<td>13</td>
</tr>
<tr>
<td> </td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Response Time (s):</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr data-align="center">
<td style="text-align: left;">Atm -&gt; high vacuum</td>
<td>3.3</td>
<td>0.16</td>
<td>0.16</td>
<td>25</td>
<td>2.9</td>
<td>25</td>
<td>3</td>
<td>0.2</td>
</tr>
<tr data-align="center">
<td style="text-align: left;">High vacuum -&gt; atm</td>
<td>0.12</td>
<td>0.04</td>
<td>0.04</td>
<td>0.8</td>
<td>0.05</td>
<td>0.8</td>
<td>0.07</td>
<td>0.05</td>
</tr>
<tr>
<td> </td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Pin Nos.:</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr data-align="center">
<td style="text-align: left;">Heater</td>
<td colspan="6">&lt;- - - - - - - - - - 3-5 - - - - - - - - - -&gt;</td>
<td colspan="2">&lt;- 2-4 / 6-8 -&gt;</td>
</tr>
<tr data-align="center">
<td style="text-align: left;">TC Output</td>
<td colspan="6">&lt;- - - - - - - - - - - 7 - - - - - - - - - -&gt;</td>
<td>-</td>
<td>-</td>
</tr>
<tr>
<td> </td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr data-align="center">
<td style="text-align: left;">Base color:</td>
<td>BK</td>
<td>BU</td>
<td>VI</td>
<td>RD</td>
<td>YL</td>
<td>GR</td>
<td>OR</td>
<td>WH</td>
</tr>
</tbody>
</table>
Note: mT = mTorr = 10-3 Torr = 1 micron of Hg.
<hr />
<p><br />
</p>
MKS Granville-Phillips <a href="https://www.idealvac.com/files/manuals/Granville_Phillips_MKS_Gauge_Configuration_Guide_2014.pdf">CONVECTRON 275071</a> (pdf)
<p><br />
</p>
<p><br />
</p>
<ul>
<li><a href="http://amasci.com/amateur/chemsupl.html#vac">Vacuum supply companies</a></li>
<li><a href="http://www.repairfaq.org/sam/lasercva.htm#cvagtc">Sam's Laser FAQ</a> gauge tubes</li>
</ul>
<div data-summary="google ad" style="width:310px;height:290px;margin-left:10px;margin-top:30px;float:right;">
&#10;</div></td>
<td></td>
</tr>
</tbody>
</table>

\

\

|     |     |
|:---:|-----|
|     |     |

<http://amasci.com/amateur/gauge_tubes.html>\
Created and maintained by [Bill Beaty](http://amasci.com/billb.html).\
Mail me at: [<img src="http://amasci.com/graphics/abc.gif" data-border="0" width="141" height="19" alt="[my email address is my website addr preceded by billb atsign]" />](http://amasci.com/amfrm/).\

<div class="statcounter">

<a href="http://statcounter.com/shopify/" target="_blank" title="shopify stats"><img src="http://c.statcounter.com/10408414/0/00267183/0/" class="statcounter" alt="shopify stats" /></a>

</div>

[View My Stats](http://statcounter.com/p10408414/?guest=1)
