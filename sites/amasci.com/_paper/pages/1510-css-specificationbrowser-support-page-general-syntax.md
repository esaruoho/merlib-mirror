---
title: "CSS specification/browser support page: General Syntax"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/supportkey/syntax.htm
order: 1510
reachable_from_entry: false
images: 0
internal_links: 44
extracted: 2026-08-07T05:55:13Z
extractor: site_to_paper.py (pandoc)
---

# CSS specification/browser support page: General Syntax

*Source page: `~bloo/indexdot/css/supportkey/syntax.htm`*

\

<span class="pagetitle">CSS Support History</span>\
= <span class="sitetitle">Index DOT Css</span> by Brian Wilson \[[indexdot@blooberry.com](../../misc/email.htm)\] =
===================================================================================================================

|  |
|----|
|   [Main Index](../index.html) \| [Property Index](../propindex/font.htm) \| [CSS Support History](font.htm) \| [Browser History](../../history/browsers.htm)   |

<table data-cellpadding="4">
<colgroup>
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 9%" />
</colgroup>
<tbody>
<tr>
<td colspan="11" style="text-align: center;" data-valign="bottom"><hr />
<span class="unselected">Syntax</span> | <a href="units.htm">Units</a> | <a href="font.htm">Fonts</a> | <a href="text.htm">Text</a> | <a href="colorbg.htm">Colors/Backgrounds</a> | <a href="scrollbar.htm">Scrollbars</a> | <a href="outline.htm">Outlines</a> | <a href="list.htm">Lists</a><br />
   <a href="table.htm">Tables</a> | <a href="classify.htm">Classification</a> | <a href="dimension.htm">Dimensions</a> | <a href="position.htm">Positioning</a> | <a href="margin.htm">Margins</a> | <a href="padding.htm">Padding</a> | <a href="border.htm">Borders</a>   <br />
<a href="dynamic.htm">Dynamic Content</a> | <a href="generate.htm">Generated Content</a> | <a href="international.htm">International</a> | <a href="print.htm">Printing</a> | <a href="aural.htm">Aural</a> | <a href="extensions.htm">Extensions</a>
<hr /></td>
</tr>
<tr>
<td style="text-align: center;" data-valign="bottom"><span class="attribhead">Syntax</span></td>
<td style="text-align: center;" data-valign="bottom"><span class="taghead">Specific Syntax</span></td>
<td style="text-align: center;" data-valign="bottom"><span class="supporthead">1.0</span></td>
<td style="text-align: center;" data-valign="bottom"><span class="supporthead">2.0</span></td>
<td style="text-align: center;"> </td>
<td style="text-align: center;" data-valign="bottom"><span class="supporthead">Internet<br />
Explorer</span></td>
<td style="text-align: center;" data-valign="bottom"><span class="supporthead">Netscape</span></td>
<td style="text-align: center;" data-valign="bottom"><span class="supporthead">Opera</span></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td colspan="11" style="text-align: center;"><hr /></td>
</tr>
<tr>
<td colspan="2" class="gc1" style="text-align: center;">Inclusion Methods</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>3.0</em></td>
<td class="gc2" style="text-align: center;"><strong>4.0B2</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/inclusion/external.htm">External Style Sheets</a></td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>3.0</em></td>
<td class="gc2" style="text-align: center;"><strong>4.0B2</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/inclusion/embedded.htm">Embedded Style Sheets</a></td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>3.0</em></td>
<td class="gc2" style="text-align: center;"><strong>4.0B2</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/inclusion/inline.htm">Inline Style Sheets</a></td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>3.0</em></td>
<td class="gc2" style="text-align: center;"><strong>4.0B3</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td colspan="11" style="text-align: center;"><hr /></td>
</tr>
<tr>
<td colspan="2" class="gc1" style="text-align: center;">@Rules</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>4.0</em></td>
<td class="gc2" style="text-align: center;"><em>4.0</em></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/atrules/charset.htm">@charset</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>5.5</em></td>
<td class="gc2" style="text-align: center;"><strong>6.0</strong></td>
<td class="gc2" style="text-align: center;">??</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/atrules/import.htm">@import</a></td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>4.0</em></td>
<td class="gc2" style="text-align: center;"><strong>6.0</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/atrules/media.htm">@media</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>4.0</em></td>
<td class="gc2" style="text-align: center;"><strong>6.0</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/atrules/namespace.htm">@namespace</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/atrules/page.htm">@page</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>5.5</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">??</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/atrules/fontdef.htm">@fontdef</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em><u>4.0-4.x</u></em></td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/atrules/fontface.htm">@font-face</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>4.0</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td colspan="11" style="text-align: center;"><hr /></td>
</tr>
<tr>
<td colspan="2" class="gc1" style="text-align: center;">Rule Set Syntax</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>3.0</em></td>
<td class="gc2" style="text-align: center;"><strong>4.0</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/selectors/selectors.htm#selectgroup">Selector Grouping</a></td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>3.0</em></td>
<td class="gc2" style="text-align: center;"><strong>4.0</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/declaration.htm#decgroup">Declaration Grouping</a></td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>3.0</em></td>
<td class="gc2" style="text-align: center;"><strong>4.0</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/declaration.htm#decshorthand">Declaration Shorthands</a></td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>3.0</em></td>
<td class="gc2" style="text-align: center;"><strong>4.0</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td colspan="11" style="text-align: center;"><hr /></td>
</tr>
<tr>
<td colspan="2" class="gc1" style="text-align: center;">Selectors</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>3.0</em></td>
<td class="gc2" style="text-align: center;"><strong>4.0</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/selectors/element.htm#namespace">Element - Namespace</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/selectors/element.htm#universal">Element - Universal</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>5.0</em></td>
<td class="gc2" style="text-align: center;"><strong>6.0</strong></td>
<td class="gc2" style="text-align: center;"><strong>4.0</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/selectors/element.htm#simple">Element - Simple</a></td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>3.0</em></td>
<td class="gc2" style="text-align: center;"><strong>4.0</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/selectors/element.htm#descendent">Element - Descendent</a></td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>3.0</em></td>
<td class="gc2" style="text-align: center;"><strong>4.0</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/selectors/element.htm#child">Element - Child</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><strong>6.0</strong></td>
<td class="gc2" style="text-align: center;"><em>3.5</em></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/selectors/element.htm#adjacent">Element - Adjacent</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;"><strong>5.0</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/selectors/attribute.htm#simple">Attribute - Simple</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><strong>6.0</strong></td>
<td class="gc2" style="text-align: center;"><em>4.0</em></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/selectors/attribute.htm#value">Attribute - Value</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/selectors/attribute.htm#begin">Attribute - Begin Value</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/selectors/attribute.htm#end">Attribute - End Value</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/selectors/attribute.htm#substring">Attribute - Substring Value</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/selectors/attribute.htm#many">Attribute - One-Of-Many</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><strong>6.0</strong></td>
<td class="gc2" style="text-align: center;"><em>4.0</em></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/selectors/attribute.htm#hyphen">Attribute - Hyphen</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/selectors/attribute.htm#namespace">Attribute - Namespace</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/selectors/spechtml.htm#class">HTML - Class</a></td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>3.0</em></td>
<td class="gc2" style="text-align: center;"><strong>4.0</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/selectors/spechtml.htm#id">HTML - ID</a></td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>3.0</em></td>
<td class="gc2" style="text-align: center;"><strong>4.0</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td colspan="11" style="text-align: center;"><hr /></td>
</tr>
<tr>
<td colspan="2" class="gc1" style="text-align: center;">Pseudo-Classes</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>3.0</em></td>
<td class="gc2" style="text-align: center;"><strong>4.0</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pclasslink.htm">:link</a></td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>3.0</em></td>
<td class="gc2" style="text-align: center;"><strong>4.0</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pclassvisited.htm">:visited</a></td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>3.0</em></td>
<td class="gc2" style="text-align: center;"><strong>4.0</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pclassactive.htm">:active</a></td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>4.0</em></td>
<td class="gc2" style="text-align: center;"><strong>6.0</strong></td>
<td class="gc2" style="text-align: center;"><strong>5.0</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pclasshover.htm">:hover</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>4.0</em></td>
<td class="gc2" style="text-align: center;"><strong>6.0</strong></td>
<td class="gc2" style="text-align: center;"><strong>4.0</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pclassfocus.htm">:focus</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pclassroot.htm">:root</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pclassempty.htm">:empty</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pclassnot.htm">:not</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pclassfirstchild.htm">:first-child</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pclassfirstnode.htm">:first-node</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pclasslastnode.htm">:last-node</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pclasslastchild.htm">:last-child</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pclasslang.htm">:lang</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pclassviewport.htm">:viewport</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pclassviewportscroll.htm">:viewport-scroll</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pclasscanvas.htm">:canvas</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pclassscrolledcontent.htm">:scrolled-content</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;">--</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pclassfirstlr.htm">:first</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">??</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pclassfirstlr.htm">:left</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">??</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pclassfirstlr.htm">:right</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;">??</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td colspan="11" style="text-align: center;"><hr /></td>
</tr>
<tr>
<td colspan="2" class="gc1" style="text-align: center;">Pseudo-Elements</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><strong>5.5B1</strong></td>
<td class="gc2" style="text-align: center;"><strong>6.0</strong></td>
<td class="gc2" style="text-align: center;"><em>3.5</em></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pelembefore.htm">:before</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><strong>6.0</strong></td>
<td class="gc2" style="text-align: center;"><em>4.0</em></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pelemafter.htm">:after</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><strong>6.0</strong></td>
<td class="gc2" style="text-align: center;"><em>4.0</em></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pelemfirstletter.htm">:first-letter</a></td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><strong>5.5B1</strong></td>
<td class="gc2" style="text-align: center;"><strong>6.0</strong></td>
<td class="gc2" style="text-align: center;"><em>3.5</em></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/pseudo/pelemfirstline.htm">:first-line</a></td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><strong>5.5B1</strong></td>
<td class="gc2" style="text-align: center;"><strong>6.0</strong></td>
<td class="gc2" style="text-align: center;"><em>3.5</em></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td colspan="11" style="text-align: center;"><hr /></td>
</tr>
<tr>
<td colspan="2" class="gc1" style="text-align: center;">Miscellaneous Syntax</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>3.0</em></td>
<td class="gc2" style="text-align: center;"><strong>4.0</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/misc.htm#character">Unicode Escapes</a></td>
<td class="gc2" style="text-align: center;">--</td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><strong>6.0</strong></td>
<td class="gc2" style="text-align: center;"><em>6.0</em></td>
<td class="gc2" style="text-align: center;"><strong>6.0</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/misc.htm#comment">Comments</a></td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>3.0</em></td>
<td class="gc2" style="text-align: center;"><strong>4.0</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: center;"></td>
<td class="gc1" style="text-align: center;"><a href="../syntax/misc.htm#important">!important</a></td>
<td class="gc2" style="text-align: center;"><em>X</em></td>
<td class="gc2" style="text-align: center;"><strong>X</strong></td>
<td style="text-align: center;"></td>
<td class="gc2" style="text-align: center;"><em>4.0</em></td>
<td class="gc2" style="text-align: center;"><strong>6.0</strong></td>
<td class="gc2" style="text-align: center;"><strong>3.5</strong></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td colspan="11" style="text-align: center;"><hr /></td>
</tr>
</tbody>
</table>

\
\
[Boring Copyright Stuff...](../../misc/copyright.htm)\
