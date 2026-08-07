<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
<!-- New format for Dobe's Punny Name Archive on 12-18-2001 -->
<!-- Hand-written XHTML, XML, XSLT, CSS and JS suite -->
	 <!-- filename:PNA500_XSLT.XSL -->
<!-- 
		Dobe Doinat's Punny Name Archive
		MegaloMedia Copyright December 18, 2001
		John W. Hartman (Dobe Doinat)
		http://www.eskimo.com/~dobe/
		mailto://dobe@eskimo.com
		IDE of choice: XMLWriter, Wattle Software
		ISP of choice: eskimo.com, Bob is Everywhere! 
		
		Two alternative namespace definitions:
<xsl:stylesheet xsl:version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">

	Column Names in PNA.xml: 	
			<PNAindexNum>;,
			<PNAfirst_name>,
			<PNAmid1_name>,
			<PNAmid2_name>,
			<PNAlast_name>,
			<PNAcensusNum>,
			<PNAliteral>,
			<PNAranking>,
			<PNAnotes>
 -->
 
<!-- Could put in filter and sort routine here! Limits! Querys! -->
<!-- Syntax: xmlDocument.documentElement.childNodes.item(0).childNodes(0) -->

<xsl:template match="/"> 
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>PNA500_XSLT.XML using PNA500_XSLT.XSL</title>
		<meta name="Keywords" content="Puns,Punny,Fun,Funny,PNA,XHTML,CSS,XML,XSL,XSLT,JavaScript,tutorial,authoring,programming,learning,reference,examples,samples,source code,demos,tips,links,FAQ,forms,frames,XHTMLGuide" />
		<meta name="Description" content="Dobe Doinat's Punny Name Archive displayed as Example Data Access Using Markup Languages in a Networked Environment targeted for MSIE5+" />
		<meta http-equiv="Content-Type" content="text/html" />
		<!--*/  /*  --> 
							<!--  *********Insert call to external CSS file here********* -->
		<link rel="stylesheet" href="dobeDefaultEN.css" />
	</head>
      <body title = "Demonstration of XML/XSLT-generated XHTML page!">
							<!--  *********Insert call to external JS file here********* -->
		<script type="text/javascript" src="write_MenuLinks_EN.js"></script>
      <h2>500 Punny Names in XML Modified By XSLT </h2>
       <hr />
       <blockquote>
         <xsl:for-each select="/PNA/PNArecord">
          <b><xsl:value-of select="PNAindexNum" /></b>
          <i><xsl:value-of select="PNAfirst_name" /></i>
          <i><xsl:value-of select="PNAmid1_name" /></i>
          <i><xsl:value-of select="PNAmid2_name" /></i>
          <i><xsl:value-of select="PNAlast_name" /></i>
          <b><xsl:value-of select="PNAcensusNum" /></b>
          <big><xsl:value-of select="PNAliteral" /></big>
          <i><xsl:value-of select="PNAranking" /></i>
          <b><xsl:value-of select="PNAnotes" /></b><p />
        </xsl:for-each> -->
       </blockquote>
         <xsl:apply-templates />
         
 <table width="100%" cols="2" rows="1" border="0" cellpadding="10" id="dobeXHTML_IntroPara">
   <tr>
   <td valign="top" align="center" width="40%">
	<!--   
		The following file must be in this directory! 
	            This site copyright&#169;  2001 
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
	<a href="#PNASiteMap_Start"><center><b>Back to the Beginning of this page</b></center></a>
   </td>
  </tr>
 </table>

        
         
         
      </body>
  </html>

</xsl:template>
</xsl:stylesheet>


