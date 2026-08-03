---
title: "TRANSMISSION LINE CALCULATOR © 2000 Michael A. Lee and Kevin E. Schmidt"
source_domain: radiondistics.altervista.org
source_path: tlc.htm
order: 41
reachable_from_entry: true
images: 10
internal_links: 5
extracted: 2026-08-03T14:37:36Z
extractor: site_to_paper.py (builtin)
---

# TRANSMISSION LINE CALCULATOR © 2000 Michael A. Lee and Kevin E. Schmidt

*Source page: `tlc.htm`*

Planning a trip to Sicily? �Then,
              make sure you won't be feeding the Mafia!

            

          

        

      


      

        

        

          

            
Home


            


            


                    

            


            
Scientific Products


            


            
RF Communications Products


            


            
Contact

          


          

            

          

        



          

            

              
If you have a scientific interest in the physics of the
              radio, you should browse this site as an e-book!

            

          


          

            

              

                

                  

                    Please select a page from this menu and hit the GO button
                  


                  

                    Home page
                  


                  

                    A foreword by the Author
                  


                  

                    A short Author's autobiography
                  


                  

                    The hertzian radiation, better known as radio waves
                  


                  

                    The ionizing power of the hertzian radiation. A detection by radioluminescence
                  


                  

                    The radio-electric transducers, better known as radio antennas
                  


                  

                    The self-antagonist transducers
                  


                  

                    Authopsy of an OPEN DIPOLE antenna
                  


                  

                    Authopsy of a FOLDED DIPOLE antenna
                  


                  

                    The elementary radiator, also known as the Errante's virtual ground HF antenna
                  


                  

                    The virtual ground BalUn, also known as the Errante's BalUn
                  


                  

                    Errante's capacitive RF earth grounding system
                  


                  

                    The balanced RF transmission line behaviour in a progressive wave regime
                  


                  

                    Virtual ground node generator for balanced RF transmission lines
                  


                  

                    Virtual ground node generator for un-balanced RF transmission lines
                  


                  

                    Errante's 225 Ohm, multiband HF antenna system
                  


                  

                    Errante's HF turnstile antenna broadband driver
                  


                  

                    From capacitive to virtual grounding, all the Radiondistics' building block at
                    a glance
                  

                
 

              

            

          

        

        


        

          

            

             

                

                  



A transmission line calculator



NB: this page is an appendix to the
 
Errante
's apparatus for the physics of the balanced transmission lines for radio-frequency signals.




 










                

              


              

                

                  

                   




To use 
the 
 Transmission Line Calculator
 
applet below, change the values in the input fields, and
click calculate. 
 
Most of the fields will be self explanatory
but further explanation is provided below.














 
Your browser can't run Java Applets: Here's a picture of the
calculator instead.

 

 
 
 


 



 

To interrupt a calculation in progress, click
stop.


 










 

 


The cable type is a menu of common cable types that can be used.
In addition 
two user defined entries allow you to enter custom
cable types
 as described below.

 
 


You need to enter the frequency in the first text field. The label
"Cable Length in Feet" can be changed to "Cable Length in Meters"
which will change all the length units from feet to meters. You
then enter the length in the cable length field. Similarly, the
"Load Resistance" label can be changed to "Input Resistance" so
that measured impedances at the input end of a cable can be converted
to antenna impedances. Enter the resistance and reactance (positive
for inductive, negative for capacitive) in those fields.

 
 


When your input is set, press calculate. If there is an input error
a message will be displayed in the field to the left of the stop
button. The output side only changes when you press calculate,
and will display the characteristic impedance Z0 of the line,
the impedance at the other end of the line, the velocity factor,
the SWR at each end of the line, the matched loss of the line,
and the total loss with your load impedance.

 
 


The bottom part of the applet is a plot. The x axis is the position
along the line; x=0 is the input. The default shows the power,
current and voltage on the line all on one plot. To make them
all appear on a single plot, I take the current to have magnitude one
at the load, I divide the voltage by the characteristic resistance
of the line, and I divide the power by its value at the load. At the
top of the plot is a choice menu that allows you to also select
the power in watts, voltage magnitude in volts,
or current magnitude in amps with 1500 watts input to the line. You 
can also plot the impedance in ohms seen along the line. The red curve is
the resistance and the blue one is the reactance. The plotting
is implemented using a stripped down version of

ptplot
 by Edward A. Lee and Christopher Hylands,
copyright University of California. One of the nice features of this
package is that 
you can zoom in on a portion of the plot
 by holding down the
left mouse button on that portion and move down and to the right to highlight
the region with a little square. You can do this multiple times too.
If you hold down the left mouse button and move up and to the left, you
can unzoom. The easiest way to get back to the original is to click
calculate again.

 
 


Two user defined cable types are provided.
For 
user 1
, you enter the resistive part of the
characteristic impedance, the velocity factor and the
attenuation in dB/100ft at some frequency. If you want to
extrapolate to other frequencies, the exponent would be
exactly 0.5 if the loss mechanism were purely conductor losses, and
that should be good enough for a first guess. Otherwise, the loss
at a new frequency will be the ratio of the new frequency to this
frequency raised to the exponent power times this attenuation.
The reactive part of the characteristic impedance is calculated
assuming only conductor losses.

 
 

 

User 2
 does not scale the results with frequency. Instead you input
the characteristic impedance both resistive and reactive parts,
the attenuation and the velocity factor. These characteristics are
assumed to not change with frequency.

 




 © July 1, 2000-
  
Michael A. Lee  and  Kevin E. Schmidt 

 












Click here to jump back to the Errante's apparatus
for the physics of the balanced transmission lines page



                        

                      

                    

                  

                

              

            

            

        
�






  

          

            

              


              
All rights reserved. Copyright © 1985-
 
Francesco Errante

              www.Radiondistics.com - Tel.(+39) 339.180.1313
