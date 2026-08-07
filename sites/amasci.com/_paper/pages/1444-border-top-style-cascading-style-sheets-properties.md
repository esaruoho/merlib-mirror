---
title: "Border-Top-Style - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/border/btstyle.htm
order: 1444
reachable_from_entry: false
images: 0
internal_links: 9
extracted: 2026-08-07T05:55:10Z
extractor: site_to_paper.py (pandoc)
---

# Border-Top-Style - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/border/btstyle.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="border-top-style" class="pagetitle">border-top-style</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS2</em></strong>] [<strong><em>IE4</em></strong>|<strong>N6</strong>|<strong>O3.5</strong>]<br />
</td>
<td colspan="2" style="text-align: center;"><strong>Other Border-Style Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;"><a href="bstyle.htm">border-style</a><br />
<a href="brstyle.htm">border-right-style</a><br />
</td>
<td style="text-align: center;"><a href="bbstyle.htm">border-bottom-style</a><br />
<a href="blstyle.htm">border-left-style</a><br />
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
<td>Visual</td>
</tr>
<tr>
<th style="text-align: left;"><strong>HTML Equivalent:</strong><br />
</th>
<td>&lt;<strong>img</strong> <span class="tagattrib">BORDER</span>&gt; | &lt;<strong>table</strong> <span class="tagattrib">BORDER</span>&gt;</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

**What is it?**  
This property controls the line style of the top border of an element's rendering box. Browsers that support this property are allowed to treat values of **dotted**, **dashed**, **groove**, **ridge**, **inset**, **outset** and **double** as the value **solid**.

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\] \[***NS6***\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**none**\
\[***CSS2***\] \[***IE4***\|**N6**\|**O3.5**\]  
**Type:** Explicit

**Description:**\
No border is rendered. This overrides any value of 'border-width', if present.

**hidden**\
\[***CSS2***\] \[***O3.5***\]  
**Type:** Explicit

**Description:**\
Creates the same effect as 'none'. Only difference is for border conflict resolution for table elements.

**dotted**\
\[***CSS2***\] \[**IE5.5B1**\|**N6**\|***O3.5***\]  
**Type:** Explicit

**Description:**\
The border is rendered as a series of dots.

**dashed**\
\[***CSS2***\] \[**IE5.5B1**\|**N6**\|***O3.5***\]  
**Type:** Explicit

**Description:**\
The border is rendered as a series of short lines.

**solid**\
\[***CSS2***\] \[***IE4***\|**N6**\|**O3.5**\]  
**Type:** Explicit

**Description:**\
Renders a solid line.

**groove**\
\[***CSS2***\] \[***IE4***\|**N6**\|**O3.5**\]  
**Type:** Explicit

**Description:**\
Creates the effect of the border being grooved or carved in the rendering surface (A 3-D groove - the opposite of 'ridge'.) The groove bevel color is rendered based upon the value of the 'color' property.

**ridge**\
\[***CSS2***\] \[***IE4***\|**N6**\|**O3.5**\]  
**Type:** Explicit

**Description:**\
Creates the effect of the border being raised from the rendering surface (A 3-D ridge - the opposite of 'groove'.) The ridge bevel color is rendered based upon the value of the 'color' property.

**inset**\
\[***CSS2***\] \[***IE4***\|**N6**\|**O3.5**\]  
**Type:** Explicit

**Description:**\
Creates the effect of the border being embedded in the rendering surface (A 3-D inset.) The inset bevel color is rendered based upon the value of the 'color' property. A distinction exists between this value and 'groove'.

**outset**\
\[***CSS2***\] \[***IE4***\|**N6**\|**O3.5**\]  
**Type:** Explicit

**Description:**\
Creates the effect of the border coming out of the rendering surface (A 3-D outset - the opposite of 'inset'.) The outset bevel color is rendered based upon the value of the 'color' property. A distinction exists between this value and 'ridge'.

**double**\
\[***CSS2***\] \[***IE4***\|**N6**\|**O3.5**\]  
**Type:** Explicit

**Description:**\
A double line drawn on top of the background of the element. The two lines with the space between adds up to the value of the 'border-width' property for the top side.

**-moz-bg-inset**\
\[***N6***\]  
**Type:** Explicit

**Description:**\
Mozilla proprietary value - authors should not use this value. The same as the "inset" value, but the element's background color is used to create the inset rendering instead of any border-color specified.

**-moz-bg-outset**\
\[***N6***\]  
**Type:** Explicit

**Description:**\
Mozilla proprietary value - authors should not use this value. The same as the "outset" value, but the element's background color is used to create the outset rendering instead of any border-color specified.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **strong** { <span class="property">border-top-style:</span> groove }

</div>

<div class="example">

In-Line:  \<**strong** <span class="tagattrib">STYLE</span>="<span class="property">border-top-style:</span> groove"\>this is a beautiful test\</**strong**\>

</div>

**Browser Peculiarities**

- **Internet Explorer**
  **4.0:**
  \- This property does not apply to input TYPE=checkbox/radio fields
  \- Applying border properties to list items skews the normal placement of the marker
  **4.0+:**
  \- The default 'border-style' for form fields and tables/table cells is not "none."
  \- Using a 'border-style' of "double" with 'border-width' set to "thin" produces a solid, thin border, not a double border.
  \- Applying a border-style of "double", "dotted" or "dashed" on the BODY element produces a "solid" border style
  \- Applying borders to the BODY element puts the border *outside* the canvas' scrollbars.
  **4.0-5.0:**
  \- This property does not apply to inline elements.
  **5.5+:**
  \- Beginning in 5.5 Beta 1, this property now applies to inline elements.
- **Opera**
  **3.5:**
  \- Borders have no effect on images, tables, table cells and form fields.
  \- Using a 'border-style' of "double" with 'border-width' set to "thin" produces a solid, thin border, not a double border.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
