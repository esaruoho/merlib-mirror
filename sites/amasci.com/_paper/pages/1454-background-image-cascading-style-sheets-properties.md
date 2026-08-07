---
title: "Background-Image - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/colorbg/bgimage.htm
order: 1454
reachable_from_entry: false
images: 0
internal_links: 8
extracted: 2026-08-07T17:07:45Z
extractor: site_to_paper.py (pandoc)
---

# Background-Image - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/colorbg/bgimage.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="background-image" class="pagetitle">background-image</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS1</em></strong>|<strong>CSS2</strong>] [<strong>IE4B1</strong>|<strong><em>N4B2</em></strong>|<strong>O3.5</strong>]<br />
</td>
<td colspan="2" style="text-align: center;"><strong>Other Color/Background Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;"><a href="color.htm">color</a><br />
<a href="lbgcolor.htm">layer-background-color</a><br />
<a href="lbgcolor.htm">layer-background-color</a><br />
<a href="bg.htm">background</a><br />
<a href="bgcolor.htm">background-color</a><br />
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
<td><strong>none</strong></td>
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
<th style="text-align: left;" data-valign="top"><strong>HTML Equivalent:</strong><br />
</th>
<td>&lt;<strong>body</strong> <span class="tagattrib">BACKGROUND</span>="URL"&gt;</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

**What is it?**  
This value indicates the URL source for the graphic. If this property is present, 'background-repeat', 'background-attachment' and 'background-position' properties can also be specified. Transparent portions of the background-image will assume the color value of any background-color specified.

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\] \[**N6**\|***O7***\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**\[url\]**\
\[***CSS1***\|**CSS2**\] \[**IE4B1**\|***N4B2***\|**O3.5**\]  
**Type:** User Specified

**Description:**\
It can be either an absolute or relative URL. Please see the section on [URL Units](../../syntax/units/url.htm) for details on how to indicate a URL within a Style Sheet.

**none**\
\[***CSS1***\|**CSS2**\] \[**IE4B1**\|***N4B2***\|**O3.5**\]  
**Type:** Explicit

**Description:**\
No image is used as the background for the element.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **body** { <span class="property">background-image:</span> url(http://www.foo.com/image.gif) }

</div>

<div class="example">

In-Line:  \<**body** <span class="tagattrib">STYLE</span>="<span class="property">background-image:</span> url(http://www.foo.com/image.gif)"\>text\</**body**\>

</div>

**Browser Peculiarities**

- **Internet Explorer**
  **4.0:**
  \- This property does not apply to HR elements, checkbox or radio form fields, or select/option lists.
  **5.0+:**
  \- This property now applies to HR elements, checkbox and radio form fields.
- **Netscape**
  **4.x:**
  \- Applying this property to hyperlinks makes them unusable!
  \- This property does not apply to DT/DD, IMG, HR, TABLE, and form field elements.
  \- Applying this property to inline elements makes them block elements.
  \- This property does not apply a background-image to LI elements, but the element content is shifted downward slightly.
  \- This property does not apply a background-image to form elements, but a linefeed is automatically placed after the element.
  \- Selection lists and Textareas are destroyed if this property is used. The content is stripped out and displayed as normal text, with the background-image applied, with a linefeed directly following.
- **Opera**
  **3.5:**
  \- This property does not apply to inline elements, TD/TH, IMG, HR, TABLE, and form field elements.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
