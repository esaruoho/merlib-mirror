---
title: "Dobe Doinat's XML_Resume_VB (RW4XML) Help File"
source_domain: amasci.com
source_path: ~dobe/!dobeResumeGenerator!/help/XML_Resume_VB.html
order: 2760
reachable_from_entry: false
images: 9
internal_links: 0
extracted: 2026-08-07T17:09:11Z
extractor: site_to_paper.py (pandoc)
---

# Dobe Doinat's XML_Resume_VB (RW4XML) Help File

*Source page: `~dobe/!dobeResumeGenerator!/help/XML_Resume_VB.html`*

### RW4XML Help ( <span title="XHTML is just like HTML only it must be a well-formed XML document."> XHTML format </span> )

------------------------------------------------------------------------

### Introduction

> <span class="small">**RW4XML** or <u>Resume Wizard for XML</u>, is used to create a <u>template XML</u> and a <u>template XSL file</u> which will display a <u>finished resume</u> within an MSIE browser.\
> \
> RW4XML creates files <u>intended to be edited in NotePad</u>, or with <u>any other XML editing tools</u> after your first template is created and saved.\
> \
> This sample project includes a <u>DTD</u>, a <u>Schema</u>, a <u>generated XSL transform file</u>, as well as the <u>source code for the Visual Basic</u> to enable you to modify the template in any way you wish!\
> \
> This is only the first version of RW4XML, which will undoubtedly progress and evolve through the coming months and years.\
> \
> Please send suggestions and feedback to **dobe@eskimo.com** and mark the subject line: <u>Dobe's XML_Resume_VB project</u>\
> \
> Thanks for taking a look at my project.</span>

------------------------------------------------------------------------

- [Screenshot of XML_Resume_VB running](#RW4XML_Screenshot)
- [Screenshot of final Resume in Browser](#RW4XML_Res_Browser)
- [The text of the DTD file](#RW4XML_DTD "Check out the graphics showing the Structure of the Schema!")
- [The text of the (alternative) SCHEMA file](#RW4XML_SCHEMA)
- [The text of the XML file](#RW4XML_XML)
- [The text of the XSL file](#RW4XML_XSL)
- [The text of the VB 6.0 source code](#RW4XML_VB_Source)
- <a href="resume_default.xml" target="_new" title="If this link doesn&#39;t work, generate your own and put it in the application\help directory!">Actual file generated with default values in RW4XML</a>
- <a href="resume_dobe.xml" target="_new" title="Please submit feedback and suggestions to &#39;dobe@eskimo.com&#39;">My own resume generated with RW4XML</a> (Unmodified)

------------------------------------------------------------------------

<div id="RW4XML_Screenshot">

[Back to Top](#RW4XML_top)

</div>

     The running **XML_Resume_VB** program\
\

![Dobe Doinat's XML_Resume_VB Wizard](RW4XML_Screenshot.jpg)\
\

------------------------------------------------------------------------

<div id="RW4XML_Res_Browser">

[Back to Top](#RW4XML_top)

</div>

     The **XML_Resume_VB** output, displayed in MSIE browser\
\

![Dobe Doinat's XML_Resume_VB Wizard Output: Print Preview Screenshot ](RW4XML_PrintPreviewScreenshot.jpg)\
\

<table data-border="0">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td style="text-align: left;" data-valign="top"><hr />
<div id="RW4XML_DTD">
<a href="#RW4XML_top">Back to Top</a>
</div>
<ul>
<li><a href="#RW4XML_Graph1">The "<strong>resume/header</strong>" elements in the DTD</a></li>
<li><a href="#RW4XML_Graph2">The "<strong>resume/name</strong>" element in the DTD</a></li>
<li><a href="#RW4XML_Graph3">The "<strong>resume/docbody/objective</strong>" elements in the DTD</a></li>
<li><a href="#RW4XML_Graph4">The "<strong>resume/docbody/education/college</strong>" elements in the DTD</a></li>
<li><a href="#RW4XML_Graph5">The "<strong>resume/docbody/experience/company</strong>" elements in the DTD</a></li>
<li><a href="#RW4XML_Graph6">The "<strong>resume/docbody/experience/distinctions</strong>" elements in the DTD</a></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;" data-valign="top"><strong>The Document Type Definition file looks like this:</strong><br />
<br />
<span class="small">     &lt;!ELEMENT resume (header , name , docbody )&gt;<br />
     &lt;!ELEMENT header (street , city , state , zipCode , phone , email )&gt;<br />
     &lt;!ELEMENT street (#PCDATA )&gt;<br />
     &lt;!ELEMENT city (#PCDATA )&gt;<br />
     &lt;!ELEMENT state (#PCDATA )&gt;<br />
     &lt;!ELEMENT zipCode (#PCDATA )&gt;<br />
     &lt;!ELEMENT phone (#PCDATA )&gt;<br />
     &lt;!ELEMENT email (#PCDATA )&gt;<br />
     &lt;!ELEMENT name (#PCDATA )&gt;<br />
     &lt;!ELEMENT docbody (objective , education , experience )&gt;<br />
     &lt;!ELEMENT objective (primary , secondary , location , note1 , note2 )&gt;<br />
     &lt;!ELEMENT primary (#PCDATA )&gt;<br />
     &lt;!ELEMENT secondary (#PCDATA )&gt;<br />
     &lt;!ELEMENT location (#PCDATA )&gt;<br />
     &lt;!ELEMENT note1 (#PCDATA )&gt;<br />
     &lt;!ELEMENT note2 (#PCDATA )&gt;<br />
     &lt;!ELEMENT education (college )&gt;<br />
     &lt;!ELEMENT college (collegeName , townState , years , program , note1 , note2 )&gt;<br />
     &lt;!ELEMENT collegeName (#PCDATA )&gt;<br />
     &lt;!ELEMENT townState (#PCDATA )&gt;<br />
     &lt;!ELEMENT years (#PCDATA )&gt;<br />
     &lt;!ELEMENT program (#PCDATA )&gt;<br />
     &lt;!ATTLIST program GPA CDATA #REQUIRED &gt;<br />
     &lt;!ELEMENT experience (company , distinctions )&gt;<br />
     &lt;!ELEMENT company (companyName , townState , years , position , note1 , note2 )&gt;<br />
     &lt;!ELEMENT companyName (#PCDATA )&gt;<br />
     &lt;!ELEMENT position (#PCDATA )&gt;<br />
     &lt;!ELEMENT distinctions (note1 , note2 )&gt;</span></td>
</tr>
<tr>
<td style="text-align: left;" data-valign="top"><hr />
<div id="RW4XML_SCHEMA">
<a href="#RW4XML_top">Back to Top</a>
</div>
<br />
<strong>An alternative to the Document Type Definition is a .XSD file called a "Schema" and it looks like this:</strong><br />
<br />
<span class="small"> &lt;?xml version ="1.0"?&gt;<br />
 &lt;!-- Conforms to w3c http://www.w3.org/TR/xmlschema-1/ --&gt;<br />
 &lt;schema targetNamespace = "resume_test.xsd"<br />
   xmlns = "http://www.w3.org/1999/05/06-xmlschema-1/structures.xsd"&gt;<br />
  &lt;element name = "resume"&gt;<br />
    &lt;type content = "elementOnly"&gt;<br />
      &lt;group order = "seq"&gt;<br />
        &lt;element ref = "header"/&gt;<br />
        &lt;element ref = "name"/&gt;<br />
        &lt;element ref = "docbody"/&gt;<br />
      &lt;/group&gt;<br />
    &lt;/type&gt;<br />
  &lt;/element&gt;<br />
<br />
  &lt;element name = "header"&gt;<br />
    &lt;type content = "elementOnly"&gt;<br />
      &lt;group order = "seq"&gt;<br />
        &lt;element ref = "street"/&gt;<br />
        &lt;element ref = "city"/&gt;<br />
        &lt;element ref = "state"/&gt;<br />
        &lt;element ref = "zipCode"/&gt;<br />
        &lt;element ref = "phone"/&gt;<br />
        &lt;element ref = "email"/&gt;<br />
      &lt;/group&gt;<br />
    &lt;/type&gt;<br />
  &lt;/element&gt;<br />
<br />
  &lt;element name = "street" type = "string"/&gt;<br />
  &lt;element name = "city" type = "string"/&gt;<br />
  &lt;element name = "state" type = "string"/&gt;<br />
  &lt;element name = "zipCode" type = "string"/&gt;<br />
  &lt;element name = "phone" type = "string"/&gt;<br />
  &lt;element name = "email" type = "string"/&gt;<br />
  &lt;element name = "name" type = "string"/&gt;<br />
  &lt;element name = "docbody"&gt;<br />
    &lt;type content = "elementOnly"&gt;<br />
      &lt;group order = "seq"&gt;<br />
        &lt;element ref = "objective"/&gt;<br />
        &lt;element ref = "education"/&gt;<br />
        &lt;element ref = "experience"/&gt;<br />
      &lt;/group&gt;<br />
    &lt;/type&gt;<br />
  &lt;/element&gt;<br />
<br />
  &lt;element name = "objective"&gt;<br />
    &lt;type content = "elementOnly"&gt;<br />
      &lt;group order = "seq"&gt;<br />
        &lt;element ref = "primary"/&gt;<br />
        &lt;element ref = "secondary"/&gt;<br />
        &lt;element ref = "location"/&gt;<br />
        &lt;element ref = "note1"/&gt;<br />
        &lt;element ref = "note2"/&gt;<br />
      &lt;/group&gt;<br />
    &lt;/type&gt;<br />
  &lt;/element&gt;<br />
<br />
  &lt;element name = "primary" type = "string"/&gt;<br />
  &lt;element name = "secondary" type = "string"/&gt;<br />
  &lt;element name = "location" type = "string"/&gt;<br />
  &lt;element name = "note1" type = "string"/&gt;<br />
  &lt;element name = "note2" type = "string"/&gt;<br />
  &lt;element name = "education"&gt;<br />
    &lt;type content = "elementOnly"&gt;<br />
      &lt;group order = "seq"&gt;<br />
        &lt;element ref = "college"/&gt;<br />
      &lt;/group&gt;<br />
    &lt;/type&gt;<br />
  &lt;/element&gt;<br />
<br />
  &lt;element name = "college"&gt;<br />
    &lt;type content = "elementOnly"&gt;<br />
      &lt;group order = "seq"&gt;<br />
        &lt;element ref = "collegeName"/&gt;<br />
        &lt;element ref = "townState"/&gt;<br />
        &lt;element ref = "years"/&gt;<br />
        &lt;element ref = "program"/&gt;<br />
        &lt;element ref = "note1"/&gt;<br />
        &lt;element ref = "note2"/&gt;<br />
      &lt;/group&gt;<br />
    &lt;/type&gt;<br />
  &lt;/element&gt;<br />
<br />
  &lt;element name = "collegeName" type = "string"/&gt;<br />
  &lt;element name = "townState" type = "string"/&gt;<br />
  &lt;element name = "years" type = "string"/&gt;<br />
  &lt;element name = "program"&gt;<br />
    &lt;type content = "textOnly"&gt;<br />
      &lt;attribute name = "GPA" minOccurs = "1" type = "string"/&gt;<br />
    &lt;/type&gt;<br />
  &lt;/element&gt;<br />
<br />
  &lt;element name = "experience"&gt;<br />
    &lt;type content = "elementOnly"&gt;<br />
      &lt;group order = "seq"&gt;<br />
        &lt;element ref = "company"/&gt;<br />
        &lt;element ref = "distinctions"/&gt;<br />
      &lt;/group&gt;<br />
    &lt;/type&gt;<br />
  &lt;/element&gt;<br />
<br />
  &lt;element name = "company"&gt;<br />
    &lt;type content = "elementOnly"&gt;<br />
      &lt;group order = "seq"&gt;<br />
        &lt;element ref = "companyName"/&gt;<br />
        &lt;element ref = "townState"/&gt;<br />
        &lt;element ref = "years"/&gt;<br />
        &lt;element ref = "position"/&gt;<br />
        &lt;element ref = "note1"/&gt;<br />
        &lt;element ref = "note2"/&gt;<br />
      &lt;/group&gt;<br />
    &lt;/type&gt;<br />
  &lt;/element&gt;<br />
<br />
  &lt;element name = "companyName" type = "string"/&gt;<br />
  &lt;element name = "position" type = "string"/&gt;<br />
  &lt;element name = "distinctions"&gt;<br />
    &lt;type content = "elementOnly"&gt;<br />
      &lt;group order = "seq"&gt;<br />
        &lt;element ref = "note1"/&gt;<br />
        &lt;element ref = "note2"/&gt;<br />
      &lt;/group&gt;<br />
    &lt;/type&gt;<br />
  &lt;/element&gt;<br />
<br />
 &lt;/schema&gt;<br />
</span><br />
<br />
&#10;<div>
&#10;</div></td>
</tr>
<tr>
<td style="text-align: left;" data-valign="top"><div id="RW4XML_Graph1">
     <u>The "<strong>resume/header</strong>" elements in the DTD:</u><br />
<br />
&#10;</div>
<img src="ResumeHeader.gif" alt="Header in DTD" /><br />
<br />
</td>
</tr>
<tr>
<td style="text-align: left;" data-valign="top"><div id="RW4XML_Graph2">
     <u>The "<strong>resume/name</strong>" element in the DTD:</u><br />
<br />
&#10;</div>
<img src="ResumeName.gif" alt="Objective in DTD" /><br />
<br />
</td>
</tr>
<tr>
<td style="text-align: left;" data-valign="top"><div id="RW4XML_Graph3">
     <u>The "<strong>resume/docbody/objective</strong>" elements in the DTD:</u><br />
<br />
&#10;</div>
<img src="ResumeDocbodyObjective.gif" alt="Objective in DTD" /><br />
<br />
</td>
</tr>
<tr>
<td style="text-align: left;" data-valign="top"><div id="RW4XML_Graph4">
     <u>The "<strong>resume/docbody/education/college</strong>" elements in the DTD:</u><br />
<br />
&#10;</div>
<img src="ResumeDocbodyEducationCollege.gif" alt="Objective in DTD" /><br />
<br />
</td>
</tr>
<tr>
<td style="text-align: left;" data-valign="top"><div id="RW4XML_Graph5">
     <u>The "<strong>resume/docbody/experience/company</strong>" elements in the DTD:</u><br />
<br />
&#10;</div>
<img src="ResumeDocbodyExperienceCompany.gif" alt="Objective in DTD" /><br />
<br />
</td>
</tr>
<tr>
<td style="text-align: left;" data-valign="top"><div id="RW4XML_Graph6">
     <u>The "<strong>resume/docbody/experience/distinctions</strong>" elements in the DTD:</u><br />
<br />
&#10;</div>
<img src="ResumeDocbodyExperienceDistinctions.gif" alt="Objective in DTD" /><br />
<br />
</td>
</tr>
<tr>
<td style="text-align: left;" data-valign="top"><hr />
<div id="RW4XML_XML">
<a href="#RW4XML_top">Back to Top</a>
</div>
<strong>The XML file looks like this:</strong><br />
<br />
<span class="small">&lt;?xml version='1.0' encoding='ISO8859-1' standalone='no'?&gt;<br />
 &lt;?xml-stylesheet type='text/xsl' href='<strong>resume_test.xsl</strong>' ?&gt;<br />
&lt;!-- Generated by Dobe's Resume Wizard for XML --&gt;<br />
<br />
  &lt;resume&gt;<br />
<br />
     &lt;header&gt;<br />
       &lt;street&gt;418 Avenue H&lt;/street&gt;<br />
       &lt;city&gt;Snohomish&lt;/city&gt;<br />
       &lt;state&gt;WA&lt;/state&gt;<br />
       &lt;zipCode&gt;98290&lt;/zipCode&gt;<br />
       &lt;phone&gt;360-568-0336&lt;/phone&gt;<br />
       &lt;email&gt;dobe@eskimo.com&lt;/email&gt;<br />
     &lt;/header&gt;<br />
<br />
     &lt;name&gt;John W. Hartman &lt;/name&gt;<br />
<br />
     &lt;docbody&gt;<br />
<br />
      &lt;objective&gt;<br />
       &lt;primary&gt;Application and Web Development &lt;/primary&gt;<br />
       &lt;secondary&gt;Automation, API Support, Documentation, Quality Control, Troubleshooting&lt;/secondary&gt;<br />
       &lt;location&gt;Everett / Bellevue / Seattle area &lt;/location&gt;<br />
       &lt;note1&gt;&lt;/note1&gt;<br />
       &lt;note2&gt;&lt;/note2&gt;<br />
      &lt;/objective&gt;<br />
<br />
      &lt;education&gt;<br />
<br />
       &lt;college&gt;<br />
         &lt;collegeName&gt;Everett Community College &lt;/collegeName&gt;<br />
         &lt;townState&gt;Everett, WA &lt;/townState&gt;<br />
         &lt;years&gt;1999-2000&lt;/years&gt;<br />
         &lt;program GPA='0.0'&gt;Advanced Programming Certificate &lt;/program&gt;<br />
         &lt;note1&gt;Visual Basic, Java, C++, API, SQL, XHTML, XML, XSLT, &lt;/note1&gt;<br />
         &lt;note2&gt;Systems Analysis and Design, Access, Excel, Word, VBA, Interpersonal Communications (5 Quarters) &lt;/note2&gt;<br />
       &lt;/college&gt;<br />
<br />
      &lt;/education&gt;<br />
<br />
      &lt;experience&gt;<br />
<br />
        &lt;company&gt;<br />
         &lt;companyName&gt;Attachmate &lt;/companyName&gt;<br />
         &lt;townState&gt;Bellevue, WA &lt;/townState&gt;<br />
         &lt;years&gt;2000-2001&lt;/years&gt;<br />
         &lt;position&gt;API Team Developer Support &lt;/position&gt;<br />
         &lt;note1&gt;Telephone helpdesk team member in API support division for Attachmate core host-to-terminal product applications and interfaces, using OLE, HLLAPI, and Objects in various environments and languages including EXTRA!Basic, Visual Basic6, ASP, XHTML, Java, XML, JavaScript, VBScript and more on virtually every Win9X, WinNT and Win2K Operating System platform and version. &lt;/note1&gt;<br />
         &lt;note2&gt;Assisted in Quality Control testing and documentation review of (Beta version) Enterprise Application Integration (EAI) software. &lt;/note2&gt;<br />
        &lt;/company&gt;<br />
<br />
        &lt;distinctions&gt;<br />
         &lt;note1&gt;Maintain Archive online http://www.eskimo.com/~dobe/ since 1996 &lt;/note1&gt;<br />
         &lt;note2&gt;Ranked 4 Kyu GO Player by American GO Association &lt;/note2&gt;<br />
        &lt;/distinctions&gt;<br />
<br />
       &lt;/experience&gt;<br />
<br />
     &lt;/docbody&gt;<br />
<br />
  &lt;/resume&gt;<br />
<br />
</span></td>
</tr>
<tr>
<td style="text-align: left;" data-valign="top"><hr />
<div id="RW4XML_XSL">
<a href="#RW4XML_top">Back to Top</a>
</div>
<strong>The XSL file looks like this:</strong><br />
<br />
<span class="small">&lt;?xml version='1.0'?&gt;<br />
&lt;!-- Generated by Dobe's Resume Wizard for XML --&gt;<br />
&lt;xsl:stylesheet<br />
xmlns:xsl='http://www.w3.org/TR/WD-xsl'<br />
xmlns:xtxsl='http://www.w3.org/XSL/Transform/1.0'<br />
xmlns:msxsl='http://www.w3.org/TR/WD-xsl'<br />
xmlns:fo='http://www.w3.org/1999/XSL/Format'<br />
result-ns=''&gt;<br />
&lt;xsl:template match=' / '&gt;<br />
&lt;html&gt;<br />
&lt;head&gt;<br />
&lt;title&gt;&lt;xsl:value-of select='resume/title' /&gt;&lt;/title&gt;<br />
&lt;style type='text/css'&gt;<br />
a:link {color: blue; text-decoration:none;}<br />
a:visited {color:blue; text-decoration:none;}<br />
a:active {color:red; text-decoration:none background:lightgreen;}<br />
body {background:ghostwhite; font-family: ariel | helvetica | serif;}<br />
table {background:ghostwhite;}<br />
h1 {font-size:150%; color:black;}<br />
h2 {font-size:115%; color:black;}<br />
div.objectiveMain {font-size:120%; color:black; font-weight:bold; vertical-align:top;}<br />
div.objectiveSkillset {font-size:100%; color:black; vertical-align:top;}<br />
h1.Name {font-size:200%; color:black;}<br />
td.Header {font-style:italic; font-size:80%; color:black; vertical-align:top;}<br />
td.GPA {font-size:80%; color:black; vertical-align:top;}<br />
td.College {font-size:100%; color:black; font-weight:bold; vertical-align:top;}<br />
td.CollegeName {font-size:110%; color:black; font-weight:bold; vertical-align:top;}<br />
td.CompanyName {font-size:110%; color:black; font-weight:bold; vertical-align:top;}<br />
td.CollegeNotes {font-size:90%; color:black; vertical-align:top;}<br />
td.CompanyNotes {font-size:90%; color:black; vertical-align:top;}<br />
td.CollegeYears {font-size:90%; color:black; vertical-align:top;}<br />
td.CompanyYears {font-size:90%; color:black; vertical-align:top;}<br />
td.Company {font-size:100%; color:black; font-weight:bold; vertical-align:top;}<br />
td.CompanyPosition {font-size:100%; color:black; font-weight:bold; vertical-align:top;}<br />
td.distinctionNotes {font-size:90%; color:black; vertical-align:top;}<br />
&lt;/style&gt;<br />
&lt;/head&gt;<br />
&lt;body&gt;<br />
&lt;table border='0' width='90%'&gt;<br />
&lt;tr align='right'&gt;<br />
&lt;td&gt; <br />
&lt;/td&gt;<br />
&lt;td class='header'&gt;<br />
&lt;!-- Italic, right-aligned, address, phone, email --&gt;<br />
&lt;xsl:value-of select='resume/header/street' /&gt;&lt;br /&gt;<br />
&lt;xsl:value-of select='resume/header/city' /&gt;,<br />
&lt;xsl:value-of select='resume/header/state' /&gt;.<br />
&lt;xsl:value-of select='resume/header/zipCode' /&gt;&lt;br /&gt;<br />
&lt;xsl:value-of select='resume/header/phone' /&gt;&lt;br /&gt;<br />
&lt;xsl:value-of select='resume/header/email' /&gt;&lt;br /&gt;&lt;br /&gt;<br />
&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;!-- Big font for name, with &lt;hr&gt; --&gt;<br />
&lt;tr align='left'&gt;<br />
&lt;td colspan='2'&gt;<br />
&lt;h1 class='Name'&gt;&lt;xsl:value-of select='resume/name' /&gt;<br />
&lt;hr width='100%' /&gt;<br />
&lt;/h1&gt;<br />
&lt;/td&gt;<br />
&lt;td&gt;<br />
&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;tr valign='top' height='100'&gt;<br />
&lt;!-- Begin OBJECTIVE Table --&gt;<br />
&lt;td&gt;<br />
&lt;h2&gt;&lt;b&gt;Objective:&lt;/b&gt;&lt;/h2&gt;<br />
&lt;/td&gt;<br />
&lt;td&gt;<br />
&lt;table border='0' cellspacing='0' cellpadding='0' width='100%'&gt;<br />
&lt;tr&gt;<br />
&lt;td&gt;<br />
&lt;div class='objectiveMain'&gt;<br />
&lt;xsl:value-of select='resume/docbody/objective/primary' /&gt;<br />
&lt;/div&gt;<br />
&lt;xsl:value-of select='resume/docbody/objective/secondary' /&gt;&lt;br /&gt;<br />
&lt;xsl:value-of select='resume/docbody/objective/location' /&gt;&lt;br /&gt;<br />
&lt;xsl:value-of select='resume/docbody/objective/note1' /&gt;&lt;br /&gt;<br />
&lt;xsl:value-of select='resume/docbody/objective/note2' /&gt;<br />
<br />
&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;/table&gt;<br />
&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;!-- Begin EDUCATION Table --&gt;<br />
&lt;tr valign='top' height='150'&gt;<br />
&lt;td&gt;<br />
&lt;!-- &amp;horizontalTab; = --&gt;<br />
&lt;h2&gt;&lt;b&gt;Education:&lt;/b&gt;&lt;/h2&gt;<br />
&lt;/td&gt;<br />
&lt;td&gt;<br />
&lt;!-- Begin XSL:FOR-EACH Element for EDUCATION --&gt;<br />
&lt;xsl:for-each select='resume/docbody/education/college'&gt;<br />
<br />
&lt;table border='0' cellspacing='2' cellpadding='2' width='90%'&gt;<br />
&lt;tr&gt;<br />
&lt;td class='CollegeName' width='60%'&gt;<br />
&lt;xsl:value-of select='././collegeName' /&gt;<br />
&lt;/td&gt;<br />
&lt;td class='College' width='25%' align='left'&gt;<br />
&lt;xsl:value-of select='././townState' /&gt;<br />
&lt;/td&gt;<br />
&lt;td class='CollegeYears' width='15%' align='right'&gt;<br />
&lt;xsl:value-of select='././years' /&gt;<br />
<br />
&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;/table&gt;<br />
<br />
&lt;table border='0' cellspacing='2' cellpadding='2' width='90%'&gt;<br />
&lt;tr&gt;<br />
&lt;td width='70%' align='left'&gt;<br />
&lt;b&gt;&lt;xsl:value-of select='././program' /&gt;&lt;/b&gt;<br />
&lt;/td&gt;<br />
&lt;td class='GPA' width='30%' align='right'&gt;<br />
&lt;xsl:value-of select='././program/@GPA/text()' /&gt; GPA<br />
&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;/table&gt;<br />
&lt;table border='0' cellspacing='2' cellpadding='2' width='90%'&gt;<br />
&lt;tr&gt;<br />
&lt;td class='CollegeNotes' align='left'&gt;<br />
&lt;xsl:value-of select='././note1' /&gt;<br />
&lt;/td&gt;<br />
&lt;/tr&gt;<br />
<br />
&lt;/table&gt;<br />
&lt;table border='0' cellspacing='2' cellpadding='2' width='90%'&gt;<br />
&lt;tr&gt;<br />
&lt;td class='CollegeNotes' align='left'&gt;<br />
&lt;xsl:value-of select='././note2' /&gt;<br />
<br />
&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;/table&gt;<br />
<br />
&lt;xsl:apply-templates /&gt;<br />
&lt;/xsl:for-each&gt;<br />
&lt;!-- End XSL:FOR-EACH Element --&gt;<br />
&lt;/td&gt;<br />
&lt;/tr&gt;<br />
<br />
&lt;!-- Begin EXPERIENCE Table --&gt;<br />
&lt;tr valign='top' height='150'&gt;<br />
&lt;td&gt;<br />
&lt;h2&gt;&lt;b&gt;Experience:&lt;/b&gt;&lt;/h2&gt;<br />
&lt;/td&gt;<br />
&lt;td&gt;<br />
&lt;!-- Begin XSL:FOR-EACH Element for EXPERIENCE --&gt;<br />
&lt;xsl:for-each select='resume/docbody/experience/company'&gt;<br />
&lt;table border='0' cellspacing='2' cellpadding='2' width='90%'&gt;<br />
&lt;tr&gt;<br />
&lt;td class='CompanyName' width='60%' valign='top'&gt;<br />
&lt;xsl:value-of select='././companyName/text()' /&gt;<br />
&lt;/td&gt;<br />
&lt;td class='Company' width='25%' align='left'&gt;<br />
&lt;xsl:value-of select='././townState' /&gt;<br />
&lt;/td&gt;<br />
&lt;td class='CompanyYears' width='15%' align='right'&gt;<br />
&lt;xsl:value-of select='././years' /&gt;<br />
&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;/table&gt;<br />
&lt;table border='0' cellspacing='2' cellpadding='2' width='90%'&gt;<br />
&lt;tr&gt;<br />
&lt;td class='CompanyPosition' align='left'&gt;<br />
<br />
&lt;xsl:value-of select='././position' /&gt;<br />
&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;/table&gt;<br />
&lt;table border='0' cellspacing='2' cellpadding='2' width='90%'&gt;<br />
&lt;tr&gt;<br />
&lt;td class='CompanyNotes' align='left'&gt;<br />
<br />
&lt;xsl:value-of select='././note1' /&gt;<br />
&lt;/td&gt;<br />
&lt;/tr&gt;<br />
<br />
&lt;/table&gt;<br />
&lt;table border='0' cellspacing='2' cellpadding='2' width='90%'&gt;<br />
&lt;tr&gt;<br />
&lt;td class='CompanyNotes' align='left'&gt;<br />
&lt;xsl:value-of select='././note2' /&gt;<br />
&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;/table&gt;<br />
&lt;xsl:apply-templates /&gt;<br />
&lt;/xsl:for-each&gt;<br />
&lt;!-- End XSL:FOR-EACH Element --&gt;<br />
&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;!-- Begin DISTINCTIONS Table --&gt;<br />
&lt;tr valign='top' height='150'&gt;<br />
&lt;td&gt;<br />
&lt;h2&gt;&lt;b&gt;Distinctions:&lt;/b&gt;&lt;/h2&gt;<br />
<br />
&lt;/td&gt;<br />
&lt;td&gt;<br />
&lt;table border='0' align='left' cellspacing='1' cellpadding='3' &gt;<br />
&lt;tr&gt;<br />
&lt;td class='distinctionNotes'&gt;<br />
&lt;xsl:value-of select='resume/docbody/experience/distinctions/note1' /&gt; &lt;br /&gt;<br />
&lt;xsl:value-of select='resume/docbody/experience/distinctions/note2' /&gt; &lt;br /&gt;<br />
&lt;xsl:apply-templates /&gt;<br />
&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;/table&gt;<br />
<br />
&lt;/td&gt;<br />
&lt;/tr&gt;<br />
<br />
&lt;/table&gt;<br />
<br />
&lt;/body&gt;<br />
&lt;/html&gt;<br />
&lt;xsl:apply-templates /&gt;<br />
&lt;/xsl:template&gt;<br />
&lt;/xsl:stylesheet&gt;<br />
<br />
</span></td>
</tr>
<tr>
<td style="text-align: left;" data-valign="top"><hr />
<div id="RW4XML_VB_Source">
<a href="#RW4XML_top">Back to Top</a>
</div>
     <strong>A screenshot of this Project</strong> in development:<br />
<br />
&#10;<img src="RW4XML_VB_Form_Screenshot.jpg" alt="Coding in Visual Basic 6.0" /><br />
<br />
<strong>The VB code looks like this:</strong><br />
<br />
<span class="small">Option Explicit<br />
Const gOpenPathNameBrowser As String = "c:\progra~1\Intern~1\iexplore.exe "<br />
<br />
Private Sub mnuFileExit_Click()<br />
Unload Me<br />
End Sub<br />
<br />
Private Sub mnuHelpAbout_Click()<br />
frmAbout.Visible = True<br />
End Sub<br />
<br />
Private Sub mnuHelpDocHTA_Click()<br />
Dim strHelpPath As String<br />
<br />
'Adjust path as required for your system to open Microsoft Internet Explorer Browser<br />
strHelpPath = gOpenPathNameBrowser &amp; App.Path &amp; "\help\XML_Resume_VB.hta"<br />
'Since this is an application (.hta) then Microsoft Internet Explorer Browser<br />
'will offer to download it or open it. Simply open it, it's only simple XHTML.<br />
<br />
Shell strHelpPath, 1<br />
<br />
End Sub<br />
<br />
Private Sub mnuHelpContents_Click()<br />
Dim strHelpPath As String<br />
<br />
'Adjust path as required for your system to open Microsoft Internet Explorer Browser<br />
strHelpPath = gOpenPathNameBrowser &amp; App.Path &amp; "\help\XML_Resume_VB.html"<br />
'Simple XHTML in browser. This may evolve into true Help as time allows.<br />
<br />
Shell strHelpPath, 1<br />
<br />
<br />
End Sub<br />
<br />
Private Sub cmdShowResults_Click()<br />
Dim str As String<br />
'*********************************************************************************<br />
str = ""<br />
str = str &amp; "&lt;?xml version='1.0' encoding='ISO8859-1' standalone='no'?&gt;" &amp; vbCrLf<br />
str = str &amp; "&lt;?xml-stylesheet type='text/xsl' href='resume_test.xsl' ?&gt;" &amp; vbCrLf<br />
'&lt;!DOCTYPE resume SYSTEM "DobeResume.dtd"&gt;<br />
str = str &amp; "&lt;!-- Generated by Dobe's Resume Wizard for XML --&gt;" &amp; vbCrLf<br />
str = str &amp; "&lt;resume&gt;" &amp; vbCrLf<br />
<br />
str = str &amp; " &lt;header&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;street&gt;" &amp; txtResumeStreet.Text &amp; "&lt;/street&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;city&gt;" &amp; txtResumeLoc.Text &amp; "&lt;/city&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;state&gt;" &amp; txtResumeState.Text &amp; "&lt;/state&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;zipCode&gt;" &amp; txtResumeZip.Text &amp; "&lt;/zipCode&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;phone&gt;" &amp; txtResumePhone.Text &amp; "&lt;/phone&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;email&gt;" &amp; txtResumeEmail.Text &amp; "&lt;/email&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;/header&gt;" &amp; vbCrLf<br />
<br />
str = str &amp; " &lt;name&gt;" &amp; txtResumeName.Text &amp; " &lt;/name&gt;" &amp; vbCrLf<br />
<br />
str = str &amp; " &lt;docbody&gt;" &amp; vbCrLf<br />
<br />
str = str &amp; " &lt;objective&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;primary&gt;" &amp; txtObjectivePrimary.Text &amp; "&lt;/primary&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;secondary&gt;" &amp; txtObjectiveSecondary.Text &amp; "&lt;/secondary&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;location&gt;" &amp; txtObjectiveLocation.Text &amp; "&lt;/location&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;note1&gt;" &amp; txtObjectiveNote1.Text &amp; "&lt;/note1&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;note2&gt;" &amp; txtObjectiveNote2.Text &amp; "&lt;/note2&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;/objective&gt;" &amp; vbCrLf<br />
<br />
str = str &amp; " &lt;education&gt;" &amp; vbCrLf<br />
<br />
str = str &amp; " &lt;college&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;collegeName&gt;" &amp; txtEdName.Text &amp; "&lt;/collegeName&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;townState&gt;" &amp; txtEdLoc.Text &amp; "&lt;/townState&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;years&gt;" &amp; txtEdYears.Text &amp; "&lt;/years&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;program GPA='0.0'&gt;" &amp; txtEdProgram.Text &amp; "&lt;/program&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;note1&gt;" &amp; txtEdNote1.Text &amp; "&lt;/note1&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;note2&gt;" &amp; txtEdNote2.Text &amp; "&lt;/note2&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;/college&gt;" &amp; vbCrLf<br />
<br />
str = str &amp; " &lt;/education&gt;" &amp; vbCrLf<br />
<br />
str = str &amp; " &lt;experience&gt;" &amp; vbCrLf<br />
<br />
str = str &amp; " &lt;company&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;companyName&gt;" &amp; txtExpCoName.Text &amp; "&lt;/companyName&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;townState&gt;" &amp; txtExpLoc.Text &amp; "&lt;/townState&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;years&gt;" &amp; txtExpYears.Text &amp; "&lt;/years&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;position&gt;" &amp; txtExpPosition.Text &amp; "&lt;/position&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;note1&gt;" &amp; txtExpNote1.Text &amp; "&lt;/note1&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;note2&gt;" &amp; txtExpNote2.Text &amp; "&lt;/note2&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;/company&gt;" &amp; vbCrLf<br />
<br />
str = str &amp; " &lt;distinctions&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;note1&gt;" &amp; txtDistNote1.Text &amp; "&lt;/note1&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;note2&gt;" &amp; txtDistNote2.Text &amp; "&lt;/note2&gt;" &amp; vbCrLf<br />
str = str &amp; " &lt;/distinctions&gt;" &amp; vbCrLf<br />
<br />
str = str &amp; " &lt;/experience&gt;" &amp; vbCrLf<br />
<br />
<br />
str = str &amp; " &lt;/docbody&gt;" &amp; vbCrLf<br />
<br />
str = str &amp; "&lt;/resume&gt;" &amp; vbCrLf<br />
<br />
'frmWizard.Visible = False<br />
'MsgBox "Verifying data now!", vbOKOnly<br />
'<br />
'******************************************************************************<br />
subWriteXSLFile<br />
subWriteXMLFile (str)<br />
'******************************************************************************<br />
'<br />
End Sub<br />
<br />
Private Sub cmdStartBlankText_Click()<br />
subWriteFieldBlanks<br />
End Sub<br />
<br />
Private Sub cmdStartDefaultText_Click()<br />
subWriteFieldDefaults<br />
End Sub<br />
<br />
Private Sub Form_Load()<br />
subWriteFieldDefaults<br />
End Sub<br />
<br />
Public Sub subWriteFieldDefaults()<br />
Dim file_path As String<br />
<br />
file_path = App.Path<br />
If right$(file_path, 1) &lt;&gt; "\" Then _<br />
file_path = file_path &amp; "\"<br />
txtPathName.Text = file_path &amp; "output\"<br />
txtFileName.Text = "resume_test.xml"<br />
<br />
<br />
txtResumeName.Text = "First Middle Last"<br />
txtResumeStreet.Text = "123 Street"<br />
txtResumeLoc.Text = "Example City"<br />
txtResumePhone.Text = "123-456-7890"<br />
txtResumeEmail.Text = "email@ISP.com"<br />
txtResumeState.Text = "ST"<br />
txtResumeZip.Text = "12345"<br />
<br />
txtObjectivePrimary.Text = "Type of Employment"<br />
txtObjectiveSecondary.Text = "Skill Set, Secondary Objective"<br />
txtObjectiveLocation.Text = "Location Objective"<br />
txtObjectiveNote1.Text = "Note1"<br />
txtObjectiveNote2.Text = "Note2"<br />
<br />
txtEdName.Text = "Name of Institution"<br />
txtEdYears.Text = "1999-2001"<br />
txtEdLoc.Text = "City, State"<br />
txtEdProgram.Text = "Title of Certification"<br />
txtEdNote1.Text = "Note1"<br />
txtEdNote2.Text = "Note2"<br />
<br />
txtExpCoName.Text = "Name of Institution"<br />
txtExpYears.Text = "1999-2001"<br />
txtExpLoc.Text = "City, State"<br />
txtExpPosition.Text = "Title of Position"<br />
txtExpNote1.Text = "Note1"<br />
txtExpNote2.Text = "Note2"<br />
<br />
txtDistNote1.Text = "Distinctive Orders"<br />
txtDistNote2.Text = "Cannot recommend this person too highly!"<br />
<br />
End Sub<br />
<br />
Public Sub subWriteFieldBlanks()<br />
txtResumeName.Text = ""<br />
txtResumeStreet.Text = ""<br />
txtResumeLoc.Text = ""<br />
txtResumePhone.Text = ""<br />
txtResumeEmail.Text = ""<br />
txtResumeState.Text = ""<br />
txtResumeZip.Text = ""<br />
<br />
txtObjectivePrimary.Text = ""<br />
txtObjectiveSecondary.Text = ""<br />
txtObjectiveLocation.Text = ""<br />
txtObjectiveNote1.Text = ""<br />
txtObjectiveNote2.Text = ""<br />
<br />
txtExpCoName.Text = ""<br />
txtEdYears.Text = ""<br />
txtEdLoc.Text = ""<br />
txtEdProgram.Text = ""<br />
txtEdNote1.Text = ""<br />
txtEdNote2.Text = ""<br />
<br />
txtEdName.Text = ""<br />
txtExpYears.Text = ""<br />
txtExpLoc.Text = ""<br />
txtExpPosition.Text = ""<br />
txtExpNote1.Text = ""<br />
txtExpNote2.Text = ""<br />
<br />
txtDistNote1.Text = ""<br />
txtDistNote2.Text = ""<br />
<br />
txtPathName.Text = App.Path &amp; "\output\"<br />
txtFileName.Text = "resume_test.xml"<br />
End Sub<br />
<br />
<br />
Private Sub subWriteXMLFile(str As String)<br />
Dim fileNum As Integer<br />
Dim txt As String<br />
Dim strNewWriteFilePath As String<br />
Dim strNewReadLocation As String<br />
<br />
' Put in error code here to catch directory not created*************************<br />
strNewWriteFilePath = txtPathName.Text &amp; txtFileName.Text<br />
<br />
' get an available file number<br />
fileNum = FreeFile<br />
' open the file for output<br />
' (change next line if Append is wanted)<br />
Open strNewWriteFilePath For Output As #fileNum<br />
Print #fileNum, str<br />
<br />
' close the file<br />
Close #fileNum<br />
<br />
'Put in WriteStyleSheet()<br />
<br />
'Set command line Shell switch for MSIE to open the file!<br />
'gOpenPathNameBrowser = "c:\progra~1\Intern~1\iexplore.exe "<br />
'strNewWriteFilePath = txtPathName.Text &amp; txtFileName.Text<br />
strNewReadLocation = gOpenPathNameBrowser &amp; strNewWriteFilePath<br />
<br />
Shell strNewReadLocation, 1<br />
<br />
End Sub<br />
<br />
<br />
Private Sub subWriteXSLFile()<br />
Dim fileNum As Integer<br />
Dim xsl_str As String<br />
Dim strNewWriteFilePath As String<br />
<br />
<br />
'*********************************************subWriteXSLFile!!!!*********<br />
xsl_str = ""<br />
xsl_str = xsl_str &amp; "&lt;?xml version='1.0'?&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;!-- Generated by Dobe's Resume Wizard for XML --&gt; " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:stylesheet " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " xmlns:xsl='http://www.w3.org/TR/WD-xsl' " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " xmlns:xtxsl='http://www.w3.org/XSL/Transform/1.0' " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " xmlns:msxsl='http://www.w3.org/TR/WD-xsl' " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " xmlns:fo='http://www.w3.org/1999/XSL/Format' " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " result-ns=''&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:template match=' / '&gt;" &amp; vbCrLf<br />
'xsl_str = xsl_str &amp; " &lt;html xmlns='http://www.w3.org/TR/REC-html40' &gt; " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;html&gt; " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;head&gt;" &amp; vbCrLf<br />
'MsgBox xsl_str, vbOKOnly<br />
<br />
xsl_str = xsl_str &amp; " &lt;title&gt;&lt;xsl:value-of select='resume/title' /&gt;&lt;/title&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;style type='text/css'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " a:link {color: blue; text-decoration:none;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " a:visited {color:blue; text-decoration:none;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " a:active {color:red; text-decoration:none background:lightgreen;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " body {background:ghostwhite; font-family: ariel | helvetica | serif;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " table {background:ghostwhite;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " h1 {font-size:150%; color:black;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " h2 {font-size:115%; color:black;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " div.objectiveMain {font-size:120%; color:black; font-weight:bold; vertical-align:top;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " div.objectiveSkillset {font-size:100%; color:black; vertical-align:top;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " h1.Name {font-size:200%; color:black;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " td.Header {font-style:italic; font-size:80%; color:black; vertical-align:top;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " td.GPA {font-size:80%; color:black; vertical-align:top;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " td.College {font-size:100%; color:black; font-weight:bold; vertical-align:top;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " td.CollegeName {font-size:110%; color:black; font-weight:bold; vertical-align:top;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " td.CompanyName {font-size:110%; color:black; font-weight:bold; vertical-align:top;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " td.CollegeNotes {font-size:90%; color:black; vertical-align:top;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " td.CompanyNotes {font-size:90%; color:black; vertical-align:top;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " td.CollegeYears {font-size:90%; color:black; vertical-align:top;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " td.CompanyYears {font-size:90%; color:black; vertical-align:top;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " td.Company {font-size:100%; color:black; font-weight:bold; vertical-align:top;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " td.CompanyPosition {font-size:100%; color:black; font-weight:bold; vertical-align:top;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " td.distinctionNotes {font-size:90%; color:black; vertical-align:top;}" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/style&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/head&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;body&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;table border='0' width='90%'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;tr align='right'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td&gt; " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td class='header'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; "&lt;!-- Italic, right-aligned, address, phone, email --&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='resume/header/street' /&gt;&lt;br /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='resume/header/city' /&gt;," &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='resume/header/state' /&gt;." &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='resume/header/zipCode' /&gt;&lt;br /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='resume/header/phone' /&gt;&lt;br /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='resume/header/email' /&gt;&lt;br /&gt;&lt;br /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; "&lt;!-- Big font for name, with &lt;hr&gt; --&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;tr align='left'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td colspan='2'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;h1 class='Name'&gt;&lt;xsl:value-of select='resume/name' /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;hr width='100%' /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/h1&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;tr valign='top' height='100'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; "&lt;!-- Begin OBJECTIVE Table --&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;h2&gt;&lt;b&gt;Objective:&lt;/b&gt;&lt;/h2&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;table border='0' cellspacing='0' cellpadding='0' width='100%'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;div class='objectiveMain'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='resume/docbody/objective/primary' /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/div&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='resume/docbody/objective/secondary' /&gt;&lt;br /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='resume/docbody/objective/location' /&gt;&lt;br /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='resume/docbody/objective/note1' /&gt;&lt;br /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='resume/docbody/objective/note2' /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/table&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; "&lt;!-- Begin EDUCATION Table --&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;tr valign='top' height='150'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; "&lt;!-- &amp;horizontalTab; = --&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;h2&gt;&lt;b&gt;Education:&lt;/b&gt;&lt;/h2&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;!-- Begin XSL:FOR-EACH Element for EDUCATION --&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:for-each select='resume/docbody/education/college'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;table border='0' cellspacing='2' cellpadding='2' width='90%'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td class='CollegeName' width='60%'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='././collegeName' /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td class='College' width='25%' align='left'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='././townState' /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td class='CollegeYears' width='15%' align='right'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='././years' /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/table&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;table border='0' cellspacing='2' cellpadding='2' width='90%'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td width='70%' align='left'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;b&gt;&lt;xsl:value-of select='././program' /&gt;&lt;/b&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td class='GPA' width='30%' align='right'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='././program/@GPA/text()' /&gt; GPA" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/table&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;table border='0' cellspacing='2' cellpadding='2' width='90%'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td class='CollegeNotes' align='left'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='././note1' /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/table&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;table border='0' cellspacing='2' cellpadding='2' width='90%'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td class='CollegeNotes' align='left'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='././note2' /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/table&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:apply-templates /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/xsl:for-each&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;!-- End XSL:FOR-EACH Element --&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; "&lt;!-- Begin EXPERIENCE Table --&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;tr valign='top' height='150'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;h2&gt;&lt;b&gt;Experience:&lt;/b&gt;&lt;/h2&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;!-- Begin XSL:FOR-EACH Element for EXPERIENCE --&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:for-each select='resume/docbody/experience/company'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;table border='0' cellspacing='2' cellpadding='2' width='90%'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td class='CompanyName' width='60%' valign='top'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='././companyName/text()' /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td class='Company' width='25%' align='left'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='././townState' /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td class='CompanyYears' width='15%' align='right'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='././years' /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/table&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;table border='0' cellspacing='2' cellpadding='2' width='90%'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td class='CompanyPosition' align='left'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='././position' /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/table&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;table border='0' cellspacing='2' cellpadding='2' width='90%'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td class='CompanyNotes' align='left'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='././note1' /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/table&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;table border='0' cellspacing='2' cellpadding='2' width='90%'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td class='CompanyNotes' align='left'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='././note2' /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/table&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:apply-templates /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/xsl:for-each&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;!-- End XSL:FOR-EACH Element --&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; "&lt;!-- Begin DISTINCTIONS Table --&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;tr valign='top' height='150'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;h2&gt;&lt;b&gt;Distinctions:&lt;/b&gt;&lt;/h2&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;table border='0' align='left' cellspacing='1' cellpadding='3' &gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;td class='distinctionNotes'&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='resume/docbody/experience/distinctions/note1' /&gt; &lt;br /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:value-of select='resume/docbody/experience/distinctions/note2' /&gt; &lt;br /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:apply-templates /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/table&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/td&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/tr&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/table&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " " &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/body&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/html&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;xsl:apply-templates /&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/xsl:template&gt;" &amp; vbCrLf<br />
xsl_str = xsl_str &amp; " &lt;/xsl:stylesheet&gt;" &amp; vbCrLf<br />
<br />
<br />
' Put in error code here to catch directory not created*************************<br />
strNewWriteFilePath = txtPathName.Text &amp; "resume_test.xsl"<br />
<br />
' get an available file number<br />
fileNum = FreeFile<br />
' open the file for output<br />
' (change next line if Append is wanted)<br />
Open strNewWriteFilePath For Output As #fileNum<br />
Print #fileNum, xsl_str<br />
<br />
' close the file<br />
Close #fileNum<br />
<br />
End Sub<br />
<br />
'****************************************BEGIN*GOTFOCUS()*STUFF****<br />
Private Sub txtResumeName_GotFocus()<br />
txtResumeName.SelStart = 0<br />
txtResumeName.SelLength = Len(txtResumeName.Text)<br />
End Sub<br />
<br />
Private Sub txtResumeStreet_GotFocus()<br />
txtResumeStreet.SelStart = 0<br />
txtResumeStreet.SelLength = Len(txtResumeStreet.Text)<br />
End Sub<br />
<br />
Private Sub txtResumeLoc_GotFocus()<br />
txtResumeLoc.SelStart = 0<br />
txtResumeLoc.SelLength = Len(txtResumeLoc.Text)<br />
End Sub<br />
<br />
Private Sub txtResumePhone_GotFocus()<br />
txtResumePhone.SelStart = 0<br />
txtResumePhone.SelLength = Len(txtResumePhone.Text)<br />
End Sub<br />
<br />
Private Sub txtResumeEmail_GotFocus()<br />
txtResumeEmail.SelStart = 0<br />
txtResumeEmail.SelLength = Len(txtResumeEmail.Text)<br />
End Sub<br />
<br />
Private Sub txtResumeState_GotFocus()<br />
txtResumeState.SelStart = 0<br />
txtResumeState.SelLength = Len(txtResumeState.Text)<br />
End Sub<br />
<br />
Private Sub txtResumeZip_GotFocus()<br />
txtResumeZip.SelStart = 0<br />
txtResumeZip.SelLength = Len(txtResumeZip.Text)<br />
End Sub<br />
<br />
Private Sub txtObjectivePrimary_GotFocus()<br />
txtObjectivePrimary.SelStart = 0<br />
txtObjectivePrimary.SelLength = Len(txtObjectivePrimary.Text)<br />
End Sub<br />
<br />
Private Sub txtObjectiveSecondary_GotFocus()<br />
txtObjectiveSecondary.SelStart = 0<br />
txtObjectiveSecondary.SelLength = Len(txtObjectiveSecondary.Text)<br />
End Sub<br />
<br />
Private Sub txtObjectiveLocation_GotFocus()<br />
txtObjectiveLocation.SelStart = 0<br />
txtObjectiveLocation.SelLength = Len(txtObjectiveLocation.Text)<br />
End Sub<br />
<br />
Private Sub txtObjectiveNote1_GotFocus()<br />
txtObjectiveNote1.SelStart = 0<br />
txtObjectiveNote1.SelLength = Len(txtObjectiveNote1.Text)<br />
End Sub<br />
<br />
Private Sub txtObjectiveNote2_GotFocus()<br />
txtObjectiveNote2.SelStart = 0<br />
txtObjectiveNote2.SelLength = Len(txtObjectiveNote2.Text)<br />
End Sub<br />
<br />
Private Sub txtExpCoName_GotFocus()<br />
txtExpCoName.SelStart = 0<br />
txtExpCoName.SelLength = Len(txtExpCoName.Text)<br />
End Sub<br />
<br />
Private Sub txtEdYears_GotFocus()<br />
txtEdYears.SelStart = 0<br />
txtEdYears.SelLength = Len(txtEdYears.Text)<br />
End Sub<br />
<br />
Private Sub txtEdLoc_GotFocus()<br />
txtEdLoc.SelStart = 0<br />
txtEdLoc.SelLength = Len(txtEdLoc.Text)<br />
End Sub<br />
<br />
Private Sub txtEdProgram_GotFocus()<br />
txtEdProgram.SelStart = 0<br />
txtEdProgram.SelLength = Len(txtEdProgram.Text)<br />
End Sub<br />
<br />
Private Sub txtEdNote1_GotFocus()<br />
txtEdNote1.SelStart = 0<br />
txtEdNote1.SelLength = Len(txtEdNote1.Text)<br />
End Sub<br />
<br />
Private Sub txtEdNote2_GotFocus()<br />
txtEdNote2.SelStart = 0<br />
txtEdNote2.SelLength = Len(txtEdNote2.Text)<br />
End Sub<br />
<br />
Private Sub txtEdName_GotFocus()<br />
txtEdName.SelStart = 0<br />
txtEdName.SelLength = Len(txtEdName.Text)<br />
End Sub<br />
<br />
Private Sub txtExpYears_GotFocus()<br />
txtExpYears.SelStart = 0<br />
txtExpYears.SelLength = Len(txtExpYears.Text)<br />
End Sub<br />
<br />
Private Sub txtExpLoc_GotFocus()<br />
txtExpLoc.SelStart = 0<br />
txtExpLoc.SelLength = Len(txtExpLoc.Text)<br />
End Sub<br />
<br />
Private Sub txtExpPosition_GotFocus()<br />
txtExpPosition.SelStart = 0<br />
txtExpPosition.SelLength = Len(txtExpPosition.Text)<br />
End Sub<br />
<br />
Private Sub txtExpNote1_GotFocus()<br />
txtExpNote1.SelStart = 0<br />
txtExpNote1.SelLength = Len(txtExpNote1.Text)<br />
End Sub<br />
<br />
Private Sub txtExpNote2_GotFocus()<br />
txtExpNote2.SelStart = 0<br />
txtExpNote2.SelLength = Len(txtExpNote2.Text)<br />
End Sub<br />
<br />
Private Sub txtDistNote1_GotFocus()<br />
txtDistNote1.SelStart = 0<br />
txtDistNote1.SelLength = Len(txtDistNote1.Text)<br />
End Sub<br />
<br />
Private Sub txtDistNote2_GotFocus()<br />
txtDistNote2.SelStart = 0<br />
txtDistNote2.SelLength = Len(txtDistNote2.Text)<br />
End Sub<br />
'****************************************BEGIN*GOTFOCUS()*STUFF****<br />
'<br />
' &lt;!--<br />
' John W. Hartman alias "Dobe Doinat"<br />
' A resume, in XML format, written as a Tutorial and Sample code<br />
' Version 0.10-13-2001.12:39.internalDTD<br />
'<br />
' To include an external DTD:<br />
' &lt;!DOCTYPE rootElement SYSTEM "../location_dtd/DTD_FileName.dtd"&gt;<br />
'<br />
' To include an internal DTD:<br />
' &lt;!DOCTYPE footElement [<br />
' &lt;!ENTITY nbsp " "&gt;<br />
' &lt;!ELEMENT nextElement (firstContainedElement, secondContainedElement)&gt;<br />
' &lt;!ATTLIST firstElement CDATA #REQUIRED&gt;<br />
' ]&gt;<br />
'<br />
' To include an external XML Style Sheet Transform file (XSLT):<br />
' &lt;?xml-stylesheet type="text/xsl" href="..\location_xsl\XSLT_FileName.xsl" ?&gt;<br />
'<br />
' To include an internal XML Style Sheet Transform file (XSLT)<br />
' Note: This did not work for me in XMLWriter - your parse engine may vary!<br />
' (Note: not all XML parse engines support this feature!):<br />
' &lt;?xml-stylesheet type="text/xml" href="#dobeResumeStyle"?&gt;<br />
' &lt;xsl:stylesheet id="dobeResumeStyle" version="1.0"<br />
' xmlns:xsl="http://www.w3.org/1999/XSL/Transform"&gt;<br />
'<br />
' To include an external Cascading Style Sheet:<br />
' &lt;?xml-stylesheet type="text/css" href="../location_css/StyleSheetName.css" ?&gt;<br />
'<br />
' To include an internal Cascading Style Sheet (In XHTML or XSLT):<br />
' &lt;style type="text/css"&gt;<br />
' a:visited {color: green; text-decoration: none}<br />
' body {background: lightblue; margin-left: 5%; margin-right: 5%;}<br />
' h1 {font-size:150%; color: green;}<br />
' &lt;/style&gt;<br />
'<br />
' Some built-in DTD keywords:<br />
' CDATA | Enumerated |ID | IDREF | IDREFS | ENTITY | ENTITIES | NMTOKEN |<br />
' NMTOKENS | NOTATION | #REQUIRED | #IMPLIED | #FIXED | value<br />
'<br />
' Some built-in DTD rules:<br />
' | means either one or the other<br />
' * means 0 to many (times it may occur)<br />
' , means in sequence shown<br />
' + means 1 to many (times it may occur)<br />
' ? means 0 to one (times it may occur)<br />
' --&gt;<br />
'<br />
'<br />
</span></td>
</tr>
</tbody>
</table>
