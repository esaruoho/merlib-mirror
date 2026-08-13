---
title: "Equation of motion of an undamped and undriven pendulum"
source_domain: elmer.unibas.ch
source_path: pendulum/eqm1.htm
order: 33
reachable_from_entry: true
images: 37
internal_links: 12
extracted: 2026-08-13T06:29:58Z
extractor: site_to_paper.py (builtin)
---

# Equation of motion of an undamped and undriven pendulum

*Source page: `pendulum/eqm1.htm`*

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

					

				

			

		

	

The Equation of Motion

of an undamped and undriven pendulum

	

		
According to Newton's
			laws the inertia force 
F
I
 (i.e., mass times acceleration) has to be equal to the applied force.
			In our case, the applied force is the restoring force 
F
R
 caused by gravity 
G
. From the
			geometry of the problem (see figure), it is clear that

			

			
F
R
 = -
G
 sin
 

			
= - 
mg
  sin
,

			where 
m
 is the mass of the pendulum and 
g
 is the acceleration of gravity. Note that the negative sign
			is caused by the fact that the restoring force 
F
R
 wants to bring the pendulum back to equilibrium
			(i.e., 
 = 0).

			

			Next, we have to express the inertia force 
F
I
 in terms of 
			the angle 
. 
			Assuming a rigid pendulum (i.e., its length 
l

			is fixed), the mass can move only on a circle with radius 
l
. The position (i.e., the spatial coordinate)
			along this circle is given by 
l
. 
			Note that the angle 
 
			is measured in radians (i.e., 180° corresponds to 
). 
The acceleration is therefore given by 
l d
2
/
dt
2
.
 
			Thus, from Newton's law	we get

			
ml d
2
/
dt
2
 = -
mg
 sin
.

			Dividing by 
ml
 and moving the term on the right-hand side to the left-hand side leads to the equation of
			motion of an undamped and undriven pendulum

			

			
			

				

					
(1)

					

						
d
2
/
dt
2

						+ 
0
2

						sin
 = 0,

					

				

			

			where 

			

			
			

				

					
(2)

					

						
 
0
 = (
g
/
l
)
1/2
.
						

					

				

			

		

	

Additional comments:

	
The mass 
m
 of the pendulum does not appear anymore in the equation of motion. Galileo Galilei (1564-1642)
	was the first who discovered this effect. Maybe you know his legendary experiment of dropping two balls of the same size
	but of different mass from the tower of Pisa, where both balls had reached the ground simultaneously. From the viewpoint of Newton's
	laws, there is no reason that the inertial mass (i.e., the 
m
 in 
F
I
) has to be the same as
	the gravitational mass (i.e., the 
m
 in 
F
R
). It was the ingenious idea of Albert Einstein
	(1879-1955) to take this equality not as accidentally but as a deep principle of nature. From this equivalence
	of gravitational and inertial mass, he developed a new understanding of gravity which led to his general theory
	of relativity.
	
Although the equation of motion is derived only for a mathematical pendulum (where all the mass is concentrated
	in one point), it is also true for a physical pendulum with distributed mass. In this case, the parameter 
l

	is some effective length which is smaller than the distance between the center of mass and the rotation axis.
	
The equation of motion is a second-order differential equation (due to the second derivative of the angle 
). In order to get a unique
	solution, one needs two real numbers, e.g. the angle and the angular velocity at a specific time. Both
	variables define uniquely the 
state
 of the undriven pendulum.
	
The equation of motion is 
nonlinear
 because the second term depends nonlinearly on the angle 
.

	

		
QUESTIONS worth to think about:

	

	

		

			

What are the stationary equilibra of the pendulum (i.e., the solutions of 
(
1
) which are constant in time)? Which of them
are stable and which are unstable?

How large is the component of the force parallel to 
l
?

			

		

	

	

		

			

		

		

			

		

		

			

		

	

	

		

			
previous

		

		

			
top

		

		

			
next

		

	

© 1998 
Franz-Josef Elmer
, 

 Franz-Josef doht Elmer aht unibas doht ch, 
last modified Sunday, July 19, 1998.
