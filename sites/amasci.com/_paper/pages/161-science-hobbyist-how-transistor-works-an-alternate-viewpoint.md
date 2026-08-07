---
title: "SCIENCE HOBBYIST: how transistor works, an alternate viewpoint"
source_domain: amasci.com
source_path: amateur/transis.html
order: 161
reachable_from_entry: true
images: 2
internal_links: 17
extracted: 2026-08-07T05:53:07Z
extractor: site_to_paper.py (pandoc)
---

# SCIENCE HOBBYIST: how transistor works, an alternate viewpoint

*Source page: `amateur/transis.html`*

<table height="77" data-summary="site nav" width="100%">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr data-valign="top">
<td><table data-cellpadding="5" data-summary="Navigation links">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<tbody>
<tr>
<td><a href="http://amasci.com/ele-edu.html">ELECTRICITY ARTICLES</a></td>
<td><a href="http://amasci.com/unew.html">GOOD STUFF</a><br />
</td>
<td><a href="http://amasci.com/news.html">NEW STUFF</a><br />
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

<table data-summary="main text" width="100%" data-cellpadding="20">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2" style="text-align: left;" width="18" data-summary="google ad, but more text below it" data-valign="top" data-bgcolor="#fff0e8"></td>
<td width="500" data-bgcolor="#ffffff" data-valign="top" data-summary="Title box: how do 
transistors REALLY work?">HOW DO TRANSISTORS WORK?<br />
&#10;NO, HOW DO THEY <em>REALLY</em> WORK?
<br />
&#10;<p>    Page 1, <a href="http://amasci.com/amateur/transis2.html">Page 2</a>      <a href="http://otro-geek-mas.blogspot.com/2008/08/como-funcionan-realmente-los.html" rel="nofollow">La versiion Espanol.</a>      <a href="http://amasci.com/amateur/trshort.html">Short version</a>      <a href="http://translated.by/you/how-transistors-really-work-page-1/original/" rel="nofollow">Help Translate!</a></p></td>
<td data-bgcolor="#ffffff" width="200" data-valign="top"><strong>©1995 <a href="http://amasci.com/me.html">William Beaty, BSEE</a></strong></td>
<td></td>
</tr>
<tr>
<td colspan="2" data-bgcolor="#ffffff" data-summary="intro paragraph" width="600"><blockquote>
<p>Most technician textbooks do a very poor job of explaining the details of transistors' internal workings. First they assume that the Base current is somehow controlling the Collector current, then they try to explain how one current can affect another. These explanations invariably fail because Bipolar transistors, like FETs, are voltage-controlled devices. One current <strong>doesn't</strong> affect another. Instead, the Base-Emitter voltage controls the thickness of an insulating "depletion layer" which lies in the path of both the Base current and the larger Collector current.<br />
</p>
<p>NOTE: This article delves into bipolar transistor internal operation: it's the physicist's viewpoint; not the engineer's or technician's. While solving design problems, engineers must model the transistor as a current amplifier, or as a transconductance device, or as a charge-controlled current source. If you want to understand a transistor circuit, then the black-box model is what we use. But be warned, because if our goal instead is to "open the hood" and see what's really going on inside, those useful black-box models can derail our understanding.<br />
</p>
</blockquote></td>
<td> </td>
</tr>
</tbody>
</table>

<table data-summary="article main" width="100%" data-cellpadding="20">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<tbody>
<tr>
<td width="700" data-bgcolor="#ffffff"><blockquote>
<em>"The difference between a conviction and a prejudice is that you can explain a conviction without getting angry."</em> - anon
</blockquote>
When I first became interested in electronics as a kid, I sat down and figured out how bipolar transistors work.<br />
&#10;<p>Well, sort of.<br />
</p>
<p>I read many articles which explained the "Common Base" amplifier. Common-base is the setup which was used by the inventors of the transistor. In those explanations, the Base is a grounded piece of Germanium and the input signal is applied to the Emitter. Since common-base amplifiers are rarely used in transistor circuitry, I ended up having to dream up my own explanation. I based it upon the little bits I already knew about the Common Emitter configuration. Common Emitter is the one where the Emitter is grounded, the Base is the input, and where the output is taken across a resistor connected to the Collector. My home-made explanation sort of worked, but I wasn't satisfied. I was full of niggling doubts. And why the hell were the textbooks using Common Base to introduce transistors to the newbies? It just didn't make any sense.<br />
</p>
<p>When I went into engineering school, I found it extremely odd that there were <em>still</em> no good explanations of bipolar transistors. Sure, there were detailed mathematical treatments. Just multiply the Base current by "hfe" to obtain the Collector current. Or, treat the transistor as a two-port network with a system of equations inside. <a href="http://hyperphysics.phy-astr.gsu.edu/hbase/solids/trans2.html#c2">Ebers-Moll</a> and all that. But these were similar to black-box circuits, and none of them said HOW a transistor works, <em>how can a small current have any effect on a larger one????</em> And nobody else seemed curious. Everyone else in the class seemed to think that to memorize the equations was the same as learning concepts and gaining understanding of the device. (<a href="http://amasci.com/feynman.html">R. Feynman</a> calls this the Euclidean or "Greek viewpoint;" the love of mathematics, as opposed to the physicists' "<a href="https://www.google.com/search?q=babylonian+feynman" rel="nofollow">Babylonian viewpoint</a>" where concepts are far more important than equations.) I'm a total Babylonian. For me, math is useless at the start. The equations are like those black-box Spice programs which might work great, but they don't tell you any details of what's happening inside a device in the real world. I can learn the math, but that just means I can run a "mental spice program" without needing any computer, and I still don't know how transistors work. First tell me what "Transistor Action" is all about. Show me animated pictures, use analogies. Only after I've attained a visual and gut-level understanding of something, only then is the math useful to me for refining it and adding all the details. However, for me the math alone is not a genuine explanation. Math is just a tool or a recipe, a crutch for those who want nothing except the final numerical result, and it certainly does not confer expert knowledge.<br />
</p>
<p>Now many years have passed and I think I see the problem...</p>
<blockquote>
Traditional transistor explanations basically *suck.*
</blockquote>
The ones I see in high school textbooks and hobby magazines are terrible. They're full of errors and contradictions. They misuse the word "current" as if it were a substance that flows. They don't explain insulators properly. And they try to prove that the base current can have a direct effect on the collector current. Textbooks for engineers spend their time deriving equations which will end up in software simulations, but still they don't sit down and describe what's happening in a direct clear fashion. And then there's all those authors who use Common-base amplifiers to introduce transistors to newbies. Are they just fools who follow a tradition only because it's traditional? Why don't they ever make efforts to <em>improve</em> the explanations? Were they written in stone by god? Well, if nobody but me thinks the explanation is open to improvements, then I'd better put my money where my mouth is. (And if I'm right, then it should be very easy to write a vastly improved explanation.)<br />
&#10;<p>Below are my ideas on how transistors <em>really</em> work. They're *not* based on the traditional explanations found widely in technician's texts and hobbyist magazines. Instead they're based on engineering textbooks: semiconductor physics and the details behind the Ebers-Moll model. I'm translating the usual math models into a verbal/intuitive version. As you'll soon see, several new concepts are required. It might be easier for you to just memorize the equations rather than to imagine what really goes on inside. But if you DO manage to decode my explanations and crude ASCII artwork, I think you'll be in the elite minority who <em>really understands</em> transistors. I've found that even most working engineers have no good mental picture of bipolar transistor operation. So, if you attain a clear understanding of transistors, you'll surpass many of the experts.<br />
</p>
<hr /></td>
<td width="15"></td>
<td data-valign="top" data-summary="goog ad"><pre><code>
&#10;</code></pre>
ad:<br />
<br />
</td>
<td data-bgcolor="#fff0e8"> </td>
</tr>
</tbody>
</table>

<table data-summary="main text" width="100%" data-cellpadding="20">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td width="700" data-valign="top" data-bgcolor="#ffffff"><strong>Voltage-driven charge-flows</strong><br />
&#10;<p>First of all, you must abandon the idea that <em>current</em> travels in transistors or flows inside of wires. Yes, you heard me right. <a href="http://amasci.com/miscon/whyhard1.html#cur">Current does not flow.</a> Electric current <em>never</em> flows, since an electric current is not a stuff. Electric current is a flow of something else. (Ask yourself this: what's the stuff that flows in a river, is it called "current?" Or is it called "water?")<br />
</p>
<blockquote>
<em>Since a current is a flow of charge, the common expression "flow of current" should be avoided, since literally it means "<em>flow of</em> flow of charge."</em> - MODERN COLLEGE PHYSICS, Richards, Sears, Wehr, Zemansky (find similar in Serway's book COLLEGE PHYSICS)
</blockquote>
So what actually flows inside of wires?<br />
&#10;<p>The stuff that moves within wires is NOT named Electric Current. Intead it is called <strong>Electric Charge</strong>. It's the <a href="http://amasci.com/elect/charge1.html">charge</a> that flows, never the current. The motion of charges can vanish, and the motion can appear. But the motion itself doesn't flow along, it's the charges which flow. And in rivers (or in plumbing,) it's the water that flows, not the "current." Analogy: we cannot understand plumbing until we stop assuming that the pipes are empty ...while also believing in a magical stuff called "current."<br />
</p>
<p>We must learn that pipes are already full; that "water" flows inside them. The same is true with circuits. Wires are not filled with "flow of Current," instead they are pre-filled with charge. Charges which can move. Electric charge is real stuff; it's carried by physical particles, and it can move around with a real velocity and a real direction. Charge behaves much like a "stuff," like a gas or a liquid. But electric current is different from charge: charge is like a stuff, but current is not a stuff. (If current is like wind, then charge is like Nitrogen!) If we experiment with concepts; if we decide to ignore "current," and instead we go and carefully examine the behavior of the moving charges in great detail, we can burn off the clouds of fog that block our understanding of electronics.<br />
</p>
<p><strong>Second:</strong> the charges found within conductors do not push themselves along, but instead they're pushed by "potential difference;" they're pushed by the voltage-fields within the conductive material. Charges are not squirted out of the power supply as if the power supply was some sort of water tank. If you imagine that the charges leave through the negative terminal of the power supply; and if you think that the charges then spread throughout the hollow pipes of the circuit, then you've made a fundamental mistake. If you think that the charges are provided by the power supply, then you've made a fundamental mistake. Wires do not act like "empty electron-pipes." A power supply does not provide any electrons. Power supplies certainly <em>create</em> currents, or they <em>cause</em> currents, but remember, we're removing that word "current." To create a flow of charges, a power supply <em>does not</em> inject any charges into the wires. The power supply is only a pump. A pump can supply a pumping pressure. Pumps never supply the water being pumped.<br />
</p>
<p><strong>Third:</strong> have you discovered the big 'secret' of visualizing electric circuits?</p>
<blockquote>
ALL CONDUCTORS ARE ALREADY FULL OF CHARGE
</blockquote>
Wires and silicon ...both behave like pre-filled water pipes or water tanks. The "water" is the vast population of movable charged particles of the conductor. Electric circuits are based on the "full pipes analogy." This simple idea is usually obscured by the phrases "flow of current," or "power supplies send out current." We end up thinking that wires are like hollow pipes. We end up visualizing a mysterious substance called Current which flows through them. Nope. (Once we get rid of that word "current," we can discover fairly stunning insights into simple circuits, eh?)<br />
&#10;<p>If circuits are like plumbing, <em>then none of the "pipes" of a circuit are ever empty.</em> This idea is extremely important, and without it we cannot understand semiconductors ...or even conductors! Metals contain a vast quantity of movable electrons which forms a sort of "electric fluid" within the metal. A simple hunk of copper is like a water tank! Physicists call this fluid by the name "electron sea of metals," or "the ocean of charge." Semiconductors are always full of this movable "charge-stuff." The movable charge is in there even when a transistor is sitting on the shelf and disconnected from everything. When a voltage is applied across a piece of silicon, those charges already within the material are driven into motion. Also note that the charge within wires is ...uncharged. Every movable electron has a positive proton nearby, so even though the metal contains a vast sea of charge, there is no net charge on average. Wires contain "uncharged" charge. Better call it "cancelled charge." Yet even though the electrons are cancelled by the nearby protons, the electrons can still flow among the protons. Cancelled charge can still move around, so it's possible to have flows of charge in an uncharged metal.<br />
</p>
<p>OK, since the "pipes" are already full of "liquid," then in order to understand circuitry, we should NOT trace out the path starting at the terminals of the power supply. Instead, we can start with any component on the schematic. If a voltage is applied across that component, then the charges within that component will start to flow. Let's modify the old "flashlight explanation" which we all were taught in grade school. Here's the corrected version:<br />
</p>
<blockquote>
<p>AN ACCURATE FLASHLIGHT EXPLANATION:<br />
Wires are full of vast amounts of movable electric charge (all conductors are!) If you connect some wires into a solid ring, you form an "electric circuit" which contains a movable conveyor-belt made of charges within the metal circle. Next we cut this ring in a couple of places and we insert a battery and a light bulb into the cuts. The battery acts as a charge pump, while the light bulb offers friction. The battery pushes the wires' long row of charges forward, then all the charges flow, then the bulb lights up. Let's follow them.<br />
</p>
<p>The charges start out inside the light bulb filament. (No, not inside the battery. We start at the <em>bulb</em>.) The charges are forced to flow along through the filament. Then they flow out into the first wire and move along to the battery's first terminal. (At the same time more charges enter the filament through its other end.) The battery pumps the charges through itself and back out again. The charges leave the second battery terminal, then they flow through the second wire to the bulb. They wind up back inside the light bulb filament. At the same time, the charges in other parts of the circuit are doing the same thing. It's like a <em>solid belt</em> made out of charges. The battery acts as a drive- wheel which is moving the belt. The wires behave as if they hide a conveyor belt inside. The light bulb acts like "friction;" it gets hot when its own natural charges are forced to flow along. The battery speeds up the entire belt, while the friction of the light bulb slows it down again. And so the belt runs constantly, and the light bulb gets hot.</p>
</blockquote>
<br />
&#10;<hr />
<blockquote>
<blockquote>
<em>The truth will set you free ...but first it will piss you off!      -anon</em>
</blockquote>
</blockquote>
<hr />
<br />
&#10;<p>Brief review:<br />
</p>
<blockquote>
<p>1. THE STUFF THAT FLOWS THROUGH CONDUCTORS IS CALLED CHARGE. ("CURRENT" DOESN'T FLOW.)<br />
</p>
<p>2. THE CHARGE INSIDE CONDUCTORS IS SWEPT ALONG BY VOLTAGE FIELDS.<br />
</p>
<p>3. ALL WIRES ARE "PRE-FILLED" WITH A VAST AMOUNT OF MOVABLE CHARGE<br />
</p>
<p>4. BATTERIES AND POWER SUPPLIES ARE CHARGE-PUMPS.<br />
</p>
<p>5. LIGHT BULBS AND RESISTORS BOTH ACT "FRICTIONALLY."<br />
</p>
</blockquote>
One last thing: The difference between a conductor and an insulator is simple: conductors are like pre-filled water pipes, while insulators are like pipes choked with ice. Both contain the "electric stuff;" conductors and insulators both are full of electrically charged particles. But the "stuff" inside an insulator can't move. When we apply a pressure-difference along a water pipe, the water flows. But with an empty pipe, there's nothing there, so the flow does not occur. And with an ice-choked pipe, the stuff is trapped and doesn't budge. (In other words, voltage causes charge-flow in conductors, but it can't cause charge-flow in insulators because the charges are either missing, or immobilized.) Many intro textbooks get their definitions wrong. They define a conductor as something through which charges can flow, and insulators supposedly block charges. Nope. Air and vacuum don't block charges, yet air and vacuum are good insulators! In fact, a conductor is something that contains movable charges, while an insulator is something that lacks them. (If a book gets this foundational idea wrong, then most of its later explanations are like buildings built on a pile of garbage, and they tend to collapse.)<br />
&#10;<hr />
<p>One more last thing before diving into transistors. <em>Silicon is very different than metal.</em> Metals are full of movable charges... but so is doped silicon. How are they different? Sure, there's that matter of the "band gap," and the difference between electrons versus holes, but that's not the important thing. The important difference is quite simple: metals have vast quantities of movable charge, but silicon has far less. For example in copper, every single copper atom donates one movable electron to the "sea of charge." Copper's "electric fluid" is very dense; it's just as dense as the copper metal. But in doped silicon, only one in every billion atoms donates a movable charge. Silicon is like a big empty space with an occasional wandering charge. In silicon, you can sweep all the charges out of the material by using a few volts of potential, while in a metal it would take billions of volts to accomplish the same thing. Or in other words:</p>
<blockquote>
6. THE CHARGE INSIDE OF SEMICONDUCTORS IS LIKE A COMPRESSIBLE GAS, WHILE THE CHARGE INSIDE OF METALS IS LIKE A DENSE AND INCOMPRESSIBLE LIQUID.
</blockquote>
Sweeping away the charges in a material is the same as converting that material from a conductor to an insulator. If silicon is like a rubber hose, then it's a hose which contains compressible gas. We can easily squeeze it shut and stop the flow. But if copper is also like a rubber hose, then instead, it's like a hose full of iron slugs. You can squeeze and squeeze, but you can't smash them out of the way. But with air hoses and with silicon conductors, even a small sideways pressure can pinch the pathway shut and stop the flow.<br />
&#10;<hr />
<br />
&#10;<p>OK, let's look at the way that transistors are usually explained.<br />
</p>
<p>To turn on an NPN transistor, a voltage is applied across the base and emitter terminals. This causes electrons in the Base wire to move away from the transistor itself and flow out towards the power supply. This in turn yanks electrons out of the P-type base region, leaving 'holes' behind, and the 'holes' act like positive charges which are pushed in the opposite direction from the direction of electron current. What SEEMS to happen is that the base wire injects positive charges into the base region. It spews holes. It injects charge.<br />
</p>
<p>(Note that I'm describing <em>charge flow</em> here, not positive-charge "conventional current.")<br />
</p></td>
<td data-bgcolor="#fff0e8"> </td>
</tr>
</tbody>
</table>

<table data-summary="main text" width="100%" data-cellpadding="20" data-bgcolor="#ffffff">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td width="700" data-valign="top"><table width="100%">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<tbody>
<tr data-valign="top">
<td width="60"></td>
<td width="250"><pre><code>       |
 ______|______
|             |
| COLLECTOR N |
|_____________|
|             |  -----&gt;
| BASE      P |___________ 
|_____________|           |  +
|             |       ____|____ 
| EMITTER  N  |         _____
|_____________|       _________
       |                _____
       |__________________|  -
</code></pre></td>
<td width="240"><pre><code>
&#10;
&#10;
</code></pre>
<code> ELECTRONS ARE PULLED FROM THE BASE REGION AND INTO THE WIRE, WHICH CREATES POSITIVE "HOLES" WHICH SPEW OUT INTO THE BASE REGION.</code></td>
<td></td>
</tr>
</tbody>
</table></td>
<td data-bgcolor="#fff0e8"> </td>
</tr>
</tbody>
</table>

<table data-summary="main text" width="100%" data-cellpadding="20" data-bgcolor="#ffffff">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td width="700" data-valign="top">That's part of the conventional explanation. Why is all of this important to transistor operation? ***<em>It's not</em>!*** The base current is not important to transistor operation. It's just a byproduct of the REAL operation, which involves an insulating layer called the Depletion Region. By focusing attention on the current in the Base lead, most authors go up a dead end in their explanations. To avoid this fate, we must start out by ignoring the base current. Instead we look elsewhere for understanding. See the diagram below.<br />
</td>
<td data-bgcolor="#fff0e8"> </td>
</tr>
</tbody>
</table>

<table data-summary="main text" width="100%" data-cellpadding="20" data-bgcolor="#ffffff">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td width="30"></td>
<td width="630" data-valign="top"><pre><code>       |
 ______|______
|             |          \
| COLLECTOR   |          |  Full of
|             |           &gt; wandering 
|  n-doped    |          |  electrons
|_____________|          /                
|             |      \    
| BASE        |      |  full of  
|             |--     &gt; wandering &quot;holes&quot;
|  p-doped    |      |    
|_____________|      /  
|             |          \       
| EMITTER     |          |  full of
|             |           &gt; wandering
|  n-doped    |          |  electrons
|_____________|          /  
       |             
       | </code></pre></td>
<td data-bgcolor="#fff0e8"> </td>
</tr>
</tbody>
</table>

|  |  |
|----|----|
| The Depletion Region is an insulating layer existing between the base region and the emitter region. Why is it there? It exists because the Base region is p-doped silicon; the insulating layer appears because p-type silicon is full of naturally-occurring movable "holes," and because the p-type silicon is touching n-type silicon. |   |

<table data-summary="main text" width="100%" data-cellpadding="20" data-bgcolor="#ffffff">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td width="30" data-bgcolor="#ffffff"></td>
<td width="630" data-valign="top" data-bgcolor="#ffffff"><pre><code>       |
 ______|______
|             |
| COLLECTOR N |
|_____________|
|             |
| BASE      P |--
|_____________|          insulating
 _____________    &lt;-- &quot;depletion layer&quot;
|             |
| EMITTER  N  | 
|_____________|
       |       
       |</code></pre></td>
<td data-bgcolor="#fff0e8"> </td>
</tr>
</tbody>
</table>

<table data-summary="main text" width="100%" data-cellpadding="20" data-bgcolor="#ffffff">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td width="700" data-valign="top">The Depletion layer appears when electrons fall into holes. The p-type silicon has electrons too, but they act like the closely-packed beads of an abacus, and the "holes" are like gaps in the rows of beads. Move one bead, and a hole has moved the other way. Touch the p-type silicon against the n-type, and lone wandering electrons from the n-type silicon will fall into the holes. Also, holes in the p-type's Base region can flow out among the movable electrons from the N-type Emitter region and many swallow electrons and are cancelled. Holes eat electrons, and this leaves a thin region between N and P sections which lacks movable charges.<br />
&#10;<p>Remember: a conductor is <em>not</em> a substance which allows charges to pass. (Don't forget #3 above!) Actually a conductor is any substance which contains charges which are <em>movable.</em> Anything that lacks movable charges is an insulator. Inside the depletion layer, all the opposite charges have fallen together and vanished. The gaps in the abacus beads are gone, so no beads can move anymore. It's packed solid with immobile charges, so the silicon has turned into an insulator. When there's no voltage applied across the base/emitter terminals, this insulating layer grows fairly thick, and the transistor acts like a switch which has been turned off.<br />
</p>
<p>I like to visualize that a transistor's silicon as normally like a shiny silver conductor (sort of like metal) ...except for that insulating layer between the P and N regions which acts more like a layer of insulating glass. Silicon is like a metal which can become glass!<br />
</p></td>
<td data-bgcolor="#fff0e8"> </td>
</tr>
</tbody>
</table>

<table data-summary="main text" width="100%" data-cellpadding="20" data-bgcolor="#ffffff">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td width="30"></td>
<td width="630" data-valign="top" data-bgcolor="#ffffff"><pre><code>       |
 ______|______
|             |           \
| COLLECTOR N |           |   Shiny silver
|_____________|            &gt;  conductive        
|             |           |  
| BASE      P |--         /
|_____________|       Glasslike insulating
 _____________    &lt;--  &quot;depletion layer&quot;        
|             |      \
| EMITTER  N  |       &gt;  Shiny silver
|_____________|      /   conductive
       |             
       |</code></pre></td>
<td data-bgcolor="#fff0e8"> </td>
</tr>
</tbody>
</table>

<table data-summary="main text" width="100%" data-cellpadding="20">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td width="700" data-valign="top" data-bgcolor="#ffffff">Whenever voltage is applied between base and emitter, this insulating layer <em>changes thickness.</em> If (+)voltage is applied to the p-type (to the base wire,) while a (-) voltage polarity is applied to the n-type, (to the emitter wire,) then electrons in the n-type are pushed towards the holes in the p-type. The insulating layer becomes so thin that the clouds of electrons and holes start meeting and combining. A current therefore exists in the base/emitter circuit. But this current is not important to transistor action. What's important to notice is that the *VOLTAGE* across the base/emitter has caused the insulating Depletion Layer to become so thin that the charges can now flow across it. It's as if the transistor contains a layer of glass whose thickness can be varied when we alter a Base-Emitter voltage. The layer becomes thinner when BE voltage is increased. This happens because the voltage pushes the holes and the electrons towards each other, reducing the size of the empty insulating region between the clouds of holes and electrons, and allowing the stragglers to jump across the insulator. The depletion layer is a voltage-controlled switch which "closes" when the right polarity of voltage is applied. It is also a <em>proportional</em> switch, since a small voltage can close it only partially. For silicon material, charges first start jumping across whenever the voltage is around 0.3V. Raise the voltage to 0.7V and the current gets very high. (That's for silicon. Other materials have different turn-on voltages.) The larger the voltage, the thinner the insulating layer, so the higher the current in the entire transistor. By applying the right voltage, we can thicken or thin the depletion layer as desired, creating an open, closed, or partially open switch.<br />
&#10;<p>See what's happening here? <em>The transistor is not controlled by current.</em> Instead it is controlled by the base/emitter voltage.</p>
<blockquote>
<p>7. THE P-TYPE AND N-TYPE ARE CONDUCTORS BECAUSE THEY CONTAIN MOVABLE CHARGES.<br />
</p>
<p>8. A LAYER OF INSULATING MATERIAL APPEARS WHEREVER P-TYPE AND N-TYPE TOUCH.<br />
</p>
<p>9. THE INSULATING LAYER CAN BE MADE THIN BY APPLYING A VOLTAGE.</p>
</blockquote></td>
<td data-bgcolor="#fff0e8"> </td>
</tr>
</tbody>
</table>

<table data-summary="main text" width="100%" data-cellpadding="20">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td data-valign="top" data-bgcolor="#ffffff"><table width="100%">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr data-valign="top">
<td width="250"><pre><code>       |
 ______|______
|             |
| COLLECTOR N |
|_____________|
|             |  -----&gt;
| BASE      P |___________ 
|_____________|           |  +
|             |       ____|____ 
| EMITTER  N  |         _____
|_____________|       _________
       |                _____
       |__________________|  -
               &lt;----- </code></pre></td>
<td width="220"><pre><code>
&#10;
&#10;
</code></pre>
<code> With a small voltage applied, the depletion layer gets thin, charges start crossing it, and a small current appears. The "switch" is only partly closed!</code></td>
<td></td>
</tr>
</tbody>
</table>
<br />
&#10;<p>OK, on to <a href="http://amasci.com/amateur/transis2.html">PART TWO</a><br />
Also see: <a href="http://amasci.com/amateur/trshort.html">short version of article</a><br />
and the <a href="http://otro-geek-mas.blogspot.com/2008/08/como-funcionan-realmente-los.html">version Espanol.</a><br />
</p>
<p><br />
</p></td>
<td data-bgcolor="#fff0e8"> </td>
</tr>
</tbody>
</table>

<table data-summary="main text" width="100%" data-cellpadding="20">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td style="text-align: left;" width="18" data-summary="google ad, but more text below it" data-valign="top" data-bgcolor="#fff0e8"></td>
<td width="700" data-valign="top" data-bgcolor="#ffffff"><span id="lilienfeld"></span>
<hr />
<br />
&#10;<p><strong>PS</strong><br />
The transistor was invented around 1923, by physicist Dr. J. Edgar Lilienfeld, the father of the modern electrolytic capacitor. WHAT?!!! But everyone knows that it was invented at Bell Labs in 1947. Nope. The original transistor was a 1920s thin-film device deposited on glass. The base region was a clever idea: crack a piece of glass, put it back together with metal foil clamped in the crack, then slice off the extra foil to make a flat surface that goes: glass, metal, glass. Deposit a thin layer of semiconductor and heat the device, and the thin metal line will "dope" that part of the semiconductor layer. Simple! Dr. Lilienfeld also built MOSFETs using the natural oxide layer found on aluminum plates. He also built a working transistor radio and showed it around to various companies. It was ignored, possibly because he didn't have a solid theory to explain how his invention worked, but more probably because it was "impossible;" weird and new. Some hobbyist should try making a home-built transistor. [<em>New 2006 info: R. G. Arns says that Bret Crawford built sucessful Lilienfeld transistors in 1991 as his MS Physics Thesis. Joel Ross did it again in 1995 with more stable versions. And more amazing: William Shockley and G. L. Pearson did so in 1948, publishing in Physical Review for July 15 1948, but they concealed the fact that it was Lilienfeld's device they were demonstrating!</em>]<br />
</p>
<p>Lilienfeld's patent numbers are:</p>
<ul>
<li># <a href="http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&amp;Sect2=HITOFF&amp;d=PALL&amp;p=1&amp;u=/netahtml/srchnum.htm&amp;r=1&amp;f=G&amp;l=50&amp;s1=1,745,175.WKU.&amp;OS=PN/1,745,175&amp;RS=PN/1,745,175" rel="nofollow">1,745,175</a> Method and Apparatus for Controlling Electric Currents</li>
<li># <a href="http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&amp;Sect2=HITOFF&amp;d=PALL&amp;p=1&amp;u=/netahtml/srchnum.htm&amp;r=1&amp;f=G&amp;l=50&amp;s1=1,877,140.WKU.&amp;OS=PN/1,877,140&amp;RS=PN/1,877,140" rel="nofollow">1,877,140</a> Amplifier for Electric Current</li>
<li># <a href="http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&amp;Sect2=HITOFF&amp;d=PALL&amp;p=1&amp;u=/netahtml/srchnum.htm&amp;r=1&amp;f=G&amp;l=50&amp;s1=1,900,018.WKU.&amp;OS=PN/1,900,018&amp;RS=PN/1,900,018" rel="nofollow">1,900,018</a> Device for Controlling Electric Current</li>
</ul>
[Click on IMAGES button to view them.]<br />
These patents caused Bardeen, Brattain, and Shockley some grief, and caused the US Patent Office to disallow the Bell Labs FET patents in later years.<br />
&#10;<p>Also:</p>
<ul>
<li>RG Arns <a href="http://web.archive.org/web/20170924132029/http://ieeexplore.ieee.org/%0Adocument/730824/" rel="nofollow">"The other transistor: early history of the MOSFET." (.pdf)</a> find it in <a href="https://digital-library.theiet.org/content/journals/10.1049/esej_19980509">Engineering Science and Education Journal 7 (5): 233-240 (1988)</a></li>
<li>IEEE Spectrum: <a href="http://www.spectrum.ieee.org/semiconductors/devices/how-europe-missed-the-transistor" rel="nofollow">How Europe Missed the Transistor</a> (independantly invented "transistron")</li>
<li>T. L. Thomas, <a href="https://scholar.google.com/scholar?cites=15821916844522822929&amp;as_sdt=5,48&amp;sciodt=0,48">The Twenty Lost Years of Solid State Physics</a>, Analog (magazine) March 1965</li>
</ul>
<span id="galena"></span> PPS<br />
It is possible to make a transistor using Galena (lead sulfide, PbS). Silvery hunks of Galena are often available from rock shops and science museum stores. You can even make your own by melting sulfur and lead powder over a flame. Look up keywords such as "cat's whisker diode" and "crystal radio" to find out more.<br />
&#10;<p>The trick to making a transistor is to use a hyper-clean, freshly-cleaved crystal face, to sharpen your cat's-whisker contacts by dissolving the tips using electrolysis, and then to put the tips within 0.05mm of each other (or preferably within 0.01mm). Obviously the latter is the hardest part. Better use a microscope! The authors of the following article found that the base/emitter junction was critical: it HAD to act as a good rectifier. The base/collector junction wasn't as important. They got some power gain, but their beta was in the single digits. <a href="http://ourworld.compuserve.com/homepages/Andrew_Wylie/homemade.HTM" rel="nofollow">Others</a> have mentioned that if you break open a 1N34 glass diode to expose the Germanium chip, you can make a crude transistor with a similar procedure. Old Germanium audio power transistors probably do the same, while giving much larger semiconductor area on which to play.</p>
<blockquote>
Crystal Triode Action in Lead Sulphide, P. C. Banbury, H.A. Gebbie, C. A. Hogarth, pp78-86. SEMI-CONDUCTING MATERIALS, Conference proceedings, H.K. Henisch (ed), 1951 Butterworth's scientific publications LTD 1951.
</blockquote>
<hr />
<br />
&#10;<table data-summary="two columns, links to page two" width="100%">
<tbody>
<tr>
<td><strong><a href="http://amasci.com/amateur/transis2.html">How Transistors REALLY Work, Part II</a></strong></td>
<td style="text-align: right;"><a href="http://amasci.com/amateur/trshort.html">Short vers.</a></td>
</tr>
</tbody>
</table></td>
<td data-bgcolor="#fff0e8"> </td>
</tr>
</tbody>
</table>

<table data-summary="links collection" width="100%">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr data-valign="top">
<td width="800" data-bgcolor="#fff0e8"><br />
&#10;<p><span id="links"></span></p>
<h2 id="links-to-other-websites">LINKS TO OTHER WEBSITES</h2>
<ul>
<li><a href="http://www.achase.com/win/elec/index.html" rel="nofollow">AOA author Win Hill</a> on CR4 forum explains voltage-controlled BJTs <a href="http://cr4.globalspec.com/comment/720033/Re-Voltage-vs-Current" rel="nofollow">here</a> and<br />
<a href="http://cr4.globalspec.com/comment/720374/Re-Voltage-vs-Current" rel="nofollow">here</a>. Also see the <a href="http://books.google.com/books?id=bkOMDgwFA28C&amp;printsec=frontcover#v=onepage&amp;q&amp;f=false" rel="nofollow">volt-controlled BJT chapter of "The Art of Electronics"</a></li>
<li><a href="http://www.flickr.com/photos/jeriellsworth/2835459827/">Jeri Ellsworth</a>'s home made mosfets, photocells, ICs, and <a href="http://www.youtube.com/user/jeriellsworth#g/u" rel="nofollow">Youtube vids</a></li>
<li><a href="http://web.archive.org/web/20100218025454/http://www.porticus.org/bell/belllabs_transistor1.html" rel="nofollow">Who really invented the transistor?</a></li>
<li><a href="http://www.sparkbangbuzz.com/els/iposc-el.htm" rel="nofollow">Homemade Catswhisker Oscillators</a> and <a href="http://www.a-reny.com/iexplorer/cristadyne.html" rel="nofollow">transmitters</a> to go with your crystal radio</li>
<li><a href="http://web.archive.org/web/20060301093157/chem.ch.huji.ac.il/~eugeniik/history/lilienfeld.htm" rel="nofollow">Jules Edgar Lilienfeld</a>, patent photos, etc.</li>
<li><a href="http://web.archive.org/web/20170924132029/http://ieeexplore.ieee.org/document/730824/" rel="nofollow">The Other Transistor</a>, 1930s Lilienfeld transistor, Bell Labs rewriting history</li>
<li>Home-built transistors
<ul>
<li><a href="http://sparkbangbuzz.com/cds-fet/cds-fet.htm" rel="nofollow">Nyle S. FET from CdS photocell</a></li>
<li><a href="http://www.douglas-self.com/ampins/wwarchive/wwarchive.htm#home" rel="nofollow">Home-made Transistors</a> 1954 P Helsdon EWW</li>
<li><a href="https://www.1010.co.uk/org/dissolutions.html#sec-4-1" rel="nofollow">R. Baker's home-made FET</a> and <a href="http://1010.co.uk/materials.html">text</a> The Amateur Scientist, June 1970</li>
<li><a href="http://www.americanradiohistory.com/%0AArchive-Radio-Craft/1940s/Radio-Craft-RE-1949-May.pdf" rel="nofollow">Turner 1949 transistor</a>, p38 Radio Craft (pdf)</li>
<li><a href="https://www.youtube.com/watch?v=vmotkjMSKnI" rel="nofollow">Make a point-contact transistor</a> vid Jeri Ellsworth</li>
<li><a href="http://www.hpfriedrichs.com/mybooks/ioa/bks-ioa-gallery2.htm" rel="nofollow">Photo Gallery</a>, scratch-built tubes, transistors HP Friedrichs</li>
<li><a href="http://www.andaquartergetsyoucoffee.com/wp/?page_id=130" rel="nofollow">Thinfilm ZnO transistor</a></li>
<li><a href="http://groups.yahoo.com/group/home_transistor/" rel="nofollow">Forum: Home_Transistor</a></li>
</ul></li>
<li><a href="http://www.faqs.org/docs/electric/Semi/SEMI_4.html" rel="nofollow">faqs.org: Lessons in Electric Circuits: transistor</a></li>
<li><a href="http://www.transistormuseum.com" rel="nofollow">The Transistor Museum</a></li>
<li><a href="http://www.ck722museum.com/" rel="nofollow">CK722</a>, the first hobbyist transistor</li>
<li><a href="http://earlyradiohistory.us/1924sens.htm" rel="nofollow">Crystals will replace tubes</a> Hugo Gernsback 1924</li>
<li><a href="http://web.archive.org/web/20050701000000*/http://www.mindspring.com/~pfriedr/archives/xsist23.pdf" rel="nofollow">Two-whisker catswhisker radio</a>, 1920s transistor? (.PDF), from <a href="http://web.archive.org/web/20050701000000*/http://www.mindspring.com/~pfriedr/books/ioa/gallery/gallery.htm" rel="nofollow">IOA</a></li>
<li><a href="http://www.jmargolin.com/history/trans.htm" rel="nofollow">Road to the Transistor</a> (and homemade LED)</li>
<li><a href="http://www.satcure-focus.com/tutor/page4.htm" rel="nofollow">How transistors work, fluid analog</a></li>
<li><a href="http://web.archive.org/web/20070601000000*/http://ourworld.compuserve.com/homepages/Andrew_Wylie/homemade.HTM" rel="nofollow">Home made transistor</a> and <a href="http://web.archive.org/web/20070601000000*/http://ourworld.compuserve.com/homepages/Andrew_Wylie/gallery.htm" rel="nofollow">history gallery</a></li>
<li><a href="http://www.cs.wisc.edu/~kovar/hall.html" rel="nofollow">ElectronicBand Structure of Germanium, MY ASS!</a></li>
<li><a href="http://scitoys.com/scitoys/scitoys/echem/echem2.html#solarcell" rel="nofollow">Homebrew solar cell (copper oxide)</a></li>
<li><a href="http://web.archive.org/web/20020611043459/http://www.acmi.net.au/AIC/PICKARD_BIO.html" rel="nofollow">GW Pickard, inventor of 1st semiconductor device</a></li>
<li><a href="http://www.mindspring.com/~pfriedr/ioa.htm" rel="nofollow">Instr. of Amplification</a> (home-build tubes and transistors)</li>
<li><a href="https://spectrum.ieee.org/tech-history/silicon-revolution/the-irresistible-transistor" rel="nofollow">IEEE Spectrum: early hobbyist transistors</a></li>
<li><a href="http://courses.ncsu.edu:8020/ece480/common/htdocs/" rel="nofollow">Explanation at NCSU</a> (circuits, not transistor physics)</li>
<li>Started my transis article <a href="%0Ahttps://groups.google.com/forum/#!topic/sci.electronics/JNL1vwpEvAI">as Newsgroup comment</a> June 1995 sci.electronics</li>
</ul>
<br />
&#10;<h2 id="other-pages-here">OTHER PAGES HERE</h2>
<ul>
<li><a href="http://amasci.com/amateur/transis2.html">How Transistors REALLY work, PART II</a></li>
<li><a href="http://amasci.com/emotor/cap1.html">How capacitors REALLY work</a></li>
<li><a href="http://amasci.com/amateur/elecdir.html">The REAL direction of the electric current</a></li>
<li><a href="http://amasci.com/tesla/spark.html">How lightning REALLY works</a></li>
<li><a href="http://amasci.com/elect/elefaq.html">How electricity REALLY works</a></li>
<li><a href="http://amasci.com/ele-edu.html">Big electricity articles list</a></li>
<li><a href="http://amasci.com/unew.html">Good stuff</a></li>
<li><a href="http://amasci.com/news.html">New stuff</a></li>
</ul></td>
<td data-bgcolor="#fff0e8"> </td>
</tr>
</tbody>
</table>

<http://amasci.com/amateur/transis.html>\
[Electrica Technology Inc.](https://electricatechnology.com) and [Linkedin](https://www.linkedin.com/company/65628333/)\
Created and maintained by [Bill Beaty](http://amasci.com/billb.html). Mail me at: [<img src="http://amasci.com/graphics/abcg.gif" data-border="0" width="141" height="19" />](http://amasci.com/amfrm/).\

<div class="statcounter">

<a href="http://statcounter.com/shopify/" target="_blank" title="shopify stats"><img src="http://c.statcounter.com/10408414/0/00267183/0/" class="statcounter" alt="shopify stats" /></a>

</div>

[View My Stats](http://statcounter.com/p10408414/?guest=1)
