---
title: "High voltage device: Electrostatic Motor Debugging"
source_domain: amasci.com
source_path: emotor/emotbug.html
order: 84
reachable_from_entry: true
images: 2
internal_links: 14
extracted: 2026-08-07T17:04:22Z
extractor: site_to_paper.py (pandoc)
---

# High voltage device: Electrostatic Motor Debugging

*Source page: `emotor/emotbug.html`*

<table data-summary="site nav" width="100%">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td><table style="width:100%;" data-cellpadding="5" data-summary="Navigation links">
<colgroup>
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 16%" />
</colgroup>
<tbody>
<tr>
<td><strong><a href="http://amasci.com/emotor/emotor.html">UP to e-motor</a> |</strong><br />
</td>
<td><strong><a href="http://amasci.com/emotor/emotdemo.html">MOTOR EXPERIMENTS</a> |</strong><br />
</td>
<td><strong><a href="http://amasci.com/emotor/stathint.html">DESIGN HINTS</a> |</strong><br />
</td>
<td><a href="http://amasci.com/unew.html">GOOD STUFF</a>  |<br />
</td>
<td><a href="http://amasci.com/news.html">NEW STUFF</a>  |<br />
</td>
<td><a href="http://amasci.com/search.html">SEARCH</a><br />
</td>
</tr>
</tbody>
</table></td>
<td style="text-align: right;" data-summary="google search" data-valign="top"><div id="google_translate_element">
&#10;</div>
<div>
&#10;</div></td>
</tr>
</tbody>
</table>

<table data-summary="main text content" width="100%">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td style="text-align: left;" width="180" data-summary="google ad" data-valign="top"><pre><code>
</code></pre>
<pre><code>
</code></pre>
<pre><code>
</code></pre></td>
<td data-valign="top" data-summary="bottle motor" width="800"><h1 id="electrostatic-motor-debugrepair">Electrostatic Motor Debug/Repair</h1>
So you've built it and it doesn't work! Rats!<br />
&#10;<p>(Actually, homemade devices rarely work correctly the very first time.)<br />
</p>
<p>Detailed debugging is <a href="http://amasci.com/emotor/emotbug.html#blw">down below</a>, but first read these:<br />
</p>
<h3 id="dont-make-major-changes">1. DON'T MAKE MAJOR CHANGES</h3>
First, did you build your motor to be somewhat like the one I described in the instructions? It can seem boring to simply copy someone else's idea exactly. It's easy to insert many improvements as you go. This makes the motor YOURS and no longer mine. But if your device doesn't work, what then? Maybe one of your improvements actually made the motor not work. If your motor isn't made from three 2-liter plastic pop bottles with aluminum foil glued to them, then I probably cannot help you debug it unless you hire me to come out to your house and take a look. The solution? First build a motor like mine, since we KNOW that this one works. Then, after you have a working motor, go and add all your alterations and improvements one at a time and see what happens. (In the electronics kit business, when the customers make additions to a device BEFORE making it work first, it's called "Ego Improvements.")<br />
&#10;<h3 id="use-a-reliable-power-supply-at-first">2. USE A RELIABLE POWER SUPPLY AT FIRST</h3>
Next, what are you using as a power supply? Before trying feeble power supplies like balloons/wool, electrophoruses (electrophori?), or Kelvin waterdroppers, try something fairly powerful such as a <a href="http://amasci.com/emotor/vdg.html">VandeGraaff</a> machine, <a href="http://amasci.com/emotor/negion.html">neg-ion gen,</a> or the <a href="http://amasci.com/emotor/tvgen.html">foil-on-TV-screen</a> trick. Get the motor working with a known-good power supply before going off to try your own power supply ideas. This way you'll know to not blame the motor when the fault might be high humidity or a weak power supply. These motors need more than 5,000 volts DC to operate. This can be easily provided by a hefty "static electric" source.<br />
&#10;<h3 id="batteries-wont-work">3. BATTERIES WON'T WORK</h3>
This motor needs a "static electric" power supply (in other words, a power supply that puts out <a href="http://amasci.com/emotor/voltmeas.html">high voltage</a> at low current.) Use a TV screen, or a VandeGraaff Generator, or a <a href="%0A/emotor/negion.html">Negative Ion Generator.</a> I found that my motor would not turn unless the voltage was at least 5,000 volts (and 7,000 volts was much better.) Batteries cannot run this motor unless you have about 4,000 of them hooked in series! (4000 times 1.5 volts is 6,000 volts)<br />
&#10;<h3 id="tesla-coils-wont-work-or-will-they">4. TESLA COILS WON'T WORK (or will they?)</h3>
Tesla coils are no good because they are high-voltage AC and this motor requires high-voltage DC.<br />
&#10;<p>Maybe this is not true! mrgazebo,pacbell net reports that his pop-bottle motor starts turning when the motor is placed near his large, floor-standing Tesla coil, while one bottle of the motor is connected to ground. Weird! Do Tesla Coils actually emit some microamperes of direct current into the air? Possibly. If so, then in theory a Tesla Coil could run this motor, but only if some corona-rectification is allowed to occur, and not if wires are used to connect the motor directly to the Tesla Coil terminals. But even that might be OK! Somebody with a TC should try it. (I tried it with a tiny solid-state tesla coil from a Plasma Sphere, but it would not run the motor.)<br />
</p>
<h3 id="bottle-rotates-easily-friction-must-be-very-low">5. BOTTLE ROTATES EASILY, FRICTION MUST BE VERY LOW</h3>
Other possible problems: does the center bottle turn very freely? VERY VERY freely? It must. Here's a way to judge whether its friction is low enough. Get the bottle spinning slowly by hand, turning about once per second, then let go. It should keep turning for one or two revolutions or more. If not, friction is far too high. Check out the metal point bearing and make sure it hasn't drilled itself into the metal bottle cap. Don't use a plastic bottle cap, the plastic is too soft to provide a good bearing. The bottle must turn VERY easily, otherwise the feeble electrostatic forces won't be able to move it. Some people get good results by attaching a tiny pencil to the top of the center rod, so the graphite pencil point serves as the "sharp point" which the bottlecap rides upon. I highly recommend using a tiny glass test-tube as a bearing. Glue it upside-down in the bottle cap. Don't let the bottle slam down onto the metal rod, or the sharp point will break the test tube! Some sort of tiny, metal, cup-shaped object might also work OK. A metal thumbtack with point removed? Also put a little oil near the bottom of the metal rod where it rides against the hole in the rotor bottle's bottom.
<hr />
<span id="blw"></span>
<h2 id="organized-debugging">ORGANIZED DEBUGGING</h2>
If it still won't work, then you need to look for the problem. Use this "debugging sequence" below.<br />
&#10;<p>Note: if you hate making sparks with your knuckles, then hold a metal object in your hands (use a quarter, or a pop can), and jump the spark to the metal. Painless!<br />
</p>
<ol>
<li><strong>Test for low friction.</strong> Verify that the rotor bottle turns freely, and that the tips of the commutator wires to not drag against it as it rotates. To make friction lower, some people attach a pencil point to the metal rod, so that the bottle cap is riding on the pencil point. Graphite is a lubricant, like oil. Or you can glue an upside-down glass test-tube to the bottle cap of the rotor bottle. The metal point of the rod then rides against smooth glass.<br />
</li>
<li><strong>Reduce the commutator gap</strong> Verify that the tips of the commutator wires are VERY CLOSE to the surface of the rotor bottle. Tiny sparks will be jumping from the wires to the patches of foil. If the gap between the foil and the wire tips is too big, then your motor will only work if you use a VERY hi-volt supply, like a VandeGraaff generator. If the gap is small, then even a feeble power supply will make your motor spin. It pays to use a well-centered bottom hole in the rotor bottle. That way the surface won't move so much as it turns, and you can move the wire tips closer in.<br />
</li>
<li><strong>If using a TV screen for the high voltage, test it</strong>.<br />
Try removing the electrostatic motor, then placing the end of your ground wire very close to the end of the wire from the TV screen. VERY close, like a 1/16 of an inch between them. When you turn the TV on or off, you should see little sparks jump between the ends of the wires. If you don't, then there is something wrong with the TV, or the connections, or the ground. If you get sparks, but the motor won't turn, then the problem is with the motor.<br />
</li>
<li><strong>Test for high voltage</strong> Use the TV method to power your motor. Hook everything up. Turn the TV on, then immediately bump the foil on the TV screen with your knuckle. If you get no spark, then your motor has a short somewhere, or humidity is letting charge leak across the insulating surfaces. Sometimes there is an invisible leakage path between the foils on the rotor bottle. Use a razor knife to trim the foils to give 1/2 inch spacing between the foils on the rotor bottle. Then use something to scrape the plastic between the foils to remove all traces of glue, crud, etc., from the plastic bottle.<br />
</li>
<li><strong>Listen for proper sparking</strong> first give the rotor bottle a slow spin. Let it coast, then immediately turn the TV on or off to create the high voltage. You should hear little clicking noises as sparks jump between the commutator wire tips and the rotor foils. If you DON'T hear any clicking, then the high voltage is being shorted out somehow. If you DO hear clicking, then almost everything is working, but there isn't enough force to turn the rotor. Maybe your TV screen is too small, or friction in the rotor bearing is too high, or the middle bottle is much higher than the side bottles. Or maybe it's way too humid out, and you need to move into an air-conditioned room.<br />
</li>
<li><strong>Test for motor voltage.</strong> If you did get a spark from the TV, then next hook up the motor to the TV and to ground. Turn the TV on or off to generate another burst of hi-voltage, then bump your knuckle against the foil on the stator bottle that's connected to the TV. If you feel no spark, then the connection between the TV and the stator bottle foil is probably bad bad, or maybe there is a short circuit in the motor.<br />
</li>
<li><strong>Test for good ground.</strong> If you do get a spark from that stator bottle, then turn the TV on or off again to make more hi-voltage, and bump the grounded stator bottle with your knuckle. You should get no spark. If you DO get a spark, it means that your source of electrical ground is bad, or there is a bad connection between the "ground" bottle and the distant earth.<br />
</li>
<li><strong>What's left?</strong> If all these tests work out OK, yet the bottle will not turn, then the only causes could be bearing friction (use a glass test tube in the bottle cap), or power supply voltage is too low (try a TV set with a bigger screen and bigger foil, or locate a tabletop VandeGraaff generator: ask your local High School physics teacher.)<br />
</li>
</ol>
Note: if you hate making sparks with your knuckles, then hold a metal object in your hands (use a quarter, or a pop can), and jump the spark to the metal. Painless!<br />
&#10;<h2 id="other-possible-problems">OTHER POSSIBLE PROBLEMS</h2>
The metal of the commutator wires must be directly connected to the foil of their respective STATOR bottles. Commutator wires are electrically a part of the stator foils, so when the power supply is operating, both the wires and the stator foils acquire the same polarity of charge imbalance. If the commutator wires don't make good contact with the foil on their corresponding stators, either the stator foils won't get charged, or no charge will flow down the wire to leap across to the rotor bottle. So, make sure there is no plastic on either end of the commutator wires, and that bare metal touches bare foil. If you have taped your commutator wires securely to the foil of the stator bottles, make sure that there is no tape, hot glue, etc., between the foil and the metal wire.<br />
&#10;<p>The commutator wire's tips need to be very close to the surface of the rotor bottle, but should not scrape along it as it turns. The gap between the wire's tip and the rotating bottle's surface must be as small as possible. If it is too large, then the motor will operate successfully only if the power supply voltage is raised high enough to force sparks to jump across the large gap. If the gap is tiny, then even a weak supply will run your motor. If you ARE seeing tiny sparks jumping between the wire tips and the rotor bottle foils, then the spacing between commutator tip and rotor surface is probably OK, and the power supply voltage is probably high enough. Apply power and give the center bottle a slow spin by hand, and you should hear a slight clicking noise as the tiny sparks jump. Lack of clicking noise indicates either too low a supply voltage, or that something on the motor is providing an unwanted leakage path which shorts out the power supply and reduces its voltage too much.<br />
</p>
<p>If you use a strong power supply such as a VandeGraaff or Wimshurst machine, you can even try increasing the gap to one or two inches and the motor will still run! In this case the electric current takes the form of silent streams of charged air rather than sparks. Your motor then runs via sliding contacts made of invisible ion-beams! Very hard even for scientifically-trained passersby to figure out. &lt;grin&gt; However, first get the motor running before trying this.<br />
</p>
<p>Make sure there is a complete circuit path between your power supply and the motor. If you use a VandeGraaff, you must connect TWO wires between it and the motor. One wire goes between the large sphere and the foil of one of the stator bottles. The other wire goes from the generator's metal base and to the other stator bottle's foil. If you use the TV set, connect one stator bottles' foil to ground, connect the other stator bottle to the TV screen's foil. Wires can be connected to metal surfaces by simply taping them there. (Make sure to strip any plastic coating off the wire ends, you need metal-to-metal contact!) If you attempt to use the wool/balloon method, connect the unused stator bottle's foil to ground. (Hint: if ground is entirely unavailable, try spreading a few feet of aluminum foil on the floor and connecting your motor to that.)<br />
</p>
<p>Are sparks jumping between the central rotor bottle and the FOIL SURFACE of the stator bottles? This is bad. Or are your stator bottles too close or too far from the rotor bottle? About 1/2 in. spacing seems to work OK. If this space is too large, the electrostatic drive force will be greatly reduced. If this space is too small, sparks will jump from the rotor bottle and act as a leakage path, greatly reducing the driving voltage on the stator foils, and slowing or stopping the motor.<br />
</p>
<p>If the humidity is high (above 40% to 50%), it's possible that your power supply is being shorted out by leakage along the plastic surface of wires to ground. Try using plastic cups to support your high-voltage connecting wires up off the table surface. (Wires connected to ground need not be lifted.) Leakage can also happen across the plastic surface of the bottles. This can be cured by warming the exposed plastic parts with an electric blow dryer. (Don't heat them up too much, or they will soften and distort!) Or, store the whole setup in a cold, air-conditioned room for a couple of hours, then operate it in that room. Or, wait to try again on a day which isn't as humid. Hint: if you rub a balloon on your arm hairs and the charged balloon can make the arm-hairs rise, the humidity is low enough. If no amount of rubbing with a balloon can lift your arm-hair, then humidity is probably too high.<br />
</p>
<p>If you use a VandeGraaff generator or Wimshurst generator, try taping some strips of tissue to the metal generator sphere so you can monitor the voltage. Cut or tear out a 2" x 1/4" kleenex strip and tape one end to the metal, so the strip hangs down. When the generator is operated, this strip should be repelled from the metal and lift outwards. If it does not, it means that no high voltage is being created. If high voltage is missing, first try totally disconnecting the motor from the generator, then run the generator all alone. If the kleenex still does not rise, then there is something wrong with the generator! Could be high humidity. If so, you can warm the moving parts of the generator with an electric blow dryer (open the vandegraaf sphere or base if necessary, and blow-dry the belt while it's running.)<br />
</p>
<p>Finally, check for possible shorts throughout your entire motor. There must be no surface connections between the three foils of the rotor bottle, and there must be about 1/2" space between them. There must be no connections between the foil on the stator bottle and the wooden base. Many sorts of tape count as a "connection" because of their conductivity, so don't let any tape touch both the wooden base and the foil of the bottles. The first motor I ever built would not run no matter what I did. I discovered that the duct tape I used to connect stator bottles to base was conductive. It was touching the wood base and the stator foils. The wood base was conductive also, and the whole motor was shorted out by the tape.<br />
</p></td>
<td></td>
</tr>
</tbody>
</table>

<http://amasci.com/emotor/emotbug.html>\
Created and maintained by [Bill Beaty](http://amasci.com/billb.html).\
Mail me at: [<img src="http://amasci.com/graphics/abc.gif" data-border="0" width="141" height="19" />](http://amasci.com/amfrm/).\

<div class="statcounter">

<a href="http://statcounter.com/shopify/" target="_blank" title="shopify stats"><img src="http://c.statcounter.com/10408414/0/00267183/0/" class="statcounter" alt="shopify stats" /></a>

</div>

[View My Stats](http://statcounter.com/p10408414/?guest=1)
