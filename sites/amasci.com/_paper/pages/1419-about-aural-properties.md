---
title: "About Aural Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/aural.htm
order: 1419
reachable_from_entry: false
images: 0
internal_links: 19
extracted: 2026-08-07T05:55:09Z
extractor: site_to_paper.py (pandoc)
---

# About Aural Properties

*Source page: `~bloo/indexdot/css/properties/aural.htm`*

\

<span class="pagetitle">About Aural Properties</span>\
= <span class="sitetitle">Index DOT Css</span> by [Brian Wilson](../../misc/email.htm) =
========================================================================================

<div align="center">

|  |
|----|
|   [Main Index](../index.html) \| [Property Index](../propindex/font.htm) \| [CSS Support History](../supportkey/syntax.htm) \| [Browser History](../../history/browsers.htm)   |

</div>

\
\

**Aural Properties**  
[volume](aural/volume.htm) \| [stress](aural/stress.htm) \| [richness](aural/richness.htm) \| [azimuth](aural/azimuth.htm) \| [elevation](aural/elevation.htm)\
[voice-family](aural/voicefam.htm) \| [speak](aural/speak.htm) \| [speak-punctuation](aural/speakpunc.htm) \| [speak-numeral](aural/speaknum.htm)\
[pitch](aural/pitch.htm) \| [pitch-range](aural/pitchrange.htm) \| [speech-rate](aural/speakrate.htm) \| [play-during](aural/playdur.htm)\
[pause](aural/pause.htm) \| [pause-before](aural/pausebef.htm) \| [pause-after](aural/pauseaft.htm)\
[cue](aural/cue.htm) \| [cue-before](aural/cuebef.htm) \| [cue-after](aural/cueaft.htm)

\

**What Do They Do?**  
The rendering of document content using speech synthesis and sound effects is fundamentally different from content rendered for visual consumption. There is no concept of font size, intrinsic visual size to an element or even a visual canvas where elements may exist in relation to one another.\
\
Crude aural rendering of document content is currently possible through serialization of text content by screen readers. Stripping down content to this level loses most of a document's structure, and ignores many document components outright. The Aural CSS properties introduce the concept of an aural canvas, where elements are rendered over time, with positioning properties existing in a three-dimensional soundstage around the user, and white-space interpreted as silence. Styling and emphasis are applied to an element through the use of volume, pitch, vocal stress and "auditory icons", which cue the listener to content that is intended to stand apart from other content.\
\
While these properties *can* augment visual rendering, it is only the tip of an iceberg - there will be cases where documents can *only* be rendered aurally. In these cases, the power allowed by these properties becomes obvious. These properties allow powerful interfaces to information for a wide range of needs: easier accessibility for special visual needs and impairments, educational teaching tools and reading aids, as well as 'hands-off' information access (eg: retrieving directions while driving a car.) The market for this sort of rendered content is expected to grow considerably in the future.\
\
These properties were incorporated into CSS2, but were first detailed in the W3C note "Aural presentation with CSS style sheets" (<http://www.w3.org/Style/CSS/Speech/NOTE-ACSS>, January 7, 1997) edited by Chris Lilley. The properties and aural canvas of ACSS detailed in this note were mainly adapted from proposals by T.V. Raman of Adobe.

<!-- -->

**Related Sites**\
**Official Reference: CSS Level 2, Section 19**  
19.2: '[volume](http://www.w3.org/TR/REC-CSS2/aural.html#volume-props)'\
19.8: '[stress](http://www.w3.org/TR/REC-CSS2/aural.html#voice-char-props)'\
19.8: '[richness](http://www.w3.org/TR/REC-CSS2/aural.html#voice-char-props)'\
19.7: '[azimuth](http://www.w3.org/TR/REC-CSS2/aural.html#spatial-props)'\
19.7: '[elevation](http://www.w3.org/TR/REC-CSS2/aural.html#spatial-props)'\
19.8: '[voice-family](http://www.w3.org/TR/REC-CSS2/aural.html#voice-char-props)'\
19.3: '[speak](http://www.w3.org/TR/REC-CSS2/aural.html#speaking-props)'\
19.9: '[speak-punctuation](http://www.w3.org/TR/REC-CSS2/aural.html#speech-props)'\
19.9: '[speak-numeral](http://www.w3.org/TR/REC-CSS2/aural.html#speech-props)'\
19.8: '[pitch](http://www.w3.org/TR/REC-CSS2/aural.html#voice-char-props)'\
19.8: '[pitch-range](http://www.w3.org/TR/REC-CSS2/aural.html#voice-char-props)'\
19.8: '[speech-rate](http://www.w3.org/TR/REC-CSS2/aural.html#voice-char-props)'\
19.6: '[play-during](http://www.w3.org/TR/REC-CSS2/aural.html#mixing-props)'\
19.4: '[pause](http://www.w3.org/TR/REC-CSS2/aural.html#pause-props)'\
19.4: '[pause-before](http://www.w3.org/TR/REC-CSS2/aural.html#pause-props)'\
19.4: '[pause-after](http://www.w3.org/TR/REC-CSS2/aural.html#pause-props)'\
19.5: '[cue](http://www.w3.org/TR/REC-CSS2/aural.html#cue-props)'\
19.5: '[cue-before](http://www.w3.org/TR/REC-CSS2/aural.html#cue-props)'\
19.5: '[cue-after](http://www.w3.org/TR/REC-CSS2/aural.html#cue-props)'\

\
\
[Boring Copyright Stuff....](../../misc/copyright.htm)\
