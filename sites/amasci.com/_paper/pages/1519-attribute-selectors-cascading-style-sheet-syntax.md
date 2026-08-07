---
title: "Attribute Selectors - Cascading Style Sheet Syntax"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/syntax/selectors/attribute.htm
order: 1519
reachable_from_entry: false
images: 0
internal_links: 6
extracted: 2026-08-07T17:07:49Z
extractor: site_to_paper.py (pandoc)
---

# Attribute Selectors - Cascading Style Sheet Syntax

*Source page: `~bloo/indexdot/css/syntax/selectors/attribute.htm`*

\

<span class="pagetitle">Attribute Selectors</span>\
= <span class="sitetitle">Index DOT Css</span> by Brian Wilson \[[indexdot@blooberry.com](../../../misc/email.htm)\] =
======================================================================================================================

<div align="center">

|  |
|----|
| [Main Index](../../index.html) \| [Property Index](../../propindex/font.htm) \| [CSS Support History](../../supportkey/syntax.htm) \| [Browser History](../../../history/browsers.htm) |

</div>

**What Are They?**  
These Selectors specify a portion of the document tree based upon its context with relation to attribute values for elements.

<span id="simple"></span>

**Simple Attribute Selector**\
***CSS2*** \| **N6** \| ***O4***  
**Description:**

This Selector matches all elements containing the specified attribute. The value of the attribute is unimportant in this case.

**Syntax:**

<span class="alert2">\[Attribute\]</span> { \[<span class="alert2">Declaration Block</span>\] } or\
<span class="alert2">Element\[Attribute\]</span> { \[<span class="alert2">Declaration Block</span>\] }

**Example:**

<div class="example">

**blockquote\[title\]** { <span class="property">color:</span> red }\
\[matches all blockquote elements with a 'title' attribute. \]

</div>

<span id="value"></span>

**Attribute Value Selector**\
***CSS2*** \| ***N6***  
**Description:**

This Selector matches all elements containing the specified attribute which use the specified attribute value.

**Syntax:**

<span class="alert2">\[Attr="value"\]</span> { \[<span class="alert2">Declaration Block</span>\] } or\
<span class="alert2">Elem\[Attr="value"\]</span> { \[<span class="alert2">Declaration Block</span>\] }

**Example:**

<div class="example">

**h2\[align="left"\]** { <span class="property">cursor:</span> hand }\
\[Matches all occurrences of the element named 'h2' using an 'align' attribute set to 'left'.\]

</div>

<span id="begin"></span>

**"Begins-with" Attribute Value Selector**\
***CSS3*** \| ***N6***  
**Description:**

Matches all elements with the specified attribute that ***BEGIN*** with the specified value. This selector would match attribute values that are equal to it as well as to longer values of which it is a substring.

**Syntax:**

<span class="alert2">\[Attr^="value"\]</span> { \[<span class="alert2">Declaration Block</span>\] } or\
<span class="alert2">Elem\[Attr^="value"\]</span> { \[<span class="alert2">Declaration Block</span>\] }

**Example:**

<div class="example">

**h2\[align^="left"\]** { <span class="property">cursor:</span> hand }\
\[Matches all occurrences of the element named 'h2' using an 'align' attribute where "left" is at the beginning of the value.\]

</div>

<span id="end"></span>

**"Ends-with" Attribute Value Selector**\
***CSS3*** \| ***N6***  
**Description:**

Matches all elements with the specified attribute that ***END*** with the specified value. This selector would match attribute values that are equal to it as well as to longer values of which it is a substring.

**Syntax:**

<span class="alert2">\[Attr\$="value"\]</span> { \[<span class="alert2">Declaration Block</span>\] } or\
<span class="alert2">Elem\[Attr\$="value"\]</span> { \[<span class="alert2">Declaration Block</span>\] }

**Example:**

<div class="example">

**a\[href\$=".html\]** { <span class="property">cursor:</span> url(weblink.cur) }\
\[Matches all occurrences of A elements using an 'href' attribute (hyperlinks) that end in ".html"\]

</div>

<span id="substring"></span>

**Substring-match Attribute Value Selector**\
***CSS3*** \| ***N6***  
**Description:**

Matches all element/attribute combinations that have at least one occurrence of the indicated value as a substring.

**Syntax:**

<span class="alert2">\[Attr\*="value"\]</span> { \[<span class="alert2">Declaration Block</span>\] } or\
<span class="alert2">Elem\[Attr\*="value"\]</span> { \[<span class="alert2">Declaration Block</span>\] }

**Example:**

<div class="example">

**h2\[align\*="left"\]** { <span class="property">cursor:</span> hand }\
\[Matches all occurrences of the element named 'h2' using an 'align' attribute where "left" is any part of the value.\]

</div>

<span id="many"></span>

**One-Of-Many Attribute Value Selector**\
***CSS2*** \| **N6** \| ***O4***  
**Description:**

This is a special form of the Attribute Value Selector, allowing a portion of an attribute value to be exactly matched where the portions of the attribute value are separated by spaces. This is especially useful in HTML with the common CLASS attribute where multiple classes can be assigned to a single element.

**Syntax:**

<span class="alert2">\[Attribute~="value"\]</span> { <span class="alert2">\[Declaration Block\]</span> } or\
<span class="alert2">Element\[Attribute~="value"\]</span> { <span class="alert2">\[Declaration Block\]</span> }

**Example:**

<div class="example">

**h3\[class~="class2"\]** { <span class="property">font-weight:</span> bold }\
\[would match \<**h3** <span class="tagattrib">CLASS</span>="class2"\> and \<**h3** <span class="tagattrib">CLASS</span>="class1 class2"\>\]

</div>

<span id="hyphen"></span>

**Hyphen Attribute Value Selector**\
***CSS2***  
**Description:**

This is another special form of the Attribute Value Selector, allowing a portion of an attribute value to be exactly matched, where the portions of the attribute value are separated by hyphens. The search for the attribute value fragment always starts from the beginning of the value. This Selector type is especially useful with RFC 1766 language values used in the HTML common LANG attribute and the xml:lang attribute.

**Syntax:**

<span class="alert2">\[Attribute\|="value"\]</span> { <span class="alert2">\[Declaration Block\]</span> } or\
<span class="alert2">Element\[Attribute\|="value"\]</span> { <span class="alert2">\[Declaration Block\]</span> }

**Example:**

<div class="example">

**p\[foo\|="bar"\]** { <span class="property">background-color:</span> yellow }\
\[would match \<**p** <span class="tagattrib">FOO</span>="bar-foo"\> but not \<**p** <span class="tagattrib">FOO</span>="foo-bar"\>\]

</div>

<span id="namespace"></span>

**Namespace Attribute Selector**\
***CSS3*** \| ***N6***  
**Description:**

This syntax allows distinct XML namespaces to be addressed for attributes and their values in selectors.

**Syntax:**\
<span class="alert2">\[Namespaceprefix\|Attribute="Value"\]</span>\| { <span class="alert2">\[Declaration Block\]</span> }\

**Example:**

<div class="example">

**\[foo\|desc="value"\]** { <span class="property">color:</span> red }\
\[references all DESC attributes in the FOO namespace that have a value of "value"\]

</div>

**Browser Peculiarities**

- Nothing to report.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
