---
title: "SCIENCE HOBBYIST: Squealing Wall Laser Interferometer"
source_domain: amasci.com
source_path: amateur/lasqueal.html
order: 237
reachable_from_entry: true
images: 2
internal_links: 7
extracted: 2026-08-07T17:04:50Z
extractor: site_to_paper.py (pandoc)
---

# SCIENCE HOBBYIST: Squealing Wall Laser Interferometer

*Source page: `amateur/lasqueal.html`*

<table data-summary="nav links, google search window" width="100%">
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
<td><strong><a href="http://amasci.com/scied.html">SCIENCE DEMOS</a>  |</strong><br />
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
<td style="text-align: left;" width="180" data-valign="top" data-summary="google ad"><pre><code></code></pre></td>
<td width="15"> </td>
<td data-valign="top" data-summary="main text content" width="800"><h1 id="squealing-wall-laser-demonstration-w.-beaty-62000">"SQUEALING WALL"<br />
Laser demonstration<br />
W. Beaty 6/2000</h1>
<code> On Tue, 27 Jun 2000, kyle forinash wrote:</code><br />
<code>&gt; Can anyone give me a reference to a demonstration I saw a few years back?</code><br />
<code>&gt; It was something along the lines of gluing a tiny mirror to a wall,</code><br />
<code>&gt; shining a laser off the mirror, collecting the laser light with a</code><br />
<code>&gt; sensor of some kind and turning the beam into sound</code><br />
&#10;<p>It's called "Laser Audio Interferometer" I tried this and it's simple. The mirror reflects the laser beam back down the bore of the HeNe laser tube, forming a second optical cavity external to the laser. Or use a laser pointer instead; I've been told that most will work. A small photovoltaic cell (solar cell or photodiode) collects some of the spill-light from the beam, and the PV cell output is sent to an audio amp and loudspeaker. If you move the wall (or the laser) a tiny bit, then as the "cavity" changes length, it sweeps across hundreds of resonant lengths located every 1/2 wavelength of the light. The light intensity sequentially grows dimmer and brighter, generating a sinewave signal. The frequency is proportional to the velocity of the wall. Connect the PV cell to the microphone input of an audio system, and when the wall is pushed, you hear moans and squeals. It's analogous to raking your fingernail along the teeth of a comb, but with the teeth spaced half the wavelength of light: every 300 nanometers!<br />
</p>
<p>Rather than using a fancy mirror with X-Y positioner, I just put the laser on a cart, aimed its spot on the wall, then slapped a chip from a broken mirror up on the wall with double-stick foam tape. I then could move the cart around until the reflected spot fell upon the laser's exit aperture. I only had to shim the laser a bit, and move the mirror position a bit vertically, until the reflected spot hit the laser. My photocell was a tiny (3mm) square silicon photodetector from my junkbox, but I suppose that any silicon photovoltaic cell would work. I taped the PV cell to the front of the HeNe laser so it was very near the aperature and facing outwards. The mirror chip on the wall wasn't perfectly clean, so lots of scattered light surrounded the return beam, and the photocell received a strong signal.</p></td>
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
<td width="800"><br />
&#10;<pre><code>
&#10;                                        ______________________
    =                                  |                      |
    =                                  |                      |
    = - - - &gt; - - - - - - - &lt; - - - - -|   HeNe Laser         |
    =                               || |                      |
    =                                  |______________________|
                                    /\   
 MIRROR                           Small PV cell
</code></pre>
<h2 id="simpler-version">Simpler Version</h2>
If you have a large photocell with a glass-smooth surface, you might consider mounting it on the wall instead of the mirror. Use the photocell as a crude mirror, and bounce the reflected beam back into the laser's aperature. (I haven't tried this yet.) I found it more convenient to use a mirror, just because the laser, the light sensor, and the audio amp could be placed on the same lab-cart.<br />
&#10;<p>I found that concrete or cinderblock walls didn't respond. They were too stiff. Wood or sheetrock worked well. Even with the concrete wall, I couldn't approach the wheeled cart with the laser, since the flexing of the wood floor was enough to generate all kinds of squeals. If you have only a concrete wall, then put the mirror on a separate table, so that delicately touching the table will create all kinds of squealing from the system. That, or stand near the cart on a wood floor, and shift your body weight from one foot to the other!<br />
</p>
<p>I used a HeNe laser, and I don't know if all laser pointers will work in this application. You need laser with a long coherence length. The demonstration worked well even with the mirror separated by several meters from the laser. If you only have short-coherence laser pointers available, perhaps the demo will work if the mirror is positioned within a few cm of the laser.<br />
</p>
<p>Here's a mystery. Rather than the light simply having an AC component, I reasoned that the PV cell might actually be bathed in a MOVING PATTERN of light. I mounted a white card on the front of the laser, with the beam shining through a small hole. Sure enough, when I bounced the beam from the distant mirror back into the laser, I saw a bullseye-shaped interference pattern in the scattered light coming back from the dirty mirror. Tiny motions of the laser's cart made this pattern rapidly expand and contract. I've always wondered about the origins of this pattern, and how the spacing between nodes might be calculated.<br />
</p>
<p>PS, if your PV cell is too large, it might "wash out" the signal by receiving several fringes of that bullseye pattern. Experiment by masking down your PV cell until it's only a few mm wide. In hindsight I see that I also could have put a narrowband red filter on my solar cell in order to reject more of the 120Hz noise from flourescent lights (the AC noise forced me to demonstrate the effect in a darkened room.)<br />
</p>
<h3 id="links">LINKS</h3>
<ul>
<li><a href="http://faraday.physics.uiowa.edu/mech/1H10.35.htm" rel="nofollow">Bend the wall</a> AAPT 2011</li>
<li><a href="http://www.repairfaq.org/sam/laserlia.htm#liasgsf1" rel="nofollow">Piezo beeper Fabry-Perot Interferometer</a> and <a href="http://www.repairfaq.org/sam/hbsfpi1.gif" rel="nofollow">Fig. 1</a></li>
</ul></td>
<td></td>
</tr>
</tbody>
</table>

\

<http://amasci.com/amateur/lasqueal.html>\
\
Created and maintained by [Bill Beaty](http://amasci.com/billb.html). Mail me at: [<img src="http://amasci.com/graphics/abc.gif" data-border="0" width="141" height="19" />](http://amasci.com/amfrm/).\

<div class="statcounter">

<a href="http://statcounter.com/shopify/" target="_blank" title="shopify stats"><img src="http://c.statcounter.com/10408414/0/00267183/0/" class="statcounter" alt="shopify stats" /></a>

</div>

[View My Stats](http://statcounter.com/p10408414/?guest=1)
