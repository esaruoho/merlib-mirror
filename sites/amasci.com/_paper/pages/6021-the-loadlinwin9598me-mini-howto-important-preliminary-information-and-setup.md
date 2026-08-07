---
title: "The Loadlin+Win95/98/ME mini-HOWTO: IMPORTANT: Preliminary Information and Setup"
source_domain: amasci.com
source_path: ~praxis/Loadlin+Win95-98-ME-3.html
order: 6021
reachable_from_entry: false
images: 6
internal_links: 4
extracted: 2026-08-07T05:58:51Z
extractor: site_to_paper.py (pandoc)
---

# The Loadlin+Win95/98/ME mini-HOWTO: IMPORTANT: Preliminary Information and Setup

*Source page: `~praxis/Loadlin+Win95-98-ME-3.html`*

[![Next](next.gif)](Loadlin+Win95-98-ME-4.html) [![Previous](prev.gif)](Loadlin+Win95-98-ME-2.html) [![Contents](toc.gif)](Loadlin+Win95-98-ME.html#toc3)

------------------------------------------------------------------------

## <span id="s3">3. IMPORTANT: Preliminary Information and Setup</span>

## <span id="ss3.1">3.1 Windows ME Users</span>

Before your read any further, I should mention that this mini-howto has some limitations with Windows ME. Based on feedback from Windows ME users, the menuing system described in the next section will only work from a Windows boot floppy instead of from the hard drive. Thanks to Olivier Guichard for pointing me to the relevant [Microsoft article](http://support.microsoft.com/support/kb/articles/Q274/6/46.ASP).

Note that only the `config.sys` and `autoexec.bat` files need to be on the floppy disk. All other files mentioned may reside on the hard drive.

If booting from a floppy is not an option for you, then please see the [FAQ](Loadlin+Win95-98-ME-5.html#FAQ) section for alternatives to LILO and Loadlin.

Any Windows ME users who can find a better way than using a floppy, please [let me know](mailto:protek@firstlinux.net) your solution so I can include it in this mini-howto.

## <span id="ss3.2">3.2 Things that are assumed:</span>

- You have successfully installed Windows 95/98/ME.
- Windows 95/98/ME is installed on Drive C.
- You have successfully installed Linux.
- You know what partition Linux is installed on.
- LILO is NOT installed on your hard drive.

## <span id="ss3.3">3.3 Items you need before you start:</span>

- The Loadlin.exe program file
- Your kernel image file, usually bzImage or vmlinuz. (See the [FAQ](Loadlin+Win95-98-ME-5.html#FAQ) for info).

------------------------------------------------------------------------

[![Next](next.gif)](Loadlin+Win95-98-ME-4.html) [![Previous](prev.gif)](Loadlin+Win95-98-ME-2.html) [![Contents](toc.gif)](Loadlin+Win95-98-ME.html#toc3)
