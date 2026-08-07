---
title: "Cascading Style Sheets Syntax - Inclusion Methods"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/syntax/inclusion/inclusion.htm
order: 1516
reachable_from_entry: false
images: 0
internal_links: 7
extracted: 2026-08-07T17:07:49Z
extractor: site_to_paper.py (pandoc)
---

# Cascading Style Sheets Syntax - Inclusion Methods

*Source page: `~bloo/indexdot/css/syntax/inclusion/inclusion.htm`*

\

<span class="pagetitle">Inclusion Methods</span>\
= <span class="sitetitle">Index DOT Css</span> by Brian Wilson \[[indexdot@blooberry.com](../../../misc/email.htm)\] =
======================================================================================================================

<div align="center">

|  |
|----|
| [Main Index](../../index.html) \| [Property Index](../../propindex/font.htm) \| [CSS Support History](../../supportkey/syntax.htm) \| [Browser History](../../../history/browsers.htm) |

</div>

**Attaching Style to Documents**  
There are three ways to attach style information to documents in CSS, two of which are only applicable to HTML documents. Each of the main methods has its own place in the cascading hierarchy, such that style information can be specified using any or all of these methods for the same document, if the document language permits.

<!-- -->

**Attachment Methods**\
[External Style Sheets](external.htm)\
***CSS1*** \| **CSS2** \| ***IE3*** \| **N4B2** \| **O3.5**  
**Applicable To:** HTML and XML

**Description:**\
A URL reference to an entire style sheet. Multiple external style sheet references may be included in a document. The [@import At-Rule](../atrules/import.htm) may also be used in this syntax for including one or more style rule fragments from disparate URL locations.

[Embedded Style Sheets](embedded.htm)\
***CSS1*** \| **CSS2** \| ***IE3*** \| **N4B2** \| **O3.5**  
**Applicable To:** HTML specific syntax, using the [STYLE](http://www.blooberry.com/indexdot/html/tagpages/s/style.htm) <span class="external">\[--\>Index DOT Html\]</span> element.

**Description:**\
An entire style sheet is included in the HEAD section of a document. Multiple STYLE blocks may be present in a document. The [@import At-Rule](../atrules/import.htm) may also be used in this syntax for including one or more style rule fragments from disparate URL locations.

[In-line Styles](inline.htm)\
***CSS1*** \| **CSS2** \| ***IE3***\| **N4B3** \| **O3.5**  
**Applicable To:** HTML specific syntax, using the common STYLE attribute for HTML elements.

**Description:**\
This method uses a limited form of CSS syntax, consisting solely of a series of [CSS style Declarations](../declaration.htm).

\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
