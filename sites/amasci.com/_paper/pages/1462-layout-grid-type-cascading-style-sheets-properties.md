---
title: "Layout-Grid-Type - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/intl/lgtype.htm
order: 1462
reachable_from_entry: false
images: 0
internal_links: 9
extracted: 2026-08-07T05:55:11Z
extractor: site_to_paper.py (pandoc)
---

# Layout-Grid-Type - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/intl/lgtype.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="layout-grid-type" class="pagetitle">layout-grid-type</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>IE5</em></strong>]<br />
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
<a href="lflow.htm">layout-flow</a><br />
<a href="lgrid.htm">layout-grid</a><br />
<a href="lgmode.htm">layout-grid-mode</a><br />
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
<td><strong>loose</strong></td>
</tr>
<tr>
<th style="text-align: left;"><strong>Applicable Elements:</strong><br />
</th>
<td>Block-level elements</td>
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
This property controls the type of layout grid used when rendering an element's text content.

<!-- -->

\
**Allowed Values**\
**loose**\
\[***IE5***\]  
**Type:** Explicit

**Description:**\
Indicates the line-grid commonly used in Chinese and Korean text display. Chinese characters, kana and wide characters have the grid applied. All other characters are rendered as if 'layout-grid-mode' was set to "none" or "line". CSS properties and values that would otherwise change the width of a character (such as 'text-align: justify') are disabled.

**strict**\
\[***IE5***\]  
**Type:** Explicit

**Description:**\
Indicates the line-grid used in Japanese text display. Narrow characters (except content from "cursive" fonts) get half the grid increment applied to wide characters. Wide characters receive a grid increment if no other width adjustment is used.

**fixed**\
\[***IE5***\]  
**Type:** Explicit

**Description:**\
The type of line-grid used in mono-space layout. All characters receive and are centered within an equal grid spacing (except content from "cursive" fonts.) CSS properties and values that would otherwise change the width of a character (such as 'text-align: justify') are disabled.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **div** { <span class="property">layout-grid-mode:</span> both; <span class="property">layout-grid-type:</span> loose; <span class="property">layout-grid-char-spacing:</span> 15px }

</div>

<div class="example">

In-Line:  \<**div** <span class="tagattrib">STYLE</span>="<span class="property">layout-grid-mode:</span> both; <span class="property">layout-grid-type:</span> loose;\
<span class="property">layout-grid-char-spacing:</span> 15px"\>Content snapped to a layout grid\</**div**\>

</div>

**Browser Peculiarities**

- Nothing to report yet.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
