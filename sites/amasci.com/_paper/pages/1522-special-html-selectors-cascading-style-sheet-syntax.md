---
title: "Special HTML Selectors - Cascading Style Sheet Syntax"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/syntax/selectors/spechtml.htm
order: 1522
reachable_from_entry: false
images: 0
internal_links: 6
extracted: 2026-08-07T17:07:49Z
extractor: site_to_paper.py (pandoc)
---

# Special HTML Selectors - Cascading Style Sheet Syntax

*Source page: `~bloo/indexdot/css/syntax/selectors/spechtml.htm`*

\

<span class="pagetitle">Special HTML Selectors</span>\
= <span class="sitetitle">Index DOT Css</span> by Brian Wilson \[[indexdot@blooberry.com](../../../misc/email.htm)\] =
======================================================================================================================

<div align="center">

|  |
|----|
| [Main Index](../../index.html) \| [Property Index](../../propindex/font.htm) \| [CSS Support History](../../supportkey/syntax.htm) \| [Browser History](../../../history/browsers.htm) |

</div>

**What Are They?**  
These Selector syntax forms existed in CSS1 and were specifically meant to target HTML, although at least the ID syntax can be generalized for use with other languages as well.

<span id="class"></span>

**Class Selectors**\
***CSS1*** \| **CSS2** \| ***IE3*** \| **N4** \| **O3.5**  
**Description:**

This selector matches the value of the HTML 'CLASS' attribute. It is referenced by preceding the value with a period character (".") The effect of this selector can also be achieved using an Attribute Value Selector, and both have the same cascading precedence.

**Syntax:**

<span class="alert2">.\[Class Name\]</span> { \[<span class="alert2">Declaration Block</span>\] }

**Example:**

<div class="example">

**.redtags** { <span class="property">color:</span> red } \[All tags in CLASS 'redtags'\]\
**H1.redtags** { <span class="property">color:</span> red } \[All Heading Level 1 tags in CLASS 'redtags'\]

</div>

<span id="id"></span>

**ID Selectors**\
***CSS1*** \| **CSS2** \| ***IE3*** \| **N4** \| **O3.5**  
**Description:**

This selector was designed to match the value of the HTML 'ID' attribute, but SGML/XML both allow the ID attribute value type. With this type of attribute, each element in a document can have a uniquely referenceable label. This Selector syntax precedes the attribute value with a pound symbol ("#".) An element name or Universal Selector may be used in front of the ID Selector, but it is not necessary. The effect of this selector can also be achieved using an Attribute Value Selector, but this form of Selector has a higher cascading precedence.

**Syntax:**

<span class="alert2">\#\[ID Label\]</span> { \[<span class="alert2">Declaration Block</span>\] }

**Example:**

<div class="example">

**\#foobar** { <span class="property">color:</span> red } \[Applies a red text color to the tag instance with the "foobar" ID value\]

</div>

**Notes**

- The CLASS attribute allows multiple classes to be bound to an element, so a special form of Class Selector can specify whether multiple classes are assigned. Class names are concatenated in the selector to specify that ALL the listed class names are present for an element (eg: 'p.first.second' would match \<**p** <span class="tagattrib">CLASS</span>="first second"\>)
- The CSS specs warn against the over-use of the CLASS attribute to assign semantic meaning to a document's contents.

**Browser Peculiarities**

- **Internet Explorer**
  **3.0+:**
  \- IDs should only start with an \[a-zA-Z\] character. If this rule is broken, the ID should be ignored. IE allows IDs to start with numbers.
  \- IDs should be unique for a document. If a document contains multiple, non-unique IDs, applying a style to that ID will apply to all instances of the ID.
  **3.0/4.0:**
  \- Multiple class names for an element are not supported.
- **Netscape**
  **4.x+:**
  \- Pairing an element selector with an ID selector ('a#foo') does not work. Use either 'a' or '#foo'.
  \- Multiple class names for an element are not supported.
  \- IDs should be unique for a document. If a document contains multiple, non-unique IDs, applying a style to that ID will apply to all instances of the ID.
  \- Netscape 4.x does not allow CLASS or ID attributes to contain underscore characters ("\_".) Underscores are legal in HTML atributes according to the HTML standards but not according to the CSS standard.
- **Opera**
  **3.5+:**
  \- IDs should be unique for a document. If a document contains multiple, non-unique IDs, applying a style to that ID will apply to all instances of the ID
  \- Opera does not allow CLASS or ID attributes to contain underscore characters ("\_".) Underscores are legal in HTML atributes according to the HTML standards but not according to the CSS standard.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
