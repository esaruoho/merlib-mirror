/******************************************************************************
* Note: used in Dobe's "Punny Name Archive" suite of pages for navigation
* <!-- New format for Dobe's Punny Name Archive on 12-22-2001 -->
* <!-- Hand-written XHTML, XML, XSLT, CSS and JS suite -->
* 	 <!-- filename: write_MenuLinks_EN.js -->
* <!-- 
* 		Dobe Doinat's Punny Name Archive
* 		MegaloMedia Copyright December 22, 2001
* 		John W. Hartman (Dobe Doinat)
* 		Copyright 2001
* 		http://www.eskimo.com/~dobe/
* 		mailto://dobe@eskimo.com
* 		IDE of choice: XMLWriter, Wattle Software
* 		ISP of choice: eskimo.com, Bob is Everywhere! 
*  -->
******************************************************************************/

/******************************************************************************
 Code for writing out a standard menu to each of dozens of linked pages.      *
    Note: The "if(document.all)" statement means this only works for MSIE.    *    
    	  "R&#233;sum&#233;" in line 31 means: "Résumé"                       *
******************************************************************************/
// tests for MSIE compatibility
if (document.all) {
 document.write("<div class='small_70' align='center'>~<i>Microsoft Internet Explorer 5.0+ Compliant~</i><br />  &lt; &lt;  <b>" + Date() + "</b> &gt; &gt;</div>");
 document.write("<div align='center' class='small_80'>");
 document.write("<a title ='Introduction to Punny Name Archive!' href='index.html'>Home</a> &nbsp;&nbsp; ");
 document.write("<a title ='Site Map navigation of PNA, using IFrames and some other interesting XHTML.' href='PNASiteMap.htm'>IFrame</a> &nbsp;&nbsp; ");
 document.write("<a title ='Site Map navigation of PNA, in static XHTML, as a directory of files.' href='PNA_dir.htm'>Files</a> &nbsp;&nbsp; ");
 document.write("<a title ='Site Map navigation of PNA, in plain TEXT, displaying the source code of files.' href='PNA_srcTEXT.htm'>Source</a> &nbsp;&nbsp; ");
 document.write("<a title ='This resume is rendered in XML, modified by XSLT! Click anywhere in the body of the resume, and the JavaScript navigation links at the top toggle on and off.' href='JohnWHartman_Resume.xml'>R&#233;sum&#233;</a> &nbsp;&nbsp; ");
 document.write("<a title ='Punny Name of the Moment!' href='PNAMoment.htm'>Moment</a> &nbsp;&nbsp; ");
 document.write("<a title ='Thanks for everyone who contributed!' href='PNAThanks.htm'>Thanks!</a> &nbsp;&nbsp; ");
 document.write("<a title ='Page Lincoln!' href='PNAExternalLinks.htm'>Links!</a> &nbsp;&nbsp; ");
 document.write("<a title='This is an old project and is written in HTML, not XHTML, but it contains valuable resources and good reading!' href='PNA_SDLCglossary.htm'>SDLC</a> &nbsp;&nbsp; ");
 document.write("<a title ='XHTML contains some tutorials for Web technologies that I have written, gleaned from many sources and experiments.' href='PNAdobeWebTut.htm'>XHTML</a> &nbsp;&nbsp; ");
 document.write("<a title ='The URL is XML, the content is written both in XML and XSLT. Source code is available, see home page under ~References and Downloads~.' href='PNA_XMLNXML_XML.XML'>XML/XSLT</a> &nbsp;&nbsp; ");
 document.write("</div>");
 document.write("<br />");
}
else {
 alert("You're not running MSIE version 4.0 or later!");
}
//*****************************************************************************
// functions
//*****************************************************************************
 function doIt(){
    return false;
 }

