---
title: "Director I HW#3: Shockwave Portfolio"
source_domain: amasci.com
source_path: ~turnip/lwtc/assg/Director_HW3.htm
order: 8973
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T06:01:29Z
extractor: site_to_paper.py (pandoc)
---

# Director I HW#3: Shockwave Portfolio

*Source page: `~turnip/lwtc/assg/Director_HW3.htm`*

**MMDP 125 "Director I"\
Homework 3: "A Shockwave Portfolio"**

**Due: TBA\
Project size limit: 250kb<sup>\*</sup>\
Value: 30 points**

**[Samples](samples/portfolios/hw3samples.htm)**

**[Skills](../skills/hw3/)**

**Overview:** You will create a Shockwave portfolio to show a series of *still images*, like a slideshow, as if you were showing off some of your graphics work to a prospective client or employer. These images may be digital art, photographs, or anything you can display on the Director stage. Show off your best Photoshop or Illustrator work! The number of images is up to you (minimum 3), but remember: it all has to come in at under 250k!

Alternatives:

- Your slideshow doesn't have to be a portfolio; you may, for example, make it a personal photo album if you wish. I really don't care what the content is as long as it functions as described in this spec!
- Instead of still images, you may showcase Flash movies (SWFs)! See Persidsky pp. 123-127 for more info on using Flash movies in Director (**important**: Director 8.5 doesn't understand Flash MX movies; you'll have to export as Flash 5). Don't forget the 250k limit!

**Structure & Interactivity:** Your portfolio should begin with an "attraction" loop, which must include: Some kind of animation *and some appropriate background music*, and some text explaining to the user what they are going to see. The loop should entice the user to click an Enter button, which begins the presentation. *The attraction loop must keep looping until the user clicks the Enter button!*

When the user clicks Enter, they are taken to the first image. The user should then be able to page through the images using Next & Back buttons which you provide, viewing them at his or her own pace (your movie should *not* advance automatically!) If you wish, you may use transitions. Every image should be accompanied by a paragraph of descriptive text; give each image a title, and explain how you created it (just make something up if you didn't actually make the picture!)

While viewing images, the following controls *must* be available to the user:

- one button to display the *next* image (when available);
- one button to display the *previous* image (when available);
- one button to *exit* the presentation.

Note: The Next & Back buttons are for moving *between slides only!* For clarity of navigation, do *not* allow them to exit the slides. In other words, do *not* allow the user to go *back* from the first slide to the attraction loop, and do *not* allow them to go *forward* from the last image to the closing screen; the Exit button should be the *only* way of getting out.

The Exit button should take the user to a closing screen. This closing screen should contain:

- some text (you can thank the user for visiting, or display your resume or contact information);
- a Start Over button that takes the user back to the beginning (attraction loop, not the first image);
- a web link to a related page (or email)
- optionally: images, animation, sound.
- **Bonus point:** Make the presentation restart (go back to the attraction loop) automatically if your portfolio sits idle for 10 seconds at the Close screen.

**Your buttons:** To add more interactivity to your portfolio:

- Do NOT use Director's built-in buttons; create your own art!
- Your buttons must react visibly to the mouse; that is, they should change their appearances when the user rolls over and/or clicks them.
- Your buttons must make a sound when clicked (not a system "beep"; use an imported sound).

**Delivery:** When your portfolio is ready to turn in, you must publish ("shock") your movie - that is, create a Shockwave "dcr" file *and* an HTML page to host it. *These 2 files are what you will turn in & what you will be graded on!* Also, please provide me with your original Director file; this will not affect your grade, but might allow me to identify any bugs or steal your ideas—I mean, to make suggestions. **NOTE**: I do *not* want your media files!

<sup>\*</sup> A word about file size (specifically, how it effects your grade): I take off 1 point for every 50k (or fraction) that your file is over, up to a maximum of 5 points. For example, if your file is 325k, I'll take off 2 points. *I will not accept any homework over 500K!!!* The file-size limit applies to the dcr file *only*; don't worry about the html or the .dir file.

**HTML:** Don't settle for Director's simple HTML - dress it up! Some common/suggested changes:

- Change the HTML document's properties; give it a title, change the background color (if desired), etc.
- Add text; perhaps a headline.
- Alter the dcr's alignment; for example center the piece by surrounding the \<object\> tag with \<center\> tags, or place the entire \<object\> tag in a table!

*Remember,* once you've made changes to the HTML doc, **don't** let Director overwrite it the next time you publish or you'll lose your work! Just press Cancel when Director asks if you want to replace it.

\*\* GUIDELINES FOR SUBMITTING HOMEWORK ASSIGNMENTS \*\*

Please submit your homework file, on or before the due date, in one of the following ways:

- **Create a folder & name it using your own name** (e.g., "Rob_Portfolio"), and place all files to be submitted - dcr & html, plus the dir file - into it. Then upload this folder to the Director Drop Box on BigMac.
- Email it to <turnip@eskimo.com> (dcr & html *only*, zipped or stuffed please).
- Post it to your personal web page & send me the URL!

[**Back**](javascript:history.back())
