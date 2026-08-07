---
title: "The Loadlin+Win95 mini-HOWTO: *** Use this section ONLY if you are using a DOS 6.x boot disk.***"
source_domain: amasci.com
source_path: ~praxis/loadlin-4.html
order: 6035
reachable_from_entry: false
images: 6
internal_links: 3
extracted: 2026-08-07T05:58:52Z
extractor: site_to_paper.py (pandoc)
---

# The Loadlin+Win95 mini-HOWTO: *** Use this section ONLY if you are using a DOS 6.x boot disk.***

*Source page: `~praxis/loadlin-4.html`*

[![Next](next.gif)](loadlin-5.html) [![Previous](prev.gif)](loadlin-3.html) [![Contents](toc.gif)](loadlin.html#toc4)

------------------------------------------------------------------------

## <span id="Section 4"></span> <span id="s4">4. \*\*\* Use this section ONLY if you are using a DOS 6.x boot disk.\*\*\*</span>

## <span id="ss4.1">4.1 Edit and Rename your DOS 6.x system files.</span>

- Open Notepad. On the Menu Bar, click on Open. Change "Files of type" to "All files (\*.\*)". Change "Look in:" from Desktop to Drive C. Now open Config.dos by double clicking on the filename. Delete all the contents. Now, you will need to enter the shell command with the following syntax:

> ` `
>
> ------------------------------------------------------------------------
>
>
>
>      shell=loadlin.exe LinuxKernelFile root=/dev/LinuxBootPartition ro
>
> ------------------------------------------------------------------------

Here is my Config.dos file as an example:

> ` `
>
> ------------------------------------------------------------------------
>
>
>
>      shell=f:\loadlin.exe f:\vmlinuz root=/dev/hdc2 ro
>
> ------------------------------------------------------------------------

**NOTE:** The Loadlin and kernel file may be anywhere on your hard drive as long as you reference the correct path. For example, if your Loadlin file was in the directory f:\utils and the kernel file was located in the directory e:\linux\kernels you would use:

> ` `
>
> ------------------------------------------------------------------------
>
>
>
>      shell=f:\utils\loadlin.exe e:\linux\kernels\vmlinuz root=/dev/hdc2 ro
>
> ------------------------------------------------------------------------

- Save the file.

------------------------------------------------------------------------

[![Next](next.gif)](loadlin-5.html) [![Previous](prev.gif)](loadlin-3.html) [![Contents](toc.gif)](loadlin.html#toc4)
