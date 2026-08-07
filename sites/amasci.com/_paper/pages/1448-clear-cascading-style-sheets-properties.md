---
title: "Clear - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/classify/clear.htm
order: 1448
reachable_from_entry: false
images: 0
internal_links: 11
extracted: 2026-08-07T05:55:10Z
extractor: site_to_paper.py (pandoc)
---

# Clear - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/classify/clear.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="clear" class="pagetitle">clear</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS1</em></strong>|<strong>CSS2</strong>] [<strong>IE4B2</strong>|<strong><em>N4B2</em></strong>|<strong>O3.5</strong>]<br />
</td>
<td colspan="2" style="text-align: center;"><strong>Other Classification Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;"><a href="display.htm">display</a><br />
<a href="visibility.htm">visibility</a><br />
</td>
<td style="text-align: center;"><a href="position.htm">position</a><br />
<a href="float.htm">float</a><br />
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
<td>Block level elements (including floated elements)</td>
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
<td>&lt;<strong>br</strong> <span class="tagattrib">CLEAR</span>= left|right|all&gt;<br />
</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

**What is it?**  
This property specifies whether the current element allows floated elements occuring earlier in the document to float along its sides. The values for this property indicate which sides of the element do not allow floating elements. If the current element has any floating sub-elements, the property does not apply to them.

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\] \[**N6**\|***O4***\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**none**\
\[***CSS1***\|**CSS2**\] \[**IE4B2**\|***N4B2***\|**O3.5**\]  
**Type:** Explicit

**Description:**\
No restriction is made on floating element placement behavior.

**left**\
\[***CSS1***\|**CSS2**\] \[**IE4B2**\|***N4B2***\|**O3.5**\]  
**Type:** Explicit

**Description:**\
The current element is shifted such that the top edge of the top margin is below the bottom edge of any left-floated elements previously occuring in the document.

**right**\
\[***CSS1***\|**CSS2**\] \[**IE4B2**\|***N4B2***\|**O3.5**\]  
**Type:** Explicit

**Description:**\
The current element is shifted such that the top edge of the top margin is below the bottom edge of any right-floated elements previously occuring in the document.

**both**\
\[***CSS1***\|**CSS2**\] \[**IE4B2**\|***N4B2***\|**O3.5**\]  
**Type:** Explicit

**Description:**\
The current element is shifted such that the top edge of the top margin is below the bottom edge of any floated elements previously occuring in the document.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **address** { <span class="property">clear:</span> both }

</div>

<div class="example">

In-Line:  \<**address** <span class="tagattrib">STYLE</span>="<span class="property">clear:</span> both"\>This is a test document\</**address**\>

</div>

**Notes**

- In CSS1 this property applied to all elements. CSS2 changes this, stating that it should only be applied to block elements.

**Browser Peculiarities**

- **Internet Explorer**
  **4.0+:**
  \- This property does not always behave well with the 'float' property.
- **Netscape**
  **4.x:**
  \- This property doesn't behave particularly well with the 'float' property.
- **Opera**
  **3.5:**
  \- This property doesn't behave particularly well with the 'float' property.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
