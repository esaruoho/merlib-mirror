---
title: "Getting Windows CE 2.00 ActiveSync to Run on the Local Area Network"
source_domain: amasci.com
source_path: ~webguy/service/activesync.html
order: 9667
reachable_from_entry: false
images: 0
internal_links: 5
extracted: 2026-08-07T06:02:15Z
extractor: site_to_paper.py (pandoc)
---

# Getting Windows CE 2.00 ActiveSync to Run on the Local Area Network

*Source page: `~webguy/service/activesync.html`*

<table width="80%">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td><h2 id="getting-windows-ce-2.00-activesync-to-run-on-the-local-area-network">Getting Windows CE 2.00 ActiveSync<br />
to Run on the Local Area Network</h2>
<a href="../writings/reply.html">Al Wong</a><br />
March 21, 2004
<p>"What an amazingly obscure subject!", you might be saying to yourself. And you would be right. But funny enough, from my travels on the Web, many people have described the same or similar problem but were not able to solve it. Hopefully this description can shed some light on the answers.</p>
<p>This is description of how I got ActiveSync to work through <a href="ics.html">my ethernet local area network</a> (LAN). I am using a 3Com LAN card (3CXE589DT) connected to a <em>Phenom Express</em> (Windows CE 2.00, SH3).</p>
<p>The problem is Windows CE 2.00 (WinCE 2.00) only lets you share the Internet connection but <strong>not share files or resources</strong> on the LAN. This is a quirk of WinCE 2.00. So you may <strong>only</strong> surf the web, telnet, ftp, etc. Transferring files and installing programs on a WinCE 2.00 computer meant having to directly connect a serial cable between a desktop and WinCE 2.00 computer and run a Microsoft proprietary communication protocol called ActiveSync. Connection speeds were painfully slow if you have large or many files to transfer. Then I discovered from Chris De Herrera's website <a href="http://www.cewindows.net/wce/20/activesync.htm">it was possible to configure ActiveSync to work over the ethernet LAN</a> with a communication speed of at least 10Mbp!. This would mean a speed increase of about 520 times over the original 19.2Kbps serial cable speed! Unfortunately, Chris does not explicitly detail <strong>how</strong> to do this with WinCE 2.00.</p>
<p><strong>Please Note:</strong> There are still a few unknowns on how exactly WinCE 2.00 ActiveSync works over the LAN. I describe them below.</p>
<p>Below is a list of steps I did to get ActiveSync running on the LAN:</p>
<ol type="1">
<li>3Com LAN card drivers must be installed on Phenom and the LAN card can be demonstrated to work over the LAN. <a href="wince.html">I already describe this for the Phenom.</a></li>
<li>Let's assume there is a Windows 98 (Win98) computer also connected to the LAN because that's what I am using. <code>:)</code> Make sure the firewall on this computer is disabled.</li>
<li><p><a href="http://www.microsoft.com/windowsmobile/resources/downloads/pocketpc/activesync35.mspx">Download ActiveSync 3.5 from Microsoft</a> and install it on the Win98 computer.</p>
<blockquote>
<strong>09/07/04 Update</strong> - The Microsoft link is back up! Thanks Microsoft and to those of you who complained!
</blockquote>
<p>ActiveSync 3.5 is the highest version that still supports WinCE 2.00 (although Windows 95 and NT are not supported anymore). It seems ActiveSync 3.5 will automagically detect if some WinCE machine on the LAN is trying to ActiveSync to it although this is not explicitly stated anywhere.</p>
<p>By the way, ActiveSync 3.5 can raise the serial port communication speed up to 115Kbps (up from the original speed of 19.2Kbps). So you get a significant speed increase just by upgrading (a speed increase of almost 6 times).</p></li>
<li><p>A <strong>partnership</strong> must first be established via ActiveSync using the serial cable between the Win98 computer and the Phenom. To have a <strong>partnership,</strong> the synchronization option must be selected. The Phenom cannot be defined as a <em>guest.</em></p>
<p>If you do not want to synchronize anything, just uncheck all the option boxes for synchronization. You would still form a <strong>partnership</strong> but nothing gets synchronized. This effectively makes it a <em>guest</em> connection.</p>
<p><strong>Please note the difference:</strong> For the serial connection, ActiveSync must be initiated from the Win98 computer. For the LAN connection, ActiveSync must be initiated from the Phenom.</p></li>
<li><p>It might be a good idea to install <a href="http://www.cam.com/">vxUtil (personal)</a> by Cambridge Computer Corp. on the Phenom at this point. vxUtil is free for personal use and can help you troubleshoot your network connection. Run vxUtil and get <strong>info</strong> on your Phenom.</p>
<p>This is one of the unknowns I was talking about in the first paragraph. <strong>For some reason, I couldn't get ActiveSync to work over the LAN without installing vxUtil first.</strong> I experienced this twice working on two separate Phenom Expresses. I cannot prove this directly but I suspect vxUtil either:</p>
<ol type="a">
<li>during installation vxUtil upgrades some files which allows ActiveSync to work on the LAN.</li>
<li>running vxUtil sets some flags in memory which allows ActiveSync to work on the LAN.</li>
<li>both of the above.</li>
</ol></li>
<li>Break ActiveSync connection via the serial port. Disconnect serial cable.</li>
<li>Connect Win98 computer and Phenom to LAN if not already connected.</li>
<li><p>Determine the current IP address of Win98 computer using your favorite method. The <strong>ipconfig</strong> command from the <em>MS-DOS prompt</em> works for me. The IP address should be of the form <strong>192.168.0.XXX</strong> where XXX is a number other than 1.</p>
<p>Then see if you can <strong>ping</strong> the Win98 computer's IP address from the Phenom using <strong>vxUtil.</strong> A successful <strong>ping</strong> is a good sign.</p></li>
<li><p>On the Phenom, <em>Control Panel|Network|Properties|Nameservers|Primary WINS field</em> must be set to the current IP address of the Win98 computer. This somehow tells Phenom's ActiveSync function to add a <strong>Network Connection</strong> option in it's "method to connect..." pulldown menu. Otherwise, the pulldown menu only has options for serial and IR ports.</p>
<p>ActiveSync can also somehow tell the Win98 computer <strong>name</strong> which it evidently derived from this IP address.</p></li>
<li>I am not sure if this is important but I am going to mention it here anyway. Get rid of dashes or punctuation characters in Phenom computer name under <em>Control Panel|Communications|Device Name.</em> Computer name should be just letters and numbers and make it a short name.</li>
<li><p>Now go to Phenom's <em>Start Menu|Programs|Communication|ActiveSync.</em> Choose <strong>Network Connection</strong> in the first "method to connect..." pulldown menu. The Win98 computer name should already be selected in the second "Connect to:" pulldown menu. Click the <strong>Connect...</strong> button.</p>
<p>This causes ActiveSync to seek out the computer on the LAN where it previously formed a <strong>partnership.</strong> You formed this <strong>partnership</strong> about 6 steps ago, remember?</p>
<p>I am not sure what happens if more than one computer on the LAN formed a <strong>partnership</strong> with the Phenom. That's another story.</p></li>
<li><p>If all goes well, ActiveSync 3.5 on the Win98 computer should start up automagically. The computers should synchronize with each other and then wait for you.</p>
<p>Congratulations! You just made an ActiveSync connection over your LAN! You can share files and install programs just like you would through the serial cable only much faster.</p>
<p>If the ActiveSync window on the Phenom disappears and nothing happens on the Win98 computer, then ActiveSync failed to connect. You need to go through the above list again or do other troubleshooting.</p>
<p><strong>12/14/04 Update</strong> - If the Win98 computer does not respond, try rebooting both the Phenom and the Win98 machines and then run ActiveSync again as described in the previous step. Be patient. Most of the time the ActiveSync connection occurs immediately. Sometimes it may take a minute.</p></li>
</ol>
From my personal experience, network transmissions to/from the Phenom is slower than expected (using a 10Mbps LAN card) but faster than the serial connection at 115Kbps. A 1.9MB file took approximately 27 seconds to copy over to Phenom. Much better!
<p>Once you ActiveSync working over your network, you might want to try <a href="openssh.html">installing OpenSSH</a> on your WinCE machine! OpenSSH is a secure telnet for WinCE 2.00.</p>
<p>I am invincible! <code>\o/</code></p></td>
</tr>
</tbody>
</table>

|                                          |                               |
|------------------------------------------|-------------------------------|
| [My Writings](../writings/writings.html) | [Windows CE 2.00](wince.html) |

Last updated : December 14, 2004\
Copyright 2004 Al Wong, Los Angeles, California, USA
