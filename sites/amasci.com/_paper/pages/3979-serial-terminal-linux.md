---
title: "Serial Terminal Linux"
source_domain: amasci.com
source_path: ~johnnyb/computers/stl/index.html
order: 3979
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T05:57:13Z
extractor: site_to_paper.py (pandoc)
---

# Serial Terminal Linux

*Source page: `~johnnyb/computers/stl/index.html`*

# Serial Terminal Linux

## APOLOGIES TO EVERYONE

There is something wrong with the downloads on this page, as I have received NUMEROUS responses that the images won't boot. I am swamped at the moment, but will get to this as soon as I can. Sorry for the inconvenience. I have no idea what happened, because it seems that they worked at one point, and then just started failing. I also apologize to the people who reported this to me originally, that I haven't gotten back with. I wil try to resolve this within a week (written 2003/11/05).

## Current Version

The current version is 0.3, but there are no known problems

## NEWS!!!

- Thanks to [John Riddoch](mailto:jr@scms.rgu.ac.uk), Serial Terminal Linux can now run on multiple Virtual Consoles (one for each serial port you have).
- [Scott Olsson](mailto:olsson@students.uiuc.edu) has contributed a great [Serial Terminal Linux HOWTO](serial-terminal-linux.howto.txt). I haven't proofed it thoroughly, but it looks pretty accurate.
- [The PC Weasel 2000](http://www.realweasel.com/) is an excellent product whose functionality complements Serial Terminal Linux

## Introduction

This project is here to transform useful laptops and computers into useless dumb serial terminals. Really. Why would I want to this? Well, a couple of reasons. First of all, the best way to learn about stuff is to just play with it. So, I'm playing w ith Linux to better learn how it works. Also, I have a laptop that all I use it for is being a serial terminal to my headless Linux servers. So, booting a whole distribution is pretty useless. So, I put together this mini-distribution so I could just b oot Linux into minicom.

## How it works

Basically, we use a program called [Rungetty](http://www.nodomainname.net/software/rungetty/) that puts a minicom session on each virtual consone. I put in all the libraries that minicom requires, the files it requires, and the terminal entry for the Linux terminal. I discovered all of these things by running "strace minicom" (strace is a utility that causes all system calls to be displayed on st andard error). I then created a filesystem containing all of these things, stripped all the binaries, dd'd the kernel onto the floppy, gzipped and dd'd the filesystem after the floppy, and then rdev'd the kernel appropriately. There you have seriallinux.

Later I will post instructions for building the floppy, but for now just check out /usr/src/linux/Documentation/ramdisk.txt on your own computer. I'm sure there's a lot of howto's as well.

## Download

The current version is 0.3. However, it seems stable, but there are several things left to do. I need to statically link my init program and minicom. The ability to save the configuration back to the disk would be nice, too. [Send me](mailto:johnnyb@eskimo.com) suggestions.

- Download the [distribution](seriallinux-0-3.img.bin). Install it to a floppy using the command

      dd if=seriallinux-0-3.img.bin of=/dev/fd0

- Here is the [filesystem tarball](seriallinux-fs-0-3.tar.gz) if you would like to see what's on the floppy.

- The kernel is [custom 2.2.14 kernel built for i386](vmlinuz-2.2.14-i386.bin)

- If you're on an old 386 and you run out of memory with the current version, here is an [older version](seriallinux-0-2.img.bin) that only has one console (uses a little less memory). You can also modify the number of minicoms that are spawned yourself by downloading the filesystem tarball (above) and modifying a few files in /etc.

## <span id="init">My custom init program</span>

Serial Terminal Linux used to be run by a custom init program I wrote. It is listed below. However, the current version uses [Rungetty](http://www.nodomainname.net/software/rungetty/), which is used for running programs (not logins) on different virtual consoles. This has allowed us to run a separate terminal for each serial port you have.

Here is the source for the old init program. You can also download it [here](init.c). It's too stupid to be licensed, so you are free to do anything you want with it. Linux and the libraries are under the GPL, so if you really want the source from me, send me \$10 and I'll mail you a copy of the RedHat source CD. Otherwise download it from [RedHat](http://www.redhat.com/mirrors.html). I'm not sure what license minicom is under, and I'm too lazy to look it up. This page is also public domain. If I ever get real content here, I might put it under an open content license.

    #include <sys/types.h>
    #include <sys/stat.h>
    #include <fcntl.h>
    #include <unistd.h>

    int main()
    {
        close(0);
        close(1);
        close(2);

        open("/dev/console", O_RDONLY);
        open("/dev/console", O_WRONLY);
        open("/dev/console", O_WRONLY);

        execl("/usr/bin/minicom", "/usr/bin/minicom", 0);
    }

## Changes

- 0.1 - initial release - used stock RedHat kernel. Can be found [here](seriallinux-0-1.img.bin)
- 0.2 - changed kernel to i386 custom kernel
- 0.3 - can run multiple minicoms, each in their own virtual console

## Todo List

Separate the disk into three portions - kernel, root image, configuration image. The configuration image would be directly mounted so it could be modified (root images are copied into RAM, and then mounted from RAM, so all changes are lost). That way, preferences could be saved between sessions. Also, we should run a program on the first virtual terminal that gives a little bit of help, and automates setting up additional virtual terminals.

What would be really cool (read - probably will never happen), is to get this to run on a [LART](http://www.lart.tudelft.nl) box, and to maybe make a serial terminal device. Or, even make a terminal server (like a livingston portmaster). Anyway, I can dream, can't I?

## While you're here

[See the rest of my site.](..) and [Tell me what you think](mailto:johnnyb@eskimo.com). I am certainly willing to try to assist you in anything.

## Links

- [The PC Weasel 2000 - Making Servers Run Headless](http://www.realweasel.com/) - This is an *AMAZING* product. Basically, it acts like a VGA card, but instead of video out, it has a serial out. Then, you can use a computer running serial terminal linux to communicate with it over a modem or local serial line.
- [How to build a Linux OS from scratch](http://www.linuxfromscratch.com/)

\
Go back to my [home page](..)
