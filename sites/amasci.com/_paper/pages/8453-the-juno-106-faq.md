---
title: "The Juno-106 FAQ"
source_domain: amasci.com
source_path: ~syzygy/juno106faq.html
order: 8453
reachable_from_entry: false
images: 1
internal_links: 1
extracted: 2026-08-07T06:00:54Z
extractor: site_to_paper.py (pandoc)
---

# The Juno-106 FAQ

*Source page: `~syzygy/juno106faq.html`*

# The Juno-106 FAQ

Last updated June 28, 1998.

This document will attempt to answer frequently asked questions related to the Juno-106, a synthesizer introduced by Roland in 1984. Questions, comments, corrections, or ideas for additions to this FAQ can be mailed to Chad Beeder at <syzygy@eskimo.com>.

## Contents:

1.  [What is the Juno-106?](#q1)
2.  [How can I order a manual or replacement parts for my Juno?](#q2)
3.  [How does the Juno-106 differ from other models in the Juno series?](#q3)
4.  [What is the going rate for a used Juno-106?](#q4)
5.  [What are some common problems that occur with the Juno-106?](#q5)
6.  [Can the Juno-106 send and receive real-time MIDI sysex information?](#q6)
7.  [Where can I get information on the Juno-106's MIDI implementation?](#q7)
8.  [Where can I find patch editing/librarian software for the Juno-106?](#q8)

------------------------------------------------------------------------

<span id="q1"></span>

### What is the Juno-106?

The Juno-106 is a programmable polyphonic analog synthesizer released by [Roland](http://www.rolandcorp.com/) in 1984. It has a 61-key keyboard, 6 voices, and a fairly extensive MIDI implementation. For more information, check out the [Juno-106 Home Page](http://www.eskimo.com/~syzygy/juno106.html).

------------------------------------------------------------------------

<span id="q2"></span>

### How can I order a manual or replacement parts for my Juno?

Manuals and replacement parts can be ordered from Roland:

         Roland Corporation
         7200 Dominion Circle
         Los Angeles, CA 90040
         Phone: (213) 685-5141  Fax: (213) 726-8865

------------------------------------------------------------------------

<span id="q3"></span>

### How does the Juno-106 differ from other models in the Juno series?

A brief history of Junos:

The first Juno to be introduced was the Juno-6, which was released in 1982 and has a very similar architecture to the 106. Its main limitation is the lack of patch memory, which makes it impossible to save patches created on it. The Juno-6 had no external control inputs or outputs except for a VCF control input for sweeping the filter cutoff.

Next came the Juno-60, which added support for storage and retrieval of up to 56 patches via battery-backed memory. These stored patches could also be saved to audio tape. The Juno-60 had the Roland DCB interface, a proprietary interface developed by Roland before the advent of MIDI.

The Juno-106 added a fairly extensive MIDI implementation in place of the DCB interface, and upgraded the available patch storage memory to 128 patches. It did, however, lose the arpeggiator that had been a feature of the 6 and 60. Many people say that the 106 is "thinner sounding" than the first two models, although there is no doubt that it is still certainly capable of generating warm, fat, analog sounds.

There is also a Roland synth called the HS-60 that is nearly identical to the Juno-106 except that it has two built-in 5" speakers and a 16 watt amplifier. The HS-60 was marketed more toward the home user, while the Junos were primarily targeted at the professional market. The HS-60 is also known as the Juno-106S.

Later models were the Alpha Juno 1 and 2, which expanded on the architecture a bit from the earlier models, and provided a more extensive MIDI implementation. They also replaced the convenient rows of sliders with a small alphanumeric display, a number of buttons, and an "alpha dial." The general consensus is that the Alpha Junos sound a little more "digital" and "cold" than the earlier Junos, although they are a little more modern in design and features. The Alpha Juno 2 has a larger keyboard than the 1 (61 keys and 49 keys, respectively), and also implements velocity sensitivity and aftertouch on the keyboard. Both of the Alpha Junos can respond to velocity via MIDI, however. Velocity sensitivity is not a feature of any earlier Junos.

------------------------------------------------------------------------

<span id="q4"></span>

### What is the going rate for a used Juno-106?

Junos have had a recent surge in popularity, and prices seem to have gone up a little, but they still should be available at reasonable prices. I bought my Juno-106 in late 1994 for \$375. A good source for price information is Neil Bradley's [Used Gear Price List](http://www.synthcom.com/usedlist.html), which compiles asking prices from recent for-sale postings on Usenet.

------------------------------------------------------------------------

<span id="q5"></span>

### What are some common problems that occur with the Juno-106?

As analog synths go, the Juno-106 is very reliable, but as with any machine, problems sometimes do happen. The most common problem seems to be having one of the six voices go out. This will be characterized by the Juno skipping every sixth note played when in the normal polyphonic mode (poly 1). This is most often caused by one of the custom Roland ICs failing, either one of the "wave generator" chips or one of the combination VCF/VCA chips.

According to Kevin Lightner of [www.synthfool.com](http://www.synthfool.com), the most common failure is with the VCF/VCA (80017A) chips. There are six of these in the Juno, one for each voice. However, the three wave generator chips (MC5534A) may fail too, and in fact this was my experience with my Juno. (Each wave generator chip controls two voices.)

Please note that replacing these chips involves a good deal of patience and considerable skill with a soldering iron. If you don't feel comfortable poking around a circuit board and desoldering chips, don't attempt to fix this on your own.

You can find out which voice has the problem by putting the Juno into test mode. Hold down the Key Transpose button while turning on the power. Then press both the Poly I and Poly II buttons at the same time. Now hit a key repeatedly. The Juno will cycle through each voice in sequence, and the left digit on the display will show which voice is currently sounding. For complete information on the Juno-106 test mode, refer to the service manual. There is also some [information on the test mode](http://www.hyperreal.com/machines/manufacturers/Roland/Juno/info/roland.Juno-106.test-mode) available on the [Music Machines](http://www.hyperreal.com/music/machines/) web site.

There are a few production runs of the 80017A VCF/VCA chip which are known to be problematic. These can be identified by the lot number, which is printed on the chip in the lower right corner. Lots 41C and 42B are known to have problems. Here is a scan of the original [Roland service bulletin](http://www.synthfool.com/i80017a.gif) which discusses this problem.

The following chart shows which ICs are associated with each voice. These chips are all located on the module board in the Juno.

<table data-border="1" data-cellpadding="2">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td><strong>Voice</strong></td>
<td><strong>Wave Generator Chip<br />
(MC5534A)</strong></td>
<td><strong>VCF/VCA Chip<br />
(80017A)</strong></td>
</tr>
<tr>
<td>1</td>
<td rowspan="2">IC12</td>
<td>IC13</td>
</tr>
<tr>
<td>2</td>
<td>IC11</td>
</tr>
<tr>
<td>3</td>
<td rowspan="2">IC8</td>
<td>IC9</td>
</tr>
<tr>
<td>4</td>
<td>IC7</td>
</tr>
<tr>
<td>5</td>
<td rowspan="2">IC4</td>
<td>IC5</td>
</tr>
<tr>
<td>6</td>
<td>IC3</td>
</tr>
</tbody>
</table>

Note that sometimes not all parts of a voice go out. In my case, it was only the sub-oscillator on voice 4 which stopped working, while the sawtooth and pulse waves still worked fine. (This was probably one indicator that it was the wave generator chip, and not the VCF/VCA chip, which was causing the problem. If the VCF/VCA chip had gone out, the expected behavior would have been for the entire voice to be dead, not just one part of it.)

Obligatory disclaimer: This information is provided as an aid for Juno-106 users but is not guaranteed to work for everyone. If you go poking around your Juno with a soldering iron, you do so at your own risk. If you don't know what you're doing, you should probably take your unit to an authorized Roland service center.

------------------------------------------------------------------------

<span id="q6"></span>

### Can the Juno-106 send and receive real-time MIDI sysex information?

Yes. When the "MIDI function" switch on the unit is set to mode III, the Juno will send a MIDI system exclusive message for every movement of the patch control sliders or buttons. If you have a sequencer capable of recording real-time sysex (many aren't), this information can be recorded and played back as part of a sequence. Another possible use for this feature is linking two Juno-106s together via MIDI; the second unit would mimic anything done on the first one. Slightly detuning one unit and mixing the two outputs together could provide whole new levels of fat bassy sound.

------------------------------------------------------------------------

<span id="q7"></span>

### Where can I get information on the Juno-106's MIDI implementation?

Complete MIDI implementation is available in the Juno-106 owner's manual; I now have this [information](http://www.eskimo.com/~syzygy/juno106midi.html) available here as well. There is also some [information](http://www.hyperreal.com/music/machines/manufacturers/Roland/Juno/info/roland.Juno-106.sysex) available on the Music Machines web site.

------------------------------------------------------------------------

<span id="q8"></span>

### Where can I find patch editing/librarian software for the Juno-106?

There is Juno-106 patch editing/librarian software for many platforms available on the Internet. Here are links to a few. If you have any you'd like me to add, [mail me](mailto:syzygy@eskimo.com) with the URL and I'll check it out.

- [Windows](http://www.hyperreal.com/music/machines/manufacturers/Roland/Juno/software/junolib2.zip)
- [MS-DOS](http://www.hyperreal.com/music/machines/manufacturers/Roland/Juno/software/junoedit.zip)
- [Macintosh](http://www.tcp-ip.or.jp/~setsu/juno.html)
- [Atari](http://www.hyperreal.com/music/machines/manufacturers/Roland/Juno/software/juno106.zoo)

------------------------------------------------------------------------

That's it for now! If you have any additional questions that I haven't answered, please let me know and I'll see about adding them to the FAQ.

[<img src="back_home_icon.gif" data-border="0" width="136" height="24" alt="Chad&#39;s Home" />](index.html)
