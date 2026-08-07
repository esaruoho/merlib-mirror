---
title: "Border-Left-Width - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/border/blwidth.htm
order: 1435
reachable_from_entry: false
images: 0
internal_links: 10
extracted: 2026-08-07T05:55:10Z
extractor: site_to_paper.py (pandoc)
---

# Border-Left-Width - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/border/blwidth.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="border-left-width" class="pagetitle">border-left-width</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS1</em></strong>|<strong>CSS2</strong>] [<strong>IE4B2</strong>|<strong><em>N4B3</em></strong>|<strong>O3.5</strong>]<br />
</td>
<td colspan="2" style="text-align: center;"><strong>Other Border-Width Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;"><a href="bwidth.htm">border-width</a><br />
<a href="btwidth.htm">border-top-width</a><br />
</td>
<td style="text-align: center;"><a href="brwidth.htm">border-right-width</a><br />
<a href="bbwidth.htm">border-bottom-width</a><br />
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
<td><strong>medium</strong></td>
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
This property controls the thickness (width) of the left border of an element's rendering box. Negative values are not allowed.

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\] \[***N6***\|**O7**\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**thin** \| **medium** \| **thick**\
\[***CSS1***\|**CSS2**\] \[**IE4B2**\|***N4B3***\|**O3.5**\]  
**Type:** Calculated

**Description:**\
Renders a "thin", "medium" or "thick" border on the left side of the element's rendering box. The actual thickness of these border values is not specified, but "thin" should have a smaller thickness than "medium", which should have a smaller thickness than "thick".

**\[length\]**\
\[***CSS1***\|**CSS2**\] \[**IE4B2**\|***N4B3***\|**O3.5**\]  
**Type:** Explicit

**Description:**\
Sets the width of the border on the left side of the element's rendering box to an explicit measurement.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **strong** { <span class="property">border-left-width:</span> 5mm }

</div>

<div class="example">

In-Line:  \<**strong** <span class="tagatrib">STYLE</span>="<span class="property">border-left-width:</span> 5mm"\>this is a beautiful test\</**strong**\>

</div>

**Browser Peculiarities**

- **Internet Explorer**
  **4.0:**
  \- This property does not apply to input TYPE=checkbox/radio fields
  \- Applying border properties to list items skews the normal placement of the marker
  **4.0+:**
  \- The default 'border-style' for form fields and tables/table cells is not "none."
  \- Using a 'border-style' of "double" with 'border-width' set to "thin" produces a solid, thin border, not a double border.
  **4.0-5.0:**
  \- This property does not apply to inline elements.
  **5.0:**
  \- A static size is given to input TYPE=checkbox/radio fields. Borders are rendered within this. Depending on the border-width, this can possibly obscure part or all of the field.
  **5.5+:**
  \- Beginning in 5.5 Beta 1, this property now applies to inline elements.
- **Netscape**
  **4.0:**
  \- Inline elements are turned into block elements when Border properties are applied.
  \- Border properties have no effect on tables and table cells
  \- Border properties applied to form fields and images: creates a linefeed after the element followed by a small box carrying the border property/value.
  \- Border properties applied to list items (LI) and DT/DD: creates a small box carrying the border property/value, followed by a linefeed, followed by the list item content.
  \- Border properties applied to list structures (OL/UL): causes the list markers to be shown as small bullets, regardless of the 'list-style-type' applied.
  \- The default value for 'border-style' is "solid", not "none". The default value for 'border-width' is "0", not "medium."
  \- Border properties applied to hyperlinks make the hyperlink unusable!
  \- Border styles applied to unclosed P element, nested inside a floating element: all content after opening P element disappears.
  \- Reported elsewhere: Crash when border applied to unclosed P element in table cell, while another table is nested in the cell (verified in 4.0x, NT but appears ok in 4.5x, 98)
  \- Even if the 'border-style' is set to "none", an element is rendered with space allowance for any indicated 'border-width' value.
  \- Reported elsewhere: Assigning border properties to elements with 'width' set to "100%" can cause unnecessary linefeeds when printing.
- **Opera**
  **3.5:**
  \- Borders have no effect on images, tables, table cells and form fields.
  \- Using a 'border-style' of "double" with 'border-width' set to "thin" produces a solid, thin border, not a double border.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
