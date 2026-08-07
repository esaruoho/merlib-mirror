---
title: "Cascading Style Sheets Syntax - Miscellaneous Syntax Details"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/syntax/misc.htm
order: 1517
reachable_from_entry: false
images: 0
internal_links: 6
extracted: 2026-08-07T05:55:13Z
extractor: site_to_paper.py (pandoc)
---

# Cascading Style Sheets Syntax - Miscellaneous Syntax Details

*Source page: `~bloo/indexdot/css/syntax/misc.htm`*

\

<span class="pagetitle">Miscellaneous Syntax Details</span>\
= <span class="sitetitle">Index DOT Css</span> by [Brian Wilson](../../misc/email.htm) =
========================================================================================

<div align="center">

|  |
|----|
| [Main Index](../index.html) \| [Property Index](../propindex/font.htm) \| [CSS Support History](../supportkey/syntax.htm) \| [Browser History](../../history/browsers.htm) |

</div>

<span id="character"></span>

**Unicode Character Escape Mechanism**\
\[***CSS2***\] \[**IE6**\|***N6***\|**O6**\]  
The base character set for CSS is Unicode, a set which allows for approximately 65,000 characters and extension mechanisms allowing for millions more.) Keyboards are just not capable of directly inputing all of these characters. Yet, there will likely be times when an author wishes to use a character that can not be directly input from the keyboard. A special new syntax in CSS2 allows for this.\
\
Use of the backslash character ("\\) indicates that what follows is an escape sequence for a Unicode character. The hexadecimal escape code that follows the backslash represents the desired Unicode code point. As many as six hexadecimal digits may be specified after the backslash character, but fewer may be used. Unlike in HTML, character references in CSS have a beginning delimiter, but no end delimiter other than the constraint that there will be no *MORE* than 6 hexadecimal digits for the reference. For character references *LESS* than 6 hexadecimal digits in length, appending the value with a white-space character ensures that the Unicode value reference is properly terminated. In CSS2, The first trailing white-space character following a Unicode character reference should be ignored.\
\
**Syntax:**\
    "\\ \[0..9a..f\]{1,6} \[" "\]?\
    (eg: "\00007btext" --\> "{text")\
**Notes:**

- The backslash character can also be used to avoid parsing of special CSS syntax characters (eg: the ";" character can be escaped as "\\".) Hexadecimal characters can not be escaped this way because they are interpreted in the manner listed above.
- A newline character is ignored in a string value if it is immediately preceded by the backslash character.

<span id="comment"></span>

**CSS Comments**\
\[***CSS1***\|**CSS2**\] \[***IE3***\|**N4**\|**O3.5**\]  
While Cascading Style Sheet syntax is very self-documenting, there will be times when an author will want to add explanations or comments in a style sheet. CSS syntax allows for this. A CSS comment (like in the C programming language) begins with "/\*", and ends with "\*/" - everything that lies between these delimiters is the comment and should be ignored by the CSS parser. Comments may not be nested and can occur anywhere between CSS syntax constructs.\
\

**Note:**

The specification does not seem to be clear on how HTML/XML comment constructs ("\<!-- --\>") are treated in CSS syntax.

<span id="important"></span>

**'!important' Rules**\
\[***CSS1***\|**CSS2**\] \[***IE4***\|**N6**\|**O3.5**\]  
CSS allows both the author and the reader to specify style information for a document. An author's style sheet will usually contain rules attempting to preserve the original design intent; a user's style sheet may contain style rules that are imperative for their viewing needs (eg: possibly larger font sizes for users with poorer eyesight.)\
\
By default, style rules in an author's style sheet will have higher precedence than an equivalent style rule in a user's style sheet. This skews the decision-making of page rendering decidedly towards the author, which can be very limiting for some users ...to the point of making content exclusionary in some cases.\
\
CSS allows the scales to be balanced with the "!important" keyword. When this keyword is added at the end of a style declaration (eg: "h2 { color: white !important }") it is given higher precedence than an equivalent style rule that does not carry the "!important" keyword. When equivalent style rules in an author and user style sheet both carry the "!important" keyword, the user's style rule takes precedence.

\
**Example:**\

<div class="example">

<span class="text">**Selector** { <span class="property">CSS-Property:</span> Property-value **!important** }</span>

</div>

\
**Notes:**

- In CSS1, an author "!important" declaration has precedence over a user "!important" declaration. This was changed in CSS2 to its current behavior.
- Setting a shorthand property to be "!important" sets all of its sub-properties to "!important" as well, whether explicitly specified or not (eg: setting the 'font' property for a selector as "!important" is the same as setting the 'font-style', 'font-variant', 'font-weight', 'font-size, 'line-height', and 'font-family' properties as "!important.")

**Browser Peculiarities**

- **Internet Explorer**
  **4.0:**
  \- If an extra asterisk character ("\*") is placed just before the end of a comment (eg: using "\*\*/" instead of "\*/"), the comment is not terminated, and valid style declarations that follow are also treated as comments.
- **Netscape**
  **4.x+:**
  \- Reported Elsewhere: Some cases of using the "!important" keyword can cause the entire style declaration to be ignored (noted situation: when the "!important" statement immediately follows a style declaration without spaces between them.)

\
[Boring Copyright Stuff....](../../misc/copyright.htm)\
