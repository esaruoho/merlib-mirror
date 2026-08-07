---
title: "C.M. Connelly: Blog: Archive for May, 2002"
source_domain: amasci.com
source_path: ~c/blog/archive/2002-05.html
order: 1778
reachable_from_entry: false
images: 35
internal_links: 43
extracted: 2026-08-07T17:08:07Z
extractor: site_to_paper.py (pandoc)
---

# C.M. Connelly: Blog: Archive for May, 2002

*Source page: `~c/blog/archive/2002-05.html`*

<span id="top"> </span>

<div id="navbar">

<a href="../index.html" class="navbar">Blog</a> \| <a href="../../debian/index.html" class="navbar">Debian</a> \| <a href="../../work/index.html" class="navbar">Work</a> \| <a href="../../work/resume/index.html" class="navbar">Résumé</a> \| <a href="../../about/index.html" class="navbar">About...</a>

</div>

<div id="header">

[<img src="../../images/logo-light.png" data-border="0" width="200" height="85" alt="Link to Home" />](../../index.html)

# Blog: Archive for May, 2002

</div>

<div id="content">

<div id="wrapper">

<div id="blogentries">

<div class="day">

## May 1, 2002 (Wed)

<div class="entry">

<span id="entry:01-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:01-1)Looks like there's a new [Ruby](http://216.122.251.79/Merchant2/merchant.mv?Screen=CTGY&Store_Code=ZF&Category_Code=RG) adventure. [Meatball's E-musings](http://www.zbs.org/html/emusing.html) has an excerpt from the script.

</div>

</div>

<div class="day">

## May 2, 2002 (Thu)

<div class="entry">

<span id="entry:02-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:02-1)Sometimes your computer is just running too smoothly. At that point, you need to mess around with its guts in order to introduce some chaos.

After 81 days of uptime, diziet was eligible.

I stopped running Mac OS (8) more than occasionally on diziet shortly after we installed Linux on it. Since getting a new G4 with Mac OS X, we never ran Mac OS. Meanwhile, my Linux partitions have been getting tighter and tighter, and I've had an extra 1.2 GB drive holding Mac files I never refer to in the machine. I decided to wipe that drive, repartition it, and use it for Linux.

I rebooted into Mac OS, mounted one of the drives from perosteck over AppleTalk, and used Disk Copy to create disk images of the two volumes on the target drive. Then I burned those images onto CD-ROMs.

With that, I could wipe the data with impunity. Unfortunately, I decided to do so from Linux, which (at least on PowerPC) has incredibly primitive partitioning tools. Everything went fine, except that I foolishly wiped the Mac drivers from the drive. (You did know that, for some unknown but no doubt bizarre reason, Apple decided to require SCSI drives to have special driver software installed on them, right?)

From Linux, everything was fine, but when I decided to reboot into single-user mode in order to copy some files, chaos erupted.

You see, without those Apple drivers, the Mac could no longer deal with the drive. Rather than simply ignoring it, or maybe treating it as a blank drive that was eligible for formatting, which is what I expected, it just locked up. The machine would turn on, chime, and then display a grey screen. Nothing more.

I ended up taking the machine almost completely apart to debug the problem. That, of course, also meant removing it from the CPU holder slung under the desk (with the concomitant requirement of crashing my head against the desk's rails). I disconnected and reconnected all of the drives in the system, which involved sticking my hands into tiny spaces lined with sharp edges in order to plug and unplug SCSI, power, and audio cables. I discovered that removing the one drive would allow the system to work, but that it wouldn't boot with that drive attached at all, even if I changed the SCSI address to make it come far after the boot disk. I decided that I would probably need to completely wipe the disk by attaching it to a more sensible machine (one that didn't need “drivers” on a SCSI disk) in order to make it work again.

Then M came home, and wanted to try some other ideas. She thought that if we got the machine to boot, then powered up the drive, it might be possible to fix it. It wasn't. After an hour or so, I suggested my idea again, and it worked. So, after pretty much an entire day, the machine is back where it was, except that I have an extra 1.2 GB to use in some way. Now I have to figure out the best way to allocate that space.

I just love computers.

(Actually, the most impressive thing about the whole experience is that I never really got mad. I *knew* that tinkering with the machine was likely to cause problems, and while I would have been pleasantly surprised to have it work right off the bat, I wasn't terribly shocked when it didn't. I did get mad at M, but mostly because she refused to believe me when I told her about some of the things I'd tried and what I thought we'd need to do to get things working again.)

</div>

</div>

<div class="day">

## May 3, 2002 (Fri)

<div class="entry">

<span id="entry:03-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:03-1)As long as I was breaking computers, I decided to fix the network problem that suddenly appeared on M's Red Hat machine. The machine has two network cards because it used to be our firewall (before we moved to the States, and acquired some new computers without 10-Base-2 connectors)—we have one of those fancy router/switches now), and the operating system had decided to use the wrong card.

In the process, an IBM drive—a warranty replacement for one that failed—started acting up, preventing the machine from rebooting. I unplugged its power connector, fixed the network problem, and left it for a bit. Later, I tried plugging it back in, and the machine worked fine.

</div>

<div class="entry">

<span id="entry:03-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:03-2)Miracle of miracles, the grocery stores actually had the stuff we wanted, even though it was Friday evening.

</div>

<div class="entry">

<span id="entry:03-3"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:03-3)After a number of calls to amazon.com, we supposedly got the order for my birthday sorted. They'd sent me a 10% off code, but their computers were completely hosed when we tried to place the order Thursday night, so they'd decided I'd already used it.

</div>

</div>

<div class="day">

## May 4, 2002 (Sat)

<div class="entry">

<span id="entry:04-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:04-1)Did pretty much nothing today, except watch programs from the Tivo (placating the Tivo gods) and doing an edit on M's Clinic team's final report.

</div>

</div>

<div class="day">

## May 5, 2002 (Sun)

<div class="entry">

<span id="entry:05-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:05-1)Finally dumped the last two programs for B & J onto a videotape, allowing us to delete them from the Tivo. (Both the programs dated back to late November or early December!)

</div>

</div>

<div class="day">

## May 6, 2002 (Mon)

<div class="entry">

<span id="entry:06-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:06-1)That [IBM drive](#entry:03-1) is back to occasionally making those ominous “chik-chik-chik” sounds...

</div>

<div class="entry">

<span id="entry:06-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:06-2)Wow, today is George Clooney's, Tony Blair's, and Bob Seger's birthday, too.

</div>

<div class="entry">

<span id="entry:06-3"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:06-3)As usual, Amazon screwed us. M ordered The Matrix in addition to the stuff for me, and we even *paid for shipping*, but they waited all weekend before saying there was a problem. Given that they're not going to get the damn thing here anywhere close to my birthday anyway, I switched it to free shipping.

Clearly the message here is that you should never, ever, buy anything from Amazon that you want any time soon.

</div>

<div class="entry">

<span id="entry:06-4"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:06-4)I think I'm going to go back to bed now.

</div>

</div>

<div class="day">

## May 7, 2002 (Tue)

<div class="entry">

<span id="entry:07-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:07-1)A hearty “Good morning!” from the Los Angeles Police Department—M was in the kitchen while I was checking my mail. She called me out to the kitchen. “Listen to this!” she said.

Through the hood over the stove, we could hear an airplane-like noise. M told me that earlier she'd heard some radio-like sounds—“*bzzt* Mm-hum-bum, um rumm-ta-tum”. Then *I* heard it! “Step out of the car and put your hands on your head. Immediately!”

Opening the sliding glass door, I could hear the beating of the helicopter and the radio voice. Not long after, the voice stopped, but the helicopter kept swooping back and forth, just on the wrong side of the building so we couldn't actually see what was happening. Nothing on any of the local television channels or the NPR station we listen to, either.

Just another exciting morning in Los Angeles County, I guess. America is such a great country!

</div>

<div class="entry">

<span id="entry:07-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:07-2)Apparently whoever they were chasing got away.

</div>

</div>

<div class="day">

## May 8, 2002 (Wed)

<div class="entry">

<span id="entry:08-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:08-1)I never noticed [this marker](http://news.bbc.co.uk/hi/english/world/americas/newsid_1970000/1970969.stm) in the Peace Arch Park, but I only walked around there once.

This country amazes me. The slave states seceded from the Union, fought a vicious war to maintain slavery, lost, surrendered, but never really admitted they lost.

</div>

</div>

<div class="day">

## May 9, 2002 (Thu)

<div class="entry">

<span id="entry:09-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:09-1)Job interview today. I hope everything goes well.

</div>

<div class="entry">

<span id="entry:09-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:09-2)NPR had a story on Richard Ankrom, who added useful directions (!) to a Caltrans sign on the Harbor Freeway as a guerrilla public art project. Apparently he (along with thousands of others, no doubt) kept getting caught out by the fact that the exit in question is a single lane exit on the left, appearing suddenly after the Harbor Freeway has passed through four tunnels. If you're not in the right lane, too bad. So he did some research, put together a U.S. 5 shield, an arrow for pointing at the lane, and the word “NORTH”, all to Caltrans standards, down to paint colors and reflector placement, and installed the sign, which went unnoticed by Caltrans until this week.

The [L.A. Times story](http://www.latimes.com/news/local/la-050902artist.story) has pictures!

The L.A. Weekly has [more details](http://www.laweekly.com/ink/02/25/a.shtml).

Caltrans is apparently in the process of redoing the signage for the whole state, and will probably remove Ankrom's helpful addition when they get to the 110. Maybe they'll include the information on their replacement signs, maybe they won't.

</div>

</div>

<div class="day">

## May 10, 2002 (Fri)

<div class="entry">

<span id="entry:10-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:10-1)My [<span class="abbr" title="Canon PowerShot S40">new camera</span>](http://www.powershot.com/powershot2/s40-30/) arrived. Now all I have to do is figure out how to use it....

You've gotta love the way UPS thinks nothing of leaving a package worth hundreds of dollars on your doorstep, with no signature....

</div>

</div>

<div class="day">

## May 14, 2002 (Tue)

<div class="entry">

<span id="entry:14-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:14-1)I've finished reading Christine Finn's Artifacts: An Archaeologist's Year in Silicon Valley, which was one of the books that Biella mentioned during my interview.

It was a fairly superficial, if occasionally interesting, look at things in what she calls “SiVa”, and I generally refer to as “Silly Valley”. There's no doubt that the world she was visiting was considerably different from the one that I (and the people I knew) lived in—I never really knew any people much like the handful of poor people she talked to, although I was generally aware of their existence (and not happy about it), especially when I lived in the Mission District.

I also never knew any of the high flyers—I've never been in Larry Ellison's house, or even seen it from the street. Never eaten at Bucks, or any of the other power restaurants she mentions. Never managed to make it to The Tech (although I did spend quite a bit of time at SFMOMA, and hit the San Jose Museum of Art once). Never did get a chance to race my Porsche.

But there were some intersections, and in those cases I was glad to see that her experiences and thoughts about those experiences often meshed well with my own.

A friend lived in an apartment complex near the cherry orchard on Mathilda; I often drove past it. I, too, enjoyed the train ride skirting along the Bay's estuaries and through San Jose's back yards. Fry's was much less pleasant and more amusing than she made it out to be.

Finn's book is very disjointed. Rather than a serious scholarly work addressing the material culture of the computer world and positing a strong thesis, it's a series of vignettes about people, places, and things in what has become Silicon Valley. That's not necessarily a bad thing, but it does make the book a bit uneven—some chapters bring up archaeological and anthropological theories, some don't.

</div>

</div>

<div class="day">

## May 15, 2002 (Wed)

<div class="entry">

<span id="entry:15-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:15-1)I'm sort of reading, sort of skimming Rosemary Coombe's The Cultural Life of Intellectual Properties, which has some interesting stuff mixed in with a huge amount of pomo gibberish.

Reading this book reminds me of one of the major reasons I didn't pursue graduate study in anthropology. (I can't write that way, thankfully.)

</div>

</div>

<div class="day">

## May 17, 2002 (Fri)

<div class="entry">

<span id="entry:17-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:17-1)M skived out early, and we went for a drive with the vague intention of getting some more [Marmite](2002-01.html#entry:24-1). We ended up at the Ontario Mills mall, where we bought a variety of wacky foodstuffs (South African Cadbury chocolate bars, Marmite, exotic potato chips, and double-chocolate stout), a pillow for the bathtub, and a stack of books:

- Karen Joy Fowler—Sister Noon
- Adrian Fruitiger—Signs and Symbols: Their Design and Meaning
- Neil Gaiman—American Gods
- Peter Høeg—Tales of the Night
- Maureen McHugh—Mission Child

I'm not sure, but I think that taking Foothill instead of “the 10” is faster (and safer). There's certainly way less traffic, and it seems to move more quickly.

</div>

</div>

<div class="day">

## May 18, 2002 (Sat)

<div class="entry">

<span id="entry:18-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:18-1)[Slashdot](http://slashdot.org/) has [an article](http://slashdot.org/article.pl?sid=02/05/18/0320244&mode=nested&tid=99) about <span class="abbr" title="North American Aerospace Defense
Command">NORAD</span> considering the deployment of airships along Canada's northern coast and North America's west coast.

Of course the Slashdot poster said “zeppelins”, but you can almost forgive him, because the [original article](http://seattlepi.nwsource.com/local/70823_dirigibles17.shtml) in the Seattle Post-Intelligencer (emphasis on the *Post*) goes on and on about dirigibles before finally quoting a spokesman for Lockheed-Martin, who makes it very clear that the airships in question will be semi-rigid—a rigid structure to hold surveillance gear and engines, the rest more like a blimp.

Still, the prospect of seeing more airships in the sky looks good, even if they are flying surveillance platforms. (I've seen a couple of ad blimps in the area—once when we were at the Ontario Mills mall, and once when we were landing at Ontario airport on our way back from the UK.)

\[If the Post-Intelligencer writer reads this piece—NORAD is not the “U.S. North American Air Defense Command”. NORAD is a joint Canadian–U.S. organization. Not only that, but NORAD has stood for “North American *Aerospace* Defense Command” since 1981, when its mission was revised and expanded.\]

</div>

<div class="entry">

<span id="entry:18-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:18-2)*“I was looking for a job, and then I found a job / And heaven knows, I'm miserable now...”*

Had I mentioned that I got that [job I applied for](#entry:09-1)? Well, I did. So now I'm busy reading up (and thinking about) on all sorts of topics I'll soon be immersed in, although I'm doing so without a lot of guidance, as I haven't actually started yet.

(What sort of topics? Oh, distributions, remote management, keeping systems up-to-date, making installing new systems easy, what kind of machine(s) I want for myself, Beowulf clusters, building a web portal—you know the sort of thing.)

I'm actually really looking forward to getting started. I'll be directly supporting a group of relatively sophisticated users that's an order of magnitude smaller than the group I last supported. There's the students to think of, too, of course, but I suspect that the kinds of support most students will need will be fairly basic, plus I will have a staff of part-time students to help out with everything.

I think (hope) that I'll be able to get a handle on things reasonably quickly, get things working the way I prefer, and eventually have time to spend working on open-source projects (notably [Debian GNU/Linux](http://www.debian.org/), of course) as well as starting interesting new projects at work.

</div>

<div class="entry">

<span id="entry:18-3"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:18-3)Meanwhile, M is off doing her faculty duties by appearing at the CS department's reception. Tomorrow she'll sport her robes at the graduation ceremony. She's a bit less engaged in the whole process than she might be because she's been teaching an introductory course, which means that she doesn't really know very many students who are graduating (although there are a few from her clinic group).

</div>

</div>

<div class="day">

## May 19, 2002 (Sun)

<div class="entry">

<span id="entry:19-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:19-1)Started work today. I think it's going to be fun, once we get some details worked out. My office even has windows (not the kind from Redmond), which was a very pleasant surprise.

Now all I have to do is make it habitable, get some keys so I can get to it without asking a high-level muckety-muck for a key, and get a computer set up and working.

</div>

<div class="entry">

<span id="entry:19-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:19-2)TiVo [placates advertisers](http://www.tivo.com/news/pr_detail.asp?article=139&frames=no) with an annoying new form of “branded advertainment” (feel the evil). Yes, we now have a new menu item in our TiVo Central menu that allows us to watch a Sheryl Crow video/ad and two other ads for Best Buy. And this advertising material is recorded on the hard disk in our TiVo (albeit in “reserved space”, so it supposedly isn't costing us anything in recording time). Oh, yes, and they can tell when you watch these things, how many times you watch them, and so forth, and report that information back to their advertisers. I am *so* thrilled.

</div>

</div>

<div class="day">

## May 24, 2002 (Fri)

<div class="entry">

<span id="entry:24-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:24-1)More fun at work. Actually, really mostly fun, except that after lunch (half a ham sandwich from Wolfe's, with about a third of a Sobe Zen Blend tea and a third of a small bag of Fritos (which I haven't had for years)), I got extremely sick and had to leave early. Stomach cramps and pain and weakness, oh my.

I suspect the tea (and have vague memories of a similar incident in Vancouver), but it could have been related to anything, although M didn't get sick eating the other half of the sandwich.

</div>

</div>

<div class="day">

## May 25, 2002 (Sat)

<div class="entry">

<span id="entry:25-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:25-1)Alarums and excursions! Or at least excursions.

M's office is painted, which means that it's nearly ready for her to move into. Alas, she never quite nailed down that furniture order.

A year ago, we'd been thinking of getting her some Effectiv office furniture from Ikea, which looks pretty good, is very adjustable (height-wise), and is fairly cheap. Folks looked askance at her for considering Ikea furniture (too cheap?), but she still thought it was a good idea until earlier this year, when we noticed the way that the relatively thin veneer on the Effectiv desk we have at home has been chewed up by dragging the G4 around on its surface. (Some very noticeable indentations, by feel or raking light.)

So, back to square one. At least one of the other folks has furniture from a place called [Alan Desk](http://www.alandesk.com/), which is pretty nice. We looked at their website, which is a bit sparse on details, and I suggested that we just go there.

So we did.

Alan Desk is in Culver City, about forty miles away. Following the route suggested by their chosen map provider (Yahoo Maps, I think), we went from the 210 to the 605 to the something else to the 10 before getting off in Culver City, driving across Venice Boulevard instead of turning (which was okay as we would have turned in the wrong direction), getting back onto Venice, driving past the area it should have been in without seeing it, turning left and then around a partial block to get back onto Venice in the other direction (U-turns? Not in *this* town!), finding a parking space and parallel parking (one of my very least favorite things to do), and walking about a block to find the store, set back from the street by a small parking lot with plenty of spaces. Oh, well.

Inside, lots of office furniture. Modern, old fashioned, glass, leather, wood. We talked to a designer and she suggested two lines, one which was pretty much what the other faculty member had, and that looked nice but wasn't terribly adjustable and one Danish line that featured electrically-powered sit-stand desks. Because neither of us has ever had a good experience with one of those articulating keyboard trays, we tend to favor expansive desks that can be height-adjusted so that we can type and mouse without having to worry about ramming our knees into a keyboard tray or swivelling one out of the way so that we can write.

The Danish line, from a company called [Dencon](http://www.dencon.dk/uk/), clearly won the day. Specifically, their [Cappa](http://www.dencon.dk/uk/cappa/) line, which is clean and modern, while (compared to the rest of the furniture on offer) isn't really that outrageously priced. (Which isn't to say it *isn't* outrageously priced—like all furniture these days, quality has declined precipitously, as we've gone from handcrafted solid wood to machine-milled laminate, while price has skyrocketed. But for what you get, it's bearable.)

Afterwards, because we were practically there, I suggested we head down Venice to the beach, where we could see the ocean, then swing back through Hollywood before finding our way onto a freeway and driving home. Which is what we did.

Venice was crowded, but we somehow managed to find a really good parking space (right across a set of stairs to the beach, next to a driveway so that I could pull in without having to parallel park, with almost an hour on the meter), went down to the beach, and walked down to the Santa Monica Pier. We couldn't really spend any time there, as we had to get back (we probably should have put more than just one additional quarter (worth 15 minutes) in the meter, but I think we may have only had the one), but we got the flavor. We had a bit of a time finding the car again, as I'd confidently led us up to the street my mother and I had parked on a few months ago, which turned out not to be the street we'd parked on this time, but did so with five minutes left on the meter and drove off for Hollywood.

Still in Santa Monica, we stopped for a light in front of a stepped building that I think is the offices of Wolfram & Hart in Angel.

On along Santa Monica Boulevard, though Beverly Hills, Westwood, and West Hollywood. We turned up Vine, missing Hollywood's tourist mecca, and M guided us up into Griffith Park, to Griffith Observatory (which we drove around, as there was some sort of concert scheduled, so they weren't letting people park in the lot), down again and through the famous tunnel from, among other movies, Who Framed Roger Rabbit? and Back to the Future. Eventually we found our way onto the 5, back to the 210, and back to Claremont, where we made a much-needed stop at a Targét before heading to the Village for dinner.

We sampled another of Claremont's many restaurants, and were less than impressed. The Harvard Square Café is ostensibly a French restaurant. It's pricey, and, while the food is good (if unhealthy), basics like salads are extra, as, apparently, is service. We were there for about two hours, altogether, with agonizingly long waits for our waitress to notice that we'd eaten both (!) of the rolls they'd provided, that we needed more water, and, of course, for the food to arrive. Each time we were noticed, she stuck around long enough to do what had to be done, and no longer. Once we'd eaten, she took a long time to notice, to ask if we wanted anything else, to bring us the check, to pick up our payment, and to bring back the credit card slip. We won't be rushing back. Ever.

</div>

</div>

<div class="day">

## May 26, 2002 (Sun)

<div class="entry">

<span id="entry:26-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:26-1)If you're a Linux user and you're looking for project-management software, you might want to take a look at [MrProject](), which seems to be a pretty capable substitute for Microsoft Project. It uses GNOME, and looks pretty slick. I don't know if it can read or write Microsoft (MS?) Project files or not, but it does a pretty good job with the general appearance.

</div>

<div class="entry">

<span id="entry:26-2"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:26-2)I'm sorting through a couple of dozen e-mail messages from Thomas Esser about the changes he'd making to teTeX (and that Sebastian Rahtz is making to TeX Live) based in part on the license survey I started a couple of months ago. By and large, they're following my conclusions, although the threat of being excluded from teTeX and TeX Live (which should have been finalized by now) was enough to spur some authors to change their licenses so that their packages will remain in teTeX. Thomas has also apparently had better luck reaching some people in Europe than I had, so that some packages I've already removed from Debian's teTeX may make it back in, as well, including `booktabs`, which is one of my favorite packages. (It provides commands for formatting tables so that they look like the tables defined by The Chicago Manual of Style, rather than the tableaus so popular with LaTeX authors who don't know any better.)

</div>

<div class="entry">

<span id="entry:26-3"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:26-3)I'm thinking it probably was the tea, although probably in some synergetic combination with the other things I ate, the heat, and maybe some other mystic forces. In any case, I don't think I'll risk it again in the future.

</div>

<div class="entry">

<span id="entry:26-4"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:26-4)*Why computers are mysterious, scary things for most of the population (and frustrating for the rest of us, as well).*

So M wrote this cool package that allows us to use multiple-master fonts with TeX. When she originally wrote it, it lived in her home directory on her NeXTstation. I accessed the relevant scripts using automount, which mounted her machine's disk on my machine over NFS when necessary. On 2000 June 10, I created a symbolic link to the main file involved (a replacement for the `mktextfm` program) in my `~/bin/` directory.

When we moved to Claremont, she decided to take her NeXTstation to work, so I modified my setup to mount a *copy* of her machine's drive on our PC by changing the `/etc/auto.localnet` file on my machine.

Then the PC had both its hard drives fail (amazingly, under warranty) in close succession. By this time, we'd copied the files from her NeXTstation to our new G4. I modified my machine to mount that image instead.

The last time I tinkered with `/etc/auto.localnet` was 2002 February 4. At some point before then I had added entries so I could NFS mount the G4's disks, and had added the `noexec` option so that I couldn't accidentally run a Mach-O binary on my ELF machine. Which was stupid, because if you actually do try to run such a binary, you get an “Exec format error” and nothing else untoward happens.

Anyway, about halfway through April, I started working on my own letterhead for TeX. At some point I was having problems generating TFMs, and we figured out that I was using an ancient version of M's `mktextfm` script (I had a symbolic link, remember?). So on 2002 April 24 I changed the name of the link so it wouldn't be called, changed a bunch of environment variables her code used, and, presumably, should have done something so that the correct script would be called. But I didn't. So long as I was only TeXing files that we'd generated TFMs for, things kept working.

[Then I decided to add more disk space to my machine](#entry:01-1), which involved rebooting the computer (many times). Things now changed, but because everything I've TeXed since then used fonts that had already been generated, everything continued to work until today, when I tried to TeX a document that used a new size of a font in a header and called `mktextfm`. Of course it called the system's `mktextfm`, which doesn't know anything about multiple-master fonts, and blew up.

Poking around, I found that I wasn't using the right `mktextfm`, and modified my `PATH` to include M's directory where the script lives. But it wouldn't run, giving an especially fun error:

> ` sh: /Net/perosteck/Users/melissa/Projects/FontKit/bin/mktextfm: /usr/bin/perl: bad interpreter: Permission denied `

The problem here is that `noexec` NFS option, which stops executables from that file system from running on my machine.

So we can see how a problem that was originally set up by changes made months earlier can suddenly appear with no obviously relevant changes having been made to the computers involved for months.

</div>

</div>

<div class="day">

## May 27, 2002 (Mon)

<div class="entry">

<span id="entry:27-1"></span>[<img src="../../images/links.gif" class="permalink" data-border="0" width="21" height="29" alt="permanent link" />](2002-05.html#day:27-1)Today I'm working on a document that explains the current state of things at work and suggests some plans for the immediate and distant future. I think that it will more than make up for the three hours I missed on Friday.

</div>

</div>

[newer entries](2002-06.html) \| [older entries](2002-04.html)

</div>

</div>

<div id="sidebar">

<div style="display: none;">

 

</div>

## Activity

<table id="calendar" data-summary="calendar">
<thead>
<tr>
<th><a href="2002-04.html" title="Back to April, 2002">&lt;&lt;</a></th>
<th colspan="5">May, 2002</th>
<th><a href="2002-06.html" title="On to June, 2002">&gt;&gt;</a></th>
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
<td><a href="#day:01" title="Entry for 2002-05-01">1</a></td>
<td><a href="#day:02" title="Entry for 2002-05-02">2</a></td>
<td><a href="#day:03" title="Entry for 2002-05-03">3</a></td>
<td><a href="#day:04" title="Entry for 2002-05-04">4</a></td>
<td><a href="#day:05" title="Entry for 2002-05-05">5</a></td>
</tr>
<tr>
<td><a href="#day:06" title="Entry for 2002-05-06">6</a></td>
<td><a href="#day:07" title="Entry for 2002-05-07">7</a></td>
<td><a href="#day:08" title="Entry for 2002-05-08">8</a></td>
<td><a href="#day:09" title="Entry for 2002-05-09">9</a></td>
<td><a href="#day:10" title="Entry for 2002-05-10">10</a></td>
<td>11</td>
<td>12</td>
</tr>
<tr>
<td>13</td>
<td><a href="#day:14" title="Entry for 2002-05-14">14</a></td>
<td><a href="#day:15" title="Entry for 2002-05-15">15</a></td>
<td>16</td>
<td><a href="#day:17" title="Entry for 2002-05-17">17</a></td>
<td><a href="#day:18" title="Entry for 2002-05-18">18</a></td>
<td><a href="#day:19" title="Entry for 2002-05-19">19</a></td>
</tr>
<tr>
<td>20</td>
<td>21</td>
<td>22</td>
<td>23</td>
<td><a href="#day:24" title="Entry for 2002-05-24">24</a></td>
<td><a href="#day:25" title="Entry for 2002-05-25">25</a></td>
<td><a href="#day:26" title="Entry for 2002-05-26">26</a></td>
</tr>
<tr>
<td><a href="#day:27" title="Entry for 2002-05-27">27</a></td>
<td>28</td>
<td>29</td>
<td>30</td>
<td>31</td>
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
<a href="2002-04.html" class="archlink">April, 2002</a>\
[more...](./)

</div>

<div id="footer">

[<img src="../../images/Valid_XHTML10.png" data-border="0" width="88" height="31" alt="Valid XHTML 1.0!" />](http://validator.w3.org/check?uri=http://www.eskimo.com/~c/blog/archive/2002-05.html;ss)

Copyright © 1998–2002, C.M. Connelly.

Last modified at 12:24 AM PDT, Sunday, September 8, 2002; last rendered at 12:24 AM PDT, Sunday, September 8, 2002 with [Mason](http://www.masonhq.com/) and [Perl](http://www.perl.org/).

Please [e-mail me about problems with this page](mailto:c@eskimo.com?Subject=Problem%20with%20/eskimo/blog/archive/2002-05.html). Thanks.

</div>

[<img src="../../images/scrollup.gif" data-border="0" width="9" height="11" alt="Return to Top of Page" />](#top)

</div>
