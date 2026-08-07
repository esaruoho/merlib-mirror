---
title: "Opera CSS Extensions - Cascading Style Sheets Syntax"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/extensions/operaextensions.htm
order: 1458
reachable_from_entry: false
images: 0
internal_links: 7
extracted: 2026-08-07T17:07:46Z
extractor: site_to_paper.py (pandoc)
---

# Opera CSS Extensions - Cascading Style Sheets Syntax

*Source page: `~bloo/indexdot/css/properties/extensions/operaextensions.htm`*

\

# <span class="pagetitle">Opera CSS Extensions</span>

<div align="center">

**[Support Key:](../../../misc/suppkey.htm)** \[***O4***\]\
= <span class="sitetitle">Index DOT Css</span> by [Brian Wilson](../../../misc/email.htm) =

</div>

<div align="center">

|  |
|----|
| [Main Index](../../index.html) \| [Property Index](../../propindex/font.htm) \| [CSS Support History](../../supportkey/syntax.htm) \| [Browser History](../../../history/browsers.htm) |

</div>

**What Are They?**  
Many browser makers have been [following a convention](http://lists.w3.org/Archives/Public/www-style/2002Jan/0094.html) of using a dash character ("-") as a prefix for proprietary CSS properties...Opera follows this convention with a few XML-specific CSS properties created to enable some functionalities in their XML rendering of WML, mail and news. (BTW, Microsoft's Internet Explorer for Win32 doesn't adhere to this convention - they have chosen to name their proprietary properties anything they feel like, which may create compatibility problems later on.)\
\
These proprietary properties allow replaced element images and hyperlinking behavior to be included in general XML documents. An author could use XHTML for this purpose, but for cases where that is not possible, these Opera CSS properties add this basic functionality from HTML to any XML document. (NOTE: These properties only work on non-HTML/XHTML documents.)\
\
Should you use these proprietary CSS properties and values? Opera suggests that you should not. But, as long as you keep in mind that Opera is the only browser that can utilize these properties, hanging yourself because of possible cross-browser incompatibilities should be a choice that anyone has in their development toolbox. Of course, Opera is making things as difficult as possible for authors to use these properties: with every browser version they have changed the names of these properties every time. I attempt to list these properties here mostly for completeness sake.\
\
The following information is mostly from [Opera's documentation](http://www.opera.com/docs/specs/), quoted where directly referenced.

<!-- -->

**Proprietary Opera CSS Properties**\
**-o-replace**  
**Support:** \[***O7***\] (See note below about the previous names for this property in older Opera versions)

**Inherited:** No

**Allowed Values:**\
- **None**: \[DEFAULT\] Element is not a replaced element.\
- **attr(\[ATTRIBUTE\])**: Element will be replaced by the contents of the URL specified in the \[ATTRIBUTE\] value.

**Purpose:**\
Primarily used to to display images in XML documents...\
"This property declares the element to be replaced or not. If replaced, the attr() function is used to point to the attribute where the URI to the content can be found."

**-o-set-link-source**  
**Support:** \[***O7***\] (See note below about the previous names for this property in older Opera versions)

**Inherited:** No

**Allowed Values:**\
- **None**: \[DEFAULT\] Do not set a link source for this element.\
- **attr(\[ATTRIBUTE\])**: Use the value of the \[ATTRIBUTE\] attribute as the link-source\
- **\[URL\]**: Use the specified URL as the link-source\
- **\[String\]**: Use the specified string as the link-source\
- **content()**: Unknown - This is from Opera's documentation, but there are no examples listed to aid in understanding this usage

**Purpose:**\
Primarily used to set the destination URL for a hyperlink in XML documents...\
"This property sets the value of the 'link' variable which can later be used to generate a link through the '-o-use-link-source' property."

**-o-use-link-source**  
**Support:** \[***O7***\] (See note below about the previous names for this property in older Opera versions)

**Inherited:** No

**Allowed Values:**\
- **None**: \[DEFAULT\] Do not use any link-source for this element.\
- **Current**: Use the current '-o-set-link-source' value as the destination URL for this element.\
- **Next**: Use the next '-o-set-link-source' value (as defined in document order?) as the destination URL for this element.

**Purpose:**\
Primarily used to set the usable activation target for a hyperlink in XML documents...\
"This property sets the element to be a source anchor and, if so, declares which value of the 'link' variable that should be used: the current or the next."

**Browser Peculiarities**

- **Opera**
  **General:**
  \- Follow the bouncing ball: What will Opera call its proprietary properties in the next version?\
  Opera can't seem to make up its mind about what to call these properties. With every new version they keep changing their names:
  **-o-replace**:
  4.x-6.x: -replace; 7.x: -o-replace
  **-o-use-link-source**:
  4.x: -link-use; 5.x: use-link-source; 6.x: -use-link-source; 7.x: -o-use-link-source
  **-o-set-link-source**:
  4.x: -link-set; 5.x: set-link-source; 6.x: -set-link-source; 7.x: -o-set-link-source
  I wonder what they'll call them in the next version? ;-}
  **4.x:**
  \- This version seems to double the height/width dimensions of any image I have tried so far using the '-replace' property. In 5.x+, the correct dimensions are used.

\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
