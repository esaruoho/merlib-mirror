---
title: "Cursor - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/dynamic/cursor.htm
order: 1457
reachable_from_entry: false
images: 0
internal_links: 7
extracted: 2026-08-07T05:55:11Z
extractor: site_to_paper.py (pandoc)
---

# Cursor - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/dynamic/cursor.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="cursor" class="pagetitle">cursor</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>CSS2</em></strong>] [<strong><em>IE4</em></strong>|<strong>N6</strong>|<strong>O7</strong>]<br />
</td>
<td style="text-align: center;"><strong>Other Dynamic<br />
Content Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;"><a href="accelerator.htm">accelerator</a><br />
<a href="filter.htm">filter</a><br />
<a href="behavior.htm">behavior</a><br />
<a href="zoom.htm">zoom</a><br />
</td>
</tr>
<tr>
<td colspan="2" style="text-align: center;">= <span class="sitetitle">Index DOT Css</span> by <a href="../../../misc/email.htm">Brian Wilson</a> =<br />
</td>
</tr>
</tbody>
</table>

<div align="center">

|  |
|----|
|   [Main Index](../../index.html) \| [Property Index](../../propindex/font.htm) \| [CSS Support History](../../supportkey/syntax.htm) \| [Browser History](../../../history/browsers.htm)   |

</div>

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
<th style="text-align: left;"><strong>Default Value:</strong><br />
</th>
<td><strong>Auto</strong></td>
</tr>
<tr>
<th style="text-align: left;"><strong>Applicable Elements:</strong><br />
</th>
<td>All</td>
</tr>
<tr>
<th style="text-align: left;"><strong>Inherit From Parent:</strong><br />
</th>
<td>Spec: Yes; In Practice: Not always (see below)</td>
</tr>
<tr>
<th style="text-align: left;"><strong>Applicable Media:</strong><br />
</th>
<td>Visual, Interactive</td>
</tr>
<tr>
<th style="text-align: left;"><strong>HTML Equivalent:</strong><br />
</th>
<td>NA</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

**What is it?**  
This property controls the type of cursor that is used when a pointing device is over an element. Accepts a comma separated list of the below values. Browsers should attempt to first use the cursor indicated on the left, working to the right until it has a cursor it can use.\
\
**Note:** Although the CSS spec says that this property is inherited, there are some cases in browsers where it is not explicitly so. Some elements that use a different default cursor (eg: hyperlinks, text entry elements) will override the parent cursor type by default unless explicitly set to "inherit".

<!-- -->

\
**Allowed Values**\
**inherit**\
\[***CSS2***\] \[***N6***\|**O7**\]  
**Type:** Explicit

**Description:**\
Explicitly sets the value of this property to that of the parent.

**default**\
\[***CSS2***\] \[***IE4***\|**N6**\|**O7**\]  
**Type:** Explicit

**Description:**\
Browser default cursor. Often an arrow.

**auto**\
\[***CSS2***\] \[***IE4***\|**N6**\|**O7**\]  
**Type:** Explicit

**Description:**\
Browser determines what cursor to display according to context.

**\[URL\]**\
\[***CSS2***\] \[***IE6***\]  
**Type:** Explicit

**Description:**\
URL of a custom cursor to be used for the specified selector. If multiple URLs are listed for a cursor, the leftmost one is used. If that is not available, an attempt is made for the the next one indicated to the right, and so on. If none of the URL-defined cursors can be used, a generic cursor indicated at the end of the list is used.

**n-resize\|ne-resize\|e-resize\|se-resize\|\
s-resize\|sw-resize\|w-resize\|nw-resize**\
\[***CSS2***\] \[***IE4***\|**N6**\|**O7**\]  
**Type:** Explicit

**Description:**\
Used to indicate when an edge of a box is to be moved/re-sized. Values represent directions relative to up/north.

**crosshair**\
\[***CSS2***\] \[***IE4***\|**N6**\|**O7**\]  
**Type:** Explicit

**Description:**\
Usually resembles a plus sign ('+').

**pointer**\
\[***CSS2***\] \[**IE6**\|***N6***\|**O7**\]  
**Type:** Explicit

**Description:**\
Used to present an actively selectable element, such as a hyperlink.

**move**\
\[***CSS2***\] \[***IE4***\|**N6**\|**O7**\]  
**Type:** Explicit

**Description:**\
Used to indicate when something is movable.

**text**\
\[***CSS2***\] \[***IE4***\|**N6**\|**O7**\]  
**Type:** Explicit

**Description:**\
Used to indicate that content is selectable. Often represented using an I-bar.

**wait**\
\[***CSS2***\] \[***IE4***\|**N6**\|**O7**\]  
**Type:** Explicit

**Description:**\
Used to indicate that the user must wait because the program is busy. Usually represented by an hourglass or clock.

**help**\
\[***CSS2***\] \[***IE4***\|**N6**\|**O7**\]  
**Type:** Explicit

**Description:**\
Used to indicate that help is available for the element. Often represented as a question mark or balloon.

**hand**\
\[***IE4***\|**O7**\]  
**Type:** Explicit

**Description:**\
Use a hand icon.

**all-scroll**\
\[***IE6***\]  
**Type:** Explicit

**Description:**\
Use an up/down/left/right arrow with a dot in the middle. Used to indicate that content can be scrolled in any direction.

**col-resize**\
\[***IE6***\]  
**Type:** Explicit

**Description:**\
Used to indicate that a column can be horizontally re-sized. Represented with a vertical bar in the middle of two arrows pointing in opposite left/right directions.

**row-resize**\
\[***IE6***\]  
**Type:** Explicit

**Description:**\
Used to indicate that a row or item can be vertically re-sized. Represented with a horizontal bar in the middle of two arrows pointing in opposite up/down directions.

**no-drop**\
\[***IE6***\]  
**Type:** Explicit

**Description:**\
Used to indicate that a dragged item cannot be dropped at the current cursor position. Represented as a hand next to a small circle with a slash through it.

**not-allowed**\
\[***IE6***\]  
**Type:** Explicit

**Description:**\
Used to indicate that a requested action can not be performed. Represented as a circle with a slash through it.

**progress**\
\[***IE6***\]  
**Type:** Explicit

**Description:**\
Indicates that a process is running in the background, which will not affect user interaction with the system. Represented as an arrow with an hourglass next to it.

**vertical-text**\
\[***IE6***\]  
**Type:** Explicit

**Description:**\
Used to represent editable vertical content. Represented as a horizontal I-bar.

**alias**\
\[***N6***\]  
**Type:** Explicit

**Description:**\
Use a cursor to indicate a shortcut or alias to another object. Often represented as an arrow with a small curved arrow next to it.

**cell**\
\[***N6***\]  
**Type:** Explicit

**Description:**\
Used to indicate that one or more "cells" (as in a spreadsheet) may be selected. Often rendered as a thick plus-sign, possibly having a dot in the middle.

**copy**\
\[***N6***\]  
**Type:** Explicit

**Description:**\
Used to indicate that content will be copied. Often rendered as an arrow with a small plus next to it.

**count-down**\
\[***N6***\]  
**Type:** Explicit

**Description:**\
Used to indicate a "count-down" operation by a program.

**count-up**\
\[***N6***\]  
**Type:** Explicit

**Description:**\
Used to indicate a "count-up" operation by a program.

**count-up-down**\
\[***N6***\]  
**Type:** Explicit

**Description:**\
Used to indicate a program is "counting-up" and "counting-down" in succession operation in a program.

**grab**\
\[***N6***\]  
**Type:** Explicit

**Description:**\
Used to indicate that content is "grabbable". Often rendered as an open hand.

**grabbing**\
\[***N6***\]  
**Type:** Explicit

**Description:**\
Used to indicate that content is in the act of being "grabbed". Often rendered as a closed/clenched hand.

**spinning**\
\[***N6***\]  
**Type:** Explicit

**Description:**\
Used to indicate that processing is being done by the program. Slightly different from the 'wait' value - 'wait' should indicate that no user interaction with the program is possible while the cursor is in that state, whereas 'spinning' indicates that the user may still interact with the program. Sometimes rendered as a spinning, striped ball.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **blockquote** { <span class="property">cursor:</span> help }

</div>

<div class="example">

In-Line:  \<**blockquote** <span class="tagattrib">STYLE</span>="<span class="property">cursor:</span> help"\>To be or not to be, that is the question\</**blockquote**\>

</div>

**Browser Peculiarities**

- **Internet Explorer**
  **6.0+:**
  \- Beginning in version 6.0 supports custom cursors via the \[URL\] syntax, but it only supports .cur and .ani file types.
- **Opera**
  **7.0+:**
  \- Even though this property is supposed to be inherited, using "cursor: inherit" has no effect when it is applied to elements that have their own default cursor behavior (eg: hyperlinks, some form widgets, etc.)

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
