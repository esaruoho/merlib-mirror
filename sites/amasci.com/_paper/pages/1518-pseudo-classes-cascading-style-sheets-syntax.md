---
title: "Pseudo-Classes - Cascading Style Sheets Syntax"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/syntax/pseudo/pseudoclass.htm
order: 1518
reachable_from_entry: false
images: 0
internal_links: 7
extracted: 2026-08-07T17:07:49Z
extractor: site_to_paper.py (pandoc)
---

# Pseudo-Classes - Cascading Style Sheets Syntax

*Source page: `~bloo/indexdot/css/syntax/pseudo/pseudoclass.htm`*

\

# <span class="pagetitle">Pseudo-classes</span>

<div align="center">

**[Support Key:](../../../misc/suppkey.htm)** ***CSS1*** \| **CSS2** \| ***IE3*** \| **N4** \| **O3.5**\
= <span class="sitetitle">Index DOT Css</span> by Brian Wilson \[[indexdot@blooberry.com](../../../misc/email.htm)\] =

</div>

<div align="center">

|  |
|----|
| [Main Index](../../index.html) \| [Property Index](../../propindex/font.htm) \| [CSS Support History](../../supportkey/syntax.htm) \| [Browser History](../../../history/browsers.htm) |

</div>

**What Are They?**  
The original pseudo-classes defined dynamic states of an element that are entered and exited over time, or through user intervention. CSS2 expanded on this concept to include virtual conceptual document components or inferred portions of the document tree (Netscape 6 has really expanded the use of this latter type of pseudo-class.)\
\
The CSS specs do not always define which elements may be in a pseudo-class dynamic state, or the method in which the state is entered or exited. CSS2 *DOES* state that a browser is not required to re-render a document because of pseudo-class state transitions however.\
\
Unlike Pseudo-elements, Pseudo-classes are allowed anywhere in CSS selectors.

<!-- -->

**Syntax**  
Ext/Doc: **\[element\]:\[pseudo-class\]** { <span class="property">property:</span> value }

<!-- -->

**CSS Pseudo-Classes**  
**State-dependent:**

- [:Link](pclasslink.htm) \[ ***CSS1*** \| **CSS2** \| ***IE3*** \| **N4** \| **O3.5** \]\
  Applies to an unvisited hyperlink
- [:Visited](pclassvisited.htm) \[ ***CSS1*** \| **CSS2** \| ***IE3*** \| **N4** \| **O3.5** \]\
  Applies to a visited hyperlink
- [:Active](pclassactive.htm) \[ ***CSS1*** \| **CSS2** \| ***IE4*** \| **N6** \| **O5** \]\
  The state during pointer activation (eg: press and release of a mouse) within the rendering region of an element.
- [:Hover](pclasshover.htm) \[ ***CSS2*** \| ***IE4*** \| **N6** \| **O4** \]\
  The state during pointer movement within the rendering region of an element.
- [:Focus](pclassfocus.htm) \[ ***CSS2*** \| ***N6*** \]\
  The state during which an element accepts keyboard input.

**Document Tree:**

- [:Root](pclassroot.htm) \[ ***N6*** \]\
  Applies to the top-level (root) element in a document. In HTML, it is the HTML element.
- [:Empty](pclassempty.htm) \[ ***N6*** \]\
  Applies to elements that have no content.
- [:Not](pclassnot.htm) \[ ***N6*** \]\
  This is a negation pseudo-class, allowing other selector rules to be negated.
- [:First-child](pclassfirstchild.htm) \[ ***CSS2*** \| ***N6*** \]\
  Applies to the first child/descendent of an element
- [:First-node](pclassfirstnode.htm) \[ ***N6*** \]\
  Applies to the first occurrence of an element/selector in the document tree.
- [:Last-child](pclasslastchild.htm) \[ ***N6*** \]\
  Applies to the last child/descendent of an element
- [:Last-node](pclasslastnode.htm) \[ ***N6*** \]\
  Applies to the last occurrence of an element/selector in the document tree.
- [:Lang](pclasslang.htm) \[ ***CSS2*** \]\
  Applies to an element that contains the specified language (indicated using the lang or xml:lang attributes.)

**Printing:**

- [:First, :Left, :Right](pclassfirstlr.htm) \[ ***CSS2*** \| **O??** \]\
  These only apply to the Page Box using the [@Page](../atrules/page.htm) At-Rule.

**Proprietary:**

(No sub-pages on most of these here because there is no real documentation for them anywhere at Mozilla/Netscape other than mention in the source code. Their use is discouraged anyway and are mentioned here only for the sake of completeness.)

- [:Viewport](pclassviewport.htm) \[ ***N6*** \]\
  Refers to the visual rendered viewing area.
- [:Viewport-Scroll](pclassviewportscroll.htm) \[ ***N6*** \]\
  Refers to the box containing the visual rendered viewing area *AND* its attendant scrollbars.
- [:Canvas](pclasscanvas.htm) \[ ***N6*** \]\
  Applies to the document's rendering canvas.
- [:Scrolled-Content](pclassscrolledcontent.htm) \[ ***N6*** \]\
  Applies to elements that use scrollbars (whether by default rendering behavior or through the use of the 'overflow' property's "scroll" value.
- **:button-content** \[ ***N6*** \]\
  Applies to the inside of BUTTON elements in forms.
- **:cell-content** \[ ***N6*** \]\
  Applies to individual cells in tables.
- **:fieldset-content** \[ ***N6*** \]\
  Applies to the inside of FIELDSET elements in forms. The region this can cover seems haphazard.
- **:table-column** \[ ***N6*** \]\
  Appears to apply to individual columns in tables.
- **:table-column-group** \[ ***N6?*** \]\
  Probably applies to column groups in tables. I haven't tried this one, but I am making the assumption that this works since :table-column does as well.
- **:table-outer** \[ ***N6*** \]\
  Appears to apply to the box defined by the outside edge of a table. Most properties don't apply, but 'padding' did.
- **:-moz-any-link** \[ ***N6*** \]\
  Applies to hyperlinks in any state ("viewed" or "unviewed")
- **:-moz-dropdown-list** \[ ***N6*** \]\
  Appears to only apply to SELECT lists in forms.
- **:-moz-focus-inner** \[ ***N6*** \]\
  Seems to apply only to form buttons widgets, on the inner edge, and only some properties - border and margin properties. Others like color, background and padding appeared to have no effect.
- **:-moz-focus-outer** \[ ***N6*** \]\
  Seems to apply only to form buttons widgets, on the outer edge, and only some properties - border and margin properties. Others like color, background and padding appeared to have no effect.
- **:-moz-list-bullet** \[ ***N6*** \]\
  Appears to only apply the list marker (bullets, numbers) in lists. Most properties did not apply, but 'padding' was odd - it directly changed the size of the bullet.

**Notes**

- Mozilla/Netscape 6 mentions *MANY* pseudo-classes, using both proprietary syntax ("-moz-" prefix) and normal syntax. Some of these I can not confirm through direct testing, and without any documentation, they will remain a mystery. =) (except for their minor claim-to-fame here):\
  **<u>Addressing Elements:</u>**\
  - :-moz-radio\
  - :-moz-checkbox\
  - :label-content\
  - :legend-content\
  - :table\
  - :table-cell\
  - :table-row\
  - :table-row-group\
  **<u>Addressing Element State:</u>**\
  - :checked\
  - :disabled\
  - :enabled\
  **<u>Other:</u>** (I haven't a clue what these may or may not do)\
  - :body-column,\
  - :-moz-anonymous-block,\
  - :-moz-anonymous-positioned-block\
  - :-moz-first-line-fixup\
  - :-moz-line-frame\
  - :-moz-singleline-textcontrol-frame\
  - :-moz-display-comboboxcontrol-frame\
  - :frameset-blank\
  - :hframeset-border\
  - :vframeset-border\
  - :placeholder-frame\
  - :wrapped-frame

\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
