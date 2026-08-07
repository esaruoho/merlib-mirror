---
title: "At-Rules - Cascading Style Sheets Syntax"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/syntax/atrules/atrules.htm
order: 1513
reachable_from_entry: false
images: 0
internal_links: 6
extracted: 2026-08-07T17:07:49Z
extractor: site_to_paper.py (pandoc)
---

# At-Rules - Cascading Style Sheets Syntax

*Source page: `~bloo/indexdot/css/syntax/atrules/atrules.htm`*

\

<span class="pagetitle">At-Rules</span>\
= <span class="sitetitle">Index DOT Css</span> by Brian Wilson \[[indexdot@blooberry.com](../../../misc/email.htm)\] =
======================================================================================================================

<div align="center">

|  |
|----|
| [Main Index](../../index.html) \| [Property Index](../../propindex/font.htm) \| [CSS Support History](../../supportkey/syntax.htm) \| [Browser History](../../../history/browsers.htm) |

</div>

**At-Rules**\
[@charset](charset.htm) \[ ***CSS2*** \| ***IE5.5*** \| **N6** \| **O??** \]  
Specifies the character encoding used in the external style sheet.

[@import](import.htm) \[ ***CSS1*** \| **CSS2** \| ***IE4*** \| **N6** \|**O3.5**\]  
Imports a style sheet fragment file to the current style sheet.

[@media](media.htm) \[ ***CSS2*** \| ***IE4*** \| **N6** \| **O3.5** \]  
Specifies style rules to be rendered only with specified media.

[@namespace](namespace.htm) \[ ***CSS3*** \| ***N6*** \]  
Declares namespace prefixes for use in CSS selectors.

[@page](page.htm) \[ ***CSS2*** \| ***IE5.5*** \| **O??** \]  
Defines a page box.

[@fontdef](fontdef.htm) \[***<u>N4-4.x</u>***\]  
Netscape's method for specifying an external font definition file.

[@font-face](fontface.htm) \[***CSS2*** \| ***IE4***\]  
Describes the characteristics of a particular font.

<!-- -->

**What Are At-Rules?**  
At-Rules extend CSS Rule Set syntax beyond simple Selector/Declaration blocks. Any functionality in CSS that does not fall under the umbrella of selector/style declaration pair bindings uses a special At-Rule syntax.\
\
**Syntax:** An At-Rule begins with the "@" character followed immediately by a keyword. Following the keyword separated by a space is an At-rule statement appropriate to the At-keyword used. If the At-Rule is a simple declarative statement (charset, import, fontdef), it is terminated by a semi-colon (";".) If the At-Rule is a conditional or informative statement (media, page, font-face), it is followed by optional arguments and then a style declaration block inside matching curly braces ("{", "}".) At-Rules are sometimes nestable, depending on the context. If any part of an At-Rule is not understood, it should be ignored.

<!-- -->

**Syntax/Examples**\
**Simple, declarative At-Rule**  
**Syntax:** @\[**Keyword**\] \[<span class="alert2">arguments</span>\];

**Example:**

<div class="example">

@**import** url(<span class="alert2">foo.css</span>) <span class="alert2">screen</span>;

</div>

**Conditional/Informative At-Rule**  
**Syntax:** @\[**Keyword**\] \[<span class="alert2">arguments</span>\] { \[<span class="alert2">style declaration block</span>\] }

**Example:**

<div class="example">

@**media** <span class="alert2">screen</span> { <span class="property">color:</span> green; <span class="property">background-color:</span> yellow }

</div>

\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
