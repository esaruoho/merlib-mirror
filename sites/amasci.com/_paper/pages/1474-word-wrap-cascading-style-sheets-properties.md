---
title: "Word-Wrap - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/text/wordwrap.htm
order: 1474
reachable_from_entry: false
images: 0
internal_links: 8
extracted: 2026-08-07T05:55:12Z
extractor: site_to_paper.py (pandoc)
---

# Word-Wrap - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/text/wordwrap.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="word-wrap" class="pagetitle">word-wrap</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>IE5.5B1</em></strong>]<br />
</td>
<td colspan="2" style="text-align: center;"><strong>Other Text Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;" data-valign="top"><a href="wordspace.htm">word-spacing</a><br />
<a href="letterspace.htm">letter-spacing</a><br />
<a href="whitespace.htm">white-space</a><br />
<a href="textalign.htm">text-align</a><br />
<a href="textalignlast.htm">text-align-last</a><br />
</td>
<td style="text-align: center;" data-valign="top"><a href="textdec.htm">text-decoration</a><br />
<a href="texttrans.htm">text-transform</a><br />
<a href="textshadow.htm">text-shadow</a><br />
<a href="textindent.htm">text-indent</a><br />
<a href="textunderpos.htm">text-underline-position</a><br />
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
<td><strong>normal</strong></td>
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
<th style="text-align: left;" data-valign="top"><strong>HTML Equivalent:</strong><br />
</th>
<td>NA</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

**What is it?**  
This property specifies whther the current rendered line should break if the content exceeds the boundary of the specified rendering box for an element (this is similar in some ways to the 'clip' and 'overflow' properties in intent.) This property should only apply if the element has a visual rendering, is an inline element with explicit height/width, is absolutely positioned and/or is a block element.

<!-- -->

\
**Allowed Values**\
**normal**\
\[***IE5.5B1***\]  
**Type:** Explicit

**Description:**\
Content will exceed the boundaries of the specified rendering box.

**break-word**\
\[***IE5.5B1***\]  
**Type:** Explicit

**Description:**\
Content will wrap to the next line when necessary, and a word-break will also occur if needed.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **div** { <span class="property">word-wrap:</span> break-word }

</div>

<div class="example">

In-Line:  \<**div** <span class="tagattrib">STYLE</span>="<span class="property">word-wrap:</span> break-word"\>This is the text content of this div element\</**div**\>

</div>

**Browser Peculiarities**

- Nothing to report.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
