---
title: "Secure Telnet for Windows CE 2.00: Installation for OpenSSH"
source_domain: amasci.com
source_path: ~webguy/service/openssh.html
order: 9884
reachable_from_entry: false
images: 0
internal_links: 2
extracted: 2026-08-07T17:18:13Z
extractor: site_to_paper.py (pandoc)
---

# Secure Telnet for Windows CE 2.00: Installation for OpenSSH

*Source page: `~webguy/service/openssh.html`*

<table width="80%">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td><h2 id="secure-telnet-for-windows-ce-2.00-installation-instructions-for-openssh">Secure Telnet for Windows CE 2.00:<br />
Installation Instructions for OpenSSH</h2>
<a href="../writings/reply.html">Al Wong</a><br />
April 5, 2003
<p>The purpose of this article is to give a very detailed description of the installation procedure for OpenSSH all in one place. These instructions are for installing OpenSSH into the Windows CE 2.00 operating system only. The current instructions are rather terse, scattered and incomplete.</p>
<p>I have an <a href="http://www.lgeservice.com/expres.html">LG Phenom Express</a> (WinCE 2.00, SH3). It's a neat little handheld machine with a very comfortable keyboard and a half height, bright color display. The only problem with this machine is LG Electronics stopped producing them in 1999! Surprisingly, this style of machine has come back in the last few years from other vendors.</p>
<p>My main use for the LG Phenom is to type notes and be able to access email via dialup without carrying a lot of weight. I was looking for a way to retrieve email from a Unix shell in a secure fashion so I started looking for telnet programs with <a href="http://www.dreamwvr.com/ssh/ssh-faq.html">SSH (Secure Shell)</a> capabilities. For WinCE 2.00, this is very hard to find. It appears Microsoft has all but abandoned this operating system.</p>
<p>I found a free telnet, <a href="http://hp.vector.co.jp/authors/VA002416/teraterm.html">Pocket Tera Term 0.0,</a> by T. Teranishi and a commercial telnet, <a href="http://www.cam.com/windowsce.html">vxHpc,</a> by Cambridge Computer Corp. While both programs work well under WinCE 2.00, both do not support SSH connections. This means anyone can easily monitor your sessions and your communications are not secure. This was not desirable for me.</p>
<p>Finally, I discovered there is a free telnet supporting SSH1 and SSH2 called <a href="http://www.openssh.com/">OpenSSH</a> and is an Open Source program. A version of OpenSSH that was ported to WinCE 2.00 by Andreas Bischoff may be found at:</p>
<blockquote>
<a href="http://prt.fernuni-hagen.de/~bischoff/wince/Andreas_WINCE_stuff.html">http://prt.fernuni-hagen.de/~bischoff/wince/Andreas_WINCE_stuff.html</a>
</blockquote>
<p>This is a great find for people like me who still use an <strong>"old"</strong> operating system like WinCE 2.00. <strong>:)</strong> Andreas derived his version of OpenSSH from a version written by Rainer Keuchel. See also:</p>
<blockquote>
<a href="http://www.rainer-keuchel.de/wince/ssh.html%20">http://www.rainer-keuchel.de/wince/ssh.html</a><br />
<a href="http://www.rainer-keuchel.de/wince/console.html">http://www.rainer-keuchel.de/wince/console.html</a><br />
<a href="http://www.rainer-keuchel.de/wince/registry.html">http://www.rainer-keuchel.de/wince/registry.html</a><br />
<a href="http://www.rainer-keuchel.de/wince/jornada720.reg.gz">http://www.rainer-keuchel.de/wince/jornada720.reg.gz</a><br />
<a href="http://www.rainer-keuchel.de/wince/dirlist.html">http://www.rainer-keuchel.de/wince/dirlist.html</a>
</blockquote>
While Andreas and Rainer did a great job with OpenSSH, the problem is the installation instructions are rather terse, scattered and incomplete. (But hey, the software is free!) The purpose of this article is to give a more detailed description of the installation procedure for OpenSSH all in one place.
<p>The gist of what the instructions in the above webpages are saying:</p>
<ol type="1">
<li>OpenSSH has its roots in the Unix operating system. You need to <em>spoof</em> Unix directories and files on your WinCE machine to <em>fool</em> OpenSSH to run.</li>
<li>You do this by defining various environment variables and point them to Unix-like directories and files you have created on the WinCE machine.</li>
<li>You cannot use Microsoft's <em>Powertoys for CE</em> (PfCE) because there is no registry editor in the PfCE WinCE 2.00 version. For WinCE 2.00, you <strong>must</strong> use the CEREG.EXE program via the ActiveSync connection.</li>
<li>You may use the CONSOLE program to confirm that your environment variables have been set correctly.</li>
</ol>
<p><span id="step1"><strong>The installation procedure for OpenSSH is rather involved and complicated.</strong> In fact, it's rather kludgy. But it works. Here are the steps:</span></p>
<ol type="1">
<li>You need to create the following directories on your WinCE machine. Some people create these directories in a PCMCIA memory card inserted into the WinCE machine. I just created the directories inside the memory of my LG Phenom itself under the directory <strong>/My Handheld PC</strong>:
<table data-cellpadding="10" data-cellspacing="0" data-border="1">
<thead>
<tr>
<th data-bgcolor="#ccffcc">Directory</th>
<th data-bgcolor="#ccffcc">Function</th>
</tr>
</thead>
<tbody>
<tr>
<td data-bgcolor="#ffffcc">/unix</td>
<td data-bgcolor="#ffffcc">Point UNIXROOTDIR environment variable here.</td>
</tr>
<tr>
<td data-bgcolor="#ffffcc">/unix/bin</td>
<td data-bgcolor="#ffffcc">Point PATH environment variable here.</td>
</tr>
<tr>
<td data-bgcolor="#ffffcc">/unix/dev</td>
<td data-bgcolor="#ffffcc">Unknown</td>
</tr>
<tr>
<td data-bgcolor="#ffffcc">/unix/etc</td>
<td data-bgcolor="#ffffcc">Point TERMCAP env var here.</td>
</tr>
<tr>
<td data-bgcolor="#ffffcc">/unix/home</td>
<td data-bgcolor="#ffffcc">Point HOME env var here.</td>
</tr>
<tr>
<td data-bgcolor="#ffffcc">/unix/logs</td>
<td data-bgcolor="#ffffcc">Point CELIBSTDLOGDIR env var here.</td>
</tr>
</tbody>
</table></li>
<li><p>Now you need to create or have the following files on your WinCE machine:</p>
<blockquote>
<p><code> </code><strong></strong><code> </code></p>
<pre><code>
   /unix/etc/passwd
   /unix/etc/services
   /unix/etc/termcap
   /unix/home/_console</code></pre>
</blockquote>
<p>These are plain text files. If you are acquainted with Unix, these directories and files should look familiar to you. I give the contents of each file below as examples:</p>
<ol type="a">
<li><p>My <strong><code>/unix/etc/passwd</code></strong> file contains two lines:</p>
<blockquote>
<p><code> </code><strong></strong><code> </code></p>
<pre><code>
root:x:0:0:Superuser:/unix:/unix/bin/xsh
webguy:x:0:0:Superuser:/unix:/unix/bin/xsh</code></pre>
</blockquote>
<p>Note the unix directories in the above two lines must match the directories you have defined on your WinCE machine. These lines match the directories I have defined on my LG Phenom.</p></li>
<li><p>My <strong><code>/unix/etc/services</code></strong> file contains two lines:</p>
<blockquote>
<p><code> </code><strong></strong><code> </code></p>
<pre><code>
ssh     22/tcp
telnet  23/tcp</code></pre>
</blockquote></li>
<li><p>The contents of the <strong><code>/unix/etc/termcap</code></strong> file is below. You don't need to create this file. It is included with the CONSOLE program.</p>
<blockquote>
<p><code> </code><strong></strong><code> </code></p>
<pre><code>
wince:\
    :co#80:it#8:li#11:\
    :mi:ms:\
    :al=\E[L:\
    :bl=^G:\
    :cd=\E[J:\
    :ce=\E[K:\
    :cl=\E[H\E[J:\
    :cm=\E[%i%d;%dH:\
    :cs=\E[%i%d;%dr:\
    :cr=^M:\
    :dc=\E[P:\
    :dl=\E[M:\
    :do=\E[B:\
    :ho=\E[H:\
    :se=\E[m:\
    :so=\E[7m:\
    :up=\E[A:\
    :kh=\E[H:\
    :kb=\177:\
        :le=\E[D:\
        :kl=\E[D:\
        :kr=\E[C:\
        :ku=\E[A:\
    :kd=\E[B:</code></pre>
</blockquote></li>
<li><p>My <strong><code>/unix/home/_console</code></strong> file contains three lines. A version of this file is also include with the CONSOLE program.</p>
<blockquote>
<p><code> </code><strong></strong><code> </code></p>
<pre><code>
builtin more
builtin ls
pipeable rm mv ls sort grep find</code></pre>
</blockquote></li>
</ol></li>
<li><p>Now you need to extract the CEREG.EXE program from the <strong>wince-desktoptools</strong> archive (See <a href="http://www.rainer-keuchel.de/wince/dirlist.html">http://www.rainer-keuchel.de/wince/dirlist.html</a>) to create the environment variables on your WinCE machine. Extract CEREG.EXE to your desktop computer.</p>
<p>To use CEREG.EXE, you first need to make an ActiveSync connection between your desktop PC and the WinCE machine. Then you run CEREG.EXE in the DOS window from your desktop PC to define environment variables on your WinCE machine. (Also see <a href="http://www.rainer-keuchel.de/wince/registry.html">http://www.rainer-keuchel.de/wince/registry.html</a>).</p>
<p>I have created a DOS batch file on my desktop PC which runs CEREG.EXE to create the environment variables for my LG Phenom via the ActiveSync connection. I list it here as an example:</p>
<blockquote>
<pre><code>
cereg -k &quot;HKLM\Environment&quot; -n &quot;UNIXROOTDIR&quot; -v &quot;\unix&quot;
cereg -k &quot;HKLM\Environment&quot; -n &quot;PATH&quot; -v &quot;\unix\bin;\Windows&quot;
cereg -k &quot;HKLM\Environment&quot; -n &quot;HOME&quot; -v &quot;\unix\home&quot;
cereg -k &quot;HKLM\Environment&quot; -n &quot;ROWS&quot; -v &quot;12&quot;
cereg -k &quot;HKLM\Environment&quot; -n &quot;COLS&quot; -v &quot;80&quot;
cereg -k &quot;HKLM\Environment&quot; -n &quot;CONSOLEFONTSIZE&quot; -v &quot;10&quot;
cereg -k &quot;HKLM\Environment&quot; -n &quot;TMP&quot; -v &quot;\Temp&quot;
cereg -k &quot;HKLM\Environment&quot; -n &quot;TEMP&quot; -v &quot;\Temp&quot;
cereg -k &quot;HKLM\Environment&quot; -n &quot;TMPDIR&quot; -v &quot;\Temp&quot;
cereg -k &quot;HKLM\Environment&quot; -n &quot;TEMPDIR&quot; -v &quot;\Temp&quot;
cereg -k &quot;HKLM\Environment&quot; -n &quot;USER&quot; -v &quot;WinCEUser&quot;
cereg -k &quot;HKLM\Environment&quot; -n &quot;TERM&quot; -v &quot;wince&quot;
cereg -k &quot;HKLM\Environment&quot; -n &quot;TERMCAP&quot; -v &quot;\unix\etc\termcap&quot;
cereg -k &quot;HKLM\Environment&quot; -n &quot;CELIBSTDLOGDIR&quot; -v &quot;\unix\logs&quot;</code></pre>
</blockquote></li>
<li><p>Install the CONSOLE program on your WinCE machine. You may use this program to confirm the environment variables were actually created properly. (See <a href="http://www.rainer-keuchel.de/wince/console.html">http://www.rainer-keuchel.de/wince/console.html</a>)</p>
<p>You will also need to copy over the CELIB.DLL file to the \Windows directory of your WinCE machine so the CONSOLE program will run properly. (See <a href="http://www.rainer-keuchel.de/wince/celib.html">http://www.rainer-keuchel.de/wince/celib.html</a>)</p></li>
<li><p>Install OpenSSH on your WinCE machine. As Andreas mentions, do not replace your \Windows\MSVCRT.DLL file, if one already exists on your WinCE machine. See <a href="http://prt.fernuni-hagen.de/~bischoff/wince/Andreas_WINCE_stuff.html">http://prt.fernuni-hagen.de/~bischoff/wince/Andreas_WINCE_stuff.html</a></p>
<p>At this point, all you really need to do is <a href="http://prt.fernuni-hagen.de/%7Ebischoff/wince/openssh-wince-sh3-hpc-wce200.zip">download OpenSSH for WinCE 2.00</a> and copy it over to your WinCE machine.</p></li>
<li>Dialup your ISP (or use your favorite method to connect).</li>
<li><p>Run the OpenSSH program. If all goes well, OpenSSH will prompt for <em>Host:</em> and <em>User:</em> and try to connect.</p>
<p>The first time you connect to your ISP, OpenSSH will give an authentication error for your ISP, generate a RAS number and ask for you to continue. Answer <strong>Yes.</strong> All subsequent connections will not do this again.</p>
<p>Then OpenSSH will prompt you for your shell password and you will be securely connected to the Unix shell. You did it!</p>
<p>If you get any other error messages from OpenSSH, either the Unix-like directories, the files and/or the environment variables were not created correctly on your WinCE machine. <a href="#step1">Go back to step 1</a> and review the installation procedure again.</p></li>
</ol>
<h3 id="observed-bugs">Observed Bugs</h3>
I have observed a few bugs when running OpenSSH under WinCE 2.00. They are minor and there are workarounds but they are annoying nevertheless:
<ol type="1">
<li><p>When prompted for <em>Host:</em> and <em>User:</em>, the backspace key doesn't work properly. This means if you make a typo, you have to restart the program all over again.</p>
<p>There is no workaround for this other than restarting the program.</p></li>
<li><p>The <em>SSH Password</em> window does not go away after you click OK or hit the ENTER key. It just stays there on top of the OpenSSH window and won't scroll away. In fact, scrolling doesn't work properly either.</p>
<p>This would be a problem. The workaround is to make the OpenSSH window go temporarily away, say by running another program or going to the desktop, and then go back to the OpenSSH window. Then the <em>SSH Password</em> window goes away and the OpenSSH window now scrolls properly(!) Seems the initial OpenSSH window is missing a repaint after the password prompt.</p></li>
<li><p>OpenSSH doesn't seem to check for the maximum window size on the WinCE machine. If you give large values for the number of rows or font size, the resulting window may not fit on the display. You may see only part of the window.</p>
<p>The workaround is to reduce the number of rows, columns and font size until the entire OpenSSH window fits on your screen. See below under <strong>Fine Tuning.</strong></p></li>
<li><p>In the Unix <strong><code>Mail</code></strong> program, the backspace key, which was mapped as ^H in the shell, is now mapped as ^? in <strong><code>Mail</code></strong>. Also, the number 4 appears to be mapped as control-C, ^C. This is bizarre.</p>
<p>There is no workaround for this.</p></li>
</ol>
<h3 id="fine-tuning">Fine Tuning</h3>
You probably will have to play with the environment variables for the number of rows, columns and font size to maximize the area of the telnet window. CONSOLE's <strong><code>env</code></strong> and <strong><code>setenv</code></strong> commands should make this easier.
<p>You will also need to adjust the number of lines in the Unix shell via the <strong><code>stty</code></strong> command so that it jives with the number of lines in your OpenSSH window. This is important for shell programs like <strong><code>more, pine, emacs,</code></strong> etc. On my LG Phenom, I set my shell screen to 12 rows using the command:</p>
<blockquote>
<strong><code>stty rows 12</code></strong>
</blockquote>
<table data-border="7" data-cellpadding="5">
<tbody>
<tr>
<td><a href="../writings/writings.html">My Writings</a></td>
</tr>
</tbody>
</table>
<hr /></td>
</tr>
</tbody>
</table>

Last updated : April 13, 2003\
Copyright 2003 Al Wong, Los Angeles, California, USA
