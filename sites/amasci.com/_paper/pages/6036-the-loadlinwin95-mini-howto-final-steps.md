---
title: "The Loadlin+Win95 mini-HOWTO: Final Steps"
source_domain: amasci.com
source_path: ~praxis/loadlin-5.html
order: 6036
reachable_from_entry: false
images: 6
internal_links: 3
extracted: 2026-08-07T05:58:52Z
extractor: site_to_paper.py (pandoc)
---

# The Loadlin+Win95 mini-HOWTO: Final Steps

*Source page: `~praxis/loadlin-5.html`*

[![Next](next.gif)](loadlin-6.html) [![Previous](prev.gif)](loadlin-4.html) [![Contents](toc.gif)](loadlin.html#toc5)

------------------------------------------------------------------------

## <span id="s5">5. Final Steps</span>

## <span id="ss5.1">5.1 Almost Finished</span>

- One last file to edit and then you are finished. Use Notepad to open and edit Msdos.sys. Goto the "Options" section. Look for a line that has BootMulti=. If you do not find one then add it and set the value to 1. It should look something like:

> ` `
>
> ------------------------------------------------------------------------
>
>
>
>      [Options] 
>      BootMulti=1
>
> ------------------------------------------------------------------------

- There may be other items listed. Just leave them. Now save the file.

## <span id="ss5.2">5.2 You are finished!</span>

Now all you have to do is reboot (Don't forget to remove the floppy disk). When you see "Starting Windows 95...", press the F4 Function Key and Linux should boot right up.

## <span id="ss5.3">5.3 How it works.</span>

Windows 95 has a built in Boot Menu. By default you do not see it at startup (although you can change that if you wish), but you can get to it by pressing the F8 Function Key when you see "Starting Windows 95...". On the menu you will see several options. The last option is "Previous version of MS-DOS". Instead of pressing F8 and then selecting "Previous version of MS-DOS", you can use the F4 shortcut by pressing F4 when "Starting Windows 95..." appears on the screen. When Windows 95 boots to the previous version of MS-DOS, it uses the files that end in the .dos file extension. This is why it is important to have a 0K Config.dos file if you are initiating Linux from the Autoexec.dos file. If Windows 95 does not find the files with a .dos extension while trying to boot the previous operating system, it will load the Windows 95 startup files. Therefore, if you do not have a Config.dos file, Windows 95 will load all the drivers in your Config.sys file. While this will not prevent Linux from loading, it will take longer. Having a 0K Config.dos file prevents Windows 95 from reading your Config.sys file while booting to the previous version of MS-DOS.

------------------------------------------------------------------------

[![Next](next.gif)](loadlin-6.html) [![Previous](prev.gif)](loadlin-4.html) [![Contents](toc.gif)](loadlin.html#toc5)
