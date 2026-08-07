---
title: "Position - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/classify/position.htm
order: 1451
reachable_from_entry: false
images: 0
internal_links: 11
extracted: 2026-08-07T17:07:45Z
extractor: site_to_paper.py (pandoc)
---

# Position - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/classify/position.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="position" class="pagetitle">position</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS2</em></strong>] [<strong><em>IE4</em></strong>|<strong><em>N4</em></strong>|<strong>O4</strong>]<br />
</td>
<td colspan="2" style="text-align: center;"><strong>Other Classification Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;"><a href="display.htm">display</a><br />
<a href="visibility.htm">visibility</a><br />
</td>
<td style="text-align: center;"><a href="float.htm">float</a><br />
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
<td><strong>static</strong></td>
</tr>
<tr>
<th style="text-align: left;"><strong>Applicable Elements:</strong><br />
</th>
<td>All (except generated content)</td>
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
This property determines whether normal, relative or absolute positioning methods are used to render the current element box.

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\] \[**N6**\|***O4***\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**static**\
\[***CSS2***\] \[***IE4***\|***N4***\|**O4**\]  
**Type:** Explicit

**Description:**\
This is the default positioning scheme, where elements are rendered in order, as they appear in the document flow. The 'top', 'left', 'right' and 'bottom' properties have no effect if this value is set.

**relative**\
\[***CSS2***\] \[***IE4***\|***N4***\|**O4**\]  
**Type:** Explicit

**Description:**\
The element's normal document flow position is calculated as if the element had a 'position' value of 'static'. It is then offset from this position according to the 'top' and 'left' properties. Any elements that come after this element will be laid out as if the element had not been offset (a phantom height and width for the element is reserved in the normal document flow.)

**absolute**\
\[***CSS2***\] \[***IE4***\|***N4***\|**O4**\]  
**Type:** Explicit

**Description:**\
This specifies that the element box be absolutely positioned using the 'top', 'left', 'right' and 'bottom' properties. These values use the element box's containing block as origin. Absolutely positioned elements do *NOT* exist in the normal document flow like relatively positioned elements are - elements that follow will flow as if the absolutely positioned element does not exist.

**fixed**\
\[***CSS2***\] \[**N6.1**\|***O4***\]  
**Type:** Explicit

**Description:**\
This value behaves like 'absolute' in all respects, but additionally, the positioned element box is fixed with respect to a reference point. In scrolling media, it is in reference to some fixed point on the screen; in paged media (printing) it will be in reference to a point on the page. The positioned element will not move with respect to that stationary point (eg, it will not moved when, say, the screen is scrolled.)

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **h2** { <span class="property">display:</span> block; <span class="property">position:</span> absolute;\
<span class="property">top:</span> 20px; <span class="property">right:</span> 50px; <span class="property">bottom:</span> 20px; <span class="property">left:</span> 50px }

</div>

<div class="example">

In-Line:  \<**h2** <span class="tagattrib">STYLE</span>="<span class="property">display:</span> block; <span class="property">position:</span> absolute;\
<span class="property">top:</span> 20px; <span class="property">right:</span> 50px; <span class="property">bottom:</span> 20px; <span class="property">left:</span> 50px"\>text\</**h2**\>

</div>

**Notes**

- CSS2 recommends that if the value of 'fixed' is used, it should be specified on a case-by-case basis depending on the media.
- Page-breaks may not occur inside boxes that are absolutely positioned.
- Before its inclusion in CSS2, this property was first proposed in the W3C Working Draft "Positioning HTML Elements with Cascading Style Sheets" (8/19/97, <http://www.w3.org/TR/WD-positioning>)

**Browser Peculiarities**

- **Internet Explorer**
  **4.0:**
  \- Absolute positioning applied to hyperlinks does not position the element, and the hyperlink is unusable.
  \- Absolute positioning does not work for inline elements, list structures OL/UL/DL, LI/DT/DD and table cells. (In IE5 it works for these elements.)
  **4.0+:**
  \- Relative positioning does not apply to table cells (TH/TD.)
  \- The 'top' and 'left' properties must also be specified if Absolute positioning is used. Otherwise, element placement may overlap content in unpredictable ways.
- **Netscape**
  **4.x:**
  \- Relative positioning does not apply to LI/DT/DD, form fields, IMG, TABLE or table cells (TH/TD.)
  \- Absolute positioning does not apply to LI/DT/DD, or form fields.
  \- Applying Absolute positioning to the TABLE element strips all the text content out of the table and serializes it, rendering it at the specified position with no formatting.
  \- Applying this "position: absolute" to hyperlink elements positions the element, but the hyperlink is unusable. If "position: relative" is used, the active/clickable area is the region where the hyperlink would have been displayed if the "relative" value had not been assigned.
  \- Absolute positioning values are computed relative to the BODY element, not an element's parent element.
  \- The 'top' and 'left' properties must also be specified if Absolute positioning is used. Otherwise, element placement may overlap content in unpredictable ways.
  \- Absolute positioning does not appear to apply directly to IMG elements.
  \- Absolute positioning appears to cause random rendering bugs. In my test page with dozens of positioned elements, positioned elements may or may not appear (it seems random) upon refresh.
  \- Form elements are always rendered on top of absolutely or relatively positioned elements, regardless of where they are located in the document tree or any 'z-index' value specified.
  \- If a form field is contained within an element that is absolutely or relatively positioned, it disappears.
  \- If a relative or absolutely positioned element is nested inside another relative or absolutely positioned element, any further application of CSS is broken - no properties will be applied.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
