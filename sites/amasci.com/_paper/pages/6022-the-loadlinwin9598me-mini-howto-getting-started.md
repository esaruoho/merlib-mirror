---
title: "The Loadlin+Win95/98/ME mini-HOWTO: Getting started:"
source_domain: amasci.com
source_path: ~praxis/Loadlin+Win95-98-ME-4.html
order: 6022
reachable_from_entry: false
images: 6
internal_links: 3
extracted: 2026-08-07T05:58:51Z
extractor: site_to_paper.py (pandoc)
---

# The Loadlin+Win95/98/ME mini-HOWTO: Getting started:

*Source page: `~praxis/Loadlin+Win95-98-ME-4.html`*

[![Next](next.gif)](Loadlin+Win95-98-ME-5.html) [![Previous](prev.gif)](Loadlin+Win95-98-ME-3.html) [![Contents](toc.gif)](Loadlin+Win95-98-ME.html#toc4)

------------------------------------------------------------------------

## <span id="s4">4. Getting started:</span>

## <span id="ss4.1">4.1 Step One:</span>

Edit (or create) `config.sys` on the root of Drive C. The contents should be similar to the following:

> ` `
>
> ------------------------------------------------------------------------
>
>
>     [menu]
>     menuitem=Linux, Mandrake Linux 7.2
>     menuitem=Win98, Windows 98
>     menucolor=15,1
>     menudefault=Win98, 10
>
>     [linux]
>
>     [win98]
>
> ------------------------------------------------------------------------

If your system already has a `config.sys` file, put those contents under the `[win98]` section. The `[linux]` section is left blank intentionally.

## <span id="ss4.2">4.2 Step Two:</span>

Edit (or create) `autoexec.bat` on the root of Drive C. The contents should be similar to the following:

> ` `
>
> ------------------------------------------------------------------------
>
>
>     goto %config%
>
>     :linux
>     call c:\linux.bat
>
>     :win98 
>
> ------------------------------------------------------------------------

As above, if you aready have an `autoexec.bat` file, put those contents under the `:win98` section.

## <span id="ss4.3">4.3 Step Three:</span>

Create a file called: `linux.bat`. Putting it in the root of Drive C is as good as place as any (but it can go anywhere so long as you reference the path or location). The contents should be similar to the following:

> ` `
>
> ------------------------------------------------------------------------
>
>
>     @echo off
>     c:\loadlin c:\vmlinuz root=/dev/hda3 ro 
>
> ------------------------------------------------------------------------

The above example assumes that `loadlin.exe` and `vmlinuz` are located in the root of Drive C (or C:\\ and that linux is installed on the /dev/hda3 partition. Your configuration may be different.

The important thing here is to make sure that loadlin and your linux kernel file are properly referenced. Finished!

That should work for you, as that is how I have things set up on my system, which dual boots with Win98.

------------------------------------------------------------------------

[![Next](next.gif)](Loadlin+Win95-98-ME-5.html) [![Previous](prev.gif)](Loadlin+Win95-98-ME-3.html) [![Contents](toc.gif)](Loadlin+Win95-98-ME.html#toc4)
