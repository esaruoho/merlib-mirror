---
title: "Dobe Doinat's Punny Name Archive using XML and ADO"
source_domain: amasci.com
source_path: ~dobe/PNADataIsland.htm
order: 2767
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T17:09:12Z
extractor: site_to_paper.py (pandoc)
---

# Dobe Doinat's Punny Name Archive using XML and ADO

*Source page: `~dobe/PNADataIsland.htm`*

<div id="PNADataIsland_Start">

</div>

|                                           |
|:------------------------------------------|
| Dobe Doinat's Punny Name XML Data Islands |

### Demonstration of Data Binding using XML and ADO

\

<table data-border="1" width="50%" data-align="center">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td width="50%">Index #:</td>
<td width="50%"><strong><span data-datasrc="#xmlPNA" data-datafld="PNAindexNum"></span></strong></td>
</tr>
<tr>
<td>First:</td>
<td><strong><span data-datasrc="#xmlPNA" data-datafld="PNAfirst_name"></span></strong></td>
</tr>
<tr>
<td>Second:</td>
<td><strong><span data-datasrc="#xmlPNA" data-datafld="PNAmid1_name"></span></strong></td>
</tr>
<tr>
<td>Third:</td>
<td><strong><span data-datasrc="#xmlPNA" data-datafld="PNAmid2name"></span></strong><br />
</td>
</tr>
<tr>
<td>Last:</td>
<td><strong><span data-datasrc="#xmlPNA" data-datafld="PNAlast_name"></span></strong></td>
</tr>
<tr>
<td>Census #:</td>
<td><strong><span data-datasrc="#xmlPNA" data-datafld="PNAcensusNum"></span></strong></td>
</tr>
<tr>
<td>Literal:</td>
<td><strong><span data-datasrc="#xmlPNA" data-datafld="PNAliteral"></span></strong></td>
</tr>
<tr>
<td>Ranking:</td>
<td><strong><span data-datasrc="#xmlPNA" data-datafld="PNAranking"></span></strong></td>
</tr>
<tr>
<td>Notes:</td>
<td><strong><span data-datasrc="#xmlPNA" data-datafld="PNAnotes"></span></strong></td>
</tr>
</tbody>
</table>

\
\

                             \
<span class="small">Use these buttons to scroll up and down the PNA List</span>\
[Matt Mason found a bug in this code in May. See description below!](#PNADataIsland_JSEventCode)

### Setting the XML source file

> Using an inline xml tag, the src attribute sets the URL to the XML data file, while the id attribute provides a unique value used by the \<span\> tag as an internal link.\
> \
>
> <table data-border="1">
> <colgroup>
> <col style="width: 100%" />
> </colgroup>
> <tbody>
> <tr>
> <td><blockquote>
> <br />
> &lt;!-- //PNA500_XML.XML is a <strong>raw XML</strong> file, without XSLT transformations --&gt;<br />
> <br />
> &lt;xml <strong>id="xmlPNA"</strong> src="PNA500_XML.XML"&gt;<br />
> &lt;/xml&gt;
> </blockquote>
> <strong></strong></td>
> </tr>
> </tbody>
> </table>

### Setting the \<span\> element's **datasrc** and **datafld** attributes

> XML data will be inserted into the **placeholder \<span\> tag position**, since it is being used for **data binding**. The **datasrc attribute** links to the **inline \<xml\> tag**, using the \<xml\> tag **id value**. Recall that the use of the pound sign \# to denote the link, means it is internal to the page, rather than an external file. It is the **datafld attribute** that <u>binds the xml data value to the span tag</u>.\
> \
>
> <table data-border="1">
> <colgroup>
> <col style="width: 100%" />
> </colgroup>
> <tbody>
> <tr>
> <td><blockquote>
> <br />
> Index #: &lt;span datasrc="#xmlPNA" datafld="PNAindexNum"&gt;&lt;/span&gt;<br />
> First: &lt;span datasrc="#xmlPNA" datafld="PNAfirst_name"&gt;&lt;/span&gt;<br />
> Second: &lt;span datasrc="#xmlPNA" datafld="PNAmid1_name"&gt;&lt;/span&gt;<br />
> Third: &lt;span datasrc="#xmlPNA" datafld="PNAmid2name"&gt;&lt;/span&gt;<br />
> Last: &lt;span datasrc="#xmlPNA" datafld="PNAlast_name"&gt;&lt;/span&gt;<br />
> Census #: &lt;span datasrc="#xmlPNA" datafld="PNAcensusNum"&gt;&lt;/span&gt;<br />
> Literal: &lt;span datasrc="#xmlPNA" datafld="PNAliteral"&gt;&lt;/span&gt;<br />
> Ranking: &lt;span datasrc="#xmlPNA" datafld="PNAranking"&gt;&lt;/span&gt;<br />
> Notes: &lt;span datasrc="#xmlPNA" datafld="PNAnotes"&gt;&lt;/span&gt;
> </blockquote></td>
> </tr>
> </tbody>
> </table>

## Setting the User buttons

> The **Buttons** clicked by the User, are events that are responded to by Client-Side JavaScript.
>
> <table data-border="1">
> <colgroup>
> <col style="width: 100%" />
> </colgroup>
> <tbody>
> <tr>
> <td><blockquote>
> <br />
> &lt;center&gt;<br />
>     &lt;input type="button" value="<strong>First</strong>" onclick="First()" /&gt;<br />
>     &lt;input type="button" value="<strong>Previous</strong>" onclick="Previous()" /&gt;<br />
>     &lt;input type="button" value="<strong>Next</strong>" onclick="Next()" /&gt;<br />
>     &lt;input type="button" value="<strong>Last</strong>" onclick="Last()" /&gt;<br />
> &lt;br /&gt;<br />
> &lt;small&gt;Use these buttons to scroll up and down the PNA List&lt;/small&gt;<br />
> &lt;/center&gt;
> </blockquote></td>
> </tr>
> </tbody>
> </table>

## Here's the JavaScript Event Code

> The **Button-click Event** code contained in this page:
>
> <table data-border="1">
> <colgroup>
> <col style="width: 100%" />
> </colgroup>
> <tbody>
> <tr>
> <td><blockquote>
> <p><br />
> &lt;!-- you can use either the JavaScript or JScript language --&gt;<br />
> <strong>&lt;script language="JavaScript"&gt;</strong><br />
> &lt;!-- // Hide<br />
> // MoveFirst() and MoveLast() are methods of the <strong>ADO Recordset object</strong><br />
> // MoveNext() and MovePrevious() are methods of the ADO Recordset object<br />
> // RecordCount and AbsolutePosition are properties of the ADO Recordset object<br />
> </p>
> <blockquote>
> <hr />
> // NOTE! On May 18th and 19th, 2002,<br />
> // <strong>Matt Mason &lt;m.mason@PalmBasket.com&gt;</strong><br />
> // sent me emails to the effect that:<br />
> <br />
> <em>// "if you click the LAST button then<br />
> // the FIRST button it does not<br />
> // revert to the first button.<br />
> <br />
> // You must click the PREV button first and then<br />
> // the FIRST button works...."<br />
> <br />
> // I believe your IF statement is wrong and should read:<br />
> <br />
> // if(count <em>&gt;=</em> xmlPNA.recordset.AbsolutePosition)<br />
> // xmlPNA.recordset.moveFirst();</em><br />
> <br />
> //    Thank you, Matt!     Good troubleshooting!
> <hr />
> </blockquote>
> <p><br />
>   function <strong>First()</strong><br />
>   {<br />
> // Do not allow a move past the first record!<br />
> <em>// Should be greater than or equal to (&gt;=)</em><br />
>     <strong>var count=xmlPNA.recordset.RecordCount<br />
>     if(count <em>&gt;=</em> xmlPNA.recordset.AbsolutePosition)<br />
>     xmlPNA.recordset.moveFirst();</strong><br />
>   }<br />
> <br />
>   function <strong>Previous()</strong><br />
>   {<br />
> // we do not allow a move to before the first record<br />
>     <strong>if(xmlPNA.recordset.AbsolutePosition &gt; 1)<br />
>     xmlPNA.recordset.movePrevious();</strong><br />
>   }<br />
> <br />
>     function <strong>Next()</strong><br />
>   {<br />
> // we do not allow a move past the last record<br />
>     <strong>var count=xmlPNA.recordset.RecordCount<br />
>     if(count &gt; xmlPNA.recordset.AbsolutePosition)<br />
>     xmlPNA.recordset.moveNext();</strong><br />
>   }<br />
> <br />
>     function <strong>Last()</strong><br />
>   {<br />
> // we do not allow a move past the last record<br />
>     <strong>var count=xmlPNA.recordset.RecordCount<br />
>     if(count &gt; xmlPNA.recordset.AbsolutePosition)<br />
>     xmlPNA.recordset.moveLast();</strong><br />
>   }<br />
> --&gt;<br />
> <strong>&lt;/script&gt;</strong><br />
> <br />
> </p>
> </blockquote></td>
> </tr>
> </tbody>
> </table>

## What the XML file looks like

> The **Buttons** clicked by the User, are events that are responded to by Client-Side JavaScript.
>
> <table data-border="1">
> <colgroup>
> <col style="width: 100%" />
> </colgroup>
> <tbody>
> <tr>
> <td><blockquote>
> <br />
> &lt;PNA&gt;<br />
>   &lt;PNArecord&gt;<br />
>     &lt;PNAindexNum&gt;<strong>1</strong>&lt;/PNAindexNum&gt;<br />
>     &lt;PNAfirst_name&gt;<strong>Buddy</strong>&lt;/PNAfirst_name&gt;<br />
>     &lt;PNAmid1_name&gt;&lt;/PNAmid1_name&gt;<br />
>     &lt;PNAmid2_name&gt;&lt;/PNAmid2_name&gt;<br />
>     &lt;PNAlast_name&gt;<strong>System</strong>&lt;/PNAlast_name&gt;<br />
>     &lt;PNAcensusNum&gt;<strong>0</strong>&lt;/PNAcensusNum&gt;<br />
>     &lt;PNAliteral&gt;<strong>Buddy system</strong>&lt;/PNAliteral&gt;<br />
>     &lt;PNAranking&gt;<strong>9</strong>&lt;/PNAranking&gt;<br />
>     &lt;PNAnotes&gt;<strong>Any applicable notes</strong>&lt;/PNAnotes&gt;<br />
>   &lt;/PNArecord&gt;<br />
> &lt;PNA&gt;<br />
> &#10;</blockquote></td>
> </tr>
> </tbody>
> </table>

<table id="dobeXHTML_IntroPara" width="100%" cols="2" rows="1" data-border="0" data-cellpadding="10">
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
<a href="#PNADataIsland_Start"></a>
<strong>Back to the Beginning of this page</strong></td>
</tr>
</tbody>
</table>
