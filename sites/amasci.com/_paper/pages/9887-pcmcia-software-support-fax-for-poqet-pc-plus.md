---
title: "PCMCIA Software Support Fax for Poqet PC Plus"
source_domain: amasci.com
source_path: ~webguy/service/poqetfax.html
order: 9887
reachable_from_entry: false
images: 0
internal_links: 4
extracted: 2026-08-07T17:18:14Z
extractor: site_to_paper.py (pandoc)
---

# PCMCIA Software Support Fax for Poqet PC Plus

*Source page: `~webguy/service/poqetfax.html`*

<table data-border="0" width="85%">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td><h1 id="pcmcia-software-support-for-fujitsu-poqet-pc-plus-computer">PCMCIA Software Support for<br />
Fujitsu Poqet PC Plus Computer</h1>
This is the fax I received from Fujitsu's Technical Support Department regarding connecting a PCMCIA modem card to the PC Plus. I am retyping this fax verbatim in HTML. I absorb all fault to any misspellings or grammatical errors. Any comments between the square brackets, [], are mine.
<p>Again, many thanks to Javed Ahmed of Fujitsu Technical Support for his assistance. Javed is really a very helpful guy! He also wrote on the fax cover page, <em>You should also know that the PCMCIA compliance is 2.0 JEIDA 4.1 for the slot[s].</em></p>
<p>It should be noted here that <a href="poqetmeg.html">some variations of the Megahertz XJ1144 modem</a> will also work with the PC Plus.</p>
<hr />
<h1 id="pcmcia-software-support">PCMCIA Software Support</h1>
Dated: 10/15/93
<h2 id="socket-services">Socket Services</h2>
The purpose of socket services is to provide a layer of software support to the actual PCMCIA hardware that controls PCMCIA-compatible sockets for PCMCIA cards. For more information on socket services, please refer to the <em>Socket Services Interface Specification, Release 1.01.</em>
<p>The PoqetPC Plus' PCMCIA socket services are provided in the following three driver files, which are preloaded on drive D: of the Poqet Plus Series computers:</p>
<ul>
<li>PQSS.EXE</li>
<li>PQCCU.EXE</li>
<li>PQCARD.COM</li>
</ul>
<p>These drivers are not required for access to Revision 1.0 SRAM cards. Only PQSS.EXE an PQCCU.EXE are required for access to Revision 2.0 SRAM cards or to the <strong>AT&amp;T Paradyne Keep-In-Touch card.</strong> [My emphasis] Those two files plus PQCARD.COM are required for access to a SunDisk.</p>
<p><strong>Loading the Driver Files from CONFIG.SYS</strong></p>
<p>The default CONFIG.SYS file loads all three PCMCIA socket services drivers and looks like this:</p>
<p><code> </code></p>
<pre><code>
FILES=20
BUFFERS=20
DEVICE=C:\OS$CLOCK.SYS
REM DEVICE=D:\RAMDISK.SYS 32
DEVICE=D:\PQSS.EXE
DEVICE=D:\PQCCU.EXE
INSTALL=D:\PQCARD.COM</code></pre>
<p><strong>Note:</strong> The default CONFIG.SYS file shown above resides on drive C. It is regenerated from the ROM drive D every time the system is reset or power is applied after a complete loss of power (including loss of bridge battery power). Any changes you have made to the CONFIG.SYS file on drive C will be lost when this happens. Therefore, if you want to change the default CONFIG.SYS file, you should first copy it to a SRAM card in drive A or drive B. Then make sure that the card is present whenever you boot the system. By default, if the system finds CONFIG.SYS in either drive A or drive B, it will use that CONFIG.SYS rather than the default CONFIG.SYS on drive C.</p>
<p><strong>Loading the Driver Files from AUTOEXEC.BAT</strong></p>
<p>By default, PQSS.EXE, PQCCU.EXE, and PQCARD.COM are loaded from the CONFIG.SYS file. You can, however, load them from the AUTOEXEC.BAT file, though this is not recommended. If you do load these files from AUTOEXEC.BAT, all three must be loaded before the PQAUTO command, which appears on line 3 of the default AUTOEXEC.BAT file. If you add the three PCMCIA driver files to the AUTOEXEC.BAT file, the file should look like this (the socket services driver files are shown in bold face):</p>
<p><code> </code></p>
<pre><code>
@ECHO OFF
PATH=C:\
D:\PQSS
D:\PQCCU
D:\PQCARD
PQAUTO
IF NOT ERRORLEVEL 2 \AUTOEXEC
IF ERRORLEVEL 3 \AUTOEXEC
KEYMOUSE
PROMPT $P$G
ECHO Ref R3.02
VER
PQTIME
IF NOT ERRORLEVEL 4 GOTO NOTIME
DATE
TIME
:NOTIME
C:</code></pre>
<p>[Does anyone have a copy of KEYMOUSE? My PC Plus didn't come with it.]</p>
<p><strong>Note:</strong> The default AUTOEXEC.BAT file on drive C does not load the socket services driver files. That AUTOEXEC.BAT file is regenerated from ROM drive D every time the system is reset or power is applied after a complete loss of power (including loss of bridge battery power). Thus, any changes you make to the default AUTOEXEC.BAT file will be lost when either of those events occurs. To make lasting changes to the AUTOEXEC.BAT file, you must first copy it to a SRAM card in drive A or drive B, and then make your changes. As long as the card containing the modified AUTOEXEC.BAT is present at boot time, and as long as you haven't changed the AUTOEXEC.BAT search path in System Setup, the system will execute the AUTOEXEC.BAT file it finds on A or B, and will never reach the default AUTOEXEC.BAT on C.</p>
<p><strong>Loading the Driver Files for Use with an AT&amp;T Paradyne KeepInTouch Card</strong></p>
<p>The Keep-In-Touch card, like Revision 2.0 SRAM cards, requires the PQSS and PQCCU drivers. If the driver files are loaded in CONFIG.SYS, their respective lines should look like this:</p>
<p><code> </code></p>
<pre><code>
DEVICE=D:\PQSS.EXE
DEVICE=D:\PQCCU.EXE [/C&lt;PORT&gt;,[&lt;IRQ&gt;]]</code></pre>
<p>where &lt;PORT&gt; is the COM port the modem should occupy, and &lt;IRQ&gt; is the Interrupt Request Vector that the modem should use. You can, if you want, specify &lt;PORT&gt; without specifying &lt;IRQ&gt;. The default value of &lt;PORT&gt; is COM1. The default value of &lt;IRQ&gt; is IRQ4 for COM1 and IRQ3 for COM2.</p>
<p>If the drivers are executed from the command line or from AUTOEXEC.BAT, the commands should look like this:</p>
<p><code> </code></p>
<pre><code>
PQSS
PQCCU [/C[&lt;PORT&gt;,[&lt;IRQ&gt;]]</code></pre>
<p>where &lt;PORT&gt; and &lt;IRQ&gt; are as explained above.</p></td>
</tr>
</tbody>
</table>

\

|                                            |
|--------------------------------------------|
| [Fujitsu Poqet PC Plus Review](poqet.html) |

[Write to me](../writings/reply.html)\
Last updated : April 29, 2001\
Copyright 1999-2001 Al Wong, Los Angeles, California, USA

[\
\
](../chaff.html)
