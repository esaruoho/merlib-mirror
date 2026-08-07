---
title: "Element Selectors - Cascading Style Sheet Syntax"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/syntax/selectors/element.htm
order: 1520
reachable_from_entry: false
images: 0
internal_links: 6
extracted: 2026-08-07T17:07:49Z
extractor: site_to_paper.py (pandoc)
---

# Element Selectors - Cascading Style Sheet Syntax

*Source page: `~bloo/indexdot/css/syntax/selectors/element.htm`*

\

<span class="pagetitle">Element Selectors</span>\
= <span class="sitetitle">Index DOT Css</span> by Brian Wilson \[[indexdot@blooberry.com](../../../misc/email.htm)\] =
======================================================================================================================

<div align="center">

|  |
|----|
| [Main Index](../../index.html) \| [Property Index](../../propindex/font.htm) \| [CSS Support History](../../supportkey/syntax.htm) \| [Browser History](../../../history/browsers.htm) |

</div>

**What Are They?**  
These Selectors specify a portion of the document tree based upon its context with relation to other elements.

<span id="namespace"></span>

**Namespace Selector**\
***CSS3*** \| ***N6***  
**Description:**

This syntax allows distinct XML namespaces to be addressed in CSS selectors. This capability will be important as the number of XML dialects on the web increases in the future.

**Syntaxes:**\
**1: Referencing elements in a specific namespace**\
    \[<span class="alert2">NAMESPACE PREFIX</span>\]\|\[<span class="alert2">ELEMENT NAME</span>\] { \[<span class="alert2">Declaration Block</span>\] }\
**2. Referencing elements in any namespace:**\
    \*\|\[<span class="alert2">ELEMENT NAME</span>\] { \[<span class="alert2">Declaration Block</span>\] }\
        Or, if no default namespace is declared, it can just be written as:\
    \[<span class="alert2">ELEMENT NAME</span>\] { \[<span class="alert2">Declaration Block</span>\] }\
**3. Referencing elements without any declared namespace:**\
    \|\[<span class="alert2">ELEMENT NAME</span>\] { \[<span class="alert2">Declaration Block</span>\] }\

**Examples:**

<div class="example">

**1:** **foo\|book** { <span class="property">color:</span> red } \[matches all occurrences of the 'book' element in the 'foo' namespace\]\
**2:** **\*\|book** { <span class="property">color:</span> red } \[matches all occurrences of the 'book' element in any namespace\]\
**3:** **\|book** { <span class="property">color:</span> red } \[matches all occurrences of the 'book' element with no namespaces declared\]

</div>

<span id="universal"></span>

**The Universal Selector**\
***CSS2*** \| ***IE5*** \| **N6** \| **O4**  
**Description:**

This is a special type of selector used to match any element. The Universal Selector may be omitted from a Simple Selector if it is not the only component (eg: '\*:first-line' is the same as ':first-line'.) This type of selector allows for powerful generalized structure matching in general languages like XML where element names are not necessarily known ahead of time to the style sheet.

**Syntax:**

<span class="alert2">\*</span> { \[<span class="alert2">Declaration Block</span>\] }

**Example:**

<div class="example">

**\*\[foo\]** { <span class="property">color:</span> red } \[matches all occurrences of the 'foo' attribute in the document\]

</div>

<span id="simple"></span>

**Simple Element Selector**\
***CSS1*** \| **CSS2** \| ***IE3*** \| **N4** \| **O3.5**  
**Description:**

This Selector explicitly specifies the name of an element in the document tree. All occurrences of the element name in the document are matched.

**Syntax:**

<span class="alert2">\[Element Name\]</span> { <span class="alert2">\[Declaration Block\]</span> }

**Example:**

<div class="example">

**h2** { <span class="property">font-size:</span> 2em }\
\[Matches all occurrences of the element named 'h2'. This would also match elements named 'H2" in HTML, but not in XML\]

</div>

<span id="descendent"></span>

**Descendent Selector**\
***CSS1*** \| **CSS2** \| ***IE3*** \| **N4** \| **O3.5**  
**Description:**

Also known as a 'Contextual Selector' in CSS1. This selector allows an element to be matched based upon its ancestry in the document tree. The names of two elements are listed, separated by white-space. The element on the left is the direct or indirect ancestor of the element to the right, via an arbitrary nesting depth.

**Syntax:**

<span class="alert2">\[Element1\] S+ \[Element2\]</span> { <span class="alert2">\[Declaration Block\]</span> }

**Example:**

<div class="example">

**h3 em** { <span class="property">font-weight:</span> bold }\
\[would match\
\<**h3**\>hello \<**em**\>there\</**em**\>\</**h3**\>\
and\
\<**h3**\>hello \<**b**\>\<**em**\>there\</**em**\>\</**b**\>\</**h3**\>\]

</div>

<span id="child"></span>

**Child Selector**\
***CSS2*** \| **N6** \| ***O3.5***\
**Description:**  
Unlike the generalized Descendent Selector, this Selector only targets elements that have a direct Parent/Child relationship in the document tree. The names of two elements are listed, separated by a "\>" symbol (white-space on either side of the "\>" is optional.) The element name on the left is the direct parent element of the element to the right.

**Syntax:**  
<span class="alert2">\[Element1\] "\>" \[Element2\]</span> { <span class="alert2">\[Declaration Block\]</span> }

**Example:**  
<div class="example">

**h3 \> em** { <span class="property">font-weight:</span> bold }\
\[would match\
\<**h3**\>hello \<**em**\>there\</**em**\>\</**h3**\>\
but not\
\<**h3**\>hello \<**b**\>\<**em**\>there\</**em**\>\</**b**\>\</**h3**\>\]

</div>

<span id="adjacent"></span>

**Adjacent Selector**\
***CSS2*** \| ***N6*** \| **O5**\
**Description:**  
This Selector matches two elements who share the same direct parent element in the document tree, AND exist next to each other in the document tree. The names of two elements are listed, separated by a "+" symbol (white-space on either side of the "+" is optional.) Both elements share a common parent, and the element name on the left directly precedes the element to the right in the document tree.

**Syntax:**  
<span class="alert2">\[Element1\] "+" \[Element2\]</span> { <span class="alert2">\[Declaration Block\]</span> }

**Example:**  
<div class="example">

**b + i** { <span class="property">font-weight:</span> bold }\
\[would match\
\<**h3**\>\<**b**\>hello\</**b**\> there \<**i**\>world\</**i**\>\</**h3**\>\
but not\
\<**h3**\>\<**b**\>hello\</**b**\> \<**tt**\>there\</**tt**\> \<**i**\>world\</**i**\>\</**h3**\>\]

</div>

**Browser Peculiarities**

- **Netscape**
  **4.x+:**
  \- Applying style rules to explicit Descendent Selectors (CSS1: contextual selectors) to elements with intrinsic sub-structure (like lists and tables) fails (eg: 'UL LI UL' fails to apply to the nested list, but 'ul ul' succeeds.)
- **Opera**
  **3.5+:**
  \- If the parent element in a Descendent Selector (CSS1: contextual selector) does not exist, the style rule will still be applied to the child element indicated.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
