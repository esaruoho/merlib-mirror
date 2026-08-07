---
title: "C.M. Connelly: Blog: Archive for June, 2003"
source_domain: amasci.com
source_path: ~c/blog/archive/2003-06.html
order: 1784
reachable_from_entry: false
images: 17
internal_links: 20
extracted: 2026-08-07T05:55:26Z
extractor: site_to_paper.py (pandoc)
---

# C.M. Connelly: Blog: Archive for June, 2003

*Source page: `~c/blog/archive/2003-06.html`*

<span id="top"> </span>

<div id="navbar">

<a href="../index.html" class="navbar">Blog</a> \| <a href="../../debian/index.html" class="navbar">Debian</a> \| <a href="../../work/index.html" class="navbar">Work</a> \| <a href="../../work/resume/index.html" class="navbar">Résumé</a> \| <a href="../../about/index.html" class="navbar">About...</a>

</div>

<div id="header">

[<img src="../../images/logo-light.png" data-border="0" width="200" height="85" alt="Link to Home" />](../../index.html)

# Blog: Archive for June, 2003

</div>

<div id="content">

<div id="wrapper">

<div id="blogentries">

<div class="day">

## June 6, 2003 (Fri)

<div class="entry">

<span id="entry:06-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2003-06.html#day:06-1)My sister-in-law pointed me to [Tha Shizzolator](http://www.asksnoop.com/), a Snoop Dogg filter. Here's a sample from a run on this site:

> And I finished reading Ships of da Sky, which is yet another wickedly depressing history of airships, know what I'm sayin'? Every chapter wuz pretty much, “Behold da bomb diggity 'n glorious airship, *xxx*! See that shiznit conquer da skies! See da crowds ooh 'n ahh! Oh, whoops, damn, there that shiznit goes, lots of dead muthas, hell, guess we'll has try again, know what I'm sayin'?”

</div>

</div>

<div class="day">

## June 23, 2003 (Mon)

<div class="entry">

<span id="entry:23-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2003-06.html#day:23-1)Got some more books from Amazon today, but still waiting on two more—one on Haida Art, and, of course, the new Harry Potter. Ours is coming from the UK, to match the others, so we'll just have to wait.

</div>

<div class="entry">

<span id="entry:23-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2003-06.html#day:23-2)[Apple](http://www.apple.com/) disappointed me by not announcing new laptops today (mostly because I want one for work). However, they did announce a [pretty awesome new 64-bit machine](http://www.apple.com/powermac/), as well as show a bunch of cool new features in [Panther](http://www.apple.com/macosx/panther/), the next version of Mac OS X. In fact, the new machines are so stunning that M ordered a new dual-processor box to replace our 867 MHz single processor Mac. Should be cool.

She's also part of Apple's developer program now, so we should get the prerelease versions of Panther early. I'm looking forward to the [user-switching feature](http://www.apple.com/macosx/panther/fast_user_switching.html), which might actually make sharing a Mac with M almost practical.

</div>

</div>

<div class="day">

## June 24, 2003 (Tue)

<div class="entry">

<span id="entry:24-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2003-06.html#day:24-1)Gosh, what fun!

I logged out of my home machine this evening, and when I tried to log in it informed me that my settings had to be wiped out for GNOME2. Needless to say, I'm nowhere close to having a working environment like the one I had.

Grr.

</div>

<div class="entry">

<span id="entry:24-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2003-06.html#day:24-2)In the end, I was forced to upgrade a whole slew of packages from unstable. The results, however, are pretty stunning. Fonts are now antialiased, which means the whole thing looks good. I finally have reasonable key repeat rates (for some reason that was broken before). The mouse scrolls smoothly.

I miss my WindowMaker dock, but I was going to lose it sooner or later, and I think I can cope (I wasn't really using most of its functionality, anyway). In the meantime, pretty Linux is a wild thing to consider....

</div>

</div>

<div class="day">

## June 25, 2003 (Wed)

<div class="entry">

<span id="entry:25-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2003-06.html#day:25-1)After much tinkering, a screenshot.

[<img src="../../images/2003-06-25-screenshot-sm.png" data-border="0" width="400" height="300" alt="Screenshot showing GNOME 2 in action." />](../../images/2003-06-25-screenshot.png)

</div>

</div>

<div class="day">

## June 29, 2003 (Sun)

<div class="entry">

<span id="entry:29-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2003-06.html#day:29-1)Sometimes you have to wonder about coincidence. Last night I noticed that I was having some framerate issues. M suggested I try rebooting. When I did, the system decided to `fsck` most of the partitions (not surprising, as it claimed that some of them hadn't been checked for 200 days). And damned if it didn't find unrepairable problems on not one, but two partitions. One of which, of course, was `/home`.

The machine still ran, though, so I was able to backup the partition—doing manual backups of some special directories, such as my e-mail and my [<span class="abbr" title="Concurrent Versions System">CVS</span>](http://www.cvshome.org/) repository. So that's good, at least.

I also backed up a couple of other parts of the disk—some of `/usr/local`, `/etc`—and dumped a list of the packages I have installed.

And, it turns out, the other damaged partition was `/var`, and, not coincidentally, some of the problems were with files in `/var/lib/dpkg/info`, which strongly suggests that [the problems I had in early May](2003-05.html#entry:08-1) were caused by the disk degradation.

</div>

<div class="entry">

<span id="entry:29-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2003-06.html#day:29-2)Oh, and our home Mac decided that now would be a good time to have its drive (or drives, we're still not sure) die, too. Apparently it's spinning its drives down, and sometimes they're not coming back up again. In fact, not long after we'd started investigating the problems with my machine, the Mac decided to pretend it had no drives at all.

Luckily, again, I talked M into buying a FireWire disk a few weeks ago, and she'd done some backups. She's managed to get the machine to come back again and is busy doing newer backups of everything on both drives, just in case.

And we thought it was because of buggy drivers for the [iSight](http://www.apple.com/isight/).

</div>

<div class="entry">

<span id="entry:29-3"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2003-06.html#day:29-3)By the way, although I am somewhat pissed off at Apple right now, I do have to say that the iSight is a nice webcam. Would've been nice if they'd provided a way to mount it on one of their LCDs that didn't involve sticky disks, though (maybe suction cups?). I expect that the market may fill in the gaps, as it has with the iPods, for which there are an amazing number of products available, from cases to extra battery packs to miniature radio broadcasting station attachments.

Yes, I spent *way* too much time wandering around the Apple Store last Friday.

</div>

<div class="entry">

<span id="entry:29-4"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2003-06.html#day:29-4)Meanwhile, I've gotten lots of reading done.

I finished Erik Larsen's The Devil in the White City yesterday. It was every bit as good as I'd hoped after hearing about it and then watching Larsen read from it on C-SPAN.

Everyone I've told bits of stories from the book has expressed disbelief—“And this is a true story?”

Well, yes, it is. Technically, it's two true stories wrapped around each other. On the one hand, we have the devil, Herman Mudgett, MD, better known as H.H. Holmes, a serial killer before anyone had ever heard of serial killers. And on the other we have the creators of the White City, Chicago's World Columbian Exposition of 1892–1893, Henry Burnham and his collaborators—Frederick Law Olmstead, Charles McKim, Louis Sullivan, et al. While Holmes manipulates and murders, the architects design and build a fantastic, iconic architectural wonder that had a massive impact on American architecture (good or bad, depending on your school of thought).

Larsen is an excellent writer, and, while the book is extensively documented with end notes, the book reads almost like a novel.

</div>

<div class="entry">

<span id="entry:29-5"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2003-06.html#day:29-5)I've just finished William Gibson's latest, Pattern Recognition, which is easily his best book since Count Zero, and with many of the same themes.

I can't say that I was that fond of the last few Gibson books. They all had some good stuff in them, but never quite struck a chord with me. Pattern Recognition, though, reminds me strongly of Banks's The Business, D.F. Wallace's Infinite Jest, and various bits of Pynchon, especially the more accessible Pynchon, such as Vineland.

The main character, Cayce Pollard, is a [“coolhunter”](2001-02.html#entry:27-1), hired by corporations and advertising agencies to sniff out the next cool thing that will sweep the global market. She's lost her dad in the World Trade Center attack, and suffers from some odd psychic allergies to spokesthings, logos, and labels. I sympathize.

She's hired to vet a new logo, then to seek out the creators of some mysterious “footage”, apparently parts of an enigmatic film, that appear in different locations on the web and are sought after and obsessively discussed by cliques on various websites.

Meanwhile, we get some nice insights into how such collectives work (that mesh with my experiences, anyway), some interesting theories about how the Sinclair ZX-81 fueled the creation of British computer programmers, and nice pointers to interesting products, past and present, such as [Curta calculators](http://curta.org/) (which I've thought looked cool since I saw some in a display case at the school I work for) and [Buzz Rickson's](http://www.historypreservation.com/BuzzRickson.html) *otaku*esque reproductions of U.S. military clothing.

Next up, the new Harry Potter, in original UK hardback. BTW, the site [I mentioned](2002-01.html#entry:24-2) that had a list of differences between the UK and US editions seems to have died and been taken over by some scummy site squatters. Looks like the list is now available from a Geocities [site](http://www.geocities.com/hpnewsgroup/bookdif.htm)

</div>

<div class="entry">

<span id="entry:29-6"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2003-06.html#day:29-6)[My Initial](2003-04.html#entry:22-3) is going to have to go back to the factory for repair. The pen itself is fine—it's actually gotten nicer and nicer to use as time has gone on—but the clip has come loose and I can't get it to stay in place. It's really a shame, especially as I finally gave in and admitted that no one else was going to buy me an [ErgoDesk](http://www.ergodesk.com/). and bought one myself. Of course it arrived on Friday, and I haven't yet had a chance to use it to see if it works for me or not.

</div>

</div>

[newer entries](2003-07.html) \| [older entries](2003-05.html)

</div>

</div>

<div id="sidebar">

<div style="display: none;">

 

</div>

## Activity

<table id="calendar" data-summary="calendar">
<thead>
<tr>
<th><a href="2003-05.html" title="Back to May, 2003">&lt;&lt;</a></th>
<th colspan="5">June, 2003</th>
<th><a href="2003-07.html" title="On to July, 2003">&gt;&gt;</a></th>
</tr>
</thead>
<tbody>
<tr>
<th>Mo</th>
<th>Tu</th>
<th>We</th>
<th>Th</th>
<th>Fr</th>
<th>Sa</th>
<th>Su</th>
</tr>
&#10;<tr>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td>1</td>
</tr>
<tr>
<td>2</td>
<td>3</td>
<td>4</td>
<td>5</td>
<td><a href="#day:06" title="Entry for 2003-06-06">6</a></td>
<td>7</td>
<td>8</td>
</tr>
<tr>
<td>9</td>
<td>10</td>
<td>11</td>
<td>12</td>
<td>13</td>
<td>14</td>
<td>15</td>
</tr>
<tr>
<td>16</td>
<td>17</td>
<td>18</td>
<td>19</td>
<td>20</td>
<td>21</td>
<td>22</td>
</tr>
<tr>
<td><a href="#day:23" title="Entry for 2003-06-23">23</a></td>
<td><a href="#day:24" title="Entry for 2003-06-24">24</a></td>
<td><a href="#day:25" title="Entry for 2003-06-25">25</a></td>
<td>26</td>
<td>27</td>
<td>28</td>
<td><a href="#day:29" title="Entry for 2003-06-29">29</a></td>
</tr>
<tr>
<td>30</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

## More Archives...

<a href="2004-03.html" class="archlink">March, 2004</a>\
<a href="2004-02.html" class="archlink">February, 2004</a>\
<a href="2004-01.html" class="archlink">January, 2004</a>\
<a href="2003-12.html" class="archlink">December, 2003</a>\
<a href="2003-11.html" class="archlink">November, 2003</a>\
<a href="2003-10.html" class="archlink">October, 2003</a>\
[more...](./)

</div>

<div id="footer">

[<img src="../../images/Valid_XHTML10.png" data-border="0" width="88" height="31" alt="Valid XHTML 1.0!" />](http://validator.w3.org/check?uri=http://www.eskimo.com/~c/blog/archive/2003-06.html;ss)

Copyright © 1998–2004, C.M. Connelly.\
[<img src="http://creativecommons.org/images/public/somerights.gif" data-border="0" alt="Creative Commons License" />](http://creativecommons.org/licenses/by-nc-sa/1.0/)\
This work is licensed under a [Creative Commons License](http://creativecommons.org/licenses/by-nc-sa/1.0/).

Last modified at 4:53 PM PST, Wednesday, March 3, 2004; last rendered at 4:53 PM PST, Wednesday, March 3, 2004 with [Mason](http://www.masonhq.com/) and [Perl](http://www.perl.org/).

Please [e-mail me about problems with this page](mailto:c@eskimo.com?Subject=Problem%20with%20/eskimo/blog/archive/2003-06.html). Thanks.

</div>

[<img src="../../images/scrollup.gif" data-border="0" width="9" height="11" alt="Return to Top of Page" />](#top)

</div>
