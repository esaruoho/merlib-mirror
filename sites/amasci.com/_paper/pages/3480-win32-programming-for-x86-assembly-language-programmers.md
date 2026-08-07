---
title: "Win32 Programming for x86 Assembly Language Programmers"
source_domain: amasci.com
source_path: ~htak/win32asm/index.html
order: 3480
reachable_from_entry: false
images: 0
internal_links: 21
extracted: 2026-08-07T17:10:07Z
extractor: site_to_paper.py (pandoc)
---

# Win32 Programming for x86 Assembly Language Programmers

*Source page: `~htak/win32asm/index.html`*

# Win32 Programming for x86 Assembly Language Programmers

Welcome to the world of Win32 programming.\
That's right! It's not impossible to write a Windows program in assembly language.\
My focus here is on using the basic Windows system calls. You should know, or learn from other resources, how to write code for the Intel x86 processors (and compatibles). I have used the Intel syntax for machine instructions, so the information here should be useful for those familiar with the MASM (by Microsoft) or the TASM (by Borland/Inprise) assemblers.\
I assume you have **used** Windows programs, but I **don't** assume you have **written** a Windows program.

The core set of basic system calls is called the ***Win32 API*** (application programming interface).\
The Win32 API was once called the SDK interface because it was the original interface supported by Microsoft's Windows SDK (Software Development Kit). This was to distinguish it from the MFC (Microsoft Foundation Classes) interface created for C++. Microsoft now supports more than one SDK. The Win32 API is supported by the Platform SDK.

Example code has been tested on Win98 SE (second edition) with TASM 4.0 and the linker and libraries from VC++ 4.0.\
No attempt has been made to make these programs compatible with NT 3.xx. \[See [Win32 Platforms](winplat.htm).\]

- [Programming](#sdkpgm)\
   
- [Download source code and Web pages](win32hst.zip)
- [Download source code without the Web pages](win32src.zip)\
   
- [Web **links** and other resources](links.htm)
- [Win32 Platforms](winplat.htm)
- [Notes for MASM programmers](asmdiff.htm)

### <span id="sdkpgm"></span>Programming

- The very beginnings
  - [Introduction to Console Applications and Files](conapp.htm)
  - [A Basic Win32 GUI Program--WINBASIC.ASM](winbasic.htm)
  - [Translating Win32 Documentation](winxlate.htm)
- Some fundamentals
  - [Popup Windows and Ownership](winowner.htm)
  - [Child Windows](winchild.htm)
  - [A Little More on Messages and an Introduction to the Mouse](winmsg01.htm)
  - [Introduction to Graphics](wingdi01.htm)
  - [Refreshing with WM_PAINT](wingdi02.htm)
  - [Introduction to Controls](winctl.htm)
- Message loops
  - [Conventional and Thread Message Loops](wincmsg.htm)
  - [Greedy Message Loop](wingmsg.htm)
- GUI topics
  - Standard Controls
    - [BUTTON](winbtn.htm)
  - [Introduction to Menus](winmenu.htm)
  - [Introduction to Dialogs](windlg.htm)
- Non-GUI topics
- Other topics
  - [Window Styles](winwnd.htm)
  - [Deadlock Theory](hardcore.htm#deadlock)
  - [More Programming Information](hardcore.htm)
  - [The Rest of Windows](winelse.htm)

------------------------------------------------------------------------

\
*Name change, January 3, 2001.*\
*Updated February 5, 2001.*\
*Links updated February 7, 2001*\
Comments and criticisms can be sent to [Henry Takeuchi, htak@eskimo.com](mailto:htak@eskimo.com).\
