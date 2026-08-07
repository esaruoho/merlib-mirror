---
title: "Acronym"
source_domain: amasci.com
source_path: ~bloo/indexdot/html/tagpages/a/acronym.htm
order: 1562
reachable_from_entry: false
images: 0
internal_links: 7
extracted: 2026-08-07T05:55:15Z
extractor: site_to_paper.py (pandoc)
---

# Acronym

*Source page: `~bloo/indexdot/html/tagpages/a/acronym.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td><h1 id="acronym" class="pagetitle">Acronym</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<span class="ns">2</span>|<strong><em>3</em></strong>|<span class="ns">3.2</span>|<strong>4</strong>] [<strong>X1</strong>|<strong>X1.1</strong>] [<strong><em>IE4</em></strong>|<span class="ns">M</span>|<strong>N6B1</strong>|<strong>O4</strong>]</td>
<td><a href="#what">What is it?</a><br />
<a href="#attrib">Attributes</a><br />
<a href="#example">Tag Example</a></td>
<td><a href="#model">Parent/Content Model</a><br />
<a href="#tips">Tips &amp; Tricks</a><br />
<a href="#peculiar">Browser Peculiarities</a></td>
</tr>
<tr>
<td colspan="3" style="text-align: center;">= <span class="sitetitle">Index DOT Html</span> by <a href="../../../misc/email.htm">Brian Wilson</a> =</td>
</tr>
</tbody>
</table>

[Main Index](../../index.html) \| [Element Tree](../../tree/htmltree.htm) \| [Element Index](../../tagindex/a.htm) \| [HTML Support History](../../supportkey/a.htm)

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
<th style="text-align: left;"><strong><a href="../stats.htm#et">End Tag:</a></strong><br />
</th>
<td><span class="magicword">Required</span></td>
</tr>
<tr>
<th style="text-align: left;" data-valign="top"><strong><a href="../stats.htm#std">Standards Details:</a></strong><br />
</th>
<td>HTML: In all 4.x DTDs<br />
XHTML: In all 1.0 and 1.1 DTDs</td>
</tr>
<tr>
<th style="text-align: left;"><strong><a href="../stats.htm#xhtm">XHTML Modules:</a></strong><br />
</th>
<td><strong>Text</strong></td>
</tr>
<tr>
<th style="text-align: left;" data-valign="top"><strong><a href="../stats.htm#disp">CSS 'display' Type:</a></strong><br />
</th>
<td>"<strong>inline</strong>"</td>
</tr>
<tr>
<th style="text-align: left;" data-valign="top"><strong><a href="../stats.htm#css">CSS Mapping:</a></strong><br />
</th>
<td>NA</td>
</tr>
<tr>
<th style="text-align: left;"><strong><a href="../stats.htm#rnd">Default Rendering:</a></strong><br />
</th>
<td>Dotted underline</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

<span id="what"></span>

**What is it?**  
This element indicates that content is an Acronym (an abbreviation formed from the initial letters or groups of letters of words in a phrase.) Acronyms are used extensively in Western languages, as well as languages such as Chinese and Japanese. The TITLE attribute is suggested for providing the full or expanded form of the acronym. While knowing the expanded form may not be implicitly important in the rendering of the content, it can assist in speech synthesis, spell-checking, and other document management scenarios.\
\
Some acronyms can have unexpected pronunciations, such as being pronounced as a word rather than letter-by-letter. Style sheet properties should be used in such cases to aid in the pronunciation of the abbreviated form.

<span id="attrib"></span>

\
**Common Attributes**\
**%[Core](../attributes/core.htm)%**  
\[<span class="ns">2</span>\|***3***\|<span class="ns">3.2</span>\|**4**\] \[**X1**\|**X1.1**\] \[***IE4***\|<span class="ns">M</span>\|**N6B1**\|**O4**\]

**%[Accessibility](../attributes/accessibility.htm)%**  
\[<span class="ns">2</span>\|<span class="ns">3</span>\|<span class="ns">3.2</span>\|***4***\] \[**X1**\|**X1.1**\] \[***IE4B1***\|<span class="ns">M</span>\|**N6**\|**O5**\]

**%[Events](../attributes/events.htm)%**  
\[<span class="ns">2</span>\|<span class="ns">3</span>\|<span class="ns">3.2</span>\|***4***\] \[**X1**\|**X1.1**\] \[***IE4***\|<span class="ns">M</span>\|**N6B1**\|**O4**\]

**%[Language](../attributes/language.htm)%**  
\[<span class="ns">2</span>\|***3***\|<span class="ns">3.2</span>\|**4**\] \[**X1**\|**X1.1**\] \[***IE4***\|<span class="ns">M</span>\|<span class="ns">N</span>\|<span class="ns">O</span>\]

**%[Editing](../attributes/editing.htm)%**  
\[<span class="ns">2</span>\|<span class="ns">3</span>\|<span class="ns">3.2</span>\|<span class="ns">4</span>\] \[<span class="ns">X1</span>\|<span class="ns">X1.1</span>\] \[***IE5.5***\|<span class="ns">M</span>\|<span class="ns">N</span>\|<span class="ns">O</span>\]

<span id="example"></span>

**Example**  
<div class="example">

\<**acronym** <span class="tagattrib">TITLE</span>="World Wide Web"\>WWW\</**acronym**\>

</div>

<span id="model"></span>

**Parent Model**  
**%[In-line Parent](../shorthands.htm#inlineparent)%** \| **%[Block Parent](../shorthands.htm#blockparent)%**

**Content Model**  
**%[In-line Content](../shorthands.htm#inlinecontent)%**

<span id="tips"></span> **Tips & Tricks**

- Nothing to report.

<span id="peculiar"></span> **Browser Peculiarities**

- Internet Explorer 4.0 does not add any special rendering to the contents of this element, but common attributes that are applied are understood.
- Netscape 6.1 applies an underline effect to this element along with a special mouse cursor when hovering (an arrow with a question mark.) Later versions apply only a dotted underline effect.
- Opera 7+ applies a dotted underline effect to this element; in previous versions no special extra formatting was applied.

\
[Boring Copyright Stuff...](../../../misc/copyright.htm)
