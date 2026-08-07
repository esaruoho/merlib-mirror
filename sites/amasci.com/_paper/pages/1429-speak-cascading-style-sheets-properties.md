---
title: "Speak - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/aural/speak.htm
order: 1429
reachable_from_entry: false
images: 0
internal_links: 19
extracted: 2026-08-07T17:07:44Z
extractor: site_to_paper.py (pandoc)
---

# Speak - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/aural/speak.htm`*

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
<td rowspan="2"><h1 id="speak" class="pagetitle">speak</h1>
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
<td><strong>normal</strong></td>
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
This property specifies whether content will be aurally rendered, and the nature of its rendering. It controls aural rendering in much the same way the 'display' property controls visual rendering.

<!-- -->

\
**Allowed Values**\
**inherit**\
***CSS2***  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**normal**\
***CSS2***  
**Type:** Explicit

**Description:**\
Uses normal pronunciation rules for the current language to render content.

**none**\
***CSS2***  
**Type:** Explicit

**Description:**\
Suppresses/skips aural rendering of the element. No time is taken to render the element. Child elements can override this value.

**spell-out**\
***CSS2***  
**Type:** Explicit

**Description:**\
Spells the content one character at a time (useful with acronyms and abbreviations.)

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **acronym** { <span class="property">speak:</span> spell-out }

</div>

<div class="example">

In-Line:  \<**acronym** <span class="tagattrib">STYLE</span>="<span class="property">speak:</span> spell-out"\>WWW\</**acronym**\>

</div>

**Browser Peculiarities**

- Nothing to report.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
