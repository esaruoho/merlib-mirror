<?xml version='1.0'?>
<!-- New format for Dobe's Punny Name Archive on 12-21-2001 -->
<!-- Hand-written XHTML, XML, XSLT, CSS and JS suite -->
	 <!-- filename: JohnWHartman_Resume_With_JS.xsl -->
<!-- 
		Dobe Doinat's Punny Name Archive
		MegaloMedia Copyright June 7, 2002
		John W. Hartman (Dobe Doinat)
		http://www.eskimo.com/~dobe/
		mailto://dobe@eskimo.com
 -->
<xsl:stylesheet
       xmlns:xsl="http://www.w3.org/TR/WD-xsl"
       xmlns="http://www.w3.org/TR/REC-html40" 
       xmlns:xtxsl="http://www.w3.org/XSL/Transform/1.0" 
       xmlns:msxsl="http://www.w3.org/TR/WD-xsl"
       xmlns:fo="http://www.w3.org/1999/XSL/Format"
       result-ns="">
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/TR/REC-html40">
      <head>
        <title><xsl:value-of select="resume/title" /></title>
     <!-- // hide if required:
      specific XSLT parse engine may not need or even like to hide the STYLE element
      -->
	<!--  *********Insert call to external CSS file here********* -->
	<!--  *********This works just not wanted here********* -->							
	<!--  <link rel="stylesheet" href="dobeDefaultEN.css" /> -->

       <style type="text/css"> 
	 	a:active {color:red; text-decoration:underline;}
		a:link {color:red; text-decoration:underline;}
		a:visited {color:red; text-decoration:underline;}
       
	     body {background-color:#f8f8ff; font-family: ariel | verdana | monospace | cursive | serif | sans-serif | fantasy;}

         table {background:ghostwhite; margin-left:2%;} 
         h1 {font-size:150%; color:black;} 
         h1.Name {font-size:220%; color:black;} 
         h2 {font-size:115%; color:black;} 
         h3 {font-size:100%; color:black;} 
         div.objectiveMain {font-size:120%; color:black; font-weight:bold; vertical-align:top;} 
         div.objectiveSkillset {font-size:80%; color:black; vertical-align:top;} 
	     div.small_70 {font-size:70%; color:brown;}
	     div.small_80 {font-size:80%; color:brown;}
         td.GPA {font-size:80%; color:black; vertical-align:top;} 
         td.College {font-size:100%; color:black; font-weight:bold; vertical-align:top;} 
         td.CollegeName {font-size:110%; color:black; font-weight:bold; vertical-align:top;} 
         td.CollegeNotes {font-size:80%; color:black; vertical-align:top;} 
         td.CollegeYears {font-size:90%; color:black; vertical-align:top;} 
         td.CompanyYears {font-size:90%; color:black; vertical-align:top;} 
         td.Company {font-size:100%; color:black; font-weight:bold; vertical-align:top;} 
         td.CompanyName {font-size:120%; color:black; font-weight:bold; vertical-align:top;} 
         td.CompanyNotes {font-size:80%; color:black; vertical-align:top;} 
         td.CompanyPosition {font-size:100%; color:black; font-weight:bold; vertical-align:top;} 
         td.distinctionNotes {font-size:100%; color:black; vertical-align:top;} 
         p {font-size:80%; color:black;} 
         span {color:black; font-weight:bold;} 
	     span.container {font-size:105%;}
       </style>
 
 
         
 			<!--  *****Calling a JavaScript file*****  -->
 <!--       
     This actually works!  
	 The problem is that it loads prior to the body, therefore it is
	 not within a container element. I found no way to  
	 programatically toggle it's display mode visible/invisible.
  -->
<!-- 
			<script type="text/javascript" src="write_MenuLinks_EN.js">
			   <xsl:comment>
			     <![CDATA[
			     ]]>
			   </xsl:comment>
			</script>
 -->
 			<!--  ********************************  -->




 	<!--  *****My alternative to inserting external JS file*****  -->
 <!--           
 			writing it out in local JS and toggling it with a 
 			User click event. No sense printing the navigation 
 			part of the page when printing the resume
  -->
 			<!--  ********************************  -->
 <script language="javascript">
<!-- You need XSL comments inside an XSLT file! // -->
   <xsl:comment>
     <![CDATA[
        function fillXMLExample()
        {
          if (document.all.MenuSection.style.display == 'block')
          	document.all.MenuSection.style.display = 'none';
          else
          {
        myString = "";
		myString = myString + "<div class='small_70' align='center'>~<i>Microsoft Internet Explorer 5.0+ Compliant~</i><br />  &lt; &lt;  <b>" + Date() + "</b> &gt; &gt;</div>";
		myString = myString + "<div align='center' class='small_80'>";
		myString = myString + "<a title ='Introduction to Punny Name Archive!' href='index.html'>Home</a> &nbsp;&nbsp;";
		myString = myString + "<a title ='Site Map navigation for the new PNA, using IFrames and some other interesting XHTML.' href='PNASiteMap.htm'>IFrame</a> &nbsp;&nbsp;";
		myString = myString + "<a title ='Site Map navigation for the new PNA, in plain XHTML, as a directory of files.' href='PNA_dir.htm'>Files</a> &nbsp;&nbsp;";
		myString = myString + "<a title ='Site Map navigation, in plain TEXT, displaying the source code of files.' href='PNA_srcTEXT.htm'>Source</a> &nbsp;&nbsp;";
		myString = myString + "<a title ='This resume is rendered in XML, modified by XSLT! Click anywhere in the body of the resume, and the JavaScript navigation links at the top toggle on and off.' href='JohnWHartman_Resume.xml'>R&#233;sum&#233;</a> &nbsp;&nbsp;";
		myString = myString + "<a title ='Punny Name of the Moment!' href='PNAMoment.htm'>Moment</a> &nbsp;&nbsp;";
		myString = myString + "<a title ='Thanks for everyone who contributed!' href='PNAThanks.htm'>Thanks!</a> &nbsp;&nbsp;";
		myString = myString + "<a title ='Page Lincoln!' href='PNAExternalLinks.htm'>Links!</a> &nbsp;&nbsp;";
		myString = myString + "<a title ='XHTML contains some tutorials for Web technologies that I have written, gleaned from many sources and experiments.' href='PNAdobeWebTut.htm'>XHTML</a> &nbsp;&nbsp;";
		myString = myString + "<a title ='The URL is XML, the content is written both in XML and XSLT. Source code is available, see home page under ~References and Downloads~.' href='PNA_XMLNXML_XML.XML'>XML/XSLT</a> &nbsp;&nbsp;";
		myString = myString + "</div>";
		myString = myString + "<br />";

          document.all.MenuSection.style.display = 'block';
          document.all.fillElement.innerHTML = myString;
          }
        }
     ]]>
   </xsl:comment>
 </script>
 
 
      </head>
      
      <body onLoad="fillXMLExample()" title="To PRINT without the navigation menu at the top, TOGGLE it BLANK / VISIBLE, by clicking anywhere on the page!">
        <div onClick="fillXMLExample()">
   <span id="MenuSection" style="DISPLAY:none" class="container">
    <span id="fillElement" class="container"></span>
  </span>

       <table border="0" width="90%">
       
        <tr align="right">
         <td>&#160;   
         </td>
         <td><i>      
<!-- Italic, right-aligned, address, phone, email -->
        <xsl:value-of select="resume/header/street" /><br />
        <xsl:value-of select="resume/header/city" />, 
        <xsl:value-of select="resume/header/state" />. 
        <xsl:value-of select="resume/header/zipCode" /><br />
        <xsl:value-of select="resume/header/phone" /><br />
        <xsl:value-of select="resume/header/email" /><br />
         </i></td>
        </tr>
<!-- Big font for name, with <hr> -->        
        <tr align="left">
         <td colspan="2">     
        <h1 class="Name"><xsl:value-of select="resume/name" /><hr width="100%" /></h1>
         </td>
         <td>   
         </td>
        </tr>
        
        <tr valign="top" height="100">
        
<!-- Begin OBJECTIVE Table -->        
         <td>     
        <h2><b>Objective:</b></h2>
         </td>

         <td>
         <table border="0" cellspacing="0" cellpadding="0" width="100%">
          <tr>     
           <td>     
        <div class="objectiveSkillset">
         <xsl:value-of select="resume/docbody/objective/location" />
        </div>  
        <div class="objectiveSkillset">
         <i>&#160;&#160;&#160;&#160;&#160;~Preferred utilization of skills</i>&#160;<br />
         &#160;&#160;&#160;&#160;&#160;<xsl:value-of select="resume/docbody/objective/primary" /> &#160;<br />  
         &#160;&#160;&#160;&#160;&#160;<b><xsl:value-of select="resume/docbody/objective/primary1" /></b> &#160;<br />  
         <i>&#160;&#160;&#160;&#160;&#160;~Additional skills and experience</i>&#160;<br />
         &#160;&#160;&#160;&#160;&#160;<xsl:value-of select="resume/docbody/objective/secondary" />&#160;<br /> 
         &#160;&#160;&#160;&#160;&#160;<xsl:value-of select="resume/docbody/objective/secondary1" />&#160;<br /> 
         &#160;&#160;&#160;&#160;&#160;<xsl:value-of select="resume/docbody/objective/secondary2" />&#160;<br /> 
         <i>&#160;&#160;&#160;&#160;&#160;~Portfolio of sample projects available: </i>
         &#160;&#160;&#160;<b><xsl:value-of select="resume/header/website" /></b>&#160;<br />         
         &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160;<xsl:value-of select="resume/docbody/objective/tertiary" />&#160;<br />
		 &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160;<xsl:value-of select="resume/docbody/objective/tertiary1" />&#160;<br />
		 &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160;<xsl:value-of select="resume/docbody/objective/tertiary2" />&#160;<br />
		 &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160;<xsl:value-of select="resume/docbody/objective/tertiary3" />&#160;<br />&#160;<br />
        </div>  
           </td>     
          </tr>     
         </table>
         </td>
         
        </tr>

<!-- Begin EDUCATION Table -->              
        <tr valign="top" height="150">
         <td> 
<!--  &horizontalTab; = &#09;  -->              
          
        <h2><b>Education:</b></h2>
         </td>
         <td class="CollegeYears">
        <!-- Begin XSL:FOR-EACH Element for EDUCATION   -->
        <xsl:for-each select="resume/docbody/education/college">   

         <table border="0" cellspacing="2" cellpadding="2" width="90%">
          <tr>     
           <td class="CollegeName" width="60%">     
             <xsl:value-of select="././collegeName" />
           </td>
           <td class="College" width="25%" align="left">     
            <xsl:value-of select="././townState" /> 
           </td>
           <td class="CollegeYears" width="15%" align="right">     
            <xsl:value-of select="././years" />
           </td>
          </tr>
         </table>

         <table border="0" cellspacing="2" cellpadding="2" width="90%">
          <tr>
           <td width="70%" align="left">     
            <b><u><xsl:value-of select="././program" /></u></b>
           </td>
           <td class="GPA" width="30%" align="right">     
        <xsl:value-of select="././program/@GPA/text()" />
           </td>
          </tr>
         </table>
         <table border="0" cellspacing="1" cellpadding="1" width="90%">
          <tr>
           <td class="CollegeNotes" width="70%" align="left">     
            <xsl:value-of select="././note1" /> <br /> &#160;<br />
           </td>
          </tr>
         </table>

        <xsl:apply-templates />
        </xsl:for-each>
        <!-- End XSL:FOR-EACH Element   -->
 
         </td>
        </tr>


<!-- Begin EXPERIENCE Table -->              
        <tr valign="top" height="150">
         <td> 
        <h2><b>Experience:</b></h2>
         </td>
        
         <td>     
        <!-- Begin XSL:FOR-EACH Element for EXPERIENCE  -->
        <xsl:for-each select="resume/docbody/experience/company">   

         <table border="0" cellspacing="2" cellpadding="2" width="90%">
          <tr>     
           <td class="CompanyName" width="60%" valign="top">     
             <xsl:value-of select="././companyName/text()" />
             
           </td>
           <td class="Company" width="25%" align="left">     
            <xsl:value-of select="././townState" /> 
           </td>
           <td class="CompanyYears" width="15%" align="right">     
            <xsl:value-of select="././years" />
           </td>
          </tr>
         </table>
         <table border="0" cellspacing="2" cellpadding="2" width="90%">
          <tr>
           <td class="CompanyPosition" align="left">    
            
            <xsl:value-of select="././position" />
           </td>
          </tr>
         </table>








         <table border="0" cellspacing="1" cellpadding="1" width="90%">
          <tr>
           <td class="CompanyNotes" align="left">
     
           <xsl:value-of select="././workNotes" /> <br /> <br />

           </td>
          </tr>
         </table>

        <xsl:apply-templates />
        </xsl:for-each>
        <!-- End XSL:FOR-EACH Element   -->
        </td>
        </tr>

<!-- Begin DISTINCTIONS Table -->              
        <tr valign="top" height="150">
         <td> 
        <h2><b>Online:</b></h2>
         </td>
        
         <td>     
        <!-- Begin XSL:FOR-EACH Element for DISTINCTIONS  -->
        <xsl:for-each select="resume/docbody/distinctions/notes">  

         <table border="0" cellspacing="1" cellpadding="1" width="90%">
          <tr>
           <td class="distinctionNotes" align="left">     
            <xsl:value-of select="././text()" /><br />
           </td>
          </tr>
         </table>

        <xsl:apply-templates />
        </xsl:for-each>
        <!-- End XSL:FOR-EACH Element   -->
        </td>
        </tr>

        
       </table>      
         </div>
        <!-- This sets a page break! 
		<br clear="all" style='mso-special-character:line-break; page-break-before:always;' />     
		  --> 
		  
		   
      </body>
    </html>
        <xsl:apply-templates />
  </xsl:template>
        
 </xsl:stylesheet>
