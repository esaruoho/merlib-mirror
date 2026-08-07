---
title: "SCIENCE HOBBYIST: build an electrostatic loudspeaker"
source_domain: amasci.com
source_path: ~billb/esloud/eslhwto.html
order: 1265
reachable_from_entry: false
images: 7
internal_links: 0
extracted: 2026-08-07T05:55:01Z
extractor: site_to_paper.py (pandoc)
---

# SCIENCE HOBBYIST: build an electrostatic loudspeaker

*Source page: `~billb/esloud/eslhwto.html`*

<table data-cellpadding="0">
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<tbody>
<tr>
<td><strong><a href="http://www.eskimo.com/~billb/">SCI. HOBBYIST</a> |</strong><br />
</td>
<td><strong><a href="http://www.eskimo.com/~billb/emotor/statelec.html">E-STAT</a> |</strong><br />
</td>
<td><strong><a href="http://www.eskimo.com/~billb/unew.html">GOOD STUFF</a> |</strong><br />
</td>
<td><strong><a href="http://www.eskimo.com/~billb/news.html">NEW STUFF</a> |</strong><br />
</td>
<td><strong><a href="http://www.eskimo.com/~billb/search.html">HELP!</a></strong><br />
</td>
</tr>
</tbody>
</table>

# How to Make Electrostatic Loudspeakers

## by

## Mark Rehorst <mark@rehorst.com>

## current version date: 6/7/96

## previous version date: 1/15/96

## Introduction

Electrostatic speakers are the just about the lowest distortion drivers that can be made. But you already know about their wonderful attributes or you wouldn't be interested in making them, so I'll dispense with the BS. I present here a simple process for making ESLs. I have not included anything about crossovers or cabinets. This is strictly a "how to make the drivers" article.\

## Warnings:

Before we go any further, I want to warn you about a couple things you may not be aware of. Electrostatic loudspeakers use high voltages to operate. They need a DC bias of up to 5000 V and use AC voltages up to 5000 V. The DC bias is usually supplied by a power supply running off 120VAC electrical circuits which can be dangerous. The AC voltages used to drive the ESL are usually produced by connecting your stereo amp to a vacuum tube amplifier type output transformer. The voltages produced by the transformer are dangerous! Don't screw around! If you have little kids in the house or if anyone might for any reason touch the speakers while they are operating, design your speakers so that it is not possible to come into contact with the drivers. If you don't know how to handle high voltage circuits, enlist the help of someone who does, or buy one of the commercially available ESLs.\

------------------------------------------------------------------------

# Section I: Making the speakers

Building ESLs involves the use of tools and materials that if handled improperly can be hazardous. Please make sure you know how to use these things before you begin. By all means, use safety glasses at all times. If would be foolish to trade your vision for the pursuit of audio ecstasy!\

## What you need:

1\) Transformers, one or two per speaker - use tube amp output transformers, 4 ohm:8K -20K ohm. I have used Tango CRD-8 ( 4:8KCT) transformers that I bought in Japan. You can use transformers by Triad, Stancor, etc. Just get units that are good for about 15-20 W at 30 Hz and give a large impedance (i.e. voltage) transformation. Expect to pay about \$50 each for transformers. Tube amp output transformers are available from Antique Electronic Supply, 602-820-5411, and other sources.\

2\) Plastic film for speaker diaphragms- Mylar or other polyester, thin (5-6 microns), and large enough to make the size of driver you want to build. This can be obtained from companies that make plastics for industry- this film is commonly used to make capacitors (don't get metalized film!). I bought a roll that is 1200 m long by 1 m wide for about \$85 in Japan a few years ago. I have used about 15 m of it so far. I have heard of people using Saran-wrap, but I have never heard a driver built using it. If you're making small drivers, or experimenting, try it! It certainly won't cost much...\

3\) Powdered graphite, dish soap, or antistatic solution to coat diaphragm. Powdered graphite is available from K-mart or your local hardware store for lubricating locks. It will cost no more than \$2 for enough to make about 50 speakers. Graphite has to be rubbed into the film using cotton balls. Dish detergent and antistatic solution will work also, and are easier to apply, but may not be "permanent". I use graphite. Someone in Australia suggested that drafting ink formulated for drawing on "film" (the draftsman's name for polyester) will make a good, easy to apply, high resitvity diaphragm coating. I haven't tried it yet, but applying a colored liquid ought to be easy and make it easy to verify that it only went where you wanted it.\

4\) Perforated aluminum or steel- You need a piece for the front and the back of the driver. It should be flat and have about 60% or more open area (holes). Hole size? The stuff I use has holes that are about 3 or 4 mm diameter. The "rules of thumb" say don't use holes larger than about 1/4". Check your local Yellow Pages phone book for listings under Perforators, or Sheet Metal. Your local hardware store may have some available also. Aluminum is much easier to cut than steel, and it is much lighter weight, but may cost a little more than steel. If you buy from a perforator you can get them to cut the metal to size and roll it flat for you.\

5\) Acrylic or fiberglass PC board stock for driver frame. Fiberglass is hard to cut (you need a carbide blade), and the dust from sawing is a health hazard, but epoxy will bond to it. Acrylic or other plastics are easier to work with, but epoxy may not form much of a bond to them (contact cement will probably work just fine). I have used both acrylics and PC board and for all it's trouble, I prefer the PC board material. You can get fiberglass from a PC board company- try to raid their scrap pile- and get them to cut the pieces to size for you. We'll talk about thickness later.\

6\) Glue - Previously I recommended epoxy to hold the ESL together. Epoxy works fine for attaching the perforated metal to the insulator frame. The problem with epoxy is that it doesn't really bond to the mylar film. A little mechanical stress can break the very weak bond and allow the film to peel away. This can be an advantage. If you find that a driver doesn't work, if you assembled it with epoxy it will be easy to rip apart and rebuild.\

I have done some additional research and found a contact cement manufactured by 3M that works for attaching the film to the insulating frame. Scotchgrip \#4693 is the stuff to use. You put a little on one or both surfaces to be glued and let dry for 10-20 minutes. Then you put the two surfaces together and Voila!, instant bond. The bond is so good that the film will tear long before the glue lets go. Other contact cements may work well also. The only disadvantage is that once you've assembled the driver using contact cement, you have to live with it. If the driver doesn't work, you'll have to build another because you won't be able to tear the old one apart.\

7\) High voltage DC bias supply (1000-5000VDC, almost no current.) This can be made as a voltage multiplier that works off the power lines. You'll need high voltage diodes and capacitors, a few resistors, a circuit board and a line cord. You can get away with one supply, but one for each speaker is easier to deal with- you won't have to run high voltage wires all over your listening room. See the Bias Supply section near the end of this document.\

## Optional:

Plastic coating for the perforated metal. I've heard that latex house paint works fine...\

[<img src="http://www.eskimo.com/~billb/esloud/eslfig1.gif" width="532" height="209" alt="[Stack in order: perfmetal,frame,diaphragm,frame,perfmetal]" />\
](http://www.eskimo.com/~billb/esloud/eslfig1.gif) Figure 1. Exploded view of a basic electrostatic driver.

## Making the drivers:

### Step 1. Design your drivers.

Decide on the size and make the frames for the drivers. It is generally easier to make small drivers than to make big ones, but with small drivers you will need a lot of them so mounting them can be a pain. You need one insulator for the front and one for the rear of each driver. Ideally, the insulator frames should be cut from a single piece of insulating material. But they don't absolutely have to be made from a single piece. Be sure to plan and leave room for electrical connections (3 wires per driver) and mechanical mounting. I have built many drivers using different geometries and found that the following thicknesses and bias voltages will result in drivers that closely match the sensitivity of conventional boxed bass drivers without the addition of a lot of attenuation in the low frequency section of your crossover:\

     
     ESL use     total ESL area          DC bias     insulator thickness

     mid/tweet      >2 ft2                1500 V             1/16"

     full range     >4 ft2               3-5000 V            1/8"-1/4"

The insulator thickness to use is a function of many variables. If you want to reproduce low frequencies (down to 100 Hz or lower) you need to have room for the diaphragm to move. That means thick insulators. You will also need to use high bias voltage and high driving voltages (two transformers) to get reasonable sensitivity.\

The mechanical force on the diaphragm varies as the square of the distance from the stator plates. That means that if you double the thickness of the insulators, you need to use four times the voltage for equivalent acoustic output. It isn't easy to make full range ESLs, and they almost never deliver enough bass. You need really huge surface areas to get bass, but that increases the capacitance of the driver and can limit high frequency response. You can improve the bass by using electronic equalization and mounting the drivers in the corners of a room. There is plenty of room for experimentation.\

For midrange/tweeter drivers to be used in a hybrid system, there is considerable flexibility in the insulator thicknesses and spacing, bias voltage, and driving voltages. 1/16" PC board material is extremely common and low cost so it is almost ideal (except for the difficulty in cutting it) for this application. \* 1/16" is easily enough room for the diaphragm to produce ear splitting volumes at frequencies down to 300 Hz or so, using a single transformer to drive each speaker.\

Another benefit to using PC stock is that it is usually metalized on one or both sides, a feature that can be very useful when making electrical connections to the drivers. It will be best to have one insulator frame metalized on both sides, and the other metalized on one side, but we can make due with any material, even unmetallized.\

There is a "rule of thumb" about the dimensions of an ESL that relate to the insulator thickness. The rule is that the diaphragm should be supported at least every 100X units, where X is the thickness of the insulator pieces. 'Supported' means that you should put insulating strips in the driver to support the diaphragm in at least one direction. 'One direction' means that long narrow drivers are OK. If you use insulators that are made from 1/16" PC board stock, the diaphragm should be supported every 4-6 inches. If you look at Martin- Logan ESLs you'll see they have support insulators every 4-6 inches and that they are unevenly spaced, presumably to move resonances of each section to different frequencies.\

[<img src="http://www.eskimo.com/~billb/esloud/eslfig2.gif" width="532" height="364" alt="[Use 1/16 PCB frame as insulating spacer]" />\
](http://www.eskimo.com/~billb/esloud/eslfig2.gif) Figure 2. One way to make the ESLs showing the use of PC board stock.

\

Drawing not to scale. Electrical connections are soldered to the copper pads labeled "A", "B" and "C". Be sure to leave room for hardware to mount the driver to some sort of frame.\

### Step 2. Electrical connections

You will need to make an electrical connection to the diaphragm. This can be done in any number of ways, but remember that you must maintain a high voltage potential between the metal plates and the diaphragm. That's why we were careful to vacuum up the graphite powder. You may want to clean the insulators with alcohol and a very clean cloth before proceeding.\

The electrical connection is made by physical contact between a metal strip and the graphite coated surface of the diaphragm. The metal strip may be the copper on a piece of PC board stock used for the insulator (very rugged and solderable), or it can be a piece of aluminum foil, or Radio Shack burglar alarm foil tape (both somewhat delicate and not solderable). Just remember that you have to be able to connect a wire from the HV bias supply to the metal. Also, epoxy is generally not electrically conductive (there are conductive epoxies available, but they are usually quite expensive), so don't completely cover the metal with epoxy.\

Here is a tip to help insure long life for your ESLs. When you connect DC bias to the diaphragm, connect the minus side of the bias supply to the driver and the plus side to the center tap of the driver transformer. If you connect it the other way around, you'll find that over time the metal electrode that connects to the diaphragm will corrode like the plus battery contact in your car.\

### Step 3. Stretch, coat, and attach the diaphragm to the insulators.

Stretching the diaphragm can be accomplished in two relatively easy ways. One way is to use a heat gun to shrink the diaphragm after it has been attached to the insulators. People have reported good results using this technique, but I haven't tried it.\

I use a stretcher table of the type shown in figure 3. The table allows you to coat the diaphragm under full tension and allows you to make multiple drivers with nearly identical resonances (by inflating the tube to the same air pressure for each driver). To use it you lay the film on the table and use double sticky tape to attach the edges of the film to the underside of the table. You then pump a few strokes of air into the inner tube and watch as the wrinkles in the diaphragm disappear. You can put extreme amounts of tension on the film using this table, so be careful. Make sure you put a small hole through the table top surface to allow air trapped under the diaphragm to escape when you start pumping!\

[<img src="http://www.eskimo.com/~billb/esloud/eslfig3.gif" width="278" height="369" alt="[Circular table with bike innertube around the edge]" />\
](http://www.eskimo.com/~billb/esloud/eslfig3.gif) Figure 3. View of the underside of the diaphragm stretcher table.

\

The film is laid on the top side of the table and the edges are folded to the underside and secured with double-sticky tape attached to the inside of the table edge. Inflating the tube stretches the film tight. A rectangular table works just as well as a round one and is probably easier to make.\

How much tension is enough? That's a difficult question. The tension you use is a balancing act. It depends on the bias voltage you will use, the thickness and spacing of your insulators, and on the frequency range over which you intend to operate the driver. Usually you will want to operate the driver above its fundamental resonant frequency. If you want full range operation, that means you want the resonant frequency to be below 100 Hz or so. That requires low diaphragm tension but low diaphragm tension means you may have to use a reduced bias voltage or you may have the driver break into a low frequency oscillation where it pulls to one side, sticks until the diaphragm is discharged, then returns to the center until the diaphragm charges up again, etc., etc.\

In reality the amount of tension you use isn't critical. Rectangular drivers have multiple resonances and you will always have some of them in your pass band. I have never been able to identify any of them by the sound of the driver when running test tones through it, and certainly never when listening to music. It may be possible in an anechoic chamber or by using a FFT analysis of impulse response, but in your listening room there will always be room mode resonances and multipath effects that will dwarf the driver resonances. If the tension proves too low you can always reduce the bias voltage.\

OK, so you have the diaphragm under tension on the table. Now what? Time to put the resistive coating on the diaphragm. First put the insulators in another room. Then place a little (very little!) graphite on the film and grab a clean cotton ball and start rubbing the graphite into the film. Rub it in hard. Add more graphite as needed. You really don't need to use much. You want the film to be coated with the stuff so that it has very high resistivity. It's really not critical. After you have rubbed the graphite in, grab some clean cotton balls and rub some more. You can measure the resistance of the film by dropping a couple pennies on it a few inches apart and checking the resistance between the pennies with a DMM. You want a high but measurable resistance. Move the pennies around and check a few places. If you get resistances on the order of 100K or more, you've done a good job. If you measure lower resistances, rub with clean cotton balls some more. Get out your vacuum cleaner, put a brush attachment on it, and vacuum the entire surface of film that has been coated and the area where you were using the graphite. Now wash your hands very thoroughly! Then wipe the insulators with alcohol and a very clean rag to make sure they are absolutely clean before proceeding.\

Why is the resistance important? Sooner or later, a bug will get into your speakers, or you will crank the volume a bit too high and your speakers will arc. If you use a metalized diaphragm (low resistance) there is a good chance that the entire diaphragm will flame out and you'll have to rebuild the speaker (but it'll impress your friends!). If you use a high resistance coating, the amount of current available to the arc is very small, resulting in a low temperature arc that will at worst put a pin hole in the diaphragm. High resistance coatings that I've tried do not cause the normally self-extinguishing polyester diaphragm to become inflammable. This is another reason for using a very large resistance between the diaphragm and the bias supply.\

If you feel that you really need extremely high resistance for your speakers, try using dish detergent or antistatic solution to coat the diaphragm. I have built drivers using all three coatings and find no audible differences between them (but maybe your ears are better than mine).\

Attaching the diaphragm is easy. You simply put glue (Scotchgrip \#4693) on one of the insulators (again- don't completely cover the metal) and place it, glue side down, on the coated film. The bond forms instantly, so make sure you set the frame down on the diaphragm exactly where you want it. Once the glue has set (after about 10 microseconds), let the air out of the tube and cut the film away from the table along the edge of the insulator. Now turn over the insulator/film assembly and set it back down on the table, diaphragm up. Coat one side of the other insulator with glue, wait about 10-20 minutes, then set it glue side down on the insulator/film assembly. Be sure to align the two parts carefully before pressing them together- you don't get a second chance. You might consider building some sort of fixture to ensure accurate alignment.\

Now you can epoxy the perforated metal sheets to the insulator assembly. The perforated sheets are made by running a roller with metal pins over the sheet metal. That leaves the edges of the holes on one side rounded and the edges on the other side sharp. Put the rounded edge side toward the diaphragm. Epoxy the stators one at a time and be sure the epoxy has time to set before you pick up the assembled driver.\

I have done some experiments aimed at rounding the sharp edges of the holes. One of the things I recalled from high school chemistry experiments is that corrosion of metals occurs fastest at points of stress and sharp edges. I tried using ferric chloride PC board etching solution from Radio Shack. Since aluminum is more 'reactive' than copper I had to dilute the solution by cutting it with water at about 1 part FeCl to 4 parts water. This kept the speed of the reaction slow enough to allow me to observe progress of the reaction and remove the aluminum when the edges were rounded. If you try this, be sure you dilute the FeCl and then put a small scrap of aluminum into the solution to test it before you put in the pieces you will use for your speakers. If you don't dilute the solution you'll end up with a bad smelling, boiling mess!\

### Step 4. Testing

Stand the driver up using styrofoam blocks to insulate it or hang it from a frame using nylon cord. Connect the transformer(s) to the driver per figure 4. Next, connect the bias supply wires to the transformer and the driver. Power on! If all is well you should hear a very quiet click or nothing at all.\

[<img src="http://www.eskimo.com/~billb/esloud/eslfig4.gif" width="532" height="430" alt="[Centertapped output transformer, DC HV supply in series w/center conn.]" />\
](http://www.eskimo.com/~billb/esloud/eslfig4.gif) Figure 4. Diagram showing electrical connections to the ESL.

\

Warning: the voltage output from the transformer is high enough to hurt you! Be careful!\

You may hear a whining sound. This is due to corona discharge which you may be able to locate by turning off the lights and looking closely at the driver. Once your eyes have adjusted to the dark you may see faint blue sparks, probably coming from edges or pointed areas of metal. The cure is to reduce the bias voltage, or apply some insulating coating (finger nail polish works) to the point where the discharge is occurring. This problem can be avoided almost entirely by plastic coating the stator plates before assembling the drivers. If you coat them with plastic, make sure you leave some provision for making electrical connections to the metal.\

The other thing you may see/hear is the diaphragm flapping back and forth because of insufficient tension. This can be cured in two ways. Lower the bias voltage or replace the diaphragm using higher tension. You may try using a heat gun to shrink the film more and put more tension on it before you rip it apart to replace it.\

If the driver sits quietly, connect the output of your amplifier to the 4 or 8 Ohm taps on the transformer. At this point I cannot stress enough that you should never, ever, under any circumstances touch the driver while it is operating. You will receive a severe shock, and you will suffer burns from the tremendously high voltages produced by the transformer that drives the ESL. I have experienced this and can tell you that it hurts like hell (and stinks)! Don't do it!\

Turn on the amp and play a CD. Turn the volume up slowly. You should hear very low distortion music with little bass content coming from the driver. If not, turn the volume up. Sometimes the connection to the perforated aluminum is poor due to oxide on the surface of the aluminum. As you turn the volume up and the driving voltage gets high enough, it will arc through the oxide layer and suddenly you will hear the music very clearly. The newly "cleaned" connection will work virtually forever after this first "burn-in".\

That's it. Wasn't that easy?\

Consider this: The high voltage used to "energize" the speakers causes them to attract dust. When you're not using the speakers, you may want to turn off the bias supply to minimize this effect. You should also put a brush attachment on your vacuum cleaner and clean both surfaces of each speaker once in a while.\

Roger Sanders' article included an equalizer circuit to increase the low frequency output of the drivers. The circuit amounts to bass boost similar to what you can get by using the tone controls on your preamp. Sanders suggests that even in hybrid systems, the equalization is necessary to keep the speakers from sounding too weak on bass to lower midrange frequencies. I have used the equalizers and operated without them and find that the sound without the equalizer is satisfactory. You may want to try using the drivers without equalization first, then add the equalizer if you think the bass/lower midrange is weak.\

What I am about to say will be regarded as heresy but before you believe what you hear from people who claim to know everything about everything (I'm not refering to Roger sanders here), remember all the suffering that has occurred throughout human history because people blindly followed what they were told by such self-proclaimed experts. Here goes: If you want to make a hybrid system and you already have some speakers that provide reasonable bass, try using them with the ESLs before you blow big bucks or go to a lot of trouble making bass boxes. You may find that the speakers you have will work well enough, saving you a lot of money/time/effort.\

------------------------------------------------------------------------

# Section II: ESL Bias Supplies

The ESL needs a high voltage DC bias supply. Generally speaking, the higher the bias voltage you use, the higher the sensitivity of your speaker. However, there are considerations beyond speaker sensitivity. If your speakers do not have plastic coated stators, then 1500-2000 Volts is about the highest voltage you will want to use, regardless of insulator frame thickness. Higher bias than that leads to corona discharge and its attendant whining sound. If your speakers use plastic coated stators, you can probably use higher voltages, but that will depend upon the insulator frame thickness also.\

If you use 1/16" thick insulators, then try 1500-2000 Volts first. If your insulators are 1/4" thick, and the stators are plastic coated, you may be able to use 5000V bias. For headphones, where the drivers are practically glued to your ears, 500- 750V is probably adequate bias.\

Bias supplies are generally made using a transformer to step up your local power line voltage to 500- 1500V, then converting to DC using a voltage multiplier/rectifier circuit. Voltage multiplier circuits are used in almost everything that uses high DC voltages. You can find a good description of the operation of such circuits in any edition of the ARRL Radio Amateur's Handbook.\

Figures 5, 6 and 7 show schematics of voltage doubler, tripler and quadrupler circuits. The names doubler, tripler and quadrupler come from the fact that the output voltage will be approximately 2, 3 or 4 times the PEAK level of the AC input voltage. Transformers are usually rated in terms of rms voltages.\

Vpeak = 1.414 x Vrms\

[<img src="http://www.eskimo.com/~billb/esloud/eslfig5.gif" width="700" height="500" alt="[DOUBLER: 2 diodes, 2 .05uF capacitors, 20meg resistor in series]" />\
](http://www.eskimo.com/~billb/esloud/eslfig5.gif) [<img src="http://www.eskimo.com/~billb/esloud/eslfig6.gif" width="978" height="500" alt="[TRIPLER: 3 diodes, 3 .05uF capacitors, 20meg resistor in series]" />\
](http://www.eskimo.com/~billb/esloud/eslfig6.gif) [<img src="http://www.eskimo.com/~billb/esloud/eslfig7.gif" width="980" height="500" alt="[QUAD: 4 diodes, 4 .05uF capacitors, 20meg resistor in series]" />\
](http://www.eskimo.com/~billb/esloud/eslfig7.gif)\

If you have a transformer that is rated for 117 VAC in and 700 Vrms out, the DC output voltages you will get from a doubler, tripler and quadrupler circuits will be 1980, 2970, and 3960 VDC.\

The components used in the voltage multiplier circuits must be capable of withstanding these high voltages, so shop carefully! Each speaker needs high voltage bias, but you really only need one bias supply. If you're on a budget or not sure you want to go whole-hog into this project, start with one bias supply. You may find later that it's more convenient to use two bias supplies (that way you don't have to string high voltage wire all over your listening room).\

There are a few things to keep in mind when shopping for bias supply transformers. First, you don't need any appreciable amount of current, so get the physically smallest, lowest cost HV transformer you can find. Don't use neon sign transformers (usually too much voltage and always too much current). You can steal transformers out of old vacuum tube electronic junk, or buy them for a few dollars from companies like Antique Electronic Supply or Fair Radio Sales. If you can't find the exact voltage you want, don't worry about it- you can use the voltage multiplier circuits to get you where you want.\

There are alternatives to the transformer/voltage multiplier circuit. Sometimes you can find DC supplies from photocopiers available in the surplus market. Sometimes they are even adjustable. They usually put out higher voltages than needed, but that is easily taken care of by adding a resistive voltage divider to the output.\

Here are a few sources for HV parts, power supplies, etc.\

    Alltronics
    2300 Zanker Rd.
    San Jose, Ca. 95131
    phone: 408-943-9773
    fax: 408-943-9776

    C and H Sales Co.
    2176 E. Colorado Blvd.
    P.O. Box. 5356
    Pasadena, Ca. 91117-9988
    phone: 213-681-4925
    fax: 818-796-4875

    Fair Radio Sales
    P.O. Box 1105
    1016 E. Eureka St.
    Lima, Oh. 45802
    phone: 419-223-2196
    fax: 419-227-1313

    Herbach and Rademan
    18 Canal St.
    P.O. Box 122
    Bristol, Pa. 19007-0122
    phone: 215-788-5583
    fax: 215-788-9577

Don't omit the resistor at the output of the supply! It is there for three reasons. First, it insures that you can't get enough current out of the power supply to hurt you. Second, it helps force the speaker to operate in the "constant charge" mode. Third, it helps minimize damage to the speaker in the event the diaphragm comes into contact with one of the stators.\

Comments or questions about this article should be sent to\

<akikoi@earthlink.net>\

The views, opinions, and errors expressed in this article are entirely my own.\

------------------------------------------------------------------------

# ESL Bibliography

1/15/96\
Compiled by Mark Rehorst\

## US Patents

2,631,196 Janszen, March 1953\
Description of an ESL that has on fixed electrode, and electrically divided diaphragm to control directivity, frequency response, and impedance of the speaker.\

2,896,025 Janszen, July 1959\
Describes and ESL manufacturing process using wire grid fixed electrodes, one on either side of the diaphragm.\

3,008,014 Williamson and Walker, Nov. 1961\
Describes a method of makig ESLs with low distortion and a method of separatng them into different sections to reproduce different frequency ranges.\

3,014,098 Malme, Dec. 1961\
Provides a good, detailed description of ESL operation, and a design that incorporates segmented stators to control directionality at high frequencies.\

3,668,335 Beveridge, June 1972\
Describes a servo controlled ESL mounted in an enclosure, to allow low frequency reproduction, and with an acoustic lens to control high frequency dispersion. Patent includes schematics of vacuum tube servo control amplifier.\

3,668,336 Wright, June 1972\
Describes an ESL with electrical connections on one side of the speaker only.\

3,778,562 Wright, Dec. 1973\
Describes an ESL mounted in a sealed enclosure filled with a gas that acts as an acoustic lens to control the directionality of the driver and allows higher operating voltages than would be possible in air, thus increasing the sensitivity of the driver..\

4,289,936 Civitello, Sept. 1981\
Describes an interesting inverse ESL with one perforated stator plate and two diaphragms on either side of it. The drivers are triangular, with multiple units assembled into a kind of geodesic dome structure for control of directivity of the speaker.\

4,703,509 Kanchev, Oct. 1987\
Describes an ESL that uses stators with resistive properties to control frequency response and directivity.\

## British Patents

1,234,767 Enock, June 1971\
Describes electrostatic transducers in which the stators are insulated to allow the use of high operating voltages, thereby increasing the sensitivity of the transducers.\

1,239,658 Bowers and Greenwood, July 1971\
Describes an electrostatic speaker that is built used printed circuit techniques, in which the stators are insulated to allow the use of high operating voltages, thereby increasing the sensitivity of the drivers.\

## Articles:

An Electrostatic Speaker System, Roger Sanders, Speaker Builder magazine, 2/80-4/80. A very good series of articles on DIY ESL construction.\

Sound Radiation From Circular Stretched Membranes in Free Space, J. H. Streng, published in the Journal of the Audio Engineering Society, Vol 37 No. 3, March 1989. A detailed mathematical analysis of circular ESL driver resonances and frequency response.\

## Books:

[Audio Amateur Loudspeaker Projects](http://www.amazon.com/exec/obidos/ISBN=0833801937/sciencehobbyist/), contains a good DIY ESL article that originally appeared in Audio Amateur magazine. Available from Old Colony Sound Lab, PO Box 243, Peterborough, N.H. 03458. Phone: 603-924-6526, fax: 603-924-9467.\

[Electrostatic Loudspeaker: Design and Construction](http://www.amazon.com/exec/obidos/ISBN=0962419168/sciencehobbyist/), by Ronald Wagner, published by Tab Books. Describes operating theory and construction of ESLs. Available from Old Colony Sound Lab, PO Box 243, Peterborough, N.H. 03458. Phone: 603-924-6526, fax: 603-924-9467.\

[Electrostatic Loudspeaker Design Cookbook](http://www.amazon.com/exec/obidos/ISBN=1882580001/sciencehobbyist/), by Roger Sanders, 1995. Available from Old Colony Sound Lab, PO Box 243, Peterborough, N.H. 03458. Phone: 603-924-6526, fax: 603-924-9467.\

[Loudspeaker and Headphone Handbook](http://www.amazon.com/exec/obidos/ISBN=0240513711/sciencehobbyist/), edited by John Borwick. ISBN no. 0-240-51371-1. Contains a mathematically detailed description of ESL operation written by Peter Baxandall, including enough detail about the venerable Quad ESL63 to allow close duplication of the design (if you're so inclined).\

## LINKS:

- [ES LOUDSPEAKERS CIRCUIT](http://www.eslcircuit.com), big site and forum
- [ESL Info Exchange](http://www.jps.net/eslinfo/)
- [DIY Electrostatic Headphones](http://headwize.com/projects/radford1_prj.htm)
- [Electrostatic Headphones Notes](http://headwize.com/projects/cmoy3_prj.htm)
- BOOK: [Electrostatic Loudspeaker](http://www.garlic.com/electro/Wagner.htm), by Wagner
- BOOK: [Electrostatic Loudspeaker Design Cookbook](http://www.garlic.com/electro/Sanders.htm), by Sanders
- A [DIY Speaker](http://www.qnx.com/~danh/speakers.html) Project
- [Sound Lab Electrostatic Speaker articles](http://www.soundlab-speakers.com/tellall.html)
- [Speaker Builder](http://www.audioxpress.com/magsdirx/spkrbldr/index.htm) Magazine
- [Audioxpress.com](http://www.audioxpress.com)
- [speakerbuilding.com](http://www.speakerbuilding.com/)
- [AMG Audio](http://www.amg-audio.freeserve.co.uk)
- [DIY Horns](http://invalid.ed.unit.no/~dunker/diy_hrn.html)
- [T.T. Brown's Plasma-dynamic speaker](http://soteria.com/brown/docs/speaker.htm)
- [Mirror site](http://esl.rehorst.com)

<!-- -->

This file is maintained by [Bill Beaty](http://www.eskimo.com/~billb/billb.html). Mail me at: [billb@eskimo.com](http://www.eskimo.com/~billb/amateur/amform.html#urls).\
If you are using Lynx, type "c" to email
