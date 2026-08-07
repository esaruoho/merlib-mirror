---
title: "Windows CE 2.00"
source_domain: amasci.com
source_path: ~webguy/service/wince.html
order: 9892
reachable_from_entry: false
images: 0
internal_links: 6
extracted: 2026-08-07T17:18:14Z
extractor: site_to_paper.py (pandoc)
---

# Windows CE 2.00

*Source page: `~webguy/service/wince.html`*

<table width="80%">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td><h2 id="getting-windows-ce-2.00-on-the-local-area-network">Getting<br />
Windows CE 2.00<br />
on the Local Area Network</h2>
<a href="../writings/reply.html">Al Wong</a><br />
May 10, 2003
<p>I am using a 3Com LAN card (3CXE589DT) connected to a <em>Phenom Express</em> (Windows CE 2.00, SH3). The only caveat is Windows CE 2.00 (WinCE 2.00) only lets you share the Internet connection but <strong>not share files or resources</strong> on the LAN. This is a quirk of WinCE 2.00. So you may <strong>only</strong> surf the web, telnet, ftp, etc. The WinXP server doesn't really recognize the Phenom on the network. If you scan the network from the WinXP server, there is an IP address for the Phenom but no computer name (shows as <em>unknown</em>).</p>
<p>You cannot run the WinXP <em>Network Setup Wizard</em> on WinCE 2.00 <a href="winxp.html">from the floppy disk you created.</a> I guess WinCE 2.00 is considered too obsolete. This version of Windows requires a manual setup.</p>
<p>To get WinCE 2.00 to work on the LAN, do the following. See the WinCE 2.00 help for detailed explanations on how-to:</p>
<ol type="1">
<li><p>To install the LAN card on the Phenom, you need to have the Windows CE Services CD available and you need to download the LAN card driver for WinCE from the <a href="http://infodeli.3com.com/infodeli/tools/nic/3cxe589d.htm">3Com website.</a> You need to make an ActiveSync connection to the Phenom before you can install the LAN card drivers.</p>
<p>The <a href="http://infodeli.3com.com/infodeli/tools/nic/3cxe589d.htm">3Com website</a> has two self-extracting files for the LAN card. You only need the first file (<strong>3c589x_1.exe</strong>) for WinCE 2.00.</p></li>
<li><p>Run the <strong>3c589x_1.exe</strong> file from the desktop computer and it will self-extract a bunch of files. Do not insert the LAN card into the Phenom yet. Make an ActiveSync connection and insert the Windows CE Services CD. Run the <strong>setup.exe</strong> file in the WIN_CE folder from the extracted files. This will install the LAN card drivers on the Phenom.</p>
<p>After you have installed the LAN card drivers, turn the Phenom computer OFF, insert the LAN card into the Phenom and do a reboot.</p></li>
<li>If the installation was sucessful, you will be prompted for a LAN card name and IP settings:
<ol type="a">
<li>Under the <em>IP Address</em> tab, you must enable DHCP (Dynamic Host Configuration Protocol). This is a check box called <em>Obtain an IP Address via DHCP.</em> Make sure this box is checked. Do not specify an IP address for this computer.</li>
<li>Under the <em>Name Servers</em> tab, enter the IP address of the <em>Primary DNS</em> server as <strong>192.168.0.1</strong></li>
</ol></li>
<li><p>In the <em>Control Panel</em> under <em>Network</em> in the <em>Identification</em> tab, you also need to enter a username that exactly matches the network account on the WinXP server. For some reason, WinCE will not let you change the password. This is fine. There is also a <em>domain</em> field which I assume is the equivalent of the group name.</p>
<p>You do not have to give the computer a unique name. It appears WinCE 2.00 does not require a name to work on the LAN. As mentioned above, only an IP address identifies the computer.</p></li>
<li>In the <em>Control Panel</em> under <em>Network</em> in the <em>Adapters</em> tab, make sure the <em>3C589 Compatible Ethernet Driver</em> is selected. Now click the <em>Properties</em> button and make sure the <em>Obtain an IP Address via DHCP</em> option is checked. Then click the <em>Name Servers</em> tab and make sure the <em>Primary DNS</em> server is set to the IP address <strong>192.168.0.1</strong></li>
<li><p>You should now be able to access the Internet via the WinXP dialup connection. Launch a browser and go to a website. Or telnet to another computer. You can even run <a href="openssh.html">OpenSSH</a> for a secure connection to another computer.</p>
<p>If you are really gungho, try <a href="activesync.html">configuring an ActiveSync connection over the LAN.</a> It's the fastest way to share files and install programs on WinCE 2.00. In fact, set up an ActiveSync connection over your LAN first <strong>before</strong> installing <a href="openssh.html">OpenSSH.</a> It makes installing OpenSSH easier and faster.</p></li>
<li><strong>Warning:</strong> Do NOT insert the LAN card while the Phenom is ON! It seems WinCE 2.00 is not plug-and-play friendly. The shock of new hardware being introduced will totally freeze the machine and even the power button will not work. A hard reboot will wipe out all previously installed programs! I learned this the hard way.</li>
</ol>
There is <a href="http://www.cewindows.net/wce/20/ethernet.htm">more information</a> available. If you need a faster (100Mbps) LAN card, you can see a <a href="http://www.cewindows.net/peripherals/pccardethernet.htm">list of compatible LAN cards.</a> The faster LAN cards all require a dongle though.
<p>If you have gotten this far, here is another WinCE 2.00 goodie. I just discovered <a href="http://www.cse.msu.edu/~reedevv/msproj/ce/e_ftp/">E_FTP, an FTP program that works under WinCE 2.*</a> written by Esther Reed and it's available as freeware! Please let her know you are using the program so her website won't go down. This program easily solves the problem of how to download files to WinCE 2.00 from the Internet!</p></td>
</tr>
</tbody>
</table>

|  |  |
|----|----|
| [Internet Connection Sharing](ics.html) | [My Writings](../writings/writings.html) |

Last updated : August 31, 2004\
Copyright 2003-2004 Al Wong, Los Angeles, California, USA
