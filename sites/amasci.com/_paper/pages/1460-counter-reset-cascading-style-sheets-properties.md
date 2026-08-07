---
title: "Counter-Reset - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/generate/counterreset.htm
order: 1460
reachable_from_entry: false
images: 0
internal_links: 7
extracted: 2026-08-07T17:07:46Z
extractor: site_to_paper.py (pandoc)
---

# Counter-Reset - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/generate/counterreset.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="counter-reset" class="pagetitle">counter-reset</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS2</em></strong>] [<strong><em>O4</em></strong>]<br />
</td>
<td style="text-align: center;"><strong>Other Generated<br />
Content Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;" data-valign="top"><a href="content.htm">content</a><br />
<a href="quotes.htm">quotes</a><br />
<a href="counterinc.htm">counter-increment</a><br />
<a href="incsource.htm">include-source</a><br />
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
<td><strong>none</strong></td>
</tr>
<tr>
<th style="text-align: left;"><strong>Applicable Elements:</strong><br />
</th>
<td>All</td>
</tr>
<tr>
<th style="text-align: left;"><strong>Inherit From Parent:</strong><br />
</th>
<td>No</td>
</tr>
<tr>
<th style="text-align: left;"><strong>Applicable Media:</strong><br />
</th>
<td>All</td>
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
The 'counter-reset' property acts like a variable assignment in a programming language - it sets a new value for the specified counter whenever the current CSS selector is encountered. The property lists one or more counter labels, each followed by an optional integer reset value (default reset value is 0.)\
\
If a counter is reset AND rendered using a single CSS selector (with the 'content' property and 'before:'/'after:' pseudo-elements), it should be reset first, then rendered. If a single CSS selector both increments and resets a counter, it is reset, then incremented.

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\] \[***O4***\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**none**\
\[***CSS2***\] \[***O4***\]  
**Type:** Explicit

**Description:**\
Suppresses reseting of counters for the current selector.

**\[identifier integer\]**\
\[***CSS2***\] \[***O4***\]  
**Type:** Explicit

**Syntax:** (\[identifier\] \[integer\]? )+

**Description:**\
Specifies one or more counters to reset and the values to reset each one to.

<!-- -->

**Example**  
<div class="example">

Ext/Doc:\
**h1:before** {\
<span class="property">counter-increment:</span> main-heading;\
<span class="property">counter-reset:</span> sub-heading;\
<span class="property">content:</span> "Section " counter(main-heading) ":" }

</div>

<div class="example">

In-Line: NA

</div>

**Notes**

- An element whose 'display' property is set to "none" *should not* be able to reset a counter.
- An element whose 'visibility' property is set to "hidden" *should* be able to reset a counter.

**Browser Peculiarities**

- Nothing to report.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
