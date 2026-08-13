---
title: "This is my test audio page for Synthmaker"
source_domain: johnbedini.net
source_path: john34/test.html
order: 5
reachable_from_entry: true
images: 13
internal_links: 0
extracted: 2026-08-13T06:13:00Z
extractor: site_to_paper.py (builtin)
---

# This is my test audio page for Synthmaker

*Source page: `john34/test.html`*

This is my test audio page for Synthmaker.

      
This Process is for speakers only.

      

      
I'm putting up these examples of the Mono to Stereo converter with spatial processing

      

      
This is an example of a spatial queue, an instrument being thrown from one speaker.

      

      
   

      
The correct phase for transmission typical stereo signal.

      

      
   

      
An example of the spatial being mixed in.

      

      
This is a 45 record

      
An example of the original recording of the Clovers, That Old Black Magic,  first part Mono,

      second fade in with Spatial Mono to Stereo mixed with spatial. 

      
clovers.mp3

      
As this is not the best conversion as it was done at 56Kbs the processor did the best it could do.

      
Changing the bit rate to 128Kbs with a good recording this is what you get. The first part is the MONO recording, Second take is the 3D MONO recording.

      
five-k.mp3

      
As this was my first test with the components in Synthmaker I knew that I had to make the modules respond more like analog. I started to work figuring out the math functions, since B.A.S.E. is a full analog process. I was able to do the whole thing using made up modules with the simple math functions. I search and found knobs that would work just fine.  Synthmaker works just like a champ for the old mono recordings. Here is a picture of what I have come up with. Graphics not finished yet...

      

      
Here is the recording in 3D Mono spatial.

      
someone.mp3

      
Here is the XY Scope of the recording VST.

      

      
Moving on, it is now possible to recreate all the functions of an analog processor in Snythmaker just by using the math functions.Taking the math functions and looking at them as normal gain amplifiers instead of  the symbols they are used for. Each one of these functions can be modeled to build OP-Amps with fixed gain.   Below is the XY plot of all the amplifiers combined to form a BASE unit.

      

      

      
Now  Let's test the processor.

      
Speakers Only

      
won1.mp3

      
Now that we have managed to make analog amplifiers with Synthmaker the real test is can it perform as an interferometer as B.A.S.E. does.   The modeling of the components in analog is very time consuming as each function must work as if it were a OP-AMP. The test is to move things in space, to the right, to the left, walk backwards , walk forward, and all this must be done without the loss of space in the speakers, it's not a pan control . The modeling is something much different then the normal circuits in Synthmaker and must be figured out knowing what the symbols actually means and what they do to the bit stream. What I have found is that, if the bit stream is in the subtract mode it may invert the signal and flip channels 180 degrees and must be corrected before it enters the spatial mixer, it may look normal but it is not.   The test recording is not using any digital delay or echo with components in Synthmaker, it is the real effect of analog modeling with spatial amplifiers, Delta T and Delta I .

      
                                                                                                  Test Below.

      
inter.mp3

      
So now, that we have gone this far, I wish to explain the components that I used in Synthmaker. 
I have only used three math functions to build this Base unit,
 I did not write any code to do any of these effects. I have looked at the math function as operating amplifiers with floating points. 
By using the three functions I can build any operating OP-Amp,
 once built I use the controls just as levels to control the functions of the processor. I have posted the unit below, after that I'm going to have some fun. 
I have found a recording that uses a Keyboard Synth, with this test you will see the difference in what the analog BASE processor can do.
 I do move some of the controls during the recording. The unit is now balanced for the proper gains and is the final machine.

      

      
You can here the test below.

      
intermix.mp3

    
More later as I test more recordings.
