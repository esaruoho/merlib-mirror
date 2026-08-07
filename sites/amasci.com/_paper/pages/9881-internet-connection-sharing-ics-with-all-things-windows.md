---
title: "Internet Connection Sharing (ICS) With All Things Windows"
source_domain: amasci.com
source_path: ~webguy/service/ics.html
order: 9881
reachable_from_entry: false
images: 1
internal_links: 7
extracted: 2026-08-07T17:18:13Z
extractor: site_to_paper.py (pandoc)
---

# Internet Connection Sharing (ICS) With All Things Windows

*Source page: `~webguy/service/ics.html`*

<table width="80%">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td><h2 id="internet-connection-sharing-with-all-things-windows">Internet Connection Sharing With All Things Windows</h2>
<a href="../writings/reply.html">Al Wong</a><br />
May 10, 2003
<p><strong>12/12/03 Update</strong> - There appears to be a great deal of interest on this subject! Due to the popularity of this particular webpage (it's in the top five!), I've decided to expand on the information given here previously. There are now separate links to each version of Windows explaining in detail how I connected that particular version to my network. I include several more related links to networking. There is more information about the WinXP server firewall. I also include a <em>Common Problems</em> section at the bottom. This is my Christmas present to the Web. Merry Christmas!</p>
<p>There is so much interest in this subject, I want to let people know <a href="mailto:bigdaddy256@hotmail.com?subject=&#39;Customer%20Needs%20Network%20Help&#39;"><strong>I am available for hire</strong></a> if you need help in setting up your network. I also have a wide variety of useful computer skills in programming and setting up webpages. <a href="mailto:bigdaddy256@hotmail.com?subject=&#39;Customer%20Needs%20Network%20Help&#39;">Contact me.</a></p>
<p>This is my experience setting up an <a href="ethernet.html">ethernet</a> Local Area Network (LAN) with the extra interesting feature of Internet Connection Sharing (ICS) of a <strong>dialup line!</strong> I hope this description can help other people with the same or similar problem. I am sure I am not the only person in this situation.</p>
<p>I had been wanting to do this for quite a while but did not have the time until now. I have many files spread out between several computers and wanted to consolidate them together. Transferring files back and forth via <em>sneakerware</em> or <em>infrared</em> is OK but, if the files are large or many, it gets awkward. Also, it would be nice to share the printer and have better access to other devices hanging off my various computers.</p>
<p>Also, prices for <em>wired</em> ethernet components have come down dramatically because of all the <em>wireless</em> stuff out there. The last time I put together a LAN was in 1992 when network cards were about $200 each. Now they are about $20 each. I am using the <a href="http://www.dlink.com/">D-Link</a> LAN cards (<a href="http://support.dlink.com/Products/view.asp?productid=DFE-690TXD">DFE-690TXD</a>), <a href="http://www.3com.com/index2.html">3Com</a> LAN cards (3CXE589DT) and the D-Link <a href="ethernet.html">switch</a> box (<a href="http://support.dlink.com/Products/view.asp?productid=dss-5+">DSS-5+</a>).</p>
<p>My LAN consists of several machines with the following versions of Windows. The links give more detailed descriptions on how to set up that particular version of Windows so it works on the LAN:</p>
<ul>
<li><a href="winxp.html">Windows XP</a> (server)</li>
<li><a href="win98.html">Windows 98</a></li>
<li><a href="win311.html">Windows for Workgroups 3.11</a></li>
<li><a href="wince.html">Windows CE 2.00</a></li>
</ul>
<p>According to the Windows XP (WinXP) help, WinXP can support a local network with ICS which can allow the other computers on the network to <em>share</em> the Internet connection from the WinXP computer. This Internet connection can be DSL, cable or <em>dialup!</em> A conceptual diagram of my LAN is below.</p>
<table data-border="0">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td><img src="images/mynetwork.jpg" width="288" height="221" />
<em>This is what my network looks like conceptually<br />
with all computers sharing the dialup line.<br />
The dialup line is in blue.<br />
The ethernet components are in red.</em></td>
</tr>
</tbody>
</table>
<p><strong>So I could share my dialup connection with the computers on my LAN.</strong> I know it would be slow but so what? It would still be neat. <code>:)</code></p>
<p>According to the WinXP help, all you had to do was connect up your network hardware, run the WinXP <em>Network Setup Wizard</em> on each of the computers on the network and then it should all work. The WinXP computer will act as a server to the LAN, doling out IP addresses and sharing the Internet connection. Easy, right?</p>
<p>Well it was <strong>not easy!</strong> After I connected all the machines, cables, adaptors, <a href="ethernet.html">switch</a> box and ran the <em>Network Setup Wizard</em> on the Windows XP and Windows 98 machines, they still would not talk to each other. It seems there's a lot taken for granted and I was getting incomplete and/or bad advice from tech support and various websites.</p>
<p>The people at the Best Buy store (where I bought the D-Link LAN cards and switch box) did not have a clue what I wanted to do (which, I suppose, isn't surprising). They said sharing a dialup could not be done. Tech support at <a href="http://www.dlink.com/">D-Link</a> (the company that made the LAN cards and the switch box) said they did not have any experience in sharing a dialup!? They were more helpful though. At least they pointed me to a few websites that had more information. The websites had incomplete/bad information as well.</p>
<p>What I found most surprising is that, although modems and dialups have existed for years and years (at least the last 30 years), <strong>no one had information or experience on how to share a dialup connection!</strong> However, for DSL, which really has been available commercially only in the last 2-3 years, people had all sorts of information about it! It was very weird.</p>
<p>I went to the websites ( <a href="http://www.wown.com/">www.wown.com,</a> <a href="http://www.practicallynetworked.com/">www.practicallynetworked.com,</a> <a href="http://support.microsoft.com/">support.microsoft.com</a> ) suggested by D-Link tech support. Nothing in those websites said anything about sharing a dialup. The <em>trouble shooter</em> sections were useless. Also, very little was said about the <a href="ethernet.html">hub</a> or <a href="ethernet.html">switch.</a> It was assumed you just plug it in and the network would work. Well, it didn't!</p>
<p>After digging around several other websites ( <a href="http://www.annoyances.org/">www.annoyances.org,</a> <a href="http://www.computing.net/">www.computing.net,</a> <a href="http://www.tek-tips.com/">www.tek-tips.com,</a> <a href="http://www.911networks.com/">www.911networks.com,</a> <a href="http://www.homenethelp.com/">www.homenethelp.com</a> ), I figured it out. <span id="thelist"></span> These are the additional things I had to do to each computer to make them work on the LAN. The general steps are below. The procedure to complete each step below is slightly different depending on the version of Windows. Therefore, see the Windows help for detailed explanations on how-to:</p>
<ol type="1">
<li>Each computer must have a <strong>unique identification name</strong> on the network. So the WinXP server can tell them apart.</li>
<li>Each computer must have the <strong>same group name.</strong> This allows you to share files and resources between machines on the LAN.</li>
<li><p>Each computer must have the <strong>same network account.</strong> You must set up an account just for the network on each machine and they must all have the <strong>exact same username and password.</strong> With one exception, all computers must login to this account in order to be recognized by the LAN.</p>
<p>I would suggest you create a <strong>separate</strong> user account just for the network on each machine. Make the network account on your WinXP server a <strong>limited</strong> account and <strong>not</strong> an administrator account.</p>
<p>Please note the WinXP computer does not need to be logged into the network account at all but this account must exist for the benefit of the other computers on the LAN. All other computers must login to the network account to be recognized by the LAN.</p></li>
<li><p>You need to <strong>disable any third party firewall</strong> software for the LAN, especially on the WinXP server. (I have found <a href="http://www.zonealarm.com/">ZoneAlarm</a> is too efficient for protection even if the LAN IP addresses are in <em>Trusted</em> category and the firewall for <em>Trusted</em> is turned off!) When you set up ICS, the WinXP server runs its own firewall against the Internet (if enabled). Whether this firewall is effective or not remains to be seen.</p>
<p><strong>12/12/03 Update</strong> - It is rumored the WinXP server firewall filters only <strong>incoming</strong> communications and <strong>does not filter outgoing</strong> communications (ZoneAlarm filters both ways). So if you have any spy software installed on your computer, tracking your surfing, you're screwed. The WinXP firewall will <strong>not</strong> prevent any spy/tracking software from sending outgoing details of your activities to unknown computers. Of course, this is not desirable. The only real solution is to delete/disable all spy software before you use the WinXP server firewall. The good news is there are free software available to home users to do this like Ad-Aware and SpyBot. I would also suggest scanning your computer with a good anti-virus program as well.</p>
<p><strong>02/25/04 Update</strong> - It seems the WinXP server firewall filters only incoming communications because the WinXP operating system periodically sends information about your computer back to Microsoft. There is some controversy about this as to the type and quantity of information being sent and personal privacy issues.</p>
<p>Fortunately, the newer version of ZoneAlarm now filters LAN communication correctly if you set it up right. (Enter the LAN IP range of addresses into the Trusted category) Since ZoneAlarm filters both incoming and outgoing communications, I would now suggest disabling the WinXP server firewall and use ZoneAlarm instead on each computer (if possible) on the LAN.</p>
<p><strong>03/18/04 Update</strong> - It seems ZoneAlarm is not reliably letting computers on the LAN access the Internet. So now I have changed my mind again and <strong>suggest you use the WinXP server firewall and not use ZoneAlarm.</strong> It appears ZoneAlarm is too efficient and blocks everything.</p></li>
<li>I also discovered that the WinXP administrator account must be logged in for the ICS to work! The administrator does not need to initiate the dialup connection. In fact, the administrator does not have to be the current active account, just logged in. If the administrator is logged off, the local network works (i.e. you may share files and resources) but not ICS.</li>
</ol>
<p>Microsoft should update their <strong>WinXP Help and Support.</strong> The URLs the <strong>Help</strong> tries to access on the Web are all broken now(!) That was frustrating.</p>
<p>It is preferable the WinXP server boots up first on the LAN as it's the DHCP (Dynamic Host Configuration Protocol) server, which passes out the IP addresses to the machines on the local network.</p>
<p><strong>Common Problems</strong></p>
<ol type="1">
<li><p><strong>Slow file transfer.</strong> Transferring files to a particular Windows 98 (Win98) machine was <strong>very slow.</strong> Transferring a 3.5MB file file took several minutes while transferring the same file to other Win98 machines on the LAN was very fast (about 5 seconds!). The funny thing was the transfer of the file <strong>FROM</strong> this Win98 machine was very fast while tranferring files <strong>TO</strong> this Win98 machine was very slow!</p>
<p>This is a fairly common problem. The answer is you need to enable <em>disk caching</em> on the computer. Each version of Windows has a different way of enabling <em>disk caching</em> so see your Windows help or the <a href="http://support.microsoft.com/">Microsoft support website.</a></p></li>
<li><p><strong>Cannot See Other Computers on LAN.</strong> Your computer on the LAN cannot ping or access shared files on other computers. Other computers cannot see your computer.</p>
<p>There are <strong>many causes</strong> for this. The problem is if you make a tiny error in setting up your network, the whole thing may fail to work properly.</p>
<p>On each computer, make sure the software driver for the network card is properly installed and each computer recognizes the network card is plugged in.</p>
<p>Make sure your network cables are plugged in properly. One end of the cable goes into the network card on your computer. The other end of the cable goes into the hub or switch. You would be surprised.</p>
<p>Does the <em>Network Setup Wizard</em> run on each computer (where appropriate) <strong>without error?</strong></p>
<p>Go through <a href="#thelist">the above list</a> and make sure each computer is set up properly. Does each computer have a unique identification name, the same group name, is logged onto the network, etc. ?</p>
<p>Also, you may need to disable any third party firewall software on the WinXP server. The WinXP server runs it's own firewall against the Internet (if enabled).</p>
<p>Use the <strong>ipconfig</strong> command in the <em>Command Prompt</em> to get the WinXP server to update the LAN IP address on your computer. Use <strong>ipconfig /?</strong> to get help on this command.</p></li>
<li><p><strong>Cannot Share Dialup Connection.</strong> You can share files and resources on the LAN except for the dialup connection.</p>
<p>I have found that the administrator account must be logged in on the WinXP server for the ICS to work. Note the administrator account does not have to be the current active account. The administrator just needs to be logged in.</p>
<p>Also, you may need to disable any third party firewall software on the WinXP server. The WinXP server runs it's own firewall against the Internet (if enabled).</p></li>
</ol>
<p>I am invincible! <code>\o/</code></p></td>
</tr>
</tbody>
</table>

|                                          |
|------------------------------------------|
| [My Writings](../writings/writings.html) |

Last updated : March 31, 2004\
Copyright 2003-2004 Al Wong, Los Angeles, California, USA
