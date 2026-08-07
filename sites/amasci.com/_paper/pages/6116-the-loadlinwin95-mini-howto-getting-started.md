---
title: "The Loadlin+Win95 mini-HOWTO: Getting started:"
source_domain: amasci.com
source_path: ~praxis/loadlin-3.html
order: 6116
reachable_from_entry: false
images: 6
internal_links: 7
extracted: 2026-08-07T17:13:12Z
extractor: site_to_paper.py (pandoc)
---

# The Loadlin+Win95 mini-HOWTO: Getting started:

*Source page: `~praxis/loadlin-3.html`*

[![Next](next.gif)](loadlin-4.html) [![Previous](prev.gif)](loadlin-2.html) [![Contents](toc.gif)](loadlin.html#toc3)

------------------------------------------------------------------------

## <span id="s3">3. Getting started:</span>

## <span id="ss3.1">3.1 Determine what version of Windows 95 you have.</span>

Boot your computer to Windows 95 and right click on the My computer icon. Now left click on Properties. On the General Tab, look under the "System:" line. There you will see the version number.

## <span id="ss3.2">3.2 Determine if you are using the FAT32 file system.</span>

**NOTE:** If you have Windows 95 version 4.00.950b, *make certain you are **not** using the FAT32 file system*. Double click the My Computer icon, then right click the Drive C icon. Left click on Properties. On the General tab, the "Type:" line will indicate whether or not you have a FAT32 file system. **If you are using the FAT32 file system, then go directly to [Section 6](loadlin-6.html#Section%206)** . Otherwise, continue with **Section 3.3**.

## <span id="ss3.3">3.3 Make sure filename extensions are visible in Windows Explorer.</span>

- Run the Windows Explorer file manager program.
- On the Menu Bar, click on View, then click on Options. On the View Tab, make sure that the "Show all files" radio button is marked. Also, make sure that the line with "Hide MS-DOS file extensions for file types that are registered" is unchecked. Click on the OK button.

**NOTE:** If your hard drive already contains the \*.dos files mentioned in the [NOTE: of Section 2.3](loadlin-2.html#%22NOTE:%22%20of%20Section%202.3), then skip to the next [NOTE:](#%22NOTE:%22). Otherwise, continue with **Section 3.4**.

## <span id="ss3.4">3.4 Rename your system files.</span>

- Insert the DOS 5.0 or DOS 6.x bootable floppy into Drive A. Click on the Drive A icon so you can see the contents on the floppy disk.
- Rename each file to a .dos file extension. You can do this by single clicking on a file, pressing the F2 function key, and typing in the new name. Do not worry if you need the bootable floppy to work properly, just rename the files back after you are finished with this procedure.

## <span id="ss3.5">3.5 Important Warning.</span>

- **EXTREMELY IMPORTANT:** Make sure you rename the files on the floppy **BEFORE** you copy them to Drive C. Otherwise you will overwrite your Windows 95 system files. *You have been warned*. Now, copy all files to the root directory of Drive C. One method is to click on the Drive A icon, press CTRL+A, press CTRL+C, click on the Drive C icon, and press CTRL+V.

<span id=""NOTE:""></span> **NOTE:** If you **do not** have Windows 95 OSR2 (version 4.00.950b), please skip to [Section 3.6](#Section%203.6).

- If (and only if) you have Windows95 version 4.00.950b, make sure you have a file named Winboot.sys in the root directory of Drive C, as stated in [Section 2.3](loadlin-2.html#Section%202.3) above. **Failure to have Winboot.sys in the root directory of Drive C will result in a system lockup should you attempt to boot to an earlier version of DOS.**

**NOTE:** If you are using a DOS 6.x boot disk skip to [Section 4](loadlin-4.html#Section%204), otherwise continue with the next step.

## <span id="Section 3.6"></span> <span id="ss3.6">3.6 Edit your system files.</span>

- Open Notepad. On the Menu Bar, click on Open. Change "Files of type" to "All files (\*.\*)". Change "Look in:" from Desktop to Drive C. Now open Config.dos by double clicking on the filename. Delete all the contents. This will create a 0K file...I will explain later. Save the file.
- Use Notepad to open and edit Autoexec.dos and type in the Loadlin command. The Loadlin command must be in the following syntax:

> ` `
>
> ------------------------------------------------------------------------
>
>
>
>      Loadlin DriveLetter:\LinuxKernelFile root=/dev/LinuxBootPartition ro
>
> ------------------------------------------------------------------------

Here is my Autoexec.dos file as an example:

> ` `
>
> ------------------------------------------------------------------------
>
>
>
>      Loadlin f:\vmlinuz root=/dev/hdc2 ro
>
> ------------------------------------------------------------------------

**NOTE:** The kernel, as well as the Loadlin.exe, file may be anywhere on your hard drive as long as you reference the correct path. For example, if your kernel file was located in the directory e:\linux\kernels and Loadlin.exe was located in the directory c:\utils, you would use:

> ` `
>
> ------------------------------------------------------------------------
>
>
>
>      c:\utils\loadlin e:\linux\kernels\vmlinuz root=/dev/hdc2 ro
>
> ------------------------------------------------------------------------

- Save the file.

------------------------------------------------------------------------

[![Next](next.gif)](loadlin-4.html) [![Previous](prev.gif)](loadlin-2.html) [![Contents](toc.gif)](loadlin.html#toc3)
