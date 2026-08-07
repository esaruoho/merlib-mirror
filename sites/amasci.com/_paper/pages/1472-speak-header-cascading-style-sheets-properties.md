---
title: "Speak-Header - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/table/speakhead.htm
order: 1472
reachable_from_entry: false
images: 0
internal_links: 7
extracted: 2026-08-07T17:07:46Z
extractor: site_to_paper.py (pandoc)
---

# Speak-Header - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/table/speakhead.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="speak-header" class="pagetitle">speak-header</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS2</em></strong>]<br />
</td>
<td style="text-align: center;"><strong>Other Table Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;"><a href="bcollapse.htm">border-collapse</a><br />
<a href="bspace.htm">border-spacing</a><br />
<a href="capside.htm">caption-side</a><br />
<a href="emptycell.htm">empty-cells</a><br />
<a href="tlayout.htm">table-layout</a><br />
</td>
</tr>
<tr>
<td colspan="2" style="text-align: center;">= <span class="sitetitle">Index DOT Css</span> by <a href="../../../misc/email.htm">Brian Wilson</a> =<br />
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
<td><strong>once</strong></td>
</tr>
<tr>
<th style="text-align: left;"><strong>Applicable Elements:</strong><br />
</th>
<td>All elements carrying table header information</td>
</tr>
<tr>
<th style="text-align: left;"><strong>Inherit From Parent:</strong><br />
</th>
<td>Yes</td>
</tr>
<tr>
<th style="text-align: left;"><strong>Applicable Media:</strong><br />
</th>
<td>Aural</td>
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
This property specifies how often table headers are spoken in relation to their relevant data cells.

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**once**\
\[***CSS2***\]  
**Type:** Explicit

**Description:**\
The table header is spoken once before a series of cells.

**always**\
\[***CSS2***\]  
**Type:** Explicit

**Description:**\
The table header is spoken every time a relevant data cell is aurally rendered.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **table** { <span class="property">speak-header:</span> once }

</div>

<div class="example">

In-Line:  \<**table** <span class="tagattrib">STYLE</span>="<span class="property">speak-header:</span> once"\>

</div>

**Notes**

- HTML has several mechanisms for specifying table header information (the "axis", "headers" and "scope" attributes.)

**Browser Peculiarities**

- Nothing to report.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
