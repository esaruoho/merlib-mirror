---
title: "Linux: Revolution of One"
source_domain: amasci.com
source_path: ~cmkinc/linux.html
order: 2012
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T17:08:27Z
extractor: site_to_paper.py (pandoc)
---

# Linux: Revolution of One

*Source page: `~cmkinc/linux.html`*

**Working With Linux:**

<span style="font-size : 14pt; font-weight : bold; color : #0000FF"> A Revolution of One </span>

------------------------------------------------------------------------

Let me just think about this for a minute. When did it all start? Well, the [Eskimo North](http://www.eskimo.com) Lobby newsgroup certainly had alot to do with it. If there ever was a haven for **"ABM"** *(anything but Microsoft)* rhetoric, it's that place! One day I got fed up with it and fired off a post before I really thought about what I was saying, because a particularly nasty thread had emerged which not only bashed the company and its products, but also implied that users of those products were something less than computer literate. I resented that and let my resentment be known. I also proceeded to be flamed in the Lobby like a shishkabob!

That's okay, I probably deserved it. But a consequence of this was that it set my mind to thinking about this Linux thing. I mean, I knew every screw and jumper of my hardware, having built it myself (with my brother's assistance) and my understanding was that knowing your hardware is half the battle.

Without further ado, please indulge me by allowing me to list the main hardware components in my box:

- **Motherboard/CPU/RAM:** [Amptron](http://www.amptron.com) ATX form factor board ([VIA](http://www.viatech.com) chipset) w/ 1 meg pipeline burst cache, [AMD](http://www.amd.com) K62-300 CPU, 64 meg PC-100 synch DRAM.
- **Video Display Adapters:** [STB](http://www.stb.com) Velocity 128 ([NVidia](http://www.nvidia.com) RIVA 128ZX chipset), 8 meg AGP + STB BlackMagic ([3dfx](http://www.3dfx.com) Voodoo2 chipset), 12 meg PCI.
- **Video Monitor:** [NEC](http://www.nec.com) MultiSync C500.
- **Storage:** 8 gig [Maxtor](http://www.maxtor.com) which dual boots Linux-Win98. Also a 3 gig drive (I forget the brand) that has my Windows NT test setup. Swappable IDE drive tray *(very nice!)*. ATrend 36x IDE CDROM drive.
- **Audio:** [SoundBlaster](http://www.soundblaster.com) AWE-64 Plug-n-Play. Altec Lansing speakers and subwoofer.
- **Modem:** [3com](http://www.3com.com) 56k internal faxmodem.
- **Input Devices:** Microsoft PS/2 Intellimouse and a [Wacom](http://www.wacom.com) ArtPad II tablet+stylus.

Aside from the ego-trip of saying, *"lookie lookie what I got!"* my main reason for listing hardware is to point out that everything you see above works in Linux, and works **well**. That includes the wheel on my mouse (which both scrolls and doubles as a middle mouse button, essential in Linux), my Wacom, and that nasty Plug-n-Play sound card. Starting out, I was afraid that I was going to have to junk a bunch of hardware if I ever wanted to run Linux. As it turns out, the only component I had to replace was my PCI Winmodem, purchased before I knew any better.

I'm going to say this one time: **Do not buy Winmodems!** Most clone shops in the Seattle area use them, and it's hard to find a new PC these days that doesn't have one. Any modem sitting in a PCI slot is a Winmodem, and motherboards come with fewer and fewer ISA slots these days. Mine only has two and they're both occupied (sound and modem). If you want to run Linux you're going to have to break down and buy proper hardware, there's no two ways about it.

As an unsolicited plug, I highly recommend [**Multiwave Technologies**](http://www.mwave.com) out of California if you aren't paranoid about shopping on-line. Their hardware selection is fantastic, as is their customer service. Prices, even with UPS ground shipping, are usually better than anything you can find locally (unless you happen to be an OEM). They don't always have the absolute *lowest* price on the net, but you certainly won't go wrong buying from them.

As long as I'm talking about hardware dealers let me just say that I do like [ComputerStop](http://www.computerstop.com) over in Bellevue. I hear a lot of other people recommend them to others as well. However, you will *never* come close to getting the best possible price over there. Or even a decent price. ComputerStop is good if you need something **now** and don't want to wait for mail order. Just please, please don't make major component purchases there if you can help it. You will pay too much, and you will pay Washington's onerous sales tax. However, it is better than buying from CompUSA. That outfit sucks and everyone knows it so I won't elaborate any further!

Okay, where was I? Ahh yes we're talking about Linux. I did alot of research on the web to find out what I needed to know to get started. My particular situation was that I had my entire 8-gig drive formatted as a single FAT32 partition with Windows98. Should I junk Windows? Sorry, I don't think so... I'm not *that* brave! Besides I put a lot of effort installing stuff and optimizing my Win98 system (sure, it crashes every once in a while but for some reason I don't have the frequent crash problems I read about all the time). I had about four gigs filled, and could not forsee needing the whole rest of the drive for Windows. So I decided to give it one more gig to play and somehow free up the last 3 gigs for Linux. How did I manage that with an already-formatted partition? Two words: [PartitionMagic](http://www.powerquest.com/partitionmagic/index.html). Actually I guess that's one word. There are other utilities available that do non-destructive repartitioning of your hard drive, PM is just what I used because I had it available. Note also that I only used it to create 3 gigs of free space at the end of the drive. The process of installing Linux should give you the opportunity to whittle that down further and format your ext2 and swap partitions, using something like Linux fdisk, cfdisk, or disk druid (the latter being a RedHat thing).

Now I'm still relatively new to Linux, so I don't want to get into a bunch of distribution pros and cons. I've found that Linux users are almost fanatically loyal to the distribution they use, and think that everything else sucks. Here too, I did a bit of research. [RedHat](http://www.redhat.com) *(a.k.a. RatHead a.k.a. DeadRat)* is probably the best-known and most widely-used distribution. It's also the most expensive to buy, with the newest release 6.0 weighing in at a whopping \$80.00 U.S. retail. I'll add links to some of the other distributions another time (you can always find them at [linux.org](http://www.linux.org) - why beat a dead horse?). A few things I read both in print and on the web made me zero in on [Debian GNU/Linux](http://www.debian.org), and it turned out to be the distribution that I settled on. Let me say this right now: **you will not go wrong with Debian!** It's taken a bit of effort to learn (and make no mistake, you *will* learn Linux if you go with Debian), but now four months later I just can't leave it alone! I'm hooked. I'm a junkie. *Thanks alot, Eskimo!* Ahem... Another side benefit is that if you happen to go into a Linux IRC channel, say on Undernet or Dalnet, you won't be disrespected if you're running Debian. It's like flipping off the Pope, or something. RedHat or Slackware, well, you're kinda on your own.

***To be continued...***

**\[ [Home](index.htm) \]**
