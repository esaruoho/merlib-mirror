---
title: "SCIENCE HOBBYIST: how transistor works, part 2"
source_domain: amasci.com
source_path: amateur/transis2.html
order: 583
reachable_from_entry: true
images: 2
internal_links: 14
extracted: 2026-08-07T17:05:59Z
extractor: site_to_paper.py (pandoc)
---

# SCIENCE HOBBYIST: how transistor works, part 2

*Source page: `amateur/transis2.html`*

[UP TO PART I](http://amasci.com/amateur/transis.html)

[COMMENTS](http://amasci.com/~billb/guestbook.html)\

[NEW STUFF](http://amasci.com/news.html)

[GOOD STUFF](http://amasci.com/unew.html)

[SEARCH](http://amasci.com/search.html)

<div id="google_translate_element">

</div>

<div>

</div>

\

<table width="100%" data-cellpadding="0" data-summary="Title">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td width="70&amp;"><strong>HOW DO TRANSISTORS WORK?<br />
PART II</strong></td>
<td width="30%"><strong>©1995 <a href="http://amasci.com/me.html">William J. Beaty</a>, BSEE</strong></td>
</tr>
</tbody>
</table>

> *Physics? That's where you find new insights on things people have been thinking about for a long time. If you don't have two or three separate approaches to explaining something, then you don't really understand it.*

OK, everything we know is wrong, and transistors aren't really "current amplifiers." \<grin\> Instead the base voltage is the important thing, not the base current.

             |
       ______|______
      |             |
      | COLLECTOR N |
      |_____________|
      |             |  ----> 
      | BASE      P |__________
      |=============|          |  +
      |             |      ____|____
      | EMITTER  N  |        _____
      |_____________|      _________
             |               _____
             |_________________|  -
                     <----- 

With a small voltage applied, the depletion layer gets thin, charges start crossing it, and a small flow of charge appears in the battery circuit. The "switch" is only partly closed!

|  |  |
|----|----|
| The changing thickness of the insulating depletion layer switches the transistor on and off. And since *base voltage* is what changes the thickness, we can ignore the current in the base wire. But wait a minute, *which* flow of charge is being switched on and off? Ah, we have another entire circuit to add to our diagram. We connect another battery across the entire transistor, between emitter and collector. Let's use a common 9-volt battery. |  |

<table data-summary="ASCII diagram" width="100%" data-cellpadding="20&quot;">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td data-valign="top" width="800" data-bgcolor="#ffffff"><pre><code>             &lt;------
        ____________________
       |                    |
       |                    |
       |              ______|______
       |             |             |
       | Colletor    | COLLECTOR N |
    +  | Batt.       |_____________|
   ____|____         |             |______________
     _____           | BASE      P |              |  
   _________         |=============|              |  +    
     _____   9V      |             |     Base ____|____ 
   _________         | EMITTER  N  |     Batt.  _____
     _____           |_____________|     0.5V _________
   _________                |                   _____
     _____                  |                     |  -
    -  |                    |_____________________|
       |____________________|
&#10;              -------&gt;
&#10;
&#10;</code></pre></td>
<td></td>
</tr>
</tbody>
</table>

<table data-summary="paragraph" width="100%" data-cellpadding="20&quot;">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td data-valign="top" width="800" data-bgcolor="#ffffff">So the Base Battery turns on the transistor's "switch", and this lets the 9-volt Collector-Battery drive a large flow of charge vertically through the entire thing.<br />
&#10;<p>What use then is the "collector's" silicon? Won't the voltage from the collector battery override control from the base? And why have <em>three</em> silicon segments at all? Won't the second Depletion Layer turn everything off? And why not just connect the top wire to the Base section directly?<br />
</p>
<p>The answers are in the last of these questions. If we got rid of the collector, we'd accidentally connect the two batteries together, since silicon is a good conductor. We'd end up with a diode instead (see below.) The batteries would fight each other, and the diode would just act like a short circuit between the two batteries.</p></td>
<td></td>
</tr>
</tbody>
</table>

<table data-summary="ASCII diagram" width="100%" data-cellpadding="20&quot;">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td data-valign="top" width="800" data-bgcolor="#ffffff"><pre><code>
                                      IT&#39;S ALL SHORTED OUT, IT
                                      GETS HOT AND SMOKES
             _____________________      __________________            
            |                     |    |                  |
  Collector |                     |    |                  |
  Battery   |   +             ____|____|___               |
        ____|____            |             |              |
          _____              | BASE      P |              |  
        _________            |=============|              |  +    
          _____   9V         |             |          ____|____ 
        _________            | EMITTER  N  |            _____    Base
          _____              |_____________|          _________  Battery
        _________                   |                   _____     .5V
          _____                     | IT&#39;S A PN DIODE     |  -
            |   -                   |                     |
            |_______________________|_____________________|
</code></pre></td>
<td></td>
</tr>
</tbody>
</table>

<table data-summary="paragraph" width="100%" data-cellpadding="20&quot;">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td data-valign="top" width="800" data-bgcolor="#ffffff">Obviously the collector is required. Obviously the collector segment does something really strange!<br />
&#10;<p>Notice that the collector battery is applying a (+) polarity to the collector, but the collector is n-type silicon. Isn't this backwards? Won't there be a whole second Depletion Layer forming between collector and base? YES! And since we're using a 9-volt battery to pull the movable holes in the p-type away from the electrons in the n-type, this depletion layer will be a thick one. It should act like a turned-off switch, eh? It does... and yet it doesn't. I personally think this is the strangest part of transistor action, and it took me a good while before my brain stopped rejecting the weirdness so I could "see" it all happening at once.</p></td>
<td></td>
</tr>
</tbody>
</table>

<table data-summary="ASCII diagram" width="100%" data-cellpadding="20&quot;">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td data-valign="top" width="800" data-bgcolor="#ffffff"><pre><code>            &lt;------
             _______________________
            |                       |
            |                       |
            |                 ______|______
            |                |             |
  Collector |                | COLLECTOR N |
  Battery   |   +            |_____________| thick depletion layer
            |                 _____________
        ____|____            |             |______________
          _____              | BASE      P |              |  
        _________            |=============|              |  +    
          _____   9V         |             |          ____|____ 
        _________            | EMITTER  N  |            _____    Base
          _____              |_____________|          _________  Battery
        _________                   |                   _____     .5V
          _____                     |                     |  -
            |   -                   |_____________________|
            |_______________________|
&#10;                    -------&gt;</code></pre></td>
<td></td>
</tr>
</tbody>
</table>

<table data-summary="paragraph" width="100%" data-cellpadding="20&quot;">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td data-valign="top" width="800" data-bgcolor="#ffffff">OK, this new depletion layer keeps the Collector Battery from affecting the rest of the transistor. If we increase the voltage of that 9V battery, the insulating layer between Base and Collector segments just gets thicker, and the Base/Emitter segments below the Collector never feel the voltage-force from that battery. Yes, the "upper surface" of the Base segment in the upper depletion zone does feel the force from the 9V battery, but the rest of the circuit does not. (It's like waving a highly-charged balloon near a flashlight's circuit. Nothing happens to the charge flow in the flashlight.)<br />
&#10;<p>HOWEVER!<br />
</p>
<p>Because the Base battery has already thinned out the insulating emitter depletion layer, this means that swarms of movable electrons can pour from the Emitter and upwards into the Base segment. Only a few will actually flow upwards into the Base, since it would cause a traffic jam if the Base wire wasn't able to immediately suck those electrons out again. (Or more accurately, if the electrons in the Base don't leave again, and aren't cancelled by holes, then any extra electrons would cause the Base segment to become negatively charged, which would repel any more electrons coming upwards from the Emitter. See, a traffic jam.<br />
</p>
<p>So now we have a sparse cloud of a few electrons entering the p-type silicon of the Base section from below, and some of those electrons wander upwards into the "upper surface" of the Base segment. What happens? They're suddenly exposed to the attraction of the 9V battery positive voltage.<br />
</p>
<p>The upper depletion region doesn't act so much like a hunk of insulating glass, instead it acts like an insulating air gap. It's only insulating if there are no movable charges present. It doesn't block the flow of charges, but if no charges exist there, the voltage cannot create a charge flow.<br />
</p>
<p>PS, Don't forget, there were always plenty of holes already in the Base segment, but any holes which dare to wander upwards out of the Base segment will be pushed back down by the positive polarity of the 9V battery. (That's what makes the depletion zone act like an insulator in the first place: it repels holes back down into the P, and repels electrons back up into the N Collector segment.) Imagine that the Collector segment is conductive metal. The Base segment is also like a metal, and the depletion region between them is like an empty space. Next, "static electricity" happens!<br />
</p>
<p>We've electrically charged the Collector segment to positive 9 volts. Stick some rice-crispies in the empty gap, and if they're negatively charged they'll be sucked upwards. Well, the few wandering electrons in the Base segment act <em>just like</em> negatively charged objects, and if they should wander up to the surface of the base layer ...up they'll go. They'll be sucked across the gap into the Collector and then forced to go around the rest of the collector circuit. This can only happen if they get to the "upper surface" of the Base segment. When they were down within the Base segment, the Base acted like a conductive metal shield, and the wandering electrons didn't "see" the strong attractive field coming from the Collector segment.<br />
</p>
<p>Some electrons are yanked upwards and go missing from the Base. But this relieves the "traffic jam!" The Base region loses some electrons upwards. As soon as the positively charged Collector has yanked some electrons out of the Base segment, more electrons can finally pour in from below... which gives us more wandering electrons to be yanked upwards, and so on. A fairly huge vertical charge flow appears.<br />
</p>
<p>The "traffic jam effect," as well as the valve-action of the thin depletion zone between base and emitter, these team up to control the main vertical current through the whole transistor. Any electron which wanders across the very thin Emitter depletion zone can also wander across the thin Base segment and end up becoming part of the big flow of charge in the Collector Battery circuit. The Base Battery voltage controls the width of the thin depletion zone, and this controls the amount of electrons pouring up into the collector. The Collector's 9V battery provides the "suction" that drives the main vertical current. But if we change the collector's battery voltage, the vertical flow of charge does not change. <em>Doesn't change?</em> It's because the collector battery only attracts what electrons it's given by the Base segment. It can't alter the collector current. This is an interesting situation known as a "constant current power supply."<br />
</p>
<p>Note that it's important to make the Base segment be fairly thin so we maximize the "traffic jam" effect (and minimize the number of charges that unnecessarily leak out of the Base wire.) We're relying on the natural ability of electrons to wander across the Base section all by themselves. No voltage is pushing them in that direction. The Base Battery is pulling them slowly sideways towards the Base wire. The Collector battery can't start yanking on them at all, not until they reach the "upper surface" of the Base segment.<br />
</p>
<hr />
<blockquote>
<em>If you make people think they're thinking, they'll love you. But if you really make them think, they'll hate you</em>     - Don Marquis
</blockquote>
<hr />
<br />
&#10;<p>Whew. All the stuff above is a very large chunk to swallow. Don't be suprised if it takes your brain awhile to connect all the puzzle-pieces together. It took me ages to see all of this (and it only happened years after I took the two semesters of engineering school exclusively focused on the <a href="http://www.google.com/search?q=transistor+ebers-moll" rel="nofollow">Ebers-Moll</a> mathematical model describing this entire subject.) The voltage-control viewpoint shown by the Ebers-Moll explanation does appear widely in textbooks, but it certainly isn't widely learned. If it had been learned, then people wouldn't get angry when they hear that transistors are voltage-controlled; that the collector current is proportional to the voltage across the base-emitter junction.<br />
</p>
<p>We'd better recap:<br />
</p>
<blockquote>
<p>10. THE TRANSISTOR CAN ACT LIKE A SWITCH (OR LIKE A PARTIALLY-ON SWITCH.)<br />
</p>
<p>11. CONNECT A POWER SUPPLY OR BATTERY FROM COLLECTOR TO EMITTER IN ORDER TO CREATE A BIG FLOW OF CHARGE (BUT WHY?)<br />
</p>
<p>12. THERE'S ANOTHER DEPLETION ZONE BETWEEN COLLECTOR AND BASE.<br />
</p>
<p>13. THIS NEW DEPLETION ZONE ACTS LIKE AN INSULATING AIR GAP.<br />
</p>
<p>14. ANY ELECTRONS WHICH RANDOMLY WANDER ALL THE WAY ACROSS THE BASE ARE GRABBED BY THE COLLECTOR; THEY'RE <em>FORCED</em>ACROSS THE UPPER DEPLETION ZONE.<br />
</p>
<p>15. THE BASE DEPLETION ZONE CONTROLS THE COLLECTOR BATTERY CURRENT. BUT CHANGES IN THE COLLECTOR VOLTAGE HAVE LITTLE EFFECT.<br />
</p>
</blockquote>
If we crank up the Base Battery voltage, the emitter's depletion layer thins, the "switch" is fully on, and a very large flow of charge might appear in the collector circuit. Uh oh. The transistor (as a switch) is trying to short out the collector battery. So lets have it switch something. Give it a light bulb in series.</td>
<td></td>
</tr>
</tbody>
</table>

<table data-summary="ASCII diagram" width="100%" data-cellpadding="20&quot;">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td data-valign="top" width="800" data-bgcolor="#ffffff"><pre><code>
                    ________    Light
                   /        \   Bulb
        |    ________/\/\/\________
        |   |                      |
        |   |      \________/      |
        v   |                      |
            |                      |
            |                ______|______
            |               |             |
  Collector |               | COLLECTOR N |     Thick depletion
  Battery   |   +           |_____________|     layer with electrons
            |                _____________  &lt;-- passing through
        ____|____           |             |______________
          _____             | BASE      P |              |  
        _________           |=============|              |  +    
          _____   9V        |             |          ____|____ 
        _________           | EMITTER  N  |            _____    Base
          _____             |_____________|          _________  Battery
        _________                  |                   _____     .7V
          _____                    |                     |  -
            |   -                  |_____________________|
            |______________________|
&#10;                    ------&gt;
</code></pre></td>
<td></td>
</tr>
</tbody>
</table>

<table data-summary="paragraph" width="100%" data-cellpadding="20&quot;">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td data-valign="top" width="800" data-bgcolor="#ffffff">And finally we take one last look at the flow of charge in the base wire. Even though it's really the *voltage* between base and emitter which controls the transistor, we don't ignore the base-wire's current entirely. It has an important use. Just by coincidence, the tiny base/emitter current is proportional to the large collector/emitter current. So if we know the value of flowing charge in the base wire, we can multiply its value by this "Current Gain" factor, and then figure out just what the charge-flow in the Collector wire should be. The transistor ACTS as if it is amplifying current. But it's really using a small change in *voltage* to create a large change in current. (It's more than just coincidence that the charge flowing in the Base and Collector are proportional. In fact, both flows are controlled by the Base/Emitter voltage, which controls the thickness of the Emitter's depletion layer.) The Collector current is large because the Emitter's thin depletion layer lets huge amounts of electrons escape up into the Collector region. The current in the Base wire is small because only a few electrons are needed in order to change the BE voltage and the thickness of the Emitter's depletion zone.<br />
&#10;<p>A voltage in one place controls a flow of charge in another. This fact even determines the name of the entire device. Changing a voltage causes a change in current, so the device behaves somewhat like a <em>resistor.</em> But the voltage that controls the current is on an entirely different wire. It's as if the effects of the voltage are <em>transferred</em> from the Base side of the circuit to the Collector side. Transfer resistor. Transistor.<br />
</p>
<blockquote>
<p>16. BASE VOLTAGE CONTROLS COLLECTOR CURRENT.<br />
</p>
<p>17. PURE LUCK?: THE BASE LEAKAGE IS PROPORTIONAL TO COLLECTOR CURRENT.<br />
</p>
<p>18. TRANSISTORS ARE *NOT* CURRENT AMPLIFIERS. BUT IT CERTAINLY SIMPLIFIES THINGS IF WE PRETEND THAT THEY ARE.</p>
</blockquote>
So, was this explanation too big and nasty? It certainly would be easier if all the textbook authors themselves had a better idea of how transistors work. It would be easier if they stopped telling people that transistors "amplify current." And it certainly would be easier if I get off my butt and create some animations to illustrate the above text!<br />
&#10;<p><span id="lil"></span> <strong>PS</strong><br />
The transistor was invented around 1923, by physicist Dr. J. Edgar Lilienfeld, the father of the modern electrolytic capacitor. WHAT?!!! But everyone knows that it was invented at Bell Labs in 1945. Nope. The original transistor was a 1920s thin-film device deposited on glass. The base region was a clever idea: crack a piece of glass, put it back together with metal foil clamped in the crack, then slice off the extra foil to make a flat surface that goes: glass, metal, glass. Deposit a thin layer of semiconductor and heat the device, and the thin metal line will "dope" that part of the semiconductor layer. Simple! Dr. Lillienfeld apparently had a multi-transistor radio which he was showing around to investors. But Dr. Lillienfeld unfortunately didn't have a solid theory to explain how his invention worked, so it was ignored. Some hobbyist should try making a home-built Lilienfeld transistor.<br />
</p>
<p>Lilienfeld's patent numbers are:</p>
<ul>
<li># <a href="http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&amp;Sect2=HITOFF&amp;d=PALL&amp;p=1&amp;u=/netahtml/srchnum.htm&amp;r=1&amp;f=G&amp;l=50&amp;s1=1,745,175.WKU.&amp;OS=PN/1,745,175&amp;RS=PN/1,745,175" rel="nofollow">1,745,175</a> Method and Apparatus for Controlling Electric Currents</li>
<li># <a href="http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&amp;Sect2=HITOFF&amp;d=PALL&amp;p=1&amp;u=/netahtml/srchnum.htm&amp;r=1&amp;f=G&amp;l=50&amp;s1=1,877,140.WKU.&amp;OS=PN/1,877,140&amp;RS=PN/1,877,140" rel="nofollow">1,877,140</a> Amplifier for Electric Current</li>
<li># <a href="http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&amp;Sect2=HITOFF&amp;d=PALL&amp;p=1&amp;u=/netahtml/srchnum.htm&amp;r=1&amp;f=G&amp;l=50&amp;s1=1,900,018.WKU.&amp;OS=PN/1,900,018&amp;RS=PN/1,900,018" rel="nofollow">1,900,018</a> Device for Controlling Electric Current</li>
</ul>
[Click on IMAGES button to view them.]<br />
These patents caused Bardeen, Brattain, and Shockley some grief, and caused the US Patent Office to disallow the Bell Labs FET patents in later years.<br />
&#10;<p><span id="galena"></span> PPS<br />
It's possible to make a transistor using Galena (lead sulfide, PbS). Galena is often available from rock shops and science museum stores. You can even make your own by melting sulfur and lead powder over a flame. Look up keywords such as "cat's whisker diode" and "crystal radio" to find out more.<br />
</p>
<p>The trick to making a transistor is to use a freshly-cleaved crystal face, to sharpen your cat's-whisker contacts by dissolving the tips using electrolysis, and then to put the tips within 0.05mm of each other (or preferrably within 0.01mm). Obviously the latter is the hardest part. Better use a microscope! The authors of the following article found that the base/emitter junction was critical: it HAD to behave as a good rectifier. The base/collector junction wasn't as important. They got some power gain, but their beta was in the single digits. <a href="http://web.archive.org/web/20070601000000*/http://ourworld.compuserve.com/homepages/Andrew_Wylie/homemade.HTM" rel="nofollow">Others</a> have mentioned that if you break open a 1N34 glass diode to expose the Germanium chip, you can make a crude transistor with a similar procedure.</p>
<blockquote>
Crystal Triode Action in Lead Sulphide, P. C. Banbury, H.A. Gebbie, C. A. Hogarth, pp78-86. SEMI-CONDUCTING MATERIALS, Conference proceedings, H.K. Henisch (ed), 1951 Butterworth's scientific publications LTD 1951.
</blockquote>
<span id="use"></span> PPPS<br />
WHAT ARE TRANSISTORS USED FOR? Ah, that's a whole 'nother article. But here's one example. Computers are made out of processors and memory. Processors are made out of "state machines" and "data selectors," while memory is made out of data selectors and the flipflops that store the individual bits. State machines in turn are are made out of data selectors, and data selectors are made out of nand-gates or nor-gates. Memory flipflops are made out of nand-gates or nor-gates. <em>Everything</em> is made out of Nand or Nor gates. And... nand-gates and nor-gates are made out of transistors.<br />
&#10;<p>So... computers are entirely made out of transistors. If computers are like animals, then animals are made of tissues, which are made of cells, which are made of organelles, which are made of proteins, which are made of molecules, which are made of atoms. Yet an animal is entirely made of atoms, and everything else is just interesting patterns in those atoms. Digital electronics has similar levels of complexity and organization, and in digital electronics, <em>the transistor is the "atom."</em> The transistor looks too simple though. It looks uninteresting. Ah, but when you have clusters of transistors hooked together in various ways, <em>then</em> you'll learn all the fascinating things you can do with them.<br />
</p>
<p><span id="amp"></span> PPPPPPPS<br />
People often ask: is a transistor an amplifier, or is it some sort of valve? The answer is yes. The answer is yes because all valves are amplifiers. How much energy does it take to open a water faucet? Now think about the large amount of work the flowing water can perform. A nicely made faucet could be opened and closed with the force from just one finger, but connect the output to a water turbine, and it can do work at a rate of many horsepower. The energy of your finger motion is multiplied by tens of thousands of times. Yet it's the distant power supply; the city water pumps, which actually do the work. Transistors behave in much the same way. Connect a transistor to a power supply, and you've got a crude amplifier.<br />
</p>
<p><span id="trolls"></span> PPPPPPPPPPPS<br />
This article apparently has triggered extensive debates if not flamewars on multiple hobbyist forums, newsgroups, and WP. It's as if many people see Ic=hfe*Ib as holy scripture, while the Shockley equation Ic=Is(e^Vbe/Vt) is Dark Heresy which must be kept from the delicate ears of children. The cause of controversy is fairly obvious: at early stages we're all taught that BJTs are current-controlled devices, and only in later engineering physics courses is this claim held up to the harsh spotlight of critical questioning. Also, the current-control viewpoint works just fine as long as we give it lip service and then turn around and use Spice programs, or as long as we never look too closely at details of the inner workings of the physics. This situation leads most people to firmly decide that Ic really is affected by Ib, and not by Vbe. (Or perhaps they believe that, in diodes, the Vf diode drop is caused by the current?) I note that these debates all seem to feature typical flaws:</p>
Primary is a sort of backwards reasoning: first we take a stance for (or against) current control. Then we hotly defend that stance against all comers while cherry-picking the supporting evidence and ridiculing all contrary evidence. But that's not reason. That's religion or politics. It's how pseudoscientists operate. Science is the very opposite: in science, first we try like hell to avoid rigid preconceptions and emotional biases. We take no stand for or against. Then we honestly ask which side of any debate is actually right: ask whether transistors really are controlled by voltage or by current. And then we take the answers seriously, without desperately twisting facts to avoid losing face in public, without breaking sweat while having steam shoot out our ears, and without descending into mild insanity triggered by psychological denial that we're not the experts we thought we were, and now everybody has seen that we're on the 'losing' side. :)<br />
<br />
&#10;Second problem: is the current-controlled viewpoint <em>really</em> held by all scientists and engineers everywhere, while voltage control is terribly wrong? Nope. Look at the Ebers-Moll section of Sedra/Smith, Horowitz/Hill, or most any engineering text. Don't trust opinions from people on forums, instead go out and actually ask some engineering authors (many are online!) Ask semiconductor physicists. Ask professional engineers. <a href="http://cr4.globalspec.com/comment/720033/Re-Voltage-vs-Current" rel="nofollow">Their answers may surprise you.</a> And don't ask them about abstract models of black-box transistors, ask about the topic of this article: the internal physics: ask whether Vbe or Ib determines Ic, ask what is the origin of Ebers-Moll and the Shockley equation, and what role does Ib and hfe actually plau?)<br />
<br />
&#10;Third problem: <em>transient</em> Ib currents seem to cause confusion. Whenever Vbe changes value, charges obviously must move during the changing profile of the depletion layer, and this requires a momentary charge-flow in the base lead. I've seen several people proclaiming that this proves that Ib "causes" Vbe. No, that's a clear attempt to twist facts. The potential barrier in a semiconductor junction isn't "caused" by current any more than the voltage across a capacitor sitting on a shelf is being "caused" by any continuing current. In truth it just means that a <em>changing</em> capacitor voltage always requires a momentary current. To explain the high frequency behavior of BJTs, we need Gummel-Poon and not just Ebers-Moll. Gummel-Poon is another voltage control model, just like Ebers-Moll. This issue doesn't apply to the low-freq or DC case where Ic=Is(e^Vbe/Vt) where Vbe isn't changing, and the values of Vbe, Ic, and Ib are all connected together. The Ebers-Moll model shows that Ic is proportional to Vbe, but in order to see this in simple direct fashion, we must ignore the Emitter- Base capacitance and any transient currents which are charging/discharging the Base capacitance during changing conditions.<br />
<br />
&#10;Fourth problem: we've all been taught that BJT transistors are totally different than FET transistors. After all, BJTs are bipolar, require PN junctions, need both electrons and "holes." Well, this is wrong. There, I've said it. (Next flamewar can start now!) Transistors aren't inherently bipolar. Schockley didn't know what he was talking about at the time. Today it's too big of an error to try correcting, or even to face. The theory behind Schottky diodes, where metal and N-type doping cause rectification without holes, came later. Yet point-contact diodes predate everything. It's possible to use N-doped silicon to make metal-semiconductor junctions and construct a BJT transistor which contains no PN junctions and uses no holes. Build a model of the very first point-contact transistor using N-type germanium. No PN, just N--, N. (A BJT transistor which isn't bipolar? HERESY!)<br />
<br />
All this stuff just highlights the central difference between FETs and BJTs: in FETs the insulating regions invade from the side and make the conductive path narrower. BJTs are very different, since their insulating region is permanently in position, cutting across the Emitter's conductive path, but it can be made so thin that it cannot block even an immense charge flow. If FETs are like "electricity shutters," then a BJT is like "electricity sunglasses" where you can alter the opacity. Make the barrier more and less conductive, rather than making a channel wider and narrower. Aaaaaand... holes aren't an absolute requirement for forming a depletion layer. We just need to <em>sweep the mobile charges out of the silicon</em>. In other words, BJTs don't need the "B," just the "JT." (Now just try to imagine a huge community like EEs and Techs all trying to admit the mistake, and attempting to go back and change the name of the Bipolar Junction Transistor to fit the facts! Ain't gonna happen.)<br />
&#10;Fifth problem: the widespread, repeated, and confident claim that, when we shine light on a phototransistor, Ic changes, but Vbe does not. Ic can be anything, while Vbe remains zero. Uh. Hmm. That's not like the phototransistors I've used in the past. Those acted like photodiodes, with Vbe varying with illumination. Well, no matter how confident or how repeated the pronouncement, it's easier to just buy some PTs and see what actually happens. First control Ic with a Base connection and recorde Vbe versus Ic, then remove the Base wire and control Ic with light, again recording Vbe versus Ic. Or put it this way: do BJT phototransistors completely ignore the Shockley equation which rules all other BJTs?<br />
<br />
&#10;Sixth problem: down inside any resistor, the current density is controlled by the value of e-field, but the e-field isn't determined by the current density. Huh? Try again: charges get accelerated by electrostatic fields, but the reverse is not true: an accelerating charge is not the cause of that e-field. At the macroscopic level, this means that voltage causes current. E-fields cause charges to accelerate, so voltage causes current. Voltage always causes current. Current cannot cause voltage.<br />
<br />
Whaaaaat? Before you get in a lather, make note of the following. Yes, if we already know the values of the current and resistance, we can easily work backwards and calculate the voltage which was causing the current. Current can <em>reveal the value</em> of an unknown voltage, if resistance is known. But the resistor itself doesn't operate backwards: the e-field accelerates the mobile charges, and not the reverse. (Similarly, a gravitational potential pulls a dropped rock downwards, but if you manually accelerate a rock towards a surface, this doesn't create a gravity potential.) And so in diodes, Vf determines the diode current, but the current doesn't cause Vf. Yet isn't all of this crazy talk, because Ohm's law works fine when we assume that <em>current causes voltage.</em> Yes, that's right, and it's because Ohm's law ignores the internal physics. Ohm's law is a simplified abstract model; a mental tool, and a very useful one. It treats a resistor as a black box. But Ohm's law is "wrong" in that it incorrectly implies forward and reverse causation between e-fields and carrier drift. As a mental model, "current causes voltage" is incredibly useful. But if we start believing that this convenient mental model is <em>actually true,</em> it's a classic error called "reification." See where I'm going with this? The belief that BJTs are current controlled devices is a good example of the <a href="http://en.wikipedia.org/wiki/Reification_%28fallacy%29" rel="nofollow">Reification Fallacy:</a> a belief that a simplified abstract concept; a convenient mathematical model, has a real-world concrete existence. It also appears to be an example of <span href"https:="" data-www.google.com="" data-search?q="piaget+concrete&quot;" rel="nofollow">Piagetian "Concrete Operational"</span> thinking mode of childhood, where everything has to be real, and abstract mental models aren't accepted as valuable, or used as tools, since they don't exist in the real world.</td>
<td> </td>
</tr>
</tbody>
</table>

|     |     |
|:---:|-----|
|     |     |

<span id="links"></span>

## LINKS

- <a href="http://www.achase.com/win/elec/index.html" rel="nofollow">AOA author Win Hill</a> on CR4 forum explains voltage-controlled BJTs <a href="http://cr4.globalspec.com/comment/720033/Re-Voltage-vs-Current" rel="nofollow">here</a> and\
  <a href="http://cr4.globalspec.com/comment/720374/Re-Voltage-vs-Current" rel="nofollow">here</a>. Also see the <a href="http://books.google.com/books?id=bkOMDgwFA28C&amp;printsec=frontcover#v=onepage&amp;q&amp;f=false" rel="nofollow">volt-controlled BJT chapter 2.1 of "The Art of Electronics".</a>
- <a href="http://www.flickr.com/photos/jeriellsworth/2835459827/" rel="nofollow">Jeri Ellsworth</a>'s home made mosfets, photocells, ICs, and <a href="http://www.youtube.com/user/jeriellsworth#g/u" rel="nofollow">Youtube vids</a>
- <a href="http://web.archive.org/web/20100218025454/http://www.porticus.org/bell/belllabs_transistor1.html" rel="nofollow">Who really invented the transistor?</a>
- <a href="http://mysite.du.edu/~etuttle/electron/elect2.htm" rel="nofollow">"Transisting"</a>
- <a href="http://www.sparkbangbuzz.com/els/iposc-el.htm" rel="nofollow">Homemade Catswhisker Oscillators</a> and <a href="http://www.a-reny.com/iexplorer/cristadyne.html" rel="nofollow">transmitters</a> to go with your crystal radio
- <a href="http://web.archive.org/web/20060301093157/chem.ch.huji.ac.il/~eugeniik/history/lilienfeld.htm" rel="nofollow">Julius Edgar Lilienfeld</a> patent photos, etc.
- RJ Arns <a href="http://web.archive.org/web/20170924132029/http://ieeexplore.ieee.org/document/730824/" rel="nofollow">"The Other Transistor"</a>, earlier MOSFETs, Bell Labs not honest? (also [here](https://digital-library.theiet.org/content/journals/10.1049/esej_19980509))
- Home-built transistors
  - <a href="http://sparkbangbuzz.com/cds-fet/cds-fet.htm" rel="nofollow">Nyle S. FET from CdS photocell</a>
  - <a href="http://www.douglas-self.com/ampins/wwarchive/wwarchive.htm#home" rel="nofollow">Home-made Transistors</a> 1954 P Helsdon EWW
  - <a href="https://www.1010.co.uk/org/dissolutions.html#sec-4-1" rel="nofollow">R. Baker's home-made FET</a> and [text](http://1010.co.uk/materials.html) The Amateur Scientist, June 1970
  - <a href="http://www.americanradiohistory.com/Archive-Radio-Craft/1940s/Radio-Craft-RE-1949-May.pdf" rel="nofollow">Turner 1949 transistor</a>, p38 Radio Craft (pdf)
  - <a href="https://www.youtube.com/watch?v=vmotkjMSKnI" rel="nofollow">Make a point-contact transistor</a> vid Jeri Ellsworth
  - <a href="http://www.hpfriedrichs.com/mybooks/ioa/bks-ioa-gallery2.htm" rel="nofollow">Photo Gallery</a>, scratch-built tubes, transistors HP Friedrichs
  - <a href="http://www.andaquartergetsyoucoffee.com/wp/?page_id=130" rel="nofollow">Thinfilm ZnO transistor</a>
  - <a href="http://groups.yahoo.com/group/home_transistor/" rel="nofollow">Forum: Home_Transistor</a>
- <a href="http://www.faqs.org/docs/electric/Semi/SEMI_4.html" rel="nofollow">faqs.org: Lessons in Electric Circuits: transistor</a>
- <a href="http://www.transistormuseum.com" rel="nofollow">The Transistor Museum</a>
- <a href="http://www.ck722museum.com/" rel="nofollow">CK722</a>, the first hobbyist transistor
- <a href="http://earlyradiohistory.us/1924sens.htm" rel="nofollow">Crystals will replace tubes</a> Hugo Gernsback 1924
- <a href="http://web.archive.org/web/20050701000000*/http://www.mindspring.com/~pfriedr/archives/xsist23.pdf" rel="nofollow">Two-whisker catswhisker radio</a>, 1920s transistor? (.PDF), from <a href="http://web.archive.org/web/20050701000000*/http://www.mindspring.com/~pfriedr/books/ioa/gallery/gallery.htm" rel="nofollow">IOA</a>
- <a href="http://www.jmargolin.com/history/trans.htm" rel="nofollow">Road to the Transistor</a> (and homemade LED)
- <a href="http://www.satcure-focus.com/tutor/page4.htm" rel="nofollow">How transistors work, fluid analog</a>
- <a href="http://web.archive.org/web/20070601000000*/http://ourworld.compuserve.com/homepages/Andrew_Wylie/homemade.HTM" rel="nofollow">Home made transistor</a> and <a href="http://web.archive.org/web/20070601000000*/http://ourworld.compuserve.com/homepages/Andrew_Wylie/gallery.htm" rel="nofollow">history gallery</a>
- <a href="http://forum.allaboutcircuits.com/threads/bjt-transistors-as-voltage-controlled-devices.16487/" rel="nofollow">All About Circuits: Volt-control BJT</a>
- <a href="http://www.cs.wisc.edu/~kovar/hall.html" rel="nofollow">Electronic Band Structure of Germanium, MY ASS!</a>
- <a href="http://scitoys.com/scitoys/scitoys/echem/echem2.html#solarcell" rel="nofollow">Homebrew solar cell (copper oxide)</a>
- <a href="http://web.archive.org/web/20020611043459/http://www.acmi.net.au/AIC/PICKARD_BIO.html" rel="nofollow">GW Pickard, inventor of 1st semiconductor device</a>
- <a href="http://www.mindspring.com/~pfriedr/ioa.htm" rel="nofollow">Instr. of Amplification</a> (home-build tubes and transistors)
- <a href="https://spectrum.ieee.org/tech-history/silicon-revolution/the-irresistible-transistor" rel="nofollow">IEEE Spectrum: early hobbyist transistors</a>

\

## OTHER PAGES HERE

- [How Transistors REALLY work, PART I](http://amasci.com/amateur/transis.html)
- [How capacitors REALLY work](http://amasci.com/emotor/cap1.html)
- [The REAL direction of the electric current](http://amasci.com/amateur/elecdir.html)
- [How lightning REALLY works](http://amasci.com/tesla/spark.html)
- [How electricity REALLY works](http://amasci.com/elect/elefaq.html)
- [Big electricity articles list](http://amasci.com/ele-edu.html)
- [Good stuff](http://amasci.com/unew.html)
- [New stuff](http://amasci.com/news.html)

<!-- -->

<http://amasci.com/amateur/transis2.html>\
Created and maintained by [Bill Beaty](http://amasci.com/billb.html). Mail me at: [<img src="http://amasci.com/graphics/abcg.gif" data-border="0" width="141" height="19" />](http://amasci.com/amfrm/).\

<div class="statcounter">

<a href="http://statcounter.com/shopify/" target="_blank" title="shopify stats"><img src="http://c.statcounter.com/10408414/0/00267183/0/" class="statcounter" alt="shopify stats" /></a>

</div>

[View My Stats](http://statcounter.com/p10408414/?guest=1)
