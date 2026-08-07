---
title: "Max-Width - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/dimension/maxwidth.htm
order: 1456
reachable_from_entry: false
images: 0
internal_links: 7
extracted: 2026-08-07T17:07:46Z
extractor: site_to_paper.py (pandoc)
---

# Max-Width - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/dimension/maxwidth.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="max-width" class="pagetitle">max-width</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS2</em></strong>] [<strong>N6</strong>|<strong><em>O4</em></strong>]<br />
</td>
<td colspan="2" style="text-align: center;"><strong>Other Dimension Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;"><a href="width.htm">width</a><br />
<a href="minwidth.htm">min-width</a><br />
<a href="lineheight.htm">line-height</a><br />
</td>
<td style="text-align: center;"><a href="height.htm">height</a><br />
<a href="minheight.htm">min-height</a><br />
<a href="maxheight.htm">max-height</a><br />
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
<td><strong>none</strong></td>
</tr>
<tr>
<th style="text-align: left;"><strong>Applicable Elements:</strong><br />
</th>
<td>All except inline non-replaced and table elements</td>
</tr>
<tr>
<th style="text-align: left;"><strong>Inherit From Parent:</strong><br />
</th>
<td>No</td>
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
This property allows a maximum width to be set for an element box. The calculation for the element's width may be less than this value, but if the calculated 'width' value is above this value it will recompute the 'width' using the 'max-width' value as the new 'width' value. If the value of 'min-width' is greater than the value of 'max-width', the 'max-width' property value becomes the 'min-width' value.

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\] \[**N6**\|***O4***\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**none**\
\[***CSS2***\] \[**N6**\|***O4***\]  
**Type:** Explicit

**Description:**\
No limit is placed on the maximum allowable width for the element.

**\[length\]**\
\[***CSS2***\] \[**N6**\|***O4***\]  
**Type:** Explicit

**Description:**\
Refers to an absolute measurement for the maximum computed element box width. Negative values are not allowed.

**\[percentage\]**\
\[***CSS2***\] \[**N6**\|***O4***\]  
**Type:** Calculated

**Description:**\
Refers to a percentage of the width of the containing element block.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **h5** { <span class="property">max-width:</span> 150px }

</div>

<div class="example">

In-Line:  \<**h5** <span class="tagattrib">STYLE</span>="<span class="property">max-width:</span> 150px"\>text\</**h5**\>

</div>

**Browser Peculiarities**

- Nothing to report.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
