---
title: "About Border Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/border.htm
order: 1433
reachable_from_entry: false
images: 0
internal_links: 19
extracted: 2026-08-07T05:55:10Z
extractor: site_to_paper.py (pandoc)
---

# About Border Properties

*Source page: `~bloo/indexdot/css/properties/border.htm`*

\

<span class="pagetitle">About Border Properties</span>\
= <span class="sitetitle">Index DOT Css</span> by [Brian Wilson](../../misc/email.htm) =
========================================================================================

<div align="center">

|  |
|----|
|   [Main Index](../index.html) \| [Property Index](../propindex/font.htm) \| [CSS Support History](../supportkey/syntax.htm) \| [Browser History](../../history/browsers.htm)   |

</div>

\
\

**Border Properties**  
[border](border/border.htm) \| [border-top](border/btop.htm) \| [border-right](border/bright.htm) \| [border-bottom](border/bbottom.htm) \| [border-left](border/bleft.htm)\
[border-width](border/bwidth.htm) \| [border-top-width](border/btwidth.htm) \| [border-right-width](border/brwidth.htm) \| [border-bottom-width](border/bbwidth.htm) \| [border-left-width](border/blwidth.htm)\
[border-style](border/bstyle.htm) \| [border-top-style](border/btstyle.htm) \| [border-right-style](border/brstyle.htm) \| [border-bottom-style](border/bbstyle.htm) \| [border-left-style](border/blstyle.htm)\
[border-color](border/bcolor.htm) \| [border-top-color](border/btcolor.htm) \| [border-right-color](border/brcolor.htm) \| [border-bottom-color](border/bbcolor.htm) \| [border-left-color](border/blcolor.htm)

\

**What Do They Do?**  
In CSS, the fundamental visual rendering model places all components of the document tree in physical and virtual rectangular boxes, each having a specific height and width. An element's rendering box consists of an element's content at the center (text, images, etc.) Surrounding the element's content (moving outward in rectangular layers/strips) are optional padding, surrounded by any optional border effects, surrounded in turn by any optional margin values that may be specified.\
\
The border properties allow an author to specify the width, color, and style of the border area (between any specified padding and margins) of an element's rendering box. While the capability to create simple line effects has been available in HTML via tables, the CSS border properties give authors much more power in creating such effects and allows them to be applied to any element.\
\
Each side of the border dimensions (top, right, bottom and left) can be addressed and controlled independently using separate properties, or a convenient shorthand notation may be used that controls multiple sides at once.

<!-- -->

**Related Sites**\
**Official Reference: CSS Level 1, Section 5.5.11-22**  
5.5.22: '[border](http://www.w3.org/TR/REC-CSS1#border)'\
5.5.18: '[border-top](http://www.w3.org/TR/REC-CSS1#border-top)'\
5.5.19: '[border-right](http://www.w3.org/TR/REC-CSS1#border-right)'\
5.5.20: '[border-bottom](http://www.w3.org/TR/REC-CSS1#border-bottom)'\
5.5.21: '[border-left](http://www.w3.org/TR/REC-CSS1#border-left)'\
5.5.15: '[border-width](http://www.w3.org/TR/REC-CSS1#border-width)'\
5.5.11: '[border-top-width](http://www.w3.org/TR/REC-CSS1#border-top-width)'\
5.5.12: '[border-right-width](http://www.w3.org/TR/REC-CSS1#border-right-width)'\
5.5.13: '[border-bottom-width](http://www.w3.org/TR/REC-CSS1#border-bottom-width)'\
5.5.14: '[border-left-width](http://www.w3.org/TR/REC-CSS1#border-left-width)'\
5.5.17: '[border-style](http://www.w3.org/TR/REC-CSS1#border-style)'\
5.5.16: '[border-color](http://www.w3.org/TR/REC-CSS1#border-color)'

**Official Reference: CSS Level 2, Section 8.5.1-4**  
8.5.4: '[border](http://www.w3.org/TR/REC-CSS2/box.html#border-shorthand-properties)'\
8.5.4: '[border-top](http://www.w3.org/TR/REC-CSS2/box.html#border-shorthand-properties)'\
8.5.4: '[border-right](http://www.w3.org/TR/REC-CSS2/box.html#border-shorthand-properties)'\
8.5.4: '[border-bottom](http://www.w3.org/TR/REC-CSS2/box.html#border-shorthand-properties)'\
8.5.4: '[border-left](http://www.w3.org/TR/REC-CSS2/box.html#border-shorthand-properties)'\
8.5.1: '[border-width](http://www.w3.org/TR/REC-CSS2/box.html#border-width-properties)'\
8.5.1: '[border-top-width](http://www.w3.org/TR/REC-CSS2/box.html#border-width-properties)'\
8.5.1: '[border-right-width](http://www.w3.org/TR/REC-CSS2/box.html#border-width-properties)'\
8.5.1: '[border-bottom-width](http://www.w3.org/TR/REC-CSS2/box.html#border-width-properties)'\
8.5.1: '[border-left-width](http://www.w3.org/TR/REC-CSS2/box.html#border-width-properties)'\
8.5.3: '[border-style](http://www.w3.org/TR/REC-CSS2/box.html#border-style-properties)'\
8.5.3: '[border-top-style](http://www.w3.org/TR/REC-CSS2/box.html#border-style-properties)'\
8.5.3: '[border-right-style](http://www.w3.org/TR/REC-CSS2/box.html#border-style-properties)'\
8.5.3: '[border-bottom-style](http://www.w3.org/TR/REC-CSS2/box.html#border-style-properties)'\
8.5.3: '[border-left-style](http://www.w3.org/TR/REC-CSS2/box.html#border-style-properties)'\
8.5.2: '[border-color](http://www.w3.org/TR/REC-CSS2/box.html#border-color-properties)'\
8.5.2: '[border-top-color](http://www.w3.org/TR/REC-CSS2/box.html#border-color-properties)'\
8.5.2: '[border-right-color](http://www.w3.org/TR/REC-CSS2/box.html#border-color-properties)'\
8.5.2: '[border-bottom-color](http://www.w3.org/TR/REC-CSS2/box.html#border-color-properties)'\
8.5.2: '[border-left-color](http://www.w3.org/TR/REC-CSS2/box.html#border-color-properties)'\

\
\
[Boring Copyright Stuff....](../../misc/copyright.htm)\
