---
title: "How to use Rob's 'Button Behavior' to make a responsive button"
source_domain: amasci.com
source_path: ~turnip/lwtc/skills/hw3/hw3-makeabutton.htm
order: 9171
reachable_from_entry: false
images: 4
internal_links: 0
extracted: 2026-08-07T17:17:10Z
extractor: site_to_paper.py (pandoc)
---

# How to use Rob's "Button Behavior" to make a responsive button

*Source page: `~turnip/lwtc/skills/hw3/hw3-makeabutton.htm`*

### Homework \#3 - Making a button

Follow these steps to use the "3-state button behavior" to make a button that reacts to the mouse.

- Start with your working movie open.

- Open "RobsBehaviors" cast (using <span class="MenuSteps">File:Open</span>; do *not* import the cast into your movie!!)

- Drag the behavior "3-State button behavior" *from* "RobsBehaviors" *into* your movie's internal cast. ***Do not allow the "RobsBehaviors" cast to link to your current movie!***

  *<img src="hw3-makeabutton1.gif" width="409" height="271" />*

- Close "RobsBehaviors"; you won't need it again.

- In your movie's internal cast, create (or import) three cast members for your button: the default (normal) state, the rollover state, and the clicked (mouseDown) state. *These three cast members must live next to each other in the cast, in order.* (Hint: for best results, the 3 cast members should be the same size).

  <img src="hw3-makeabutton2.gif" width="388" height="133" />

- Drag the "default" member onto the stage to create a sprite (do not place the other 2 members onstage).

  <img src="hw3-makeabutton3.gif" width="531" height="226" />

- Drag "3-State button behavior" from the cast *onto* the button sprite.

  <img src="hw3-makeabutton4.gif" width="543" height="228" />\
  (Note: You can drag the behavior onto the sprite on the stage *or* in the score; either does the same thing.

- Run your movie & test!

That's it! To add functionality to your button, create new behavior(s) & attach to the sprite.

**Need another button?** Just repeat from step \#2.

[Back](javascript:history.back())
