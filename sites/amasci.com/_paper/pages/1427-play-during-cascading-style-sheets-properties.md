---
title: "Play-During - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/aural/playdur.htm
order: 1427
reachable_from_entry: false
images: 0
internal_links: 19
extracted: 2026-08-07T17:07:44Z
extractor: site_to_paper.py (pandoc)
---

# Play-During - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/aural/playdur.htm`*

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
<td rowspan="2"><h1 id="play-during" class="pagetitle">play-during</h1>
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
<a href="elevation.htm">elevation</a><br />
<a href="voicefam.htm">voice-family</a><br />
</td>
<td style="text-align: center;"><a href="speak.htm">speak</a><br />
<a href="speakpunc.htm">speak-punctuation</a><br />
<a href="speaknum.htm">speak-numeral</a><br />
<a href="pitch.htm">pitch</a><br />
<a href="pitchrange.htm">pitch-range</a><br />
<a href="speakrate.htm">speech-rate</a></td>
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
<td><strong>auto</strong></td>
</tr>
<tr>
<th style="text-align: left;"><strong>Applicable Elements:</strong><br />
</th>
<td>All</td>
</tr>
<tr>
<th style="text-align: left;"><strong>Inherit From Parent:</strong><br />
</th>
<td>No</td>
</tr>
<tr>
<th style="text-align: left;"><strong>Applicable Media:</strong><br />
</th>
<td>Aural</td>
</tr>
<tr>
<th style="text-align: left;"><strong>HTML Equivalent:</strong><br />
</th>
<td>&lt;<strong>bgsound</strong> <span class="tagattrib">SRC</span>="[soundfile]"&gt;</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

**What is it?**  
This property specifies a sound to be played while an element's content is rendered.

<!-- -->

\
**Allowed Values**\
**inherit**\
***CSS2***  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**mix**\
***CSS2***  
**Type:** Explicit

**Description:**\
This value indicates that whatever sound file is to be played for this element will be played with the sound inherited from the parent element's 'play-during' property. If this value is not used, the element's background sound replaces the 'play-during' sound of any parent.

**repeat**\
***CSS2***  
**Type:** Explicit

**Description:**\
This value indicates that the specified sound will be repeated to fill the time needed to render the element, if it is too short. Otherwise, the sound plays once and then stops. If the 'play-during' sound is longer than the time needed to render the element content it will be clipped.

**auto**\
***CSS2***  
**Type:** Explicit

**Description:**\
The 'play-during' sound of the parent element plays only once more.

**none**\
***CSS2***  
**Type:** Explicit

**Description:**\
Nothing is played in the background during the element's rendering, not even any parent 'play-during' value. Parent 'play-during' values will resume playing after the element is rendered.

**\[URL\]**\
***CSS2***  
**Type:** Explicit

**Description:**\
Indicates the URL to be used as a background sound while the element's content is rendered.

<!-- -->

**Syntax**  
**Selector** { <span class="property">play-during:</span> auto\|none\|inherit } **OR**

**Selector** { <span class="property">play-during:</span> \[URL\] \[mix\]? \[repeat\]? }

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **q** { <span class="property">play-during:</span> url(accordian.wav) mix }

</div>

<div class="example">

In-Line:  \<**q** <span class="tagattrib">STYLE</span>="<span class="property">play-during:</span> url(accordian.wav) mix"\>Four score and seven years ago!\</**q**\>

</div>

**Notes**

- Before its inclusion in CSS2, this property was first proposed in the W3C Working Draft "Aural Cascading Style Sheets (ACSS)" (1/7/97, <http://www.w3.org/Style/css/Speech/NOTE-ACSS>)

**Browser Peculiarities**

- Nothing to report.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
