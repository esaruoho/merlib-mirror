---
title: "Extended Examples"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/examples/examples.htm
order: 1408
reachable_from_entry: false
images: 0
internal_links: 10
extracted: 2026-08-07T17:07:43Z
extractor: site_to_paper.py (pandoc)
---

# Extended Examples

*Source page: `~bloo/indexdot/css/examples/examples.htm`*

<span class="pagetitle">CSS Examples</span>\
= <span class="sitetitle">Index DOT Css</span> by Brian Wilson \[[indexdot@blooberry.com](../../misc/email.htm)\] =
===================================================================================================================

<div align="center">

|  |
|----|
|   [Main Index](../index.html) \| [Property Index](../propindex/font.htm) \| [CSS Support History](../supportkey/syntax.htm) \| [Browser History](../../history/browsers.htm)   |

</div>

\

**Introduction**  
There are four examples here using different style specification methods. Each method attempts to accomplish the same layout characteristics as the others, but there may be some differences (especially with the HTML only method.) I have tried to adhere to using only one method in each example, foregoing obvious opportunities where another method would work better, in order to prove the point of each example. As an author you can and probably will freely mix and match any of these methods for the result that best suits your needs.

\

**Examples**\
Each of the following examples consist of a document sample followed by a line-by-line breakdown analysis of the document code. Analysis points and line examples are heavily cross-linked to allow for easier navigation.\
\
1. [External Style Sheet Example](cssexternal.htm)  
Uses the [LINK](http://www.blooberry.com/indexdot/html/tagpages/l/link.htm) <span class="external">\[--\>Index DOT Html\]</span> element to attach a CSS stylesheet to a document. Multiple HTML documents can use a single external style sheet, which serves to reduce repetitive work on pages using common thematic elements.

2\. [Embedded Style Sheet Example](cssembedded.htm)  
Uses the [STYLE](http://www.blooberry.com/indexdot/html/tagpages/s/style.htm) <span class="external">\[--\>Index DOT Html\]</span> element to insert style information in a document. All style rules are applicable only to the document that contains them, but it also allows powerful grouping and classing mechanisms to save work in assigning style properties. This method is the middle ground between external and inline methods.

3\. [Inline Styles Example](cssinline.htm)  
Attaches style properties to documents by assigning them directly to HTML tags with the STYLE tag attribute. Can easily become repetitive, but is useful in some situations.

4\. [Plain HTML Example](csshtmlxmp.htm)  
What we all have been used to until the advent of CSS. Browser extensions and common browser visual behaviors are relied upon to create a consistent layout result - which was never the original intent of HTML to begin with.

\

**Conclusion**  
Style sheets aim to accomplish several major things:

- Separate style information from content
- Increase the layout capabilities in the HTML document format
- Make documents smaller, less complex, and easier to read
- Promote the re-use of authoring efforts

It is up to the author to decide how to best reach these goals, and achieving some of these goals may come at the cost of compromising others.

\
I would love to add pages showing the results of these code examples above, but the big two browsers still do not support enough of the CSS specification to display the examples as expected. Actually, you would probably think the results are really quite ugly. I certainly do! =) These examples were designed to illustrate CSS syntax without thought for the final result. This just helps illustrate that without good design, all the potential CSS capabilities in the world will not save your page.

\
\
[Boring Copyright Stuff...](../../misc/copyright.htm)\
