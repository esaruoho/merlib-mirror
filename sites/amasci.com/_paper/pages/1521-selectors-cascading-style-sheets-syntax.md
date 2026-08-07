---
title: "Selectors - Cascading Style Sheets Syntax"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/syntax/selectors/selectors.htm
order: 1521
reachable_from_entry: false
images: 0
internal_links: 26
extracted: 2026-08-07T17:07:49Z
extractor: site_to_paper.py (pandoc)
---

# Selectors - Cascading Style Sheets Syntax

*Source page: `~bloo/indexdot/css/syntax/selectors/selectors.htm`*

\

<span class="pagetitle">Selectors</span>\
= <span class="sitetitle">Index DOT Css</span> by [Brian Wilson](../../../misc/email.htm) =
===========================================================================================

<div align="center">

|  |
|----|
| [Main Index](../../index.html) \| [Property Index](../../propindex/font.htm) \| [CSS Support History](../../supportkey/syntax.htm) \| [Browser History](../../../history/browsers.htm) |

</div>

**What Is A Selector?**  
When a style sheet is abstracted from the document tree it applies to (as it is with Embedded and External style sheets), a method is needed to connect style statements to items in the document tree. In the CSS Rule-Set syntax, a 'Selector' is used to specify the portion of the document tree that the style declaration that follows will be attached to.\
\
A Selector is the portion of a Rule-Set that comes before the style Declaration Block embedded within curly braces ('{' and '}'.) Selector syntax in CSS2 can look for matches using five different contexts: [elements](element.htm), [attributes](attribute.htm), [special HTML attributes](spechtml.htm), [Pseudo-Classes](../pseudo/pseudoclass.htm) and [Pseudo-Elements](../pseudo/pseudoelement.htm).\
\
The granularity and power that the CSS2 Selector syntax allows gives an author tremendous power, but much of this has not been implemented by the popular browsers. The Selector syntax specified in CSS1 is the norm, but is more limited. Many of the new capabilities in CSS2 help generalize the Selector syntax to make it more flexible with non-specific markup languages like XML. While the expanded syntax is not yet supported, it should not be too long before it is added to CSS-capable browsers.

<!-- -->

**Syntax**  
A Selector is composed of a series of one or more selector components separated by spaces and/or the "<span class="alert">\></span>" and "<span class="alert">+</span>" selector combining symbols. The components of a selector are described and linked below.

**Selector Component** = ("<span class="alert">\*</span>" \| \[<span class="alert2">Element Selector</span>\])? (\[<span class="alert2">Attribute Selector</span>\] \| \[<span class="alert2">ID Selector</span>\] \| \[<span class="alert2">Class Selector</span>\] \| \[<span class="alert2">Pseudo-Class</span>\] \| \[<span class="alert2">Pseudo-Element</span>\])\*

<span id="selectgroup"></span>

**Selector Grouping**\
\[***CSS1***\|**CSS2**\] \[***IE3***\|**N4**\|**O3.5**\]  
A Declaration block may be assigned to multiple Selectors by separating the Selectors with commas.

<div class="example">

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<tbody>
<tr>
<td colspan="5"><strong>Example</strong></td>
</tr>
<tr>
<td data-valign="top"><strong>h1</strong> { <span class="property">color:</span> green }<br />
<strong>h2</strong> { <span class="property">color:</span> green }<br />
<strong>h3</strong> { <span class="property">color:</span> green }</td>
<td>    </td>
<td data-valign="top"><strong>Becomes =&gt;</strong></td>
<td>    </td>
<td data-valign="top"><strong>h1, h2, h3</strong> { <span class="property">color:</span> green; }</td>
</tr>
</tbody>
</table>

</div>

<!-- -->

**Selector Types**\
\[***CSS1***\|**CSS2**\|**CSS3**\] \[***IE3***\|**N4**\|**O3.5**\]  
<table style="width:100%;" width="90%" data-border="1" data-cellspacing="0" data-cellpadding="3">
<colgroup>
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 16%" />
</colgroup>
<tbody>
<tr>
<td colspan="6"><strong>Element Selectors</strong></td>
</tr>
<tr>
<td data-nowrap=""><a href="element.htm#namespace">Namespace Selector</a></td>
<td rowspan="6" data-bgcolor="#808080"> </td>
<td data-nowrap=""><span class="alert2">[Prefix]|[Elem1]</span></td>
<td rowspan="6" data-bgcolor="#808080"> </td>
<td>Matches Elem1 with the [Prefix] namespace prefix</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="element.htm#universal">Universal Selector</a></td>
<td data-nowrap=""><span class="alert2">"*"</span></td>
<td>Matches any element</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="element.htm#simple">Simple Element Selector</a></td>
<td data-nowrap=""><span class="alert2">[Elem]</span></td>
<td>Matches specified Element name</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="element.htm#descendent">Descendent Selectors</a></td>
<td data-nowrap=""><span class="alert2">[Elem1] S+ [Elem2]</span></td>
<td>Elem1 is the direct or indirect ancestor of Elem2</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="element.htm#child">Child Selectors</a></td>
<td data-nowrap=""><span class="alert2">[Elem1] "&gt;" [Elem2]</span></td>
<td>Elem1 is the direct parent of Elem2</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="element.htm#adjacent">Adjacent Selectors</a></td>
<td data-nowrap=""><span class="alert2">[Elem1] "+" [Elem2]</span></td>
<td>Elem1 and Elem2 share the same direct parent AND are next to each other in the document tree</td>
<td></td>
</tr>
<tr>
<td colspan="5"><strong>Attribute Selectors</strong></td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="attribute.htm#simple">Simple Attribute Selector</a></td>
<td rowspan="8" data-bgcolor="#808080"> </td>
<td data-nowrap=""><span class="alert2">[Attr]</span> or<br />
<span class="alert2">Elem[Attr]</span></td>
<td rowspan="8" data-bgcolor="#808080"> </td>
<td>Matches all elements with the specified attribute or all 'Elem's with the specified attribute</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="attribute.htm#value">Attribute Value Selector</a></td>
<td data-nowrap=""><span class="alert2">[Attr="value"]</span> or<br />
<span class="alert2">Elem[Attr="value"]</span></td>
<td>Matches all elements that exactly match the specified attribute/value or all 'Elem's with the specified attribute/value</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="attribute.htm#begin">"Begins-with" Attribute Value Selector</a></td>
<td data-nowrap=""><span class="alert2">[Attr^="value"]</span> or<br />
<span class="alert2">Elem[Attr^="value"]</span></td>
<td>Matches all elements with the specified attribute that <em><strong>BEGIN</strong></em> with the specified value. This selector would match attribute values that are equal to it as well as to longer values of which it is a substring.</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="attribute.htm#end">"Ends-with" Attribute Value Selector</a></td>
<td data-nowrap=""><span class="alert2">[Attr$="value"]</span> or<br />
<span class="alert2">Elem[Attr$="value"]</span></td>
<td>Matches all elements with the specified attribute that <em><strong>END</strong></em> with the specified value. This selector would match attribute values that are equal to it as well as to longer values of which it is a substring.</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="attribute.htm#substring">Substring-match Attribute Value Selector</a></td>
<td data-nowrap=""><span class="alert2">[Attr*="value"]</span> or<br />
<span class="alert2">Elem[Attr*="value"]</span></td>
<td>Matches all element/attribute combinations that have at least one occurrence of the indicated value as a substring.</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="attribute.htm#many">One-of-many Attribute<br />
Value Selector</a></td>
<td data-nowrap=""><span class="alert2">[Attr~="value"]</span> or<br />
<span class="alert2">Elem[Attr~="value"]</span></td>
<td>Allows a portion of an attribute value to be exactly matched where the portions are separated by spaces.</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="attribute.htm#hyphen">Hyphen Attribute<br />
Value Selector</a></td>
<td data-nowrap=""><span class="alert2">[Attr|="value"]</span> or<br />
<span class="alert2">Elem[Attr|="value"]</span></td>
<td>The attribute value is a hyphen-separated list and begins with "value"</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="attribute.htm#namespace">Namespace Attribute Selector</a></td>
<td data-nowrap=""><span class="alert2">[Prefix|Attr="value"]</span> or<br />
<span class="alert2">Elem[Prefix|Attr="value"]</span></td>
<td>The attribute is in the specified Namespace prefix.</td>
<td></td>
</tr>
<tr>
<td colspan="5"><strong>Special HTML Selectors</strong></td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="spechtml.htm#class">Class Selector</a></td>
<td rowspan="2" data-bgcolor="#808080"> </td>
<td data-nowrap=""><span class="alert2">.[Class Name]</span></td>
<td rowspan="2" data-bgcolor="#808080"> </td>
<td>Matches elements with CLASS attributes carrying a [Class Name] value</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="spechtml.htm#id">ID Selector</a></td>
<td data-nowrap=""><span class="alert2">#[ID Name]</span></td>
<td>Matches the element carrying the unique ID attribute value of [ID Name]</td>
<td></td>
</tr>
<tr>
<td colspan="5"><strong>Pseudo-Class Selectors</strong></td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="../pseudo/pclasslink.htm">Link</a></td>
<td rowspan="7" data-bgcolor="#808080"> </td>
<td data-nowrap=""><span class="alert2">A:link</span></td>
<td rowspan="7" data-bgcolor="#808080"> </td>
<td>Applies to an unvisited hyperlink</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="../pseudo/pclassvisited.htm">Visited</a></td>
<td data-nowrap=""><span class="alert2">A:visited</span></td>
<td>Applies to a visited hyperlink</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="../pseudo/pclassfirstchild.htm">First-child</a></td>
<td data-nowrap=""><span class="alert2">[Elem]:first-child</span></td>
<td>Applies to the first child/descendent of an element</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="../pseudo/pclassactive.htm">Active</a></td>
<td data-nowrap=""><span class="alert2">[Elem]:active</span></td>
<td>The state during pointer activation ( eg: press and release of a mouse)</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="../pseudo/pclasshover.htm">Hover</a></td>
<td data-nowrap=""><span class="alert2">[Elem]:hover</span></td>
<td>The state during pointer movement within the rendering region of an element</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="../pseudo/pclassfocus.htm">Focus</a></td>
<td data-nowrap=""><span class="alert2">[Elem]:focus</span></td>
<td>The state during which an element accepts keyboard input</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="../pseudo/pclasslang.htm">Lang</a></td>
<td data-nowrap=""><span class="alert2">[Elem]:lang([Code])</span></td>
<td>The selector content uses the specified language</td>
<td></td>
</tr>
<tr>
<td colspan="5"><strong>Pseudo-Element Selectors</strong></td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="../pseudo/pelembefore.htm">Before</a></td>
<td rowspan="4" data-bgcolor="#808080"> </td>
<td data-nowrap=""><span class="alert2">[Elem]:before</span></td>
<td rowspan="4" data-bgcolor="#808080"> </td>
<td>Addresses content that is generated before an element</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="../pseudo/pelemafter.htm">After</a></td>
<td data-nowrap=""><span class="alert2">[Elem]:after</span></td>
<td>Addresses content that is generated after an element</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="../pseudo/pelemfirstletter.htm">First-letter</a></td>
<td data-nowrap=""><span class="alert2">[Elem]:first-letter</span></td>
<td>Indicates the first rendered letter/character for a block-level element</td>
<td></td>
</tr>
<tr>
<td data-nowrap=""><a href="../pseudo/pelemfirstline.htm">First-line</a></td>
<td data-nowrap=""><span class="alert2">[Elem]:first-line</span></td>
<td>Indicates the first rendered line on the output device of a block-level element</td>
<td></td>
</tr>
</tbody>
</table>

**Notes**

- Selectors are only case-sensitive if the document language is also case-sensitive (eg: HTML: not case-sensitive, XML: case-sensitive)
- ID selectors have a higher cascade specificity than an equivalent attribute selector (eg: the selector '#foo' has a higher specificity than '\*\[id="foo"\]'

**Browser Peculiarities**

- **Internet Explorer**
  **3.0:**
  \- Unsupported IE3 element names cause problems with selector grouping. Style rules will not be applied to any IE3-valid element types listed before invalid types. Element types listed AFTER the IE3-invalid element type will have CSS rules applied appropriately. Suggestion: List IE3-invalid element types FIRST in the style grouping.

\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
