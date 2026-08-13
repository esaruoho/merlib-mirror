---
title: "Brownian Motor"
source_domain: elmer.unibas.ch
source_path: bm/index.html
order: 5
reachable_from_entry: true
images: 9
internal_links: 0
extracted: 2026-08-13T06:29:58Z
extractor: site_to_paper.py (builtin)
---

# Brownian Motor

*Source page: `bm/index.html`*

Brownian Motor

In his famous lectures Richard Feynman discussed the impossibility to violate the second law of thermodynamics
by a 
ratchet
 mechanism. The simplest model for a ratchet is an overdamped Brownian particle in an asymmetric
but spatially periodic potential (with asymmetry 
 and period 
L
). Due to the fluctuating force caused by the pushing molecules of the
surrounding fluid or gas the Brownian particle may overcome the potential barrier moving to the left or to the
right. The probabilities for both directions are equal. Thus on average the particle does not move. Hence building
a motor which turns thermal energy into mechanical work from a 
single
 heat bath is impossible.

But the ratchet can be turned into a so-called a 
Brownian motor
 that seems to violate the second law
of thermodynamics. The idea is to turn the ratchet potential periodically on and off with a frequency 
1/2
. Under certain circumstances this
may yield directed motion even against an applied force 
f
. It is indeed a device doing work. Below you can
play with a Java applet which simulates such a system. Vary the parameters and figure out the condition for a drift
from right to left even for 
f
 > 0
. If you want to know why a Brownian motor isn't
a 
perpetuum mobile
 of the second kind click on 
here
.

Sorry, no Java applet!

There are two possibilities why you don't see a Java applet:

Your browser is able to run Java applets but this feature is currently switched off.

Your browser is not able to run Java applets.

Instructions

        
Parameters can be changed either by manuipulating the corresponding scroll bar or by directly putting a number
        into the number field. There are the following parameters:

        N = number of particles.

        kT = thermal energy 
kT
 in units of the potential barrier.

        alpha = asymmetry 
 of the ratchet potential.

        tau = switching time 
.

        f = applied force 
f
 in units of the potential barrier divided by 
L
.
        
The start/stop button starts or stops the animation in the animation area.
        
The reset button resets the particle positions.
        
The animation area shows:
        

                
The result of the simulation
. If the number of particle is less than or equal 20 the particles are shown
                by circles. For a larger ensemble the particle positions are shown as a function of time (time direction is pointing
                upwards). The black line shows the averaged particle position. In the upper
                left corner the time and the averaged velocity (assuming 
L
 = 1
) are shown.
                
The potential
. The actual potential is shown in black. When the saw-toothed part is switch off it is
                still shown in light gray. The potential is tilted due to the external force 
f
.
                
The potential energy
. The averaged potential energy is shown as a green bar.
        

Why is a Brownian motor not a 
perpetuum mobile
 of the second kind?

As long as the ratchet potential is off the particle will move diffusively according to a (biased) random walk,
leading to a variance in position of 
 and
a mean position of 
, where 
D
 = 
kT

/ 
 is the diffusion constant.
When the ratchet potential is switched on, the particle gets trapped in one of the potential minima. If 
 for the variance holds, the particle on average gets trapped into
the minimum left to the starting point. The maximum flux is obtained if the switching time 
 is large enough to assure that the particle can adjust in the trapping
minimum ('adiabatic adjustment time') and also is small enough to fulfill the above requirement for the variance.
One can say roughly that a net flux to the left always occurs, when thermal energy is significantly smaller than
the potential maximum, the external force is chosen not too big and the driving frequency matches the adiabatic
adjustment time needed for the particle to move into a potential minima.

Where does the energy come from leading to a drift against the external force? The energy does not come from
the heat bath but from the ratchet potential when it is switched on. At that moment the potential energy of the
particle will be suddenly increased. In the simulation this can be seen by a sudden increase of the energy bar.
But most of the energy pushed into the system will be just dissipated into the heat bath due to the relaxation
of the particle into a potential minima. Only a tiny portion will be used for doing work. Thus a Brownian motor
does not violate any law of thermodynamics it only turns one type of work into another one. Nevertheless the fluctuating
force due to the heat bath is essential for a Brownian motor.

For more details and possible applications in biology and chemistry read
the following review article:

R.D. Astumian: 
Thermodynamics and Kinetics of a Brownian Motor
,
Science 
276
, p. 917-922 (1997).

Translations of this side: 
Romanian

 Idea: Roland Ketzmerick, Max-Planck Institut für Strömungsforschung, Göttingen

Text: Matthias Weiß, Max-Planck Institut für
Strömungsforschung, Göttingen, Franz-Josef
Elmer Institut für Physik, Uni Basel

Design: Roland Ketzmerick,
Max-Planck Institut für Strömungsforschung, Göttingen, Franz-Josef
Elmer, Institut für Physik, Uni Basel

Java programming: Franz-Josef Elmer, Institut für Physik, Uni Basel

Please send 
Comments and bug reports
 to Franz-Josef doht Elmer aaaat unibas doht ch

This page has been created in May 1998. It was last updated on September 1, 2009.
