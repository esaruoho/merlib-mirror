---
title: "Cascading Style Sheets: The Cascade"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/topics/cascade.htm
order: 1525
reachable_from_entry: false
images: 0
internal_links: 6
extracted: 2026-08-07T17:07:49Z
extractor: site_to_paper.py (pandoc)
---

# Cascading Style Sheets: The Cascade

*Source page: `~bloo/indexdot/css/topics/cascade.htm`*

<span class="pagetitle">Style Sheets Guide\
=<span class="subtitle">The Cascade</span>=</span>\
= <span class="sitetitle">Index DOT Css</span> by [Brian Wilson](../../misc/email.htm) =
========================================================================================

|  |
|----|
|   [Main Index](../index.html) \| [Property Index](../propindex/font.htm) \| [CSS Support History](../supportkey/syntax.htm) \| [Browser History](../../history/browsers.htm)   |

\
\
\
<span id="cascade"></span> **Introduction to the Cascade**

------------------------------------------------------------------------

**Multiple Sources**\
The most common scenario authors will be concerned with are the style rules which are declared by the author, but a style sheet may originate from several different sources:

- The Author may specify style rules for a document
- The User may also specify style behaviors for viewing one or more documents - possibly through a special user interface or through a special external style sheet.
- The browser will also have its own set of default rendering behaviors which, whether specified using an *ACTUAL* style sheet or by some other means accomplishes the same goal - behaving as if the browser has its own "default style sheet." This default style sheet is the base set of rendering rules - applied whether the user and author specify their own style sheet rules or not.

**Multiple Methods**\
In addition, style sheet rules may be specified using several different methods, any of which are legal:

- [External](../syntax/inclusion/external.htm) Style Sheets (using the HTML [LINK](../../html/tagpages/l/link.htm) element <span class="external">\[--\>Index DOT Html\]</span>)
- [Embedded](../syntax/inclusion/embedded.htm) Style Sheets (using the HTML [STYLE](../../html/tagpages/s/style.htm) element <span class="external">\[--\>Index DOT Html\]</span>)
- Imported Style Sheets ([@import](../syntax/atrules/import.htm))
- [Inline](../syntax/inclusion/inline.htm) Style Rules (using the HTML [STYLE](../../html/tagpages/attributes/core.htm#style) attribute <span class="external">\[--\>Index DOT Html\]</span>)
- Non-CSS rendering rules (eg: the HTML [FONT](../../html/tagpages/f/font.htm) element <span class="external">\[--\>Index DOT Html\]</span>)

When more than one style rule is specified for a single CSS selector or element, using any of these sources or methods, and they are in direct conflict with one another, what should happen? When all is said and done, CSS generates a single, cohesive "virtual" style sheet using all the style rules (explicitly stated or not) from all of these disparate sources; CSS "cascades" (combines) all of them together. When conflicts arise between style rules, resolution is determined using a weighted scale. Each style rule will carry a specific weight on this scale; when two or more rules are in conflict, the rule with the highest weight will "win" and be rendered.\
\
**Basic Cascading Order**

------------------------------------------------------------------------

The chart below is only a brief reference to resolving style conflicts, and it ignores many of the more complex cascading rules (for a more complete cascading guide, please see the next section.) If multiple style rules are in conflict for a given selector, the scales shown below can help determine which of these style rules will be used. A style rule with higher importance will win over an identical style rule with lower importance.\

<table>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr>
<th colspan="4"><hr /></th>
</tr>
</thead>
<tbody>
<tr>
<th></th>
<th><strong>Lowest<br />
Importance</strong></th>
<th><strong>&lt;================&gt;</strong></th>
<th><strong>Highest<br />
Importance</strong></th>
</tr>
<tr>
<th></th>
<th colspan="3"><hr /></th>
</tr>
&#10;<tr>
<td><strong>Ownership:</strong></td>
<td style="text-align: center;">Browser<br />
Defaults</td>
<td style="text-align: center;">Reader's<br />
Style Sheet</td>
<td style="text-align: center;">Author's<br />
Style Sheet</td>
</tr>
<tr>
<td></td>
<td colspan="3"><hr /></td>
</tr>
<tr>
<td><strong>Specification<br />
Method:</strong></td>
<td style="text-align: center;">Linked<br />
Style Sheet</td>
<td style="text-align: center;">Embedded<br />
Style Sheet</td>
<td style="text-align: center;">Inline<br />
Styles</td>
</tr>
<tr>
<td></td>
<td colspan="3"><hr /></td>
</tr>
<tr>
<td><strong>Element<br />
Selector<br />
Specificity:</strong></td>
<td style="text-align: center;">Contextual<br />
Selector<br />
Depth</td>
<td style="text-align: center;">CLASS</td>
<td style="text-align: center;">ID</td>
</tr>
<tr>
<td colspan="4"><hr /></td>
</tr>
</tbody>
</table>

\
<span id="cascadecalc"></span> **Complete Cascade Calculations**

------------------------------------------------------------------------

The following rules are used to determine which style rules will apply to a selector, given that it has more than one style in contention for that selector.

**Step 1:**  
**Gather all rules that apply to the selector**\
Find all the style declarations that implicitly or explicitly apply to the element or selector in question for the desired Media Type.

**Step 2:**  
**Sort by origin and importance**\
This is the primary Cascade sorting method. Style rules occurring in the browser default style sheet have the lowest precedence. Reader style sheets take precedence over browser style sheets, and Author style sheets take precendence over both of these.\
\[**Note:** Imported style sheets have the same origin level as the style sheet that imported it.\]\
\
Using a special flag in a style rule, precendence of equivalent style rules can be reversed in the Author and Reader realms. The special keyword "!important" is added after the style declaration to signify that greater precendence should be given to a particular style rule. "!important" declarations override equal style rules that do not use the "!important" keyword, and when both Reader and Author style sheets specify the "!important" flag, the Reader's style rule will override the Author's - this is to allow the Reader the greater degree of rendering control, if necessary.\
**Notes:**

- In CSS1, the Cascade precedence for the "!important" keyword was reversed - "!important" Author rules would carry higher precedence than equivalent "!important" Reader rules\]
- Setting the "!important" flag for a shorthand property (eg: 'background') is the same as setting each individual sub-property to be "!important".\]

**Step 3:**  
**Sort by specificity of the CSS selector**\
More specific CSS selectors will override more general ones. To determine the "specificity" of a CSS selector, use the following steps:\

1.  Count the number if ID attributes in the selector
2.  Count the number of attributes and pseudo-classes in the selector.
3.  Count the number of element names in the selector

Now concatenate these three numbers together (CSS2 says "in a number system with a large base") to find the exact specificity of the selector. The selector with the highest specificity number will be used.

<div class="example">

**Example:**\
Comparing the specificities of "**h2 em** { <span class="property">color:</span> green }" and "**h2 em#foo** { <span class="property">color:</span> red }":\
     Specificity of "**h2 em** { <span class="property">color:</span> green }" = **0-0-2 (or "2")**\
     Specificity of "**h2 em#foo** { <span class="property">color:</span> red }" = **1-0-2 (or "102")**\
in other words, "**h2 em#foo** { <span class="property">color:</span> red }" has a higher specificity and would win this Cascade calculation.

</div>

**Notes:**

- CSS2 says that HTML presentational criteria which have corresponding CSS renderings should be treated as having a specificity of "0" in the Cascade calculation and are treated as occurring at the beginning of a style sheet.
- In CSS1, HTML presentation criteria had a specificity of 1. The change is to allow for the CSS2 "Universal Selector", which has a specificity of "0".
- CSS2 says two conflicting things about Pseudo-elements: that they are counted as elements in the specificity calculation and also that they should be ignored. This is a direct contradiction and I am not sure which is true.

**Step 4:**  
**Sort by order specified**\
If two or more style rules have the same importance, origin and specificity, The rule that is specified last wins.\
**Notes:**

- The browser default stylesheet is treated as if it is an imported stylesheet imported before all others in a document.
- Imported style sheets are cascaded depending on their import order, and are considered to exist before the style sheet that imported them.

\
\
[Boring Copyright Stuff....](../../misc/copyright.htm)\
