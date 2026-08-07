---
title: "Size - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/print/size.htm
order: 1469
reachable_from_entry: false
images: 0
internal_links: 8
extracted: 2026-08-07T17:07:46Z
extractor: site_to_paper.py (pandoc)
---

# Size - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/print/size.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="size" class="pagetitle">size</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS2</em></strong>] [<strong><em>O4</em></strong>]<br />
</td>
<td colspan="2" style="text-align: center;"><strong>Other Printing Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;" data-valign="top"><a href="pbbefore.htm">page-break-before</a><br />
<a href="pbinside.htm">page-break-inside</a><br />
<a href="pbafter.htm">page-break-after</a><br />
<a href="page.htm">page</a><br />
</td>
<td style="text-align: center;" data-valign="top"><a href="marks.htm">marks</a><br />
<a href="widows.htm">widows</a><br />
<a href="orphans.htm">orphans</a><br />
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
<td><strong>auto</strong></td>
</tr>
<tr>
<th style="text-align: left;"><strong>Applicable Elements:</strong><br />
</th>
<td>Page context</td>
</tr>
<tr>
<th style="text-align: left;"><strong>Inherit From Parent:</strong><br />
</th>
<td>NA</td>
</tr>
<tr>
<th style="text-align: left;"><strong>Applicable Media:</strong><br />
</th>
<td>Visual, Paged</td>
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
This property describes the orientation or dimensions of the page box. The 'size' property classifies a page box so that it is either 'relative' or 'absolute'. 'Absolute' page boxes have a fixed size, whereas 'relative' page boxes will be scaled to fit the target paged media. In the case where a page box is smaller than the intended 'size', CSS2 recommends that it be centered on the page to allow for better alignment of multiple pages.

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**auto**\
\[***CSS2***\] \[***O4***\]  
**Type:** Explicit

**Description:**\
This value defines a 'relative' page box, setting the values to the size and orientation of the target page.

**portrait**\
\[***CSS2***\]  
**Type:** Explicit

**Description:**\
This value defines a 'relative' page box, overriding the target page's current default content orientation, using the typical paradigm where content flows from left to right across the short dimension, and flowing down along the long dimension.

**landscape**\
\[***CSS2***\]  
**Type:** Explicit

**Description:**\
This value defines a 'relative' page box, overriding the target page's current default content orientation, using the landscape method, where content flows from left to right across the long dimension, and flowing down along the short dimension. This method is often used when a given line will contain larger amounts of content than normal.

**\[length\]**\
\[***CSS2***\] \[***O4***\]  
**Type:** Explicit

**Description:**\
Giving length values for this property creates a page box with fixed dimensions, eg: an 'absolute' page box. Setting only one length value with this value creates a square page box of equal height and width. If two values are specified, the first value represents the page width, and the second represents the page height.

**Syntax**

**selector** { <span class="property">size:</span> \[length\]{1,2} \| auto \| portrait \| landscape \| inherit }

**Example**  
<div class="example">

Ext/Doc: **body** { <span class="property">size:</span> 8.5in 11in }

</div>

<div class="example">

In-Line: \<**body** <span class="tagattrib">STYLE</span>="<span class="property">size:</span> 8.5in 11in"\>test text in the paragraph\</**body**\>

</div>

**Notes**

- CSS2 notes that for page boxes that do not fit target page dimensions, a browser should attempt to:\
  - "Rotate the page box 90 degrees if this will make the page box fit."\
  - "Scale the page to fit the target."\
  CSS2 also states that the user *should* be consulted before making these changes.
- Before its inclusion in CSS2, this property was first proposed in the W3C Working Draft "CSS Printing Extensions" (6/26/97, <http://www.w3.org/TR/WD-print>)

**Browser Peculiarities**

- Nothing to report.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
