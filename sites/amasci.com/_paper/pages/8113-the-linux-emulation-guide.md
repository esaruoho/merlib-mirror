---
title: "The Linux Emulation Guide"
source_domain: amasci.com
source_path: ~slack/emu.html
order: 8113
reachable_from_entry: false
images: 16
internal_links: 1
extracted: 2026-08-07T17:15:45Z
extractor: site_to_paper.py (pandoc)
---

# The Linux Emulation Guide

*Source page: `~slack/emu.html`*

<img src="img/icon-emu.gif" data-border="0" /> A guide to emulation on linux

------------------------------------------------------------------------

<img src="img/disc.gif" data-border="0" alt="*" /> == download\
<img src="img/link.gif" data-border="0" alt="*" /> == download link (my other webspace)

------------------------------------------------------------------------

Caution! Warning! Disclaimer!: roms you do not own must be deleted within 24 hours.

------------------------------------------------------------------------

Computers / Operating systems:\
\[[Intel x86](#x86)\] \[[Dos](#dos)\] \[[Windows 3.1](#win)\] \[[Amiga](#amiga)\] \[[Macintosh](#mac)\] \[[AppleII](#appleII)\] \[[Atari ST](#atarist)\] \[[MSX](#msx)\] \[[C64](#c64)\] \[[C128](#c64)\] \[[VIC20](#c64)\] \[[PET](#c64)\] \[[PDP 11](#pdp)\]

Game systems:\
\[[SuperNES](#snes)\] \[[NES](#nes)\] \[[GameBoy](#gb)\] \[[Lynx](#lynx)\] \[[PC-Engine](#vpce)\] \[[Sega Mastersystem/GameGear](#sms)\] \[[Coleco](#coleco)\]

Misc:\
\[[HP-48](#hp48)\] \[[USR Pilot](#pilot)\] \[[TI-92](#ti92)\]

------------------------------------------------------------------------

<span id="x86">\* Intel x86</span>

  Bochs:\

This nifty program emulates x86 systems, meaning once its completed you can boot win95, another linux, plan9, etc in an X window. I managed to get minix and win3.1 working on it,I didn't try win95 because i dont have it, although it is said to run. Graphics are slow, even on a ppro200 and a diamond stealth 64 2mb vram

homepage: <http://world.std.com/~bochs>

------------------------------------------------------------------------

<span id="dos">\* Dos</span>

-   DOSEMU:\

A stable dos emulator for console and X (limited graphic support in X), runs pretty much anything except certian graphical & sound apps, got doom working in it though.

homepage: <http://www.suse.com/~dosemu/>\
how-to: <http://sunsite.unc.edu/mdw/HOWTO/DOSEMU-HOWTO.html>\
ftp: <ftp://tsx-11.mit.edu/pub/linux/ALPHA/dosemu/>\
You'll also need: Any old dos operating system, ms-dos, dr. dos, [opendos](http://www.caldera.com/dos/).....\

------------------------------------------------------------------------

<span id="win">\* Windows 3.1</span>

-   Wine:\

Beta emulator, runs less programs then wabi but I got an older groliers electronic encyclopedia working. Networking works too (mIrc works, for those who enjoy pain). Runs 16 bit netscape, wabi dosnt, can also run several win95 programs (mspaint, wordpad, mirc32?)...

faq: <http://www.asgardpro.com/wine/>\
homepage: <http://www.winehq.com/>\
ftp: <ftp://tsx-11.mit.edu/pub/linux/ALPHA/Wine/>

-   Wabi:\

A MUCH more stable emulator then wine, the only drawback is that it costs 200 bucks

homepage: <http://www.caldera.com/wabi/>\
You'll also need: Microsnot Windows 3.1

-   The Blue Screen of Death for Linux:\

Very accurate....

ftp: <ftp://uiarchive.uiuc.edu/pub/systems/linux/sunsite/system/emulators/bsod.tar.gz>

------------------------------------------------------------------------

<span id="amiga">\* Amiga</span>

-   UAE:\

A very stable emulator, free source code, ported to many systems. Version 0.6.0 is incompatible with newer binutils, but 0.6.8-beta seems pretty stable.

Homepage: <http://www.freiburg.linux.de/~uae/>\
<img src="img/disc.gif" data-border="0" alt="*" />You'll also need: [kickstart-3.1.rom.gz](download/kickstart-3.1.rom.gz)(313326 bytes)\
<img src="img/disc.gif" data-border="0" alt="*" />You also might want: [a workbench 3.1 bootdisk](download/workbench.zip)(431465 bytes)\
Software links:\

------------------------------------------------------------------------

<span id="mac">\* Macintosh</span>

-   vMac:\

Beta freeware mac-plus emulator, emulates a mac plus, can run system 7.5.5

homepage: <http://leb.net/vmac/>\
<img src="img/disc.gif" data-border="0" alt="*" />You'll also need: [Mac+ rom v. 3](download/vmacrom.zip)(92821 bytes)\
<img src="img/disc.gif" data-border="0" alt="*" />[System 6.0.8 bootdisk](download/vmacboot.zip)(756758 bytes)\
<span id="exe"></span>

-   Executor:\

Stable emulator, someone ran photoshop on it I hear, but no network support, and its 100 bucks (you can download a 10-minute per session demo tho).

homepage: <http://www.ardi.com>\

------------------------------------------------------------------------

<span id="appleII">\* AppleII</span>

-   Apple2/Linux:\

Svgalib AppleII emulator, pretty good, sound and joystick support.

ftp: <ftp://sunsite.unc.edu/pub/Linux/system/emulators/apple2-emul-v004-linux.tar.gz>\
<img src="img/disc.gif" data-border="0" alt="*" />You'll also need: [AppleII roms](download/appleIIroms.tar.gz)(10501 bytes)

-   XGS:\

Emulates an appleII GS, can boot the GUI os that came with those.

homepage: <http://www.jurai.org/~funaho/emulators/XGS/>\
<img src="img/disc.gif" data-border="0" alt="*" />You'll also need: [A GS rom](download/xgs.rom.gz)(88954 bytes)\
A version of the os is available at [Apple's ftp site](ftp://ftp.apple.com/Apple.Support.Area/Apple.Software.Updates/US/Apple_II/Apple_IIGS_System_6.0.1/)(They're SFX mac archives, use [executor](#exe) to extract).\

------------------------------------------------------------------------

<span id="atarist">\* Atari ST</span>

-   STonX:\

Looks pretty stable from what ive seen, except its 8 bpp X only and no joystick support yet.

homepage: <http://www.complang.tuwien.ac.at/nino/stonx.html>\
<img src="img/disc.gif" data-border="0" alt="*" />You'll also need: [an image of the st tos rom](download/atari-st.tos206.zip)(129884 bytes)\

------------------------------------------------------------------------

<span id="msx">\* MSX</span>

-   fMSX:\

Looks stable, didnt get to mess with it much. Written by Marat Fayzullin, the same one who did several other emulators listed here.

homepage: <http://www.komkon.org/fms/fMSX>\

------------------------------------------------------------------------

<span id="c64">\* Commodore 64</span>

-   Vice:\

This good set of programs emulates c64s c128s vic20s and pets

homepage: <http://www.tu-chemnitz.de/~fachat/vice/vice.html>\
<img src="img/disc.gif" data-border="0" alt="*" />You'll also need: [roms for all the systems emulated](download/vice-roms.tar.gz)(98628 bytes)

-   Frodo:

\
Better then VICE as far as commodore 64 emulation goes.

homepage: <http://www.uni-mainz.de/~bauec002/FRMain.html>

------------------------------------------------------------------------

<span id="pdp">\* PDP 11, 8, etc</span>

-   Bob Supnik's PDP Emulator:\

Emulates pdp 1,4,7,8,9,11,15's and novas, the pdp11 program can run unix version 5,6,7

ftp site: <ftp://minnie.cs.adfa.oz.au/pub/PDP-11/Sims/Supnik_2.3/>\
You'll also need system software at: <ftp://minnie.cs.adfa.oz.au/pub/PDP-11/Sims/Supnik_2.3/software/>

------------------------------------------------------------------------

<span id="snes">\* Super Nintendo</span>

-   Snes9x:\

The BEST snes emulator out there, sound (!), snapshot saves, game genie, transparancy, super-fx, runs most games.

After months of delay a new version is released which supports alot more\
Now has source code released!\
homepage: <http://www.snes9x.com/>\

-   SNEmul:\

New emulation project, pretty good.

homepage: <http://www.mygale.org/09/cassiop/>\
snes rom links: no.\

------------------------------------------------------------------------

<span id="nes">\* Nintendo</span>

-   iNES:\

This emulator supports saves, has problems with only a few games, shareware for windows, free for unix (no source)

homepage: <http://www.komkon.org/fms/iNES/>

-   Xnes:

\
New nes emulator, ported to linux svgalib.

homepage: <http://emu.simplenet.com/xnes/index.html>

nintendo rom links: no.

------------------------------------------------------------------------

<span id="gb">\* Nintendo Gameboy</span>

-   Virtual GameBoy:\

The BEST gameboy emulator out there, nuff said. Supports saves and game genie codes.

homepage: <http://www.komkon.org/fms/VGB/>

-   Hans de Goede's enhanced VGB:\

Based on vgb 0.7, it supports 16/32-bpp xdisplays, joystick, and has a svgalib version.

homepage: <http://electron.et.tudelft.nl/~jdegoede/index.html>

gameboy rom links: no.\

------------------------------------------------------------------------

<span id="lynx">\* Atari Lynx</span>

-   Handy:\

Linux port of the lynx emulator

homepage: <http://emu.simplenet.com/lynx/>\
Handy homepage: <http://www.geocities.com/SiliconValley/Heights/1148>

------------------------------------------------------------------------

<span id="vpce">  \* TurboGraphx16 / PC-Engine</span>

- VPCE:\

Unix port of VPCE, has sound, runs slow

homepage: <http://www.fortunecity.com/roswell/vanthal/10/index.html>\
VPCE homepage: <http://www.geocities.com/SiliconValley/Way/3340/vpce.html>

------------------------------------------------------------------------

<span id="sms">\* Sega Mastersystem & GameGear</span>

-   MasterGear:\

Havn't found a problem with this one yet. Supports saves.

homepage: <http://www.komkon.org/fms/MG/>\
my upgrade to the 16/32 bpp fix: [is here](software.html)\
rom links: no.

------------------------------------------------------------------------

<span id="coleco">\* Coleco</span>

-   Colem:\

Pretty stable emulator with sound.

homepage: <http://www.komkon.org/fms/ColEm/>

-   Adamem:\

Much better emulator then colem.

homepage: <http://www.komkon.org/~dekogel/adamem.html>\

------------------------------------------------------------------------

<span id="hp48">\* HP-48 Calculator</span>

-   X48:\

Pretty good emulator of the HP48 series, supports data transfers so you can run mario ;\>

ftp: <ftp://sunsite.unc.edu/pub/Linux/system/emulators/x48-0.4.0.tar.gz>(134814 bytes)\
<img src="img/disc.gif" data-border="0" alt="*" />You'll also need: [hp48g.rom.gz](download/hp48g.rom.gz)(329558 bytes)

------------------------------------------------------------------------

<span id="pilot">\* USR Pilot PDA</span>

-   XCopilot:\

The emulation seems stable, but it does something strange with the files it creates, trying to read them causes an I/O error, use at your own risk

homepage: <http://www.isaac.cs.berkeley.edu/pilot/>\
<img src="img/disc.gif" data-border="0" alt="*" />You'll also need: [a personal edition rom](download/pilotrom.zip)(248606 bytes)\
<img src="img/disc.gif" data-border="0" alt="*" />or a [professional edition rom](download/pilot-pro.rom.gz)(454781 bytes)

------------------------------------------------------------------------

<span id="ti92">\* TI-92 Calculator/PDA</span>

-   Tiger:\

New emulator, runs quite a few things already.

homepage: <http://www.student.nada.kth.se/~md94-jmi/tiger/>\
<img src="img/disc.gif" data-border="0" alt="*" />You'll also need: [a rom (v 1.4)](download/ti92.rom.gz)(460222 bytes)

------------------------------------------------------------------------

Misc shit

[ACE Atari 800 emu is here](http://www.csh.rit.edu/~shaggy/software.html)\
[Stella: "A multi-platform Atari 2600 VCS emulator"](http://www4.ncsu.edu/~bwmott/www/2600/)\
[ftp://sunsite.unc.edu/pub/Linux/system/emulators/](ftp://sunsite.unc.edu/pub/Linux/system/emulators/!INDEX.html)\

------------------------------------------------------------------------

[<img src="img/back.gif" data-border="0" alt="&lt;" />Go back..](index.html)
