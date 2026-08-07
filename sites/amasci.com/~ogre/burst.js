<!-- BEGIN RICH-MEDIA BURST! CODE --> 
<!-- /* © 1997-2001 BURST! Media, LLC. All Rights Reserved.*/ 
function ShowBurstAd(adcode, width, height) {
 var bN = navigator.appName;
 var bV = parseInt(navigator.appVersion);   
 var base='http://www.burstnet.com/';   
 var Tv='';   
 var agt=navigator.userAgent.toLowerCase();   
 if (bV>=4)  
 {ts=window.location.pathname+window.location.search;
  i=0; Tv=0; while (i< ts.length)
    { Tv=Tv+ts.charCodeAt(i); i=i+1; } Tv="/"+Tv;}
  else   {Tv=escape(window.location.pathname);
  if( Tv.charAt(0)!='/' ) Tv="/"+Tv; 
    else if (Tv.charAt(1)=="/")
 Tv="";     
 if( Tv.charAt(Tv.length-1) == "/")
   Tv = Tv + "_";}   
 if (bN=='Netscape'){        
  if ((bV>=4)&&(agt.indexOf("mac")==-1))  
 { document.write('<s'+'cript src="'+ 
  base+'cgi-bin/ads/'+adcode+'.cgi/RETURN-CODE/JS' 
  +Tv+'">'); 
  document.write('</'+'script>');
 }
   else if (bV>=3) {document.write('<'+'a href="'+base+'ads/' + 
  adcode + '-map.cgi'+Tv+'"target=_top>');
  document.write('<img src="' + base + 'cgi-bin/ads/' +
  adcode + '.cgi' + Tv + '" width="' + width + '" height="' + height + '"' +
  ' border="0" alt="Click Here"></a>');}   
}
if (bN=='Microsoft Internet Explorer')    
document.write('<ifr'+'ame id="BURST" src="'+base+'cgi-bin/ads/'  
+     
adcode + '.cgi' + Tv + '/RETURN-CODE" width="' + width + '" height="' + height + '"' +     
'marginwidth="0" marginheight="0" hspace="0" vspace="0" ' +     
'frameborder="0" scrolling="no"></ifr'+'ame>');  
}
//-->
