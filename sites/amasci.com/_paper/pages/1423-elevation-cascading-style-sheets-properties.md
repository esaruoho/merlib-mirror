---
title: "Elevation - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/aural/elevation.htm
order: 1423
reachable_from_entry: false
images: 0
internal_links: 19
extracted: 2026-08-07T05:55:09Z
extractor: site_to_paper.py (pandoc)
---

# Elevation - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/aural/elevation.htm`*

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
<td rowspan="2"><h1 id="elevation" class="pagetitle">elevation</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> <strong><em>CSS2</em></strong><br />
</td>
<td colspan="3" style="text-align: center;"><strong>Other Aural Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;"><a href="volume.htm">volume</a><br />
<a href="stress.htm">stress</a><br />
<a href="richness.htm">richness</a><br />
<a href="azimuth.htm">azimuth</a><br />
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
<td><strong>level</strong></td>
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
In an optimal listening environment, the soundstage is considered to be parallel to the floor, with origin point at the listeners head. This property specifies the vertical angle off of the soundstage plane giving up/down angle references as a location for a referenced element. Zero degree references are forward on the soundstage plane, with positive angular values being upward, and negative values being downward. This property only describes the desired end-user effect and does not specify how it is produced.

<!-- -->

\
**Allowed Values**\
**inherit**\
***CSS2***  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**below\|level\|above**\
***CSS2***  
**Type:** Explicit

**Description:**\
below: Same as '-90deg'\
level: Same as '0deg'\
above: Same as '90deg'

**lower\|higher**\
***CSS2***  
**Type:** Calculated

**Description:**\
lower: Subtracts 10 degrees from the current absolute or inherited elevation.\
higher: Adds 10 degrees to the current absolute or inherited elevation.

**\[angle\]**\
***CSS2***  
**Type:** Explicit

**Description:**\
Specifies an angle, between '-90deg' and '90deg'. '0deg' references straight ahead/forward on the soundstage plane (level with the listener.) '90deg' is directly overhead while '-90deg' is directly below.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **p.high** { <span class="property">elevation:</span> 45deg }

</div>

<div class="example">

In-Line:  \<**p** <span class="tagattrib">STYLE</span>="<span class="property">elevation:</span> 45deg"\>up here!\</**p**\>

</div>

**Notes**

- Before its inclusion in CSS2, this property was first proposed in the W3C Working Draft "Aural Cascading Style Sheets (ACSS)" (1/7/97, <http://www.w3.org/Style/css/Speech/NOTE-ACSS>)

**Browser Peculiarities**

- Nothing to report.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
