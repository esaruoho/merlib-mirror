---
title: "Visibility - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/classify/visibility.htm
order: 1452
reachable_from_entry: false
images: 0
internal_links: 11
extracted: 2026-08-07T05:55:11Z
extractor: site_to_paper.py (pandoc)
---

# Visibility - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/classify/visibility.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="visibility" class="pagetitle">visibility</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS2</em></strong>] [<strong><em>IE4</em></strong>|<strong><em>N4</em></strong>|<strong>O4</strong>]<br />
</td>
<td colspan="2" style="text-align: center;"><strong>Other Classification Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;"><a href="display.htm">display</a><br />
<a href="position.htm">position</a><br />
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
<td><strong>visible</strong></td>
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
<td>&lt;<strong>layer</strong> <span class="tagattrib">VISIBILITY</span>=""&gt;<br />
</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

**What is it?**  
This property controls whether the content of an element box is rendered (including the borders and backgrounds.) If an element box is invisible it still affects document layout as if it were visible (to prevent an element box from affecting layout, the 'display' property should be set to 'none'.)

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\] \[***IE4***\|***N4***\|**O4**\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**visible**\
\[***CSS2***\] \[***IE4***\|**N4.5x**\|**O4**\]  
**Type:** Explicit

**Description:**\
The element box is visible.

**hidden**\
\[***CSS2***\] \[***IE4***\|**N4.5x**\|**O4**\]  
**Type:** Explicit

**Description:**\
The element box is invisible (completely transparent to content beneath), but still affects document layout flow as if it were visible.

**collapse**\
\[***CSS2***\] \[**N6**\|***O4***\]  
**Type:** Explicit

**Description:**\
Unless this value is used in the context of table rows or columns, it will have the same effect as 'hidden'. In the context of tables, spanned cells may be clipped and reacts similar to 'display: none' for the table element.

**hide**\
\[***<u>N4-4.x</u>***\]  
**Type:** Explicit

**Description:**\
The element box is invisible (completely transparent to content beneath), but still affects document layout flow as if it were visible.

**show**\
\[***<u>N4-4.x</u>***\]  
**Type:** Explicit

**Description:**\
The element box is visible.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **p** { <span class="property">visibility:</span> hidden }

</div>

<div class="example">

In-Line:  \<**p** <span class="tagattrib">STYLE</span>="<span class="property">visibility:</span> hidden"\>text\</**p**\>

</div>

**Notes**

- Before its inclusion in CSS2, this property was first proposed in the W3C Working Draft "Positioning HTML Elements with Cascading Style Sheets" (8/19/97, <http://www.w3.org/TR/WD-positioning>)
- In CSS2, this was not an "inherit from parent" property, and the default value was "inherit" (yes, a little odd, that =)). In CSS 2.1 the default changes to "visible" and it becomes an inherited-from-parent property (which is the way the browsers already treat it anyway.)

**Browser Peculiarities**

- **Internet Explorer**
  **4.0+:**
  \- Using a value of "hidden" for this property and a 'position' value of "absolute" will behave exactly the same as setting the 'display' property to "none."
- **Netscape**
  **4.x:**
  \- This property does not apply to LI/DT/DD, form fields, TABLE, and IMG elements.
  \- Using a value of "hide" for this property and a 'position' value of "absolute" will behave exactly the same as setting the 'display' property to "none."

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
