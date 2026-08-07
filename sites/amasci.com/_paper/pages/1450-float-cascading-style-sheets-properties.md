---
title: "Float - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/classify/float.htm
order: 1450
reachable_from_entry: false
images: 0
internal_links: 11
extracted: 2026-08-07T17:07:45Z
extractor: site_to_paper.py (pandoc)
---

# Float - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/classify/float.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="float" class="pagetitle">float</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS1</em></strong>|<strong>CSS2</strong>] [<strong>IE4B2</strong>|<strong><em>N4B3</em></strong>|<strong>O3.5</strong>]<br />
</td>
<td colspan="2" style="text-align: center;"><strong>Other Classification Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;"><a href="display.htm">display</a><br />
<a href="visibility.htm">visibility</a><br />
</td>
<td style="text-align: center;"><a href="position.htm">position</a><br />
<a href="clear.htm">clear</a><br />
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
<td>All (excepting generated content and positioned elements)</td>
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
<td>&lt;<strong>applet|iframe|img|object|spacer|table</strong> <span class="tagattrib">ALIGN</span>="right,left"&gt;</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

**What is it?**  
Floating elements are elements whose rendering boxes are shifted to the left or right side of the current line. Content boxes that follow are rendered along the side of the floated element; down the right side of elements floated to the left, and down the left side of elements floated to the right. This property controls this floating behavior, specifying an element float to the left, right, or not at all. For correct rendering, a floated element needs to have an intrinsic or assigned 'width' value.

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\] \[***N6***\|**O7**\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**none**\
\[***CSS1***\|**CSS2**\] \[**IE4B2**\|***N4B3***\|**O3.5**\]  
**Type:** Explicit

**Description:**\
The element box is not floated.

**left**\
\[***CSS1***\|**CSS2**\] \[**IE4B2**\|***N4B3***\|**O3.5**\]  
**Type:** Explicit

**Description:**\
The current element box will be floated to the left. Subsequent content flows around it to the right, starting at the top of the element box If this value is given, the 'display' property for the current element is ignored, unless it has the value 'none'.

**right**\
\[***CSS1***\|**CSS2**\] \[**IE4B2**\|***N4B3***\|**O3.5**\]  
**Type:** Explicit

**Description:**\
The current element box will be floated to the right. Subsequent content flows around it to the left, starting at the top of the element box If this value is given, the 'display' property for the current element is ignored, unless it has the value 'none'.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **img.test** { <span class="property">float:</span> left }

</div>

<div class="example">

In-Line:  \<**img** <span class="tagattrib">SRC</span>="image.gif" <span class="tagattrib">STYLE</span>="<span class="property">float:</span> left"\>This\
is text following the image. It floats on the right.

</div>

**Notes**

- If there isn't enough room on a line horizontally, a float will be shifted downward, line by line, until a line has enough room.
- Float element overlap -\
  Inline boxes: content, background, and borders of the inline box should be rendered in front of the float.\
  Block boxes: background and borders of the block box should be rendered behind the float (but visible for portions of the floated element that are transparent.) The content of the block box should be rendered in front of the float.

**Browser Peculiarities**

- **Internet Explorer**
  **4.0:**
  \- This property does not apply to inline elements, list structures (UL/OL/DL), list items (LI/DT/DD), TABLE or table cells (TH/TD.)
  \- Macintosh - Reported Elsewhere: Margins on floats do not work correctly.
  **5.0:**
  \- This property now applies to inline elements, list structures (UL/OL/DL), and list items (LI/DT/DD.)
- **Netscape**
  **4.x:**
  \- This property does not apply to list items (LI/DT/DD), TABLE or table cells (TH/TD.)
  \- Applying this property to SELECT or TEXTAREA elements destroys the form field, strips out the content and floats it as specified as plain text.
  \- Applying this property to OL lists changes it to a UL.
  \- Applying this property to OL/UL displays all markers as small bullets (not the default size), with the default list-style-position set to "inside" not "outside" as normal.
  \- This property appears to do odd things to inline elements. Difficult to determine what is really going on, but it appears to be attempting SOME sort of element floating.
  \- Netscape accepts an illegal value of "center" for this property, floating the specified element and unmarked content before it to the center of the page.
  \- Negative margins on some floated elements seem to ignore the float specification and only apply the margin value.
- **Opera**
  **3.5:**
  \- This property does not apply to list structures (OL/UL/DL), TABLE or table cells (TH/TD.)
  \- Floating form elements (INPUT/SELECT) makes them disappear!
  \- Floating a TEXTAREA destroys it and instead displays garbage characters!
  \- Floating an IMG to the right causes horizontal scrollbars to appear and the image to be placed partly off-screen.
  \- Floating a DT and DD to the same side places them on the same line.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
