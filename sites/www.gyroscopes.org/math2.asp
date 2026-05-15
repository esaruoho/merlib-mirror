
<html>
<head>
  <title>Gyroscopes - Everything you needed to know</title>
  <meta HTTP-EQUIV="Content-Type" content="text/html; charset=iso-8859-1">
  <meta http-equiv="pics-label" content='(pics-1.1 "http://www.icra.org/ratingsv02.html" comment "ICRAonline EN v2.0" l gen true for "no gen term" r (nz 0 vz 0 lz 0 oz 0 cz 0) "http://www.rsac.org/ratingsv01.html" l gen true for "no gen term" r (n 0 s 0 v 0 l 0))'>
  <meta name="Author" content="Glenn Turner">
  <meta name="keywords" content="gyroscope, gyroscopes , gyro, gyros, gyroscopic propulsion">
  <meta name="Description" content="Gyroscopes have many uses, this site explains how a gyroscope works and what they can be used for. The site also looks at the possible uses of gyroscope based propulsion (gyroscopic propulsion). ">
  <meta name="Copyright" content="Copyright 2015 (All Web Pages) by Glenn Turner">
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv="expires" content="0">
  <link rel="stylesheet" href="/iesite.css" type="text/css">
  
</head>
<body bgcolor="#000000">
  <div style="  float: center; margin: 0; border: none; padding: 0; " align=center><center><img src="/header.jpg" alt="" hspace=0 vspace=0 width=700 height=111></center></div>
  <center>
  <span class="menutitle">
    <a href="/index.asp"><font color="#DDDDDD">Home</font></a> :
    <a href="/gallery.asp"><font color="#DDDDDD">Gallery</font></a> :
    <a href="/history.asp"><font color="#DDDDDD">History</font></a> :
    <a href="/uses.asp"><font color="#DDDDDD">Uses</font></a> :
    <a href="/behaviour.asp"><font color="#DDDDDD">Behaviour</font></a> :
    <a href="/math.asp"><font color="#DDDDDD">Maths</font></a> :
    <a href="/forum/forums.asp"><font color="#DDDDDD">Forum</font></a> :
    <a href="/propulsion.asp"><font color="#DDDDDD">Propulsion</font></a> :
    <a href="/links.asp"><font color="#DDDDDD">Links</font></a> :
    <a href="/glossary.asp"><font color="#DDDDDD">Glossary</font></a>
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
    <td class=tabcenter width="96" height="16" align="center"><a href='math.asp'>Maths</a></td>
    <td class=tabright width="1" height="16"><img src="trans.gif" width="1" height="1" border="0"></td>
    <td class=tabright class=tabbg width="1" height="16"><img src="trans.gif" width="1" height="1" border="0"></td>
  </tr>
  <tr>
    <td class=tabcenter colspan="4" height="1"><img src="trans.gif" width="1" height="1" border="0"></td>
  </tr>
</table>

</td>
<td width="5">
</td>
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
    <td class=tabcenter width="96" height="19" align="center"><a href='math2.asp'>More Maths</a></td>
    <td class=tabright width="1" height="19"><img src="trans.gif" width="1" height="1" border="0"></td>
    <td class=tabright class=tabbg width="1" height="19"><img src="trans.gif" width="1" height="1" border="0"></td>
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

<H2>Derivation Of The Equations Of Gyroscopic Motion</H2>
<H3><P> by Robert M. Beal </H3> (May 2003) </P>

<P ALIGN=Left>The equations appearing in this document were taken from
various sections of the textbook <U>Engineering Mechanics - Statics
and Dynamics</U>, Third Edition, by R. C. Hibbeler (ISBN 0-02-354140-7),
primarily from chapters 20 and 21 of the Dynamics section; if the reader
wishes to delve deeper into a topic or needs clarification on a part of 
this document, I refer you to Hibbeler's textbook. 
I have pieced together the equations, with occasional modifications and
my own comments, to (hopefully) provide a smoothly
flowing derivation of the equations of gyroscopic motion starting from
the most basic equation of dynamics, F = ma, and proceeding uninterrupted
to the stated goal.
 
<P ALIGN=Left>We will start with Newton's well-known and accepted equation
 relating <I>force </I>(<B>F</B>) to <I>mass</I> (m) and 
<I>acceleration</I> (<B>a</B>).
 For a particle, this is (bold type indicates a vector quantity):

<P><CENTER><FONT FACE="Symbol"> S</FONT><B>F</B>  =  m<B>a</B>   </CENTER>

<P ALIGN=Left>This equation states that the sum of the <I>external</I>
forces acting on a particle equals the particle's mass times its acceleration.
Actually, Newton's original formulation related the external forces to the 
particle's <I>linear momentum</I>:

<P><CENTER><FONT FACE="Symbol"> S</FONT><B>F</B>  =  m<B>v</B>'  </CENTER>

<P ALIGN=Left>Here, <B>v</B> <I>is velocity, </I><B>v</B>'<I> is the time rate
 of change of velocity
(d</I><B>v</B><I>/dt) , and </I>m<B>v</B>' <I>is the time rate of
change of linear momentum.</I> If we chose a reference point O and <B>r</B>
<I>is a position vector to the particle</I>, we can take the cross product of both
sides of this equation to get an expression that relates the <I>moment of
the forces</I> (<B>M</B><SUB>o</SUB>) acting on the particle to the
<I>angular momentum</I> (<B>H</B><SUB>o</SUB>) of the particle with respect
to the reference point O:

<P><CENTER><B>r x </B><FONT FACE="Symbol"> S</FONT><B>F</B>  =  <B>r x </B>m<B>v</B>'  </CENTER>

<P ALIGN=Left>Recognizing that <B>r x </B><FONT FACE="Symbol"> S</FONT><B>F</B>
is the <I>Sum of the Moments</I> (<FONT FACE="Symbol"> S</FONT><B>M</B><SUB>o</SUB>)
 of the forces acting on the particle about the
reference point O, we can write:

<P><CENTER><FONT FACE="Symbol"> S</FONT><B>M</B><SUB>o</SUB>  =  <B>r x </B>m<B>v</B>'  </CENTER>

<P ALIGN=Left>Since the particle's angular momentum is
<B>H</B><SUB>o</SUB>  =  <B>r x </B>m<B>v</B>,
if we take the time derivative of angular momentum, we have:

<P><CENTER>d(<B>H</B><SUB>o</SUB>)/dt  =  d(<B>r x </B>m<B>v</B>)/dt
<BR><B>H</B>'<SUB>o</SUB>  =  <B>r</B>' <B>x</B> m<B>v</B> +  <B>r x</B> m<B>v</B>'  </CENTER>

<P ALIGN=Left>Recognizing that <B>v</B> = d<B>r</B>/dt = <B>r</B>' , we have:

<P><CENTER><B>H</B>'<SUB>o</SUB><SUP></SUP>  =  <B>r</B>' <B>x</B> m<B>r</B>' +  <B>r x</B> m<B>v</B>'  </CENTER>

<P ALIGN=Left>Since the cross product of two equivalent vectors is zero,
<B>r</B>' <B>x</B> m<B>r</B>' = m(<B>r</B>' <B>x</B> <B>r</B>') = <B>0</B>,
therefore:

<P><CENTER><B>H</B>'<SUB>o</SUB><SUP></SUP>  =  <B>r x</B> m<B>v</B>'  </CENTER>

<P ALIGN=Left>Substituting into the equation for the Sum of the Moments,
we have:

<P><CENTER><FONT FACE="Symbol"> S</FONT><B>M</B><SUB>o</SUB>  =  <B>H</B>'<SUB>o</SUB> </CENTER>
 
<P ALIGN=Left>That is, given a moving particle, the Sum of the Moments about a
point O is equal to the time rate of change of the particle's angular momentum.

<P ALIGN=Left>For a system of particles, we sum the moments of the forces
of all the particles. In the following equation, <FONT FACE="Symbol">S</FONT><B>f</B>
is the <I>internal</I> force acting on the <I>i</I>th particle due to all
the other particles in the system:

<P><CENTER><FONT FACE="Symbol"> S</FONT><SUB><I>i</I></SUB>[(<B>r</B> <B>x</B> <FONT FACE="Symbol"> S</FONT><B>F</B></SUB>)<SUB><I>i</I></SUB> + (<B>r</B> <B>x</B> <FONT FACE="Symbol">S</FONT><B>f</B>)<SUB><I>i</I></SUB>] = <FONT FACE="Symbol">S</FONT><SUB><I>i</I></SUB>[<B>H</B>'<SUB>o</SUB>]<SUB><I>i</I></SUB> 

<P ALIGN=Left>The <I>internal</I> forces cancel out because corresponding
pairs of internal forces are equal in magnitude and opposite in direction,
therefore, <FONT FACE="Symbol"> S</FONT><SUB><I>i</I></SUB>(<B>r</B> <B>x</B> <FONT FACE="Symbol">S</FONT><B>f</B>)<SUB><I>i</I></SUB> = <B>0</B>,
and the resultant equation for a system of particles has the same form as
the equation for a single particle:

<P><CENTER>
              <FONT FACE="Symbol"> S</FONT><SUB><I>i</I></SUB>[<B>r</B> <B>x</B> <FONT FACE="Symbol"> S</FONT><B>F</B></SUB>]<SUB><I>i</I></SUB> = <FONT FACE="Symbol">S</FONT><SUB><I>i</I></SUB>[<B>H</B>'<SUB>o</SUB>]<SUB><I>i</I></SUB> 

<BR>          <FONT FACE="Symbol"> S</FONT><B>M</B><SUB>o</SUB>  =  <B>H</B>'<SUB>o</SUB>
</CENTER>
 
<P ALIGN=Left>In words, this states that the Sum of the Moments about point O
due to the external forces acting on a system of particles is equal to the
time rate of change of the angular momentum of the system of particles about
this same reference point O.

<P ALIGN=Left>We recognize that any solid body is a system of particles, so
this equation applies to the analysis of a gyroscope.

<P ALIGN=Left>What we need now is an expression for the angular momentum <B>
H</B><SUB>o</SUB> or its time derivative <B>H</B>'<SUB>o</SUB>  that has
attributes that we can physically measure such as mass, radius, angular
velocity, and angular acceleration. If we consider a particle in the body
having an incremental mass <FONT FACE="Symbol">D</FONT>m and having an
<I>angular velocity</I> <FONT FACE="Symbol"><B>w</B></FONT> with respect to
reference point O, since <B>v</B> = <B><FONT FACE="Symbol">w</FONT> x
r</FONT></B>, we can write:

<P><CENTER>[<FONT FACE="Symbol">D</FONT><B>H</B><SUB>o</SUB>]<SUB><I>i</I></SUB> = <B>r x </B><FONT FACE="Symbol">D</FONT>m<SUB><I>i</I></SUB><B>v</B><SUB><I>i</I></SUB>
<BR>[<FONT FACE="Symbol">D</FONT><B>H</B><SUB>o</SUB>]<SUB><I>i</I></SUB> = [<B>r x </B>(<B><FONT FACE="Symbol">w</FONT> x r</B>)]<SUB><I>i</I></SUB><FONT FACE="Symbol">D</FONT>m<SUB><I>i</I></SUB>
</CENTER>

<P ALIGN=Left>Summing all the incremental angular momenta for all the
particles in the body, we have:

<P><CENTER>
<FONT FACE="Symbol">S</FONT><SUB><I>i</I></SUB>[<FONT FACE="Symbol">D</FONT><B>H</B><SUB>o</SUB>]<SUB><I>i</I></SUB> = <FONT FACE="Symbol">S</FONT><SUB><I>i</I></SUB>[<B>r x </B>(<B><FONT FACE="Symbol">w</FONT> x r</B>)]<SUB><I>i</I></SUB><FONT FACE="Symbol">D</FONT>m<SUB><I>i</I></SUB>
</CENTER>

<P ALIGN=Left>If we let <FONT FACE="Symbol">D</FONT> approach 0, then <FONT FACE="Symbol"> D</FONT>[<B>H</B><SUB>o</SUB>]<SUB><I>i</I></SUB> and
<FONT FACE="Symbol">D</FONT>m<SUB><I>i</I></SUB> become differentials, and
we can replace <FONT FACE="Symbol">S</FONT><SUB><I>i</I></SUB> with integration.
I will use <FONT FACE="Symbol"><BIG>z</BIG></FONT> instead of the usual integral sign
simply because I don't have the usual integral sign available:

<P><CENTER>
<FONT FACE="Symbol"><BIG>z</BIG></FONT><SUB><SMALL>H<SUB>o</SUB></SMALL></SUB>d<B>H</B><SUB>o</SUB> = <FONT FACE="Symbol"><BIG>z</BIG></FONT><SUB>m</SUB><B>r x </B>(<B><FONT FACE="Symbol">w</FONT> x r</B>) dm 
<BR><B>H</B><SUB>o</SUB> = <FONT FACE="Symbol"><BIG>z</BIG></FONT><SUB>m</SUB><B>r x </B>(<B><FONT FACE="Symbol">w</FONT> x r</B>) dm 
</CENTER>

<P ALIGN=Left>If we place xyz reference coordinate axes at point O, we can
define <B>H</B><SUB>o</SUB>, <B>r</B>, and <FONT FACE="Symbol"><B>w</B></FONT> in terms of <B>i</B>, 
 <B>j</B>, and <B>k</B> components as follows:
 
<P><CENTER>
<B>H</B><SUB>o</SUB> = H<SUB>x</SUB> <B>i</B> + H<SUB>y</SUB> <B>j</B> + H<SUB>z</SUB> <B>k</B>
<BR><B>r</B> = x <B>i</B> + y <B>j</B> + z <B>k</B>  
<BR><FONT FACE="Symbol"><B>w</B></FONT> = <FONT FACE="Symbol">w</FONT><SUB>x</SUB> <B>i</B> + <FONT FACE="Symbol">w</FONT><SUB>y</SUB> <B>j</B> + <FONT FACE="Symbol">w</FONT><SUB>z</SUB> <B>k</B> 
</CENTER>

<P ALIGN=Left>Substituting into the above integral expression for
<B>H</B><SUB>o</SUB>, we have:

<P><CENTER>
H<SUB>x</SUB> <B>i</B> + H<SUB>y</SUB> <B>j</B> + H<SUB>z</SUB> <B>k</B> =
<BR><FONT FACE="Symbol"><BIG>z</BIG></FONT><SUB>m</SUB>(x <B>i</B> + y <B>j</B> + z <B>k</B>) <B>x</B> [(<FONT FACE="Symbol">w</FONT><SUB>x</SUB> <B>i</B> + <FONT FACE="Symbol">w</FONT><SUB>y</SUB> <B>j</B> + <FONT FACE="Symbol">w</FONT><SUB>z</SUB> <B>k</B> ) <B>x</B> (x <B>i</B> + y <B>j</B> + z <B>k</B>)]dm   
</CENTER>

<P ALIGN=Left>Computing the cross products and combining terms gives:

<P><CENTER>
H<SUB>x</SUB> <B>i</B> + H<SUB>y</SUB> <B>j</B> + H<SUB>z</SUB> <B>k</B> =
<BR>[<FONT FACE="Symbol">w</FONT><SUB>x</SUB><FONT FACE="Symbol"><BIG>z</BIG></FONT><SUB>m</SUB>(y<SUP>2</SUP>+z<SUP>2</SUP>)dm - <FONT FACE="Symbol">w</FONT><SUB>y</SUB><FONT FACE="Symbol"><BIG>z</BIG></FONT><SUB>m</SUB>xy dm - <FONT FACE="Symbol">w</FONT><SUB><BIG>z</BIG></SUB><FONT FACE="Symbol"><BIG>z</BIG></FONT><SUB>m</SUB>xz dm] <B>i</B>
<BR>+ [- <FONT FACE="Symbol">w</FONT><SUB>x</SUB><FONT FACE="Symbol"><BIG>z</BIG></FONT><SUB>m</SUB>xy dm + <FONT FACE="Symbol">w</FONT><SUB>y</SUB><FONT FACE="Symbol"><BIG>z</BIG></FONT><SUB>m</SUB>(x<SUP>2</SUP>+z<SUP>2</SUP>)dm - <FONT FACE="Symbol">w</FONT><SUB><BIG>z</BIG></SUB><FONT FACE="Symbol"><BIG>z</BIG></FONT><SUB>m</SUB>yz dm] <B>j</B>
<BR>+ [- <FONT FACE="Symbol">w</FONT><SUB>x</SUB><FONT FACE="Symbol"><BIG>z</BIG></FONT><SUB>m</SUB>zx dm - <FONT FACE="Symbol">w</FONT><SUB><BIG>y</BIG></SUB><FONT FACE="Symbol"><BIG>z</BIG></FONT><SUB>m</SUB>yz dm + <FONT FACE="Symbol">w</FONT><SUB>z</SUB><FONT FACE="Symbol"><BIG>z</BIG></FONT><SUB>m</SUB>(x<SUP>2</SUP>+y<SUP>2</SUP>)dm] <B>k</B>
</CENTER>

<P ALIGN=Left>Recognizing that the above integrals are <I>moments of inertia</I>
and <I>products of inertia</I>, we can write the above as the following
<I>scalar equations</I>:

<P><CENTER>
H<SUB>x</SUB> = + I<SUB>xx</SUB><FONT FACE="Symbol">w</FONT><SUB>x</SUB> - I<SUB>xy</SUB><FONT FACE="Symbol">w</FONT><SUB>y</SUB> - I<SUB>xz</SUB><FONT FACE="Symbol">w</FONT><SUB>z</SUB>
<BR>H<SUB>y</SUB> = - I<SUB>yx</SUB><FONT FACE="Symbol">w</FONT><SUB>x</SUB> + I<SUB>yy</SUB><FONT FACE="Symbol">w</FONT><SUB>y</SUB> - I<SUB>yz</SUB><FONT FACE="Symbol">w</FONT><SUB>z</SUB>
<BR>H<SUB>z</SUB> = - I<SUB>zx</SUB><FONT FACE="Symbol">w</FONT><SUB>x</SUB> - I<SUB>zy</SUB><FONT FACE="Symbol">w</FONT><SUB>y</SUB> + I<SUB>zz</SUB><FONT FACE="Symbol">w</FONT><SUB>z</SUB>
</CENTER>

<P ALIGN=Left>If we choose a coordinate system such that at least two of the
three orthogonal planes defined by the coordinate system are axes of symmetry
for the body, then all the products of inertia become zero, and our equations
reduce to:

<P><CENTER>
    H<SUB>x</SUB> = I<SUB>xx</SUB><FONT FACE="Symbol">w</FONT><SUB>x</SUB>
<BR>H<SUB>y</SUB> = I<SUB>yy</SUB><FONT FACE="Symbol">w</FONT><SUB>y</SUB> 
<BR>H<SUB>z</SUB> = I<SUB>zz</SUB><FONT FACE="Symbol">w</FONT><SUB>z</SUB>
</CENTER>

<P ALIGN=Left>If the axes are chosen as described above, they are called
<I>principal axes of inertia</I>. We now have the angular momentum
<B>H</B><SUB>o</SUB> in a useful form since the angular velocity can be
measured and the <I>moments of inertia</I> (I), which depend only upon the
mass and physical dimensions of the body, can be looked up in a table or
calculated by hand.

<BR CLEAR=all>
<IMG SRC="images/math/gyro_1.gif">  <IMG SRC="images/math/Gyro_2.gif">

<P ALIGN=Left>Our analysis of the gyroscope will be greatly simplified if we
choose a coordinate system such that at least two of the three orthogonal
planes defined by the coordinate system are axes of symmetry for the
gyroscope. If the coordinate system is chosen to met this criteria, then all
the products of inertia will become zero, and we only have to include moments
of inertia in our calculations. To accomplish this, we will use a <I>rotating
coordinate system</I> with origin at the pivot point of the gyro. The
rotating coordinate system will follow the gyro's nutation and precession but
not its spin. We will call the angular velocity of the rotating reference
<FONT FACE="Symbol"> <B>W</B></FONT> = nutation + precession =
<FONT FACE="Symbol"><B>q</B></FONT>' + <FONT FACE="Symbol"><B>f</B></FONT>'
and label the rotating axes as the xyz axes. We will also have a fixed
reference coordinate system which will also have its origin at the pivot
point of the gyro and we will call this the ABC axes. The angular velocity of
the gyro with respect to the fixed ABC axes will be 
<FONT FACE="Symbol"> <B>w</B></FONT> = nutation + precession + spin =
<FONT FACE="Symbol"><B>q</B></FONT>' + <FONT FACE="Symbol"><B>f</B></FONT>'
 + <FONT FACE="Symbol"><B>y</B></FONT>'(refer to Fig. 1 and Fig. 2). The angles 
<FONT FACE="Symbol"><B>q</B></FONT>, <FONT FACE="Symbol"><B>f</B></FONT>, 
and <FONT FACE="Symbol"><B>y</B></FONT> are called <I>Euler angles</I> after
the Swiss mathematician <I>Leonhard Euler</I>. 


<P ALIGN=Left>Since the xyz axes are rotating with respect to the fixed ABC axes, it is
necessary to evaluate <B>H</B>'<SUB>o</SUB> taking into account that the unit
vectors <B>i, j, and k </B> are not constants since they are changing
direction. We then have:

<P><CENTER> (<B>H</B>'<SUB>o</SUB>)<SUB>ABC</SUB> =  
 H'<SUB>x</SUB><B> i</B> + H'<SUB>y</SUB><B> j</B> + H'<SUB>z</SUB><B> k</B> +   
 H<SUB>x</SUB>(d<B>i</B>/dt) + H<SUB>y</SUB>(d<B>j</B>/dt) + H<SUB>z</SUB>(d<B>k</B>/dt) </CENTER>     

<P ALIGN=Left>where (<B>H</B>'<SUB>o</SUB>)<SUB>ABC</SUB> is the time
derivative of the angular momentum with respect to the fixed ABC axes.
<BR>  The time derivatives of the unit vectors can be expressed as:

<P><CENTER> d<B>i</B>/dt = <B><FONT FACE="Symbol">W</FONT> x i </B>  
<BR>        d<B>j</B>/dt = <B><FONT FACE="Symbol">W</FONT> x j </B>  
<BR>        d<B>k</B>/dt = <B><FONT FACE="Symbol">W</FONT> x k </B>
</CENTER> 

<P ALIGN=Left> The Sum of the Moments equation can then be written as:

<P><CENTER><FONT FACE="Symbol"> S</FONT><B>M</B><SUB>o</SUB>  = H'<SUB>x</SUB><B> i</B> + H'<SUB>y</SUB><B> j</B> + H'<SUB>z</SUB><B> k</B> + <B><FONT FACE="Symbol">W</FONT> x H</B><SUB>o</SUB> </CENTER>     
<P><CENTER><FONT FACE="Symbol"> S</FONT>M<SUB>x</SUB> <B>i</B> +  <FONT FACE="Symbol"> S</FONT>M<SUB>y</SUB> <B>j</B> + <FONT FACE="Symbol"> S</FONT>M<SUB>z</SUB> <B>k</B> = H'<SUB>x</SUB><B> i</B> + H'<SUB>y</SUB><B> j</B> + H'<SUB>z</SUB><B> k</B> + <B><FONT FACE="Symbol">W</FONT> x H</B><SUB>o</SUB> </CENTER>     

<P ALIGN=Left>The tables one finds for moments of inertia for bodies of
various geometrical shapes are for the principal axes of inertia and
are typically listed as I<SUB>xx</SUB>, I<SUB>yy</SUB>, and I<SUB>zz</SUB>.
Since the center of gravity of the flywheel of our gyro lies at a distance R
from the origin O of our coordinate axes, the x and y axes are not principal
axes of inertia, but they are parallel to the principal axes of inertia of
the flywheel. We can therefore use the <I>Parallel Axis Theorem</I> to
relate the x and y components of the moments of inertia to the
I<SUB>xx</SUB> and I<SUB>yy</SUB> moments of inertia  as
shown below. The I<SUB>z</SUB> component does not present a problem since the
z-axis passes thru the flywheel's center of gravity so it is a principal axis
of inertia:

<P><CENTER>
            I<SUB>x</SUB> = I<SUB>xx</SUB> + mR<SUP>2</SUP>
<BR>        I<SUB>y</SUB> = I<SUB>yy</SUB> + mR<SUP>2</SUP>
<BR>        I<SUB>z</SUB> = I<SUB>zz</SUB>              
</CENTER>

<P ALIGN=Left>Keeping in mind the relationships between I<SUB>x</SUB>, 
I<SUB>y</SUB>, I<SUB>z</SUB> and I<SUB>xx</SUB>,I<SUB>yy</SUB>,
I<SUB>zz</SUB>, we can now express the angular momentum of the gyro as: 

<P><CENTER>H<SUB>x</SUB> = I<SUB>x</SUB><FONT FACE="Symbol">w</FONT><SUB>x</SUB> 
<BR>       H<SUB>y</SUB> = I<SUB>y</SUB><FONT FACE="Symbol">w</FONT><SUB>y</SUB> 
<BR>       H<SUB>z</SUB> = I<SUB>z</SUB><FONT FACE="Symbol">w</FONT><SUB>z</SUB>
</CENTER> 
 
<P ALIGN=Left>Substituting the above into the Sum of the Moments equation
and taking the indicated time derivatives yields:

<P ALIGN=Left><FONT FACE="Symbol"> S</FONT>M<SUB>x</SUB> <B>i</B> +  <FONT FACE="Symbol"> S</FONT>M<SUB>y</SUB> <B>j</B> + <FONT FACE="Symbol"> S</FONT>M<SUB>z</SUB> <B>k</B> =
<BR><CENTER>
(I<SUB>x</SUB><FONT FACE="Symbol">w</FONT>'<SUB>x</SUB><B>i</B> + I<SUB>y</SUB><FONT FACE="Symbol">w</FONT>'<SUB>y</SUB><B>j</B> + I<SUB>z</SUB><FONT FACE="Symbol">w</FONT>'<SUB>z</SUB><B>k</B>) + 
[(<FONT FACE="Symbol"> W</FONT><SUB>x</SUB><B>i</B> + <FONT FACE="Symbol"> W</FONT><SUB>y</SUB><B>j</B> + <FONT FACE="Symbol"> W</FONT><SUB>z</SUB><B>k</B>) <B>x</B> (I<SUB>x</SUB><FONT FACE="Symbol">w</FONT><SUB>x</SUB><B>i</B> + 
I<SUB>y</SUB><FONT FACE="Symbol">w</FONT><SUB>y</SUB><B>j</B> + I<SUB>z</SUB><FONT FACE="Symbol">w</FONT><SUB>z</SUB><B>k</B>)]
</CENTER>       

<P ALIGN=Left>Computing the cross products and combining terms, we get the following <I>scalar</I>
equations for the Sum of the Moments:

<P><CENTER>
     <FONT FACE="Symbol">S</FONT>M<SUB>x</SUB> = I<SUB>x</SUB><FONT FACE="Symbol">w</FONT>'<SUB>x</SUB> - I<SUB>y</SUB><FONT FACE="Symbol">W</FONT><SUB>z</SUB><FONT FACE="Symbol">w</FONT><SUB>y</SUB> + I<SUB>z</SUB><FONT FACE="Symbol">W</FONT><SUB>y</SUB><FONT FACE="Symbol">w</FONT><SUB>z</SUB>
<BR> <FONT FACE="Symbol">S</FONT>M<SUB>y</SUB> = I<SUB>y</SUB><FONT FACE="Symbol">w</FONT>'<SUB>y</SUB> - I<SUB>z</SUB><FONT FACE="Symbol">W</FONT><SUB>x</SUB><FONT FACE="Symbol">w</FONT><SUB>z</SUB> + I<SUB>x</SUB><FONT FACE="Symbol">W</FONT><SUB>z</SUB><FONT FACE="Symbol">w</FONT><SUB>x</SUB>
<BR> <FONT FACE="Symbol">S</FONT>M<SUB>z</SUB> = I<SUB>z</SUB><FONT FACE="Symbol">w</FONT>'<SUB>z</SUB> - I<SUB>x</SUB><FONT FACE="Symbol">W</FONT><SUB>y</SUB><FONT FACE="Symbol">w</FONT><SUB>x</SUB> + I<SUB>y</SUB><FONT FACE="Symbol">W</FONT><SUB>x</SUB><FONT FACE="Symbol">w</FONT><SUB>y</SUB>
</CENTER>

<P ALIGN=Left>Referring to Fig. 2, we can express the xyz components of
the angular velocity <FONT FACE="Symbol"><B>W</B></FONT> of the rotating axes
and the xyz components of the angular velocity 
<FONT FACE="Symbol"><B>w</B></FONT> of the gyroscope as follows:

<P><CENTER>
           <FONT FACE="Symbol"><B>W</B></FONT> = <FONT FACE="Symbol"><B>q</B></FONT>' + <FONT FACE="Symbol"><B>f</B></FONT>'
<BR>       <FONT FACE="Symbol"><B>W</B></FONT> = <FONT FACE="Symbol">W</FONT><SUB>x</SUB> <B>i</B> + <FONT FACE="Symbol">W</FONT><SUB>y</SUB> <B>j</B> + <FONT FACE="Symbol">W</FONT><SUB>z</SUB> <B>k</B>
<BR>       <FONT FACE="Symbol"><B>W</B></FONT> = <FONT FACE="Symbol">q</FONT>' <B>i</B> + (<FONT FACE="Symbol">f</FONT>'sin<FONT FACE="Symbol">q</FONT>) <B>j</B> + (<FONT FACE="Symbol">f</FONT>'cos<FONT FACE="Symbol">q</FONT>) <B>k</B>
<BR>  
<BR>       <FONT FACE="Symbol"><B>w</B></FONT> = <FONT FACE="Symbol"><B>q</B></FONT>' + <FONT FACE="Symbol"><B>f</B></FONT>' + <FONT FACE="Symbol"><B>y</B></FONT>'
<BR>       <FONT FACE="Symbol"><B>w</B></FONT> = <FONT FACE="Symbol">w</FONT><SUB>x</SUB> <B>i</B> + <FONT FACE="Symbol">w</FONT><SUB>y</SUB> <B>j</B>+ <FONT FACE="Symbol">w</FONT><SUB>z</SUB> <B>k</B>
<BR>       <FONT FACE="Symbol"><B>w</B></FONT> = <FONT FACE="Symbol">q</FONT>' <B>i</B> + (<FONT FACE="Symbol">f</FONT>'sin<FONT FACE="Symbol">q</FONT>) <B>j</B> + (<FONT FACE="Symbol">f</FONT>'cos<FONT FACE="Symbol">q</FONT> + <FONT FACE="Symbol">y</FONT>' ) <B>k</B>
</CENTER>

<P ALIGN=Left>Substituting the components of <FONT FACE="Symbol"><B>W</B></FONT>
and <FONT FACE="Symbol"><B>w</B></FONT> into the above <I>scalar</I> Sum of the Moments
equations and computing the indicated time derivatives yields:

<P><CENTER>
     <FONT FACE="Symbol">S</FONT>M<SUB>x</SUB> = I<SUB>x</SUB><FONT FACE="Symbol">q</FONT>" - I<SUB>y</SUB>(<FONT FACE="Symbol">f</FONT>')<SUP>2</SUP>cos<FONT FACE="Symbol">q</FONT>sin<FONT FACE="Symbol">q</FONT> + I<SUB>z</SUB><FONT FACE="Symbol">f</FONT>'sin<FONT FACE="Symbol">q</FONT>(<FONT FACE="Symbol">f</FONT>'cos<FONT FACE="Symbol">q</FONT> + <FONT FACE="Symbol">y</FONT>')
<BR> <FONT FACE="Symbol">S</FONT>M<SUB>y</SUB> = I<SUB>y</SUB>(<FONT FACE="Symbol">f</FONT>'<FONT FACE="Symbol">q</FONT>'cos<FONT FACE="Symbol">q</FONT> + <FONT FACE="Symbol">f</FONT>"sin<FONT FACE="Symbol">q</FONT>) - I<SUB>z</SUB><FONT FACE="Symbol">q</FONT>'(<FONT FACE="Symbol">f</FONT>'cos<FONT FACE="Symbol">q</FONT> + <FONT FACE="Symbol">y</FONT>') + I<SUB>x</SUB><FONT FACE="Symbol">f</FONT>'<FONT FACE="Symbol">q</FONT>'cos<FONT FACE="Symbol">q</FONT>
<BR> <FONT FACE="Symbol">S</FONT>M<SUB>z</SUB> = I<SUB>z</SUB>(- <FONT FACE="Symbol">f</FONT>'<FONT FACE="Symbol">q</FONT>'sin<FONT FACE="Symbol">q</FONT> + <FONT FACE="Symbol">f</FONT>"cos<FONT FACE="Symbol">q</FONT> + <FONT FACE="Symbol">y</FONT>") - I<SUB>x</SUB><FONT FACE="Symbol">f</FONT>'<FONT FACE="Symbol">q</FONT>'sin<FONT FACE="Symbol">q</FONT> + I<SUB>y</SUB><FONT FACE="Symbol">f</FONT>'<FONT FACE="Symbol">q</FONT>'sin<FONT FACE="Symbol">q</FONT>
</CENTER>

<P ALIGN=Left>In general, it would be very hard to arrive at a solution that
satisfies these equations, however, in the specific case where the precession
<FONT FACE="Symbol">f</FONT>' is constant, the spin
<FONT FACE="Symbol">y</FONT>' is constant, and the nutation angle 
<FONT FACE="Symbol">q</FONT> = 90<SUP><SMALL>0</SMALL></SUP> is a constant
90 degrees as shown in Fig. 3 below, the solution becomes quite easy:

<BR CLEAR=all> <IMG SRC="images/math/Gyro_3.gif">

<P ALIGN=Left>In this case, we have:

<P><CENTER>
              <FONT FACE="Symbol">q</FONT>' = 0
<BR>          <FONT FACE="Symbol">f</FONT>" = 0
<BR>          <FONT FACE="Symbol">y</FONT>" = 0
<BR>          cos(90<SUP><SMALL>0</SMALL></SUP>) = 0
<BR>          sin(90<SUP><SMALL>0</SMALL></SUP>) = 1
</CENTER>

<P ALIGN=Left>and the Sum of the Moments equations reduce to:

<P><CENTER>
     <FONT FACE="Symbol">S</FONT>M<SUB>x</SUB> = I<SUB>z</SUB><FONT FACE="Symbol">f</FONT>'<FONT FACE="Symbol">y</FONT>'
<BR> <FONT FACE="Symbol">S</FONT>M<SUB>y</SUB> = 0
<BR> <FONT FACE="Symbol">S</FONT>M<SUB>z</SUB> = 0
</CENTER>

<P ALIGN=Left>so the only moment in this case is the moment
about the x-axis. There are no negative signs in this equation and
we consistently used the <I>right-hand-rule</I> in expressing all vector quantities,
therefore, all of the vectors - the sum of the moments about the x-axis
 (<FONT FACE="Symbol">S</FONT>M<SUB>x</SUB>), the precession of the gyro about the y-axis
(<FONT FACE="Symbol">f</FONT>'), and the spin of the flywheel about the z-axis
(<FONT FACE="Symbol">y</FONT>') all act along their respective positive axes as
 indicated in Fig. 3. Our analysis of the the gyroscope lying at
90<SUP><SMALL>0</SMALL></SUP> has boiled down to the following important result:

<P><CENTER>
     <FONT FACE="Symbol">S</FONT>M<SUB>x</SUB> = I<SUB>z</SUB><FONT FACE="Symbol">f</FONT>'<FONT FACE="Symbol">y</FONT>'
</CENTER>

<P ALIGN=Left>If the only moment about the x-axis is the moment resulting
from the weight of the flywheel (we are assuming the weight of the shaft is
negligible), and if the flywheel is at a distance R from the pivot point
(origin O), and recalling that I<SUB>z</SUB> = I<SUB>zz</SUB>, we have:

<P><CENTER>
             mgR = I<SUB>zz</SUB><FONT FACE="Symbol">f</FONT>'<FONT FACE="Symbol">y</FONT>'

</CENTER>

<P ALIGN=Left>where m is the mass of the flywheel and g is the
acceleration due to gravity. 
This equation tells us that if the flywheel is lying at 
90<SUP><SMALL>0</SMALL></SUP> at a distance R from the pivot point
and the flywheel is spinning at a constant angular velocity
<FONT FACE="Symbol">y</FONT>', then the gyro will not topple over as might be
expected, but instead, it will precess about the positive y-axis at a constant
angular velocity of <FONT FACE="Symbol">f</FONT>'.

<P ALIGN=Left>For a solid circular disc, I<SUB>zz</SUB> = 1/2mr<SUP><SMALL>2</SMALL></SUP>
where r is the radius of the disc. If we instead concentrate most of the mass
around the outer edge, then for a thin circular ring,
I<SUB>zz</SUB> = mr<SUP><SMALL>2</SMALL></SUP>:

<P><CENTER>
             solid circular disk:  mgR = 1/2mr<SUP><SMALL>2</SMALL></SUP><FONT FACE="Symbol">f</FONT>'<FONT FACE="Symbol">y</FONT>'
<BR>         thin circular ring:   mgR = mr<SUP><SMALL>2</SMALL></SUP><FONT FACE="Symbol">f</FONT>'<FONT FACE="Symbol">y</FONT>'

</CENTER>

<P ALIGN=Left>To counter the moment mgR, a gyro that uses a solid circular disk as the flywheel
will precess twice as fast as a gyro that uses a thin circular ring (assuming both flywheels
have the same mass m and radius r). 

<P ALIGN=Left>
<BR>
<B>References:</B>
<BR>
<BR><U>Engineering Mechanics - Statics and Dynamics</U>, Third Edition, by R. C. Hibbeler (ISBN 0-02-354140-7)  
<BR>
<BR><U>Engineering Mechanics - Dynamics</U> by Anthony Bedford and Wallace Fowler (ISBN 0-201-58197-3)
<BR>
<BR>Many thanks to Robert M. Beal (email: psisquared@Earthlink.net) for providing this document.
    </td>
  </tr>
  </table>
  
  <font class="copyright">
  Website. Copyright &copy; 2024 Glenn Turner. All rights reserved. <a href="/site.asp">site info</a><br>
     Do not copy without prior permission. Click here for <a target="gyroscopeproducts" href="http://www.gyroscope.com/" alt="Gyroscope products">gyroscope products</a> 
   
  </font>
</center>

</body>
</html>