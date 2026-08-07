<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
<!-- New format for Dobe's Punny Name Archive on 12-17-2001 -->
<!-- Hand-written XHTML, XML, XSLT, CSS and JS suite -->
	 <!-- filename:PNA.xsl -->
<!-- 
		Dobe Doinat's Punny Name Archive
		MegaloMedia Copyright December 17, 2001
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
  <html>
    <head>
      <title>PNAXHTML using PNA.xsl</title>
    </head>
      <body title = "Tooltips demonstration in XML/XSLT-generated XHTML pages!" bgcolor = "#fffff2" text = "#000000" link = "#0000ff " vlink = "#ff00ff" alink = "#ff0000">
      <h1>A Small Selection of Punny Names Using XML</h1>
       <hr />
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
         <xsl:apply-templates />
      </body>
  </html>

</xsl:template>
</xsl:stylesheet>


