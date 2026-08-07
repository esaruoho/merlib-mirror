---
title: "Layout-Flow - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/intl/lflow.htm
order: 1461
reachable_from_entry: false
images: 0
internal_links: 9
extracted: 2026-08-07T05:55:11Z
extractor: site_to_paper.py (pandoc)
---

# Layout-Flow - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/intl/lflow.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="layout-flow" class="pagetitle">layout-flow</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>IE5.5</em></strong>]<br />
</td>
<td colspan="2" style="text-align: center;"><strong>Other International Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;" data-valign="top"><a href="unibidi.htm">unicode-bidi</a><br />
<a href="direction.htm">direction</a><br />
<a href="ralign.htm">ruby-align</a><br />
<a href="roverhang.htm">ruby-overhang</a><br />
<a href="rposition.htm">ruby-position</a><br />
<a href="linebreak.htm">line-break</a><br />
<a href="wordbreak.htm">word-break</a><br />
<a href="writingmode.htm">writing-mode</a><br />
</td>
<td style="text-align: center;" data-valign="top"><a href="imemode.htm">ime-mode</a><br />
<a href="textjustify.htm">text-justify</a><br />
<a href="textaspace.htm">text-autospace</a><br />
<a href="textkspace.htm">text-kashida-space</a><br />
<a href="lgrid.htm">layout-grid</a><br />
<a href="lgmode.htm">layout-grid-mode</a><br />
<a href="lgtype.htm">layout-grid-type</a><br />
<a href="lgline.htm">layout-grid-line</a><br />
<a href="lgchar.htm">layout-grid-char</a><br />
<a href="lgcharspace.htm">layout-grid-char-spacing</a><br />
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
<td><strong>horizontal</strong></td>
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
<td>NA<br />
</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

**What is it?**  
This property controls the direction and flow of the content in an element. Its use is deprecated in favor of the 'writing-mode' property which accomplishes the same purpose.

<!-- -->

\
**Allowed Values**\
**horizontal**\
\[***IE5.5***\]  
**Type:** Explicit

**Description:**\
Character glyphs flow one after another from the source content from left to right, starting from the top of the element's rendering box. When a new line is started, it starts below the previous line at the left-hand side of the element's rendering box. This is the layout mode used in most Roman-based documents.

**vertical-ideographic**\
\[***IE5.5***\]  
**Type:** Explicit

**Description:**\
Character glyphs flow one after another from the source content from top to bottom, starting from the right side of the element's rendering box. When a new line is started, it starts to the left of the previous line at the top side of the element's rendering box. Full-width characters are rendered with their top on the same side as the top of the rendering box, and half-width characters (select kana glyphs and western characters) are rendered rotated 90 degrees clockwise to the original rendering box's orientation. This layout mode is used in East Asian typography.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **div** { <span class="property">layout-flow:</span> vertical-ideographic; }

</div>

<div class="example">

In-Line:  \<**div** <span class="tagattrib">STYLE</span>="<span class="property">layout-flow:</span> vertical-ideographic"\>Content rendered vertically\</**div**\>

</div>

**Browser Peculiarities**

- The IE online reference mentions that the use of this property is deprecated in favor of the 'writing-mode' property. These properties seem to do mostly the same thing, and were introduced at the same time - I wonder why the duplication exists.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
