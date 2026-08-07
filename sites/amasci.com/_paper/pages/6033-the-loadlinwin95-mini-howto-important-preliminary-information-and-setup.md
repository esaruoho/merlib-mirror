---
title: "The Loadlin+Win95 mini-HOWTO: IMPORTANT: Preliminary Information and Setup"
source_domain: amasci.com
source_path: ~praxis/loadlin-2.html
order: 6033
reachable_from_entry: false
images: 6
internal_links: 4
extracted: 2026-08-07T05:58:51Z
extractor: site_to_paper.py (pandoc)
---

# The Loadlin+Win95 mini-HOWTO: IMPORTANT: Preliminary Information and Setup

*Source page: `~praxis/loadlin-2.html`*

[![Next](next.gif)](loadlin-3.html) [![Previous](prev.gif)](loadlin-1.html) [![Contents](toc.gif)](loadlin.html#toc2)

------------------------------------------------------------------------

## <span id="s2">2. IMPORTANT: Preliminary Information and Setup</span>

## <span id="ss2.1">2.1 WARNING! for Windows95 OSR2 (version 4.00.950b) users:</span>

Do **NOT** attempt [dual booting with Windows 95](http://www.compuclinic.com/osr2faq/index.html#dualboot) without first consulting the [Windows 95 OSR2 FAQ](http://www.compuclinic.com/osr2faq/). The FAQ also contains a great deal of information regarding [FAT32](http://www.compuclinic.com/osr2faq/index.html#fat32). In a nutshell, if you have OSR2 and are using a FAT16 file system, you can still dual boot using the F4 Function Key.

**NOTE: If you have Windows 95 OSR2, and are using a FAT32 file system, then the dual booting methods in this mini-HOWTO using the F4 Function Key *will not work and should not be attempted.***

However, there are a couple of alternate methods you can use to automate booting Linux at startup, which are discussed in [Section 6](loadlin-6.html#Section%206).

## <span id="ss2.2">2.2 Things that are assumed:</span>

- You have successfully installed Windows 95.
- Windows 95 is installed on Drive C.
- You have successfully installed Linux.
- You know what partition Linux is installed on.
- LILO is NOT installed on your hard drive.
- If you are using Windows 95 OSR2 (version 4.00.950b), you have carefully read the [Windows95 OSR2 FAQ](http://www.compuclinic.com/osr2faq/).

## <span id="ss2.3">2.3 Items you need before you start:</span>

- <span id="Section 2.3"></span> A bootable floppy disk with DOS 5.0 or DOS 6.x system files (io.sys, msdos.sys, command.com) and a config.sys file. If you are using a DOS 5.0 boot disk, you will also need an autoexec.bat file. If you are using Windows 95 OSR2 (version 4.00.950b), you will also need to create a file called Winboot.sys with a text editor and place it in the root directory of Drive C. Winboot.sys can be an empty file, just so long as you have the file.

<span id=""NOTE:" of Section 2.3"></span> **NOTE:** If your hard drive already contains the autoexec.dos, config.dos, io.dos, msdos.dos, and command.dos files, then you will not need the floppy. You can check by typing: `dir` **and** `dir /ah` at the root of Drive C. Also, if you installed the upgrade version of Windows 95, then it is likely that you have them.

- The Loadlin.exe program file
- Your kernel image file,usually zImage or vmlinuz. (See the [FAQ](loadlin-7.html#FAQ) for info).
- A simple text editor, such as Notepad.

------------------------------------------------------------------------

[![Next](next.gif)](loadlin-3.html) [![Previous](prev.gif)](loadlin-1.html) [![Contents](toc.gif)](loadlin.html#toc2)
