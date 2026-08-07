---
title: "Volume - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/aural/volume.htm
order: 1432
reachable_from_entry: false
images: 0
internal_links: 19
extracted: 2026-08-07T17:07:44Z
extractor: site_to_paper.py (pandoc)
---

# Volume - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/aural/volume.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="volume" class="pagetitle">volume</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> <strong><em>CSS2</em></strong><br />
</td>
<td colspan="3" style="text-align: center;"><strong>Other Aural Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;"><a href="stress.htm">stress</a><br />
<a href="richness.htm">richness</a><br />
<a href="azimuth.htm">azimuth</a><br />
<a href="elevation.htm">elevation</a><br />
<a href="voicefam.htm">voice-family</a><br />
<a href="speak.htm">speak</a><br />
</td>
<td style="text-align: center;"><a href="speakpunc.htm">speak-punctuation</a><br />
<a href="speaknum.htm">speak-numeral</a><br />
<a href="pitch.htm">pitch</a><br />
<a href="pitchrange.htm">pitch-range</a><br />
<a href="speakrate.htm">speech-rate</a><br />
<a href="playdur.htm">play-during</a><br />
</td>
<td style="text-align: center;"><a href="pause.htm">pause</a><br />
<a href="pausebef.htm">pause-before</a><br />
<a href="pauseaft.htm">pause-after</a><br />
<a href="cue.htm">cue</a><br />
<a href="cuebef.htm">cue-before</a><br />
<a href="cueaft.htm">cue-after</a><br />
</td>
</tr>
<tr>
<td colspan="4" style="text-align: center;">= <span class="sitetitle">Index DOT Css</span> by Brian Wilson [<a href="../../../misc/email.htm">indexdot@blooberry.com</a>] =<br />
</td>
</tr>
</tbody>
</table>

<div align="center">

|  |
|----|
|   [Main Index](../../index.html) \| [Property Index](../../propindex/font.htm) \| [CSS Support History](../../supportkey/syntax.htm) \| [Browser History](../../../history/browsers.htm)   |

</div>

------------------------------------------------------------------------

\
\

<table data-border="1" data-cellspacing="0" data-cellpadding="5">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td><table data-border="0" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr>
<th colspan="2" class="field" style="text-align: left;" data-valign="bottom"><u><strong>   Quick Statistics   </strong></u><br />
</th>
</tr>
</thead>
<tbody>
<tr>
<th style="text-align: left;"><strong>Default Value:</strong><br />
</th>
<td><strong>medium</strong></td>
</tr>
<tr>
<th style="text-align: left;"><strong>Applicable Elements:</strong><br />
</th>
<td>All</td>
</tr>
<tr>
<th style="text-align: left;"><strong>Inherit From Parent:</strong><br />
</th>
<td>Yes</td>
</tr>
<tr>
<th style="text-align: left;"><strong>Applicable Media:</strong><br />
</th>
<td>Aural</td>
</tr>
<tr>
<th style="text-align: left;"><strong>HTML Equivalent:</strong><br />
</th>
<td>NA</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

**What is it?**  
This property refers to the median volume of the current voice. Pitch and inflection variations may vary well above and below this value. The default minimum and maximum values (0/100) should be controllable by the user.

<!-- -->

\
**Allowed Values**\
**inherit**\
***CSS2***  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**silent**\
***CSS2***  
**Type:** Explicit

**Description:**\
No sound at all. The time time that would have been taken to aurally render the element is still taken, but no sound is made. Any specified 'pause' properties before/after the element are also rendered. This behavior is different than the 'speak' property being set to none.

**x-soft\|soft\|medium\|loud\|x-loud**\
***CSS2***  
**Type:** Explicit

**Description:**\
x-soft: Same as '0'\
soft: Same as '25'\
medium: Same as '50'\
loud: Same as '75'\
x-loud: Same as '100'

**\[number\]**\
***CSS2***  
**Type:** Explicit

**Description:**\
A number between '0' and '100'. '0' represents the minimum audible volume level (not the same effect as "silent") and 100 corresponds to the maximum comfortable volume level.

**\[percentage\]**\
***CSS2***  
**Type:** Calculated

**Description:**\
This measure is relative to the inherited value for the Volume property, and is clipped to the range '0' to '100'.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **body** { <span class="property">volume:</span> soft }

</div>

<div class="example">

In-Line:  \<**body** <span class="tagattrib">STYLE</span>="<span class="property">volume:</span> soft"\>text\</**body**\>

</div>

**Notes**

- Before its inclusion in CSS2, this property was first proposed in the W3C Working Draft "Aural Cascading Style Sheets (ACSS)" (1/7/97, <http://www.w3.org/Style/css/Speech/NOTE-ACSS>)

**Browser Peculiarities**

- Nothing to report.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
