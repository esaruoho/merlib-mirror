---
title: "Scott's Windows Software"
source_domain: amasci.com
source_path: ~scottlu/win/index.html
order: 7682
reachable_from_entry: false
images: 5
internal_links: 5
extracted: 2026-08-07T06:00:17Z
extractor: site_to_paper.py (pandoc)
---

# Scott's Windows Software

*Source page: `~scottlu/win/index.html`*

<table data-cellpadding="4">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td data-valign="bottom"><strong>Windows</strong></td>
<td><img src="../scott.gif" data-border="0" width="450" height="77" alt="Scott&#39;s Logo (16K)" /></td>
</tr>
<tr>
<td width="15%" data-valign="top"><ul>
<li><a href="../index.html">Home</a></li>
<li><a href="../pilot/index.html">Pilot games</a></li>
<li><a href="../wince/index.html">Win CE</a></li>
<li><a href="../psion5/index.html">EPOC</a></li>
<li><a href="../dv/index.html">daVinci games</a></li>
<li><a href="mailto:scottlu@eskimo.com">Comments</a></li>
</ul></td>
<td data-valign="top"><strong>Welcome!</strong> This is my page for software I've written for Windows.
<p>Comments?  You can send me comments and feedback at <a href="mailto:scottlu@eskimo.com">scottlu@eskimo.com</a>.</p>
<hr />
<p><strong>EZSetup v1.1 - A WinCE Setup App Creation Tool</strong></p>
<p>v1.1 Released 07/21/01</p>
<p>If you are a WinCE author and are looking for an inexpensive way to create / obtain a setup program, look at EZSetup! Once you have created your .cab files (as described in the WinCE SDK), you are ready to use EZSetup. EZSetup takes your .cab files and *outputs* a compressed, self-contained, self-extracting Windows setup program that will set up your WinCE software. <a href="../wince/index.html">PocketChess for Windows CE</a> uses this tool for its setup requirements. The result is a single executable that will set up your WinCE app simply by clicking on the download link! You provide EZSetup with a readme.txt file, a eula.txt file (end-user license agreement), and your .ini &amp; .cabs, and it'll output a setup program ready to be used. It is really simple to use. Save yourself the time and effort trying to make your own setup program or purchasing  expensive alternatives!</p>
<p><strong>EZSetup is free software, released under the <a href="http://www.gnu.org/copyleft/gpl.html">Gnu Public License</a>.</strong></p>
<p><a href="ezsetup.exe"><img src="../squiggle2.gif" data-border="0" width="15" height="11" /> <strong>Download EZSetup v1.1</strong></a></p>
<p>The source code for EZSetup is available under <strong><a href="http://www.gnu.org/copyleft/gpl.html">Gnu Public License</a></strong>. EZSetup is a free alternative to the expensive 3rd party install application creation tools. Help make EZSetup better for the whole WinCE developer community!</p>
<p><a href="EZSetupSourceCode.zip"><img src="../squiggle2.gif" data-border="0" width="15" height="11" /> <strong>Download EZSetup v1.1 Source Code</strong></a></p>
<p><strong>What's new in v1.1: </strong> Specify English, German, or French for localized installer text. Also fixed a bug when EzSetup was run on a path with spaces.</p>
<p>For more info contact me at: <a href="mailto:scottlu@eskimo.com">scottlu@eskimo.com</a>.</p>
<hr />
<p><strong>CExe Executable Compressor v1.0b</strong></p>
<p>Compress any executable! With CExe, you can compress any executable and make it significantly smaller and still fully functional. This is useful for sending executables in email, downloading executables over the net, fitting executables on floppies, etc. CExe can compress Win32 executables, Win16 executables, OS/2 executables, WinNT Posix executables... the output format is *always* Win32 executable format.</p>
<p>CExe has 2 compressors built into it, and picks the one that makes the result the smallest. For smaller files, it uses LZExpand to decompress, which is part of Windows. For larger files (.exe files are usually large!), it uses the free and incredibly useful <a href="http://www.cdrom.com/pub/infozip/zlib/">ZLib Library</a> for decompression. In the case of using ZLib, the decompressor itself is decompressed using LZExpand and then used, resulting in a smaller overall compressed file size.</p>
<p>At this time the tool runs on NT only - if someone were willing to write resource writing code it would be working on Win95/98 too (the BeginUpdateResource()... apis aren't implemented on Win95/98).</p>
<p>The compressed executables it creates work on any Windows platform.</p>
<p>Here are some results:</p>
<table data-border="1" width="433">
<tbody>
<tr>
<td width="112"><strong>Program</strong></td>
<td width="104"><strong>Old size (bytes)</strong></td>
<td width="116"><strong>New size (bytes)</strong></td>
<td width="77"><strong>Percent Savings</strong></td>
</tr>
<tr>
<td width="112">mspaint.exe</td>
<td width="104">339728</td>
<td width="116">170496</td>
<td width="77">49.81%</td>
</tr>
<tr>
<td width="112">excel.exe</td>
<td width="104">5604624</td>
<td width="116">3492352</td>
<td width="77">37.69%</td>
</tr>
<tr>
<td width="112">winhlp32.exe</td>
<td width="104">311056</td>
<td width="116">178688</td>
<td width="77">42.55%</td>
</tr>
<tr>
<td width="112">sort.exe</td>
<td width="104">24848</td>
<td width="116">14848</td>
<td width="77">40.24%</td>
</tr>
<tr>
<td width="112">winver.exe</td>
<td width="104">20752</td>
<td width="116">12800</td>
<td width="77">38.32%</td>
</tr>
<tr>
<td width="112">sw98.exe</td>
<td width="104">124416</td>
<td width="116">50688</td>
<td width="77">59.26%</td>
</tr>
</tbody>
</table>
<p>In the spirit of the fantastic &amp; free ZLib, and the fact that there are so many <strong>non-free</strong> exe compressors on the market, I am <strong>making cexe freely available.</strong></p>
<p><a href="cexe.exe"><img src="../squiggle2.gif" data-border="0" width="15" height="11" /> <strong>Download CExe v1.0b</strong></a></p>
<p>The source code for CExe is available under <strong><a href="http://www.gnu.org/copyleft/gpl.html">Gnu Public License</a></strong>. Help make CExe better for the Windows community!</p>
<p><a href="CExeSourceCode.zip"><img src="../squiggle2.gif" data-border="0" width="15" height="11" /> <strong>Download CExe v1.0b Source Code</strong></a></p>
<p>For more info contact me at: <a href="mailto:scottlu@eskimo.com">scottlu@eskimo.com</a>.</p></td>
</tr>
</tbody>
</table>
