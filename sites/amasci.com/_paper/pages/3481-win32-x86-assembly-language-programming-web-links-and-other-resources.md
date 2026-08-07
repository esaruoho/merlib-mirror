---
title: "Win32 x86 Assembly Language Programming - Web Links and Other Resources"
source_domain: amasci.com
source_path: ~htak/win32asm/links.htm
order: 3481
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T17:10:07Z
extractor: site_to_paper.py (pandoc)
---

# Win32 x86 Assembly Language Programming - Web Links and Other Resources

*Source page: `~htak/win32asm/links.htm`*

Win32 x86 Assembly Language Programming\
Web Links and Other Resources
========================================

- [Web resources](#weblinks) - includes a Web message board
- [Newsgroups](#newsgroups)
- [Further reading](#readmore)

[Back to Win32 ASM Page.](win32asm.htm)

### <span id="weblinks"></span>Web resources

[Win32ASM Message Board](http://board.win32asmcommunity.net)\
A Web-based message board for discussing Win32 programming in ASM.

[Iczelion's Win32 Assembly Language Page](http://win32asm.cjb.net)\
This site has another excellent Win32 ASM tutorial. Takes advantage of MASM features. You can even download MASM32, a complete Win32 development kit, including the Microsoft assembler and linker needed for Iczelion's tutorial.\
It also has a great set of Win32 ASM links and d/l'able files. Part of a webring.\
If you have trouble accessing this excellent site, try a mirror:\
           <http://spiff.tripnet.se/~iczelion/>\
           <http://win32assembly.online.fr/>\
           <http://users.daex.ufsc.br/~iczelion/>\
           <http://203.157.250.93/win32asm/>

[Platform SDK](http://msdn.microsoft.com/platformsdk)\
A collection of useful resources that Microsoft allows developers to download, for free.\
The Build Environment is the basic component.\
The Toolkit component is probably useful, too.

[MSDN Online Documentation](http://msdn.microsoft.com/library/default.asp)\
Navigate using the table of contents (toc). The overviews and descriptions of core API functions are documented under Platform SDK.

[Assembly Language Programming](http://webster.cs.ucr.edu/)\
This contains Randall Hyde's extensive guide to Intel x86 programming.\
    Included is a course on 32-bit assembly language programming that uses Randy's own HLA (High Level Assembler, not to be confused with the IBM mainframe assembler).

[Intel Secrets](http://www.x86.org/secrets/intelsecrets.htm)\
Home of "undocumented" Intel.

[File Formats at wotsit.org](http://www.wotsit.org/)\
A number of common file formats, including Windows files and binaries, are available as links or in downloadable files.

[GoRC resource compiler](http://www.godevtool.com/)\
A free resource compiler for processing .RC files, the standard text-oriented way of creating resources.

[ALINK x86 linker](http://alink.home.dhs.org/)\
A free linker for creating Win32 EXE's and DLL's with both OMF and MS-COFF files. Also can build DOS programs. Great for TASM users who want to link to COFF libraries supplied by Microsoft.\

[WALK32 v1.00](walk32_1.zip)\
An unconventional MASM 6.xx-based linker system for creating Win32 EXE's and DLL's. Includes a more extensive include file for Win32 ASM programmers.

### <span id="newsgroups"></span>Newsgroups

[comp.lang.asm.x86](news:comp.lang.asm.x86) -- moderated\
A mix of 80x86 topics which include DOS, Windows, OS/2, and Linux programming.

[comp.os.ms-windows.programmer.win32](news:comp.os.ms-windows.programmer.win32)\
For discussion of Win32 (SDK) API programming. Originally for NT, but also relevant for Win9x programmers. Most posters are programming in C. As a result, it may be hard to get answers if questions are phrased in ASM. Please post only API questions.

[comp.os.ms-windows.programmer.vxd](news:comp.os.ms-windows.programmer.vxd)\
VxDs were used earlier by Win3.1. Among the standard services that VxDs provide to Win9x are memory management, thread management, and a quasi-DOS interface. Can be used to build drivers and other low-level services.\
Cannot be used by NT. (This includes Windows 2000.)

### <span id="readmore"></span>Further reading

#### Basic Win32 programming

<u>Petzold, Charles, *Programming Windows, Fifth Edition*</u>, ISBN 1-57231-995-X\
Yet another edition. It should be called "Programming Win32" because the first three editions were for Win16 (the fourth edition specifically mentioned Win95). The most often recommended author of Windows GUI programming using the API. Because example programs are in C, there is very little hidden code.

<u>Rector & Newcomer, *Win32 Programming*</u>\
Another extensive look at the Windows API in C.

<u>Richter, Jeffrey, *Advanced Windows, 3rd Edition*</u>\
Once you've read Petzold, you need one of Richter's Win32 books to cover other API topics.

<u>Kauler, Barry, *Windows Assembly Language and Systems Programming, 2nd ed.*</u>\
So far, the only book I've found that covers Win32 programming for ASM programmers.

<u>Simon, Gouker & Barnes, *Windows 95 Win32 Programming API Bible*</u>\
The first book in a three-volume **reference** by Waite Press. Definitely **not** a tutorial! For those of us who prefer flipping pages, rather than pointing and clicking or typing in search keys, to find information.

#### User interfaces

<u>Cooper. Alan, *About Face: The Essentials of User Interface Design*</u>, ISBN 1-56884-322-4\
A thought provoking book on user interface design.

#### Windows internals

<u>Pietrek, Matt, *Windows Internals*</u>, ISBN 0-201-62217-3\
See what Win32 had to emulate. This book gives you insight into the workings of message passing, window management, and the GDI.

<u>Pietrek, Matt, *Windows 95 System Programming Secrets*</u>, ISBN 1-56884-318-6\
Builds on the previous book. Covers some changes to internal data structures. And new topics such as threading,16/32-bit thunking, and the PE/COFF file format. Comes with utilities that give you a lot of detail about the windows, processes, and threads in your running Win95 system.

<u>Davis & Wallace, *Windows Undocumented File Formats*</u>\
All those new file types in Win95! See what the authors have uncovered.

#### WDM device drivers

WDM drivers are capable of running in Win98, WinME, and Win2k.

<u>Oney, Walter, *Programming the Microsoft Windows Driver Model*</u>, ISBN 0-7356-0588-2\
An official book on programming WDM device drivers. CD has a wizard for building drivers. Study the generated C code and convert it to ASM.

<u>Cant, Chris, Writing *Windows WDM Device Drivers*</u>, ISBN 0-87930-565-7\
Packs a lot of information, but not as well organized as Oney's book.

------------------------------------------------------------------------

Comments and criticisms can be sent to [Henry Takeuchi, htak@eskimo.com](mailto:htak@eskimo.com).\
