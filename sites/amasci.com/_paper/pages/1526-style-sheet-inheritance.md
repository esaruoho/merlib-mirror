---
title: "Style Sheet Inheritance"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/topics/inherit.htm
order: 1526
reachable_from_entry: false
images: 0
internal_links: 7
extracted: 2026-08-07T17:07:50Z
extractor: site_to_paper.py (pandoc)
---

# Style Sheet Inheritance

*Source page: `~bloo/indexdot/css/topics/inherit.htm`*

\

<span class="pagetitle">CSS Inheritance</span>\
= <span class="sitetitle">Index DOT Css</span> by [Brian Wilson](../../misc/email.htm) =
========================================================================================

<div align="center">

|  |
|----|
| [Main Index](../index.html) \| [Property Index](../propindex/font.htm) \| [CSS Support History](../supportkey/syntax.htm) \| [Browser History](../../history/browsers.htm) |

</div>

\
\
**Inheritance**

------------------------------------------------------------------------

If a particular CSS property is not explicitly specified for an element, what rendering properties should the element have? For assigning properties to multiple selectors, it would be redundant, time-consuming and space-consuming having to re-state the same properties for multiple sections and levels of a document. The size of the style sheet information would quickly become unwieldy. Additionally, a style sheet author may not know ahead of time the structure of the document the style sheet will be attached to. CSS avoids this problem by allowing style properties to be inherited between elements.\
\
**Every Document Is A Tree**

------------------------------------------------------------------------

Every document containing markup is a tree of information, where nested elements are nodes that branch from the topmost element (In the case of HTML, the HTML element is the top of this tree.) Elements nested within other elements represent branches, while empty elements and text represent leaves of the tree. CSS allows some properties applied to certain elements to be inherited from those specified for parent elements further up the document tree (toward the root element.) Not all CSS properties are inherited, and those that are may not always be inheritable by all elements. Please refer to the pages for each of the [individual CSS properties](../propindex/font.htm) to find a breakdown of inheritance rules.\
\
**The Advantages of Inheritance**

------------------------------------------------------------------------

Inheritance quickly becomes nothing short of vital for applying style information when you consider the following:

- It reduces recundancy of author effort and storage space because a rule only needs to be declared once for multiple nodes of a document tree. Beyond this, only exceptions to the inherited styles need to be given to override these rules.
- When a document's structure will be ambiguous, as is possible in XML markup languages, inheritance will often be the author's best tool to control rendering with complex documents.

**Notes**

------------------------------------------------------------------------

- In HTML, default properties for a document can be set by applying style rules to the HTML or BODY elements.
- While not all CSS properties automatically inherit, CSS2 introduces a new value for every CSS property ("inherit") which automatically causes the property to be inherited from a parent in the element tree. This also gives the inheritance directive a greater weight in the [Cascade](cascade.htm) calculation.

\
[Boring Copyright Stuff....](../../misc/copyright.htm)\
