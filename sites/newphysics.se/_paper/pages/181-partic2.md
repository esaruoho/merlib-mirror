---
title: "partic2"
source_domain: newphysics.se
source_path: teden/Tedenstig/own/partic2.htm
order: 181
reachable_from_entry: false
images: 14
internal_links: 0
extracted: 2026-08-14T06:03:43Z
extractor: site_to_paper.py (builtin)
---

# partic2

*Source page: `teden/Tedenstig/own/partic2.htm`*

This article has been replaced by chapter 8B in "Matter Unified" the HTML version on :

http://www.newphys.se/elektromagnum/physics/Tedenstig/own

 

 

Complex elementary particles

Continued from partic1

By Ove Tedenstig, Sweden 1999-07-30

Home site : 
http://www.newphys.se/elektromagnum/physics/Tedenstig

http://newphys.se/elektromagnum/physics/Tedenstig/own

Email : 
ove.tedenstig@swipnet.se

Continued from section part1.html

As discussed before in our theory, complex elementary particles are defined as these particles composed by two or more basic particles as defined in section part1. As to give an example, the neutron is composed by a proton and an electron. The Pi-meson is composed by an muon and another particle in orbital. Individual particles in such a complex composed particle, are influenced by the "strong force", being the shadow force from the very strong vacuum mass pressure. 

At first instance, we look at some well known mass particle spectra, that in order to see that there in fact exists a clear pattern by which spectrum particles are created.

Picture partf14.gif

 

If we study the mass difference between the base particle and the nearest spectrum particle, we se that this mass difference not correspond with mass of any known singular particle. We easily see, that this mass difference can be motivated by a mass increase of the orbiting particle in accord with how mass is added to particle when reaching the system's inherent speed, the light velocity. The formula for this relation between mass and energy has been derived on our theory "Matter Unified" and is also known as the mass/energy equivalence formula :

Picture partf15.gif

 

The orbiting particle is kept in orbit by the strong force between the particles included into the system. This force is a shadow force on near situated particles got by the full pressure of the vacuum field with density 1/
e
o 
and is calculated by the following formula :

Picture partf16.gif

 

When the orbital particle move, there will be an outer expanding force according Newton's law of force. This force will be :

Picture partf17.gif

 

According our particle theory part1, every base particle in the system has two independent plasma resonance frequencies. These oscillations disturbs the environment electromagnetic field, which vary with these oscillations. An orbiting particle then will follow these variations, resulting in that the orbiting time will be equal to one of these system oscillations. In a system containing 2, hence there are 4 possible orbiting time resonance's, which are 

Picture partf18.gif

 

If there are more than one orbital particle in the system, the total orbital mass shall be introduced in the formula K1 and K3, hence Norb x Mo.

We work with formula 17a) and 16c), using results from 15),17b),18b) giving:

 
picture partf19.gif

There is also some strong force interaction between the orbiting particles as well as there are electromagnetic forces between them. But the electromagnetic forces are small in comparison to the strong forces, so they can be neglected in this contest. 

For the strong force interaction between orbits we simply exchange Mc in the formula 19b) with Mo and multiply with the number of orbital particles N-1. For the electromagnetic interaction, we uses the Coulomb's law.

Picture partf20.gif

 

The force equations are solved so that the sum of all forces into the system will be zero. The output mass then the sum of the total particle mass involved.

Picture partf21.gif

 The program below help you to do calculations from this model. The model have been some adjusted for the strong force, introducing a linear component some increasing this force on very short distances, then decreasing some more rapidly on large distances. This component is name "lineforce" in the program.

Figure partf27.gif

 

The program is a "Turbo Pascal" program and can be compiled in such an editor. But the program easily can be rewritten to any other program language.

program	pcomplex;

(* revised 20/8/1999 *)

(* Calculus of complex elementary particle forms in accord with *)

(* basic theory of Matter Unified *)

(* programmer Ove Tedenstig, Idungatan 37, 19 551 Maersta Sweden *)

(* programming version 20-8/99 *)

label 1;

VAR	Kt:real; (* electromagnetic time constant *)

A,z,z1,Result:real; (* help variables *)

n:integer; (* help parameter *)

M0:real; (* start orbit mass *)

Mc:real; (* start center mass *)

Mo:real; (* intermittent orbit mass during computing *)

	Fee,Foo,Forb,Fext:real; (* system forces *)

	Norb:integer; (* number of orbital particles *)

nc:integer; (* type of center particle 1,2,3.... *)

no:integer; (* type of orbital particle *)

State:integer; (* resonance state *)

Mout:real; (* total system mass *)

arr:array(.1..4.) of real; (* help array *)

Dorb:real; (* distans orbit center particle *)

MX:real; (* help parameter *)

linforce:real; (* linear strong force factor *)

Dc:real; (* center particle radius *)

Drel:real; (* realtion Dorb/Dc *)

Ddiff:real; (* realation Dorb-Dc *)

test1,test2,test3,test4:boolean; (* test parameters *)

CONST	pi=3.1415926;

	e=0.5109990615E-3;

	ev=0.5109990615;

	me=9.1066E-31;

Procedure explain_terms;

begin

writeln('The program computes the mass of a complex particle');

writeln('according to a new model for elementary particles ');

writeln('consisting of a center mass and one or several orbital masses');

writeln('Input 0 for electron, 0.51099906 Mev or 1 electron masses');

writeln('Input 1 for Electron, 15.84 Mew or 31 electron masses ');

writeln('Input 2 for myon 0.10565839 Gev or 206.77 electron masses');

writeln('Input 3 for K-on 0.493646 Gev or 966 electron masses');

writeln('Input 4 for proton, 0.93827232 Gev or 1836.12 electron masses');

writeln('Input 5 for Tauon, 1.7841 Gev or 3491.4 electron masses');

writeln('Input 6 for nc, 2.980 Gev or 5832 electron masses ');

writeln('Input 7 for B, 5.2776 Gev or 10327 electron masses ');

writeln('Input 8 for z, 8.3 Gev or 16243 electron masses');

writeln;

writeln('These base particles approximately follows the ');

writeln('mathematical relation M=electron_mass*(k*Pi*n)**3 ');

writeln;

end;

 

PROCEDURE calc(State,n:integer;var r,z1,Mo:real);

var Kn:real;

	begin

Mo:=Mo*(1-Z1);

A:=MX/Mo;

if A=0 then Mo:=m0;

if ((result<1) and (result>0.1)) then z1:=0.001;

if ((result<0.1) and (result>0.01)) then z1:=0.0001;

z:=1/(1+Mo/(Mc+(Norb-1)*Mo));

case State of

1: Kn:=exp(2/3*ln(Mo*Norb));

2: Kn:=Kt*exp(1/3*ln(Mo*Norb));

3: Kn:=exp(2/3*ln(Mc));

4: Kn:=Kt*exp(1/3*ln(Mc));

end;

Dorb:=sqrt(1-A*A)*Kn/z;

Dc:=exp(1/3*ln(Mc));

Drel:=Dorb/Dc;

Ddiff:=Dorb-Dc;

(* revised 20/8 1999 *)

linforce:=49/Dorb; (* stronger force on short distances *)

(* weaker force at long distances *)

Fee:=z*z/(1-A*A)/(Kn*Kn)*Norb;

Foo:=z*z/(1-A*A)/(Kn*Kn)*exp(4/3*ln(Mo));

Forb:=sqrt(1-A*A)/Kn*Mo;

(* revised 20/8/199 *)

Fext:=linforce*z*z/(1-A*A)/(Kn*Kn)*exp(2/3*ln(Mo))*exp(2/3*ln(Mc));

Result:=Forb-Foo-Fext-Fee;

(* revised 20/8/199 *)

(* if an electron comes in and get a mass >E, it *)

(* will be converted to an E-electron *)

if ((No=0) and (Mo>31) and (Mo<207) and (Result<=0) and (test1=false))

then begin

MX:=31;Mo:=MX/0.0001;test1:=true;Result:=10;end;

(* revised 20/8 1999 *)

(* if an electron comes in and get a mass >E, it *)

(* will be converted to an E-electron *)

if ((No=0) and (Mo>=207) and (Result<=0) and (test2=false))

then begin

MX:=207;Mo:=MX/0.0001;test2:=true;result:=10;end;

 

(* if an E-electron comes in and get a mass >u-, it *)

(* will be converted to a u *)

if ((No=1) and (Mo>207) and (Result<=0) and (test3=false)) then begin

MX:=207;Mo:=MX/0.0001;test3:=true;result:=10;end;

 

	end;(*calc*)

procedure inputs;

begin

if n=0 then begin

write('Write center particle type 1,2,3,4,5... ');readln(Nc);end;

if n=0 then begin

write('Write orbit particle type 0,1,2,3,4.... ');readln(No);end;

if n=0 then begin

write('Number of orbits 1,2,3... ');readln(Norb);end;

if (No=0) then M0:=1;(*electron mass*)

if (No=1) then M0:=31; (* E mass *)

if (No=2) then M0:=206.77;(*muon mass*)

if (No=3) then M0:=966.6;(*kaon-mass*)

if (No=4) then M0:=1836.12;(*proton-mass*)

if (No=5) then M0:=1784.2/ev;(*tau-mass*)

if (No=6) then M0:=2978/ev;(*eta-mass*)

if (No=7) then M0:=5277.6/ev; (*B meson mass*)

if (No=8) then M0:=8300/ev;

if (Nc=1) then Mc:=31;

if (Nc=2) then Mc:=206.77;(*muon-mass*)

if (Nc=3) then Mc:=966.6;(*kaon-mass*)

if (Nc=4) then Mc:=1836.12;(*proton-mass*)

if (Nc=5) then Mc:=1784.2/ev;(*tau-mass*)

if (Nc=6) then Mc:=2978/ev;(*eta-mass*)

if (Nc=7) then M0:=5277.6/ev; (*B meson mass*)

if (Nc=8) then Mc:=8300/ev;

end;

procedure calc_mean;

var n:integer;

m:real;

begin

m:=0;

for n:=1 to 4 do begin

m:= m+arr(.n.);

end;

writeln('Mout_mean x electron masses = ',m/4:5:4);

writeln('Mout Mev ',m/4*ev:5:4);

end;

procedure parameters;

begin

Kt:=5.3455; (* electromagnetic time constant *)

Z1:=0.001; (* test incrementation of orbit mass *)

end;

(************************ START PROGRAM *******************************)

begin

1: explain_terms;

parameters;

inputs;

for State:=1 to 4 do

begin

test1:=false;

test2:=false;

test3:=false;

test4:=false;

MX:=M0;

Mo:=MX/Z1; (* start orbit mass value, high to low value *)

result:=100;

while Result>0 do begin

calc(State,n,Result,z1,Mo);

end;(*while r-loop*)

Mout:=Mc+(Norb*Mo);

arr(.State.):=Mout;

write('Dorb = ',dorb:3:2);

write(' Dc = ',dc:3:2);

write(' Drel = ',drel:3:2);

Ddiff:=dorb-dc;

write(' Ddiff = ',Ddiff:3:2);

writeln(' linforce = ',linforce);

writeln('Mx = ',Mx);

if state=1 then

writeln('Orbit 1, Mout x electron mass = ',Mout:5:2,' ',Mout*ev:5:2,' Mev');

if state=2 then

writeln('Orbit 2, Mout x electron mass = ',Mout:5:2,' ',Mout*ev:5:2,' Mev');

if state=3 then

writeln('Center 1, Mout x electron mass = ',Mout:5:2,' ',Mout*ev:5:2,' Mev');

if state=4 then

writeln('Center 2, Mout x electron mass = ',Mout:5:2,' ',Mout*ev:5:2,' Mev');

writeln;

end; (* State *)

calc_mean;

readln;

goto 1;

end.

Figure partf22.gif

Figure partf23.gif

 

Figure partf24.gif

 

Figure partf25.gif

 

Figure partf26.gif
