---
title: "The linearized equations of motion"
source_domain: elmer.unibas.ch
source_path: pendulum/leqm.htm
order: 34
reachable_from_entry: true
images: 48
internal_links: 16
extracted: 2026-08-13T06:29:58Z
extractor: site_to_paper.py (builtin)
---

# The linearized equations of motion

*Source page: `pendulum/leqm.htm`*

The Lab

					

					

						
The Lecture Room

					

				

				

					

					

				

			

			

				

					

					

					

					

					

				

				

					

						
The Equations of Motion

					

					

						
Oscillations and Resonances

					

					

						
Nonlinear Dynamics

					

					

						
Miscellaneous Topics

					

					

						
Links and Literature

					

				

				

					

					

					

					

					

				

			

			

				

					

					

					

					

					

				

				

					

						
Undamped and Undriven Pendulum

					

					

						
Damped and Driven Pendulum

					

					

						
Linearized Equations of Motion

					

					

					

				

			

		

	

The Linearized Equations of Motion

The 
equation of motion
 of the pendulum is nonlinear because of the term 
0
2
sin
. Driving the
suspension point leads to a 
driving force
 which is also nonlinear in the angle 
. For small angles,
the nonlinear terms can be linearized, i.e.,

sin
 = 
 + O(
3
)

and 
cos

= 1 + O(
2
).

Thus the linearized equations of motion read 

	

		
(horizontal motion)

		

			
d
2
dt
2
 + 
d
/
dt

			+ 
0
2
 = 
a

			cos 2
ft
,

		

	

	

		
(vertical motion)

		

			
d
2
/
dt
2
 + 
d
/
dt

			+ (
0
2

			+ 
a
 cos 2
ft

			) 
 = 0,

		

	

and 

	

		
(rotation)

		

			
d
2
/d
dt
2
 + 
d
/
dt

			+ (
0
2

			+ 
a
 cos 2
ft

			) 
 = 
a

			sin 2
ft
.

		

	

Additional comments
:

	
The linearized driving force of a horizontally driven pendulum is identical to the driving force of a pendulum
	which is driven by a periodic force. Thus, in the linear regime driving the pendulum by a periodic force is equivalent
	to moving the suspension point of the pendulum horizontally.
	
The linearized equation of motion of the pendulum is called 
harmonic oscillator
.
	
The driving term in the linearized equation of motion of a vertically driven pendulum is not additive as for
	the horizontally driven pendulum, but 
multiplicative
. It is a harmonic oscillator where the oscillator frequency
	is modulated periodically. The equation of motion is the damped 
Mathieu equation
. The driving term leads
	to an 
instability
 called 
parametric resonance
.

	

		
QUESTION worth to think about:

	

	

		

			

What are the equations of motion linearized around 

 = 180°?

			

		

	

	

		

			

		

		

			

		

		

			

		

	

	

		

			
previous

		

		

			
top

		

		

			
next

		

	

© 1998 
Franz-Josef Elmer
, 

 Franz-Josef doht Elmer aht unibas doht ch, 
last modified Sunday, July 19, 1998.
