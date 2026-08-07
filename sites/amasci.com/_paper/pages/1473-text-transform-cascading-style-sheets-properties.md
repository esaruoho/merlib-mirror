---
title: "Text-Transform - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/text/texttrans.htm
order: 1473
reachable_from_entry: false
images: 0
internal_links: 8
extracted: 2026-08-07T05:55:12Z
extractor: site_to_paper.py (pandoc)
---

# Text-Transform - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/text/texttrans.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="text-transform" class="pagetitle">text-transform</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS1</em></strong>|<strong>CSS2</strong>] [<strong>IE4B1</strong>|<strong><em>N4B2</em></strong>|<strong>O3.5</strong>]<br />
</td>
<td colspan="2" style="text-align: center;"><strong>Other Text Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;" data-valign="top"><a href="wordspace.htm">word-spacing</a><br />
<a href="letterspace.htm">letter-spacing</a><br />
<a href="whitespace.htm">white-space</a><br />
<a href="wordwrap.htm">word-wrap</a><br />
<a href="textalign.htm">text-align</a><br />
</td>
<td style="text-align: center;" data-valign="top"><a href="textalignlast.htm">text-align-last</a><br />
<a href="textdec.htm">text-decoration</a><br />
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
This property sets the casing style for a section of text. Content may not be affected if it is not in the ISO 8859-1 character set or does not have an applicable alternate case character to convert to.

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\] \[**N6**\|***O4***\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**none**\
\[***CSS1***\|**CSS2**\] \[**IE4B1**\|***N4B2***\|**O3.5**\]  
**Type:** Explicit

**Description:**\
No transforming is done. This neutralizes the inherited value.

**capitalize**\
\[***CSS1***\|**CSS2**\] \[**IE4B1**\|***N4B2***\|**O3.5**\]  
**Type:** Explicit

**Description:**\
Uppercases the first letter of every word.

**uppercase**\
\[***CSS1***\|**CSS2**\] \[**IE4B1**\|***N4B2***\|**O3.5**\]  
**Type:** Explicit

**Description:**\
All text in the section is forced to upper case.

**lowercase**\
\[***CSS1***\|**CSS2**\] \[**IE4B1**\|***N4B2***\|**O3.5**\]  
**Type:** Explicit

**Description:**\
All text in the section is forced to lower case.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **div** { <span class="property">text-transform:</span> capitalize }

</div>

<div class="example">

In-Line:  \<**div** <span class="tagattrib">STYLE</span>="<span class="property">text-transform:</span> capitalize"\>This is a capitalization test.\</**div**\>

</div>

**Notes**

- **CSS1 Conformance:** Any element with content not from the ISO-8859-1 character set may ignore this property (treat it as though the value were set to "none".)
- The "capitalize" value only appears to act upon the first characters of each word. If characters other than the first character in a word are already capitalized, they will remain capitalized (eg: if a phrase is all-caps, it will remain all-caps if this property value is applied.)

**Browser Peculiarities**

- **Netscape**
  **4.x:**
  \- Non-ASCII characters with different upper/lower case versions can not be transformed with this property.
  \- When a word contains a nested element, the first character in the word following the nested element will use the value of the 'text-transform' property. (eg: \<**span** <span class="tagattrib">STYLE</span>="text-transform: capitalize"\>text\<**b**\>foo\</**b**\>zoo\</**span**\> would result in the letter "z" being capitalized in addition to the first letter "T".)
  \- The non-breaking space (\&nbsp;/\&#160;) is not considered to be a word breaking character - it should be.
  \- This property does not inherit to child elements like it should.
- **Opera**
  **3.5:**
  \- The non-breaking space (\&nbsp;/\&#160;) is not considered to be a word breaking character - it should be.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
