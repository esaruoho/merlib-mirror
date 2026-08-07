---
title: "Embedded CSS Example"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/examples/cssembedded.htm
order: 1404
reachable_from_entry: false
images: 34
internal_links: 17
extracted: 2026-08-07T17:07:42Z
extractor: site_to_paper.py (pandoc)
---

# Embedded CSS Example

*Source page: `~bloo/indexdot/css/examples/cssembedded.htm`*

<span class="pagetitle">Embedded CSS Example</span>\
= <span class="sitetitle">Index DOT Css</span> by Brian Wilson \[[indexdot@blooberry.com](../../misc/email.htm)\] =
===================================================================================================================

<div align="center">

|  |
|----|
|   [Main Index](../index.html) \| [Property Index](../propindex/font.htm) \| [CSS Support History](../supportkey/syntax.htm) \| [Browser History](../../history/browsers.htm)   |

[Example](#example) \| [Analysis](#analysis)

</div>

\
\
<span id="example"></span> **Example**

1.        \<**html**\>
2.        \<**head**\>
3.               \<**title**\>Document Title\</**title**\>
4.  <a href="#a1" id="e4"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       \<**style** <span class="tagattrib">TYPE</span>="text/css"\>
5.  <a href="#a2" id="e5"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       \<!--
6.  <a href="#a3" id="e6"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       **body** {\
                     <span class="property">background:</span> black;\
                     <span class="property">color:</span> \#80c0c0 }
7.  <a href="#a4" id="e7"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       **a:link** { <span class="property">color:</span> \#ff8080 }
8.  <a href="#a4" id="e8"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       **a:visited** { <span class="property">color:</span> \#ff0000 }
9.  <a href="#a4" id="e9"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       **a:active** { <span class="property">color:</span> \#a05050 }
10. <a href="#a5" id="e10"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       **a.case1:link** { <span class="property">background:</span> green }
11. <a href="#a6" id="e11"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       **p:first-line** { <span class="property">margin-left:</span> 25px }
12. <a href="#a7" id="e12"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       **div.foo:first-line** {\
                     <span class="property">font-weight:</span> bold;\
                     <span class="property">margin-left:</span> 30px }
13. <a href="#a7" id="e13"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       **div:first-letter** {\
                     <span class="property">font-size:</span> x-large;\
                     <span class="property">color:</span> \#ffffff }
14. <a href="#a8" id="e14"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       **ul ul li** {\
                     <span class="property">font-size:</span> x-large;\
                     <span class="property">font-decoration:</span> italic }
15. <a href="#a8" id="e15"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       **h2 em** { <span class="property">font-weight:</span> 900 }
16. <a href="#a9" id="e16"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       **h2.ex1** {\
                     <span class="property">color: green;</span>       /\* This type of heading MUST be Green and Large! \*/\
                     <span class="property">line-height:</span> 50px;\
                     <span class="property">font-size:</span> 40px }
17. <a href="#a10" id="e17"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       **.funkyclass** {\
                     <span class="property">font:</span> 36pt/40pt courier;\
                     <span class="property">font-variant:</span> small-caps;\
                     <span class="property">border:</span> thick dashed blue }
18. <a href="#a11" id="e18"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       **\#tagid1** {\
                     <span class="property">padding:</span> 20px;\
                     <span class="property">border:</span> 20px groove \#ffffff }
19. <a href="#a12" id="e19"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       **.class1, \#tagid2** { <span class="property">font-family:</span> 'comic sans ms', fantasy; <span class="property">color:</span> rgb(100%,100%,0%) }
20. <a href="#a13" id="e20"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       **h1, h2, div.class5, blockquote** { <span class="property">background:</span> \#000080 }
21. <a href="#a14" id="e21"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       **p.special** {\
                     <span class="property">font:</span> 12pt/14pt sans-serif;\
                     <span class="property">margin:</span> 5px 0px 2px 25px;\
                     <span class="property">border:</span> medium dashed \#ff0000;\
                     <span class="property">background:</span> white url(http://www.foo.com/image.gif) repeat-x fixed top right }
22. <a href="#a15" id="e22"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       **blockquote** {\
                     <span class="property">margin-left:</span> 2cm;\
                     <span class="property">color:</span> \#00ff00 }
23. <a href="#a16" id="e23"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       **.part1** {\
                     <span class="property">font-size:</span> xx-large;\
                     <span class="property">color:</span> \#808000 }
24. <a href="#a17" id="e24"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>       **h6** {\
                     <span class="property">font-size:</span> xx-small ! important;\
                     <span class="property">color:</span> red ! important }
25. <a href="#a2" id="e25"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>        --\>
26.       \</**style**\>
27.       \</**head**\>\
    \
28. <a href="#a3" id="e28"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a> \<**body**\>
29. <a href="#a10" id="e29"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a> \<**h1** <span class="tagattrib">CLASS</span>="funkyclass" <span class="tagattrib">ALIGN</span>="center"\>Welcome to my home page!\</**h1**\>
30.       \<**br**\>\<**br**\>
31. <a href="#a4" id="e31"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a> \<**p**\>Hi there! If you are reading this then you have found my home page! Congratulations! I know it can be hard to find my pages, but I bet that you feel lucky now. Now that you are here, please take a look at my page of links to \<**a** <span class="tagattrib">HREF</span>="http://www.mysite.com/coolsites.html"\>cool sites\</**a**\> or sign my \<**a** <span class="tagattrib">HREF</span>="http://www.mysite.com/guestbook.html"\>guest book\</**a**\>\</**p**\>
32. <a href="#a7" id="e32"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a> \<**div** <span class="tagattrib">CLASS</span>="foo"\> My wonderful poetry \<**br**\> is available if you are REALLY bored. Why not give it a spin?\</**div**\>\
    \
33. <a href="#a9" id="e33"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a> \<**h2** <span class="tagattrib">CLASS</span>="ex1"\> The Best Poetry I \<**em**\>NEVER\</**em**\> Wrote\</**h2**\>
34.       \<**ul**\>
35. <a href="#a12" id="e35"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>           \<**li**\>'There Once Was A Man From Nantucket' - \<**span** <span class="tagattrib">CLASS</span>="class1"\>Anonymous\</**span**\>\</**li**\>
36. <a href="#a12" id="e36"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>           \<**li**\>'Cool In Fur' - \<**span** <span class="tagattrib">CLASS</span>="class1"\>Harry B. Foot\</**span**\>\</**li**\>
37.                   \<**li**\>And My All Time Fave:
38.                   \<**ul**\>
39. <a href="#a12" id="e39"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a>                  \<**li**\> 'A Toast To My Toaster' - \<**span** <span class="tagattrib">CLASS</span>="class1"\>Me!\</**span**\>\</**li**\>
40.                   \</**ul**\>
41.       \</**li**\>\</**ul**\>\
    \
42. <a href="#a11" id="e42"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a> \<**blockquote**\>Brought to you by the letter \<**span** <span class="tagattrib">ID</span>="tagid2"\>\&quot;H\&quot;\</**span**\> and \<**span** <span class="tagattrib">ID</span>="tagid1"\>Joe Shmoe\</**span**\> \</**blockquote**\>\
    \
43. <a href="#a13" id="e43"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a> \<**div** <span class="tagattrib">CLASS</span>="class5"\> When you are done looking through these masterpieces, I encourage you to visit my proud sponsor!! \</**div**\>\
    \
44. <a href="#a14" id="e44"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a> \<**p** **CLASS**="special"\>\<**span** <span class="tagattrib">CLASS</span>="funkyclass"\>ADVERTISEMENT:\</**span**\> Buy Navel Lint Contemplator! Its a browser and its a sandwich spread! Go to our \<**a** <span class="tagattrib">HREF</span>="http://www.navellint.com"\>home page\</**a**\> without delay! Why? Because shelf life is only 8 hours unless refrigerated. We know that makes it hard to browse, but it promotes frequent upgrading to the latest and greatest version. \</**p**\>\
    \
45. <a href="#a17" id="e45"><img src="../../images/analysis.gif" data-align="middle" data-border="0" alt="[Go To Analysis]" /></a> \<**h6**\>All standard disclaimers apply. Your life depends on NOT copying this document in any way. This tape will \<**a** <span class="tagattrib">HREF</span>="http://www.mysite.com/selfdestruct.html" <span class="tagattrib">CLASS</span>="case1"\>self destruct\</**a**\> in 10 seconds...\</**h6**\>\
    \
46.       \</**body**\>
47.       \</**html**\>

\
\
<span id="analysis"></span> **Analysis**

- **Line:** General\
  **CSS Issues:** [Embedded Style Sheets](../syntax/inclusion/embedded.htm)\
  **Description:** This example contains exactly the same STYLE rule information as the [external CSS example](cssexternal.htm) does - just in a slightly different format. The rules specified here can only be used for the current document, but there is still a big win in using selectors to group style rules, which serves to reduce duplication of effort by the author.
- <span id="a1"></span>**Line:** [4](#e4)\
  **Description:** The STYLE tag requires the TYPE attribute to tell the browser which style language is being used.
- <span id="a2"></span>**Lines:** [5](#e5) / [23](#e23)\
  **CSS Issues:** [Inheritance](../topics/inherit.htm)\
  **Description:** Enclosing the contents of the STYLE tag in a comment ensures that older browsers will not display the contents.
- <span id="a3"></span>**Lines:** [6](#e6) / [28](#e28)\
  **CSS Issues:** [Inheritance](../topics/inherit.htm)\
  **Description:** This is the normal background and character color set for this site. Assigning these properties to the BODY tag means that all BODY content (child elements) will inherit the text color and background color property values unless otherwise specified.
- <span id="a4"></span>**Lines:** [7](#e7) / [8](#e8) / [9](#e9) / [31](#e31) / [44](#e44) / [45](#e45)\
  **CSS Issues:** [Pseudo-Classes](../syntax/pseudo/pseudoclass.htm)\
  **Description:** This defines the general behavior for all anchor tags in the document
- <span id="a5"></span>**Lines:** [10](#e10) / [45](#e45)\
  **CSS Issues:** [Pseudo-Classes](../syntax/pseudo/pseudoclass.htm)\
  **Description:** The special anchor case - This defines a special behavior for all anchor tags in the 'case1' class (Note: This rule only controls the LINK Pseudo-class - The other two link pseudo-class properties will be inherited from the rules specified on lines [8](#e8) / [9](#e9))
- <span id="a6"></span>**Lines:** [11](#e11) / [31](#e31) / [44](#e44)\
  **CSS Issues:** [Pseudo-Elements](../syntax/pseudo/pseudoelement.htm)\
  **Description:** Only the first line of paragraphs will be indented (25 pixels)
- <span id="a7"></span>**Lines:** [12](#e12) / [13](#e13) / [32](#e32)\
  **CSS Issues:** [Pseudo-Elements](../syntax/pseudo/pseudoelement.htm)\
  **Description:** The DIV element: DIV is a tag w/o much real semantic meaning of its own. We are assigning a special appearance here to the first letter and line of the element.
- <span id="a8"></span>**Lines:** [14](#e14) / [15](#e15) / [33](#e33) / [39](#e39)\
  **CSS Issues:** [Contextual Selectors](../syntax/selectors/element.htm#descendent)\
  **Description:** The specified rules only apply to list items within doubly nested unordered lists and emphasized elements within level 2 headings.
- <span id="a9"></span>**Lines:** [16](#e16) / [31](#e31)\
  **CSS Issues:** [Classes](../syntax/selectors/spechtml.htm), [Inheritance](../topics/inherit.htm) and [Comments](../syntax/misc.htm#comment)\
  **Description:** Only heading level 2 elements with the class name of 'ex1' are given these style rules. Note that the 'green' text color overrides the '#80c0c0' color set on the BODY tag in Line [6](#e6). Notice also the CSS comment syntax used - it will be ignored by the browser.\
- <span id="a10"></span>**Lines:** [17](#e17) / [29](#e29) / [44](#e44)\
  **CSS Issues:** [Selector syntax](../syntax/selectors/selectors.htm), [Classes](../syntax/selectors/spechtml.htm)\
  **Description:** Use of a class name only as a tag selector - All tags having the 'funkyclass' class name will be displayed as indicated. Notice this document has two diverse elements (H1 and SPAN) using this class name. Any number of elements can share a class name, but be sure to keep in mind that some properties only apply to certain HTML tag types.
- <span id="a11"></span>**Lines:** [18](#e18) / [42](#e42)\
  **CSS Issues:** [ID Selector syntax](../syntax/selectors/spechtml.htm)\
  **Description:** Usage of an ID selector - Only one tag in the document may use this style rule. This usage is much more limiting than regular tag Selectors or Class selectors, but allows extremely granular control of elements in a document (which could be helpful if a document is being generated dynamically.)
- <span id="a12"></span>**Lines:** [19](#e19) / [35](#e35) / [36](#e36) / [39](#e39) / [42](#e42)\
  **CSS Issues:** [Shorthand Selector Syntax](../syntax/selectors/selectors.htm#selectgroup)\
  **Description:** Styles being assigned to both ID and Class selectors. Note that the yellow font color overrides the bluish (#80c0c0) color set on the BODY tag in Line [6](#e6).
- <span id="a13"></span>**Lines:** [20](#e20) / [29](#e29) / [33](#e33) / [42](#e42) / [43](#e43)\
  **CSS Issues:** [Shorthand Selector Syntax](../syntax/selectors/selectors.htm#selectgroup), [Inheritance](../topics/inherit.htm)\
  **Description:** This rule is the motherload - It specifies rules for multiple tags using selector shorthand syntax. Several of these tags also have other style information attached as well, but this does not conflict with those other rules. If you know you will be using a single property/value assignment for more than one tag, it makes sense to use a shorthand syntax like this rather than repeating yourself repeating yourself. (In the off case that a property assignment made here is also made for the same selector elsewhere using a different style rule, the style assignment that was made last will be applied.)
- <span id="a14"></span>**Lines:** [21](#e21) / [44](#e44)\
  **CSS Issues:** [Shorthand property syntax](../syntax/declaration.htm#decgroup), [Abbreviated property types](../syntax/declaration.htm#decshorthand)\
  **Description:** Multiple styles are assigned in this rule using both Style grouping and Shorthand property rules. Each of the properties used can set multiple display behaviors with an abbreviated syntax. These properties could all be set separately, but the extra space it would occupy would be wasteful. The nested SPAN and A tags in this block inherit any unspecified properties from this parent tag. Note also that margin rules are specified for the 'first-line' pseudo-class, as well as the 'special' class for the P tag in line [44](#e44). The problem lies in the 'margin-left' property which conflicts with the same component property in the 'margin' property rule. Because the the 'margin' rule was specified later, it will be used.
- <span id="a15"></span>**Lines:** [22](#e22) / [42](#e42)\
  **CSS Issues:** [Inheritance](../topics/inherit.htm), [Cascading Rules](../topics/cascade.htm)\
  **Description:** As mentioned before, the rules specified here does not include the 'background' property indicated on Line [20](#e20) because it is more useful to specify that separately in order to take up less space.
- <span id="a16"></span>**Line:** [23](#e23)\
  **CSS Issues:** NA\
  **Description:** This is a normal rule applied to a class. The problem is that it is not used. This is not a fatal mistake, but having rules around that are never used takes up space - and extra space means more download time. In the context of an external style sheet such an occurrence will be more common (since a style sheet referenced by many documents will need to cover display rules for ALL documents, and many documents may not contain ALL the selectors indicated. In this case it would be better to eliminate this rule.
- <span id="a17"></span>**Lines:** [24](#e24) / [45](#e45)\
  **CSS Issues:** [Inheritance](../topics/inherit.htm), [Cascading Rules](../topics/cascade.htm)\
  **Description:** The use of '!important' is unique here in this document. It will indicate to the browser that the rule must be used in preference to a normal rule set for this tag situation specified using another method (using a reader's own style sheet for example.) This is a good way to guarantee that a crucial style element in your page survives the uncertainty of a Cascading Order calculation. This control should not be abused however, as it reduces the control the reader has over their browsing environment (a reader may have, for instance, valid *physical* reasons for their viewing environment settings.)

\
[Boring Copyright Stuff....](../../misc/copyright.htm)\
