---
title: "Orphans - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/print/orphans.htm
order: 1468
reachable_from_entry: false
images: 0
internal_links: 8
extracted: 2026-08-07T05:55:11Z
extractor: site_to_paper.py (pandoc)
---

# Orphans - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/print/orphans.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="orphans" class="pagetitle">orphans</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS2</em></strong>] [<strong><em>O3.5</em></strong>]<br />
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
<a href="size.htm">size</a><br />
<a href="widows.htm">widows</a><br />
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
<td><strong>2</strong></td>
</tr>
<tr>
<th style="text-align: left;"><strong>Applicable Elements:</strong><br />
</th>
<td>Block elements</td>
</tr>
<tr>
<th style="text-align: left;"><strong>Inherit From Parent:</strong><br />
</th>
<td>Yes</td>
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
This property specifies the minimum number of lines of content for the current element that must be left at the bottom of a page in a paged display environment.

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\] \[***O4***\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**\[integer\]**\
\[***CSS2***\] \[***O3.5***\]  
**Type:** Explicit

**Description:**\
Specifies an integer value representing the minimum number of lines of content that must be left at the bottom of a page.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **p** { <span class="property">orphans:</span> 4 }

</div>

<div class="example">

In-Line: \<**p** <span class="tagattrib">STYLE</span>="<span class="property">orphans:</span> 4"\>test text in the paragraph\</**p**\>

</div>

**Browser Peculiarities**

- Nothing to report.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
