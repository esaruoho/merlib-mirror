<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
<!-- New format for Dobe's Punny Name Archive on 12-24-2001 -->
<!-- Hand-written XHTML, XML, XSLT, CSS and JS suite -->
	 <!-- filename: PNA_XMLNXML_XSL.XSL -->
<!-- 
		Dobe Doinat's Punny Name Archive
		MegaloMedia Copyright January 07, 2002
		John W. Hartman (Dobe Doinat)
		http://www.eskimo.com/~dobe/
		mailto://dobe@eskimo.com
		IDE of choice: XMLWriter, Wattle Software
		ISP of choice: eskimo.com, Bob is Everywhere! 
-->
	<!-- ~use with "PNA_XMLnXML_XML.xml"~ -->
<COMMENT>The &lt;COMMENT&gt; element pair as used in this stylesheet is outside the namespace of XSL.</COMMENT>
<COMMENT>	XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
		It is therefore used to ANNOTATE the stylesheet, rather than COMMENT, the stylesheet.
			XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
</COMMENT>

<xsl:template match="/">

 <html xmlns="http://www.w3.org/1999/xhtml">

  <head>
	<!--  *****Calling a JavaScript file*****  -->
	<script type="text/javascript" src="write_MenuLinks_EN.js">
	   <xsl:comment>
	     <![CDATA[
	     ]]>
	   </xsl:comment>
	</script>

   <title>XML/XSLT/XPATH Glossary, Definitions, Syntax and Usage</title>
   
    <COMMENT>This is outside of the namespace of the current XSL namespace.</COMMENT>
    <!-- Call an external CSS stylesheet for mundane output of XHTML, if required... -->
    <!-- link rel="stylesheet" type="text/css" href="PNA_XMLnXML_CSS.css" / -->
    <!-- I'll use an internal CSS format for this project. -->
    <style type="text/css">
      a:link {color:red; text-decoration:underline; }
      a:visited {color:red; text-decoration:underline;}
      a:active {color:brown; text-decoration:none; background:red;}
      blockquote {font-size:80%; color:brown; margin-left:5%; margin-right:5%;}
      div.indent10 {font-size:100%; margin-left: 10%;}
      div.mouseOverInit {font-size:250%; color: brown;}
      div.noindent {font-size:100%;}
	     div.small_70 {font-size:70%; color:brown;}
	     div.small_80 {font-size:80%; color:brown;}
      body {font-family:Verdana; background:ghostwhite; margin-left:5%; margin-right:5%;}
      h1 {font-size:200%; color: brown;}
      h2 {font-size:150%; color: brown;}
      h3 {font-size:90%; color: brown;  margin-left: 5%;}
      h3.note {font-size:80%; color: darkbrown;  margin-left: 5%;}
      h3.INTRO {font-size:160%; color: red;}
      h3.KeyWord {font-size:110%; color: darkbrown;}
      h4 {font-size:90%; color: red; margin-left: 5%; font-weight:bold;}
      hr.midHR {width:80%; color: darkbrown; margin-left: 10%;}
      hr.myHorizontalRuleStyle40 {width:40%; color: black;}
      hr.myHorizontalRuleStyle60 {width:60%; color: brown;}
      hr.myHorizontalRuleStyle60Red {width:60%; color: red;}
      hr.myHorizontalRuleStyle80Red {width:80%; color: red;}
      hr.myHorizontalRuleStyle80 {width:80%; color: darkbrown;}
      hr.myHorizontalRuleStyle100 {width:100%; color: brown;}
      li {font-size:70%; color:darkbrown;}
      small {font-size:75%; color:darkbrown; font-weight:bold;}
      span.INTRO {font-size:90%; color: darkbrown; cursor:help;}
      span.BODYTEXT {font-size:80%; color: darkbrown; margin-left: 5%;}
      span.EXAMPLE {font-size:80%; color: darkbrown; margin-left: 15%;}
      span.StartLink {font-size:100%; color: darkbrown;}
      span.keyword {font-size:300%; color: red;}
      span.record {font-size:80%; color: darkbrown;}
      span.links {font-size:60%; color: darkbrown;}
      span.red {font-size:90%; color: red; font-weight:bold;}
      span.green {font-size:90%; color: green; font-weight:bold;}
      span.black {font-size:90%; color: black; font-weight:bold;}
      span.brown {font-size:90%; color: brown; font-weight:bold;}
      span.yellow {font-size:90%; color: yellow; font-weight:bold;}
      span.purple {font-size:90%; color: yellow; font-weight:bold;}
      span.italic {font-size:90%; color: darkbrown; font-style:italic;}
      span.bold {font-size:90%; color: darkbrown; font-weight:bold;}
      td.topics {font-size:70%; color: brown; font-weight:bold;}
      td.small_70bi {font-size:70%; color: brown; font-style:italic;}
      ul {margin-left: 5%;}
     </style>
   	</head>
   	
<!-- //BODY!//BEGIN!//BODY!//BEGIN!//BODY!//BEGIN!//BODY!//BEGIN!//BODY!//BEGIN!// -->
	<body><div id="_XMLnXML_Start"></div>
<!-- // -->
	<h2 title="This field is set in the XML file and called with the line: &#xA0;&#xA0;&#xA0;'&lt;xsl:value-of select='/dobedoc/title' /&gt;'">
	<xsl:value-of select="/dobedoc/title" />
	</h2>
        
<!-- A few notes on this particular set of XML/XSLT documents and XML/XSLT documents in general. -->
      <h3 title="This field is set in the XML file and called with the line: &#xA0;&#xA0;&#xA0;'&lt;xsl:value-of select='/dobedoc/last_updated' /&gt;'">
      Last updated: 
      <xsl:value-of select="/dobedoc/last_updated" />
      </h3>
<!-- //                                                                                        -->
<hr class="dobeStyle" />
      
<!-- Setting up internal hyperlinks -->
   <ul type="square">
    <li> <a href="#_1_03_dobeXML_IntroPara"
            title="A very brief explanation of XML">
            Introduction</a>
    </li>
    <li> <a href="#_1_03_dobeXML_IntroPara_II"
            title="A very brief explanation of XML">
            Extensible Markup Language</a>
    </li>
    <li> <a href="#_1_03_dobeXML_Well-Formed"
            title="XLL must be 'Well-Formed'">
            Well-Formed XML</a>
    </li>
    <li> <a href="#_1_03_dobeXML_Valid"
            title="Whether XML documents comply with their DTD determines it's validity.">
            Valid XML</a>
    </li>
    <li> <a href="#_1_03_dobeXML_DTD"
            title="Document Type Definitions may give way to XML Schemas in a W3C recommendation soon.">
            XML DTD</a>
    </li>
    <li> <a href="#_1_03_dobeXML_Schema"
            title="A Schema is not a full recommendation yet, but will be soon.">
            XML Schema</a>
    </li>
    <li> <a href="#XMLWebLinks">
            Additional XML Sites</a>
    </li>
   </ul>

<!-- //                                                                      dobeXML_IntroPara -->
    <blockquote title="NOTE: If you know how I could adapt the above to internal links by modifying the associated XSL stylesheet, please help me out! I experimented quite a bit and it wouldn't work. ">
		  
    	These other topics are also covered in the <a title="Glossary and Tutorial section is generated from XML file, as opposed to being embedded in the XSLT output tree" href="#GlossaryTutorialID">
            Glossary and Tutorial </a>(XML-generated and sorted)
    	<br /><br />
		  <table border="0" width="90%">
		   <tr>
		    <td class="topics" width="35%">
			 &quot;Valid&quot; <br />
			 &quot;Well-formed&quot; <br /><br /><br />
			 &quot;XSLT Data Types&quot; <br />
			 &quot;XSLT Data Types&quot; <br />
			 &quot;XSLT Expressions&quot; <br />
			 &quot;XSLT Pattern Examples&quot; <br />
			 &quot;XSLT Pattern Syntax&quot; <br />
			 &quot;XSLT Variables&quot; <br />
		    </td>
		    <td class="topics" width="35%">
			 &quot;xsl:apply-templates&quot; <br />
			 &quot;xsl:attribute&quot; <br />
			 &quot;xsl:cdata&quot; <br />
			 &quot;xsl:choose&quot; <br />
			 &quot;xsl:comment&quot; <br />
			 &quot;xsl:copy&quot; <br />
			 &quot;xsl:define-template-set&quot; <br />
			 &quot;xsl:element&quot; <br />
			 &quot;xsl:entity-ref&quot; <br />
			 &quot;xsl:eval&quot; <br />
		    </td>
		    <td class="topics" width="30%">
			 &quot;xsl:for-each&quot; <br />
			 &quot;xsl:if&quot; <br />
			 &quot;xsl:otherwise&quot; <br />
			 &quot;xsl:pi&quot; <br />
			 &quot;xsl:script&quot; <br />
			 &quot;xsl:stylesheet&quot; <br />
			 &quot;xsl:template&quot; <br />
			 &quot;xsl:value-of&quot; <br />
			 &quot;xsl:when&quot; <br />
		    </td>
		   </tr>
		  </table>
     </blockquote>
 <table width="100%" cols="2" rows="1" border="0" cellpadding="10" id="_1_03_dobeXML_IntroPara">
   <tr>
   <td valign="top" align="left" width="65%">
    <h2 title="The ASCII of the future!"><b>Introduction</b></h2>

   </td>
   <td valign="top" align="center" width="35%">
   <a href="#_XMLnXML_Start"><small>Start of this page</small></a><br />
   </td>
  </tr>
 </table>
     
    <blockquote>
    
      &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
      This paragraph (and everything inside this introductory portion) is written as text 
      in a file with an extension of <b>".XSL"</b>,  which means, if it is <b>valid</b>,
      that it is an XML <b>stylesheet</b> used to output, (transformed or formatted), 
      XML data in a pleasing, human-readable format,
      namely in a web browser, as XHTML, a subset of XML, 
      which makes it nearly universally accessable.<br /><br />

      &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;This first section is written in the "root" rule, or template, in the XSLT
      stypesheet. I can display any part of the XML here. For instance, the first line is derived from the title element
      within the XML document, with the line:<br />
      &#160;&#160;&#160;&#160;<b>&lt;h2&gt;&lt;xsl:value-of select="/dobedoc/title"/&gt;&lt;/h2&gt;</b>,<br />
      just inside the table, which is just after the &lt;body&gt; element, written in the XSLT root template for output as HTML.<br /><br />

      &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;Additionally, the statement (contained in the XSLT root template):<br />
      &#160;&#160;&#160;&#160;<b>&lt;h3&gt;Last updated: &lt;xsl:value-of select="/dobedoc/last_updated"/&gt;&lt;/h3&gt;</b><br />
      allows inclusion of the '<b>last_updated</b>' element's text character value to be displayed next, formatted as an &lt;h3&gt; element,
      defined in the internal CSS style (written within the XSLT root template) element pair..<br /><br />

      &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;The following text below this table is entirely contained in a file called '<b>_XMLnXML_XML.xml</b>'. What you see below
      is not necessarily in the same order as it's source, and not all of the source may be displayed at any one time. Then again, it may
      resemble it quite closely. It is all formatted in a file called '<b>_XMLnXML_XSL.xsl</b>' which makes use of internal
      CSS formatting and transformation to XHTML-compliancy for display in a Browser. It is validated by a file called
      '<b>_XMLnXML_DTD.dtd</b>', which is a Document Type Definition file. As more and more template rules get written
      in the XSL document, the final display, either within the XSLT engine, such as within <b>MSIE 5.X</b>, where the documents are
      merged and rendered instantaneously, or later, inserting an <b>xsl:output</b> statement in a tool which will then
      permanently write the result tree to a file with an .HTML extension.<br /><br />

      &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;To include <b>VBScript, JavaScript, ECMAScript or JScript</b>
      functions and calls, the books say t use the <b>xsl:eval</b> element. There is a good VBS example included. 
      There is another way, which I am using in this page, see the source (or look at <b>xsl:comment</b> below) to 
      how it is accomplished! To include JavaScript in the XSLT document, I didn't use 
      the <b>xsl:eval</b> element at all!
      <br /><br />

      &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;To output to a pure HTML file, say in an OUTPUT directory, 
      use the <b>xsl:output</b> element. 
      Or, use a tool which has this as a feature of the IDE, such as the tool I am using now, which 
      is <b>XMLWriter</b>, by 
      <a title="Really, it's a great tool, and I think it was only $35 US in 2000." href="http://XMLWriter.net">
      <b>Wattle Software</b>
      </a>, which can convert the XSLT+XML combination into a static XHTML without the <b>xsl:output</b> element.
      <br /><br />
      
     </blockquote>
 

<!-- Heading Table with called link (#id) -->
 <table width="100%" cols="2" rows="1" border="0" cellpadding="10" id="_1_03_dobeXML_IntroPara_II">
   <tr>
   <td valign="top" align="left" width="65%">
    <h2 title="The ASCII of the future!"><b>Extensible Markup Language (XML)</b></h2>

   </td>
   <td valign="top" align="center" width="35%">
   <a href="#_XMLnXML_Start"><small>Start of this page</small></a><br />
   </td>
  </tr>
 </table>
 <div class="RelativeSize80WithIndent">
 <blockquote>
        &#xA0;&#xA0;&#xA0;&#xA0;A class of data objects called <em>XML documents</em> are stored 
        on computers, and partially describe the behavior of programs that process these objects. 
        <strong>XML</strong> is a subset or restricted form of SGML, the Standard Generalized Markup Language (ISO 8879). 
        The goal is to enable generic XML or SGML to be served, received, and processed over the Web in the way similar HTML. <br />
        &#xA0;&#xA0;&#xA0;&#xA0;That said, <b>the bottom line is to separate data and formatting</b>. That way, only 
        data is maintained in an xml file and all the formatting and transformations of that
        data can be done in a separate file. Voila! One set of data, but display 
        (or leverage in some other bleeding edge technology) that data in many different ways and formats!<br />
        &#xA0;&#xA0;&#xA0;&#xA0;<b>XML has specific syntax such as:</b>  <br />
         <ul>

          <li> All start tags must begin with &quot;&lt;&quot; and end with &quot;&gt;&quot;.
          </li>

          <li>Each element MUST have both a start element and an end element.
          </li>

          <li>XML does NOT require that a Document Type Definition (DTD) be present, &#xA0;
          (although there are provisions for both internal and external DTDs).</li>
          <li>While references to the XML namespace are not REQUIRED, &#xA0;
          namespaces let the processing application know which DTD you're using, 
          so you may utilize the markup from several different DTDs in the same document! 
          Namespaces are really just a unique identifier which links an XML markup
          element to a specific DTD. <br />
          Two <b>predefined namespaces</b> in XML are:<br />
          &#xA0;&#xA0;&#xA0;&#xA0;&quot;<b>xml:lang</b>&quot;&#xA0; and 
          &#xA0;&#xA0;&#xA0;&#xA0;&quot;<b>xml:space</b>&quot;&#xA0;</li>
          <li>XML elements are <b>case sensitive</b>! &lt;root &gt; and &lt;ROOT &gt; are NOT the same!</li>
          <li>ALL attributes values MUST be contained within &quot; quotation marks &quot;.</li>
          <li>The only reserved character references normally &quot;built-in &quot; to an 
          XML parser or browser, are the following: <br />
          &amp;lt; = &lt; &#xA0;&#xA0;&#xA0;,
          &amp;gt; = &gt; &#xA0;&#xA0;&#xA0;,
          &amp;amp = &amp; &#xA0;&#xA0;&#xA0;,
          &amp;apos = &#39; &#xA0;&#xA0;&#xA0;,
          &#xA0;&#xA0;&#xA0;  and &#xA0;&#xA0;&#xA0;
           &amp;quot; = &quot; &#xA0;&#xA0;&#xA0;. 
           <br />Others will have to be built using general entities.</li>
          <li>Elements may not nest out of sequence. &lt;A&gt;.&lt;B&gt; &lt;/A&gt;.&lt;/B&gt; is illegal.</li>
          <li></li>
         </ul>

         The design goals for <strong>XML</strong> are: 
          <ul>
           <li>Straightforwardly usable over the Internet.</li>
           <li>Support a wide variety of applications.</li>
           <li>Shall be compatible with SGML.</li>
           <li>It shall be easy to write programs which process XML documents.</li>
           <li>Optional features should be kept to a minimum, ideally zero.</li>
           <li>XML documents should be human-legible and reasonably clear.</li>
           <li>Design should be able to be prepared quickly.</li>
           <li>Design of XML should be formal and concise.</li>
           <li>Documents shall be easy to create.</li>
           <li>Terseness in markup is of minimal importance.</li>
          </ul>
         Today XML is a W3C Recommendation meaning that XML has been reviewed and approved 
          by the members of the W3C. XML is therefore deemed &quot;stable&quot; and ready for 
          widespread deployment. A Recommendation is the highest level a W3C document 
          can be assigned. XML became a Recommendation on February 10, 1998.
         <a href="http://www.w3.org/TR/1998/REC-xml-19980210">
         Link to the XML specification</a>.
         
 </blockquote>
  </div>



<!-- //                                                                                        -->
<hr class="dobeStyle" />
<!-- //                                                              _1_03_dobeXML_Well-Formed -->

<!-- Heading Table with called link (#id) -->
 <table width="100%" cols="2" rows="1" border="0" cellpadding="10"
        id="_1_03_dobeXML_Well-Formed">
   <tr>
   <td valign="top" align="left" width="65%">
    <h2><b>Well-Formed XML</b></h2>
   </td>

   <td valign="top" align="center" width="35%">
   <a href="#_XMLnXML_Start"><small>Start of this page</small></a><br />
   </td>
  </tr>
 </table>

<div class="RelativeSize80WithIndent">
 <blockquote>
To be a well-formed XML document, it must conform to the rules above, namely:<br />
<ol>
<li>Beginning and ending tags match, properly nested.</li>
<li>Empty tags may follow special XML syntax, although a closing tag is preferable.</li>
<li>All attribute values are contained within 'single' or "double quote marks".</li>
<li>All entities must be declared.</li>
</ol>
 </blockquote>
 </div>



<!-- //                                                                                        -->
<hr class="dobeStyle" />
<!-- //                                                                    _1_03_dobeXML_Valid -->

<!-- Heading Table with called link (#id) -->
 <table width="100%" cols="2" rows="1" border="0" cellpadding="10"
        id="_1_03_dobeXML_Valid">
   <tr>
   <td valign="top" align="left" width="65%">
    <h2><b>Valid XML </b></h2>
   </td>

   <td valign="top" align="center" width="35%">
   <a href="#_XMLnXML_Start"><small>Start of this page</small></a><br />
   </td>
  </tr>
 </table>

<div class="RelativeSize80WithIndent">
 <blockquote>
To be a valid XML document, it must conform to the rules within it's own DTD or schema.<br />
<ol>
<li>DTD may be internal or external.</li>
<li>Schema may be internal or external.</li>
</ol>
 </blockquote>
 </div>


<!-- //                                                                                        -->
<hr class="dobeStyle" />
<!-- //                                                                      _1_03_dobeXML_DTD -->

<!-- Heading Table with called link (#id) -->
 <table width="100%" cols="2" rows="1" border="0" cellpadding="10"
        id="_1_03_dobeXML_DTD">
   <tr>
   <td valign="top" align="left" width="65%">
    <h2><b>DTD</b>&#xA0; <span class="textSmaller">Document Type Definitions</span></h2>
    <ol>
    <li><b>Document Type <em>Definitions</em></b> (<b>DTDs</b>, see below) 
      <ul>
        <li>Are part of the core XML 1.0 specification.</li>
        <li>Are written in a language called <b>Extended Backus-Naur Form </b> or <b>EBNF</b></li>
        <li>Declare what exactly constitutes markup</li>
        <li>Declare exactly what the structure - elements and attributes - mean</li>
        <li>Are similar to a database schema, but is NOT an XML Schema</li>
      </ul>
    </li>
    <li><b>document type <em>declaration</em></b> either: 
      <ul>
        <li>Refers to an external <b>Document Type Definition</b>, (<b>DTD</b>, see above)</li>
        <li>Actually <em>contains</em> a <b>Document Type Definition</b> in the form of markup declarations </li>
        <li>This is confusing, but the dtd contains the DTD!</li>
        <li>That's probably the worst you've got to face, no problem!</li>
      </ul>

    </li>
    </ol>
   </td>

   <td valign="top" align="center" width="35%">
   <a href="#_XMLnXML_Start"><small>Start of this page</small></a><br />
   </td>
  </tr>
 </table>

<div class="RelativeSize80WithIndent">
 <div class="big120biIndent">Use this DTD:</div>
 <blockquote>
&#xA0;&#xA0;&lt;!ELEMENT doc&#xA0;&#xA0;(head, body)&gt;<br />
  &#xA0;&#xA0;&lt;!ELEMENT head&#xA0; (title, date)&gt;<br />
  &#xA0;&#xA0;&lt;!ELEMENT body&#xA0; (para)&gt;<br />
  &#xA0;&#xA0;&lt;!ELEMENT title&#xA0;(#PCDATA)&gt;<br />
  &#xA0;&#xA0;&lt;!ELEMENT date&#xA0; (#PCDATA)&gt;<br />
  &#xA0;&#xA0;&lt;!ELEMENT year&#xA0; (#PCDATA)&gt; &lt;!--Should be a four-digit-year.--&gt;<br />
  &#xA0;&#xA0;&lt;!ELEMENT month&#xA0;(#PCDATA)&gt;<br />
  &#xA0;&#xA0;&lt;!ELEMENT day&#xA0;&#xA0;(#PCDATA)&gt; &lt;!--Should be an integer.--&gt;<br />
  &#xA0;&#xA0;&lt;!ELEMENT para&#xA0; (#PCDATA | bold | italic)*&gt;<br />
  &#xA0;&#xA0;&lt;!ELEMENT bold&#xA0; (#PCDATA)&gt;<br />
  &#xA0;&#xA0;&lt;!ELEMENT italic (#PCDATA)&gt;
 </blockquote>
 <div class="big120biIndent">For this source:</div>
 <blockquote>
  &lt;?xml version='1.0'?&gt;<br />
  &#xA0;&#xA0;&#xA0;&#xA0;&lt;doc&gt;<br />
  &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&lt;head&gt;<br />
  &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&lt;title&gt;title&lt;/title&gt;<br />
  &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&lt;date&gt;<br />
  &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&lt;year&gt;four-digit-year [unknown type]&lt;/year&gt;<br />
  &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&lt;month&gt;month&lt;/month&gt;<br />
  &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&lt;day&gt;123&lt;/day&gt;<br />
  &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&lt;/date&gt;<br />
  &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&lt;/head&gt;<br />
  &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&lt;body&gt;<br />
  &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&lt;para&gt;para and &lt;bold&gt;bold&lt;/bold&gt; and<br />
  &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&lt;italic&gt;italic&lt;/italic&gt;<br />
  &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&lt;/para&gt;<br />
  &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&lt;/body&gt;<br />
  &#xA0;&#xA0;&#xA0;&#xA0;&lt;/doc&gt;
 </blockquote> 
 </div>


<!-- //                                                                                        -->
<hr class="dobeStyle" />
<!-- //                                                                   _1_03_dobeXML_Schema -->

<!-- Heading Table with called link (#id) -->
 <table width="100%" cols="2" rows="1" border="0" cellpadding="10"
        id="_1_03_dobeXML_Schema">
   <tr>
   <td valign="top" align="left" width="65%">
    <h2><b>XML Schema</b></h2>
   </td>

   <td valign="top" align="center" width="35%">
   <a href="#_XMLnXML_Start"><small>Start of this page</small></a><br />
   </td>
  </tr>
 </table>

To describe a particular <b>namespace</b>:
<h3 class="normalIBrown"><big><b>SchemaName.xsd</b></big>&#xA0;&#xA0;&#xA0;file:</h3>
      <ul>
        <li>
        &#xA0;&#xA0;&#xA0;
        &lt;schema <b>targetNamespace</b> = &quot;urn:PunnyNameArchive:<b>PNA</b>&quot; <br />
        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        xmlns:<b>PNA</b> = &quot;http://www.PunnyNameArchive.com/PNA&quot; <br />
        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        xmlns:<b>xsd</b> = &quot;http://www.w3.org/1999/XMLSchema&quot; <br />
        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        xmlns:<b>dt</b> = &quot;http://www.w3.org/1999/XMLSchema/datatypes&quot;&gt; <br />
        &#xA0;&#xA0;&#xA0;
        &lt;element name = &quot;<b>FullName</b>&quot; type = &quot;<b>PNA:FullNameType</b>&quot;&#xA0;/&gt;<br />
        &#xA0;&#xA0;&#xA0;
        &lt;element name = &quot;<b>Literal</b>&quot; type = &quot;<b>xsd:string</b>&quot;&#xA0;/&gt;<br />
        &#xA0;&#xA0;&#xA0;
        &lt;element name = &quot;<b>date</b>&quot; type = &quot;<b>xsd:date</b>&quot;&#xA0;/&gt;<br />

<blockquote>
        &#xA0;&#xA0;&#xA0;
        &lt;<b>complexType</b> name= &quot;<b>FullNameType</b>&quot;&gt;<br />
        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        &lt;element name = &quot;<b>FirstName</b>&quot; type = &quot;xsd:string&quot;&#xA0;/&gt;<br />
        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        &lt;element name = &quot;<b>SecondName</b>&quot; type = &quot;xsd:string&quot;&#xA0;/&gt;<br />
        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        &lt;element name = &quot;<b>ThirdName</b>&quot; type = &quot;xsd:string&quot;&#xA0;/&gt;<br />
        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        &lt;element name = &quot;<b>LastName</b>&quot; type = &quot;xsd:string&quot;&#xA0;/&gt;<br />
        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        &lt;element name = &quot;<b>CensusRank</b>&quot; type = &quot;xsd:string&quot;&#xA0;/&gt;<br />
        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        &lt;element name = &quot;<b>PNARanking</b>&quot; type = &quot;<b>dt:decimal</b>&quot;&#xA0;/&gt;<br />
        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        &lt;element name = &quot;<b>Literal</b>&quot; type = &quot;xsd:string&quot;&#xA0;/&gt;<br />
        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        &lt;element name = &quot;<b>FullNameString</b>&quot; type = &quot;xsd:string&quot;&#xA0;/&gt;<br />
        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        &lt;element name = &quot;<b>PNComment</b>&quot; type = &quot;xsd:string&quot;&#xA0;/&gt;<br />
        &#xA0;&#xA0;&#xA0;
        &lt;<b>/complexType</b>&gt;<br />
</blockquote>
        <br /></li>
      </ul>
  <h3 class="normalIBrown"><big><b>PNAInstanceName.xml</b></big>&#xA0;&#xA0;&#xA0;file:</h3>
      <ul>
        <li>
        &#xA0;&#xA0;&#xA0;
        &lt;<b>?xml version = &quot;1.0&quot;?</b>&gt; <br />
        &#xA0;&#xA0;&#xA0;
        &lt;<b>PN</b> xmlns = &quot;http://www.PunnyNameArchive.com&quot; <br />
        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        xmlns:PNA = &quot;urn:PunnyNameArchive:<b>PNA</b><br />
        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        xmlns:xsi = &quot;http://www.w3.org/1999/XMLSchema/instance&quot; <br />
        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        xsi:schemaLocation = &quot;urn:PunnyNameArchive:<b>PNA</b><br />
        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        http://www.PunnyNameArchive.com/PNA/<b>SchemaName.xsd</b>&quot;&gt; <br />

<blockquote>
        &#xA0;&#xA0;&#xA0;
        &lt;<b>PNA:FullNameType</b> &gt;<br />
 
        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        &lt;PNA:FirstName &gt;<b>&#xA0;Webb</b>&#xA0;&#xA0;
        &lt;/PNA:FirstName &gt;<br />

        &#xA0;&#xA0;&#xA0;
        &lt;!-- // Optional SecondName, ThirdName--&gt;<br />

        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        &lt;PNA:LastName &gt;<b>&#xA0;Paige</b>&#xA0;&#xA0;
        &lt;/PNA:LastName &gt;<br />

        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        &lt;PNA:CensusRank &gt;<b>&#xA0;05678</b>&#xA0;&#xA0;
        &lt;/PNA:CensusRank &gt;<br />

        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        &lt;PNA:PNARanking &gt;<b>&#xA0;8.8</b>&#xA0;&#xA0;
        &lt;/PNA:PNARanking &gt;<br />

        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        &lt;PNA:FullNameStringLiteral &gt;<b>&#xA0;Web Page</b>&#xA0;&#xA0;
        &lt;/PNA:FullNameStringLiteral &gt;<br />

        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
        &lt;PNA:PNComment &gt;<em><b>&#xA0;Related to Paige Lincoln</b></em>&#xA0;&#xA0;
        &lt;/PNA:PNComment &gt;<br />

        &#xA0;&#xA0;&#xA0;
        &lt;<b>/PNA:FullNameType</b> &gt;
</blockquote>

        &#xA0;&#xA0;&#xA0;
        &lt;<b>/PN</b>&gt;<br />
        </li>
      </ul>

<br />
  <h3 class="normalIBrown">&#xA0;&#xA0;&#xA0;<big><b>Schema</b></big>&#xA0;:&#xA0;&#xA0;</h3>
<h3 class="normalIBrown">(When comparing a <b>Schema</b> and a <b>DTD </b> for the same XML document)</h3> 
      <ul>
        <li>May contain much more information than a DTD.</li>
        <li>Is actually an <b>XML</b> document itself and must be well-formed.</li>
        <li>Is not yet recommended by the <b>W3C</b>.</li>
        <li>Is not lacking in describing <b>data types</b>, (as opposed to a <b>DTD</b>).</li>
        <li>Is <b>based on a working draft</b>, so may change over time.</li>
        <li>Uses a file extension of &quot;<b>.XSD</b>&quot; .</li>
        <li>Acts upon an <b>instance</b> document (Source.xml).</li>
      </ul>

<br />
  <h3 class="normalIBrown"><big><b>Using Multiple Schemas</b></big>&#xA0;:&#xA0;&#xA0;</h3>
      <ul>
        <li>Use <b>&#xA0;schemaLocation&#xA0;</b> directive to 
        <b>&#xA0;import&#xA0;</b> &#xA0; or &#xA0; <b>&#xA0;include&#xA0;</b> 
        one schema document into another (at parsetime).<br />
      </li>
      <li>
        &lt;<b>import</b> &#xA0;namespace = &quot;urn:SomeOtherNameSpace:foobar&quot; .<br />
  &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
schemaLocation = &quot;http://www.Snafu.com/xsl-schemas/<b>SnafuSchemaName.xsd</b>&quot;&gt; <br />
      </li>
        <li>
        &lt;<b>include</b> &#xA0;schemaLocation = 
        &quot;http://www.PunnyNameArchive.com/PNA/common/<b>AnotherLocalSchemaName.xsd</b>&quot;&gt; <br />
        </li>
      </ul>

<br />
  <h3 class="normalIBrown"><big><b>Datatypes</b></big>&#xA0;:&#xA0;&#xA0;</h3>
   <ul>
   <li>A datatype is a set of distinct values, called its <b>value space</b></li>
   <li>A datatype is a set of lexical representations, called its <b>lexical space</b></li>
   <li>A datatype is a set of <b>facets</b> that characterize properties of the value space, individual values or lexical items</li>
   <li><b>List datatypes</b> are those having values which consist of a finite-length 
   		sequence of values of an <b>atomic datatype</b></li>
   <li><b>A pattern is a constraint</b> on the value space of a datatype 
which is achieved by <b>constraining the lexical space</b> to literals which match a specific pattern.</li>
   <li><b>The value of pattern must be a regular expression</b></li>
   <li>If {variety} is a list, then {variety} of {base type definition} must be <b>atomic</b></li>
   <li><b>A constraining facet</b> is an optional property that can be applied to 
a datatype to constrain its <b>value space</b></li>
   </ul>
 

<!-- //                                                                                        -->
<hr class="dobeStyle" />





<!-- // -->
<h3 id="XMLWebLinks">Other Useful XML Web Links:</h3>

          <ul>
	       <li><b><a href="http://www.w3.org/">W3C.ORG</a></b>, Standards Organization</li>
	       
           <li>Robin Cover's XML Website: <a href="http://www.oasis-open.org/cover/">
           http://www.oasis-open.org/cover/</a></li>

           <li>GCA's XML Files On-line Newsletter: 
           <a href="http://www.gca.org/whats_xml/whats_xml_xmlfiles.htm">
           http://www.gca.org/whats_xml/whats_xml_xmlfiles.htm</a></li>

           <li>Seybold's XML.com: <a href="http://www.xml.com/xml/pub/">
           http://www.xml.com/xml/pub/</a></li>

      	   </ul>

<!-- // -->
     
         <hr class="myHorizontalRuleStyle" align="center" />
     <h1 id="GlossaryTutorialID" title="A review of XML Syntax and Terms, entirely written in XML, DTD, CSS and XSLT">
     	Glossary &amp; Tutorial</h1>
     <h3>Next section generated entirely from an XML file</h3>





   <xsl:apply-templates />
   
   
   
   
   
   
   
   <!-- //Footer -->
 <table width="100%" cols="2" rows="1" border="0" cellpadding="10" id="dobeXHTML_IntroPara">
   <tr>
   <td valign="top" align="center" width="40%">
	<!--   The following file must be in this directory! 
	            This site copyright&#169; 2001 
	       by John &quot;Dobe Doinat&quot; Hartman, 
	               All Rights Reserved.
	-->
							<!--  *********Insert call to external JS file here********* -->
	<script type="text/javascript" 
	        src="write_Copyright_EN.js">
	</script>
	
   </td>
   <td valign="top" align="left" width="60%" class="small_70bi">
   Cut-and-pasting of code permitted for non-commercial use.<br />
   Check out my source code: <b>&lt;Right-Click&gt; | View Source</b> <br />
   Thank you. <br />
	<a href="#_XMLnXML_Start"><center><b>Back to the Beginning of this page</b></center></a>
   </td>
  </tr>
 </table>
        <!-- This sets a page break!   -->
		<br clear="all" style='mso-special-character:line-break; page-break-before:always;' />   
		    
   </body>






<COMMENT>This is outside of the namespace of the current XSL namespace.</COMMENT>
  </html>
   </xsl:template>
<!-- ~~~ -->

<COMMENT>This is outside of the namespace of the current XSL namespace.</COMMENT>
<!-- END OF ROOT RULE -->



    	<!-- BEGIN TEMPLATE RULES DEFINITIONS -->

  <!-- Basic text rule:  xsl:template match="text()" then xsl:value-of/ overrides the default XSLT engine -->
     			<!-- ~~~ -->
      	<xsl:template match="text()">
  <!-- <== If the following line is left out, with the original:  xsl:template match="*[node() ]" still in effect, -->
  <!-- <== Then only the elements and attributes are visible, no text appears from the XML file. -->
        		<xsl:value-of />
  	</xsl:template>
     			<!-- ~~~ -->

  <!-- This template rule: xsl:template match="*[node() ]" catches all elements and attributes. -->
  <!-- The statement: xsl:apply-templates select="@*"/ catches the attributes -->
  <!-- While the '[' and ']' and '/' are literal characters applied to the result document tree. -->
     			<!-- ~~~ -->
       	<xsl:template match="*[node() ]">
   			<xsl:apply-templates />
   	</xsl:template>
     			<!-- ~~~ -->

   <!-- This rule will match any element (possibly empty?) in the XML document  -->
   <!-- called newline and insert a carriage return in the HTML transformed result document  -->
     			<!-- ~~~ -->
      	<xsl:template match="newline">
    		<br />			<!-- <== This works! See internal DTD for entity declaration -->
    	</xsl:template>
     			<!-- ~~~ -->


   <!-- Named element rule: xsl:template match="title"  then use xsl:value-of/ or not depending if you want to display it...  -->
   <!-- This finds any valid elements named title and formats them for the result document tree  -->
       			<!-- ~~~ -->
      	<xsl:template match="title">
      			<!-- Leaving out the line: Title: _xsl:apply-templates /_ , the title element nor the character text is displayed  -->
      	</xsl:template>
      			<!-- ~~~ -->


   <!-- Named element rule: xsl:template match="last_updated"  -->
       			<!-- ~~~ -->
      	<xsl:template match="last_updated">
      			<!-- 'last_updated' element nor it's character text is displayed now, since no definition within this named template -->
      	</xsl:template>
      			<!-- ~~~ -->


   <!-- Named element rule: xsl:template match="red"  -->
       			<!-- ~~~ -->
      	<xsl:template match="red">
      		<span class="red"><xsl:apply-templates/></span>
      	</xsl:template>
      			<!-- ~~~ -->


   <!-- Named element rule: xsl:template match="green"  -->
       			<!-- ~~~ -->
      	<xsl:template match="green">
      		<span class="green"><xsl:apply-templates/></span>
      	</xsl:template>
      			<!-- ~~~ -->


   <!-- Named element rule: xsl:template match="black"  -->
       			<!-- ~~~ -->
      	<xsl:template match="black">
      		<span class="black"><xsl:apply-templates/></span>
      	</xsl:template>
      			<!-- ~~~ -->

 
   <!-- Named element rule: xsl:template match="yellow"  -->
       			<!-- ~~~ -->
      	<xsl:template match="yellow">
      		<span class="yellow"><xsl:apply-templates/></span>
      	</xsl:template>
      			<!-- ~~~ -->


   <!-- Named element rule: xsl:template match="purple"  -->
       			<!-- ~~~ -->
      	<xsl:template match="purple">
      		<span class="purple"><xsl:apply-templates/></span>
      	</xsl:template>
      			<!-- ~~~ -->


   <!-- Named element rule: xsl:template match="bold"  -->
       			<!-- ~~~ -->
      	<xsl:template match="bold">
      		<span class="bold"><xsl:apply-templates/></span>
      	</xsl:template>
      			<!-- ~~~ -->


   <!-- Named element rule: xsl:template match="blue"  -->
       			<!-- ~~~ -->
      	<xsl:template match="blue">
      		<span class="blue"><xsl:apply-templates/></span>
      	</xsl:template>
      			<!-- ~~~ -->


   <!-- Named element rule: xsl:template match="italic"  -->
       			<!-- ~~~ -->
      	<xsl:template match="italic">
      		<span class="italic"><xsl:apply-templates/></span>
      	</xsl:template>
      			<!-- ~~~ -->

  <!-- Named element rule: xsl:template match="keywords" -->
       			<!-- ~~~ -->
      	<xsl:template match="keywords">
      	<xsl:for-each select="keyword" order-by="+@name">
      	
       				<!-- ~~Does it work?~~ -->
       			<!-- ~~<a id="[@name]"></a>~~ -->
      	
      	 <span class="record">
     	   <br />
       	 <div class="noindent">
     	   <hr class="myHorizontalRuleStyle60Red" align="left" />
     	   <a href="#_XMLnXML_Start">Back to Start</a><br />
     	   <b><span class="keyword"><xsl:value-of select="@name" /></span></b>

     	   <hr class="myHorizontalRuleStyle60Red" align="left" />
     	   <hr class="myHorizontalRuleStyle80" align="left" />
         </div>

         <b>Definition: </b><xsl:apply-templates select="def"/>
         <br />
     	   <hr class="myHorizontalRuleStyle80" align="left" />

         <b>Example(s): </b><xsl:apply-templates select="example"/>
         </span>
     	   <br />
     	   <hr class="myHorizontalRuleStyle80" align="left" />
     	   <br /><br /><br />
           	</xsl:for-each>

        </xsl:template>
      			<!--  ~~~ -->
   </xsl:stylesheet>
     	