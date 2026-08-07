---
title: "Outline-Style - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/outline/outstyle.htm
order: 1466
reachable_from_entry: false
images: 0
internal_links: 7
extracted: 2026-08-07T17:07:46Z
extractor: site_to_paper.py (pandoc)
---

# Outline-Style - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/outline/outstyle.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="outline-style" class="pagetitle">outline-style</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS2</em></strong>] [<strong><em>O7</em></strong>]<br />
</td>
<td style="text-align: center;"><strong>Other Outline Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;"><a href="outline.htm">outline</a><br />
<a href="outcolor.htm">outline-color</a><br />
<a href="outwidth.htm">outline-width</a><br />
</td>
</tr>
<tr>
<td colspan="2" style="text-align: center;">= <span class="sitetitle">Index DOT Css</span> by <a href="../../../misc/email.htm">Brian Wilson</a> =<br />
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
<td>ALL</td>
</tr>
<tr>
<th style="text-align: left;"><strong>Inherit From Parent:</strong><br />
</th>
<td>No</td>
</tr>
<tr>
<th style="text-align: left;"><strong>Applicable Media:</strong><br />
</th>
<td>Visual, Interactive</td>
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
The 'outline-style' property specifies an outline line style for the current element.\
\
The outline properties create a uniform line around an object in order to draw visual attention. An outline is slightly different than a border in several ways: An outline is drawn starting "just outside the border edge" and is allowed to be non-rectangular. Outlines are always rendered on *TOP* of an element's rendering box and do not influence the box's position or size calculation; the document does not need to be re-flowed when a border is rendered or hidden, but the outline may overlap other nearby elements.

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\] \[***O7***\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**none**\
\[***CSS2***\] \[***O7***\]  
**Type:** Explicit

**Description:**\
No outline is rendered. This overrides any value of 'outline-width', if present.

**dotted**\
\[***CSS2***\] \[***O7***\]  
**Type:** Explicit

**Description:**\
The outline is rendered as a series of dots.

**dashed**\
\[***CSS2***\] \[***O7***\]  
**Type:** Explicit

**Description:**\
The outline is rendered as a series of short lines.

**solid**\
\[***CSS2***\] \[***O7***\]  
**Type:** Explicit

**Description:**\
Renders a solid line for the outline.

**groove**\
\[***CSS2***\] \[***O7***\]  
**Type:** Explicit

**Description:**\
Creates the effect of the outline being grooved or carved in the rendering surface (A 3-D groove - the opposite of 'ridge'.) The groove bevel color is rendered based upon the value of the 'color' property.

**ridge**\
\[***CSS2***\] \[***O7***\]  
**Type:** Explicit

**Description:**\
Creates the effect of the outline being raised from the rendering surface (A 3-D ridge - the opposite of 'groove'.) The ridge bevel color is rendered based upon the value of the 'color' property.

**inset**\
\[***CSS2***\] \[***O7***\]  
**Type:** Explicit

**Description:**\
Creates the effect of the outline being embedded in the rendering surface (A 3-D inset.) The inset bevel color is rendered based upon the value of the 'color' property. A distinction exists between this value and 'groove'.

**outset**\
\[***CSS2***\] \[***O7***\]  
**Type:** Explicit

**Description:**\
Creates the effect of the outline coming out of the rendering surface (A 3-D outset - the opposite of 'inset'.) The outset bevel color is rendered based upon the value of the 'color' property. A distinction exists between this value and 'ridge'.

**double**\
\[***CSS2***\] \[***O7***\]  
**Type:** Explicit

**Description:**\
A double line outline is drawn on top of the element. The two lines with the space between adds up to the value of the 'outline-width' property.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **button** { <span class="property">outline-style:</span> groove }

</div>

<div class="example">

In-Line:  \<**button** <span class="tagattrib">STYLE</span>="<span class="property">outline-style:</span> groove"\>Press Me!\</**button**\>

</div>

**Browser Peculiarities**

- Nothing to report.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
