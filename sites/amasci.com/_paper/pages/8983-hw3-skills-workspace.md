---
title: "HW3 skills - workspace"
source_domain: amasci.com
source_path: ~turnip/lwtc/skills/hw3/hw3-prepforshockwave.htm
order: 8983
reachable_from_entry: false
images: 3
internal_links: 0
extracted: 2026-08-07T06:01:29Z
extractor: site_to_paper.py (pandoc)
---

# HW3 skills - workspace

*Source page: `~turnip/lwtc/skills/hw3/hw3-prepforshockwave.htm`*

### Homework \#3 - Preparing a new Director file for Shockwave

Once you've set up your workspace, it's time to create a new Director file & optimize its default settings for Shockwave.

- In Director, open a new file (<span class="MenuSteps">File:New:Movie</span>).
- In the Property Inspector, click on the Movie tab (if the tab isn't visible, click on the stage).
- Set the movie's default palette to Web216.
- Choose a stage size; remember to keep it small to be sure that it will fit in your end user's browser window. Having a small stage also means that your images can be smaller, which will help keep the file's size down. I recommend a stage size of 640x480 or smaller.
- Save the movie into your working directory (if you haven't already set up a workspace for your project, [do that now](hw3-workspace.htm)).
- Go to <span class="MenuSteps">File:Publish Settings ...</span>
- In the Formats tab, set the following:
  - Enter names for the HTML & Shockwave files (so that Director won't choose these names for you); use lower-case characters only, no punctuation marks other than hyphens (-) and underscores (\_), and no spaces. You can change these names later if you like.\
    <img src="hw3-prepforshockwave1.gif" data-vspace="5" width="457" height="308" />\
    NOTE: After publishing, you should *never* rename your Shockwave file; if you do, the HTML page won't be able to find it! On the other hand, it is okay to rename your HTML file if necessary.\
    \
  - Next, we want to tell Director where to save these files when you publish. Click the "..." buttons; navigate to the "Published" folder & click the button that says "Folder 'Published'" (on a PC, the path to the folder will appear next to a button that says "Select Folder"). Remember to do this twice, once each for the HTML and the Shockwave files. (NOTE: Be sure to save your Director your Director file first; otherwise, you'll see an absolute path, which we don't want.)\
    <img src="hw3-prepforshockwave2.gif" data-vspace="5" width="382" height="253" />\
- Click the Compression tab; set the movie's Image Compression to "JPEG", and pick a quality setting; just to pull a number out of a hat, try 60 (you can adjust it later if necessary). For audio, make sure the "Compression Enabled" checkbox is checked, and try 32 kBits/second.\
  <img src="hw3-prepforshockwave3.gif" data-vspace="5" width="457" height="308" />

That's it! You are now ready to start building your project!

[Back](javascript:history.back())
