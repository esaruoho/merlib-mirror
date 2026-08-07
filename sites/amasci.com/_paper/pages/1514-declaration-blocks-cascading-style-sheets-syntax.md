---
title: "Declaration Blocks - Cascading Style Sheets Syntax"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/syntax/declaration.htm
order: 1514
reachable_from_entry: false
images: 0
internal_links: 12
extracted: 2026-08-07T17:07:49Z
extractor: site_to_paper.py (pandoc)
---

# Declaration Blocks - Cascading Style Sheets Syntax

*Source page: `~bloo/indexdot/css/syntax/declaration.htm`*

\

<span class="pagetitle">Declaration Blocks</span>\
= <span class="sitetitle">Index DOT Css</span> by Brian Wilson \[[indexdot@blooberry.com](../../misc/email.htm)\] =
===================================================================================================================

<div align="center">

|  |
|----|
| [Main Index](../index.html) \| [Property Index](../propindex/font.htm) \| [CSS Support History](../supportkey/syntax.htm) \| [Browser History](../../history/browsers.htm) |

</div>

**What Are Declaration Blocks?**  
Declaration Blocks begin with a left curly brace ('{') and end when a matching right curly brace ('}') is reached. Between these braces lie semi-colon separated style declarations.\
\
A style declaration consists of a simple assignment: a CSS property is given a specific value. This is the heart of CSS - the assignment of rendering properties. A CSS property is followed by a colon character (':'), which is followed in turn by a value appropriate to the property. White space around all of these declaration components is optional.\
\
**Syntax:** "{" \[<span class="alert2">space</span>\]? \[<span class="alert2">Property</span>\] \[<span class="alert2">space</span>\]? ":" \[<span class="alert2">space</span>\]? \[<span class="alert2">Value</span>\] \[<span class="alert2">space</span>\]? "}"\
**Example:**

<div class="example">

{ <span class="property">font-size:</span> 14pt }

</div>

<span id="decgroup"></span>

**Declaration Groupings**\
***CSS1*** \| **CSS2** \| ***IE3*** \| **N4** \| **O3.5**  
A Selector may be repeated multiple times in order to assign multiple properties, or alternatively, multiple declarations can be lumped together within a Declaration Block for the Selector in order to save space. Multiple declarations are separated by semi-colon characters (';'), with White space around the semi-colon being optional.\
\
**Example**

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
<td data-valign="top"><strong>h1</strong> { <span class="property">font-size:</span> 14pt }<br />
<strong>h1</strong> { <span class="property">color:</span> green }<br />
<strong>h1</strong> { <span class="property">font-weight:</span> bold }</td>
<td>    </td>
<td data-valign="top"><strong>Becomes =&gt;</strong></td>
<td>    </td>
<td data-valign="top"><strong>h1</strong> {<br />
<span class="property">font-size:</span> 14pt;<br />
<span class="property">color:</span> green;<br />
<span class="property">font-weight:</span> bold<br />
}</td>
</tr>
</tbody>
</table>

</div>

<span id="decshorthand"></span>

**Shorthand Properties**\
***CSS1*** \| **CSS2** \| ***IE3*** \| **N4** \| **O3.5**  
Thankfully, the creators of CSS realize that there are a *LOT* of properties, many of which accomplish similar tasks. Some CSS properties exist to serve as a shorthand for specifying several other property/values at once.\
\
**Example:**

<div class="example">

{ <span class="property">font:</span> bold small-caps 12pt/14pt sans-serif }\
is the same as\
{ <span class="property">font-weight:</span> bold; <span class="property">font-variant:</span> small-caps; <span class="property">font-size:</span> 12pt; <span class="property">line-height:</span> 14pt; <span class="property">font-family:</span> sans-serif }

</div>

\
\
**CSS shorthand properties:**\
[Font](../properties/font/font.htm) \| [Background](../properties/colorbg/bg.htm) \| [List-style](../properties/list/liststyle.htm) \| [Outline](../properties/outline/outline.htm) \| [Pause](../properties/aural/pause.htm) \| [Cue](../properties/aural/cue.htm) \| [Layout-grid](../properties/intl/lgrid.htm) \| [Margin](../properties/margin/margin.htm) \| [Padding](../properties/padding/padding.htm)\
[Border](../properties/border/border.htm) \| [Border-top](../properties/border/btop.htm) \| [Border-right](../properties/border/bright.htm) \| [Border-bottom](../properties/border/bbottom.htm) \| [Border-left](../properties/border/bleft.htm) \| [Border-width](../properties/border/bwidth.htm) \| [Border-style](../properties/border/bstyle.htm) \| [Border-color](../properties/border/bcolor.htm)

\
[Boring Copyright Stuff....](../../misc/copyright.htm)\
