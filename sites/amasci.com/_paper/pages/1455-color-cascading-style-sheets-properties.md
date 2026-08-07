---
title: "Color - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/colorbg/color.htm
order: 1455
reachable_from_entry: false
images: 0
internal_links: 8
extracted: 2026-08-07T17:07:45Z
extractor: site_to_paper.py (pandoc)
---

# Color - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/colorbg/color.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="color" class="pagetitle">color</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS1</em></strong>|<strong>CSS2</strong>] [<strong><em>IE3B1</em></strong>|<strong>N4B2</strong>|<strong>O3.5</strong>]<br />
</td>
<td colspan="2" style="text-align: center;"><strong>Other Color/Background Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;"><a href="lbgcolor.htm">layer-background-color</a><br />
<a href="lbgcolor.htm">layer-background-color</a><br />
<a href="bg.htm">background</a><br />
<a href="bgcolor.htm">background-color</a><br />
<a href="bgimage.htm">background-image</a><br />
</td>
<td style="text-align: center;"><a href="bgrepeat.htm">background-repeat</a><br />
<a href="bgattach.htm">background-attachment</a><br />
<a href="bgposit.htm">background-position</a><br />
<a href="bgpositx.htm">background-position-x</a><br />
<a href="bgposity.htm">background-position-y</a><br />
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
<td>Browser dependent</td>
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
<td>&lt;<strong>body</strong> <span class="tagattrib">TEXT</span>="#RRGGBB"&gt; | &lt;<strong>font</strong> <span class="tagattrib">COLOR</span>="#RRGGBB"&gt;</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

**What is it?**  
This property describes the color of text within an element. Values for the property outside the specified ranges will be clipped or truncated to create a valid value.

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\] \[***N6***\|**O7**\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**\[color\]**\
\[***CSS1***\|**CSS2**\] \[***IE3B1***\|**N4B2**\|**O3.5**\]  
**Type:** Explicit

**Description:**\
This is a representation of the values for Red/Green/Blue used to determine a final display color. Please see the section on [Color Units](../../syntax/units/color.htm) for details on the various color specification schemes.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **body** { <span class="property">color:</span> blue }

</div>

<div class="example">

In-Line:  \<**body** <span class="tagattrib">STYLE</span>="<span class="property">color:</span> blue"\>text\</**body**\>

</div>

**Browser Peculiarities**

- **Internet Explorer**
  **3.0:**
  \- This property does not apply to form fields
  **4.0+:**
  \- This porperty now applies to form fields, and the OPTION element as well (only 'color' and 'background-color' apply to individual OPTION elements in IE4+)
- **Netscape**
  **4.x:**
  \- This property does not apply to form fields, HR, DT/DD, or TABLE elements.
  \- Applying this property to LI elements only applies the effect to the list marker, not the item content.
- **Opera**
  **3.5:**
  \- This property does not apply to form fields or HR elements

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
