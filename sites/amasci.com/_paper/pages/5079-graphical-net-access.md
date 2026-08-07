---
title: "Graphical Net Access"
source_domain: amasci.com
source_path: ~millerd/tiamacinfo.html
order: 5079
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T17:12:03Z
extractor: site_to_paper.py (pandoc)
---

# Graphical Net Access

*Source page: `~millerd/tiamacinfo.html`*

Navigating the Internet can be a difficult task using text based tools, even for those familiar with Unix. Wouldn't it be great to use the wonderful graphical interface of the Macintosh to access the net? Well, you can. Point-and-click applications are available for things like email, World Wide Web browsing, and Usenet news. These used to only be available to those with direct gateways to the net, or with expensive dialup SLIP connections. Now there is a program called [TIA](http://marketplace.com/tia/tiahome.html) that gives you the advantages of SLIP using a dialup connection to a regular Unix system.

## What you need

On your mac you need MacTCP and InterSLIP (or any other SLIP package). You also need a "client" program for each of the things you want to do. There are often multiple programs available that do essentially the same thing, just like there are different word processors available. For example, there are different kinds of Usenet news readers, with slightly different implementations. I use MacWeb to access the WWW, Eudora for email, and NewsWatcher for news.

You also need a script for dialing into your service provider. I've uploaded scripts that work for Eskimo North users. Check out my [home page](http://www.eskimo.com/~millerd/) for a link to this. It also contains configuration instructions for MacTCP and InterSLIP. These will *only* work for Eskimo users, although they can be tailored for other systems. Here's a [direct link](ftp://ftp.eskimo.com/u/m/millerd/DavesLatestTIAScripts.sit.hqx) to the scripts.

## Where to get these programs

MacTCP is commercial. It's also included in System 7.5. The cheapest way to buy it is by getting Adam Engst's book, The Internet Starter Kit for Macintosh. The disk that comes with the book includes MacTCP. This can sometimes be found at the local Costco for \$16.99. It's a deal even if you already have MacTCP. It has useful information on configuring some of the client programs.

Most of the other programs, including InterSLIP, are freeware, available from the [major sites](http://rever.nmsu.edu/~elharo/faq/software.html).

## TIA & Eskimo North

TIA is the software that runs on the unix host system to emulate a SLIP connection. You do not need to purchase a copy (assuming you have an Eskimo id). Eskimo North owns a site license. Other sysops consider banning TIA, and ours embraces it. I love this place!

To manually run TIA, you login with a terminal emulator, then type "tia" at the unix command line. You then quit the terminal emulator and start InterSLIP, and hit connect (with the dialing and gateway settings as "direct"). The dialing and gateway scripts do all of this automatically.

## SLiRP

SLiRP is another program that is similar to TIA. It was recently installed on Eskimo. The staff here says that it's more stable than TIA, and puts less of a load on the host. Things may change with the next release of TIA, but for now, it's recommended that you try using SLiRP first. My package of scripts includes options for either TIA or SLiRP.

## Other options

PPP can also be used for connecting to Eskimo. SLiRP supports PPP, as does the latest beta of TIA. To use this, you need MacPPP rather than InterSLIP, and it is configured different than InterSLIP. If you wish to try this, Nick Zitzman has developed instructions for connecting with MacPPP. [Click here](http://www.eskimo.com/~nickzman/MacnSLiRPPP.html) to see these. I recommend trying out MacPPP if you have significant troubles getting SLIP to work, or if you can't get the performance you expect with SLIP.

If you have trouble with my scripts, Nick also has another set of similar, but slightly different scripts. You could always check those out. They are at <ftp://ftp.eskimo.com/u/o/onenet/eskimo_InterSLIP_Scripts.sea.bin>.

------------------------------------------------------------------------

Updated Aug 15, 1995\
Dave Miller\
<millerd@eskimo.com>
