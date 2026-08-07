---
title: "Windows XP"
source_domain: amasci.com
source_path: ~webguy/service/winxp.html
order: 9893
reachable_from_entry: false
images: 0
internal_links: 3
extracted: 2026-08-07T17:18:14Z
extractor: site_to_paper.py (pandoc)
---

# Windows XP

*Source page: `~webguy/service/winxp.html`*

<table width="80%">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td><h2 id="setting-up-the-windows-xp-server-on-the-local-area-network">Setting up the<br />
Windows XP Server<br />
on the Local Area Network</h2>
<a href="../writings/reply.html">Al Wong</a><br />
May 11, 2003
<p>My Windows XP Home (WinXP) computer has its own LAN card and phone jack built-in. To make the WinXP computer run as a network server with a shared dialup, do the following:</p>
<ol type="1">
<li><p>Run the <em>Network Setup Wizard</em> from WinXP. Choose the <strong>first</strong> option:</p>
<blockquote>
This computer connects directly to the Internet. The other computers on my network connect to the Internet through this computer.
</blockquote>
<p>When the <em>Network Setup Wizard</em> prompts if you need to create a floppy disk to install the other computers on the network, say <strong>Yes.</strong> Create a floppy. You probably need to reboot now.</p></li>
<li><p>Then do the following. See the WinXP help for detailed explanations on how-to:</p>
<ol type="a">
<li>You need to create a <strong>unique name</strong> for this computer on the LAN. Again, it doesn't matter what it is as long as it's <strong>different</strong> from every other computer on the LAN.</li>
<li>You need to create a group name. Again, it doesn't matter what it is as long as it's the <strong>same group name</strong> on every computer on the LAN.</li>
<li><p>You need to create another account with a username and password for the network. It doesn't matter what the username and password is as long as you <strong>exactly match</strong> this account information with the other computers that are going to be on the LAN.</p>
<p>I would suggest you create a separate user account just for the network on each machine. Make the network account on your WinXP server a <strong>limited</strong> account and <strong>not</strong> an administrator account.</p>
<p>Please note the WinXP computer does not need to be logged into the network account at all but this account must exist for the benefit of the other computers on the LAN. All other computers must login to the network account to be recognized by the LAN.</p></li>
<li>Then you may want to set some folders as <em>Shared</em> in the <em>File Manager.</em> If you want <em>older</em> versions of Windows (like Windows 3.11) to be able to access your share folder, make the share folder name 8 characters or less.</li>
<li>Please see the <a href="ics.html">ICS main webpage</a> regarding <em>firewall</em> information and updates.</li>
</ol>
<p>You probably need to reboot again.</p></li>
<li><p>Open a <em>Command Window</em> and type:</p>
<blockquote>
<strong>ipconfig</strong>
</blockquote>
<p>The IP address should be <strong>192.168.0.1</strong> with a subnet mask of <strong>255.255.255.0</strong></p></li>
<li>The WinXP computer is now set up as a network server. Now set up the other computers that are going to be on the network with the floppy disk you created above.</li>
<li>Once the other computers are set up, go to <em>My Network Places</em> and click <em>View workgroup computers.</em> This should bring up the other computer names on the LAN.</li>
</ol></td>
</tr>
</tbody>
</table>

|  |  |
|----|----|
| [Internet Connection Sharing](ics.html) | [My Writings](../writings/writings.html) |

Last updated : March 13, 2004\
Copyright 2003-2004 Al Wong, Los Angeles, California, USA
