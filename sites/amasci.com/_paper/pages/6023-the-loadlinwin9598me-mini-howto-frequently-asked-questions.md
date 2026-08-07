---
title: "The Loadlin+Win95/98/ME mini-HOWTO: Frequently Asked Questions:"
source_domain: amasci.com
source_path: ~praxis/Loadlin+Win95-98-ME-5.html
order: 6023
reachable_from_entry: false
images: 6
internal_links: 3
extracted: 2026-08-07T05:58:51Z
extractor: site_to_paper.py (pandoc)
---

# The Loadlin+Win95/98/ME mini-HOWTO: Frequently Asked Questions:

*Source page: `~praxis/Loadlin+Win95-98-ME-5.html`*

[![Next](next.gif)](Loadlin+Win95-98-ME-6.html) [![Previous](prev.gif)](Loadlin+Win95-98-ME-4.html) [![Contents](toc.gif)](Loadlin+Win95-98-ME.html#toc5)

------------------------------------------------------------------------

## <span id="FAQ"></span> <span id="s5">5. Frequently Asked Questions:</span>

## <span id="Section 4.1"></span> <span id="ss5.1">5.1 Where can I find more information on using Loadlin?</span>

- Loadlin can be found on your favorite distibution's installation CD. Just do a search for 'loadlin'.

<!-- -->

- The Loadlin-1.6 User's Guide is available for download at:

> ` `[`http://elserv.ffm.fgan.de/~lermen/manual.txt`](http://elserv.ffm.fgan.de/~lermen/manual.txt)

or

> ` `[`ftp://ftp.eskimo.com/u/p/praxis/manual.txt`](ftp://ftp.eskimo.com/u/p/praxis/manual.txt)

- You might also try visiting the [Loadlin Home Page](http://elserv.ffm.fgan.de/~lermen/)

<!-- -->

- Additional information is available at:

> ` `[`http://metalab.unc.edu/LDP/HOWTO/BootPrompt-HOWTO-2.html#ss2.2`](http://metalab.unc.edu/LDP/HOWTO/BootPrompt-HOWTO-2.html#ss2.2)

## <span id="ss5.2">5.2 I am not sure what partition Linux is installed on. How do I find out?</span>

- At a Linux shell prompt, run the `df` utility. If you see a line with `/boot`, then it will be quite obvious. If you do not see a line with `/boot`, then look on the line with a single "`/`".

## <span id="ss5.3">5.3 Where do I find the kernel image file and how do I copy it to my MS-DOS partition?</span>

- The kernel image file is usually called `vmlinuz` and should be located in the '/boot' directory. Often `vmlinuz` is a symbolic link to the actual kernel. If all else fails type:

  > ` `
  >
  > ------------------------------------------------------------------------
  >
  >
  >             find / -name vmlinuz*
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
  >             mount /dev/fd0 /mnt/floppy
  >
  > ------------------------------------------------------------------------

  at a Linux shell prompt. Then change to the directory your kernel image file is in and type:

  > ` `
  >
  > ------------------------------------------------------------------------
  >
  >
  >
  >             cp vmlinuz /mnt/floppy
  >
  > ------------------------------------------------------------------------

  This will copy vmlinuz to your floppy disk and it will be readable by DOS. Shutdown Linux, boot to DOS, then copy vmlinuz to whichever directory you choose. If you recompile your kernel, do not forget to copy the new kernel image file to your DOS partition. This will overwrite your old file, so it might be a good idea to rename the old file first just in case the new one does not work properly.

  Alternatively, if you have the `mtools` utilities you could type:

  > ` `
  >
  > ------------------------------------------------------------------------
  >
  >
  >             
  >             mcopy vmlinuz a:
  >
  > ------------------------------------------------------------------------

## <span id="ss5.4">5.4 Does it matter if I install Linux or Windows 95/98/ME first?</span>

- Technically no. However, it would be *much* simpler to install Windows first. That way it is easier to setup Linux to recognize your DOS partition(s) as you can usually do this during the Linux installation.

## <span id="ss5.5">5.5 I currently have LILO installed, but I want to use Loadlin instead. How</span> do I remove LILO?

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

## <span id="ss5.6">5.6 What if I already dual boot between Windows 95 and Windows 3.x, and I</span> want to boot to Linux using this method?

- Frankly, if you want to do this I would recommend using LILO. However, if you really do not want to use LILO, you will have to boot to Win 3.x first, then issue the Loadlin command. (Make sure Windows 3.x is NOT running, but that you are in DOS 5.0 or 6.x).

## <span id="ss5.7">5.7 Is it possible to initiate Linux from the Windows 95/98/ME desktop?</span>

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

Now save the file on your Windows desktop. Next, right click on the Linux.bat icon, then left click on Properties. Now click on the Program tab, then click on the Advanced button. Click on the box next to "MS-DOS mode" and make sure the box next to "Warn before entering MS-DOS mode is checked". Click OK, then click on OK again. Now when you double click on the Linux icon, a warning box will appear before going into MS-DOS mode. If you click on "Yes" then Windows enters MS-DOS mode and executes the Linux.bat file.

**NOTE:** You must be in MS-DOS mode in order to use Loadlin. Please see the manual.txt file mentioned in [Section 4.1](#Section%204.1) of this [FAQ](#FAQ) for more information.

## <span id="ss5.8">5.8 Where can I get a plain text version of this document?</span>

- You can get a plain text version of this document at:

  > ` `[`ftp://ftp.eskimo.com/u/p/praxis/loadlin.txt`](ftp://ftp.eskimo.com/u/p/praxis/loadlin.txt)

## <span id="ss5.9">5.9 Is Loadlin the only alternative to LILO?</span>

- No. There are other utilities you could use for dual booting:

  > ` `[`GRUB`](http://www.gnu.org/software/grub/grub.html)`: The GNU GRand Unified Bootloader `

  > ` `[`XOSL`](http://www.xosl.org/)`: Extended Operating System Loader `

  > ` `[`Other Bootloaders and Related Links`](http://freshmeat.net/search/?q=boot+loader)

------------------------------------------------------------------------

[![Next](next.gif)](Loadlin+Win95-98-ME-6.html) [![Previous](prev.gif)](Loadlin+Win95-98-ME-4.html) [![Contents](toc.gif)](Loadlin+Win95-98-ME.html#toc5)
