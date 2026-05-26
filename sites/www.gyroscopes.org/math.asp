
<html>
<head>
  <title>The Gyroscope - Everything you needed to know</title>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
  <meta http-equiv="pics-label" content='(pics-1.1 "http://www.icra.org/ratingsv02.html" comment "ICRAonline EN v2.0" l gen true for "no gen term" r (nz 0 vz 0 lz 0 oz 0 cz 0) "http://www.rsac.org/ratingsv01.html" l gen true for "no gen term" r (n 0 s 0 v 0 l 0))'>
  <META NAME="Author" CONTENT="Glenn Turner">
  <META NAME="keywords" CONTENT="gyroscope, gyroscopes , gyro, gyros, gyroscopic propulsion">
  <META NAME="Description" CONTENT="The Gyroscope has many uses, this site explains how a gyroscope works and what it can be used for. The site also looks at the possible use of gyroscope based propulsion (gyroscopic propulsion). ">
  <META NAME="Copyright" CONTENT="Copyright 2003 (All Web Pages) by Glenn Turner">
  <link rel="stylesheet" href="/iesite.css" type="text/css">
</head>
<body bgcolor="#000000">
  <div style="position: absolute; top: 2; width=100%; z-index: 1"><center><img src="/header.jpg" alt="" hspace=0 vspace=0 width=700 height=111></center></div>

  <table border=0 cellpadding=0 cellspacing=0 width="0" height="96">
  <tr>
    <td></td>
  </tr>
  </table>

  <center>
  <span class="menutitle">
    <a href="/index.asp"><font color="#991111">Home</font></a> : 
    <a href="/gallery.asp"><font color="#991111">Gallery</font></a> : 
    <a href="/history.asp"><font color="#991111">History</font></a> : 
    <a href="/uses.asp"><font color="#991111">Uses</font></a> :
    <a href="/behaviour.asp"><font color="#991111">Behaviour</font></a> : 
    <a href="/math.asp"><font color="#991111">Maths</font></a> :
    <a href="/forum/qa.asp"><font color="#991111">Forum</font></a> : 
    <a href="/propulsion.asp"><font color="#991111">Propulsion</font></a> : 
    <a href="/links.asp"><font color="#991111">Links</font></a> :
    <a href="/glossary.asp"><font color="#991111">Glossary</font></a>
    <br>
  </span>

  <table border=0 cellpadding=0 cellspacing=0 width="0" height="11">
  <tr>
    <td></td>
  </tr>
  </table>
  

<table class=tabholder cellspacing="0" cellpadding="0" border="0" width=700 ID="Table4">
<tr>
<td height="4"></td>
</tr>
<tr>
<td width="100">

<table class=tabmenu cellspacing="0" cellpadding="0" border="0" width="100">
  <tr>
    <td colspan="3" class=tabtop height="1"><img src="trans.gif" width="1" height="1" border="0"></td>
  </tr>
  <tr>
    <td colspan="3" class=tableft height="1"><img src="trans.gif" width="1" height="1" border="0"></td>
    <td colspan="1" class=tabright height="1" width="1"><img src="trans.gif" width="1" height="1" border="0"></td>
  </tr>
  <tr>
    <td class=tableft width="2" height="19"><img src="trans.gif" width="1" height="1" border="0"></td>
    <td class=tabcenter width="96" height="19" align="center"><a href='math.asp'>Maths</a></td>
    <td class=tabright width="1" height="19"><img src="trans.gif" width="1" height="1" border="0"></td>
    <td class=tabright class=tabbg width="1" height="19"><img src="trans.gif" width="1" height="1" border="0"></td>
  </tr>
  <tr>
    <td class=tabcenter colspan="4" height="1"><img src="trans.gif" width="1" height="1" border="0"></td>
  </tr>
</table>

</td>
<td width="5">
</td>
<td width="100">

<table class=tabmenuback cellspacing="0" cellpadding="0" border="0" width="100">
  <tr>
    <td colspan="3" class=tabtop height="1"><img src="trans.gif" width="1" height="1" border="0"></td>
  </tr>
  <tr>
    <td colspan="3" class=tableft height="1"><img src="trans.gif" width="1" height="1" border="0"></td>
    <td colspan="1" class=tabright height="1" width="1"><img src="trans.gif" width="1" height="1" border="0"></td>
  </tr>
  <tr>
    <td class=tableft width="2" height="16"><img src="trans.gif" width="1" height="1" border="0"></td>
    <td class=tabcenter width="96" height="16" align="center"><a href='math2.asp'>More Maths</a></td>
    <td class=tabright width="1" height="16"><img src="trans.gif" width="1" height="1" border="0"></td>
    <td class=tabright class=tabbg width="1" height="16"><img src="trans.gif" width="1" height="1" border="0"></td>
  </tr>
  <tr>
    <td class=tabcenter colspan="4" height="1"><img src="trans.gif" width="1" height="1" border="0"></td>
  </tr>
</table>

</td>
<td>
&nbsp;
</td>
</tr>
</table>




  <table border=0 cellpadding=8 cellspacing=0 width="700" height="260" bgcolor="#FFFFFF" ID="Table1">
  <tr>
    <td valign="top" class="main">
<SCRIPT><!--Beginning of Javascript applet----------------------------------------------
function updat(msg)
{
var pi=3.14159265358979;
document.form1.diameter.value=document.form1.radius.value * 2;
document.form1.circumference.value=2 * document.form1.radius.value * pi;
document.form1.volume.value=(pi * (document.form1.radius.value * document.form1.radius.value)) * document.form1.depth.value;
document.form1.mass.value=document.form1.volume.value * document.form1.density.value;

document.form1.cdiameter.value=document.form1.cradius.value * 2;
document.form1.ccircumference.value=2 * document.form1.cradius.value * pi;
document.form1.cvolume.value=(pi * (document.form1.cradius.value * document.form1.cradius.value) * document.form1.cdepth.value) * document.form1.numcutaways.value;
document.form1.cmass.value=document.form1.cvolume.value * document.form1.density.value;

document.form1.gvolume.value=document.form1.volume.value - document.form1.cvolume.value;
document.form1.gmass.value=document.form1.mass.value - document.form1.cmass.value;

document.form1.inertia.value=document.form1.mass.value * (document.form1.radius.value * document.form1.radius.value)  / 2;
document.form1.cinertia.value=document.form1.cmass.value * (document.form1.cradius.value * document.form1.cradius.value) / 2;
document.form1.ginertia.value=document.form1.inertia.value - document.form1.cinertia.value;


document.form1.wkph.value=((document.form1.wrpm.value * document.form1.circumference.value) / 1000) * 360;
document.form1.wdps.value=(document.form1.wrpm.value * 360) / 60;
document.form1.wrps.value=document.form1.wrpm.value / 60;
document.form1.w.value=document.form1.wrps.value * (2 * pi);

//must do in order.
document.form1.maindps.value=document.form1.maindegrees.value / document.form1.mainseconds.value;
document.form1.mainrps.value=document.form1.maindps.value / 360;
document.form1.mainrpm.value=document.form1.mainrps.value * 60;
document.form1.mainradians.value=document.form1.maindegrees.value / (360 / (pi * 2));
document.form1.mainomega.value=document.form1.mainrps.value * (2 * pi);

document.form1.c.value=document.form1.ginertia.value * document.form1.w.value * document.form1.mainomega.value;

document.form1.bearforcenm.value=document.form1.c.value / document.form1.beardist.value;
document.form1.beareachnm.value=document.form1.bearforcenm.value / 2;
document.form1.bearforce.value=document.form1.bearforcenm.value * 0.1;
document.form1.beareach.value=document.form1.beareachnm.value * 0.1;
}
//--end of Java Script code---------------------></SCRIPT>
<H1 ALIGN="center">Gyroscope Math Page</H1>
<P ALIGN="center">
<B>(feedback welcome)</B><BR>
NOTE: You cannot edit the light coloured fields.
This page requires Javascript.
</P>
<HR>
<H3>Notes and Reference Section</H3>
<BR>
6.283185308 (approx) radians = 1 revolution<BR>
(2 * Pi radians = 1 revolution)<BR>
<BR>
gyroscopic couple, C = I * W * Omega<BR>
<BR>
Force on the bearings, F = (I * W * Omega) / L<BR>
<HR>
<FORM NAME="form1">
<TABLE>
<TR>
	<TD><B>Basic Gyroscope Measurements</B></TD>
	<TD><BR><BR>&nbsp;</TD>
</TR>
<TR>
	<TD COLSPAN="2"><IMG SRC="images/math/gyromeas.gif" WIDTH=355 HEIGHT=315 BORDER=0 ALT="Basic Gyoscope Measurements"></TD>
</TR>
<TR>
	<TD>Density of material</TD>
	<TD><INPUT TYPE="text" NAME="density" VALUE="2713" ONBLUR="updat()"></TD>
</TR>
<TR>
	<TD>Radius (Meters)</TD>
	<TD><INPUT TYPE="text" NAME="radius" VALUE="1" ONBLUR="updat()"></TD>
</TR>
<TR>
	<TD>Diameter (Meters)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="diameter" VALUE="2" DISABLED>(Radius * 2)</TD>
</TR>
<TR>
	<TD>Circumference (Meters)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="circumference" VALUE="3.14159265358979" DISABLED>(2 * Radius * Pi)</TD>
</TR>
<TR>
	<TD>Depth (Meters)</TD>
	<TD><INPUT TYPE="text" NAME="depth" VALUE="0.1" ONBLUR="updat()"></TD>
</TR>
<TR>
	<TD>Volume (Meters Cubed)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="volume" VALUE="0.31415926535897903" DISABLED>(Pi * (Radius ^ 2) * Depth)</TD>
</TR>
<TR>
	<TD>Mass (Kilograms)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="mass" VALUE="852.3140869189101" DISABLED>(Volume * Density)</TD>
</TR>
<TR>
	<TD>Pi</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="pitext" VALUE="3.14159265358979" DISABLED></TD>
</TR>
<TR>
	<TD>&nbsp;</TD>
	<TD></TD>
</TR>
<TR>
	<TD><B>Cut-Away Measurements</B></TD>
	<TD></TD>
</TR>
<TR>
	<TD>Radius (Meters)</TD>
	<TD><INPUT TYPE="text" NAME="cradius" VALUE="0.5" ONBLUR="updat()"></TD>
</TR>
<TR>
	<TD>Diameter (Meters)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="cdiameter" VALUE="1" DISABLED>(Radius * 2)</TD>
</TR>
<TR>
	<TD>Circumference (Meters)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="ccircumference" VALUE="1.570796326794895" DISABLED>(2 * Radius * Pi)</TD>
</TR>
<TR>
	<TD>Depth (Meters)</TD>
	<TD><INPUT TYPE="text" NAME="cdepth" VALUE="0.005" ONBLUR="updat()"></TD>
</TR>
<TR>
	<TD>Number of Cut-Aways</TD>
	<TD><INPUT TYPE="text" NAME="numcutaways" VALUE="2" ONBLUR="updat()"></TD>
</TR>
<TR>
	<TD>Volume of Cut-Aways (Meters Cubed)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="cvolume" VALUE="0.007853981633974474" DISABLED>(Pi * (Radius ^ 2) * Depth)</TD>
</TR>
<TR>
	<TD>Mass of Cut-Aways (Kilograms)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="cmass" VALUE="21.30785217297275" DISABLED>(Volume * Density)</TD>
</TR>
<TR>
	<TD>&nbsp;</TD>
	<TD></TD>
</TR>
<TR>
	<TD><B>Gyroscope Measurements<BR>(After Cut-Aways)</B></TD>
	<TD></TD>
</TR>
<TR>
	<TD>Volume of Gyroscope (Meters Cubed)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="gvolume" VALUE="0.30630528372500454" DISABLED>(Gyro volume - cutaways)</TD>
</TR>
<TR>
	<TD>Mass of Gyroscope (Kilograms)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="gmass" VALUE="831.0062347459374" DISABLED>(Gyro mass - cutaways)</TD>
</TR>
<TR>
	<TD>&nbsp;</TD>
	<TD></TD>
</TR>
<TR>
	<TD><B>Inertia</B></TD>
	<TD></TD>
</TR>
<TR>
	<TD>Gyroscope Inertia (without cut-aways)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="inertia" VALUE="426.15704345945505" DISABLED>(Mass * (radius ^ 2) / 2)</TD>
</TR>
<TR>
	<TD>Inertia Cut-Aways</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="cinertia" VALUE="2.663481521621594" DISABLED>(Mass * (radius ^ 2) / 2)</TD>
</TR>
<TR>
	<TD>Omega (Gyroscope interia after cut-aways)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="ginertia" VALUE="423.4935619378335" DISABLED>(without cutaways - cutaways)</TD>
</TR>
<TR>
	<TD>&nbsp;</TD>
	<TD></TD>
</TR>
<TR>
	<TD><B>Speed of Gyroscope</B></TD>
	<TD></TD>
</TR>
<TR>
	<TD>W (radians per second)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="w" VALUE="104.71975511965966" DISABLED>(rps * ((2 * pi))</TD>
</TR>
<TR>
	<TD>Revolutions Per Minute (RPM)</TD>
	<TD><INPUT TYPE="text" NAME="wrpm" VALUE="1000" ONBLUR="updat()"></TD>
</TR>
<TR>
	<TD>Kilometers Per Hour (KPH)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="wkph" VALUE="1130.9733552923244" DISABLED>(((rpm * circumference) / 1000) * 360)</TD>
</TR>
<TR>
	<TD>Degrees Per Second</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="wdps" VALUE="6000" DISABLED>((rpm * 360) / 60)</TD>
</TR>
<TR>
	<TD>Revolutions Per Second</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="wrps" VALUE="16.666666666666668" DISABLED>(rpm / 60)</TD>
</TR>
<TR>
	<TD>&nbsp;</TD>
	<TD></TD>
</TR>
<TR>
	<TD><B>Speed of Main Structure</B></TD>
	<TD></TD>
</TR>
<TR>
	<TD>Degrees Change</TD>
	<TD><INPUT TYPE="text" NAME="maindegrees" VALUE="360" ONBLUR="updat()"></TD>
</TR>
<TR>
	<TD>Time in seconds</TD>
	<TD><INPUT TYPE="text" NAME="mainseconds" VALUE="1" ONBLUR="updat()"></TD>
</TR>
<TR>
	<TD>Radians Change</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="mainradians" VALUE="6.28318530717958" DISABLED>(degrees / (360 / (pi * 2))</TD>
</TR>
<TR>
	<TD>Degrees Per Second</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="maindps" VALUE="360" DISABLED>(degrees / seconds)</TD>
</TR>
<TR>
	<TD>Revolutions Per Second</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="mainrps" VALUE="1" DISABLED>(dps / 360)</TD>
</TR>
<TR>
	<TD>Revolutions Per Minute (RPM)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="mainrpm" VALUE="60" DISABLED>(rps * 60)</TD>
</TR>
<TR>
	<TD>Omega (Radians per second)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="mainomega" VALUE="6.28318530717958" DISABLED>(rps * ((2 * pi))</TD>
</TR>
<TR>
	<TD>&nbsp;</TD>
	<TD></TD>
</TR>
<TR>
	<TD><B>Details of Precession</B></TD>
	<TD></TD>
</TR>
<TR>
	<TD COLSPAN="2"><IMG SRC="images/math/gyrocoup.gif" WIDTH=337 HEIGHT=272 BORDER=0 ALT="Gyroscopic Couple"></TD>
</TR>
<TR>
	<TD>C (Gyroscopic couple force)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="c" VALUE="278647.5948489761" DISABLED>(Inertia * W * Omega)</TD>
</TR>
<TR>
	<TD>&nbsp;</TD>
	<TD></TD>
</TR>
<TR>
	<TD><B>Force</B></TD>
	<TD></TD>
</TR>
<TR>
	<TD COLSPAN="2"><IMG SRC="images/math/gyroaxle.gif" WIDTH=354 HEIGHT=357 BORDER=0 ALT="Gyroscope Axle Forces"></TD>
</TR>
<TR>
	<TD>Distance between bearings (Meters)</TD>
	<TD><INPUT TYPE="text" NAME="beardist" VALUE="10" ONBLUR="updat()"></TD>
</TR>
<TR>
	<TD>Force on bearings (Newton Meters)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="bearforcenm" VALUE="27864.75948489761" DISABLED>(C / L)</TD>
</TR>
<TR>
	<TD>Force on each bearing (Newton Meters)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="beareachnm" VALUE="13932.379742448805" DISABLED>((C / L) / 2)</TD>
</TR>
<TR>
	<TD>Force on bearings (Kilograms)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="bearforce" VALUE="2786.4759484897613" DISABLED>((C / L) * 0.1)</TD>
</TR>
<TR>
	<TD>Force on each bearing (Kilograms)</TD>
	<TD CLASS="b"><INPUT TYPE="text" NAME="beareach" VALUE="1393.2379742448806" DISABLED>(((C / L) * 0.1 aprox) / 2)</TD>
</TR>
<INPUT TYPE="button" VALUE="Update Values" ONCLICK="updat()">
</TABLE>
</FORM>
    </td>
  </tr>
  </table>
  
  <font class="copyright">
  Webpage. Copyright &copy; 2003 Glenn Turner. All rights reserved. <a href="/site.asp"><font color="#991111">more info</font></a><br>
     All other images/content copyrighted to the designated owners,<br>
      and must not be reproduced or distributed without prior permission. 
  </font>
</center>

</body>
</html>