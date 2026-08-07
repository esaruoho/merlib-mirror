---
title: "Border-Right - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/border/bright.htm
order: 1438
reachable_from_entry: false
images: 0
internal_links: 11
extracted: 2026-08-07T17:07:44Z
extractor: site_to_paper.py (pandoc)
---

# Border-Right - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/border/bright.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="border-right" class="pagetitle">border-right</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS1</em></strong>|<strong>CSS2</strong>] [<strong><em>IE4B2</em></strong>|<strong>N6</strong>|<strong>O3.5</strong>]<br />
</td>
<td colspan="2" style="text-align: center;"><strong>Other Border Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;"><a href="border.htm">border</a><br />
<a href="btop.htm">border-top</a><br />
</td>
<td style="text-align: center;"><a href="bbottom.htm">border-bottom</a><br />
<a href="bleft.htm">border-left</a><br />
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
<td>[See individual properties]</td>
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
This is a shorthand property which allows an author to specify the border-width, border-style, and border-color for the right border of an element. If no color is specified, the value will be taken from the 'color' property.

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\] \[***N6***\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**\[[border-width](bwidth.htm)\]**\
\[***CSS1***\|**CSS2**\] \[***IE4B2*** \|**N6**\|**O3.5**\]  
**Type:** \[border-width\]

**Description:**\
Uses a \[border-width\] value to render the right border of an element.

**\[[border-style](bstyle.htm)\]**\
\[***CSS1***\|**CSS2**\] \[***IE4B2*** \|**N6**\|**O3.5**\]  
**Type:** \[border-style\]

**Description:**\
Uses a \[border-style\] value to render the right border of an element.

**\[[border-color](bcolor.htm)\]**\
\[***CSS1***\|**CSS2**\] \[***IE4B2*** \|**N6**\|**O3.5**\]  
**Type:** \[border-color\]

**Description:**\
Uses a \[border-color\] value to render the right border of an element.

<!-- -->

**Syntax**  
**Selector** { <span class="property">border-right:</span> \[**border-width**\] \[**border-style**\] \[**border-color**\] }\

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **div.out** { <span class="property">border-right:</span> 10px outset \#ffffff }

</div>

<div class="example">

In-Line:  \<**div** <span class="tagattrib">STYLE</span>="<span class="property">border-right:</span> 10px outset \#ffffff"\>this is a beautiful test\</**div**\>

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
  **5.0:**
  \- A static size is given to input TYPE=checkbox/radio fields. Borders are rendered within this. Depending on the border-width, this can possibly obscure part or all of the field.
  **5.5+:**
  \- Beginning in 5.5 Beta 1, this property now applies to inline elements.
- **Opera**
  **3.5:**
  \- Borders have no effect on images, tables, table cells and form fields.
  \- Using a 'border-style' of "double" with 'border-width' set to "thin" produces a solid, thin border, not a double border.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
