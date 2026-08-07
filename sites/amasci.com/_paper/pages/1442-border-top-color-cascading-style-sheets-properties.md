---
title: "Border-Top-Color - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/border/btcolor.htm
order: 1442
reachable_from_entry: false
images: 0
internal_links: 9
extracted: 2026-08-07T05:55:10Z
extractor: site_to_paper.py (pandoc)
---

# Border-Top-Color - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/border/btcolor.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="border-top-color" class="pagetitle">border-top-color</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS2</em></strong>] [<strong><em>IE4</em></strong>|<strong>N6</strong>|<strong>O3.5</strong>]<br />
</td>
<td colspan="2" style="text-align: center;"><strong>Other Border-Color Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;"><a href="bcolor.htm">border-color</a><br />
<a href="brcolor.htm">border-right-color</a><br />
</td>
<td style="text-align: center;"><a href="bbcolor.htm">border-bottom-color</a><br />
<a href="blcolor.htm">border-left-color</a><br />
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
<td>[The value of the 'Color' property]</td>
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
This property controls the color of the top border of an element's rendering box. If no border-color is specified for an element's border, the value of the 'color' property is used instead.

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\] \[***N6***\|**O7**\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**transparent**\
\[***CSS2***\] \[***N6***\|**O7**\]  
**Type:** Explicit

**Description:**\
The border is transparent (with any accompanying 'border-width' thickness) - eg: elements below it shine through.

**-moz-use-text-color**\
\[***N6***\]  
**Type:** Explicit

**Description:**\
This is a Netscape/Mozilla proprietary value which indicates that the current text color (value of the 'color' property) be used for the border color. Use of this value is not recommended.

**\[color\]**\
\[***CSS2***\] \[***IE4***\|**N6**\|**O3.5**\]  
**Type:** Explicit

**Description:**\
Sets the border to the indicated color value.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **div** { <span class="property">border-top-color:</span> green }

</div>

<div class="example">

In-Line:  \<**div** <span class="tagattrib">STYLE</span>="<span class="property">border-top-color:</span> \#008000"\>this is a Green Test\</**div**\>

</div>

**Browser Peculiarities**

- **Internet Explorer**
  **4.0:**
  \- This property does not apply to input TYPE=checkbox/radio fields
  \- Applying border properties to list items skews the normal placement of the marker
  **4.0+:**
  \- The default 'border-style' for form fields and tables/table cells is not "none."
  **4.0-5.0:**
  \- This property does not apply to inline elements.
  **5.5+:**
  \- Beginning in 5.5 Beta 1, this property now applies to inline elements.
- **Opera**
  **3.5:**
  \- Borders have no effect on images, tables, table cells and form fields.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
