---
title: "Windows 98"
source_domain: amasci.com
source_path: ~webguy/service/win98.html
order: 9891
reachable_from_entry: false
images: 0
internal_links: 4
extracted: 2026-08-07T17:18:14Z
extractor: site_to_paper.py (pandoc)
---

# Windows 98

*Source page: `~webguy/service/win98.html`*

<table width="80%">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td><h2 id="getting-windows-98-on-the-local-area-network">Getting<br />
Windows 98<br />
on the Local Area Network</h2>
<a href="../writings/reply.html">Al Wong</a><br />
May 11, 2003
<p>I am using a D-Link LAN card (<a href="http://support.dlink.com/Products/view.asp?productid=DFE-690TXD">DFE-690TXD</a>) connected to Windows 98 (Win98) computer. To get the Win98 computer to work on the LAN, do the following:</p>
<ol type="1">
<li><p>Run the <em>Network Setup Wizard</em> from the floppy disk you created during your <a href="winxp.html">WinXP session with the <em>Network Setup Wizard.</em></a> Choose the <strong>second</strong> option:</p>
<blockquote>
This computer connects to the Internet through another computer on my network or through a residential gateway.
</blockquote>
<p>After the <em>Network Setup Wizard</em> exits, reboot.</p></li>
<li><p>Then do the following. See the Win98 help for detailed explanations on how-to:</p>
<ol type="a">
<li>You need to create a <strong>unique name</strong> for this computer on the LAN. Again, it doesn't matter what it is as long as it's <strong>different</strong> from every other computer on the LAN.</li>
<li>You need to create a group name. Again, it doesn't matter what it is as long as it's the <strong>same group name</strong> on every computer on the LAN.</li>
<li><p>You need to create another account with a username and password for the network. It doesn't matter what the username and password is as long as you <strong>exactly match</strong> this account information with the WinXP server.</p>
<p>I would suggest you create a separate user account just for the network on each machine.</p></li>
<li><p>Then you may want to set some folders as <em>Shared</em> in the <em>File Manager.</em> If you want <em>older</em> versions of Windows (like Windows 3.11) to be able to access your share folder, make the share folder name 8 characters or less.</p>
<p>Please see the <a href="ics.html">ICS main webpage</a> regarding <em>firewall</em> information and updates.</p></li>
</ol>
<p>You probably need to reboot again.</p></li>
<li><strong>Login to the network account</strong> you created above.</li>
<li><p>Open a <em>Command Window</em> and type:</p>
<blockquote>
<strong>ipconfig</strong>
</blockquote>
<p>The IP address should be <strong>192.168.0.XXX</strong> where XXX is a number other than 1. The subnet mask should be <strong>255.255.255.0</strong>. Use <strong>ipconfig /?</strong> to get help on this command.</p></li>
<li>The Win98 computer and shared directories should now be recognized on the LAN. Go to <em>My Network Places</em> and click <em>View workgroup computers.</em> This should bring up the other computer names on the LAN.</li>
</ol></td>
</tr>
</tbody>
</table>

|  |  |
|----|----|
| [Internet Connection Sharing](ics.html) | [My Writings](../writings/writings.html) |

Last updated : March 13, 2004\
Copyright 2003-2004 Al Wong, Los Angeles, California, USA
