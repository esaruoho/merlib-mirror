---
title: "Text-Overflow - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/position/textoverflow.htm
order: 1467
reachable_from_entry: false
images: 0
internal_links: 7
extracted: 2026-08-07T05:55:11Z
extractor: site_to_paper.py (pandoc)
---

# Text-Overflow - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/position/textoverflow.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="text-overflow" class="pagetitle">text-overflow</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>IE6</em></strong>]<br />
</td>
<td colspan="2" style="text-align: center;"><strong>Other Positioning Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;" data-valign="top"><a href="top.htm">top</a><br />
<a href="right.htm">right</a><br />
<a href="bottom.htm">bottom</a><br />
<a href="left.htm">left</a><br />
<a href="vertalign.htm">vertical-align</a><br />
</td>
<td style="text-align: center;" data-valign="top"><a href="overflow.htm">overflow</a><br />
<a href="overflowx.htm">overflow-x</a><br />
<a href="overflowy.htm">overflow-y</a><br />
<a href="clip.htm">clip</a><br />
<a href="zindex.htm">z-index</a><br />
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
<td><strong>clip</strong></td>
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
<td>Visual</td>
</tr>
<tr>
<th style="text-align: left;"><strong>HTML Equivalent:</strong><br />
</th>
<td>NA<br />
</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

**What is it?**  
Some content in an element may fall outside the element's rendering box for a number of reasons (negative margins, absolute positioning, content exceeding the width/height set for an element, etc.) In cases where this occurs, the 'overflow' (set to "hidden" or "scroll" for this property to have an effect), and 'clip' properties define what content will be visible.\
\
If text is too long for the overflow/clipping area and the content is to be visually clipped, this property allows the clipped content to be visually represented by the string "..." (called an "ellipsis") in the non-clipped area.\
\
This property only applies to text overflow content in the flow of text (horizontal for western text.) To explicitly force an overflow situation, content must be in either a NOBR element or an element with the 'white-space' property set to "nowrap" - otherwise, only a natural non-breaking word existing at the clipping boundary will induce this property to have an ellipsis effect (if the property is thus set.)\
\
The clipped content can still be selected by selecting the ellipsis. When selected, the ellipsis will disappear and be visually replaced by as much of the the text content as is possible to display in the clipping area.

<!-- -->

\
**Allowed Values**\
**clip**\
\[***IE6***\]  
**Type:** Explicit

**Description:**\
Clips the viewable content to the area defined by the rendering box, the 'overflow', and 'clip' property values.

**ellipsis**\
\[***IE6***\]  
**Type:** Explicit

**Description:**\
If text content will overflow, display the string "..." in the visibly-rendered region for content outside the visible area.

<!-- -->

**Example**  
<div class="example">

Ext/Doc:\
**div** { <span class="property">position:</span> absolute; <span class="property">left:</span> 20px; <span class="property">top:</span> 50px;\
        <span class="property">width:</span> 120px; <span class="property">height:</span> 50px; <span class="property">border:</span> thin solid black;\
        <span class="property">overflow:</span> hidden; <span class="property">text-overflow:</span> ellipsis }

</div>

<div class="example">

In-Line: \
\<**div** <span class="tagattrib">STYLE</span>="<span class="property">position:</span> absolute; <span class="property">left:</span> 20px; <span class="property">top:</span> 50px;\
        <span class="property">width:</span> 120px; <span class="property">height:</span> 50px; <span class="property">border:</span> thin solid black;\
        <span class="property">overflow:</span> hidden; <span class="property">text-overflow:</span> ellipsis"\>\
\<**nobr**\>This is a NOBR section of moderate length and size.\</**nobr**\>\
\</**div**\>

</div>

**Browser Peculiarities**

- Nothing to report.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
