---
title: "Font-Stretch - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/font/fontstretch.htm
order: 1459
reachable_from_entry: false
images: 0
internal_links: 7
extracted: 2026-08-07T05:55:11Z
extractor: site_to_paper.py (pandoc)
---

# Font-Stretch - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/font/fontstretch.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="font-stretch" class="pagetitle">font-stretch</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS2</em></strong>]<br />
</td>
<td colspan="2" style="text-align: center;"><strong>Other Font Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;" data-valign="top"><a href="fontsizeadjust.htm">font-size-adjust</a><br />
<a href="font.htm">font</a><br />
<a href="fontstyle.htm">font-style</a><br />
<a href="fontvariant.htm">font-variant</a><br />
</td>
<td style="text-align: center;" data-valign="top"><a href="fontweight.htm">font-weight</a><br />
<a href="fontsize.htm">font-size</a><br />
<a href="fontfamily.htm">font-family</a><br />
</td>
</tr>
<tr>
<td colspan="3" style="text-align: center;">= <span class="sitetitle">Index DOT Css</span> by <a href="../../../misc/email.htm">Brian Wilson</a> =<br />
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
<td>Visual</td>
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
This property selects a normal, condensed or extended font to be used from the current font-family. It appears to be intended to control the condensation/expansion of the font in the horizontal (x-direction) only.

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**narrower** \| **wider**\
\[***CSS2***\]  
**Type:** Calculated

**Description:**\
These values select the next higher or lower value (if available) on the 'font-stretch' scale indicated below relative to the value inherited from the parent.

**ultra-condensed** \| **extra-condensed** \| **condensed** \| **semi-condensed**\
**normal**\
**semi-expanded** \| **expanded** \| **extra-expanded** \| **ultra-expanded**\
\[***CSS2***\]  
**Type:** Explicit

**Description:**\
These values indicate a scale of condensation or expansion of the current font-family. 'Ultra-condensed' is the narrowest value and 'ultra-expanded' is the widest value.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **em** { <span class="property">font-stretch:</span> extra-expanded }

</div>

<div class="example">

In-Line:  \<**em** <span class="tagattrib">STYLE</span>="<span class="property">font-stretch:</span> extra-expanded"\>text\</**em**\>

</div>

**Browser Peculiarities**

- Nothing to report.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
