---
title: "MEGS-O-RAM: How to Configure Megabytes of RAM for Windows WFWG 3.11"
source_domain: amasci.com
source_path: ~webguy/writings/megsoram.html
order: 9914
reachable_from_entry: false
images: 1
internal_links: 3
extracted: 2026-08-07T17:18:15Z
extractor: site_to_paper.py (pandoc)
---

# MEGS-O-RAM: How to Configure Megabytes of RAM for Windows WFWG 3.11

*Source page: `~webguy/writings/megsoram.html`*

<table data-cellspacing="0" width="80%">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td><img src="gifs/megsoram.gif" alt="[MEGS-O-RAM]" />
<h4 id="by">by</h4>
<a href="reply.html"><strong>Al Wong</strong></a>
<hr />
<ul>
<li><a href="#introduction">Introduction</a></li>
<li><a href="#definitions">Definitions</a></li>
<li><a href="#computer">Does the Computer Recognize the Memory?</a></li>
<li><a href="#purpose">What is the Purpose for This Memory?</a></li>
<li><a href="#configuring">Configuring Memory</a>
<ul>
<li><a href="#config">CONFIG.SYS</a>
<ol type="1">
<li><a href="#himem">HIMEM.SYS: Extended Memory and HMA Manager</a></li>
<li><a href="#emm386">EMM386.EXE: Upper Memory Area Manager</a></li>
<li><a href="#dos">DOS Command</a></li>
<li><a href="#devicehigh">DEVICEHIGH</a></li>
</ol></li>
<li><a href="#autoexec">AUTOEXEC.BAT</a>
<ul>
<li><a href="#smartdrv">SMARTDRV.EXE: The Disk Cache for DOS</a></li>
</ul></li>
</ul></li>
<li><a href="#windows">Windows For Work Groups 3.11</a>
<ul>
<li><a href="#32bitfile">32 Bit File Access</a></li>
<li><a href="#swapfile">Permanent Swap File</a></li>
<li><a href="#diskcache">Windows Disk Cache</a></li>
</ul></li>
<li><a href="#summary">Summary</a></li>
</ul>
<hr />
<span id="introduction"></span>
<h2 id="introduction">Introduction</h2>
I had just upgraded <a href="../service/maxtech.html">my new notebook computer</a> from 8 megabytes (MB) to <strong>40 MB of RAM</strong> (a Pentium 133Mhz with DOS 6.22 and Windows For Work Groups (WFWG) 3.11). While I was very happy about this, I didn't know how to optimally configure all this lovely memory! Researching the Web did not reveal any articles that describe solutions to this problem! I thought this was very odd. Inquiring in Usenet, I discovered this problem can have more than one answer depending on how you use your computer.
<p>This is a description of how I determined my "best" memory configuration. It may not be the best configuration for everyone. <strong>My main purpose is to describe the different considerations involved with having lots of memory.</strong> Hopefully this article will help someone else with a similar problem. I wish this page existed when I was looking for information.</p>
<p>Most of the information in this article was derived from reading the <em>Microsoft</em> user manuals for DOS 6.22 and WFWG 3.11 and after much experimenting and observation. Special thanks to Bill Clay (wpclay@arl.mil) for clarifying DOS and Windows cache interaction.</p>
<p>This article is intended for 80486 machines or better, DOS 6.22 or better, Windows 3.1 or WFWG 3.11. This information may not be accurate for less powerful machines or earlier operating systems. And of course, your mileage may vary. <span id="definitions"></span></p>
<h2 id="definitions">Definitions</h2>
Before jumping into the configuring issues, a few definitions about memory to make sure everyone is on the same (Web) page. I get confused about PC memory terminology myself. This is takened from the <em>Microsoft MS-DOS 6.22 Concise User's Guide:</em>
<table data-cellpadding="5" width="80%">
<tbody>
<tr>
<th style="text-align: left;" data-valign="top" data-nowrap=""><span id="conventional">Conventional Memory</span></th>
<td>Up to <strong>the first 640K of memory</strong> on a computer. All MS-DOS-based programs require conventional memory. (K=kilobytes.)</td>
</tr>
<tr>
<th style="text-align: left;" data-valign="top" data-nowrap=""><span id="uppermemory">Upper Memory Area</span></th>
<td><strong>The 384K of memory above your computer's 640K of <em>conventional memory.</em></strong> The upper memory area is used by system hardware, such as your display adapter. Unused parts of the <em>upper memory area</em> are called <strong>upper memory blocks (UMBs).</strong></td>
</tr>
<tr>
<th style="text-align: left;" data-valign="top" data-nowrap=""><span id="extended">Extended Memory (XMS)</span></th>
<td><strong>Memory beyond 1 MB on computers</strong> with 80286 or higher processors. Extended memory requires an extended-memory manager, such as <em>HIMEM.</em></td>
</tr>
<tr>
<th style="text-align: left;" data-valign="top" data-nowrap=""><span id="highmemory">High Memory Area (HMA)</span></th>
<td><strong>The first 64K of <em>extended memory.</em></strong> On a computer with extended memory, <em>Setup</em> conserves <em>conventional memory</em> by installing MS-DOS to run in the high memory area.</td>
</tr>
<tr>
<th style="text-align: left;" data-valign="top" data-nowrap=""><span id="expanded">Expanded Memory (EMS)</span></th>
<td>Memory in addition to <em>conventional memory</em> that some MS-DOS-based applications can use. Expanded memory is installed on an expanded memory board and comes with an expanded-memory manager. (This article will not address expanded memory (Pun intended). Most DOS applications do not use it now.)</td>
</tr>
</tbody>
</table>
So any memory installed after the first MB of memory is considered <a href="#extended">extended memory.</a> Since I upgraded to 40 MB of RAM, this means 39 MB is <a href="#extended">extended memory.</a> <span id="computer"></span>
<h2 id="does-the-computer-recognize-the-memory">Does the Computer Recognize the Memory?</h2>
The first thing I did after the new memory chips were installed is make sure the computer recognizes the new memory. On bootup, the computer automatically does a memory test and counts the memory addresses tested. Watching this carefully, I noted the count was approximately 39 MB. Whee!
<p>Another way to check is to run the <em>DOS MEM</em> command. The output results from <em>MEM</em> displays the amounts of conventional, upper and extended memory. <span id="purpose"></span></p>
<h2 id="what-is-the-purpose-for-this-memory">What is the Purpose for This Memory?</h2>
Before you can optimally configure your memory, you must ask yourself for what purpose do I need the extra memory? What applications do I use often that are memory hogs? Are they <em>DOS</em> or <em>Windows</em> programs? Aim your memory configuration so these applications can take full advantage of the extra memory. <span id="configuring"></span>
<h2 id="configuring-memory">Configuring Memory</h2>
After I had confirmed the computer recognized the newly installed memory, I wanted to make sure I had as much free <a href="#conventional">conventional memory</a> as possible upon bootup. All applications need <a href="#conventional">conventional memory</a> to load and run properly.
<p>I hand-optimized the various drivers on my notebook and managed to free about 68K more than the factory settings. Then I tried the <em>DOS MemMaker.</em> It squeezed out 2K more of free <a href="#conventional">conventional memory.</a> I discovered it can figure out the minimum size of each driver to be stored in the <a href="#uppermemory">upper memory blocks.</a> So <em>MemMaker</em> does work but 2K isn't that dramatic.</p>
<p>One thing to note. Watch the actions of other device drivers. On bootup, the driver software for my Teac CD-ROM drive automatically allocates 25% of <a href="#extended">extended memory</a> to be used as a CD cache by default. For a while, I was wondering why about 10 MB of <a href="#extended">extended memory</a> was taken up! I disabled the CD cache and had 39 MB free again. <span id="config"></span></p>
<h3 id="config.sys">CONFIG.SYS</h3>
This is the first file read on bootup. There are a few basic lines in this file that must be present to use all of your computer's memory.
<blockquote>
<p><span id="himem"><strong>HIMEM.SYS: Extended Memory and HMA Manager</strong></span></p>
<blockquote>
<p>This driver manages program access to the <a href="#extended">extended memory</a> and the <a href="#highmemory">high memory area.</a> The <strong>first line</strong> in your CONFIG.SYS file should be loading this driver. The line I use is:</p>
<p><strong><code>DEVICE=C:\DOS\HIMEM.SYS /VERBOSE</code></strong></p>
</blockquote>
<p><span id="emm386"><strong>EMM386.EXE: Upper Memory Area Manager</strong></span></p>
<blockquote>
<p>This driver provides access to the <a href="#uppermemory">upper memory area.</a> The <strong>second line</strong> in the CONFIG.SYS file should be loading this driver. The line I use is:</p>
<p><strong><code>DEVICE=C:\DOS\EMM386.EXE NOEMS /VERBOSE</code></strong></p>
<p>The <strong>NOEMS</strong> option is to disable program access to <a href="#expanded">expanded memory</a>. So EMM386.EXE is mainly used to provide access to the <a href="#uppermemory">upper memory area.</a></p>
</blockquote>
<p><span id="dos"><strong>DOS Command</strong></span></p>
<blockquote>
<p>There are two DOS commands that should be the third and fourth line in the CONFIG.SYS file:</p>
<p><strong><code> DOS=UMB</code><br />
<code>DOS=HIGH </code></strong></p>
<p>The first line, <strong>DOS=UMB,</strong> allows DOS to manage the <a href="#uppermemory">upper memory blocks</a> that were created by EMM386.EXE. The second line, <strong>DOS=HIGH,</strong> allows DOS to attempt to load part of itself in the <a href="#highmemory">high memory area.</a></p>
</blockquote>
<p><span id="devicehigh"><strong>DEVICEHIGH</strong></span></p>
<blockquote>
The other thing I did is to use DEVICEHIGH as much as possible to load the other device drivers into the <a href="#uppermemory">upper memory area.</a>
</blockquote>
</blockquote>
<span id="autoexec"></span>
<h3 id="autoexec.bat">AUTOEXEC.BAT</h3>
This is the other file read on bootup. Depending on your hardware configuration, there might be other drivers that will arbitrarily allocate memory. For example on my system, my Teac CD drive automatically to allocates 25% of available memory by default. Reading the documentation for each driver and running the DOS MEM command helped me determine what program was allocating memory.
<p>Apart from other device drivers, there is only one that comes with DOS and, which I discovered, is one key for configuring memory allocation. What the manuals don't tell you is there should be two separate memory configurations, one for DOS and one for Windows.</p>
<blockquote>
<p><span id="smartdrv"><strong>SMARTDRV.EXE: The Disk Cache for DOS</strong></span></p>
<blockquote>
<p>At first, it wasn't clear to me if SMARTDRV was acting as a <em>RAM drive</em>, a disk cache or both! I guess the <strong>SMART</strong> and <strong>DRV</strong> in SMARTDRV implied to me it was a <strong>smart RAM drive.</strong> It was too much to hope for. I discovered later <em>SMARTDRV just caches the hard disk</em> but will not allow DOS programs to execute from it. So the <strong>SMART</strong> and <strong>DRV</strong> in SMARTDRV implies it's a <strong>smart cache for the hard drive.</strong> So programs and data are cached by SMARTDRV but still need to be transferred into <a href="#conventional">conventional memory</a> to be executed.</p>
<p>For fun, I tried allocating 39 MB with SMARTDRV but that didn't work. After much testing, I determined SMARTDRV will allocate a maximum cache size of 37,487K. This left about 3 MB free. Some large DOS programs wouldn't load.</p>
<p>SMARTDRV.EXE allocates the <em>disk cache for DOS.</em> There are two basic numeric arguments for SMARTDRV.EXE. The first one is the cache size (in Kilobytes) when in DOS and the second one is the cache size when in Windows.</p>
<p><strong>For DOS,</strong> I also discovered the SMARTDRV disk cache will optimally work with a 4 MB to 8MB allocation while in DOS. The rest of <a href="#extended">extended memory</a> could be used by a <strong>RAM drive</strong> while in DOS.</p>
<p><strong>For Windows,</strong> the SMARTDRV cache should be minimized and the Window's disk cache should be used. SMARTDRV will cache for Windows too but the Windows cache is faster. Also the SMARTDRV cache should be minimized so it doesn't conflict with the Windows cache. This is the line I use:</p>
<p><strong><code>C:\DOS\SMARTDRV.EXE 8192 128 /X /S</code></strong></p>
<p>This allocates an 8 MB disk cache (8,192K) while in DOS and a 128K cache while in Windows. The 128K cache is for caching the floppy drive which the Windows cache evidently does not do. This works well if Windows has its own disk cache.</p>
<p>The <strong>/X</strong> option makes sure SMARTDRV does not cache writes to disk. The <strong>/S</strong> option tells SMARTDRV to display its current status.</p>
<p>For machines with 6 MB or more of <a href="#extended">extended memory,</a> SMARTDRV will automatically allocate 2 MB for both its DOS cache and Windows cache. Usually, this is not optimal. If you are in Windows and if a disk cache is allocated under Windows, disk accesses will be cached by both the SMARTDRV disk cache and the Windows disk cache!</p>
</blockquote>
</blockquote>
<span id="windows"></span>
<h2 id="windows-for-work-groups-3.11">Windows For Work Groups 3.11</h2>
The steps I describe here are for WFWG 3.11 but are valid for Windows 3.1 too. (Before configuring anything in Windows, it is a good idea to do a <strong>SCANDISK</strong> and <strong>DEFRAG /F</strong> in DOS first.) It appears Windows is smart enough to recognize <a href="#extended">extended memory</a> and grab all <em>unallocated</em> <a href="#extended">extended memory</a> for itself when it starts up. There are at least 3 things to do to configure memory in Windows. Find the <strong>Main program group</strong> and go to:
<blockquote>
<strong>Main | Control Panel | Enhanced | Virtual Memory | Change</strong>
</blockquote>
<span id="32bitfile"></span>
<h3 id="bit-file-access">32 Bit File Access</h3>
Click <strong>ON</strong> the <strong>32 Bit File Access</strong> Box. This will enable 32 bit file access which is faster than 16 bit file access (the default). <span id="swapfile"></span>
<h3 id="permanent-swap-file">Permanent Swap File</h3>
To enable 32 bit file access, you will probably need to create a <em>permanent</em> swap file too. I created a 10 MB (10,240K) swap file. With 40 MB of RAM, I found Windows almost never uses it.
<p>By the way, it is <strong>not</strong> a good idea to use part of your RAM for a swap file (from a RAM drive). This robs memory from other Windows applications that probably need it. <span id="diskcache"></span></p>
<h3 id="windows-disk-cache">Windows Disk Cache</h3>
Type the cache size (in kilobytes) in the <strong>Cache Size</strong> box to allocate a disk cache in Windows. I use 4MB (4,096K). This allows Windows to create a 4 MB disk cache on startup. I found this is a good cache size. This cache gets deallocated when you exit Windows. You will need to restart Windows after making the above changes.
<p>This will leave about 32-34 MB free for Windows to allocate for itself and dole out to other Windows programs during the current Windows session. This is plenty for almost all Windows applications. <span id="summary"></span></p>
<h2 id="summary">Summary</h2>
<ol type="1">
<li>Make sure the computer recognizes the extra memory.</li>
<li>Note which application(s) need the extra memory and configure your memory to that.</li>
<li>Tweak <a href="#conventional">conventional memory</a> to maximize it on bootup. Use HIMEM.SYS and EMM386.EXE.</li>
<li>Tweak <a href="#extended">extended memory</a> for DOS and for Windows. Use the SMARTDRV.EXE cache for DOS and the Windows cache for Windows.</li>
</ol>
<p>Now that you have configured your WFWG 3.11 computer memory, perhaps you would like to <a href="../service/win311.html">put it on your local network.</a> Why not?</p></td>
</tr>
</tbody>
</table>

|                              |
|------------------------------|
| [My Writings](writings.html) |

------------------------------------------------------------------------

[Write to me](reply.html)\
Last updated : July 16, 2004\
Copyright 1996-1997 by Al Wong, Los Angeles, California, USA
