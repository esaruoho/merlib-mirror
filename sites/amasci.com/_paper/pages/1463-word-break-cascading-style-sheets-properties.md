---
title: "Word-Break - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/intl/wordbreak.htm
order: 1463
reachable_from_entry: false
images: 0
internal_links: 9
extracted: 2026-08-07T17:07:46Z
extractor: site_to_paper.py (pandoc)
---

# Word-Break - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/intl/wordbreak.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="word-break" class="pagetitle">word-break</h1>
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
<a href="writingmode.htm">writing-mode</a><br />
<a href="imemode.htm">ime-mode</a><br />
</td>
<td style="text-align: center;" data-valign="top"><a href="textjustify.htm">text-justify</a><br />
<a href="textaspace.htm">text-autospace</a><br />
<a href="textkspace.htm">text-kashida-space</a><br />
<a href="lflow.htm">layout-flow</a><br />
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
<td><strong>normal</strong></td>
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
This property controls the line breaking behavior within words. It is especially useful in cases where multiple languages are used within an element.

<!-- -->

\
**Allowed Values**\
**normal**\
\[***IE5***\]  
**Type:** Explicit

**Description:**\
Normal line breaking behavior for the language is used.

**break-all**\
\[***IE5***\]  
**Type:** Explicit

**Description:**\
Useful where content contains a majority of Asian character set content, to which this value behaves like 'normal'. Non-Asian character set content may be arbitrarily broken across lines.

**keep-all**\
\[***IE5***\]  
**Type:** Explicit

**Description:**\
Useful where content contains a minority of Asian character set content, to which content is not broken across lines. For non-Asian character set content, this value behaves like 'normal'.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **div** { <span class="property">word-break:</span> keep-all }

</div>

<div class="example">

In-Line:  \<**div** <span class="tagattrib">STYLE</span>="<span class="property">word-break:</span> keep-all"\>Western character set content\
mixed with a little Asian character set content.\</**div**\>

</div>

**Browser Peculiarities**

- Nothing to report yet.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
