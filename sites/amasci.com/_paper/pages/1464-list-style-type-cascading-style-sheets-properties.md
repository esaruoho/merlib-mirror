---
title: "List-Style-Type - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/list/lstype.htm
order: 1464
reachable_from_entry: false
images: 0
internal_links: 7
extracted: 2026-08-07T05:55:11Z
extractor: site_to_paper.py (pandoc)
---

# List-Style-Type - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/list/lstype.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="list-style-type" class="pagetitle">list-style-type</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS1</em></strong>|<strong>CSS2</strong>] [<strong>IE4B2</strong>|<strong><em>N4B5</em></strong>|<strong>O3.5</strong>]<br />
</td>
<td colspan="2" style="text-align: center;"><strong>Other List-Style Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;" data-valign="top"><a href="markeroff.htm">marker-offset</a><br />
<a href="liststyle.htm">list-style</a><br />
</td>
<td style="text-align: center;" data-valign="top"><a href="lsposition.htm">list-style-position</a><br />
<a href="lsimage.htm">list-style-image</a><br />
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
<td><strong>disc</strong></td>
</tr>
<tr>
<th style="text-align: left;"><strong>Applicable Elements:</strong><br />
</th>
<td>All elements with a default or assigned <span class="property">display</span> property value of '<strong>list-item</strong>'</td>
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
<td>&lt;<strong>ul</strong> <span class="tagattrib">TYPE</span>&gt; | &lt;<strong>ol</strong> <span class="tagattrib">TYPE</span>&gt; | &lt;<strong>li</strong> <span class="tagattrib">TYPE</span>&gt;</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

**What is it?**  
This property is used when the author wishes to change the default appearance of list-markers in HTML list structures. If a 'list-style-image' property is also given and it has a value of 'none' or the URL can not be loaded, the 'list-style-type' property value will be used in its place. This property should always be specified in the event the URL pointed to in 'list-style-image' can not be loaded. If a value for this property is not understood, the value 'decimal' should be used.\
\
**NOTE:**\
Although the CSS specs say that this property is inherited, in practice it is a different matter. IE, Netscape and Opera all treat this as a non-inherited property - nested lists do not inherit the list-style-type from the parent.

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\] \[***N6***\|**O7**\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**none**\
\[***CSS1***\|**CSS2**\] \[**IE4B2**\|***N4B5***\|**O3.5**\]  
**Type:** Explicit

**Description:**\
No list-marker will be displayed for each list item.

**disc \| circle \| square**\
\[***CSS1***\|**CSS2**\] \[**IE4B2**\|***N4B5***\|**O3.5**\]  
**Type:** Explicit

**Description:**\
This specifies standard symbols to use as non-ordered list markers. For each successive list-item, the symbol will remain the same.\
   - '**disc**': Solid bullet\
   - '**circle**': Hollow bullet.\
   - '**square**': Solid square.

**decimal**\
\[***CSS1***\|**CSS2**\] \[**IE4B2**\|***N4B5***\|**O3.5**\]  
**Type:** Explicit

**Description:**\
This specifies a standard set of symbols to use as ordered list markers. The values increment with each successive list item using a numeric sequence, eg: decimal integers - 1, 2, 3, 4, 5,...

**decimal-leading-zero**\
\[***CSS2***\] \[***N6***\]  
**Type:** Explicit

**Description:**\
This specifies a standard set of symbols to use as ordered list markers. The values increment with each successive list item using a numeric sequence, eg: decimal integers padded by initial zeros - 01, 02, 03, 04, 05,...

**lower-roman \| upper-roman**\
\[***CSS1***\|**CSS2**\] \[**IE4B2**\|***N4B5***\|**O3.5**\]  
**Type:** Explicit

**Description:**\
This specifies a standard set of symbols to use as ordered list markers. The values increment with each successive list item using an alpha-numeric sequence, eg:\
   lower-roman - i, ii, iii, iv, v,...\
   upper-roman - I, II, III, IV, V,...

**lower-alpha \| upper-alpha**\
\[***CSS1***\|**CSS2**\] \[**IE4B2**\|***N4B5***\|**O3.5**\]  
**Type:** Explicit

**Description:**\
This specifies a standard set of symbol systems to use as ordered list markers. The values increment with each successive list item using an alphabetic sequence, eg:\
   lower-alpha - a, b, c, d, e,...\
   upper-alpha - A, B, C, D, E,...

**lower-greek \| lower-latin \| upper-latin**\
\[***CSS2***\] \[***N6***\|**O6**\]  
**Type:** Explicit

**Description:**\
This specifies a standard set of symbol systems to use as ordered list markers. The values increment with each successive list item using an alphabetic sequence, eg:\
   lower-greek - \[alpha\], \[beta\], \[gamma\], \[delta\],...\
   lower-latin - lower case latin letters\
   upper-latin - upper case latin letters

**armenian \| georgian \| hebrew**\
\[***CSS2***\] \[***N6***\|**O6**\]  
**Type:** Explicit

**Description:**\
This specifies a standard set of symbol systems to use as ordered list markers. The values increment with each successive list item using an alphabetic sequence, eg:\
   armenian - traditional Armenian numbering\
   georgian - traditional Georgian numbering\
   hebrew - traditional Hebrew numbering\

**cjk-ideographic \| hiragana \| katakana \| hiragana-iroha \| katakana-iroha**\
\[***CSS2***\] \[***N6***\]  
**Type:** Explicit

**Description:**\
This specifies a standard set of symbol systems to use as ordered list markers. The values increment with each successive list item using an alphabetic sequence, eg:\
   cjk-ideographic - 'plain ideographic numbers'\
   hiragana - Japanese phonetic Hiragana ordering: a, i, u, e, o, ka, ki,...\
   katakana - Japanese phonetic Katakana ordering: a, i, u, e, o, ka, ki,...\
   hiragana-iroha - Japanese phonetic Hiragana ordering: i, ro, ha, ni, ho, he, to,...\
   katakana-iroha - Japanese phonetic Katakana ordering: i, ro, ha, ni, ho, he, to,...

**\[Netscape Proprietary\]**\
\[***N6***\]  
**Type:** Explicit

**Description:**\
These are proprietary values found in the Mozilla code, and at least some of them seem to work. There is no documentation though for them, so here they are without preamble...\
**-moz_cjk_heavenly_stem**, **-moz_cjk_earthly_branch**, **-moz_trad_chinese_informal**, **-moz_trad_chinese_formal**, **-moz_simp_chinese_informal**, **-moz_simp_chinese_formal**, **-moz_japanese_informal**, **-moz_japanese_formal**, **-moz_arabic_indic**, **-moz_persian**, **-moz_urdu**, **-moz_devanagari**, **-moz_gurmukhi**, **-moz_gujarati**, **-moz_oriya**, **-moz_kannada**, **-moz_malayalam**, **-moz_bengali**, **-moz_tamil**, **-moz_telugu**, **-moz_thai**, **-moz_lao**, **-moz_myanmar**, **-moz_khmer**, **-moz_hangul**, **-moz_hangul_consonant**

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **ul** { <span class="property">list-style-type:</span> square }

</div>

<div class="example">

In-Line: \<**ul**\>\<**li** <span class="tagattrib">STYLE</span>="<span class="property">list-style-type:</span> square"\>test text in the list item\</**li**\>\</**ul**\>

</div>

**Browser Peculiarities**

- **Internet Explorer**
  **4.0:**
  \- If this property is applied to list items (LI), it also applies to any LIs that follow.
  **4.0+:**
  \- Does not apply to elements with assigned 'display' property of "list-item" and does not apply to DL/DT/DD.
  \- UL elements have a default 'list-style-type' value of "disc", OL default value is "decimal."
- **Netscape**
  **4.x:**
  \- Does not apply to elements with assigned 'display' property of "list-item" and does not apply to DL/DT/DD.
  \- UL elements have a default 'list-style-type' value of "disc", OL default value is "decimal."
  \- Adding border/margin/padding properties to UL/OL/LI elements with the 'list-style-type' property set to "none" still renders the list markers.
  \- Applying this property to list items (LI) has odd effects (LI):\
     If OL list: only "decimal", "lower-roman", "upper-roman", "lower-alpha", and "upper-alpha" work\
     If UL list: only "none", "disc", "circle" and "square" work correctly; values of "decimal", "lower-roman", "upper-roman", "lower-alpha", and "upper-alpha" are treated as "circle."
  \- *WEIRD*: A value of "armenian" is treated like "lower-alpha" for OL/UL lists, but ignored for list items (LI).
  \- *WEIRD*: A value of "hebrew" is treated like "lower-alpha" for list items (LI), but ignored for OL/UL lists.
  \- Reported elsewhere: Macintosh versions display a question mark character "?" in place of the marker when this property is set to "none."
  **6.x:**
  \- Of the Eastern European/Middle Eastern list-style-types, Netcscape 6 appears to render "hebrew" correctly, but with "armenian" and "georgian" it "tries" to display something other than the default value, but it is failing in those cases. Admittedly, I may not have the correct character sets installed on my system.
- **Opera**
  **3.5:**
  \- Does not apply to elements with assigned 'display' property of "list-item" and does not apply to DL/DT/DD.
  \- If this property is applied to list items (LI), it also applies to any LIs that follow.
  \- UL elements have a default 'list-style-type' value of "disc", OL default value is "decimal."
  **3.5+:**
  \- Using a keyword of "inherit" makes the list-style-type "none" - it doesn't display any marker. It certainly isn't inheriting properly, and it isn't using the property default of "disc", so this looks like a bug.
  **6.0:**
  \- Of the Greek/Latin/Eastern European/Middle Eastern list-style-types, Opera appears to get "lower-greek", "armenian" and "georgian" correct. It appears to fail on "lower-latin", "upper-latin" and "hebrew". Admittedly, I can not read these languages, and I may not have the correct character sets installed on my system, but Netscape 6 on the same system can display these fine.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
