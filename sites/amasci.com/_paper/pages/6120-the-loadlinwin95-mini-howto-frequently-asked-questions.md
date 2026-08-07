---
title: "The Loadlin+Win95 mini-HOWTO: Frequently Asked Questions:"
source_domain: amasci.com
source_path: ~praxis/loadlin-7.html
order: 6120
reachable_from_entry: false
images: 6
internal_links: 3
extracted: 2026-08-07T17:13:12Z
extractor: site_to_paper.py (pandoc)
---

# The Loadlin+Win95 mini-HOWTO: Frequently Asked Questions:

*Source page: `~praxis/loadlin-7.html`*

[![Next](next.gif)](loadlin-8.html) [![Previous](prev.gif)](loadlin-6.html) [![Contents](toc.gif)](loadlin.html#toc7)

------------------------------------------------------------------------

## <span id="FAQ"></span> <span id="s7">7. Frequently Asked Questions:</span>

## <span id="Section 7.1"></span> <span id="ss7.1">7.1 Where can I find more information on using Loadlin?</span>

- Slackware versions 3.2 and 3.5 contain a file named "loadlin.tgz" in the \slakware\A5 directory, Slackware versions 3.3 and 3.4 have loadlin.tgz in the \slakware\A4 directory. Slackware version 3.6 has loadlin.tgz in the \slackware\A8 directory. Unarchive the file and look in the \docs directory for a file named manual.txt. I do not know about earlier versions of Slackware.
- RedHat versions 4.2 through 5.2 contain a file named "loadlin16.tgz" in the \dosutils directory. Unarchive the file and look in the \docs directory for a file named manual.txt. RedHat 4.1 does not seem to have this archive. The manual.txt is also available for download at:

> ` `[`ftp://ftp.eskimo.com/u/p/praxis/manual.txt`](ftp://ftp.eskimo.com/u/p/praxis/manual.txt)

- Additional information is available at:

> ` `[`http://metalab.unc.edu/LDP/HOWTO/BootPrompt-HOWTO-2.html#ss2.2`](http://metalab.unc.edu/LDP/HOWTO/BootPrompt-HOWTO-2.html#ss2.2)

## <span id="ss7.2">7.2 I am not sure what partition Linux is installed on. How do I find out?</span>

- At a Linux shell prompt, run the `fdisk` utility and press `"p"`. From there you should be able to tell. If you need additional help using fdisk, please consult the man pages.

## <span id="ss7.3">7.3 Where do I find the kernel image file and how do I copy it to my MS-DOS partition?</span>

- To find your linux kernel file type:

  > ` `
  >
  > ------------------------------------------------------------------------
  >
  >
  >
  >             find / -name vmlinuz
  >
  > ------------------------------------------------------------------------

  at a Linux shell prompt. This will search all Linux partitions for the vmlinuz file. If you have multiple vmlinuz files, then make sure you use the correct one. If you are not sure, then the safest bet would be to use the most recent one.

  To copy your linux kernel file to your DOS partition, you need to make your DOS partition visible to Linux, then mount the partition if it is not already. Generally, this should have been set up when you installed Linux. All you need to do next is change to the directory the vmlinuz file is in and copy it over to DOS using the cp command.

  However, if Linux was not set up to recognize your DOS partition, then copy vmlinuz to a floppy. Take any DOS formatted floppy (with enough disk space to hold your kernel image file) and insert it into your floppy drive. Type:

  > ` `
  >
  > ------------------------------------------------------------------------
  >
  >
  >
  >             mount /dev/fd0 /tmp
  >
  > ------------------------------------------------------------------------

  at a Linux shell prompt. Then change to the directory your kernel image file is in and type:

  > ` `
  >
  > ------------------------------------------------------------------------
  >
  >
  >
  >             cp vmlinuz /tmp
  >
  > ------------------------------------------------------------------------

  This will copy vmlinuz to your floppy disk and it will be readable by DOS. Shutdown Linux, boot to DOS, then copy vmlinuz to whichever directory you choose. If you recompile your kernel, do not forget to copy the new kernel image file to your DOS partition. This will overwrite your old file, so it might be a good idea to rename the old file first just in case the new one does not work properly.

## <span id="ss7.4">7.4 Does it matter if I install Linux or Windows 95 first?</span>

- Technically no. However, it would be *much* simpler to install Win95 first. That way it is easier to setup Linux to recognize your DOS partition(s) as you can usually do this during the Linux installation.

## <span id="ss7.5">7.5 I currently have LILO installed, but I want to use Loadlin instead. How do I remove LILO?</span>

- You will need to restore the Win95 MBR (Master Boot Record) that LILO overwrote when you installed LILO. At a DOS prompt type:

> ` `
>
> ------------------------------------------------------------------------
>
>
>
>             fdisk /mbr
>
> ------------------------------------------------------------------------

## <span id="ss7.6">7.6 What if I already dual boot between Windows 95 and Windows 3.x, and I want to boot to Linux using this method?</span>

- Frankly, if you want to do this I would recommend using LILO. However, if you really do not want to use LILO, you will have to boot to Win 3.x first, then issue the Loadlin command. (Make sure Windows 3.x is NOT running, but that you are in DOS 5.0 or 6.x).

## <span id="ss7.7">7.7 Is it possible to initiate Linux from the Windows 95 desktop?</span>

- Yes. First, create a batch file called "linux.bat", for example. Edit the file to contain a Loadlin command such as:

  > ` `
  >
  > ------------------------------------------------------------------------
  >
  >
  >
  >             loadlin f:\vmlinuz root=/dev/hdc2 ro
  >
  > ------------------------------------------------------------------------

  Now save the file in the \windows\desktop directory. Next, right click on the Linux.bat icon, then left click on Properties. Now click on the Program tab, then click on the Advanced button. Click on the box next to "MS-DOS mode" and make sure the box next to "Warn before entering MS-DOS mode is checked". Click OK, then click on OK again. Now when you double click on the Linux icon, a warning box will appear before going into MS-DOS mode. If you click on "Yes" then Windows enters MS-DOS mode and executes the Linux.bat file.

  **NOTE:** You must be in MS-DOS mode in order to use Loadlin. Please see the manual.txt file mentioned in [Section 7.1](#Section%207.1) of this [FAQ](#FAQ) for more information.

## <span id="ss7.8">7.8 Where can I get a plain text version of this document?</span>

- You can get a plain text version of this document at:

  > ` `[`ftp://ftp.eskimo.com/u/p/praxis/loadlin.txt`](ftp://ftp.eskimo.com/u/p/praxis/loadlin.txt)

------------------------------------------------------------------------

[![Next](next.gif)](loadlin-8.html) [![Previous](prev.gif)](loadlin-6.html) [![Contents](toc.gif)](loadlin.html#toc7)
