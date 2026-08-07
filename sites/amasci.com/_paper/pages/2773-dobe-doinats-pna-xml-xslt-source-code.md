---
title: "Dobe Doinat's PNA XML / XSLT Source Code"
source_domain: amasci.com
source_path: ~dobe/PNA_XMLref.htm
order: 2773
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T17:09:13Z
extractor: site_to_paper.py (pandoc)
---

# Dobe Doinat's PNA XML / XSLT Source Code

*Source page: `~dobe/PNA_XMLref.htm`*

<div id="PNA_XMLNXML_Start">

</div>

|                                    |
|:-----------------------------------|
| Dobe Doinat's XML / XSLT Reference |

<table width="95%" cols="2" rows="1" data-border="0" data-cellpadding="10">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td style="text-align: left;" data-valign="top" width="60%"><blockquote>
Internal links below are text only
</blockquote>
XML Source Code
<table>
<tbody>
<tr>
<td class="specialBROWN80I" style="text-align: left;" width="100%" onmouseover="this.style.color=&#39;red&#39;; this.style.fontSize=&#39;110%&#39;;" onmouseout="this.style.color=&#39;brown&#39;; this.style.fontSize=&#39;100%&#39;;"><a href="#PNA_XMLNXML_XML_text"><strong>PNA_XMLNXML_XML.XML</strong></a></td>
</tr>
</tbody>
</table>
XSL Source Code
<table>
<tbody>
<tr>
<td class="specialBROWN80I" style="text-align: left;" width="100%" onmouseover="this.style.color=&#39;red&#39;; this.style.fontSize=&#39;110%&#39;;" onmouseout="this.style.color=&#39;brown&#39;; this.style.fontSize=&#39;100%&#39;;"><a href="#PNA_XMLNXML_XSL_text"><strong>PNA_XMLNXML_XSL.XSL</strong></a></td>
</tr>
</tbody>
</table>
DTD Source Code
<table>
<tbody>
<tr>
<td class="specialBROWN80I" style="text-align: left;" width="100%" onmouseover="this.style.color=&#39;red&#39;; this.style.fontSize=&#39;110%&#39;;" onmouseout="this.style.color=&#39;brown&#39;; this.style.fontSize=&#39;100%&#39;;"><a href="#PNA_XMLNXML_DTD_text"><strong>PNA_XMLNXML_DTD.DTD</strong></a></td>
</tr>
</tbody>
</table>
<br />
&#10;<blockquote>
These are preserved working documents as of <strong>January 3, 2002</strong>, source code (displayed as text) of the three required files to display the file below in a browser. Compare source and result side-by-side to see the effects of merging three files into what you see on <a href="PNA_XMLNXML_XML.XML" target="_new"><strong>PNA_XMLNXML_XML.XML</strong></a> (displayed in a new browser)<br />
&#10;</blockquote></td>
<td class="RelativeSize80" style="text-align: left;" data-valign="top" width="40%"><br />
<br />
</td>
</tr>
</tbody>
</table>

------------------------------------------------------------------------

<div id="PNA_XMLNXML_XML_text">

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td class="specialBROWN150" style="text-align: left;" title="This file contains the data and a link to the stylesheet and the Document Type Definition file." width="70%" onmouseover="this.style.color=&#39;green&#39;; this.style.fontSize=&#39;170%&#39;;" onmouseout="this.style.color=&#39;brown&#39;; this.style.fontSize=&#39;160%&#39;;">PNA_XMLNXML_XML.XML</td>
<td style="text-align: right;" width="30%"><a href="#PNA_XMLNXML_Start">Back to Start</a><br />
</td>
</tr>
</tbody>
</table>

> **\<?xml version='1.0'?\>**\
> \<!-- New format for Dobe's Punny Name Archive on 12-24-2001 --\>\
> \<!-- Hand-written XHTML, XML, XSLT, CSS and JS suite --\>\
> \<!-- filename: **PNA_XMLNXML_XML.XML** --\>\
> \<!--\
> Dobe Doinat's Punny Name Archive\
> MegaloMedia Copyright **January 03, 2002**\
> John W. Hartman (Dobe Doinat)\
> http://www.eskimo.com/~dobe/\
> mailto://dobe@eskimo.com\
> IDE of choice: XMLWriter, Wattle Software\
> ISP of choice: eskimo.com, Bob is Everywhere!\
> --\>\
> \
> **\<?xml-stylesheet type='text/xsl' href='PNA_XMLnXML_XSL.xsl'?\>**\
> \<!-- ~LAST MODIFIED: 2002_01_03 --\>\
> \<!-- ~**use with 'PNA_XMLnXML_XSL.xsl'**~ --\>\
> \
> \<!-- Begin Root Element: --\>\
> **\<!DOCTYPE dobedoc SYSTEM 'PNA_XMLnXML_DTD.dtd' \[\
> \<!ENTITY dfd 'Dobe Fnord Doinat'\>\
> \<!ENTITY ge 'General Entity'\>\
> \<!ENTITY pe 'Parameter Entity'\>\
> \<!ENTITY ges 'General Entities'\>\
> \<!ENTITY pes 'Parameter Entities'\>\
> \<!ENTITY nbsp ' '\>\
> \]\>**\
> \
> \<!-- Comments with 'Element:' show DTD structure --\>\
> \<!-- Begin Root Element: \<!ELEMENT dobedoc (last_updated?, title?, body)+\> --\>\
> **\<dobedoc\>**\
> \<!-- Begin Next Element: \<!ELEMENT last_updated (#PCDATA)\> --\>\
> **\<last_updated\>January 4, 2002**\</last_updated\>\
> \<!-- Begin Next Element: \<!ELEMENT title (#PCDATA)\> --\>\
> **\<title\>**XML/XSLT Guide\</title\>\
> \
> \<!-- Begin Next Element: --\>\
> \<!-- Begin new BODY Block of Result Tree --\>\
> **\<body\>**\
> \<!-- Begin new GLOSSARY Block --\>\
> **\<glossary\>**\
> **\<keywords\>**\
> \
> \<!-- **dobedoc/body/glossary/keywords/keyword** --\>\
> \
> \<!-- \~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~~Well-formed\~\~\~\~\~\~\~~ --\>\
> \<!-- ! --\>\
> **\<keyword name='Well-formed'\>**Well-formed\
> \<def\>Well-formed means that every element is properly nested,\
> as well as properly closed. If the element has content, (either\
> other elements or text), it must have a closing tag. If it is an\
> empty element, it may be closed with a special syntax, using\
> a 'space', 'slash', then close bracket ( ' /\>' ). Every attribute value\
> must be enclosed in (either double quotes or single, matching) quotes.\
> Additionally, Entity References (using '\&lt;', '\&gt;', or '\&amp;')\
> must be used instead of using a '\<' or '\>' or '&', etc.\
> Well-formed XML documents without a DTD or schema reference\
> have all attributes as CDATA by default.\
> \</def\>\
> \<example\>\
> \<newline /\>\<doc\>\
> \<newline /\>  \<chapter\>\
> \<newline /\>\<red\>    \<!-- This is properly nested and follows the rules! --\>\</red\>\<br /\>\
> \<newline /\>  \</chapter\>\
> \<newline /\>\</doc\>\<newline /\>\
> \</example\>\
> \</keyword\>\
> \
> \<!-- \~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~~XSL Valid\~\~\~\~\~\~\~~ --\>\
> \<!-- ! --\>\
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='Valid'\>**Valid\
> \<def\>\<newline /\>A valid document is not only well-formed, but complies with\
> either a XML Schema (compliant) or a Document Type Definition (compliant) file\
> which must be able to be found by the XSLT engine.\
> \</def\>\
> \<example\>\
> \<newline /\>\<?xml version='1.0'?\>\
> \<newline /\>\<red\>\<!DOCTYPE doc SYSTEM 'DTDfilename.dtd'\>\</red\>\
> \<newline /\>  \<doc\>\
> \<newline /\>  \<chapter\>\
> \<newline /\>    \<picture link='filename.jpg' /\>\
> \<newline /\>  \<chapter\>\
> \<newline /\>\</doc\> \<newline /\>\
> \</example\>\
> \</keyword\>\
> \
> \
> \<!-- \~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~~XSL Elements\~\~\~\~\~\~\~~ --\>\
> \<!-- ! --\>\
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='xsl:apply-templates'\>**xsl:apply-templates\
> \<def\>\
> \<newline /\>\<red\>NOTE: This element may have non-standard behavior in MSIE 5.X!\
> \</red\>\
> \<newline /\>\
> Directs the XSL processor to find the appropriate template to apply\
> based on the type and context of each selected node.\<newline /\>\
> The non-standard behavior in MSIE may include using the attributes: \<newline /\>\
> \<red\>order-by = '+\|-pattern'\</red\> and \<red\>select = 'pattern'\</red\> and possibly others.\<newline /\>\
> This applies an XSL template to the current element (and sometimes it's children nodes as well).\<newline /\>\
> In the absence of a select attribute, the xsl:apply-templates instruction processes all of the children of the current node,\
> including text nodes. However, text nodes that have been stripped will not be processed.\
> If stripping of whitespace nodes has not been enabled for an element, then all whitespace in the content of the element\
> will be processed as text, and thus whitespace between child elements will count in determining the position of a child\
> element as returned by the position function. A select attribute can be used to process nodes selected by an\
> expression instead of processing all children. The value of the select attribute is an expression.\
> The expression must evaluate to a node-set. The selected set of nodes is processed in document order,\
> unless a sorting specification is present.\<newline /\>\<newline /\>\
> \
> Syntax:\<newline /\>\
> \<newline /\>\<green\>\<!-- \</green\>\<red\>Order-by\</red\>\<green\> is non-standard according to W3C --\>\</green\>\
> \<newline /\> \<xsl:apply-templates\<newline /\>\
>    \<red\>order-by\</red\>='sort-criteria-list'\<newline /\>\
>    select='pattern' \>\<newline /\>\
>  \</xsl:apply-templates\>\<newline /\>\
> \</def\>\
> \<example\>\
> \<newline /\>\<xsl:template match='red'\>\
> \<newline /\>  \<span class='red'\>\
> \<newline /\>\<red\>    \<xsl:apply-templates/\>\</red\>\
> \<newline /\>  \</span\>\
> \<newline /\>\</xsl:template\>\<newline /\>\
> \</example\>\
> \
> \</keyword\>\
> \
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='xsl:attribute'\>**xsl:attribute\
> \<def\>\
> \<newline /\>\<red\>NOTE: This element may have non-standard behavior in MSIE 5.X!\
> \</red\>\
> \<newline /\>\
> The non-standard behavior in MSIE may include using the attribute: \<newline /\>\
> \<red\>name = 'attribute-name'\</red\> and possibly others.\<newline /\>\
> The xsl:attribute element can be used to add attributes to result elements whether created by literal result elements\
> in the stylesheet or by instructions such as xsl:element. The expanded-name of the attribute to be created is\
> specified by a required name attribute and an optional namespace attribute. Instantiating an xsl:attribute element\
> adds an attribute node to the containing result element node. The content of the xsl:attribute element is a template\
> for the value of the created attribute. \<newline /\>\<newline /\>\
> This adds a new attribute to the current output element:\
> \</def\>\
> \
> \<example\>\
> \<newline /\> \<Copies the 'myElement' element and adds a 'copied' attribute with the value 'true'.\>\
> \<newline /\> \<xsl:template match='myElement'\>\
> \<newline /\>   \<xsl:copy\>\
> \<newline /\>   \<xsl:attribute name='copied'\>true\</xsl:attribute\>\
> \<newline /\>   \<xsl:apply-templates /\>\
> \<newline /\>   \</xsl:copy\>\
> \<newline /\> \</xsl:template\>\<newline /\>\<newline /\>\
> \</example\>\
> \
> \
> \<example\>\
> \<newline /\>\<xsl:template match='text()'\>\
> \<newline /\>  \<table\>\
> \<newline /\>    \<\<red\>xsl:attribute name='width'\>100%\</xsl:attribute\>\</red\>\
> \<newline /\>  \</table\>\
> \<newline /\>\</xsl:template\>\<newline /\>\
> \</example\>\
> \<example\>\
> \<newline /\>\<newline /\> \<img\>\
> \<newline /\>   \<xsl:attribute name='src'\>\
> \<newline /\>   \<xsl:value-of select='imagenames/imagename' /\>\
> \<newline /\>   \</xsl:attribute\>\
> \<newline /\> \</img\>\
> \</example\>\
> \</keyword\>\
> \
> \
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='xsl:cdata'\>**xsl:cdata\
> \<def\>\
> \<newline /\>\<red\>NOTE: This element may have non-standard behavior in MSIE 5.X!\
> \</red\>\
> \<newline /\>\
> The non-standard behavior in MSIE may include using the attribute: \<newline /\>\
> \<red\>name = 'attribute-name'\</red\> and possibly others.\<newline /\>\
> This adds a new attribute to the current output element.\
> \</def\>\
> \<example\>\
> \<newline /\>    Non-W3C-Standard element!\
> \<newline /\>    Waiting for better example...\<newline /\>\
> \</example\>\
> \</keyword\>\
> \
> \
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='xsl:choose'\>**xsl:choose\
> \<def\>\
> \<newline /\>\<red\>NOTE: This element may have non-standard behavior in MSIE 5.X!\
> \</red\>\
> \<newline /\>\
> This provides a selection mechanism based on conditions. \<newline /\>\
> The xsl:choose element selects one among a number of possible\
> alternatives.\
> \<newline /\>It consists of a sequence of xsl:when elements\
> followed by an optional xsl:otherwise element.\
> \<newline /\>Each xsl:when element has a single attribute,\
> test, which specifies an expression.\
> \<newline /\>The content of the xsl:when and xsl:otherwise\
> elements is a template.\
> \<newline /\>When an xsl:choose element is processed, each of the xsl:when elements is tested in turn,\
> by evaluating the expression and converting the resulting object to a boolean as if by a call to the boolean function.\
> \<newline /\>The content of the first, and only the first, xsl:when element whose test is true is instantiated.\
> \<newline /\>If no xsl:when is true, the content of the xsl:otherwise element is instantiated.\
> \<newline /\>If no xsl:when element is true, and\
> no xsl:otherwise element is present, nothing is created.\
> \<newline /\>\
> For simple conditional testing, use the \<red\>xsl:if\</red\> element structure instead.\
> \<newline /\>\<newline /\>\
> The \<red\>xsl:otherwise\</red\> element provides a DEFAULT condition\
> for the \<red\>xsl:choose\</red\> element. Other alternatives are\
> indicated by \<red\>xsl:when\</red\> elements.\
> \<newline /\>\
> \</def\>\
> \<example\>\
> \<newline /\>\<green\>\<!--\</green\>\
> \<newline /\>   \<green\>This example declares a variable named color,\
> then sets it's value to the color attribute of the current element.\
> If the current element has no color attribute, the value of the variable will be set to red:\</green\>\
> \<newline /\>\
> --\>\<newline /\>\
> \
> \<newline /\>\<xsl:variable name = 'color'\>\
> \<newline /\>  \<red\>\<xsl:choose\>\</red\>\
> \<newline /\>    \<xsl:when test='@color'\>\
> \<newline /\>    \<xsl:value-of select='@color'\>\
> \<newline /\>    \</xsl:when\>\
> \<newline /\>  \<xsl:otherwise\>red\</xsl:otherwise\>\
> \<newline /\>  \</xsl:choose\>\
> \<newline /\>\</xsl:variable\>\<newline /\>\
> \</example\>\
> \</keyword\>\
> \
> \
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='xsl:comment'\>**xsl:comment\
> \<def\>\
> \<newline /\>\<red\>NOTE: This element may have non-standard behavior in MSIE 5.X!\
> \</red\>\
> \<newline /\>\
> The xsl:comment element is instantiated to create a comment node in the result tree.\
> The content of the xsl:comment element is a template for the string-value of the comment node.\
> \<newline /\>\
> In addition (see second example \<red\>hiLite()\</red\> below), it acts as a \<bold\>hide/unhide\</bold\> for JavaScripts within a \<script\> element in an XSLT template! Powerful, and in my testing, required!\
> \</def\>\
> \<example\>\
> \<newline /\>\<red\>\<xsl:comment\>\</red\>Comment Node value\<red\>\</xsl:comment\>\</red\>\
> \<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\>\<newline /\>\<green\>\<!-- Here's a neat trick of transforming a source element '\</green\>\<black\>notes\</black\>' \<green\>into a comment in the result tree!\</green\>\
> \<newline /\>\<green\> --\>\</green\>\
> \<newline /\>\<newline /\> \<xsl:template match='\<black\>notes\</black\>'\>\
> \<newline /\>    \<xsl:comment\>\
> \<newline /\>    \<xsl:value-of /\>\
> \<newline /\>    \</xsl:comment\>\
> \<newline /\> \</xsl:template\>\<newline /\>\
> \</example\>\
> \
> \
> \<example\>\
> \<newline /\>\<green\>\<!--\</green\>\
> \<newline /\>\<green\>This next example shows how a call to JavaScript looks in an XSL page.\</green\>\
> \<newline /\>\<green\>The very XSLT document, in fact, which transformed the page you now read! \</green\>\
> \<newline /\>\<green\>   (Namely, \</green\>\
> \<bold\>' \_XMLnXML_XSL.xsl '\</bold\>\
> \<green\>) (Only tested in MSIE 5+.)\</green\>\
> \<newline /\>\
> \<newline /\>\<green\>I found\</green\> \<red\>hiLite()\</red\> \<green\> in Microsoft documentation in MSDN\</green\>\
> \<newline /\>\<green\>call hiLite() from anywhere in an HTML page or virtual equivilent,\</green\>\
> \<newline /\>\<green\>such as XSLT, ASP, JSP, etc. with this syntax:\</green\>\
> \<newline /\>   \<bold\>div style='background-color:yellow' onClick='hiLite()'\>Click me!\</div\>\</bold\>\
> \<newline /\>\<green\>--\>\</green\>\<newline /\>\
> \<newline /\>\<head\>\
> \<newline /\> \<bold\>\<script language='Javascript'\>\</bold\>\
> \<newline /\>   \<bold\>\<xsl:comment\>\</bold\>\
> \<newline /\>   \<bold\>\<\![CDATA\[\</bold\>\
> \<newline /\>      function \<red\>hiLite()\</red\>\
> \<newline /\>      {\
> \<newline /\>      e = window.event.srcElement;\
> \<newline /\>         if (e.style.backgroundColor != 'yellow')\
> \<newline /\>            e.style.backgroundColor = 'yellow';\
> \<newline /\>         else\
> \<newline /\>      e.style.backgroundColor = 'white';\
> \<newline /\>      }\
> \<newline /\>    \<bold\>\]\]\>\</bold\>\
> \<newline /\>   \<bold\>\</xsl:comment\>\</bold\>\
> \<newline /\> \<bold\>\</script\>\</bold\>\
> \<newline /\>\</head\>\
> \</example\>\
> \
> \</keyword\>\
> \
> \
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='xsl:copy'\>**xsl:copy\
> \<def\>\
> \<newline /\>\<red\>NOTE: This element may have non-standard behavior in MSIE 5.X!\
> \</red\>\
> \<newline /\>\
> The xsl:copy element provides an easy way of copying the current node. Instantiating the xsl:copy element\
> creates a copy of the current node. The namespace nodes of the current node are automatically copied as well,\
> but the attributes and children of the node are not automatically copied. The content of the xsl:copy element is a\
> template for the attributes and children of the created node; the content is instantiated only for nodes of types that\
> can have attributes or children (i.e. root nodes and element nodes). \<newline /\>\
> \</def\>\
> \<example\>\
> \<newline /\>\<xsl:template match = 'ThisElement'\>\
> \<newline /\>  \<red\>\<xsl:copy\>\</red\>\
> \<newline /\>    \<xsl:apply-templates /\>\
> \<newline /\>  \</xsl:copy\>\
> \<newline /\>\</xsl:templates\>\
> \</example\>\
> \<example\>\
> \<newline /\>\<newline /\>\<green\>\<!-- \</green\>\<newline /\>\
> \<green\>The identity transform copies each node in the source to the output to provide a\
> logically equivalent tree. It does NOT yield character-by-character\
> equivalence, for instance, entities WILL be expanded, and white space that is NOT marked as\
> SIGNIFICANT may be removed.\</green\>\<newline /\>\
> \
> \<green\>--\>\</green\>\<newline /\>\
> \
> \<newline /\> \<green\>\<!-- XSL Styleheet Identity Transform --\>\</green\>\
> \<newline /\> \<green\>\<!-- Modify to accommodate whitespace! --\>\</green\>\
> \<newline /\> \<xsl:stylesheet xmlns:xsl='http://www.w3.org/TR/WD-xsl'\>\
> \<newline /\>   \<xsl:template\>\
> \<newline /\>   \<xsl:copy\>\
> \<newline /\>   \<xsl:apply-templates select='@\*'/\>\
> \<newline /\>   \<xsl:apply-templates/\>\
> \<newline /\>   \</xsl:copy\>\
> \<newline /\>   \</xsl:template\>\
> \<newline /\> \</xsl:stylesheet\>\<newline /\>\
> \
> \</example\>\
> \</keyword\>\
> \
> \
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='xsl:define-template-set'\>**xsl:define-template-set\
> \<def\>\
> \<newline /\>\<red\>NOTE: This element may have non-standard behavior in MSIE 5.X!\
> \</red\>\
> \<newline /\>\<bold\>Non-W3C-Standard element!\</bold\>\
> \</def\>\
> \<example\>\
> \<newline /\>    Example...?\<newline /\>\
> \</example\>\
> \</keyword\>\
> \
> \
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='xsl:element'\>**xsl:element\
> \<def\>\<newline /\>\
> This element provides an escaping mechanism for creating elements with namespace clashes, such as xsl itself.\<newline /\>\
> \<red\>NOTE: This element may have non-standard behavior in MSIE 5.X!\
> \</red\>\
> \<newline /\>\
> The xsl:element element allows an element to be created with a computed name. The expanded-name of the\
> element to be created is specified by a required name attribute and an optional namespace attribute.\
> The content of the xsl:element element is a template for the attributes and children of the created element.\
> The name attribute is interpreted as an attribute value template. It is an error if the string that results from instantiating\
> the attribute value template is not a QName. An XSLT processor may signal the error; if it does not signal the error,\
> then it must recover by making the the result of instantiating the xsl:element element be the sequence of nodes\
> created by instantiating the content of the xsl:element element, excluding any initial attribute nodes. If the namespace\
> attribute is not present then the QName is expanded into an expanded-name using the namespace declarations in\
> effect for the xsl:element element, including any default namespace declaration. If the namespace attribute is present,\
> then it also is interpreted as an attribute value template. The string that results from instantiating the attribute value\
> template should be a URI reference. It is not an error if the string is not a syntactically legal URI reference.\
> If the string is empty, then the expanded-name of the element has a null namespace URI. Otherwise, the string is\
> used as the namespace URI of the expanded-name of the element to be created. The local part of the QName\
> specified by the name attribute is used as the local part of the expanded-name of the element to be created.\
> \<newline /\>\
> The non-standard behavior in MSIE may include using the attribute: \<newline /\>\
> \<red\>\<xsl:element name = '{@attribute-name}'\>\</red\> and possibly others.\<newline /\>\</def\>\
> \
> \<example\>\
> \<newline /\>\<green\>\<!--\</green\>\
> \<newline /\>\<green\>The xsl:element is necessary because XSL elements cannot be used as output elements.\</green\>\
> \<newline /\>\<green\>--\>\</green\>\
> \<newline /\> \<xsl:template match='item'\>\
> \<newline /\>   \<xsl:element name='xsl:template'\>\
> \<newline /\>   \<xsl:attribute name='match'\>cost\</xsl:attribute \>\
> \<newline /\>   \<xsl:attribute name='xml:space'\>preserve\</xsl:attribute\>\
> \<newline /\>   \<xsl:apply-templates /\>\
> \<newline /\>   \</xsl:element\>\
> \<newline /\> \</xsl:template\>\
> \</example\>\
> \</keyword\>\
> \
> \
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='xsl:entity-ref'\>**xsl:entity-ref\
> \<def\>\
> \<newline /\>\<red\>NOTE: This element may have non-standard behavior in MSIE 5.X!\
> \</red\>\
> \<newline /\>\
> The xsl:entity-ref element adds a new entity reference node to the output.\
> \<newline /\>\
> The non-standard behavior in MSIE may include using the attribute: \<newline /\>\
> \<red\>\<xsl:entity-ref name = '@attribute-name'\>\</red\> and possibly others.\<newline /\>\</def\>\
> \<example\>\
> \<newline /\>To be entered later\
> \</example\>\
> \</keyword\>\
> \
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='xsl:eval'\>**xsl:eval\
> \<def\>\
> \<newline /\>Evaluates a SCRIPT expression to generate a text string.\
> \<newline /\>\<newline /\>\<red\>NOTE:\</red\> Only valid with a stylsheet specifying the\
> \<newline /\>   \<red\>xsl namespace, http://www.w3.org/TR/WD-xsl\</red\>.\<newline /\>\
> \<newline /\>\<newline /\>\<red\>NOTE:\</red\> Stylesheets using the XSLT namespace:\
> \<newline /\>   \<red\>http://www.w3c.org/1999/XSL/Transform\</red\>,\
> \<newline /\>cannot use this element.\
> \<newline /\>\<newline /\>\<red\>NOTE:\</red\> This attribute accepts the same values\
> as the language attribute on the HTML SCRIPT element.\<newline /\>\
> \<newline /\>\<red\>NOTE:\</red\>\
> The contents of this element are treated as an expression.\
> Alternatively, this element can also contain a sequence of\
> script statements. The value returned by the script is\
> converted to a string.\
> The reserved characters \<, \>, and & are escaped\
> using the character entities \&lt;, \&gt;, and \&amp; respectively.\
> Other than at the text level, xsl:eval does not provide a\
> mechanism for affecting structural transformation, which may require using\
> the \<red\>expr\</red\> attribute on \<red\>xsl:if\</red\> and \<red\>xsl:when\</red\>.\
> \
> \<newline /\>\<newline /\>\
> \
> \<red\>NOTE: This element may have non-standard behavior in MSIE 5.X!\
> \</red\>\
> \<newline /\>\
> The xsl:eval element provides an evaluation mechanism to evaluate output content.\
> \<newline /\>\
> The non-standard behavior in MSIE may include using the attribute: \<newline /\>\
> \<red\>\<xsl:eval language = 'JScript'\>\</red\> and possibly others.\<newline /\>\
> \<newline /\>\
> \<red\>NOTE: \</red\>\<bold\>Also see \<xsl:comment\> for JavaScript example and syntax.\</bold\>\
> \<newline /\>\
> \</def\>\
> \<example\>\
> \<newline /\>\<green\>\<!-- \</green\>\
> \<newline /\>\<green\>Demonstrates a call to a user-defined routine in VBScript, called Celsius\</green\>\
> \<newline /\>\<green\>This example is also seen in \</green\>\<red\>xsl:script\</red\>.\
> \<newline /\>\<green\>--\>\</green\>\<newline /\>\
> \<newline /\> \<xsl:stylesheet \<red\>language='VBScript'\</red\> xmlns:xsl='http://www.w3.org/TR/WD-xsl'\>\
> \<newline /\>\<newline /\>  \<xsl:template match='/'\>\
> \<newline /\>   \<xsl:eval\>\<red\>Celsius(32)\</red\>\</xsl:eval\>\
> \<newline /\>  \</xsl:template\>\<newline /\>\
> \
> \<newline /\>    \<xsl:script language='VBScript'\>\
> \<newline /\>\<red\>      Function Celsius(fDegrees)\</red\>\
> \<newline /\>\<red\>      Celsius = (fDegrees - 32) \* 5 / 9\</red\>\
> \<newline /\>\<red\>      End Function\</red\>\
> \<newline /\>   \</xsl:script\>\<newline /\>\
> \<newline /\> \</xsl:stylesheet\>\
> \</example\>\
> \</keyword\>\
> \
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='xsl:for-each'\>**xsl:for-each\
> \<def\>\<newline /\>\
> \<red\>NOTE: This element may have non-standard behavior in MSIE 5.X!\
> \</red\>\
> \<newline /\>\
> The xsl:for-each element provides a mechanism to create a loop in the output stream..\
> \
> \<newline /\>\<newline /\>   \<green\>\<!-- \</green\>\
> \<newline /\>      \<red\>Order-By Attribute\</red\>\
> \<green\>Using the\</green\> \<bold\>now-deprecated\</bold\>\<green\> order-by attribute,\
> specify sort criteria in a semicolon-separated list.\
> When the first sort results in two equal items, the\
> second sort criterion is checked, and so on. Although this works in MSIE 5+,\
> the standard recommended W3C is the \</green\>\<bold\>xsl:sort\</bold\> \<green\>element.\</green\>\
> \<newline /\>      \
> \<green\>The first non-white-space character in\
> each sort criterion indicates whether the sort is\
> ascending (optional +) or descending (-).\</green\>\
> \<newline /\>      \
> \<green\>The sort criterion is expressed as an \</green\>\<bold\>XSL pattern\</bold\>\<green\>,\
> relative to the pattern described in the\
> select attribute.\</green\>\
> \<newline /\>      \<red\>Select Attribute\</red\>\
> \<green\>XSL pattern query evaluated the current context to\
> determine the set of nodes to iterate over.\
> The default value 'node()' indicates selection of all\
> children of the current node.\</green\>\
> \<newline /\>   \<green\>--\>\</green\>\<newline /\>\<newline /\>\
> \
> \
> When the result has a known regular structure, it is useful to be able to specify directly the template for selected nodes.\
> The xsl:for-each instruction contains a template, which is instantiated for each node selected by the expression specified\
> by the select attribute. The select attribute is required. The expression must evaluate to a node-set. The template is\
> instantiated with the selected node as the current node, and with a list of all of the selected nodes as the current node list.\
> The nodes are processed in document order, unless a sorting specification is present.\
> \<red\>\<xsl:for-each select = 'pattern'\>\</red\>,\<newline /\>\
> \<red\>\<xsl:for-each order-by = '+\|-pattern'\>\</red\> and possibly others.\<newline /\>\</def\>\
> \<example\>\
> \<newline /\> \<xsl:for-each\<newline /\>\
>    order-by='sort-criteria-list'\<newline /\>\
>    select='pattern' \>\<newline /\>\
>  \</xsl:for-each\>\<newline /\>\
> \</example\>\
> \<example\>\
> \<newline /\>\<green\>\<!-- \</green\>\
> \<newline /\>\<green\>As the syntax template above and the example below shows,\
> a template may be specified that defines what the structure of\
> the overall output document should be (a top-level 'html' element\
> containing 'body' and 'table' elements with repeated rows for each customer)\
> and uses templates to create 'td' elements for the 'name', 'address',\
> and 'phone' elements of the source XML data to a result tree to be\
> output as html or 'formatted' XML.\</green\>\
> \<newline /\>\<bold\>For another useful example,\</bold\> \<green\>look in the XSLT stylesheet\
> transforming this XML document, (\</green\> \<red\>\_XMLnXML_XSL.xsl\</red\>\<green\> ) and look for the template: \</green\>\
> \<newline /\>   \<bold\>\<xsl:template match='keywords'\>\</bold\>\
> \
> \<newline /\>\<green\>--\>\</green\>\<newline /\>\
> \
> \<newline /\> \<xsl:stylesheet xmlns:xsl='http://www.w3.org/TR/WD-xsl'\>\
> \<newline /\>  \<xsl:template match='/'\>\
> \<newline /\>   \<html xmlns='http://www.w3.org/1999/xhtml'\>\
> \<newline /\>   \<body\>\
> \<newline /\>   \<table\>\
> \<newline /\>   \<xsl:for-each select='customers/customer'\
> \<newline /\>      order-by='name; -address/state'\>\
> \<newline /\>   \<tr\>\
> \<newline /\>   \<td\>\<xsl:value-of select='name' /\>\</td\>\
> \<newline /\>   \<td\>\<xsl:value-of select='address' /\>\</td\>\
> \<newline /\>   \<td\>\<xsl:value-of select='phone' /\>\</td\>\
> \<newline /\>   \</tr\>\
> \<newline /\>   \</xsl:for-each\>\
> \<newline /\>   \</table\>\
> \<newline /\>   \</body\>\
> \<newline /\>   \</html\>\
> \<newline /\>  \</xsl:template\>\
> \<newline /\> \</xsl:stylesheet\>\
> \</example\>\
> \
> \</keyword\>\
> \
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='xsl:if'\>**xsl:if\
> \<def\>\
> \<newline /\>\<red\>NOTE: This element may have non-standard behavior in MSIE 5.X!\
> \</red\>\
> \<newline /\>\
> The xsl:entity-ref element provides a conditional branch mechanism based on a condition. \<newline /\>\
> The xsl:if element has a test attribute, which specifies an expression. The content is a template.\
> The expression is evaluated and the resulting object is converted to a boolean as if by a call to the boolean function.\
> \<newline /\>If the result is true, then the content template is instantiated; otherwise, nothing is created in the Result Tree.\
> \
> \<newline /\>\
> The non-standard behavior in MSIE may include using the attribute: \<newline /\>\
> \<red\>\<xsl:if expr = 'script-expression'\>\</red\> and possibly others, such as in the example below.\
> \<newline /\>\
> \</def\>\
> \
> \<example\>\
> \<newline /\>\<newline /\> \<xsl:if\
> \<newline /\>   expr='script-expression'\
> \<newline /\>   language='language-name'\
> \<newline /\>   test='pattern' \>\
> \<newline /\> \</xsl:if\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\>\<green\>\<!-- \</green\>\
> \<newline /\>\<green\>The next example inserts a Horizontal Rule (HR) before the first 'item' element in a set,\
> and another HR element after the last 'item' element in the set.\</green\>\
> \<newline /\>\<red\>NOTE:\</red\> \<green\>The '\</green\>\<red\>context()\</red\>\<green\> ' method refers to the set of 'item' elements selected by the \</green\>\
> \<red\>\<xsl:apply-templates\>\</red\> \<green\> element that caused this template to be invoked.\</green\>\
> \<newline /\>\<green\>--\>\</green\>\<newline /\>\
> \<newline /\> \<xsl:template match='item'\>\
> \<newline /\>   \<xsl:if test='\<red\>context()\[0\]\</red\>'\>\<HR/\>\</xsl:if\>\
> \<newline /\>   \<xsl:apply-templates /\>\
> \<newline /\>   \<xsl:if test='\<red\>context()\[end()\]\</red\>'\>\<HR/\>\</xsl:if\>\
> \<newline /\> \</xsl:template\>\
> \</example\>\
> \</keyword\>\
> \
> \
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='xsl:otherwise'\>**xsl:otherwise\
> \<def\>\
> \<newline /\>\
> The \<red\>xsl:otherwise\</red\> element provides a DEFAULT condition\
> for the \<red\>xsl:choose\</red\> element. Other alternatives are\
> indicated by \<red\>xsl:when\</red\> elements.\
> \<newline /\>\
> \<newline /\>\
> For simple conditional testing, use the \<red\>xsl:if\</red\> element.\
> \</def\>\
> \<example\>\
> \<newline /\>\<green\>\<!-- \</green\>\
> \<newline /\>   \<green\>This example shows a template for\
> 'order' elements, and inserts an hr or br before the order's contents\
> based on the order's 'total' element value.\</green\>\
> \
> \<newline /\>\<green\>--\>\</green\>\<newline /\>\
> \<newline /\>  \<xsl:template match='order'\>\
> \<newline /\>    \<xsl:choose\>\
> \<newline /\>    \<xsl:when test='total\[. \$lt\$ 10\]'\>\
>     \<green\>\<!-- If the total is less than 10, --\>\</green\>\
> \<newline /\>    \<hr style='color:black' /\>\
>     \<green\>\<!-- a black HR will be generated. --\>\</green\>\
> \<newline /\>    \</xsl:when\>\
> \<newline /\>    \<xsl:when test='total\[. \$lt\$ 20\]'\>\
>     \<green\>\<!-- If the total is less than 20, --\>\</green\>\
> \<newline /\>    \<hr style='color:red' /\>\
>     \<green\>\<!-- a red HR will be generated. --\>\</green\>\
> \<newline /\>    \</xsl:when\>\
> \<newline /\>    \<xsl:otherwise\>\
>     \<green\>\<!-- Otherwise, --\>\</green\>\
> \<newline /\>    \<br /\>\
>     \<green\>\<!-- a br element will be created. --\>\</green\>\
> \<newline /\>    \</xsl:otherwise\>\
> \<newline /\>    \</xsl:choose\>\
> \<newline /\>    \<xsl:apply-templates /\>\
> \<newline /\>  \</xsl:template\>\
> \</example\>\
> \</keyword\>\
> \
> \
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='xsl:pi'\>**xsl:pi\
> \<def\>\
> \<newline /\>\<red\>NOTE: This element may have non-standard behavior in MSIE 5.X!\
> \</red\>\
> \<newline /\>The \<red\>xsl:pi\</red\> element generates a processing instruction\
> (PI) in the output. The \<red\>name\</red\> is indicated by the name attribute.\
> The \<red\>content\</red\> of the element provides the rest of the PI.\
> \</def\>\
> \<example\>\
> \<newline /\>\<green\>\<!-- \</green\>\
> \<newline /\>\<green\>This example shows a template that \</green\>\<red\>generates the XML declaration\</red\> \<green\>and a\
> style sheet processing instruction in the output.\</green\>\
> \<newline /\>\<green\>--\>\</green\>\<newline /\>\
> \<newline /\> \<xsl:template match='/'\>\
> \<newline /\>    \<xsl:pi name='xml'\>version='1.0' standalone='yes'\</xsl:pi\>\
> \<newline /\>     \<xsl:pi name='xml-stylesheet'\>type='text/xsl' href='style.xsl'\</xsl:pi\>\
> \<newline /\>     \<xsl:apply-templates /\>\
> \<newline /\> \</xsl:template\>\
> \</example\>\
> \</keyword\>\
> \
> \
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='xsl:script'\>**xsl:script\
> \<def\>\
> \<newline /\>\<red\>NOTE: This element may have non-standard behavior in MSIE 5.X!\
> \</red\>\
> \<newline /\>Within the \<red\>xsl:script\</red\> element,\
> declare variables and define functions. This can\
> appear within the \<red\>xsl:stylesheet\</red\> or \<red\>xsl:template\</red\> elements.\
> A script block thus nested is treated as a global script block.\
> \<newline /\>\
> In Internet Explorer version 5.01+, you can also instantiate\
> COM objects in the \<red\>xsl:script\</red\> element.\
> \<newline /\>\
> However, a user's security settings may prevent the script\
> from instantiating a client-side object.\
> \</def\>\
> \<example\>\
> \<newline /\>\<green\>\<!--\</green\>\
> \<newline /\>\<green\>Demonstrates a call to a user-defined routine in VBScript, called Celsius.\</green\>\
> \<newline /\>\<green\>This example is also seen in \</green\>\<red\>xsl:eval\</red\>.\
> \<newline /\>\<green\>--\>\</green\>\
> \<newline /\> \<xsl:stylesheet \<red\>language='VBScript'\</red\> xmlns:xsl='http://www.w3.org/TR/WD-xsl'\>\
> \<newline /\>\<newline /\>  \<xsl:template match='/'\>\
> \<newline /\>   \<xsl:eval\>\<red\>Celsius(32)\</red\>\</xsl:eval\>\
> \<newline /\>  \</xsl:template\>\<newline /\>\
> \
> \<newline /\>    \<xsl:script language='VBScript'\>\
> \<newline /\>\<newline /\>\<red\>      Function Celsius(fDegrees)\</red\>\
> \<newline /\>\<red\>      Celsius = (fDegrees - 32) \* 5 / 9\</red\>\
> \<newline /\>\<red\>      End Function\</red\>\
> \<newline /\>\<newline /\>   \</xsl:script\>\<newline /\>\
> \<newline /\> \</xsl:stylesheet\>\
> \</example\>\
> \</keyword\>\
> \
> \
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='xsl:stylesheet'\>**xsl:stylesheet\
> \<def\>\
> \<newline /\>\<red\>NOTE: This element may have non-standard behavior in MSIE 5.X!\
> \</red\>\
> \<newline /\>An XSL style sheet contains the xsl:stylesheet element.\
> This element can have a set of \<red\>xsl:template\</red\> elements representing\
> different output templates. Processing begins by processing the\
> root template, indicated by the pattern '/'.\<newline /\>\
> \<newline /\>  \<xsl:stylesheet\
> \<newline /\>    version='1.0'\
> \<newline /\>    default-space='preserve'\
> \<newline /\>    indent-result='yes'\
> \<newline /\>    language='language-name'\
> \<newline /\>    result-ns='value'\>\
> \<newline /\>        \[CONTENT...\]\
> \<newline /\>  \</xsl:stylesheet\>\
> \
> \<newline /\>\<newline /\>ATTRIBUTES:\
> \<newline /\>  \<red\>version\</red\>\
> \<newline /\>    \<red\>Required!\</red\>.\
> Indicates version of XSLT style sheet requires.\
> \<newline /\>    Value should be set to 1.0 for this version of XSLT.\
> \<newline /\>  \<red\>default-space\</red\>\
> \<newline /\>    Whether to preserve white space\
> that appears in the source document.\
> \<newline /\>    \<red\>Only the value of 'default'\
> is supported;\</red\> other values are ignored.\
> \<newline /\>  \<red\>indent-result\</red\>\
> \<newline /\>    Whether to preserve\
> any white space that appears in style sheet, in result tree.\
> \<newline /\>    The actual white-space characters themselves can be changed.\
> \<newline /\>    \<red\>Only the value 'yes' is supported; other values are ignored.\</red\>\
> \<newline /\>  \<red\>language\</red\>\
> \<newline /\>    Active Scripting language is used\
> within this style sheet. \<newline /\>    The \<red\>default is 'JScript'\</red\> (ECMAScript).\
> \<newline /\>    Accepts same values as 'language' attribute in\
> HTML 'SCRIPT' element.\
> \<newline /\>  \<red\>result-ns\</red\>\
> \<newline /\>    Indicator of what the output of the\
> XSL processor is. \<newline /\>    \<red\>In MSIE 5+\</red\>,\
> all output is XML, including HTML, \<red\>thus this attribute is ignored\</red\>.\
> \<newline /\>\
> \</def\>\
> \<example\>\
> \<newline /\>\<green\>\<!--\</green\>\
> \<newline /\>   \<green\>Complete XSL style sheet containing a set of templates.\</green\>\
> \<newline /\>\<green\>--\>\</green\>\<newline /\>\
> \<newline /\>\<?xml version='1.0'?\>\
> \<newline /\> \<xsl:stylesheet xmlns:xsl='http://www.w3.org/tr/wd-xsl'\>\
> \<newline /\>\
> \<newline /\>   \<xsl:template \<red\>match='/'\</red\>\>\
> \<newline /\>      \<html\>\
> \<newline /\>       \<body\>\
> \<newline /\>        \<table\>\
> \<newline /\>         \<xsl:for-each select='customers/customer'\>\
> \<newline /\>           \<tr\>\
> \<newline /\>           \<xsl:apply-templates select='name' /\>\
> \<newline /\>           \<xsl:apply-templates select='address' /\>\
> \<newline /\>           \<xsl:apply-templates select='phone' /\>\
> \<newline /\>           \</tr\>\
> \<newline /\>         \</xsl:for-each\>\
> \<newline /\>        \</table\>\
> \<newline /\>       \</body\>\
> \<newline /\>      \</html\>\
> \<newline /\>   \</xsl:template\>\
> \<newline /\>\
> \<newline /\>   \<xsl:template \<red\>match='name'\</red\>\>\
> \<newline /\>     \<td style='font-size:14pt font-family:serif'\>\
> \<newline /\>       \<xsl:apply-templates /\>\
> \<newline /\>     \</td\>\
> \<newline /\>   \</xsl:template\>\
> \<newline /\>\
> \<newline /\>   \<xsl:template \<red\>match='address'\</red\>\>\
> \<newline /\>     \<td\>\
> \<newline /\>       \<xsl:apply-templates /\>\
> \<newline /\>     \</td\>\
> \<newline /\>   \</xsl:template\>\
> \<newline /\>\
> \<newline /\>   \<xsl:template \<red\>match='phone'\</red\>\>\
> \<newline /\>     \<td\>\
> \<newline /\>       \<xsl:apply-templates /\> \</td\>\
> \<newline /\>     \</xsl:template\>\
> \<newline /\>\
> \<newline /\>   \<xsl:template \<red\>match='text()'\</red\>\>\
> \<newline /\> \<green\>\<!-- This is a default rule... --\>\</green\>\
> \<newline /\>     \<xsl:value-of /\>\
> \<newline /\>   \</xsl:template\>\
> \<newline /\>\
> \<newline /\> \</xsl:stylesheet\>\
> \</example\>\
> \</keyword\>\
> \
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='xsl:template'\>**xsl:template\
> \<def\>\
> \<newline /\>\<red\>NOTE: This element may have non-standard behavior in MSIE 5.X!\
> \</red\>\
> \<newline /\>The \<red\>xsl:template\</red\> element defines the desired output for nodes of a particular type and context.\
> \<red\>Parent\</red\> elements: xsl:apply-templates, xsl:stylesheet\
> \<red\>Child\</red\> elements: xsl:apply-templates, xsl:attribute, xsl:choose, xsl:comment, xsl:copy, xsl:element, xsl:eval, xsl:for-each, xsl:if, xsl:pi, xsl:value-of, output elements\
> \<newline /\>The '\<red\>match\</red\>' attribute of the \<red\>xsl:template\</red\> element\
> defines the 'context' for which the template should be executed.\
> \<newline /\>This attribute can be used to change the context of the source\
> document, and provides a convenient way to navigate down into\
> the document tree.\
> \<newline /\>The default is \<red\>'node() \| / \| @\*'\</red\>, to match all nodes.\
> \</def\>\
> \<example\>\
> \<newline /\>\<green\>\<!--\</green\>\
> \<newline /\>\<green\>The example template below has a pattern that\
> identifies elements of type\</green\> \<bold\>'stock'\</bold\> \<green\>and produces an output\
> \</green\>\<red\>div element \</red\>\<green\>with the attribute\</green\> \<bold\>style='font-weight:bold'\</bold\>.\
> \<newline /\>\<green\>--\>\</green\>\<newline /\>\
> \<newline /\> \<xsl:template match='\<bold\>stock\</bold\>'\>\
> \<newline /\>   \<\<red\>div\</red\> style='font-weight:bold'\>\
> \<newline /\>      Symbol: \<xsl:value-of match='symbol' /\>\
> \<newline /\>      Price: \<xsl:value-of match='price' /\>\
> \<newline /\>   \<\<red\>/div\</red\>\>\
> \<newline /\> \</xsl:template\>\
> \</example\>\
> \</keyword\>\
> \
> \
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='xsl:value-of'\>**xsl:value-of\
> \<def\>\
> \<newline /\>The \<red\>xsl:value-of\</red\> element default is:\
> \<newline /\>      \<red\>'node() \| / \| @\*'\</red\>, to match all nodes.\
> \<newline /\>\<newline /\>\<red\>NOTE: This element may have non-standard behavior in MSIE 5.X!\
> \</red\>\
> \<newline /\>\
> \</def\>\
> \<example\>\
> \<newline /\>\<green\>\<!--\</green\>\
> \<newline /\>\<green\>The\</green\> \<bold\>xsl:value-of element\</bold\> \<green\>inserts a text string\
> representing the value of the first element (in document order)\
> specified by the select attribute.\</green\>\
> \<newline /\>\<green\>If the XSL pattern returns more than a single node,\
> the xsl:value-of element returns the text of the first node\
> returned. \</green\>\
> \<newline /\>\<green\>If the node returned is an element with substructure,\
> xsl:value-of returns the concatenated text nodes of that\
> element's subtree with the markup removed.\</green\>\
> \<newline /\>\<green\>--\>\</green\>\<newline /\>\
> \<newline /\>\<green\>\<!--\</green\> \<bold\>Syntax:\</bold\> \<green\>(Also see \</green\>\<red\>XSL Pattern Syntax\</red\> \<green\>in this glossary and tutorial.) --\>\</green\>\
> \<newline /\>   \<bold\>\<xsl:value-of select='pattern' /\>\</bold\>\
> \<newline /\>\<newline /\>\<green\>\<!-- Outputs the string value of the current node --\>\</green\>\
> \<newline /\>   \<xsl:value-of \<red\>select='.'\</red\> /\>\
> \<newline /\>\<newline /\>\<green\>\<!-- Outputs the string value of the first child element, in this case, address --\>\</green\>\
> \<newline /\>   \<xsl:value-of \<red\>select='address\</red\>' /\>\
> \<newline /\>\<newline /\>\<green\>\<!-- Outputs the (converted-to-a-string) value\
> of the sum of the values of the attributes of the current node,\
> assuming they are all numeric values. \</green\>\
> \<newline /\>\<green\>If any are non-numeric attributes, the result will be: '\</green\>\
> \<red\> NaN \</red\>\<green\>', ('Not A Number').\</green\>\
> \<newline /\>\<green\> --\>\</green\>\
> \<newline /\>   \<xsl:value-of \<red\>select='sum(@\*)'\</red\> /\>\
> \<newline /\>\<newline /\>\<green\>\<!-- Outputs the value of variable \$x after converting to a string. --\>\</green\>\
> \<newline /\>   \<xsl:value-of \<red\>select='\$x'\</red\> /\>\
> \</example\>\
> \</keyword\>\
> \
> \
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='xsl:when'\>**xsl:when\
> \<def\>\
> \<newline /\>The \<red\>xsl:when\</red\> element Provides multiple\
> conditional testing in conjunction with the \<red\>xsl:choose\</red\> and\
> \<red\>xsl:otherwise\</red\> elements.\
> \<newline /\>\<newline /\>\<red\>NOTE: This element may have non-standard behavior in MSIE 5.X!\
> \</red\>\
> \<newline /\>\<newline /\>\<green\>\<!-- Attributes --\>\</green\>\
> \<newline /\>\<bold\>expr\</bold\>\
> \<newline /\>    Script expression evaluating to a \<red\>Boolean\</red\>.\
> If this expression returns \<red\>TRUE\</red\>, and the test pattern succeeds, the contents of\
> \<red\>xsl:when\</red\> are placed in the output.\
> \<newline /\>If one of these tests fails, the next\
> \<red\>xsl:when\</red\> or \<red\>xsl:otherwise\</red\>\
> in the \<red\>xsl:choose\</red\> block is tested.\
> \<newline /\>\<newline /\>\<bold\>language\</bold\>\
> \<newline /\>    \<red\>Scripting\</red\> language used for the expression in the expr attribute.\
> If left \<red\>unspecified\</red\>, the current scripting language is used, as specified by a language attribute on an ancestor.\
> \<red\>JScript\</red\>is used by default if no such attribute exists.\
> \<newline /\>Accepts same values as 'language' attribute on the HTML 'SCRIPT' element.\
> \<newline /\>\<newline /\>\<bold\>test\</bold\>\
> \
> \<newline /\>    \<red\>XSL pattern\</red\> to be tested against the current context.\
> \<newline /\>The \<red\>default\</red\> value is \<red\>'.'\</red\>, which indicates evaluation of the current node and thus is always true.\
> \
> \<newline /\>\
> \
> \</def\>\
> \<example\>\
> \<newline /\>\<newline /\>\<green\>\<!-- Syntax --\>\</green\>\
> \<newline /\> \<xsl:when\
> \<newline /\>     expr='script-expression'\
> \<newline /\>     language='language-name'\
> \<newline /\>     test='pattern'\>\
>    \<green\>\<!-- See\</green\> \<red\>XSL Pattern Syntax\</red\>\<green\>. --\>\</green\>\
> \<newline /\> \</xsl:when\>\<newline /\>\
> \</example\>\
> \<example\>\
> \<newline /\>\<newline /\>\<green\>\<!--\</green\>\
> \<newline /\>   \<green\>This example shows a template for '\</green\>\
> \<bold\>order\</bold\>\<green\>' elements, and inserts an \<hr /\> or \<br /\> before the order's contents\
> based on the order's '\</green\>\<red\>total\</red\>\<green\>' element value.\</green\>\
> \
> \<newline /\>--\>\
> \<newline /\>  \<xsl:template match='\<bold\>order\</bold\>'\>\
> \<newline /\>\
> \<newline /\>    \<xsl:choose\>\
> \<newline /\>\
> \<newline /\>    \<xsl:when test='\<red\>total\</red\>\[. \$lt\$ 10\]'\>\
>     \<green\>\<!-- If the total is less than 10, --\>\</green\>\
> \<newline /\>       \<hr style='color:black' /\>\
>     \<green\>\<!-- a black HR will be generated. --\>\</green\>\
> \<newline /\>    \</xsl:when\>\
> \<newline /\>\
> \<newline /\>    \<xsl:when test='\<red\>total\</red\>\[. \$lt\$ 20\]'\>\
>     \<green\>\<!-- If the total is less than 20, --\>\</green\>\
> \<newline /\>       \<hr style='color:red' /\>\
>     \<green\>\<!-- a red HR will be generated. --\>\</green\>\
> \<newline /\>    \</xsl:when\>\
> \<newline /\>\
> \<newline /\>    \<xsl:otherwise\>\
>     \<green\>\<!-- Otherwise, --\>\</green\>\
> \<newline /\>       \<br /\>\
>     \<green\>\<!-- a br element will be created. --\>\</green\>\
> \<newline /\>    \</xsl:otherwise\>\
> \<newline /\>\
> \<newline /\>    \</xsl:choose\>\
> \<newline /\>\
> \<newline /\>    \<xsl:apply-templates /\>\
> \<newline /\>  \</xsl:template\>\
> \</example\>\
> \</keyword\>\
> \
> \<!-- \*\*\*\*\*\*\*\*\*\* END KEYWORDS in Glossary beginning with xsl: \*\*\*\*\*\*\*\*\*\* --\>\
> \
> \
> \
> \
> \
> \
> \<!-- \~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~~XSLT Data Types\~\~\~\~\~\~~ --\>\
> \<!-- ! --\>\
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='XSLT Data Types'\>**XSLT Data Types\
> \<def\>\
> \<newline /\>\<red\>Variables and parameters\</red\> take whatever type of value is assigned to them. However, once a value is given to a variable, it cannot be changed! There are no assignment statements in XSLT, but certain XSLT engines have extensions which make this feasible. Without the extensions, it is necessary to use recursive programming techniques.\
> \<newline /\>\
> \</def\>\
> \<example\>\
> \<newline /\>\<newline /\>\<green\>\<!-- Data types defined in XSLT and XPATH are: --\>\</green\>\
> \<newline /\> \<red\>String\</red\> (Any sequence of Unicode)\
> \<newline /\> \<red\>Number\</red\> (Double-precision floating point)\
> \<newline /\> \<red\>Boolean\</red\> (true or false)\
> \<newline /\> \<red\>Node-set\</red\> (A set of nodes in the source tree)\
> \<newline /\> \<red\>Tree\</red\> (A data structure called a Result Tree Fragment)\
> \<newline /\> \<red\>External Object\</red\> (A Java object for example)\<newline /\>\
> \</example\>\
> \</keyword\>\
> \
> \<!-- \~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~~XSLT Elements\~\~\~\~\~\~~ --\>\
> \<!-- AT LEAST 500 LINES!!! --\>\
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='XSLT Elements'\>**XSLT Elements\
> \<def\>\
> \<newline /\>\<red\>Overview\</red\>\
> \<newline /\>\<newline /\>\
> \<green\>\<!-- See each element in Glossary for syntax and examples. --\>\</green\>\
> \
> \<newline /\>\<newline /\>\<green\>\<!-- Defining and invoking template rules --\>\</green\>\
> \<newline /\>  \<red\>\<xsl:template\>\</red\>\
> \<newline /\>  \<red\>\<xsl:apply-templates\>\</red\>\
> \<newline /\>  \<red\>\<xsl:call-template\>\</red\>\
> \
> \<newline /\>\<newline /\>\<green\>\<!-- Defining the structure of the stylesheet --\>\</green\>\
> \<newline /\>  \<red\>\<xsl:stylesheet\>\</red\>\
> \<newline /\>  \<red\>\<xsl:include\>\</red\>\
> \<newline /\>  \<red\>\<xsl:import\>\</red\>\
> \
> \<newline /\>\<newline /\>\<green\>\<!-- Defining variables and parameters --\>\</green\>\
> \<newline /\>  \<red\>\<xsl:variable\>\</red\>\
> \<newline /\>  \<red\>\<xsl:param\>\</red\>\
> \<newline /\>  \<red\>\<xsl:with-param\>\</red\>\
> \
> \<newline /\>\<newline /\>\<green\>\<!-- Elements used to copy information from source to result --\>\</green\>\
> \<newline /\>  \<red\>\<xsl:copy\>\</red\>\
> \<newline /\>  \<red\>\<xsl:copy-of\>\</red\>\
> \
> \<newline /\>\<newline /\>\<green\>\<!-- Elements used for conditional processing / iteration --\>\</green\>\
> \<newline /\>  \<red\>\<xsl:if\>\</red\>\
> \<newline /\>  \<red\>\<xsl:choose\>\</red\>\
> \<newline /\>  \<red\>\<xsl:when\>\</red\>\
> \<newline /\>  \<red\>\<xsl:otherwise\>\</red\>\
> \<newline /\>  \<red\>\<xsl:for-each\>\</red\>\
> \
> \<newline /\>\<newline /\>\<green\>\<!-- Elements used to control sorting and numbering --\>\</green\>\
> \<newline /\>  \<red\>\<xsl:sort\>\</red\>\
> \<newline /\>  \<red\>\<xsl:number\>\</red\>\
> \
> \<newline /\>\<newline /\>\<green\>\<!-- Elements used to control final output format --\>\</green\>\
> \<newline /\>  \<red\>\<xsl:output\>\</red\>\
> \
> \<newline /\>\<newline /\>\<green\>\<!-- Misc. other XSLT Elements --\>\</green\>\
> \<newline /\>  \<red\>\<xsl:apply-imports\>\</red\>\
> \<newline /\>  \<red\>\<xsl:attribute\>\</red\>\
> \<newline /\>  \<red\>\<xsl:attribute-set\>\</red\>\
> \<newline /\>  \<red\>\<xsl:call-template \>\</red\>\
> \<newline /\>  \<red\>\<xsl:comment\>\</red\>\
> \<newline /\>  \<red\>\<xsl:decimal-format\>\</red\>\
> \<newline /\>  \<red\>\<xsl:element\>\</red\>\
> \<newline /\>  \<red\>\<xsl:fallback\>\</red\>\
> \<newline /\>  \<red\>\<xsl:key\>\</red\>\
> \<newline /\>  \<red\>\<xsl:message\>\</red\>\
> \<newline /\>  \<red\>\<xsl:namespace-alias\>\</red\>\
> \<newline /\>  \<red\>\<xsl:preserve-space\>\</red\>\
> \<newline /\>  \<red\>\<xsl:processing-instruction\>\</red\>\
> \<newline /\>  \<red\>\<xsl:strip-space\>\</red\>\
> \<newline /\>  \<red\>\<xsl:text\>\</red\>\
> \<newline /\>  \<red\>\<xsl:transform \>\</red\>\
> \<newline /\>  \<red\>\<xsl:value-of \>\</red\>\
> \<newline /\>\
> \</def\>\
> \
> \<example\>\
> \<newline /\> \
> \</example\>\
> \</keyword\>\
> \
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='XSLT Expressions'\>**XSLT Expressions\
> \
> \<def\>\
> \<newline /\>\
> These are used to select data from the source document and to manipulate it to generate data to go in the result document.\
> They are the \<red\>SELECT statements\</red\> for structured documents, allowing specific portions of the whole to be selected for transformation.\
> \<red\>XPATH expressions\</red\> can include standard function calls.\
> \
> \<newline /\>\<bold\> AbbreviatedAbsoluteLocationPath\</bold\>\
> \<newline /\>\<bold\> AbbreviatedAxisSpecifier\</bold\>\
> \<newline /\>\<bold\> AbbreviatedRelativeLocationPath\</bold\>\
> \<newline /\>\<bold\> AbbreviatedStep\</bold\>\
> \<newline /\>\<bold\> AbsoluteLocationPath\</bold\>\
> \<newline /\>\<bold\> AdditiveExpr\</bold\>\
> \<newline /\>\<bold\> AndExpr\</bold\>\
> \<newline /\>\<bold\> Argument\</bold\>\
> \<newline /\>\<bold\> AxisName\</bold\>\
> \<newline /\>\<bold\> AxisSpecifier\</bold\>\
> \<newline /\>\<bold\> Digits\</bold\>\
> \<newline /\>\<bold\> EqualityExpr\</bold\>\
> \<newline /\>\<bold\> Expr\</bold\>\
> \<newline /\>\<bold\> ExprToken\</bold\>\
> \<newline /\>\<bold\> ExprWhitespace\</bold\>\
> \<newline /\>\<bold\> FilterExpr\</bold\>\
> \<newline /\>\<bold\> FunctionCall\</bold\>\
> \<newline /\>\<bold\> FunctionName\</bold\>\
> \<newline /\>\<bold\> Literal\</bold\>\
> \<newline /\>\<bold\> LocationPath\</bold\>\
> \<newline /\>\<bold\> MultiplicativeExpr\</bold\>\
> \<newline /\>\<bold\> MultiplyOperator\</bold\>\
> \<newline /\>\<bold\> NameTest\</bold\>\
> \<newline /\>\<bold\> NCName / NCNameChar\</bold\>\
> \<newline /\>\<bold\> NodeTest\</bold\>\
> \<newline /\>\<bold\> NodeType\</bold\>\
> \<newline /\>\<bold\> Number\</bold\>\
> \<newline /\>\<bold\> Operator\</bold\>\
> \<newline /\>\<bold\> OperatorName\</bold\>\
> \<newline /\>\<bold\> OrExpr\</bold\>\
> \<newline /\>\<bold\> PathExpr\</bold\>\
> \<newline /\>\<bold\> Predicate\</bold\>\
> \<newline /\>\<bold\> PredicateExpr\</bold\>\
> \<newline /\>\<bold\> PrimaryExpr\</bold\>\
> \<newline /\>\<bold\> Qname\</bold\>\
> \<newline /\>\<bold\> RelationalExpr\</bold\>\
> \<newline /\>\<bold\> RelativeLocationPath\</bold\>\
> \<newline /\>\<bold\> Step\</bold\>\
> \<newline /\>\<bold\> UnaryExpr\</bold\>\
> \<newline /\>\<bold\> UnionExpr\</bold\>\
> \<newline /\>\<bold\> VariableReference\</bold\>\
> \</def\>\
> \
> \<example\>\
> \<newline /\>\
> \<newline /\> \<green\>\<!-- There will be examples added as time of development allows. --\>\</green\>\
> \<newline /\>\
> \</example\>\
> \
> \</keyword\>\
> \
> \
> \
> \
> \<!-- \~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~~XSLT Pattern Syntax\~\~\~\~\~\~\~~ --\>\
> \<!-- AT LEAST 500 LINES!!! --\>\
> \<!-- Begin new KEYWORD --\> \<!-- May Split this out!!! --\>\
> **\<keyword name='XSLT Pattern Syntax'\>**XSLT Pattern Syntax\
> \<def\>\
> \
> \<newline /\>\<newline /\>\<bold\>XSLT Patterns\</bold\>\
> provide a simple query language for identifying nodes in an\
> XML document, based on their type, name, and values,\
> as well as the relationship of the node to other nodes\
> in the document.\
> \<newline /\>The query\
> 'find \<red\>'author'\</red\> elements that have a \<red\>'period'\</red\>\
> attribute with\
> the value \<red\>'classical'\</red\>, and that are contained in the\
> \<red\>'authors'\</red\> element at the \<red\>document root\</red\>'\
> can be expressed as an XSL Pattern of the form\
> \<newline /\>\<newline /\>    \<red\>'/authors/author\[@period='classical'\]'\</red\>.\
> \<newline /\>\<newline /\>\<bold\>XSL Pattern Operators\</bold\>\
> \<newline /\>\
> \<newline /\>The '\<red\>/\</red\>' \<bold\>Child\</bold\> operator; selects \<bold\>immediate children\</bold\> of the left-side collection. When this path operator appears at the start of the pattern, it indicates that children should be selected from the root node.\<newline /\>\
> \<newline /\>The '\<red\>//\</red\>' means \<bold\>Recursive descent\</bold\>; searches for the \<bold\>specified element at any depth\</bold\>. When this path operator appears at the start of the pattern, it indicates recursive descent from the root node. \<newline /\>\
> \<newline /\>The '\<red\>.\</red\>' indicates the \<bold\>current context\</bold\>. \<newline /\>\
> \<newline /\>The '\<red\>\*\</red\>' is the \<bold\>Wildcard\</bold\>; selects all elements regardless of the element name. \<newline /\>\
> \<newline /\>The '\<red\>@\</red\>' means an \<bold\>Attribute\</bold\>; it's a prefix for an attribute name. \<newline /\>\
> \<newline /\>The '\<red\>@\*\</red\>' is the \<bold\>Attribute Wildcard\</bold\>; selects all attributes regardless of name. \<newline /\>\
> \<newline /\>The '\<red\>:\</red\>' is the \<bold\>Namespace separator\</bold\>; separates the namespace prefix from the element or attribute name. \<newline /\>\
> \<newline /\>The '\<red\>! \*\</red\>' applies the specified method to the \<bold\>reference node\</bold\>. \<newline /\>\
> \<newline /\>The '\<red\>( ) \*\</red\>' groups operations to explicitly \<bold\>establish precedence\</bold\>. \<newline /\>\
> \<newline /\>The '\<red\>\[ \]\</red\>' applies a \<bold\>filter pattern\</bold\>. \<newline /\>\
> \<newline /\>The '\<red\>\[ \] \*\</red\>' is the \<bold\>Subscript\</bold\> operator. Used for \<bold\>indexing within a collection\</bold\>. \<newline /\>\
> \
> \<newline /\>\<newline /\>\<bold\>XSL Boolean, Comparison, and Set Expressions\</bold\>\
> \<newline /\>Filter patterns can contain Boolean expressions,\
> comparison expressions, and set expressions.\
> Shortcuts listed here represent alternative symbols that are\
> also provided in the XSL implementation.\
> \
> \<newline /\>\
> \<newline /\>\<red\>not()\</red\>\|\<red\>\$not\$\</red\>, is the \<red\>Negation\</red\> operator\
> \<newline /\>  \<red\>=\</red\>  \| \<red\>\$eq\$\</red\>, is the \<red\>Equality\</red\> operator\
> \<newline /\>           \<red\>\$ieq\$\</red\>, is the \<bold\>Case-insensitive equality\</bold\> operator\
> \<newline /\> \<red\>!=\</red\>  \| \<red\>\$ne\$\</red\>, is the \<red\>Not equal\</red\> operator\
> \<newline /\>           \<red\>\$ine\$\</red\>, is the \<bold\>Case-insensitive inequality\</bold\> operator\
> \<newline /\> \<red\>\<\</red\>    \| \<red\>\$lt\$\</red\>, is the \<red\>Less than\</red\> operator\
> \<newline /\>           \<red\>\$ilt\$\</red\>, is the \<bold\>Case-insensitive less than\</bold\> operator\
> \<newline /\> \<red\>\<=\</red\> \| \<red\>\$le\$\</red\>, is the \<red\>Less than or equal\</red\> operator\
> \<newline /\>           \<red\>\$ile\$\</red\>, is the \<bold\>Case-insensitive less than or equal\</bold\> operator\
> \<newline /\> \<red\>\>\</red\>   \| \<red\>\$gt\$\</red\>, is the \<red\>Greater than\</red\> operator\
> \<newline /\>           \<red\>\$igt\$\</red\>, is the \<bold\>Case-insensitive greater than\</bold\> operator\
> \<newline /\> \<red\>\>=\</red\> \| \<red\>\$ge\$\</red\>, is the \<red\>Greater than or equal\</red\> operator\
> \<newline /\>           \<red\>\$ige\$\</red\>, is the \<bold\>Case-insensitive greater than or equal\</bold\> operator\
> \<newline /\>  \<red\>\|\</red\>   \| \<red\>\$\$\</red\>, is the \<bold\>Set\</bold\> operator returns the \<bold\>union of two sets of nodes\</bold\>\
> \<newline /\>           \<red\>\$all\$\</red\>, is the \<bold\>Set\</bold\> operator, returning TRUE if condition is true\
> \<newline /\>           (for ALL items in collection)\
> \<newline /\>           \<red\>\$any\$\</red\>, is the \<bold\>Set\</bold\> operator, returning TRUE if condition is true\
> \<newline /\>           (for ANY items in collection)\
> \<newline /\>\
> \</def\>\
> \
> \<example\>\
> \<newline /\>\
> \<newline /\> \<green\>\<!-- There will be examples added as time of development allows. --\>\</green\>\
> \<newline /\>\
> \</example\>\
> \
> \
> \</keyword\>\
> \
> \<!-- \~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~~XSLT Pattern Examples\~\~\~\~\~\~\~~ --\>\
> \<!-- AT LEAST 450 LINES!!! --\>\
> \<!-- Begin new KEYWORD --\> \<!-- May Split this out!!! --\>\
> **\<keyword name='XSLT Pattern Examples'\>**XSLT Pattern Examples\
> \<def\>\
> \
> \<newline /\>\<newline /\>\<red\>XSLT Pattern Examples\</red\>\
> \
> \<newline /\>See XSLT Pattern Syntax for rules, operators and syntax.\
> \
> \</def\>\
> \
> \<example\>\
> \<newline /\>\
> \<newline /\> Find all fnord elements within the current context:\
> \<newline /\>  \<red\>./fnord\</red\> (equivalent to: fnord)\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all first.name elements:\
> \<newline /\>  \<red\>first.name\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find the root element (dobedoc) of this document:\
> \<newline /\>  \<red\>/dobedoc\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all fnord elements anywhere within the current document:\
> \<newline /\>  \<red\>//fnord\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all weirdnessess where the value of the specialty attribute is equal to 'textweirdnesss':\
> \<newline /\>  \<red\>/weirdnesses\[@specialty = 'textweirdnesss'\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all weirdnesss where the value of the style attribute on the weirdness is equal to the value of the specialty attribute of the weirdnesses element at the root of the document:\
> \<newline /\>  \<red\>weirdness\[/weirdnesses/@specialty = @style\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all copybook_source elements within an fnord element.\
> \<newline /\>  Note that the fnord children of the current context are found, and then copybook_source children are found relative to the context of the fnord elements.\
> \<newline /\>  \<red\>fnord/copybook_source\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all thingie elements, one or more levels deep in the weirdnesses (arbitrary descendants):\
> \<newline /\>  \<red\>weirdnesses//thingie\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Note that this is different from the following pattern, which finds all thingie elements that are grandchildren of weirdnesses elements:\
> \<newline /\>  \<red\>weirdnesses/\*/thingie\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find emph elements anywhere inside weirdness excerpts, anywhere inside the weirdnesses:\
> \<newline /\>  \<red\>weirdnesses//weirdness/widget//emph\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all thingies, one or more levels deep in the current context. Note that this situation is \<red\>essentially the only one where the period notation is required\</red\>:\
> \<newline /\>  \<red\>.//thingie\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all element children of fnord elements:\
> \<newline /\>  \<red\>fnord/\*\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all aliass that are grandchildren of weirdnesss:\
> \<newline /\>  \<red\>weirdness/\*/alias\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find the grandchildren elements of the current context:\
> \<newline /\>  \<red\>\*/\*\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find the weirdness element from the 'my' namespace:\
> \<newline /\>  \<red\>my:weirdness\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all elements from the 'myNS' namespace:\
> \<newline /\>  \<red\>myNS:\*\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all elements with the 'Farm_Out' attribute. Note that this example uses filters and attributes.\
> \<newline /\>  \<red\>\*\[@Farm_Out\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find the style attribute of the current element context:\
> \<newline /\>  \<red\>@style\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find the snafu attribute on worth elements within the current context:\
> \<newline /\>  \<red\>worth/@snafu\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> The following example is \<red\>NOT VALID\</red\>!:\
> \<newline /\>  \<red\>worth/@snafu/total\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all weirdnesss with style attributes:\
> \<newline /\>  \<red\>weirdness\[@style\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find the style attribute for all weirdness elements:\
> \<newline /\>  \<red\>weirdness/@style\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all attributes of the current element context:\
> \<newline /\>  \<red\>@\*\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all attributes from the 'my' namespace.\
> \<newline /\> This does not include unqualified attributes on elements from the 'my' namespace:\
> \<newline /\>  \<red\>@my:\*\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all copybook_source elements.\
> \<newline /\>  \<red\>./copybook_source (equivalentto copybook_source\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all unqualified weirdness elements:\
> \<newline /\>  \<red\>weirdness\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Finds the first fnord element:\
> \<newline /\>  \<red\>fnord\[0\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Finds the third fnord element that has a copybook_source:\
> \<newline /\>  \<red\>fnord\[copybook_source\]\[2\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Note that indexes are relative to the parent:\
> \<newline /\>      \<\<red\>x\</red\>\>\
> \<newline /\>            \<\<red\>y/\</red\>\>\
> \<newline /\>            \<\<red\>y/\</red\>\>\
> \<newline /\>      \<\<red\>/x\</red\>\>\
> \<newline /\>      \<\<red\>x\</red\>\>\
> \<newline /\>            \<\<red\>y/\</red\>\>\
> \<newline /\>            \<\<red\>y/\</red\>\>\
> \<newline /\>      \<\<red\>/x\</red\>\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find the first y from each x:\
> \<newline /\>  \<red\>x/y\[0\]\</red\>\
> \<newline /\>  \<red\>x/y\[index() = 0\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find the first y from the entire set of y elements within x elements:\
> \<newline /\>  \<red\>(x/y)\[0\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find the first y from the first x:\
> \<newline /\>  \<red\>x\[0\]/y\[0\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find the last weirdness:\
> \<newline /\>  \<red\>weirdness\[end()\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find the last fnord for each weirdness:\
> \<newline /\>  \<red\>weirdness/fnord\[end()\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find the last fnord from the entire set of fnords of weirdnesss:\
> \<newline /\>  \<red\>(weirdness/fnord)\[end()\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all weirdnesss that contain at least one widget element:\
> \<newline /\>  \<red\>weirdness\[widget\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all thingies of weirdnesss that contain at least one widget element:\
> \<newline /\>  \<red\>weirdness\[widget\]/thingie\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all fnords of weirdnesss where the weirdness contains at least one widget, and the fnord has at least one excerption:\
> \<newline /\>  \<red\>weirdness\[widget\]/fnord\[excerption\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all weirdnesss that have fnords with at least one excerption:\
> \<newline /\>  \<red\>weirdness\[fnord/excerption\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all weirdnesss that have an widget and a thingie:\
> \<newline /\>  \<red\>weirdness\[widget\]\[thingie\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all fnord elements that contain at least one excerption and one award:\
> \<newline /\>  \<red\>fnord\[excerption and award\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> \
> Find all fnord elements that contain at least one excerption or award and at least one sighting:\
> \<newline /\>  \<red\>fnord\[(excerption or award) and sighting\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all fnord elements that contain at least one excerption element and that contain no sighting elements:\
> \<newline /\>  \<red\>fnord\[excerption and not(sighting)\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all fnord elements that contain sighting elements but do not contain either excerption elements or award elements:\
> \<newline /\>  \<red\>fnord\[not(excerption or award) and sighting\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all fnord elements that contain a alias element with the value Bob:\
> \<newline /\>  \<red\>fnord\[\$any\$ alias = 'Bob'\]\</red\>\
> \<newline /\>  \<red\>fnord\[\$any\$ alias \$eq\$ 'Bob'\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all fnord elements where the first alias is Bob:\
> \<newline /\>  \<red\>fnord\[alias\[0\] = 'Bob'\]\</red\>\
> \<newline /\>  \<red\>fnord\[alias = 'Bob'\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all fnords where the 'from' attribute is not equal to 'Mars':\
> \<newline /\>  \<red\>excerption\[@from != 'Mars'\]\</red\>\
> \<newline /\>  \<red\>excerption\[@from \$ne\$ 'Mars'\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all fnords where the alias is the same as the /guest/alias element (note that this assumes there is only one alias; see Set Operations):\
> \<newline /\>  \<red\>fnord\[alias = /guest/alias\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all fnords whose text is 'Mr. Bob':\
> \<newline /\>  \<red\>fnord\[. = 'Mr. Bob'\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all fnord elements whose alias is 'Bobby' and whose worth is \> 50 (note that this assumes there is only one alias and worth for an fnord;):\
> \
> \<newline /\>  \<red\>fnord\[alias = 'Bobby' and worth \$gt\$ 50\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all fnords whose alias begins with 'M' or greater:\
> \<newline /\>  \<red\>fnord\[alias \$ge\$ 'M'\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> When an fnord can have several aliases in the schema (such as Clemens and Twain), use the following patterns:\
> \<newline /\>  \<red\>fnord\[\$any\$ alias \$ge\$ 'M'\]\</red\>\<newline /\>\
> \<newline /\>  \<red\>fnord\[\$all\$ alias \$ge\$ 'M'\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all fnords whose alias begins with 'M', 'm', or greater:\
> \<newline /\>  \<red\>fnord\[alias \$ige\$ 'M'\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find the first three weirdnesss (0, 1, 2):\
> \<newline /\>  \<red\>weirdness\[index() \$le\$ 2\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all fnord elements where any one of the aliass is Bob:\
> \<newline /\>  \<red\>fnord\[\$any\$ alias = 'Bob'\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all fnord elements where none of the alias elements are Bob:\
> \<newline /\>  \<red\>fnord\[\$all\$ alias != 'Bob'\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all fnord elements containing a copybook_source child whose text is 'Bob' (note that this and following samples assume there is only one copybook_source child for an fnord):\
> \<newline /\>  \<red\>fnord\[copybook_source!value() = 'Bob'\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all fnord elements containing any child element whose text is 'Bob':\
> \<newline /\>  \<red\>fnord\[\*!value() = 'Bob'\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all weirdnesss where the sighting date is before January 1, 1995 (note that these samples assume there is only one sighting date for a weirdness):\
> \<newline /\>  \<red\>weirdnesss\[sighting_date \< date('1995-01-01')\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find all weirdnesss where the sighting date is before the date value stored in the attribute first:\
> \<newline /\>  \<red\>weirdnesss\[sighting_date \< date(@first)\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> These examples are equivalent:\
> \<newline /\>  \<red\>fnord\[alias!value() = 'Bob' and copybook_source!value() = 'Moe'\]\</red\>\<newline /\>\
> \<newline /\>  \<red\>fnord\[alias = 'Bob' and copybook_source = 'Moe'\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> These examples are equivalent:\
> \<newline /\>  \<red\>worth\[@intl!value() = 'foo'\]\</red\>\<newline /\>\
> \<newline /\>  \<red\>worth\[@intl = 'foo'\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find the first 23 excerptions:\
> \<newline /\>  \<red\>excerption\[index() \$lt\$ 23\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find the second text node in each bar element in the current context:\
> \<newline /\>  \<red\>bar/textnode()\[1\]\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find the nearest weirdness ancestor of the current element:\
> \<newline /\>  \<red\>ancestor(weirdness)\</red\>\<newline /\>\
> \</example\>\
> \
> \<example\>\
> \<newline /\> Find the nearest ancestor fnord element that is contained in a weirdness element:\
> \<newline /\>  \<red\>ancestor(weirdness/fnord)\</red\>\<newline /\>\
> \</example\>\
> \
> \</keyword\>\
> \
> \
> \<!-- \~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~~XSLT Variables\~\~\~\~\~\~\~~ --\>\
> \<!-- ! --\>\
> \<!-- Begin new KEYWORD --\>\
> **\<keyword name='XSLT Variables'\>**XSLT Variables\
> \<def\>\
> \<newline /\>XSLT allows \<red\>global variables\</red\>, available throughout the entire stylesheet, and\
> \<newline /\>\<red\>local variables\</red\>, available only within a particular template body.\
> \</def\>\
> \<example\>\
> \<newline /\>\<newline /\>\<!-- \
> This variable, \<red\>global\</red\> if it appears as a child of the \<red\>\<xsl:stylesheet\>\</red\> element, or \<red\>local\</red\> if it appears within the body of an \<red\>\<xsl:template\>\</red\> element, can be referenced in an XPATH expression as \<red\>\$varName\</red\>.\
> The \<\<red\>;xsl:param\>\</red\> element can also be used to declare global parameters, while \<red\>\<xsl:with-param\>\</red\> element is used to declare local parameters.\
>  --\>\
> \<newline /\> \<xsl:variable name='varName' select='varValue' /\>\
> \<newline /\> \<\>\<newline /\>\
> \</example\>\
> \</keyword\>\
> \
> \
> \<!-- Insert additional keywords conforming to the DTD above! --\>\
> \</keywords\>\
> \</glossary\>\
> \</body\>\
> \</dobedoc\>\
> \<!-- End Root Element --\>\

</div>

------------------------------------------------------------------------

<div id="PNA_XMLNXML_XSL_text">

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td class="specialBROWN150" style="text-align: left;" title="This file contains Directions for the parse engine to create an XHTML output document, readable by browsers. It may also contain other text, markup and scripting in addition to parsing and using the XML data from the XML file based on &#39;rules&#39;." width="70%" onmouseover="this.style.color=&#39;green&#39;; this.style.fontSize=&#39;170%&#39;;" onmouseout="this.style.color=&#39;brown&#39;; this.style.fontSize=&#39;160%&#39;;">PNA_XMLNXML_XSL.XSL</td>
<td style="text-align: right;" width="30%"><a href="#PNA_XMLNXML_Start">Back to Start</a><br />
</td>
</tr>
</tbody>
</table>

> **\<xsl:stylesheet xmlns:xsl='http://www.w3.org/TR/WD-xsl'\>**\
> \<!-- New format for Dobe's Punny Name Archive on 12-24-2001 --\>\
> \<!-- Hand-written XHTML, XML, XSLT, CSS and JS suite --\>\
> \<!-- filename: **PNA_XMLNXML_XSL.XSL** --\>\
> \<!--\
> Dobe Doinat's Punny Name Archive\
> MegaloMedia Copyright January 04, 2002\
> John W. Hartman (Dobe Doinat)\
> http://www.eskimo.com/~dobe/\
> mailto://dobe@eskimo.com\
> IDE of choice: XMLWriter, Wattle Software\
> ISP of choice: eskimo.com, Bob is Everywhere!\
> --\>\
> \<!-- ~**use with 'PNA_XMLnXML_XML.xml'**~ --\>\
> \<COMMENT\>The \<COMMENT\> element pair as used in this stylesheet is outside the namespace of XSL.\</COMMENT\>\
> \<COMMENT\> XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\
> It is therefore used to ANNOTATE the stylesheet, rather than COMMENT, the stylesheet.\
> XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\
> \</COMMENT\>\
> **\<xsl:template match='/'\>**\
> **\<html xmlns='http://www.w3.org/1999/xhtml'\>**\
> \<head\>\
> \
> \<script language='Javascript'\>\
> \<!-- You need XSL comments inside SCRIPT elements in an XSLT file! // --\>\
> \<xsl:comment\>\
> \<\![CDATA\[\
> function hiLite()\
> // init values\
> {\
> e = window.event.srcElement;\
> \
> if (e.style.backgroundColor != 'yellow')\
> e.style.backgroundColor = 'yellow';\
> else\
> e.style.backgroundColor = 'white';\
> }\
> // end hiLite()\
> \]\]\>\
> \</xsl:comment\>\
> \</script\>\
> \
> \<title\>XML/XSLT/XPATH Glossary, Definitions, Syntax and Usage\</title\>\
> \<COMMENT\>This is outside of the namespace of the current XSL namespace.\</COMMENT\>\
> \<!-- Call an external CSS stylesheet for mundane output of XHTML, if required... --\>\
> \<!-- link rel='stylesheet' type='text/css' href='PNA_XMLnXML_CSS.css' / --\>\
> \<!-- I'll use an internal CSS format for this project. --\>\
> **\<style type='text/css'\>\
> a:link {color:red; text-decoration:underline; }\
> a:visited {color:red; text-decoration:underline;}\
> a:active {color:brown; text-decoration:none; background:red;}\
> blockquote {font-size:80%; color:brown; margin-left:5%; margin-right:5%;}\
> div.indent10 {font-size:100%; margin-left: 10%;}\
> div.mouseOverInit {font-size:250%; color: brown;}\
> div.noindent {font-size:100%;}\
> div.small_70 {font-size:70%; color:brown;}\
> div.small_80 {font-size:80%; color:brown;}\
> body {font-family:Verdana; background:ghostwhite; margin-left:5%; margin-right:5%;}\
> h1 {font-size:200%; color: brown;}\
> h2 {font-size:150%; color: brown;}\
> h3 {font-size:90%; color: brown; margin-left: 5%;}\
> h3.note {font-size:80%; color: darkbrown; margin-left: 5%;}\
> h3.INTRO {font-size:160%; color: red;}\
> h3.KeyWord {font-size:110%; color: darkbrown;}\
> h4 {font-size:90%; color: red; margin-left: 5%; font-weight:bold;}\
> hr.midHR {width:80%; color: darkbrown; margin-left: 10%;}\
> hr.myHorizontalRuleStyle40 {width:40%; color: black;}\
> hr.myHorizontalRuleStyle60 {width:60%; color: brown;}\
> hr.myHorizontalRuleStyle60Red {width:60%; color: red;}\
> hr.myHorizontalRuleStyle80Red {width:80%; color: red;}\
> hr.myHorizontalRuleStyle80 {width:80%; color: darkbrown;}\
> hr.myHorizontalRuleStyle100 {width:100%; color: brown;}\
> li {font-size:70%; color:darkbrown;}\
> small {font-size:75%; color:darkbrown; font-weight:bold;}\
> span.INTRO {font-size:90%; color: darkbrown; cursor:help;}\
> span.BODYTEXT {font-size:80%; color: darkbrown; margin-left: 5%;}\
> span.EXAMPLE {font-size:80%; color: darkbrown; margin-left: 15%;}\
> span.StartLink {font-size:100%; color: darkbrown;}\
> span.keyword {font-size:300%; color: red;}\
> span.record {font-size:80%; color: darkbrown;}\
> span.links {font-size:60%; color: darkbrown;}\
> span.red {font-size:90%; color: red; font-weight:bold;}\
> span.green {font-size:90%; color: green; font-weight:bold;}\
> span.black {font-size:90%; color: black; font-weight:bold;}\
> span.brown {font-size:90%; color: brown; font-weight:bold;}\
> span.yellow {font-size:90%; color: yellow; font-weight:bold;}\
> span.purple {font-size:90%; color: yellow; font-weight:bold;}\
> span.italic {font-size:90%; color: darkbrown; font-style:italic;}\
> span.bold {font-size:90%; color: darkbrown; font-weight:bold;}\
> td.topics {font-size:70%; color: brown; font-weight:bold;}\
> td.small_70bi {font-size:70%; color: brown; font-style:italic;}\
> ul {margin-left: 5%;}\
> \</style\>**\
> \
> \<!--\
> I can't call an external JavaScript file from an XSL stylesheet.\
> \<script type='text/javascript' src='write_MenuLinks_EN.js'\>\
> --\>\
> \
> \<script language='javascript'\>\
> \<!-- You need XSL comments inside SCRIPT elements in an XSLT file! // --\>\
> \<xsl:comment\>\
> \<\![CDATA\[\
> //\<!-- This is how it is called... --\>\
> //\<!-- div onClick='fillXMLExample()' --\>\
> //\<!-- span id='MenuSection' style='DISPLAY:none' --\>\
> //\<!-- span id='fillElement'\>\</span --\>\
> //\<!-- /span --\>\
> //\<!-- /div --\>\
> \
> function **fillSPANMenuSection()**\
> {\
> if (document.all.MenuSection.style.display == 'block')\
> document.all.MenuSection.style.display = 'none';\
> else\
> {\
> myString = '';\
> myString = myString + '\<div class='small_70' align='center'\>~\<i\>Microsoft Internet Explorer 5.0+ Compliant~\</i\>\<br /\> \< \< \<b\>' + Date() + '\</b\> \> \>\</div\>';\
> myString = myString + '\<div align='center' class='small_80'\>';\
> myString = myString + '\<a title ='Introduction to Punny Name Archive!' href='index.html'\>Home\</a\>   ';\
> myString = myString + '\<a title ='Site Map navigation for the new PNA, using IFrames and some other interesting XHTML.' href='PNASiteMap.htm'\>IFrame View\</a\>   ';\
> myString = myString + '\<a title ='Site Map navigation for the new PNA, in plain XHTML, as a directory of files.' href='PNA_dir.htm'\>File View\</a\>   ';\
> myString = myString + '\<a title ='Site Map navigation, in plain TEXT, displaying the source code of files.' href='PNA_srcTEXT.htm'\>Source Code\</a\>   ';\
> myString = myString + '\<a title ='This resume is rendered in XML, modified by XSLT!' href='JohnWHartman_Resume.xml'\>Resume\</a\>   ';\
> myString = myString + '\<a title ='Punny Name of the Moment!' href='PNAMoment.htm'\>Moment\</a\>   ';\
> myString = myString + '\<a title ='Thanks for everyone who contributed!' href='PNAThanks.htm'\>Thanks!\</a\>   ';\
> myString = myString + '\<a title ='Page Lincoln!' href='PNAExternalLinks.htm'\>Links!\</a\>   ';\
> myString = myString + '\<a title ='WebTut contains some tutorials for Web technologies that I have written, gleaned from many sources and experiments.' href='PNAdobeWebTut.htm'\>WebTut\</a\>   ';\
> myString = myString + '\</div\>';\
> myString = myString + '\<br /\>';\
> \
> //\<!-- id.style.display='none'; --\>\
> document.all.fillElement.innerHTML = myString;\
> }\
> }\
> \]\]\>\
> \</xsl:comment\>\
> \</script\>\
> \
> \</head\>\
> \
> \<!-- //BODY!//BEGIN!//BODY!//BEGIN!//BODY!//BEGIN!//BODY!//BEGIN!//BODY!//BEGIN!// --\>\
> **\<body onLoad='fillSPANMenuSection()'\>**\
> \<div id='\_XMLnXML_Start'\>\
> \
> \<!-- NOT USED --\>\
> \<!-- div onClick='fillXMLExample()' --\>\
> \<!-- span id='MenuSection' style='DISPLAY:none' --\>\
> \<!-- span id='fillElement'\>\</span --\>\
> \<!-- /span --\>\
> \<!-- /div --\>\
> \
> \<span id='MenuSection'\>\
> \<span id='fillElement'\>\</span\>\
> \</span\>\
> \</div\>\
> \
> \<!-- // --\>\
> \
> \<h2 title='This field is set in the XML file and called with the line:    '\<xsl:value-of select='/dobedoc/title' /\>''\>\
> \<xsl:value-of select='/dobedoc/title' /\>\
> \</h2\>\
> \
> \<!-- title='A few notes on this particular set of XML/XSLT documents and XML/XSLT documents in general.' --\>\
> \<h3 title='This field is set in the XML file and called with the line:    '\<xsl:value-of select='/dobedoc/last_updated' /\>''\>\
> Last updated:\
> \<xsl:value-of select='/dobedoc/last_updated' /\>\
> \</h3\>\
> \<!-- // --\>\
> \<hr class='dobeStyle' /\>\
> \
> \<!-- Setting up **internal hyperlinks** --\>\
> \<ul type='square'\>\
> \<li\> \<a href='#\_1_03_dobeXML_IntroPara'\
> title='A very brief explanation of XML'\>\
> XML Introduction\</a\>\
> \</li\>\
> \<li\> \<a href='#\_1_03_dobeXML_Well-Formed'\
> title='XLL must be 'Well-Formed''\>\
> Well-Formed XML\</a\>\
> \</li\>\
> \<li\> \<a href='#\_1_03_dobeXML_Valid'\
> title='Whether XML documents comply with their DTD determines it's validity.'\>\
> Valid XML\</a\>\
> \</li\>\
> \<li\> \<a href='#\_1_03_dobeXML_DTD'\
> title='Document Type Definitions may give way to XML Schemas in a W3C recommendation soon.'\>\
> XML DTD\</a\>\
> \</li\>\
> \<li\> \<a href='#\_1_03_dobeXML_Schema'\
> title='A Schema is not a full recommendation yet, but will be soon.'\>\
> XML Schema\</a\>\
> \</li\>\
> \<li\> \<a href='#XMLWebLinks'\>\
> Additional XML Sites\</a\>\
> \</li\>\
> \</ul\>\
> \
> \<!-- // dobeXML_IntroPara --\>\
> \<blockquote title='NOTE: If you know how I could adapt the above to internal links by modifying the associated XSL stylesheet, please help me out! I experimented quite a bit and it wouldn't work. '\>\
> \
> These other topics are also covered in the \<a title='Glossary and Tutorial section is generated from XML file, as opposed to being embedded in the XSLT output tree' href='#GlossaryTutorialID'\>\
> Glossary and Tutorial \</a\>(XML-generated and sorted)\
> \<br /\>\<br /\>\
> \<table border='0' width='90%'\>\
> \<tr\>\
> \<td class='topics' width='35%'\>\
> "Valid" \<br /\>\
> "Well-formed" \<br /\>\<br /\>\<br /\>\
> "XSLT Data Types" \<br /\>\
> "XSLT Data Types" \<br /\>\
> "XSLT Expressions" \<br /\>\
> "XSLT Pattern Examples" \<br /\>\
> "XSLT Pattern Syntax" \<br /\>\
> "XSLT Variables" \<br /\>\
> \</td\>\
> \<td class='topics' width='35%'\>\
> "xsl:apply-templates" \<br /\>\
> "xsl:attribute" \<br /\>\
> "xsl:cdata" \<br /\>\
> "xsl:choose" \<br /\>\
> "xsl:comment" \<br /\>\
> "xsl:copy" \<br /\>\
> "xsl:define-template-set" \<br /\>\
> "xsl:element" \<br /\>\
> "xsl:entity-ref" \<br /\>\
> "xsl:eval" \<br /\>\
> \</td\>\
> \<td class='topics' width='30%'\>\
> "xsl:for-each" \<br /\>\
> "xsl:if" \<br /\>\
> "xsl:otherwise" \<br /\>\
> "xsl:pi" \<br /\>\
> "xsl:script" \<br /\>\
> "xsl:stylesheet" \<br /\>\
> "xsl:template" \<br /\>\
> "xsl:value-of" \<br /\>\
> "xsl:when" \<br /\>\
> \</td\>\
> \</tr\>\
> \</table\>\
> \</blockquote\>\
> \
> \<blockquote\>\
> \
> **     \
> This paragraph (and everything inside this introductory portion) is written as text\
> in a file with an extension of \<b\>'.XSL'\</b\>, which means, if it is \<b\>valid\</b\>,\
> that it is an XML \<b\>stylesheet\</b\> used to output, (transformed or formatted),\
> XML data in a pleasing, human-readable format,\
> namely in a web browser, as XHTML, a subset of XML,\
> which makes it nearly universally accessable.\<br /\>\<br /\>\
> \
>      This first section is written in the 'root' rule, or template, in the XSLT\
> stypesheet. I can display any part of the XML here. For instance, the first line is derived from the title element\
> within the XML document, with the line:\<br /\>\
>     \<b\>\<h2\>\<xsl:value-of select='/dobedoc/title'/\>\</h2\>\</b\>,\<br /\>\
> just inside the table, which is just after the \<body\> element, written in the XSLT root template for output as HTML.\<br /\>\<br /\>\
> \
>      Additionally, the statement (contained in the XSLT root template):\<br /\>\
>     \<b\>\<h3\>Last updated: \<xsl:value-of select='/dobedoc/last_updated'/\>\</h3\>\</b\>\<br /\>\
> allows inclusion of the '\<b\>last_updated\</b\>' element's text character value to be displayed next, formatted as an \<h3\> element,\
> defined in the internal CSS style (written within the XSLT root template) element pair..\<br /\>\<br /\>\
> \
>      The following text below this table is entirely contained in a file called '\<b\>\_XMLnXML_XML.xml\</b\>'. What you see below\
> is not necessarily in the same order as it's source, and not all of the source may be displayed at any one time. Then again, it may\
> resemble it quite closely. It is all formatted in a file called '\<b\>\_XMLnXML_XSL.xsl\</b\>' which makes use of internal\
> CSS formatting and transformation to XHTML-compliancy for display in a Browser. It is validated by a file called\
> '\<b\>\_XMLnXML_DTD.dtd\</b\>', which is a Document Type Definition file. As more and more template rules get written\
> in the XSL document, the final display, either within the XSLT engine, such as within \<b\>MSIE 5.X\</b\>, where the documents are\
> merged and rendered instantaneously, or later, inserting an \<b\>xsl:output\</b\> statement in a tool which will then\
> permanently write the result tree to a file with an .HTML extension.\<br /\>\<br /\>\
> \
>      To include \<b\>VBScript, JavaScript, ECMAScript or JScript\</b\>\
> functions and calls, the books say t use the \<b\>xsl:eval\</b\> element. There is a good VBS example included.\
> There is another way, which I am using in this page, see the source (or look at \<b\>xsl:comment\</b\> below) to\
> how it is accomplished! To include JavaScript in the XSLT document, I didn't use\
> the \<b\>xsl:eval\</b\> element at all!\
> \<br /\>\<br /\>\
> \
>      To output to a pure HTML file, say in an OUTPUT directory,\
> use the \<b\>xsl:output\</b\> element.\
> Or, use a tool which has this as a feature of the IDE, such as the tool I am using now, which\
> is \<b\>XMLWriter\</b\>, by\
> \<a title='Really, it's a great tool, and I think it was only \$35 US in 2000.' href='http://XMLWriter.net'\>\
> \<b\>Wattle Software\</b\>\
> \</a\>, which can convert the XSLT+XML combination into a static XHTML without the \<b\>xsl:output\</b\> element.\
> \<br /\>\<br /\>\
> \
> \</blockquote\>**\
> \
> \
> \<!-- Heading Table with called link (#id) --\>\
> \<table width='100%' cols='2' rows='1' border='0' cellpadding='10' id='\_1_03_dobeXML_IntroPara'\>\
> \<tr\>\
> \<td valign='top' align='left' width='65%'\>\
> \<h2 title='The ASCII of the future!'\>\<b\>Extensible Markup Language (XML)\</b\>\</h2\>\
> \
> \</td\>\
> \<td valign='top' align='center' width='35%'\>\
> \<a href='#\_XMLnXML_Start'\>\<small\>Start of this page\</small\>\</a\>\<br /\>\
> \</td\>\
> \</tr\>\
> \</table\>\
> \<div class='RelativeSize80WithIndent'\>\
> \<blockquote\>\
>     A class of data objects called \<em\>XML documents\</em\> are stored\
> on computers, and partially describe the behavior of programs that process these objects.\
> \<strong\>XML\</strong\> is a subset or restricted form of SGML, the Standard Generalized Markup Language (ISO 8879).\
> The goal is to enable generic XML or SGML to be served, received, and processed over the Web in the way similar HTML. \<br /\>\
>     That said, \<b\>the bottom line is to separate data and formatting\</b\>. That way, only\
> data is maintained in an xml file and all the formatting and transformations of that\
> data can be done in a separate file. Voila! One set of data, but display\
> (or leverage in some other bleeding edge technology) that data in many different ways and formats!\<br /\>\
>     \<b\>XML has specific syntax such as:\</b\> \<br /\>\
> \<ul\>\
> \
> \<li\> All start tags must begin with "\<" and end with "\>".\
> \</li\>\
> \
> \<li\>Each element MUST have both a start element and an end element.\
> \</li\>\
> \
> \<li\>XML does NOT require that a Document Type Definition (DTD) be present,  \
> (although there are provisions for both internal and external DTDs).\</li\>\
> \<li\>While references to the XML namespace are not REQUIRED,  \
> namespaces let the processing application know which DTD you're using,\
> so you may utilize the markup from several different DTDs in the same document!\
> Namespaces are really just a unique identifier which links an XML markup\
> element to a specific DTD. \<br /\>\
> Two \<b\>predefined namespaces\</b\> in XML are:\<br /\>\
>     "\<b\>xml:lang\</b\>"  and\
>     "\<b\>xml:space\</b\>" \</li\>\
> \<li\>XML elements are \<b\>case sensitive\</b\>! \<root \> and \<ROOT \> are NOT the same!\</li\>\
> \<li\>ALL attributes values MUST be contained within " quotation marks ".\</li\>\
> \<li\>The only reserved character references normally "built-in " to an\
> XML parser or browser, are the following: \<br /\>\
> \&lt; = \<    ,\
> \&gt; = \>    ,\
> &amp = &    ,\
> &apos = '    ,\
>     and    \
> \&quot; = "    .\
> \<br /\>Others will have to be built using general entities.\</li\>\
> \<li\>Elements may not nest out of sequence. \<A\>.\<B\> \</A\>.\</B\> is illegal.\</li\>\
> \<li\>\</li\>\
> \</ul\>\
> \
> The design goals for \<strong\>XML\</strong\> are:\
> \<ul\>\
> \<li\>Straightforwardly usable over the Internet.\</li\>\
> \<li\>Support a wide variety of applications.\</li\>\
> \<li\>Shall be compatible with SGML.\</li\>\
> \<li\>It shall be easy to write programs which process XML documents.\</li\>\
> \<li\>Optional features should be kept to a minimum, ideally zero.\</li\>\
> \<li\>XML documents should be human-legible and reasonably clear.\</li\>\
> \<li\>Design should be able to be prepared quickly.\</li\>\
> \<li\>Design of XML should be formal and concise.\</li\>\
> \<li\>Documents shall be easy to create.\</li\>\
> \<li\>Terseness in markup is of minimal importance.\</li\>\
> \</ul\>\
> Today XML is a W3C Recommendation meaning that XML has been reviewed and approved\
> by the members of the W3C. XML is therefore deemed "stable" and ready for\
> widespread deployment. A Recommendation is the highest level a W3C document\
> can be assigned. XML became a Recommendation on February 10, 1998.\
> \<a href='http://www.w3.org/TR/1998/REC-xml-19980210'\>\
> Link to the XML specification\</a\>.\
> \
> \</blockquote\>\
> \</div\>\
> \
> \
> \
> \<!-- // --\>\
> \<hr class='dobeStyle' /\>\
> \<!-- // \_1_03_dobeXML_Well-Formed --\>\
> \
> \<!-- Heading Table with called link (#id) --\>\
> \<table width='100%' cols='2' rows='1' border='0' cellpadding='10'\
> id='\_1_03_dobeXML_Well-Formed'\>\
> \<tr\>\
> \<td valign='top' align='left' width='65%'\>\
> **\<h2\>\<b\>Well-Formed XML\</b\>\</h2\>**\
> \</td\>\
> \
> \<td valign='top' align='center' width='35%'\>\
> \<a href='#\_XMLnXML_Start'\>\<small\>Start of this page\</small\>\</a\>\<br /\>\
> \</td\>\
> \</tr\>\
> \</table\>\
> \
> \<div class='RelativeSize80WithIndent'\>\
> \<blockquote\>\
> To be a well-formed XML document, it must conform to the rules above, namely:\<br /\>\
> \<ol\>\
> \<li\>Beginning and ending tags match, properly nested.\</li\>\
> \<li\>Empty tags may follow special XML syntax, although a closing tag is preferable.\</li\>\
> \<li\>All attribute values are contained within 'single' or 'double quote marks'.\</li\>\
> \<li\>All entities must be declared.\</li\>\
> \</ol\>\
> \</blockquote\>\
> \</div\>\
> \
> \
> \
> \<!-- // --\>\
> \<hr class='dobeStyle' /\>\
> \<!-- // \_1_03_dobeXML_Valid --\>\
> \
> \<!-- Heading Table with called link (#id) --\>\
> \<table width='100%' cols='2' rows='1' border='0' cellpadding='10'\
> id='\_1_03_dobeXML_Valid'\>\
> \<tr\>\
> \<td valign='top' align='left' width='65%'\>\
> **\<h2\>\<b\>Valid XML \</b\>\</h2\>**\
> \</td\>\
> \
> \<td valign='top' align='center' width='35%'\>\
> \<a href='#\_XMLnXML_Start'\>\<small\>Start of this page\</small\>\</a\>\<br /\>\
> \</td\>\
> \</tr\>\
> \</table\>\
> \
> \<div class='RelativeSize80WithIndent'\>\
> \<blockquote\>\
> To be a valid XML document, it must conform to the rules within it's own DTD or schema.\<br /\>\
> \<ol\>\
> \<li\>DTD may be internal or external.\</li\>\
> \<li\>Schema may be internal or external.\</li\>\
> \</ol\>\
> \</blockquote\>\
> \</div\>\
> \
> \
> \<!-- // --\>\
> \<hr class='dobeStyle' /\>\
> \<!-- // \_1_03_dobeXML_DTD --\>\
> \
> \<!-- Heading Table with called link (#id) --\>\
> \<table width='100%' cols='2' rows='1' border='0' cellpadding='10'\
> id='\_1_03_dobeXML_DTD'\>\
> \<tr\>\
> \<td valign='top' align='left' width='65%'\>\
> **\<h2\>\<b\>DTD\</b\>  \<span class='textSmaller'\>Document Type Definitions\</span\>\</h2\>**\
> \<ol\>\
> \<li\>\<b\>Document Type \<em\>Definitions\</em\>\</b\> (\<b\>DTDs\</b\>, see below)\
> \<ul\>\
> \<li\>Are part of the core XML 1.0 specification.\</li\>\
> \<li\>Are written in a language called \<b\>Extended Backus-Naur Form \</b\> or \<b\>EBNF\</b\>\</li\>\
> \<li\>Declare what exactly constitutes markup\</li\>\
> \<li\>Declare exactly what the structure - elements and attributes - mean\</li\>\
> \<li\>Are similar to a database schema, but is NOT an XML Schema\</li\>\
> \</ul\>\
> \</li\>\
> \<li\>\<b\>document type \<em\>declaration\</em\>\</b\> either:\
> \<ul\>\
> \<li\>Refers to an external \<b\>Document Type Definition\</b\>, (\<b\>DTD\</b\>, see above)\</li\>\
> \<li\>Actually \<em\>contains\</em\> a \<b\>Document Type Definition\</b\> in the form of markup declarations \</li\>\
> \<li\>This is confusing, but the dtd contains the DTD!\</li\>\
> \<li\>That's probably the worst you've got to face, no problem!\</li\>\
> \</ul\>\
> \
> \</li\>\
> \</ol\>\
> \</td\>\
> \
> \<td valign='top' align='center' width='35%'\>\
> \<a href='#\_XMLnXML_Start'\>\<small\>Start of this page\</small\>\</a\>\<br /\>\
> \</td\>\
> \</tr\>\
> \</table\>\
> \
> \<div class='RelativeSize80WithIndent'\>\
> \<div class='big120biIndent'\>Use this DTD:\</div\>\
> \<blockquote\>\
>   \<!ELEMENT doc  (head, body)\>\<br /\>\
>   \<!ELEMENT head  (title, date)\>\<br /\>\
>   \<!ELEMENT body  (para)\>\<br /\>\
>   \<!ELEMENT title (#PCDATA)\>\<br /\>\
>   \<!ELEMENT date  (#PCDATA)\>\<br /\>\
>   \<!ELEMENT year  (#PCDATA)\> \<!--Should be a four-digit-year.--\>\<br /\>\
>   \<!ELEMENT month (#PCDATA)\>\<br /\>\
>   \<!ELEMENT day  (#PCDATA)\> \<!--Should be an integer.--\>\<br /\>\
>   \<!ELEMENT para  (#PCDATA \| bold \| italic)\*\>\<br /\>\
>   \<!ELEMENT bold  (#PCDATA)\>\<br /\>\
>   \<!ELEMENT italic (#PCDATA)\>\
> \</blockquote\>\
> \<div class='big120biIndent'\>For this source:\</div\>\
> \<blockquote\>\
> \<?xml version='1.0'?\>\<br /\>\
>     \<doc\>\<br /\>\
>        \<head\>\<br /\>\
>         \<title\>title\</title\>\<br /\>\
>             \<date\>\<br /\>\
>                \<year\>four-digit-year \[unknown type\]\</year\>\<br /\>\
>                \<month\>month\</month\>\<br /\>\
>                \<day\>123\</day\>\<br /\>\
>             \</date\>\<br /\>\
>        \</head\>\<br /\>\
>        \<body\>\<br /\>\
>         \<para\>para and \<bold\>bold\</bold\> and\<br /\>\
>          \<italic\>italic\</italic\>\<br /\>\
>         \</para\>\<br /\>\
>        \</body\>\<br /\>\
>     \</doc\>\
> \</blockquote\>\
> \</div\>\
> \
> \
> \<!-- // --\>\
> \<hr class='dobeStyle' /\>\
> \<!-- // \_1_03_dobeXML_Schema --\>\
> \
> \<!-- Heading Table with called link (#id) --\>\
> \<table width='100%' cols='2' rows='1' border='0' cellpadding='10'\
> id='\_1_03_dobeXML_Schema'\>\
> \<tr\>\
> \<td valign='top' align='left' width='65%'\>\
> **\<h2\>\<b\>XML Schema\</b\>\</h2\>**\
> \</td\>\
> \
> \<td valign='top' align='center' width='35%'\>\
> \<a href='#\_XMLnXML_Start'\>\<small\>Start of this page\</small\>\</a\>\<br /\>\
> \</td\>\
> \</tr\>\
> \</table\>\
> \
> To describe a particular \<b\>namespace\</b\>:\
> \<h3 class='normalIBrown'\>\<big\>\<b\>SchemaName.xsd\</b\>\</big\>   file:\</h3\>\
> \<ul\>\
> \<li\>\
>    \
> \<schema \<b\>targetNamespace\</b\> = "urn:PunnyNameArchive:\<b\>PNA\</b\>" \<br /\>\
>          \
> xmlns:\<b\>PNA\</b\> = "http://www.PunnyNameArchive.com/PNA" \<br /\>\
>          \
> xmlns:\<b\>xsd\</b\> = "http://www.w3.org/1999/XMLSchema" \<br /\>\
>          \
> xmlns:\<b\>dt\</b\> = "http://www.w3.org/1999/XMLSchema/datatypes"\> \<br /\>\
>    \
> \<element name = "\<b\>FullName\</b\>" type = "\<b\>PNA:FullNameType\</b\>" /\>\<br /\>\
>    \
> \<element name = "\<b\>Literal\</b\>" type = "\<b\>xsd:string\</b\>" /\>\<br /\>\
>    \
> \<element name = "\<b\>date\</b\>" type = "\<b\>xsd:date\</b\>" /\>\<br /\>\
> \
> \<blockquote\>\
>    \
> \<\<b\>complexType\</b\> name= "\<b\>FullNameType\</b\>"\>\<br /\>\
>          \
> \<element name = "\<b\>FirstName\</b\>" type = "xsd:string" /\>\<br /\>\
>          \
> \<element name = "\<b\>SecondName\</b\>" type = "xsd:string" /\>\<br /\>\
>          \
> \<element name = "\<b\>ThirdName\</b\>" type = "xsd:string" /\>\<br /\>\
>          \
> \<element name = "\<b\>LastName\</b\>" type = "xsd:string" /\>\<br /\>\
>          \
> \<element name = "\<b\>CensusRank\</b\>" type = "xsd:string" /\>\<br /\>\
>          \
> \<element name = "\<b\>PNARanking\</b\>" type = "\<b\>dt:decimal\</b\>" /\>\<br /\>\
>          \
> \<element name = "\<b\>Literal\</b\>" type = "xsd:string" /\>\<br /\>\
>          \
> \<element name = "\<b\>FullNameString\</b\>" type = "xsd:string" /\>\<br /\>\
>          \
> \<element name = "\<b\>PNComment\</b\>" type = "xsd:string" /\>\<br /\>\
>    \
> \<\<b\>/complexType\</b\>\>\<br /\>\
> \</blockquote\>\
> \<br /\>\</li\>\
> \</ul\>\
> \<h3 class='normalIBrown'\>\<big\>\<b\>PNAInstanceName.xml\</b\>\</big\>   file:\</h3\>\
> \<ul\>\
> \<li\>\
>    \
> \<\<b\>?xml version = "1.0"?\</b\>\> \<br /\>\
>    \
> \<\<b\>PN\</b\> xmlns = "http://www.PunnyNameArchive.com" \<br /\>\
>          \
> xmlns:PNA = "urn:PunnyNameArchive:\<b\>PNA\</b\>\<br /\>\
>          \
> xmlns:xsi = "http://www.w3.org/1999/XMLSchema/instance" \<br /\>\
>          \
> xsi:schemaLocation = "urn:PunnyNameArchive:\<b\>PNA\</b\>\<br /\>\
>          \
>          \
> http://www.PunnyNameArchive.com/PNA/\<b\>SchemaName.xsd\</b\>"\> \<br /\>\
> \
> \<blockquote\>\
>    \
> \<\<b\>PNA:FullNameType\</b\> \>\<br /\>\
> \
>          \
> \<PNA:FirstName \>\<b\> Webb\</b\>  \
> \</PNA:FirstName \>\<br /\>\
> \
>    \
> \<!-- // Optional SecondName, ThirdName--\>\<br /\>\
> \
>          \
> \<PNA:LastName \>\<b\> Paige\</b\>  \
> \</PNA:LastName \>\<br /\>\
> \
>          \
> \<PNA:CensusRank \>\<b\> 05678\</b\>  \
> \</PNA:CensusRank \>\<br /\>\
> \
>          \
> \<PNA:PNARanking \>\<b\> 8.8\</b\>  \
> \</PNA:PNARanking \>\<br /\>\
> \
>          \
> \<PNA:FullNameStringLiteral \>\<b\> Web Page\</b\>  \
> \</PNA:FullNameStringLiteral \>\<br /\>\
> \
>          \
> \<PNA:PNComment \>\<em\>\<b\> Related to Paige Lincoln\</b\>\</em\>  \
> \</PNA:PNComment \>\<br /\>\
> \
>    \
> \<\<b\>/PNA:FullNameType\</b\> \>\
> \</blockquote\>\
> \
>    \
> \<\<b\>/PN\</b\>\>\<br /\>\
> \</li\>\
> \</ul\>\
> \
> \<br /\>\
> \<h3 class='normalIBrown'\>   \<big\>\<b\>Schema\</b\>\</big\> :  \</h3\>\
> \<h3 class='normalIBrown'\>(When comparing a \<b\>Schema\</b\> and a \<b\>DTD \</b\> for the same XML document)\</h3\>\
> \<ul\>\
> \<li\>May contain much more information than a DTD.\</li\>\
> \<li\>Is actually an \<b\>XML\</b\> document itself and must be well-formed.\</li\>\
> \<li\>Is not yet recommended by the \<b\>W3C\</b\>.\</li\>\
> \<li\>Is not lacking in describing \<b\>data types\</b\>, (as opposed to a \<b\>DTD\</b\>).\</li\>\
> \<li\>Is \<b\>based on a working draft\</b\>, so may change over time.\</li\>\
> \<li\>Uses a file extension of "\<b\>.XSD\</b\>" .\</li\>\
> \<li\>Acts upon an \<b\>instance\</b\> document (Source.xml).\</li\>\
> \</ul\>\
> \
> \<br /\>\
> \<h3 class='normalIBrown'\>\<big\>\<b\>Using Multiple Schemas\</b\>\</big\> :  \</h3\>\
> \<ul\>\
> \<li\>Use \<b\> schemaLocation \</b\> directive to\
> \<b\> import \</b\>   or   \<b\> include \</b\>\
> one schema document into another (at parsetime).\<br /\>\
> \</li\>\
> \<li\>\
> \<\<b\>import\</b\>  namespace = "urn:SomeOtherNameSpace:foobar" .\<br /\>\
>             \
> schemaLocation = "http://www.Snafu.com/xsl-schemas/\<b\>SnafuSchemaName.xsd\</b\>"\> \<br /\>\
> \</li\>\
> \<li\>\
> \<\<b\>include\</b\>  schemaLocation =\
> "http://www.PunnyNameArchive.com/PNA/common/\<b\>AnotherLocalSchemaName.xsd\</b\>"\> \<br /\>\
> \</li\>\
> \</ul\>\
> \
> \<br /\>\
> \<h3 class='normalIBrown'\>\<big\>\<b\>Datatypes\</b\>\</big\> :  \</h3\>\
> \<ul\>\
> \<li\>A datatype is a set of distinct values, called its \<b\>value space\</b\>\</li\>\
> \<li\>A datatype is a set of lexical representations, called its \<b\>lexical space\</b\>\</li\>\
> \<li\>A datatype is a set of \<b\>facets\</b\> that characterize properties of the value space, individual values or lexical items\</li\>\
> \<li\>\<b\>List datatypes\</b\> are those having values which consist of a finite-length\
> sequence of values of an \<b\>atomic datatype\</b\>\</li\>\
> \<li\>\<b\>A pattern is a constraint\</b\> on the value space of a datatype\
> which is achieved by \<b\>constraining the lexical space\</b\> to literals which match a specific pattern.\</li\>\
> \<li\>\<b\>The value of pattern must be a regular expression\</b\>\</li\>\
> \<li\>If {variety} is a list, then {variety} of {base type definition} must be \<b\>atomic\</b\>\</li\>\
> \<li\>\<b\>A constraining facet\</b\> is an optional property that can be applied to\
> a datatype to constrain its \<b\>value space\</b\>\</li\>\
> \</ul\>\
> \
> \
> \<!-- // --\>\
> \<hr class='dobeStyle' /\>\
> \
> \
> \
> \
> \
> \<!-- // --\>\
> \<h3 id='XMLWebLinks'\>Other Useful XML Web Links:\</h3\>\
> \
> \<ul\>\
> \<li\>\<b\>\<a href='http://www.w3.org/'\>W3C.ORG\</a\>\</b\>, Standards Organization\</li\>\
> \
> \<li\>Robin Cover's XML Website: \<a href='http://www.oasis-open.org/cover/'\>\
> http://www.oasis-open.org/cover/\</a\>\</li\>\
> \
> \<li\>GCA's XML Files On-line Newsletter:\
> \<a href='http://www.gca.org/whats_xml/whats_xml_xmlfiles.htm'\>\
> http://www.gca.org/whats_xml/whats_xml_xmlfiles.htm\</a\>\</li\>\
> \
> \<li\>Seybold's XML.com: \<a href='http://www.xml.com/xml/pub/'\>\
> http://www.xml.com/xml/pub/\</a\>\</li\>\
> \
> \</ul\>\
> \
> \<!-- // --\>\
> \
> \<hr class='myHorizontalRuleStyle' align='center' /\>\
> \<h1 id='GlossaryTutorialID' title='A review of XML Syntax and Terms, entirely written in XML, DTD, CSS and XSLT'\>\
> Glossary & Tutorial\</h1\>\
> \<h3\>Next section generated entirely from an XML file\</h3\>\
> \
> \
> \
> \
> \
> \<xsl:apply-templates /\>\
> \
> \
> \
> \
> \
> \
> \
> \<!-- //Footer --\>\
> \<table width='100%' cols='2' rows='1' border='0' cellpadding='10' id='dobeXHTML_IntroPara'\>\
> \<tr\>\
> \<td valign='top' align='center' width='40%'\>\
> \<!-- The following file must be in this directory!\
> This site copyright© 2001\
> by John "Dobe Doinat" Hartman,\
> All Rights Reserved.\
> --\>\
> \<!-- \*\*\*\*\*\*\*\*\*Insert call to external JS file here\*\*\*\*\*\*\*\*\* --\>\
> \<script type='text/javascript'\
> src='write_Copyright_EN.js'\>\
> \</script\>\
> \
> \</td\>\
> \<td valign='top' align='left' width='60%' class='small_70bi'\>\
> Cut-and-pasting of code permitted for non-commercial use.\<br /\>\
> Check out my source code: \<b\>\<Right-Click\> \| View Source\</b\> \<br /\>\
> Thank you. \<br /\>\
> \<a href='#\_XMLnXML_Start'\>\<center\>\<b\>Back to the Beginning of this page\</b\>\</center\>\</a\>\
> \</td\>\
> \</tr\>\
> \</table\>\
> \<!-- This sets a page break! --\>\
> \<br clear='all' style='mso-special-character:line-break; page-break-before:always;' /\>\
> \
> \</body\>\
> \
> \
> \
> \
> \
> \
> \<COMMENT\>This is outside of the namespace of the current XSL namespace.\</COMMENT\>\
> \</html\>\
> \</xsl:template\>\
> \<!-- \~\~~ --\>\
> \
> \<COMMENT\>This is outside of the namespace of the current XSL namespace.\</COMMENT\>\
> \<!-- END OF ROOT RULE --\>\
> \
> \
> \
> \<!-- BEGIN TEMPLATE RULES DEFINITIONS --\>\
> \
> \<!-- Basic text rule: xsl:template match='text()' then xsl:value-of/ overrides the default XSLT engine --\>\
> \<!-- \~\~~ --\>\
> \<xsl:template match='text()'\>\
> \<!-- \<== If the following line is left out, with the original: xsl:template match='\*\[node() \]' still in effect, --\>\
> \<!-- \<== Then only the elements and attributes are visible, no text appears from the XML file. --\>\
> \<xsl:value-of /\>\
> \</xsl:template\>\
> \<!-- \~\~~ --\>\
> \
> \<!-- This template rule: xsl:template match='\*\[node() \]' catches all elements and attributes. --\>\
> \<!-- The statement: xsl:apply-templates select='@\*'/ catches the attributes --\>\
> \<!-- While the '\[' and '\]' and '/' are literal characters applied to the result document tree. --\>\
> \<!-- \~\~~ --\>\
> \<xsl:template match='\*\[node() \]'\>\
> \<xsl:apply-templates /\>\
> \</xsl:template\>\
> \<!-- \~\~~ --\>\
> \
> \<!-- This rule will match any element (possibly empty?) in the XML document --\>\
> \<!-- called newline and insert a carriage return in the HTML transformed result document --\>\
> \<!-- \~\~~ --\>\
> \<xsl:template match='newline'\>\
> \<br /\> \<!-- \<== This works! See internal DTD for entity declaration --\>\
> \</xsl:template\>\
> \<!-- \~\~~ --\>\
> \
> \
> \<!-- Named element rule: xsl:template match='title' then use xsl:value-of/ or not depending if you want to display it... --\>\
> \<!-- This finds any valid elements named title and formats them for the result document tree --\>\
> \<!-- \~\~~ --\>\
> \<xsl:template match='title'\>\
> \<!-- Leaving out the line: Title: \_xsl:apply-templates /\_ , the title element nor the character text is displayed --\>\
> \</xsl:template\>\
> \<!-- \~\~~ --\>\
> \
> \
> \<!-- Named element rule: xsl:template match='last_updated' --\>\
> \<!-- \~\~~ --\>\
> \<xsl:template match='last_updated'\>\
> \<!-- 'last_updated' element nor it's character text is displayed now, since no definition within this named template --\>\
> \</xsl:template\>\
> \<!-- \~\~~ --\>\
> \
> \
> \<!-- Named element rule: xsl:template match='red' --\>\
> \<!-- \~\~~ --\>\
> \<xsl:template match='red'\>\
> \<span class='red'\>\<xsl:apply-templates/\>\</span\>\
> \</xsl:template\>\
> \<!-- \~\~~ --\>\
> \
> \
> \<!-- Named element rule: xsl:template match='green' --\>\
> \<!-- \~\~~ --\>\
> \<xsl:template match='green'\>\
> \<span class='green'\>\<xsl:apply-templates/\>\</span\>\
> \</xsl:template\>\
> \<!-- \~\~~ --\>\
> \
> \
> \<!-- Named element rule: xsl:template match='black' --\>\
> \<!-- \~\~~ --\>\
> \<xsl:template match='black'\>\
> \<span class='black'\>\<xsl:apply-templates/\>\</span\>\
> \</xsl:template\>\
> \<!-- \~\~~ --\>\
> \
> \
> \<!-- Named element rule: xsl:template match='yellow' --\>\
> \<!-- \~\~~ --\>\
> \<xsl:template match='yellow'\>\
> \<span class='yellow'\>\<xsl:apply-templates/\>\</span\>\
> \</xsl:template\>\
> \<!-- \~\~~ --\>\
> \
> \
> \<!-- Named element rule: xsl:template match='purple' --\>\
> \<!-- \~\~~ --\>\
> \<xsl:template match='purple'\>\
> \<span class='purple'\>\<xsl:apply-templates/\>\</span\>\
> \</xsl:template\>\
> \<!-- \~\~~ --\>\
> \
> \
> \<!-- Named element rule: xsl:template match='bold' --\>\
> \<!-- \~\~~ --\>\
> \<xsl:template match='bold'\>\
> \<span class='bold'\>\<xsl:apply-templates/\>\</span\>\
> \</xsl:template\>\
> \<!-- \~\~~ --\>\
> \
> \
> \<!-- Named element rule: xsl:template match='blue' --\>\
> \<!-- \~\~~ --\>\
> \<xsl:template match='blue'\>\
> \<span class='blue'\>\<xsl:apply-templates/\>\</span\>\
> \</xsl:template\>\
> \<!-- \~\~~ --\>\
> \
> \
> \<!-- Named element rule: xsl:template match='italic' --\>\
> \<!-- \~\~~ --\>\
> \<xsl:template match='italic'\>\
> \<span class='italic'\>\<xsl:apply-templates/\>\</span\>\
> \</xsl:template\>\
> \<!-- \~\~~ --\>\
> \
> \<!-- Named element rule: xsl:template match='keywords' --\>\
> \<!-- \~\~~ --\>\
> \<xsl:template match='keywords'\>\
> \<xsl:for-each select='keyword' order-by='+@name'\>\
> \
> \<!-- \~~Does it work?\~~ --\>\
> \<!-- \~~\<a id='\[@name\]'\>\</a\>\~~ --\>\
> \
> \<span class='record'\>\
> \<br /\>\
> \<div class='noindent'\>\
> \<hr class='myHorizontalRuleStyle60Red' align='left' /\>\
> \<a href='#\_XMLnXML_Start'\>Back to Start\</a\>\<br /\>\
> \<b\>\<span class='keyword'\>\<xsl:value-of select='@name' /\>\</span\>\</b\>\
> \
> \<hr class='myHorizontalRuleStyle60Red' align='left' /\>\
> \<hr class='myHorizontalRuleStyle80' align='left' /\>\
> \</div\>\
> \
> \<b\>Definition: \</b\>\<xsl:apply-templates select='def'/\>\
> \<br /\>\
> \<hr class='myHorizontalRuleStyle80' align='left' /\>\
> \
> \<b\>Example(s): \</b\>\<xsl:apply-templates select='example'/\>\
> \</span\>\
> \<br /\>\
> \<hr class='myHorizontalRuleStyle80' align='left' /\>\
> \<br /\>\<br /\>\<br /\>\
> \</xsl:for-each\>\
> \
> \</xsl:template\>\
> \<!-- \~\~~ --\>\
> \</xsl:stylesheet\>\

</div>

------------------------------------------------------------------------

<div id="PNA_XMLNXML_DTD_text">

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td class="specialBROWN150" style="text-align: left;" title="This file contains the data and a link to the stylesheet and the Document Type Definition file." width="70%" onmouseover="this.style.color=&#39;green&#39;; this.style.fontSize=&#39;170%&#39;;" onmouseout="this.style.color=&#39;brown&#39;; this.style.fontSize=&#39;160%&#39;;">PNA_XMLNXML_DTD.DTD</td>
<td style="text-align: right;" width="30%"><a href="#PNA_XMLNXML_Start">Back to Start</a><br />
</td>
</tr>
</tbody>
</table>

> \<!-- New format for Dobe's Punny Name Archive on 12-24-2001 --\>\
> \<!-- Hand-written XHTML, XML, XSLT, CSS and JS suite --\>\
> \<!-- filename: **PNA_XMLNXML_DTD.DTD** --\>\
> \<!--\
> Dobe Doinat's Punny Name Archive\
> MegaloMedia Copyright **January 03, 2002**\
> John W. Hartman (Dobe Doinat)\
> http://www.eskimo.com/~dobe/\
> mailto://dobe@eskimo.com\
> IDE of choice: XMLWriter, Wattle Software\
> --\>\
> \<!-- ' ? ' means zero or at most once --\> \<!-- ' + ' means at least once or more--\>\
> \<!-- ' \* ' means zero or more times --\> \<!-- ' \| ' means this or that --\>\
> \
> \<!ELEMENT **dobedoc** (**last_updated?, title?, body**)+\>\
> \<!ELEMENT **last_updated** (#PCDATA)\>\
> \<!ELEMENT **title** (#PCDATA)\>\
> \<!ELEMENT **body** (glossary)\*\>\
> \<!ELEMENT **glossary** (keywords)\*\>\
> \<!ELEMENT **keywords** (keyword)\*\>\
> \<!ELEMENT **keyword** (**\#PCDATA \| def \| example**)\*\>\
> \<!**ATTLIST** keyword **name** CDATA **\#REQUIRED**\>\
> \<!ELEMENT **def** (#PCDATA \| newline \| red \| green \| black \| blue \| yellow \| purple \| bold \| italic)\*\>\
> \<!ELEMENT **example** (#PCDATA \| newline \| red \| green \| black \| blue \| yellow \| purple \| bold \| italic)\*\>\
> \
> \<!-- Strictly speaking, this goes against the nature of XML in that formatting --\>\
> \<!-- 'should' be done in the XSLT document, keeping the XML document pure data. --\>\
> \<!-- **Tough. I'm writing it, I like it.** --\>\
> \<!ELEMENT newline EMPTY\>\
> \
> \<!ELEMENT red (#PCDATA)\*\>\
> \<!ELEMENT green (#PCDATA)\*\>\
> \<!ELEMENT black (#PCDATA)\*\>\
> \<!ELEMENT blue (#PCDATA)\*\>\
> \<!ELEMENT yellow (#PCDATA)\*\>\
> \<!ELEMENT purple (#PCDATA)\*\>\
> \<!ELEMENT bold (#PCDATA)\*\>\
> \<!ELEMENT italic (#PCDATA)\*\>\
> \

</div>

<table id="dobeXHTML_IntroPara" width="100%" cols="2" rows="1" data-border="1" data-cellpadding="10">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td style="text-align: center;" data-valign="top" width="40%"></td>
<td class="small_70bi" style="text-align: left;" data-valign="top" width="60%">Cut-and-pasting of code permitted for non-commercial use.<br />
Check out my source code: <strong>&lt;Right-Click&gt; | View Source</strong><br />
Thank you.<br />
<a href="#PNA_XMLNXML_Start"></a>
<strong>Back to the Beginning of this page</strong></td>
</tr>
</tbody>
</table>

\
