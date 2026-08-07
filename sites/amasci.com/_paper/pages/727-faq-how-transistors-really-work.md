---
title: "FAQ: how transistors really work"
source_domain: amasci.com
source_path: amateur/trnsisFAQ.html
order: 727
reachable_from_entry: false
images: 2
internal_links: 13
extracted: 2026-08-07T17:06:21Z
extractor: site_to_paper.py (pandoc)
---

# FAQ: how transistors really work

*Source page: `amateur/trnsisFAQ.html`*

<table data-summary="nav links, google search window" width="100%">
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
<td><a href="http://amasci.com/amateur/transis.html">TRANSISTOR</a>  |<br />
</td>
<td><a href="http://amasci.com/ele-edu.html">ELECTRICITY ARTICLES</a>  |<br />
</td>
<td><strong><a href="http://amasci.com/" rel="nofollow">TOP</a></strong></td>
<td><strong><a href="http://amasci.com/unew.html">GOOD STUFF</a>  |</strong><br />
</td>
<td><strong><a href="http://amasci.com/news.html">NEW STUFF</a>  |</strong><br />
</td>
<td><strong><a href="http://amasci.com/search.html">SEARCH</a></strong><br />
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

\
**[ELECTRONIC](http://amasci.com/surplus/surpcats.html)\
[SURPLUS](http://amasci.com/surplus/surpcats.html)\
[CATALOGS](http://amasci.com/surplus/surpcats.html)\
The Big List**

------------------------------------------------------------------------

\

How Transistors Really Work\
FREQUENTLY-ASKED QUESTIONS
============================

------------------------------------------------------------------------

Q: OK, then how do diodes REALLY work? And FETs? And for that matter, Resistors and Inductors and Batteries?\

A: I have about three lifetimes of backlog articles to write! I know... I need to die, and then twenty years later someone will go through my vast piles of paper and start compiling it into books.\

------------------------------------------------------------------------

Q: Why is your article so weird? It must be wrong, since it's very different than textbooks.\

A: If you don't know my goals and techniques I used in writing this article, you might come away with a totally wrong impression:

- The article is absolutely NOT for science and engineering students. The article will be aimed at the general public (i.e. 5th grade conceptual level.) As with most of my writing, my goal is "teaching physics to your grandmother."

<!-- -->

- My intent is not teaching, it's "UNteaching." There are plenty of articles about transistor basics. Rather than writing yet another one, instead I want to build a time machine to communicate with the distant past. I want to send messages to myself, back when I was a student. With the benefits of future hindsight I can discover all the things which blocked my progress back then. Then I can send a message to my past self about how to avoid all the problems, and turn myself into Ultra-Genius-Student. No time machine? Rats. I guess I'll just have to write articles to pass all my learning-tricks to the students of today. I suspect that they'll be suffering from many of the same learning-barriers that I did, so my information will free up their progress too.

<!-- -->

- All the common electrical misconceptions listed [here](http://amasci.com/miscon/elect.html) and [here](http://amasci.com/miscon/whyhard1.html) will be carefully avoided. Since these misconceptions are extremely widespread in textbooks, their removal will make for some odd writing. For example, rather than teaching that current flows in wires and that batteries are sources of electric current, I'll explain that a metal circuit is full of movable electricity, and that batteries are electricity-pumps. This reinforces the idea that Electric Current is not a substance, and that batteries are not "sources" of any such substance. When we realize that the charges which flow during an electric current are supplied by the conductors, then we can almost \*see\* how electric circuits work.

<!-- -->

- The article will employ no mathematics whatsoever (well, maybe I'll use some generalized proportional reasoning!) When writing for the public, equations are totally forbidden. Including any math will make about as much sense as including any Latin or Japanese.

<!-- -->

- Jargon and terminology-shortcuts will be unpacked as much as possible. Complicated terms will be replaced by their own definitions. For example, I'll go through the article and delete any mention of "electric current," replacing it with the phrase "charge-flow" or perhaps "flows of electricity."

------------------------------------------------------------------------

Q: Transistors are CURRENT CONTROLLED DEVICES! Anyone who says DIFFERENTLY is a DISGUSTING LIAR!!!\

OK OK, you're right, transistors really are current controlled devices! (And I back away slowly, feeling around for a heavy object in case I have to defend myself if your violent response turns physical.)\

:)\
\
Viewing the transistor as a current-controlled device is incredibly useful. Doing so lets us understand how circuits function. And it's the central technique for amplifier design. If engineers couldn't use the hfe current-gain equation, they'd be screwed. But it's really just a useful fiction, like pretending that atoms are tiny solar systems. If we want to understand how the guts of the transistor works, we have to abandon the "current controlled" idea. Make no mistake... as long as we stay outside the transistor package, we can ignore this whole issue. From outside, a transistor is a current controlled device. But that won't help us understand how the insides work.\

From HOROWITZ AND HILL P65\
\

This whole problem only crops up when we delve into the interacting semiconductor junctions. I myself went through this painful learning process when I finally "saw" what transistors really are (and it truely is painful to discover that your most solid beliefs, at their core, are wrong.) The central problem is this:

> **There is no mechanism which allows the Base current to directly affect the Collector current.**

When trying to understand transistors, I'd always searched for the special thing which lets Ib control Ic.\

I never found it.\

I finally learned that it doesn't exist. Transistors aren't current amplifiers!\

And that was the moment when I experienced the big "AHA," and I finally understood how the inside of transistors work. The scales fell from my eyes. Next I wanted to help everyone else get past the same barrier which stopped my own progress. What were the "scales" on my eyes? Simple: it was my belief that Ib controls Ic, and that transistors are current amplifiers. Once I dropped this belief, I was no longer blind.\

Or in other words, I finally could "hear" what the advanced textbooks were saying all along: a transistor's internal functioning is described by the well-known Ebers-Moll equation. Ebers-Moll only exists because the electrostatic field created by Vbe determines the depletion layer width which then determines Ic. Even deeper is Gummel-Poon, which points out that the charge stored on the sides of the depletion zone is controlling the thickness of the depletion zone, and we adjust the charge to adjust the Vbe voltage. Of course we can always ignore all this and use Ib to force Vbe to take on a certain value. That lets us give Ib \*INDIRECT\* control of Ic. Then we can ignore Vbe and the guts of the transistor, and pretend that Ib controls Ic. But this "pretending" sometimes seems to increase into deep psychological Denial, where people on forums angrily rant against anyone who dares suggest that Vbe and the Ebers-Moll equation is crucial to understanding the internal functioning of the BJT.\

Speaking of eyes... there's a famous fight scene in the movie "THEY LIVE," where the main character is trying to force another man to put on the special sunglasses which lets humans see the hidden alien messages on all the billboards. JUST PUT ON THE GLASSES!! The scene is famous for being the longest grueling fight in any movie. And it's all about a fight to avoid clear vision and preserve cherished misconceptions. Sounds about right.\

------------------------------------------------------------------------

Q: I KNOW WHAT YOU'RE TRYING TO DO. YOU'RE REALLY JUST A NITPICKER, AND YOU'RE TRYING TO CONFUSE EVERYONE.\

Please see the following article I wrote in response to a similar comment on my other 'misconception' pages:

> AM I JUST A PEDANTIC SCIENCE-NITPICKER?\
> [/miscon/nitpik.html](http://amasci.com/miscon/nitpik.html)

I receive huge amounts of email about this and other Electricity articles. Most of them claim that my articles have removed their long-standing confusion. But I've found that a certain tiny minority of people simply ***HATES*** my explanations. Since their email forms only a few percent of the messages I've received, I don't take them very seriously. I suspect that most of them are the folks who've spent years learning physics/electronics in the usual way, and are angry that anyone would dare to find fault with it. But if I want to go back and help newcomers get past the stumbling blocks that slowed me down, then I damn well am going to search out and destroy all those errors which harmed my early understanding. Who do I think I am, to be questioning the contents of widely used textbooks?!!! (I'm nobody. Remember, it's the little kid who points out the flaws in the Emperor, while all the more sensible people are busy denying the problems.)\

 

|     |
|:---:|
|     |

<http://amasci.com/amateur/trnsisFAQ.html>\
Created and maintained by [Bill Beaty](http://amasci.com/billb.html). Mail me at: [<img src="http://amasci.com/graphics/abcg.gif" data-border="0" width="141" height="19" />](http://amasci.com/amfrm/).\

<div class="statcounter">

<a href="http://statcounter.com/shopify/" target="_blank" title="shopify stats"><img src="http://c.statcounter.com/10408414/0/00267183/0/" class="statcounter" alt="shopify stats" /></a>

</div>

[View My Stats](http://statcounter.com/p10408414/?guest=1)
