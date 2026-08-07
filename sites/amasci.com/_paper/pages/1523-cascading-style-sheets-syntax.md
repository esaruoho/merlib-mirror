---
title: "Cascading Style Sheets Syntax"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/syntax/syntax.htm
order: 1523
reachable_from_entry: false
images: 0
internal_links: 18
extracted: 2026-08-07T17:07:49Z
extractor: site_to_paper.py (pandoc)
---

# Cascading Style Sheets Syntax

*Source page: `~bloo/indexdot/css/syntax/syntax.htm`*

\

<span class="pagetitle">CSS Syntax</span>\
= <span class="sitetitle">Index DOT Css</span> by [Brian Wilson](../../misc/email.htm) =
========================================================================================

<div align="center">

|  |
|----|
| [Main Index](../index.html) \| [Property Index](../propindex/font.htm) \| [CSS Support History](../supportkey/syntax.htm) \| [Browser History](../../history/browsers.htm) |

</div>

**What Does a Style Sheet Do?**  
A CSS parser is given a document tree along with a style sheet that has been [specified using any of three methods](inclusion/inclusion.htm). Given this information, the parser is then responsible for determining the destination media for the rendering of the document tree, retrieving all components of the style sheet associated with the target media, and generating a formatting scheme using the explicit and implied CSS properties for that document tree. The CSS specification does not concern itself with the details of how it receives the original document tree, or how the formatting scheme it establishes is mapped to the destination media.

<!-- -->

**What is a Style Sheet?**  
A Cascading Style Sheet consists of one or more statements conforming to CSS syntax. There are two kinds of statements: 'At-Rules' and 'Rule Sets'. Both of these statement types allow complex rendering structures to be specified.

- [*At-Rules*](atrules/atrules.htm) are the catch-all syntax extension mechanism in CSS. At-Rules start with an '@' character, immediately followed by an At-keyword, followed by an identifier. An At-Rule consists of everything up to and including the next semicolon (";") or the next *Block* (content surrounded by matching curly braces), whichever comes first. Blocks may be nested.
- A *Rule Set* consists of a Selector followed by a Declaration Block.
  - A [*Selector*](selectors/selectors.htm) specifies the portion(s) of a document tree that a Declaration Block will apply to. A Selector consists of everything before the first left curly brace ("{") of a Declaration Block. Selectors allow style sheets to refer to the following parts of a document tree:
    - [*Elements*](selectors/element.htm) and some relationships between them.
    - Element [*Attributes and their values*](selectors/attribute.htm).
    - Special [*HTML Attributes*](selectors/spechtml.htm).
    - [*Pseudo-Classes*](pseudo/pseudoclass.htm): Portions of the document tree that are in a specific state.
    - [*Pseudo-Elements*](pseudo/pseudoelement.htm): Portions of content not directly defined in the document tree.
  - A [*Declaration Block*](declaration.htm) contains a series of Declarations. It begins with a left curly brace ("{") and ends with the matching right curly brace ("}"). In between lie semicolon-separated (";") style Declarations.
    - A *Declaration* is the most basic of CSS syntaxes. It binds a value to a CSS property. A Declaration consists of a property name, followed by a colon (":"), followed by a property value.
      - A [*Property*](../propindex/font.htm) is an identifier. Every property has its own syntax and constraints on the values it accepts. Property values also often indicate [*measurement units*](units/units.htm) to aid in rendering to the specified media.

**Miscellaneous Syntax Notes**

- Special Unicode character code points can be entered using an [escape mechanism](misc.htm#character) syntax in CSS2.
- [Comments](misc.htm#comment) are included in a style sheet between '/\*' and '\*/' delimiters.
- Additional cascading weight can be given to a style assignment with the [!important](misc.htm#important) syntax.
- All CSS style sheets are case-insensitive, except parts not under the control of CSS (such as font names, URLs, HTML/XHTML attributes, and all element/attribute names in XML.)
- If an At-Rule, Property, or Property value contains invalid syntax, it is ignored; if a Selector contains invalid syntax, it is ignored along with its accompanying Declaration Block.
- Parentheses, square brackets, curly braces: These must occur in matching pairs and can be nested.
- Single and double quotes: Must occur in matching pairs. Content inside quotes is parsed as a string.
- Semi-colons not in strings must be [escaped](misc.htm#character).
- The first character of a selector identifier may only be alphabetic \[a-zA-Z\], but other characters may also consist of digits (0-9), dash "-" or Unicode code points above 160.

\
[Boring Copyright Stuff....](../../misc/copyright.htm)\
