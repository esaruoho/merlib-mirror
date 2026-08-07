---
title: "XHTML"
source_domain: amasci.com
source_path: ~bloo/indexdot/history/xhtml.htm
order: 1541
reachable_from_entry: false
images: 0
internal_links: 12
extracted: 2026-08-07T17:07:50Z
extractor: site_to_paper.py (pandoc)
---

# XHTML

*Source page: `~bloo/indexdot/history/xhtml.htm`*

\

<span class="pagetitle">XHTML</span>\
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
<dt><strong>Authors:</strong> Steven Pemberton (HTML WG chair), et al (too many to mention)<br />
<strong>Standards:</strong></dt>
<dd>
- <a href="xhtml10.htm">XHTML 1.0</a>
</dd>
<dd>
- <a href="xhtml11.htm">XHTML 1.1</a>
</dd>
<dt><strong>Specifications:</strong></dt>
<dd>
HTML 4.0 Recommendation - <a href="http://www.w3.org/TR/html401">http://www.w3.org/TR/html401</a>
</dd>
<dd>
XML 1.0 Recommendation - <a href="http://www.w3.org/TR/REC-xml">http://www.w3.org/TR/REC-xml</a>
</dd>
<dd>
XHTML 1.0 Recommendation - <a href="http://www.w3.org/TR/xhtml1/">http://www.w3.org/TR/xhtml1/</a>
</dd>
<dd>
XHTML 1.1 Recommendation - <a href="http://www.w3.org/TR/xhtml11/">http://www.w3.org/TR/xhtml11/</a>
</dd>
<dt><strong>Timeline:</strong></dt>
<dd>
- Industry organizations and companies gather to decide the future of HTML - May, 1998
</dd>
<dd>
- Draft document "Reformulating HTML in XML" (Voyager) released - December, 1998
</dd>
<dd>
- First working draft of "XHTML 1.0" released by the W3C - February, 1999
</dd>
<dd>
- Second working draft of "XHTML 1.0" released by the W3C - March, 1999
</dd>
<dd>
- Third working draft of "XHTML 1.0" released by the W3C - May, 1999
</dd>
<dd>
- XHTML 1.0 becomes W3C Proposed Recommendation twice - August, December 1999
</dd>
<dd>
- XHTML 1.0 becomes W3C Recommendation - January, 2000
</dd>
<dd>
- "XHTML Basic" becomes W3C Recommendation - December 2000
</dd>
<dd>
- "Modularization of XHTML" becomes W3C Recommendation - April 2001
</dd>
<dd>
- XHTML 1.1 becomes W3C Recommendation - May, 2001
</dd>
</dl>
<strong>Where did HTML come from?</strong>
<hr />
HTML 4.0 and its predecessors are defined using SGML, a stable and well-defined meta language that allows other markup languages to be created. SGML is very powerful and flexible, but it is these very features that have prevented the widespread adoption of the language. SGML's flexibility and power result in a level of complexity that prohibit a compliant parser from being lightweight.<br />
<br />
<strong>Enter XML</strong>
<hr />
XML is a new meta-language that aims to solve many of the problems of SGML, meanwhile retaining the power and flexibility which make SGML such a compelling solution. Like SGML, XML has the power to define markup languages. The HTML language consists of a static, restrictive set of elements and attributes. It is inflexible and is not able to adapt to the many needs that are foreseen in just the next few years. HTML's tag set is not even very good at satisfying the needs of adequately marking content with semantic meaning. Yet, HTML is currently the ubiquitous document format on the World Wide Web, used in millions...billions of documents. Obviously, HTML needs to grow up...to have something like the expressive power of SGML, without adding a lot of baggage to the deal. XML is the decided successor in this equation.<br />
<br />
XML has many things going for it. When added up, the move to XML makes perfect sense. Part of the reason current browsers are so big is that the parsers need to accommodate bad syntax; many pages on the web today are coded using bad html syntax and authoring practices. The market for lightweight browsers is expected to grow considerably in the future, and lean &amp; mean browsers will allow these new devices to tackle the contents of the web with less problems. XML is extensible too, which will allow even more powerful abilities for the full-featured browsers of the future.<br />
<br />
<strong>XHTML</strong>
<hr />
A gathering in May, 1998 of industry organizations and companies decided that HTML needed to be re-created as an XML application to meet the current and future needs of an ever-diversifying application and presentation market. To that end, the W3C has published a draft, "XHTML 1.0", which re-casts HTML 4.0 in XML syntax and componentizes its capabilities.<br />
<br />
The transformation of HTML to XHTML will not be without a few growing pains, as some fundamental simplifications in the XML language are just different enough from current popular HTML authoring practice to create some incompatibilities. XHTML defines distinct namespaces for the three separate HTML 4.0 DTDs - strict, transitional and frameset. The extensibility and flexibility of XML will allow for HTML to be broken down even further if need be, or easily extended - possibly for uses and applications that can not even be foreseen at this point. The "X" in XML stands for "eXtensible", after all.<br />
<br />
<strong>The HTML to XHTML headache:<br />
What needs to change</strong>
<hr />
Converting a document from HTML 4.0 to XHTML 1.0 will not be a totally painless affair - some changes WILL need to be made.
<ul>
<li><strong>An XHTML document <em>MUST</em> be well-formed XML</strong><br />
It must conform to basic XML syntax. If it does not, the XML parser does not have an obligation to continue processing the document. Unlike today's HTML parsers, an XML parser will not try to recover and "guess" what you meant if the syntax is incorrect.</li>
<li><strong>&lt;html&gt; <em>MUST</em> be the top-level element.</strong><br />
Not a change from HTML, but there are quite a few documents out there that neglect this important point.</li>
<li><strong>Element and attribute names <em>MUST</em> be in lower case</strong><br />
HTML is not case-sensitive; XML is.</li>
<li><strong>Attribute values <em>MUST</em> be quoted</strong></li>
<li><strong>End tags are required for non-empty elements</strong><br />
They are no longer optional.<br />
<span class="alert2">Affected Elements:</span> basefont, body, colgroup, dd, dt, head, html, li, p, rt, spacer, tbody/thead/tfoot, th/td, tr</li>
<li><strong>All empty elements must use the XML "empty tag" syntax</strong><br />
XML empty elements are explicitly closed with a trailing forward slash ("/") before the end bracket (eg: &lt;br&gt; becomes &lt;br /&gt;)<br />
<span class="alert2">Affected Elements:</span> area, base, bgsound, br, col, frame, hr, img, input, isindex, keygen, link, meta, option, param, wbr</li>
<li><strong>XML does not allow attribute minimization.</strong><br />
Stand-alone attributes must be expanded (eg: &lt;td nowrap&gt;cell&lt;/td&gt; becomes &lt;td nowrap="nowrap"&gt;cell&lt;/td&gt;)</li>
<li><strong>Whitespace handling in attribute values is different in XML.</strong><br />
Leading/trailing spaces are truncated, and multiple spacing characters within the attribute value are collapsed to single spaces.</li>
<li><strong>Script sections should be wrapped in XML CDATA sections</strong></li>
<li><strong>SGML DTD exclusions are not possible in XML, but they should still be observed as "good practice".</strong><br />
<span class="alert2">Not allowed to nest within themselves:</span> a, button, form, label<br />
<span class="alert2">Pre exclusions:</span> big, img, object, small, sub, sup<br />
<span class="alert2">Button exclusions:</span> fieldset, form, iframe, input, label, select, textarea</li>
</ul>
Several of the above changes are to require certain features that were optional in the SGML world, or are optional in current usage because of historical leniency in implemented HTML parsers. When something becomes optional, people tend to abuse it. XML parsers will be very strict regarding these changes. In theory, any of these changes should <em>NOT</em> make documents unreadable by current browsers.<br />
<br />
<strong>HTML Tidy</strong>
<hr />
Dave Raggett (the co-author or primary author of the HTML 3.0, 3.2 and 4.0 specs) has created a free little program that converts an HTML page to XHTML for you, along with correcting many common authoring mistakes. See <a href="http://www.w3.org/People/Raggett/tidy/">http://www.w3.org/People/Raggett/tidy/</a> for more details.<br />
[This is not intended to be a product plug, merely a pointer toward a helpful tool.]<br />
<br />
<strong>Why XHTML is important</strong>
<hr />
The world of the web is changing, as are the browsers that access it. HTML has needed to change for quite some time in order to keep up, but it didn't have the power to do so. Changing HTML 4.0 into XHTML 1.0 will give it the power it needs to adapt today and to flourish in the future.</td>
</tr>
<tr>
<td><hr /></td>
</tr>
</tbody>
</table>

\
[Boring Copyright Stuff...](../misc/copyright.htm)\
