---
title: "Windows for Workgroups 3.11"
source_domain: amasci.com
source_path: ~webguy/service/win311.html
order: 9890
reachable_from_entry: false
images: 0
internal_links: 4
extracted: 2026-08-07T17:18:14Z
extractor: site_to_paper.py (pandoc)
---

# Windows for Workgroups 3.11

*Source page: `~webguy/service/win311.html`*

<table width="80%">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td><h2 id="getting-windows-for-workgroups-3.11-on-the-local-area-network">Getting<br />
Windows for Workgroups 3.11<br />
on the Local Area Network</h2>
<a href="../writings/reply.html">Al Wong</a><br />
May 10, 2003
<p><strong>01/13/05 Update</strong> - There is an <strong>amazing amount of interest</strong> for this webpage! (It's in the top ten!) I guess there are a lot of Windows for Workgroups 3.11 (Win3.11) computers still being used! Or perhaps they are just lying around gathering dust. I am glad to give new hope for these machines to be recycled back into service. Even if it is just for fun. <strong><code>:)</code></strong></p>
<p>I wish to satisfy my curiosity. If you found this webpage useful, <a href="mailto:bigdaddy256@hotmail.com?subject=&#39;My%20Windows%20for%20Workgroups%203.11%20Uses&#39;"><strong>email me</strong></a> and let me know how/why you are using your Win3.11 computer.</p>
<p>I am using a 3Com LAN card (3CXE589DT) connected to a <a href="http://www.maxtech.com/html/753.html">Maxtech 753</a> (Windows for Workgroups 3.11, MS-DOS 6.22) and got it working!</p>
<p>You cannot run the WinXP <em>Network Setup Wizard</em> on Windows for Workgroups 3.11 (Win3.11) <a href="winxp.html">from the floppy disk you created.</a> I guess Windows 3.11 is considered too obsolete. This version of Windows requires a manual setup.</p>
<p>To get Windows 3.11 to work on the LAN, do the following. See the Windows 3.11 help for detailed explanations on how-to:</p>
<ol type="1">
<li><p>Evidently, you just need to start up Windows 3.11 and enable <em>Networking</em> in the Networking window.</p>
<p>It turns out you don't necessarily need the <em>Card Services</em> drivers installed to get the LAN card working on the local network. In fact, if you have all the <em>Card Services</em> drivers installed on boot up, Windows 3.11 will <strong>not</strong> start! I guess there's some sort of memory problem. So it's a good thing you don't need the <em>Card Services!</em></p>
<p>You probably need to reboot now.</p></li>
<li><p>Now install the driver for the 3Com LAN card. You can download the LAN card driver for Windows 3.11 from the <a href="http://infodeli.3com.com/infodeli/tools/nic/3cxe589d.htm">3Com website.</a> You need to download the second file (<strong>3c589x_2.exe</strong>) for Windows 3.11. (You need to install the special DOS driver for the LAN card (NDIS2).)</p>
<p>You probably need to reboot again.</p></li>
<li><p>Start up Windows 3.11 and install the new <a href="http://support.microsoft.com/default.aspx?scid=kb;en-us;122544">TCP/IP-32 3.11b upgrade.</a></p>
<p><strong>08/31/04 Update</strong> - It seems Microsoft very recently changed their website. Ironically, even though the above current link has all the details about the TCP/IP-32 3.11b upgrade, including installation instructions, it does <strong>not</strong> link to the upgrade file anymore (there used to be a link on the bottom of the webpage) nor tell you where to download it! It does not even tell you what the upgrade filename is!</p>
<p>Also, the email support links are useless. There are now several convoluted and cyclical links that waste your time (Thanks Microsoft). I suppose this is to cut down on their email but it is poor customer service nevertheless.</p>
<p>After digging around, I believe I found the upgrade file. Download the TCP/IP-32 3.11B upgrade file from Microsoft's FTP site.</p>
<p><strong>12/14/04 Update</strong> - Microsoft changed the link again. I link to the new URL for downloading <a href="http://support.microsoft.com/default.aspx?scid=kb;en-us;99891">the TCP/IP-32 3.11B upgrade file.</a> If the new link is bad do a search for <strong>TCP32B.EXE</strong> in the Microsoft support website to find the upgrade file again.</p>
<p>If the installation software did not change your AUTOEXEC.BAT file to start up the LAN card driver on boot up, you need to do this. At the DOS prompt, type <strong>NET START</strong> to enable the LAN card driver. You will get some warning message. Hit the <em>enter</em> key. You should now get a message the driver was successfully installed.</p>
<p>You need to reboot yet again.</p></li>
<li><p>Start up Windows 3.11 and do the following below. See the Windows 3.11 help for detailed explanations on how-to:</p>
<ol type="a">
<li>You need to create a <strong>unique name</strong> for this computer on the LAN. Again, it doesn't matter what it is as long as it's <strong>different</strong> from every other computer on the LAN.</li>
<li>You need to create a group name. Again, it doesn't matter what it is as long as it's the <strong>same group name</strong> on every computer on the LAN.</li>
<li><p>You need to create another account with a username and password for the network. It doesn't matter what the username and password is as long as you <strong>exactly match</strong> this account information with the other computers that are going to be on the LAN.</p>
<p>I would suggest you create a separate user account just for the network on each machine.</p></li>
<li>To setup Internet access, you need to set the IP address 192.168.0.1 as the <strong>Gateway</strong> and as the <strong>DNS server</strong> under <em>Networking.</em></li>
<li>You must also enable DHCP (Dynamic Host Configuration Protocol). This is usually a check box. Do not specify an IP address for this computer.</li>
<li>Make sure the TCP/IP protocol has a <em>binding</em> to the LAN card driver. You probably need to make TCP/IP the default binding.</li>
<li>Then you may want to set some directories as <em>Shared</em> in <em>the File Manager.</em></li>
</ol>
<p>Reboot one more time.</p></li>
<li>Start up Windows 3.11 again.</li>
<li><strong>Login to the network account</strong> you created above. The Windows 3.11 computer and shared directories should now be recognized on the WinXP server and any other computer on the LAN.</li>
<li><p>Open a <em>MS-DOS Window</em> and type:</p>
<blockquote>
<strong>ipconfig</strong>
</blockquote>
<p>The IP address should be <strong>192.168.0.XXX</strong> where XXX is a number other than 1. The subnet mask should be <strong>255.255.255.0</strong>. Use <strong>ipconfig /?</strong> to get help on this command.</p></li>
<li>In Windows 3.11, go to <em>File Manager</em> and click the E: drive. This will bring up the share files on the other computers. The drive letter may be different on your computer depending. Experiment.</li>
</ol></td>
</tr>
</tbody>
</table>

|  |  |
|----|----|
| [Internet Connection Sharing](ics.html) | [My Writings](../writings/writings.html) |

Last updated : January 13, 2005\
Copyright 2003-2005 Al Wong, Los Angeles, California, USA
