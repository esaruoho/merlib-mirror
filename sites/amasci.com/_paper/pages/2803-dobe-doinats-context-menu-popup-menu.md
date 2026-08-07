---
title: "Dobe Doinat's Context Menu (PopUp Menu)"
source_domain: amasci.com
source_path: ~dobe/dobeContextMenu.htm
order: 2803
reachable_from_entry: false
images: 2
internal_links: 0
extracted: 2026-08-07T17:09:23Z
extractor: site_to_paper.py (pandoc)
---

# Dobe Doinat's Context Menu (PopUp Menu)

*Source page: `~dobe/dobeContextMenu.htm`*

<div id="_dobeContext_Start">

</div>

# Right Click To Use Context Menu!

## Demonstration of a context menu of links

------------------------------------------------------------------------

> <img src="./_dobeTutAllCommon/twinkle.gif" title="Do you like this image?" id="_img_twinkle_gif1" alt="If Browser can&#39;t find image, you&#39;ll see this!" /> **Right-click anywhere in this document for a context menu of links!** <img src="./_dobeTutAllCommon/twinkle.gif" title="Do you like this image?" id="_img_twinkle_gif2" alt="If Browser can&#39;t find image, you&#39;ll see this!" />

<div>

 

</div>

------------------------------------------------------------------------

## Here's how the links in the PopUp Menu work

> ### Have this in the \<body\> section of the document:
>
> \
> \<div id='**ie5menu**' onMouseover='**highlightie5()**' onMouseout='**lowlightie5()**' onClick='**jumptoie5()**'\>\
> \
> \<div class='**menuitems**' url='**index.html**'\>index.html\</div\>\
> \<hr class='menuitems' /\>\
> \<div class='menuitems' url='**PNA500_XHTML.HTM**'\>PNA500_XHTML.HTM\</div\>\
> \<div class='menuitems' url='**PNADataIsland.htm**'\>PNADataIsland.htm\</div\>\
> \<div class='menuitems' url='**PNA500_XSLT.XML**'\>PNA500_XSLT.XML\</div\>\
> \<div class='menuitems' url='**PNA500_XML.XML**'\>PNA500_XML.XML\</div\>\
> \<div class='menuitems' url='**PNA500_XSLT.XSL**'\>PNA500_XSLT.XSL\</div\>\
> \<hr class='menuitems' /\>\
> \<div class='menuitems' url='**PNAdobeWebTut.htm**'\>PNAdobeWebTut.htm\</div\>\
> \<hr class='menuitems' /\>\
> \<div class='menuitems' url='**JohnWHartman_Resume.xml**'\>JohnWHartman_Resume.xml\</div\>\
> \<hr class='menuitems' /\>\
> \<div class='menuitems' url='**mailto:dobe@eskimo.com**'\>Email Dobe\</div\>\
> \
> \</div\>\
> \
> \
>
> <table data-border="1" width="80%" title="Here&#39;s the event script!">
> <colgroup>
> <col style="width: 100%" />
> </colgroup>
> <tbody>
> <tr>
> <td>    &lt;script language="JavaScript1.2"&gt;<br />
>  &lt;!--<br />
>     document.oncontextmenu=<strong>showmenuie5</strong>;<br />
>     if (document.all &amp;&amp; window.print)<br />
>     document.body.onclick=<strong>hidemenuie5</strong>;<br />
>  --&gt;<br />
>     &lt;/script&gt;<br />
>  </td>
> </tr>
> </tbody>
> </table>

------------------------------------------------------------------------

## Here's the JavaScript

> ### Have this script in the \<head\> section of the document:
>
> \
> \<**head**\>\
>  \
>  \<**style** type "text/css"\>\
>  \<!--\
>   /\*\
>   DOBE_NOTE: Change the third line down to change width of menu...\
>   \*/\
>  \
>   **\#ie5menu{**\
>   position:absolute;\
>   width:200px;\
>   border:2px solid brown;\
>   background-color:ghostwhite;\
>   font-family:arial;\
>   line-height:20px;\
>   cursor:hand;\
>   visibility:**hidden**;\
>   **}**\
>  \
>   .**menuitems**{\
>   padding-left:15px;\
>   padding-right:15px;\
>   }\
>  --\>\
>  \<**/style**\>\
>
> ------------------------------------------------------------------------
>
> \
>   \<**script** language="JavaScript1.2"\>\
>   //set this variable to 1 if you wish the URLs of the highlighted menu\
>   //to be displayed in the status bar or '0' to hide the URLs...\
>  \
>   var **display_url** = 1;\
>  \
>   function **showmenuie5()**{\
>   var **rightedge** = document.body.clientWidth-event.clientX;\
>   var **bottomedge** = document.body.clientHeight-event.clientY;\
>  \
>   if (rightedge\<ie5menu.offsetWidth)\
>   ie5menu.style.left=document.body.scrollLeft+event.clientX-ie5menu.offsetWidth;\
>   else\
>   ie5menu.style.left=document.body.scrollLeft+event.clientX;\
>  \
>   if (bottomedge\<ie5menu.offsetHeight)\
>   ie5menu.style.top=document.body.scrollTop+event.clientY-ie5menu.offsetHeight;\
>   else\
>   ie5menu.style.top=document.body.scrollTop+event.clientY;\
>  \
>   **ie5menu.style.visibility="visible";**\
>   **return false;**\
>   }\
>  \
>   function **hidemenuie5()**{\
>   ie5menu.style.visibility="hidden";\
>   }\
>  \
>   function **highlightie5()**{\
>   if (event.srcElement.className=="menuitems"){\
>   event.srcElement.style.backgroundColor="highlight";\
>   event.srcElement.style.color="white";\
>   }\
>   **if (display_url==1){\
>   window.status=event.srcElement.url;\
>   }**\
>   }\
>  \
>   function **lowlightie5()**{\
>   if (event.srcElement.className=="menuitems"){\
>   event.srcElement.style.backgroundColor="";\
>   event.srcElement.style.color="brown";\
>   window.status="";\
>   }\
>   }\
>  \
>   function **jumptoie5()**{\
>   if (event.srcElement.className=="menuitems")\
>   window.location=event.srcElement.url;\
>   }\
>   \<**/script**\>\
> \
>  \
>   \<**/head**\>\
>  

<div>

 

</div>

------------------------------------------------------------------------

<div id="ie5menu" onmouseover="highlightie5()" onmouseout="lowlightie5()" onclick="jumptoie5()">

<div class="menuitems" url="index.html">

index.html

</div>

------------------------------------------------------------------------

<div class="menuitems" url="PNA500_XHTML.HTM">

PNA500_XHTML.HTM

</div>

<div class="menuitems" url="PNADataIsland.htm">

PNADataIsland.htm

</div>

<div class="menuitems" url="PNA500_XSLT.XML">

PNA500_XSLT.XML

</div>

<div class="menuitems" url="PNA500_XML.XML">

PNA500_XML.XML

</div>

<div class="menuitems" url="PNA500_XSLT.XSL">

PNA500_XSLT.XSL

</div>

------------------------------------------------------------------------

<div class="menuitems" url="PNAdobeWebTut.htm">

PNAdobeWebTut.htm

</div>

------------------------------------------------------------------------

<div class="menuitems" url="JohnWHartman_Resume.xml">

JohnWHartman_Resume.xml

</div>

------------------------------------------------------------------------

<div class="menuitems" url="mailto:dobe@eskimo.com">

Email Dobe

</div>

</div>

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
<a href="#_dobeContext_Start"></a>
<strong>Back to the Beginning of this page</strong></td>
</tr>
</tbody>
</table>
