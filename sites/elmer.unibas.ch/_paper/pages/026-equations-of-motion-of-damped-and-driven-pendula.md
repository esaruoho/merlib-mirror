---
title: "Equations of motion of damped and driven pendula"
source_domain: elmer.unibas.ch
source_path: pendulum/eqm2.htm
order: 26
reachable_from_entry: true
images: 78
internal_links: 11
extracted: 2026-08-13T06:29:58Z
extractor: site_to_paper.py (builtin)
---

# Equations of motion of damped and driven pendula

*Source page: `pendulum/eqm2.htm`*

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

					

					

					

				

			

		

	

Equations of Motion

of damped and driven pendula

The derivation of the equations of motion of damped and driven pendula extends the 
derivation

of the undamped and undriven case. Damping and driving are caused by two additional forces acting on the pendulum: The

damping force
 and the 
driving force
.

Damping force

An undamped pendulum can be realized only virtually as here in the Pendulum Lab. In reality dissipation of energy
leading to damping is unavoidable. Usually dissipation is included in the equation of motion by adding a 
viscous
damping term
 which is a damping constant times the velocity. Thus, the equation of motion of the damped pendulum
reads

	

		
(1)

		

			
d
2
/
dt
2
 + 
d
/
dt
 + 
0
2
sin
 = 0,

		

	

where 
 is the damping
constant. Such a force occurs, for example, when a sphere is dragged through a viscous medium (a fluid or a gas).
For a laminar flow (i.e., a flow without eddies) the dragging force is given by Stoke's law 
F
damping

= -6
Rv
,
 where 
 is the viscosity of the medium, 
R

is the radius of the sphere, and 
v
 is its velocity relative to the medium.

In general, different damping mechanisms of different strengths are possible. Imagine, e.g., a heavy spherical
mass which hangs at a thin wire rope from the ceiling. Here, the main sources of damping are aerodynamical friction
due to the motion of the mass through the air and friction caused by bending the rope at the suspension point.
Aerodynamical friction follows Stoke's law only for very small velocities. For large velocities, when the flow becomes
turbulent, the friction force increases roughly quadratically. The friction of the rope is caused by plastic deformation
and solid friction if it is made by many fibres. 
In both cases, the friction force may dependent on the velocity and other parameters in 
a complicated way. In general, a viscous damping force is usually only a phenomenological
force. Even if it is empirically correct, it is often difficult to calculate the damping constant. Here in the Pendulum
Lab, the damping force is always the viscous damping term 
d
/
dt
.

Driving force

There are several ways to drive a pendulum. The most simplest one is to add a periodic force. This leads to

	

		
(periodic force)

		

			
d
2
/
dt
2
 + 
d
/
dt
 + 
0
2
sin
 = (
A/l
) 
0
2
cos 2
ft
,

		

	

where 
A
 and 
f
 are the amplitude and the frequency of driving. The amplitude is a length. In the lab
the driving is visualized by a rubber string of zero equilibrium length. It has a fictitious spring constant of

m
0
2
.
The rubber is stretched periodically. The maximum elongation is just 
A
.

	

		

			
Instead of
			applying a periodic force, one can also drive the pendulum by moving its suspension point. Of course, only accelerated
			or curved motions lead to a driving force. In the framework moving with the suspension point, a mass feels any
			acceleration as a pseudo force 
F
A
 which is the mass times the negative acceleration
			of the suspension point in the laboratory frame. Thus, the total force due to the acceleration of gravity and the
			acceleration of the suspension point reads

			

			
F
A
 = -
md
2
x
0
/
dt
2
 
e
x

			+ 
m
(
g
-
d
2
y
0
/
dt
) 
e
y
, 

			

			where 
x
0
(
t
)
 and 
y
0
(
t
)
 are the coordinates
			of the suspension point and 
e
x
 and 
e
y
 are the unity vectors in 
x
 and
			
y
 direction, respectively. The restoring force 
F
R
 is the projection of 
F
A

			onto the unity vector 
n
 = cos
e
x
 
- sin
e
y
 which is tangential at the circle of
			radius 
l
. Thus,

			

			
F
R
 = 
n F
A
 = -
md
2
x
0
/
dt
2

			cos
 - 
m
(
g
-
d
2
y
0
/
dt
)sin
.

			

			Therefore, the equation of motion of a damped pendulum driven by an arbitray motion of its suspension point reads

			

			
			

				

					
(2)

					

						
d
2
/
dt
2
 + 
d
/
dt
 + 
0
2
sin
 = -
d
2
(
x
0
/
l
)/
dt
2
 cos
 + 
d
2
(
y
0
/
l
)/
dt
2

						sin
.

					

				

			

			Three different kind of periodic motions of the suspension point are realized in the Pendulum Lab:
			

				
horizontal motion:

				
x
0
 = 
A
 cos 2
ft
,

				
y
0
 = 0.

				
vertical motion:

				
x
0
 = 0,

				
y
0
 = 
A
 cos 2
ft
.

				
rotation:

				
x
0
 = 
A
 sin 2
ft
,

				
y
0
 = 
A
 cos 2
ft
.

			

			
The corresponding equations of motion read:

			

			
			

				

					
(horizontal motion)

					

						
d
2
/
dt
2
 + 
d
/
dt
 + 
0
2
sin
 = 
a
 cos(2
ft
) cos
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
 + 
0
2
sin
 = -
a
 cos(2
ft
) sin
,

					

				

			

			and 

			

			
			

				

					
(rotation)

					

						
d
2
/
dt
2
 + 
d
/
dt
 + 
0
2
sin
 = 
a
 sin(2
ft
-
),

					

				

			

			respectively, where 
			

				

					
(3)

					

						
a
 = (2
f
)
2

						
A/l
.

					

				

			

		

	

Additional comments
:

	
The viscous damping term is linear. But the driving term is linear only in the case of an external periodic
	force.
	
Driving puts energy into the system which is dissipated by the viscous damping term. Thus, energy is pumped
	through the system. On average, there is a balance between the work done at the pendulum and the dissipated
	energy.

	

		
QUESTIONS worth to think about:

	

	

		

			

Think about a pendulum built by a nearly massless string and spherical 
mass swinging in air. Neglect damping due to bending of the string. 
Does the damping
constant 
 depend on the
mass 
m
 of the sphere? How large is it?

How large is the energy of the pendulum in terms of angle, angular
velocity, and phase of external driving.
			

		

	

	

		

			

		

		

			

		

		

			

		

	

	

		

			
previous

		

		

			
top

		

		

			
next

		

	

© 1998 
Franz-Josef Elmer
, 

 Franz-Josef doht Elmer aht unibas doht ch, 
last modified Sunday, July 19, 1998.
