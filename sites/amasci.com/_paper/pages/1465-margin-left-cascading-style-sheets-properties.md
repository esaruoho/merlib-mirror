---
title: "Margin-Left - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/margin/marginleft.htm
order: 1465
reachable_from_entry: false
images: 0
internal_links: 7
extracted: 2026-08-07T05:55:11Z
extractor: site_to_paper.py (pandoc)
---

# Margin-Left - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/margin/marginleft.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="margin-left" class="pagetitle">margin-left</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS1</em></strong>|<strong>CSS2</strong>] [<strong><em>IE3B1</em></strong>|<strong>N4B2</strong>|<strong>O3.5</strong>]<br />
</td>
<td colspan="2" style="text-align: center;"><strong>Other Margin Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;"><a href="margin.htm">margin</a><br />
<a href="margintop.htm">margin-top</a><br />
</td>
<td style="text-align: center;"><a href="marginright.htm">margin-right</a><br />
<a href="marginbot.htm">margin-bottom</a><br />
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
<td><strong>0</strong></td>
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
<td>NA</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

**What is it?**  
This property controls the size of the left margin of an element's rendering box. Negative values are allowed. Margins are transparent and the background value of the parent element shines through.\
\
Collapsing margins: adjoining horizontal margins between elements should not collapse.

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\] \[***N6***\|**O7**\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**auto**\
\[***CSS1***\|**CSS2**\] \[***IE3B1***\|**N4B2**\|**O3.5**\]  
**Type:** Calculated

**Description:**\
This value specifies that a value determined by the browser be used for this property.

**\[length\]**\
\[***CSS1***\|**CSS2**\] \[***IE3B1***\|**N4B2**\|**O3.5**\]  
**Type:** Explicit

**Description:**\
Refers to either an absolute measurement or a relative measurement based on the current element's font size.

**\[percentage\]**\
\[***CSS1***\|**CSS2**\] \[***IE3B1***\|**N4B3**\|**O3.5**\]  
**Type:** Calculated

**Description:**\
Refers to a percentage of the width of the current element's containing block.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **h5** { <span class="property">margin-left:</span> 1.0cm }

</div>

<div class="example">

In-Line:  \<**h5** <span class="tagattrib">STYLE</span>="<span class="property">margin-left:</span> 1.0cm"\>This is a test\</**h5**\>

</div>

**Browser Peculiarities**

- **Internet Explorer**
  **3.0:**
  \- Negative margin values were not supported until IE3, Beta 2.
  \- Margin values were not cumulative in this version; for each element, the margin value was relative to the boundaries of the window, not relative to the containing element. In version 3.01 this was changed so that they were (correctly) cumulative.
  \- Specified margin values are relative to the BODY margin property, not to the edge of the page.
  \- Margin values are relative to the default values for a given element (blockquote, heading, li, etc), not to the parent element edge.
  **3.0+:**
  \- This property does not apply to table cells (TD/TH.)
  **3.0-5.0:**
  \- This property does not apply to inline elements.
  **5.5+:**
  \- Beginning in 5.5 Beta 1, this property now applies to inline elements.
- **Netscape**
  **4.x:**
  \- For Inline and replaced elements, positive values are rendered correctly, but puts an extra linefeed at the end of the element.
  \- For Inline and replaced elements, negative values are rendered starting at beginning of the current line, overlapping any previous content.
  \- Positive values for this property only appear to have an effect in TD/TH elements if the content is as wide as the current table column.
  \- Negative values are ignored for TD/TH elements.
  \- Applied to LI has no effect except deleting the list marker.
  \- Applied to DD makes the content flush left in the DL, regardless of the value applied.
- **Opera**
  **3.5:**
  \- This property does not apply to form fields.
  \- Negative margins applied to images appear to sometimes obscure content beneath even when the image is transparent. At least one case of negative margins I tried also skews image dimensions from their intrinsic values.
  \- Applying this property to table cells is very problematic, especially negative margins. Some margin values cause extra cell-spacing while others cause cell and content overlap.
  \- Observing the behavior of the W3C test suite, there appears to be some problems in the rendering of punctuation characters at line-wrap points.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
