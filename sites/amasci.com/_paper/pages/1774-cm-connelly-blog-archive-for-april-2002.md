---
title: "C.M. Connelly: Blog: Archive for April, 2002"
source_domain: amasci.com
source_path: ~c/blog/archive/2002-04.html
order: 1774
reachable_from_entry: false
images: 54
internal_links: 64
extracted: 2026-08-07T05:55:25Z
extractor: site_to_paper.py (pandoc)
---

# C.M. Connelly: Blog: Archive for April, 2002

*Source page: `~c/blog/archive/2002-04.html`*

<span id="top"> </span>

<div id="navbar">

<a href="../index.html" class="navbar">Blog</a> \| <a href="../../debian/index.html" class="navbar">Debian</a> \| <a href="../../work/index.html" class="navbar">Work</a> \| <a href="../../work/resume/index.html" class="navbar">Résumé</a> \| <a href="../../about/index.html" class="navbar">About...</a>

</div>

<div id="header">

[<img src="../../images/logo-light.png" data-border="0" width="200" height="85" alt="Link to Home" />](../../index.html)

# Blog: Archive for April, 2002

</div>

<div id="content">

<div id="wrapper">

<div id="blogentries">

<div class="day">

## April 1, 2002 (Mon)

<div class="entry">

<span id="entry:01-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:01-1)Feeling pretty ill today. Read Structures. Slept. Spent some time this afternoon and again this evening dealing with some of the licensing stuff. RMS is involved now.

</div>

</div>

<div class="day">

## April 2, 2002 (Tue)

<div class="entry">

<span id="entry:02-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:02-1)Still slogging away on the licensing stuff, but I was able to put together a status report. I've also been talking with Thomas Esser (the “te” in “teTeX”), and it turns out that [<span class="abbr" title="Richard M. Stallman">RMS</span>](http://www.stallman.org/) thinks that the [<span class="abbr" title="LaTeX Project Public License">LPPL</span>](http://www.latex-project.org/lppl.html) is a free license, which is good enough for me.

</div>

<div class="entry">

<span id="entry:02-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:02-2)[More](http://www.linuxjournal.com/article.php?sid=5926&mode=&order=0) on [Steve Mann](http://wearcam.org/mann.htm).\
<span class="blogcred">Via [Slashdot](http://slashdot.org/).</span>

</div>

<div class="entry">

<span id="entry:02-3"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:02-3)The Guardian on [Philip Pullman winning the Whitbread](http://books.guardian.co.uk/whitbread2001/story/0,11169,637850,00.html) for The Amber Spyglass.\
<span class="blogcred">Via [Locus](http://www.locusmag.com/).</span>

</div>

<div class="entry">

<span id="entry:02-4"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:02-4)Even better! [The “Left Alone” series](http://www.locusmag.com/2002/Features/Letters0401.html). (The real thing is a major seller here, which is a pretty serious sign that this is a Bad Place.™)

</div>

</div>

<div class="day">

## April 3, 2002 (Wed)

<div class="entry">

<span id="entry:03-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:03-1)I'm hobnobbing with the greats now. ;-) Yet another mention in [<span class="abbr" title="Debian Weekly News">DWN</span>](http://www.debian.org/News/weekly/2002/14/)...

</div>

<div class="entry">

<span id="entry:03-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:03-2)Best guarantee ever:

> **The Meta-CVS Guarantee**
>
> If you are not fully satisfied with Meta-CVS for any reason, simply change to your installation directory and type “rm mcvs\*”. Your disk space will be promptly refunded. No questions asked (unless you use rm -i, of course).

([Meta-CVS](http://users.footprints.net/~kaz/mcvs.html) actually looks interesting. I've been wondering if I want to tinker with [Subversion](http://subversion.tigris.org/), but Meta-CVS offers some of Subversion's advantages without having to learn a dramatically different way of doing things. I'll probably just stick with CVS, though.)

</div>

</div>

<div class="day">

## April 4, 2002 (Thu)

<div class="entry">

<span id="entry:04-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:04-1)Spent the morning upgrading a Virtual PC Debian install to woody, in part to check the upgrade path for the `tetex-*` packages, and in part because I wanted a VPC woody image.

</div>

<div class="entry">

<span id="entry:04-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:04-2)I spent most of this afternoon playing with Illustrator, trying out various possibilities for a personal letterhead. The next step is to make it work in LaTeX.

</div>

</div>

<div class="day">

## April 5, 2002 (Fri)

<div class="entry">

<span id="entry:05-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:05-1)Spent *all day* fighting with the Bourne shell to try to find a workaround for an annoying release-critical teTeX bug. Basically, the [<span class="abbr" title="Filesystem Hierarchy Standard">FHS</span>]() says that (1) you can't mess with `/usr/local/`, beyond creating directories under some major directories there, and (2) you can't write *anything* to `/usr/`. (1) wasn't really a problem, as we only create directories under major directories, which is okay by the FHS and Debian Policy. But (2) turned out to be more complicated.

Every night, a cron job runs to rebuild the `ls-R` files that the `kpathsea` stuff uses to find files quickly. As it was, the `tetex-bin` cron job just ran `mktexlsr`, a Bourne shell script that generates an `ls-R` file for each directory in the `TEXMF` path. On Debian systems, that usually means `/usr/share/texmf/`, `/var/spool/texmf/`, and `/usr/local/{lib,share}/texmf/`. I spent some time trying to hack the `mktexlsr` script before giving up. Later, when I talked to M about it, she asked whether I could just modify the cron job, which I had thought of, but forgotten about in my initial rush of enthusiasm about tinkering with `mktexlsr`. So that's what I did. Future releases of Debian's teTeX packages will no longer attempt to create an ls-R file for any directory under `/usr/local/` unless the systems administrator edits the `/etc/cron.daily/tetex-bin` file to allow it to do so.

That was *my* unfun Friday.

</div>

</div>

<div class="day">

## April 6, 2002 (Sat)

<div class="entry">

<span id="entry:06-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:06-1)We bought another switch/gateway router device, this one with wireless support. We didn't really need one of these, but given the general flakiness of Apple's Airport (which, you may recall, crashes the USB speakers if we happen to be playing music with iTunes and using the wireless network), it seemed like a good idea to not be dependent on the Airport card in the G4. Plus we thought we'd end up with several additional switch ports, which doesn't seem to be working out as well as we'd hoped.

Alas, the manufacturers of these little SOHO units don't seem to have taken into account the idea that you might want to hook two of them together, and switch off their firewall/gateway software on one of them. So I think we've only picked up one port.

Also annoying was the fact that we bought the thing from CompUSA. I always forget how much I hate that place (where they often want to search customers to be sure they haven't stolen anything). Much to my annoyance, they asked me for ID, and when I asked why, they fed me the line about how it was “for \[my\] protection”. Which, of course, it isn't. If someone steals my card, it will cost me—at most—\$50. I would gladly trade \$50 for not having various businesses tell me that they think I might be a criminal.

</div>

<div class="entry">

<span id="entry:06-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:06-2)Finally got a chance to work on the letterhead thing again, which was kind of fun. After much tinkering, I ended up with a pretty close approximation of what I'd put together in Illustrator.

</div>

</div>

<div class="day">

## April 8, 2002 (Mon)

<div class="entry">

<span id="entry:08-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:08-1)Fighting with Earthlink most of the morning. Their authentication machines and DNS servers have been really flaky for the last couple of weeks, leading to our longest downtime since the first day. Annoying, but if you're reading this entry, things must have started working again, at least for a little while....

</div>

<div class="entry">

<span id="entry:08-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:08-2)Hmm. Up long enough to download some mail, but gone again before I could update my blog (or send any mail)....

</div>

</div>

<div class="day">

## April 9, 2002 (Tue)

<div class="entry">

<span id="entry:09-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:09-1)Just put up a [temporary placeholder page](http://www.cs.hmc.edu/courses/2002/fall/cs124/) for M's new course.

</div>

</div>

<div class="day">

## April 10, 2002 (Wed)

<div class="entry">

<span id="entry:10-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:10-1)[Slashdot](http://www.slashdot.org) has [yet another article about Star Wars](http://slashdot.org/article.pl?sid=02/04/10/194215), spurred this time by an [article](http://www.salon.com/ent/movies/feature/2002/04/10/lucas/print.html) in [Salon](http://www.salon.com/), a site I used to read quite often.

Among the comments was a pointer to a [followup](http://www.kithrup.com/brin/starwarsarticle.html) to an [earlier](http://www.salon.com/ent/movies/feature/1999/06/15/brin_main/print.html) Salon article by David Brin, wherein he took Lucas to task for his (in Brin's opinion) trumpeting of the power and glory of aristocracy.

I love bashing Lucas as much as anyone, and The Phantom Menace was one of the worst movies I've ever sat through (I started laughing hysterically when Obi-Wan's master was cut down in a scene that could almost have been shot from the original Star Wars script), but I have to admit to having been intrigued by the trailer we saw when we saw Blade II. (Yeah, yeah, I know, my credibility is gone now, right?)

Anyway, that trailer made the film actually look interesting—probably because, instead of just showing CG spaceships flashing by each other and Jedi Knights bumping lightsabers, it featured snatches of conversations—the Jedi council expressing concern about the developing political situation, a debate in the Senate, a heated discussion in a hallway—followed by CG spaceships and dueling Jedi. The implication was that this movie has a plot—things happen, and people care, and people try to influence them. Whether or not that aspect of things will actually seem significant in terms of the whole movie, of course, remains to be seen.

</div>

<div class="entry">

<span id="entry:10-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:10-2)I just ordered the Savage Republic CDs I mentioned a while back (on [February 16](2002-02.html#entry:16-1)), and have been chatting with Ethan Port, who was the main guy in the band, and also runs [mobilization.com](http://www.mobilization.com/). It turns out, to my disappointment, that the CD releases of Ceremonial were instrumental only. The vinyl copy I bought back in 1986, of course, has lyrics, and it was mainly the memory of one of those songs that made me decide to buy the CDs. Oh, well—*caveat emptor*, as they say in corporate offices.

Apprently Ethan's working on getting the other people from the band to approve a “bootleg” release of the version with lyrics, so maybe I'll have them again someday after all.

</div>

</div>

<div class="day">

## April 12, 2002 (Fri)

<div class="entry">

<span id="entry:12-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:12-1)So, here's a dream for you...

> Segue from a dream involving mutant children revolting against their government and gathering in a mall/underground tunnel complex, which ends with the children choosing between leaving on one last train or staying, with the sounds of gunfire beginning to echo through the tunnels into M and I contemplating a grave at the edge of a road. We exchange some South Park-style insults about which of us might be buried there someday, I make a comment about the tree growing out of the grave that's right on the edge of the road, and then we wander away from the road toward the white suburban house at the end of the driveway.
>
> Our attention is drawn back to the road when a small white car driven by a woman with a man in the passenger seat has just stopped directly in front of an old, orangey-tan Jeep Cherokee, which squeals to a halt. The woman leans out of her window and asks whether the other driver is all right.
>
> “I'd be better if I wasn't havin' to stand on my brakes, Darlin'!” the man calls. Behind him, I see a SouthWest Airlines passenger jet descending rapidly toward the mountains—it seems to be falling, then regains control, then begins tumbling again.
>
> The man in the Cherokee glances at his wrist, shakes his arm, says, “Damn! Now my watch has stopped!” I look at my watch. It isn't working, either.
>
> I curse, thinking of our computers running—or not—in the house behind us. I whisper, “EMP.”
>
> M touches my arm, drawing my attention back to the sky. A small airplane is having trouble, too. I look higher, take her hand. Hundreds of planes of all sizes are beginning to appear, tumbling out of control.
>
> “At least we'll die,” M says, and we lie down on the grass to watch the 'planes come closer and closer.

The radio comes on.

</div>

<div class="entry">

<span id="entry:12-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:12-2)In other news, there's a new New Order single, “Here to Stay” out. Apparently this is the much rumored Chemical Brothers collaboration. You can find the video on the evil FHM site via a link from [worldinmotion](http://www.worldinmotion.net/newsroom.htm#Mar%2020,%202002). (The video is also available from the [Get Ready](http://www.newordergetready.com/) site, but only in Real and Windows Media Player formats. FHM has a (downloadable) QuickTime file.)\
<span class="blogcred">Thanks to [Andrew](http://dev.null.org/blog/archive.cgi/2002/04/12#1531_neworder), for drawing my attention to the fact that there *is* a new single.</span>

</div>

<div class="entry">

<span id="entry:12-3"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:12-3)The new Iain Banks book, Dead Air, is due out in the UK in September. It's a 384-page “thriller” from Little, Brown according to the sum total of information I could find out about it (basically, [Amazon.co.uk](http://www.amazon.co.uk/)), as all the Banks sites are dead.

</div>

<div class="entry">

<span id="entry:12-4"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:12-4)Hey, cool. You can [opt out](http://www.doubleclick.com/us/corporate/privacy/privacy/cookies.asp) of DoubleClick ad tracking by having their site install a “blank” cookie. Whether or not you actually trust them not to do something else evil, well, that's up to you.\
<span class="blogcred">Via [Zeldman](http://www.zeldman.com/daily/0402b.html#ala142).</span>

</div>

<div class="entry">

<span id="entry:12-5"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:12-5)After looking at [Rebecca's page](http://www.rebeccablood.com/), I noticed she had a link in her to-do list called “weblog monitor ping form”. *What's that?*, I wondered, and followed [the link](http://newhome.weblogs.com/pingSiteForm) myself.

Turns out that what she was talking about was modifying whatever tool she uses to maintain her blog to let Dave Winer's [weblogs.com](http://www.weblogs.com/) know when she'd updated. *Hmm*, I thought. *I could do that, too....*

So I have. Now, anyone who cares about such things can see when I've updated my site by monitoring [`http://www.weblogs.com/`](http://www.weblogs.com/). No doubt there are various keen features that people can use to have that information appear on their own sites, or in their browsers—that's up to you.

Since I was writing a Perl script anyway, I generalized it to replace all of the various Bourne shell scripts I have to publish the several sites I maintain. It now reads from a single configuration hash of hashes, fills in various variables, and renders, fixes permissions, and publishes changed pages to the appropriate remote site. The next step is to put the configuration data into its own file, and then to implement some command-line options to specify the site to publish and be able to specify or override some settings.

Fun, fun, fun!

</div>

<div class="entry">

<span id="entry:12-6"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:12-6)To be honest, most of the work was getting the rendering and publishing stuff working—I was able to adapt some code from an example file included with the [`SOAP::Lite`](http://www.soaplite.com/) Perl module (packaged for [Debian GNU/Linux](http://www.debian.org/) as `libsoap-lite-perl`).

Weblogs.com has some other implementations, as well, including one using [`LWP`](http://davespicks.com/ping_weblogs.html), and one using its [own Perl module](http://www.aaronland.net/toys/weblog-updates/). (The last site also has a JavaScript bookmarklet for your browser.)

</div>

</div>

<div class="day">

## April 13, 2002 (Sat)

<div class="entry">

<span id="entry:13-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:13-1)We saw [Panic Room](http://us.imdb.com/Title?Panic+Room+(2002)) today. The best part of the film was the titles—names and positions floating against the New York skyline, aligned with the surface of buildings, reflected in their windows.

The rest, however, was only okay while the movie lasted. Post-theatre discussion with your partner, friends, or perfect strangers makes the film's flaws exceedingly obvious. I can't say anything really nasty without spoiling the film, and while I generally don't care about that (my take on things is that they shouldn't depend on a shocking twist that makes it impossible to discuss the work without ruining it for someone who hasn't read or seen it), I'm not even sure it's worth it.

I was stuck by the way that it seemed to have been made for television, complete with fades to black at convenient places. I'm not even sure it would work all that well on television, though, because what little suspense does build would be dissipated by the time you got back from the bathroom or kitchen.

Oh, and the audience was lame, too. It's amazing how many incredibly slow people feel they need to announce their discoveries to the whole crowd (well after everyone else has figured out what was happening, of course).

Do yourself a favor—skip this one, and rent The Game or Fight Club. You won't be sorry.

</div>

</div>

<div class="day">

## April 14, 2002 (Sun)

<div class="entry">

<span id="entry:14-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:14-1)Today we saw an infinitely superior film, [Frailty](http://us.imdb.com/Title?Frailty+(2001)). Real suspense, real emotion, real acting. Powerful stuff.

What if God sent an angel to you who told you that God needed you to destroy some demons for Him? Demons that looked like ordinary people. And that you'd have to get your children involved?

No nonsense from this audience. A couple of people walked out fairly early on, the rest were stunned into silence.

The film plays out slowly and deliberately. There's plenty of time for you to think about what's being said and what you're seeing. Time to feel scared for the kids. Time to feel scared for the *victims*.

And lots to think (and talk) about after the film, as well.

Recommended.

</div>

</div>

<div class="day">

## April 15, 2002 (Mon)

<div class="entry">

<span id="entry:15-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:15-1)Finally got my letterhead working. Woo-hoo!

</div>

</div>

<div class="day">

## April 16, 2002 (Tue)

<div class="entry">

<span id="entry:16-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:16-1)[Infrequently Asked Questions](http://www.burningvoid.com/iaq/).

</div>

</div>

<div class="day">

## April 17, 2002 (Wed)

<div class="entry">

<span id="entry:17-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:17-1)[The Covers Project](http://covers.wiw.org/) tracks chains of cover versions. I added a few obscurities, though I'd probably be able to find more if I dug out my records. Fun stuff!\
<span class="blogcred">Via [Andrew](http://dev.null.org/blog/archive.cgi/2002/04/16#0143_covers).</span>

</div>

<div class="entry">

<span id="entry:17-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:17-2)In order to apply for a job, I spent most of the day going over [my résumé](../../work/resume/), updating and reformatting it. Shiny new versions are now available, if you're interested.

</div>

</div>

<div class="day">

## April 19, 2002 (Fri)

<div class="entry">

<span id="entry:19-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:19-1)In a bit of a slump, here. Sorry.

</div>

<div class="entry">

<span id="entry:19-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:19-2)I started rereading “<span class="abbr" title="AKA Neal Stephenson and an uncle">Stephen Bury's</span>” The Cobweb. Sometimes, when you're depressed, familiar fiction is a great escape. Sometimes familiar fiction you've forgotten most of is even better.

Anyway, The Cobweb seems, sadly, apropos yet again. It's a conspiracy potboiler in which the Iraqis attempt to cook up some biological death for America right in America's heartland.

</div>

<div class="entry">

<span id="entry:19-3"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:19-3)Ex-site-ment: I changed the background color (icier, I think, reflecting my mood), and also spent a little while tinkering with the code that generates the calendars on the archive pages. (You had noticed those, right?)

I think they look better now, and are a bit more informative, as well.

</div>

<div class="entry">

<span id="entry:19-4"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:19-4)[Graham](http://www.grudnuk.com/vm/) has redesigned again, and it's pretty sexy.

</div>

</div>

<div class="day">

## April 21, 2002 (Sun)

<div class="entry">

<span id="entry:21-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:21-1)Oldies but goodies—[xyWrite](http://www.escape.com/~yesss/_xywhat.htm). I remember people using this “text processor” back when I worked in the safety department. Scary stuff at the time—`vi` meets Emacs meets WordPerfect.

</div>

<div class="entry">

<span id="entry:21-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:21-2)My birthday is rapidly approaching. Yeck.

</div>

</div>

<div class="day">

## April 22, 2002 (Mon)

<div class="entry">

<span id="entry:22-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:22-1)Eblen Mogen ([<span class="abbr" title="Free Software Foundation">FSF</span>](http://www.fsf.org/)'s attorney) on [Enforcing the GPL](http://moglen.law.columbia.edu/publications/lu-12.html).\
<span class="blogcred">Via [Slashdot](http://slashdot.org/article.pl?sid=02/04/21/0152239&mode=nested&tid=117).</span>

</div>

<div class="entry">

<span id="entry:22-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:22-2)[Salon](http://www.salon.com/) [explains Mulholland Drive](http://www.salon.com/ent/movies/feature/2001/10/23/mulholland_drive_analysis/print.html).\
<span class="blogcred">Via [Andrew](http://dev.null.org/blog/archive.cgi/2002/04/23#0016_mulhollan).</span>

</div>

<div class="entry">

<span id="entry:22-3"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:22-3)Bruce Sterling's [CFP speech](http://www.viridiandesign.org/notes/301-350/00309_cfp_speech.html), in which he disses the Mouse, that Dell dope, Microsoft, and corporate copyright creeps.

</div>

<div class="entry">

<span id="entry:22-4"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:22-4)Not that this is likely to be a big surprise for anyone, but a [Deep Space Nine movie is “unlikely”](http://www.scifi.com/scifiwire/art-main.html?2002-04/22/10.00.tv), according to Ira Steven Behr, one of the producers.

</div>

</div>

<div class="day">

## April 23, 2002 (Tue)

<div class="entry">

<span id="entry:23-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:23-1)[Excerpts from an interview with Tim Powers](http://www.locusmag.com/2002/Issue02/Powers.html) that appeared in the February, 2002, issue of [Locus](http://www.locusmag.com/).

</div>

<div class="entry">

<span id="entry:23-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:23-2)Some people (and institutions) are astoundingly stupid. Suppose you have some services that you offer to a group of people. Suppose that—in order to “save money” and “allocate resources to your \`primary community'—you offer a more limited set of services to spouses of members of the first group. If you're an idiot, you can kid yourself that you are somehow preventing the members of the second group from taking advantage of the full range of services available to the first group. But only if you're an idiot.

</div>

<div class="entry">

<span id="entry:23-3"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:23-3)[Sobe](http://www.sobebev.com/) does [Yoo-Hoo](http://www.drinkyoo-hoo.com/): [Love Bus Brew](http://www.sobebev.com/site/product_info/brew.shtml). (It's actually pretty good, and you can't get Yoo-Hoo in this benighted land.)

</div>

</div>

<div class="day">

## April 24, 2002 (Wed)

<div class="entry">

<span id="entry:24-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:24-1)`</modesty>`

> I have been the bug-fix goddess over the last couple of days, combing over the bugs open against Debian's `tetex-*` packages and closing old ones, forwarding ones that needed to be forwarded, asking for more information where necessary, and just generally working the BTS for all it's worth.
>
> Not only that, but I fixed three bugs in CVS, and uploaded new versions of two of my own packages.
>
> To quote Lester Burnham, “I *rule*!”

`<modesty>`

</div>

</div>

<div class="day">

## April 25, 2002 (Thu)

<div class="entry">

<span id="entry:25-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:25-1)Somewhere down the road, after we buy a house, we'll probably be buying a washing machine. M will, no doubt, be glad to see [this thread](http://ths.gardenweb.com/forums/load/appl/msg05183338976.html), in which people enthuse about European front-loading washing machines. (I got to see one in action when we stayed with her parents—slower, but the clothes were very clean, and the machine was very, very quiet.)\
<span class="blogcred">Via [Rebecca's Pocket](http://www.rebeccablood.net/archive/2002/04.html#25laundry).</span>

</div>

<div class="entry">

<span id="entry:25-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:25-2)Also from [Rebecca](http://www.rebeccablood.net/archive/2002/04.html#25spacefood), it turns out that they never stopped making Space Food Sticks in Australia, and [someone's selling them](http://www.spacefoodsticks.com/)! I don't know, though, \$17.95 for 24 or \$10 for a dozen still seems like a lot of money. Although I might grab them if I saw them in a store, so....

</div>

</div>

<div class="day">

## April 27, 2002 (Sat)

<div class="entry">

<span id="entry:27-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:27-1)Spent the entire day rewriting the `rules` file for the `tetex-base` source package. It should be much cleaner and easier to understand than the old one, which will, I hope, make it easier for us to adjust which files end up in which packages.

</div>

</div>

<div class="day">

## April 28, 2002 (Sun)

<div class="entry">

<span id="entry:28-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:28-1)I met with Biella Coleman today, an anthropology grad student at the University of Chicago who's doing her dissertation on the free software movement. She's travelling around and interviewing Debian developers, hoping to end up with between forty and fifty by the time she's ready to sit down and start writing.

The interview was a lot of fun, not least because I got a chance to rant about all sorts of things that M and my immediate family are tired of hearing about (free software and Debian, of course, but also the degenerative state of the culture today, intellectual property rights and nastiness, evil corporations, architecture, and more).

Claremont was looking particularly fine, as the sun was shining brightly but it was just a bit cool and breezy. Sadly, this weather won't last much longer.

</div>

</div>

<div class="day">

## April 29, 2002 (Mon)

<div class="entry">

<span id="entry:29-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:29-1)[Apple](http://www.apple.com/) announced some new toys today, although not really anything I'd be terribly interested in.

While the TiBook is sexy, everything I've heard about it makes me leery about actually owning one. The new feature the new machines have that makes them a bit more attractive is the ability to hook them up to one of Apple's LCD monitors.

I think I'll wait for something as tough as the iBook with the same features as the current TiBook. Meanwhile, the desktop machine is just fine.

</div>

</div>

<div class="day">

## April 30, 2002 (Tue)

<div class="entry">

<span id="entry:30-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:30-1)Apparently your chance to sign the Deep Space Nine [movie/miniseries petition](http://www.petitiononline.com/ds9hrzns/petition.html) ends tomorrow, as they're planning to send it on May 1. Go and sign it!

</div>

<div class="entry">

<span id="entry:30-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:30-2)[A fantastic news piece](http://elsa.photo.net/firefly.html) on John Kristensen, letterpress printer, and his Firefly Press. Amazingly cool.\
<span class="blogcred">Via [Lines & Splines](http://linesandsplines.com/2002_04_01_archive.html#75825769).</span>

</div>

<div class="entry">

<span id="entry:30-3"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-04.html#day:30-3)Our technology today is impenetrable. Almost everything is done in software, controlling minute bursts of electricity that often only manifest themselves in a brief burst of output, itself rendered by bursts of electricity guided by magnetic fields to make a glass screen glow.

Even when a machine is mechanical, its workings are usually hidden—sheathed inside steel, aluminum, or plastic, or tucked away in a factory.

Our artifacts are all about smoothness. Aerodynamic fairings covering the messy reality. “Excess” decoration has been stripped away. Buildings are sheer glass walls with little connection to the people who use or build them. Interior surfaces are manufactured sheetrock—paper-covered gypsum—installed to be as smooth as possible. Ornamentation is rare, and often crude.

We've lost something. Maybe something important. Maybe not. But if things continue, we may never be able to get it back. Much like masons puzzling over the formulation of Roman concrete during the middle ages, exactly how many forms of craftwork was done has been lost.

</div>

</div>

[newer entries](2002-05.html) \| [older entries](2002-03.html)

</div>

</div>

<div id="sidebar">

<div style="display: none;">

 

</div>

## Activity

<table id="calendar" data-summary="calendar">
<thead>
<tr>
<th><a href="2002-03.html" title="Back to March, 2002">&lt;&lt;</a></th>
<th colspan="5">April, 2002</th>
<th><a href="2002-05.html" title="On to May, 2002">&gt;&gt;</a></th>
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
<td><a href="#day:01" title="Entry for 2002-04-01">1</a></td>
<td><a href="#day:02" title="Entry for 2002-04-02">2</a></td>
<td><a href="#day:03" title="Entry for 2002-04-03">3</a></td>
<td><a href="#day:04" title="Entry for 2002-04-04">4</a></td>
<td><a href="#day:05" title="Entry for 2002-04-05">5</a></td>
<td><a href="#day:06" title="Entry for 2002-04-06">6</a></td>
<td>7</td>
</tr>
<tr>
<td><a href="#day:08" title="Entry for 2002-04-08">8</a></td>
<td><a href="#day:09" title="Entry for 2002-04-09">9</a></td>
<td><a href="#day:10" title="Entry for 2002-04-10">10</a></td>
<td>11</td>
<td><a href="#day:12" title="Entry for 2002-04-12">12</a></td>
<td><a href="#day:13" title="Entry for 2002-04-13">13</a></td>
<td><a href="#day:14" title="Entry for 2002-04-14">14</a></td>
</tr>
<tr>
<td><a href="#day:15" title="Entry for 2002-04-15">15</a></td>
<td><a href="#day:16" title="Entry for 2002-04-16">16</a></td>
<td><a href="#day:17" title="Entry for 2002-04-17">17</a></td>
<td>18</td>
<td><a href="#day:19" title="Entry for 2002-04-19">19</a></td>
<td>20</td>
<td><a href="#day:21" title="Entry for 2002-04-21">21</a></td>
</tr>
<tr>
<td><a href="#day:22" title="Entry for 2002-04-22">22</a></td>
<td><a href="#day:23" title="Entry for 2002-04-23">23</a></td>
<td><a href="#day:24" title="Entry for 2002-04-24">24</a></td>
<td><a href="#day:25" title="Entry for 2002-04-25">25</a></td>
<td>26</td>
<td><a href="#day:27" title="Entry for 2002-04-27">27</a></td>
<td><a href="#day:28" title="Entry for 2002-04-28">28</a></td>
</tr>
<tr>
<td><a href="#day:29" title="Entry for 2002-04-29">29</a></td>
<td><a href="#day:30" title="Entry for 2002-04-30">30</a></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

## More Archives...

<a href="2002-09.html" class="archlink">September, 2002</a>\
<a href="2002-08.html" class="archlink">August, 2002</a>\
<a href="2002-07.html" class="archlink">July, 2002</a>\
<a href="2002-06.html" class="archlink">June, 2002</a>\
<a href="2002-05.html" class="archlink">May, 2002</a>\
[more...](./)

</div>

<div id="footer">

[<img src="../../images/Valid_XHTML10.png" data-border="0" width="88" height="31" alt="Valid XHTML 1.0!" />](http://validator.w3.org/check?uri=http://www.eskimo.com/~c/blog/archive/2002-04.html;ss)

Copyright © 1998–2002, C.M. Connelly.

Last modified at 12:24 AM PDT, Sunday, September 8, 2002; last rendered at 12:24 AM PDT, Sunday, September 8, 2002 with [Mason](http://www.masonhq.com/) and [Perl](http://www.perl.org/).

Please [e-mail me about problems with this page](mailto:c@eskimo.com?Subject=Problem%20with%20/eskimo/blog/archive/2002-04.html). Thanks.

</div>

[<img src="../../images/scrollup.gif" data-border="0" width="9" height="11" alt="Return to Top of Page" />](#top)

</div>
