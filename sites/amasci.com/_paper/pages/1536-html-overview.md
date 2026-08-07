---
title: "HTML Overview"
source_domain: amasci.com
source_path: ~bloo/indexdot/history/html.htm
order: 1536
reachable_from_entry: false
images: 0
internal_links: 19
extracted: 2026-08-07T05:55:14Z
extractor: site_to_paper.py (pandoc)
---

# HTML Overview

*Source page: `~bloo/indexdot/history/html.htm`*

\

<span class="pagetitle">HTML Overview</span>\
= <span class="sitetitle">Index DOT Html/Css</span> by [Brian Wilson](../misc/email.htm) =
==========================================================================================

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td style="text-align: left;">Index DOT Html: <a href="../html/index.html">Main Index</a> | <a href="../html/tree/htmltree.htm">Element Tree</a> | <a href="../html/tagindex/a.htm">Element Index</a> | <a href="../html/supportkey/a.htm">HTML Support History</a><br />
Index DOT Css: <a href="../css/index.html">Main Index</a> | <a href="../css/propindex/font.htm">Property Index</a> | <a href="../css/supportkey/syntax.htm">CSS Support History</a> | <a href="browsers.htm">Browser History</a></td>
</tr>
</tbody>
</table>

<table data-cellpadding="3" width="90%">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td><hr /></td>
</tr>
<tr>
<td style="text-align: left;"><strong>Statistics</strong>
<hr />
<dl>
<dt><strong>Original Author:</strong> Tim Berners-Lee<br />
<strong>Specifications:</strong></dt>
<dd>
- <a href="html20.htm">HTML 2.0</a>
</dd>
<dd>
- <a href="html30.htm">HTML 3.0</a>
</dd>
<dd>
- <a href="html32.htm">HTML 3.2</a>
</dd>
<dd>
- <a href="html40.htm">HTML 4.0</a>
</dd>
<dd>
- <a href="xhtml10.htm">XHTML 1.0</a>
</dd>
<dd>
- <a href="xhtml11.htm">XHTML 1.1</a>
</dd>
<dd>
- <a href="css.htm">Cascading Style Sheets</a>
</dd>
<dt><strong>Timelines:</strong></dt>
<dd>
- Creation of language in conjunction with Berners-Lee's WWW program - Oct.-&gt;Dec. 1990
</dd>
<dd>
- Specification for HTML released on the Internet - Summer, 1991
</dd>
<dd>
- Draft defining HTML released (Internet draft later expired) - June, 1993
</dd>
<dd>
- Initial document for 'HTML 2.0' released - April, 1994
</dd>
<dd>
- Draft for HTML 2.0 cleaned up and released - July, 1994
</dd>
<dd>
- HTML 2.0 draft further refined with plans to release as an RFC - February, 1995
</dd>
<dd>
- HTML 2.0 (RFC 1866) approved as a proposed standard - September, 1995
</dd>
<dd>
- HTML 3.0 draft released (later expired) - March, 1995
</dd>
<dd>
- HTML 3.2 draft released - May, 1996
</dd>
<dd>
- HTML experimental DTD 'Cougar' released - July, 1996
</dd>
<dd>
- W3C recommendation for HTML 3.2 (Wilbur) - January, 1997
</dd>
<dd>
- HTML 4.0 draft (evolved from Cougar) released - July, 1997
</dd>
<dd>
- HTML 4.0 becomes W3C proposed recommendation - November, 1997
</dd>
<dd>
- HTML 4.0 becomes W3C recommendation - December, 1997
</dd>
<dd>
- HTML 4.0 revised and certified W3C recommendation - April, 1998
</dd>
<dd>
- Draft released for 'Reformulating HTML in XML' (codename Voyager) - December, 1998
</dd>
<dd>
- XHTML 1.0 first working draft released - January, 1999
</dd>
<dd>
- XHTML 1.0 becomes W3C Proposed Recommendation - August, December 1999
</dd>
<dd>
- XHTML 1.1 first working draft released - September, 1999
</dd>
<dd>
- XHTML 1.0 becomes W3C Recommendation - January, 2000
</dd>
<dd>
- XHTML 1.1 becomes W3C Proposed Recommendation - April, 2001
</dd>
<dd>
- XHTML 1.1 becomes W3C Recommendation - May, 2001
</dd>
</dl>
<strong>In The Beginning: SGML</strong>
<hr />
In 1986, a new ISO standard (ISO 8879) was released which aimed to make platform and display differences irrelevant to the delivery and rendering of documents. This standard detailed the language called the Standard Generalized Markup Language (SGML.)<br />
<br />
<strong>Tim Berners-Lee and<br />
The Genesis of the WWW</strong>
<hr />
In 1989, Tim Berners-Lee created a proposal for a hypertext document system to be used within the <a href="../misc/glossary.htm#cern">CERN</a> community. Although based in Switzerland, CERN members were scattered throughout the globe and project turnover was often high. Collaboration over long distances, getting new project members quickly up to speed and preservation of information in the face of frequent member turnover were the driving factors in the development of the proposed system. This system, which Berners-Lee later named "The World-Wide Web" in October of 1990, outlined several important components necessary to realize the vision and which, in a nutshell, defines the nature of the WWW today:
<ol>
<li>It must be cross-platform</li>
<li>Must be able to use many existing informational resource systems while also allowing new information to be easily added</li>
<li>A transport mechanism was necessary to move documents across networks<br />
[evolved into HTTP]</li>
<li>An identification scheme for addressing both local and remote hypertext documents<br />
[evolved into URL addressing]</li>
<li>A formatting language for the hypertext documents. This was not explicitly mentioned, but was part and parcel of presenting the information received<br />
[evolved into HTML]</li>
</ol>
<strong>The Development of HTML</strong>
<hr />
Berners-Lee developed and defined the HTML language, which was created and defined using SGML, during the development cycle for the first Web browser/editor from October to December 1990. The first version of the browser initially ran only on the NeXT platform and was only processing text files, but it was a start. Berners-Lee later put the code and specifications for the project (including HTML) on the Internet in the summer of 1991. During the next few years the system introduced by Berners-Lee caught on in the Internet community - and the 'web' of documents available was steadily growing. A common library of code was available to programmers to easily create the needed capabilities to access web documents. Browsers quickly became available for a wide variety of platforms. As the number of implementations grew, the variety did also. The HTML language originally specified by Berners-Lee had developed and extended far beyond its initial form and no real standard had yet been developed. For a further discussion of how the first HTML standard finally developed, please see the <a href="html20.htm">HTML 2.0</a> history page.<br />
<br />
<strong>What HTML is today</strong>
<hr />
The standards for HTML are currently being developed by a worldwide industry consortium known as the <a href="../misc/glossary.htm#w3c">W3C</a>. This work was carried out previously by the <a href="../misc/glossary.htm#ietf">IETF</a>. The W3C places several requirements on HTML:
<blockquote>
"The document format should be, as far as practical, backwards compatible with existing HTML documents. It should support both paged and scrolling layout models...A simple, scaleable document format that can be used for information exchange on virtually any platform."
</blockquote>
The W3C goes on to list the proposed range of these platforms, which include:
<ul>
<li>Graphical User Interfaces, such as Windows, Macs and X11/Unix</li>
<li>Text only systems, such as VT-100 terminals</li>
<li>Text to Speech devices</li>
<li>Rendering to Braille</li>
</ul>
<strong>The Success of HTML</strong>
<hr />
In hindsight, the following quote by Berners-Lee from the original CERN proposal shows how far things have progressed in less than a decade:
<blockquote>
"In 10 years, there may be many commercial solutions to the problems above, while today we need something to allow us to continue."
</blockquote>
The WWW and HTML solutions that Berners-Lee created have evolved into that solution. HTML is now becoming the primary document format of choice not only on the Web, but also elsewhere in both personal and commercial uses. Despite its current limitations, HTML has become the most popular and widely used rich text format ever.<br />
<br />
<strong>Relevant Sites</strong>
<hr />
<dl>
<dt><a href="http://www.w3.org/MarkUp/PubHistory.html" class="relevant">http://www.w3.org/MarkUp/PubHistory.html</a></dt>
<dd>
<span class="relevant">HTML Spec publication history</span>
</dd>
<dt><a href="http://www.w3.org/MarkUp/Bibliography" class="relevant">http://www.w3.org/MarkUp/Bibliography</a></dt>
<dd>
<span class="relevant">A historical list of HTML and HTML-related proposals and standards</span>
</dd>
<dt><a href="http://cern.web.cern.ch/CERN/WorldWideWeb/RCTalk/history.html" class="relevant">http://cern.web.cern.ch/CERN/WorldWideWeb/RCTalk/history.html</a></dt>
<dd>
<span class="relevant">CERN's WWW timeline page</span>
</dd>
<dt><a href="http://www.w3.org/Mail/Archives.html" class="relevant">http://www.w3.org/Mail/Archives.html</a></dt>
<dd>
<span class="relevant">W3C's mailing list archives for www-talk and www-html - makes interesting reading, but some parts have <em>VERY</em> long download times.</span>
</dd>
<dt><a href="http://www.w3.org/MarkUp/HTML-WG/940726-minutes.html" class="relevant">http://www.w3.org/MarkUp/HTML-WG/940726-minutes.html</a></dt>
<dd>
<span class="relevant">The IETF HTML 'Birds of a Feather' group meeting minutes: 7/26/94. Very interesting details in this document.</span>
</dd>
</dl></td>
</tr>
<tr>
<td><hr /></td>
</tr>
</tbody>
</table>

\
[Boring Copyright Stuff...](../misc/copyright.htm)\
