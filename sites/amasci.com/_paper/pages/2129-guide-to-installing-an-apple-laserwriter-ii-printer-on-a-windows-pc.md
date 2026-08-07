---
title: "Guide to installing an Apple Laserwriter II printer on a Windows PC"
source_domain: amasci.com
source_path: ~dalus/apple_laserwriter_windows.html
order: 2129
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T05:55:48Z
extractor: site_to_paper.py (pandoc)
---

# Guide to installing an Apple Laserwriter II printer on a Windows PC

*Source page: `~dalus/apple_laserwriter_windows.html`*

# Guide to installing an Apple Laserwriter II printer on a Windows PC

Note: I'm not currently using this setup as it was just too slow for me.

I have just finished setting up two different Apple LW printers on separate Windows machines. First config is a LW IIf on WinNT 4.0. I downloaded the Apple installer and Adobes latest 5.0 driver. Configured the serial port for 9600/N/8/1, used a NullModem cable, 9pin-25pin. And it works fine. Slow, but fine. By slow I mean 4 minutes to print 1 page from Acrobat. I downloaded the Mac based Apple LW Utilities, hooked up my Mac 7300/200 to the printer via localtalk, set the baud rate in the printer to 57600, changed the WinNT com1 setting to 57600 (no reboots required) and the time went from 4 minutes to 2 minutes. Still not the greatest, but not that bad either. I'm also sharing this across my ethernet to my Win98 box next to the WinNT box, and I just installed the Adobe drivers for the Apple LW IIf, and it prints fine from there.

Items needed:

- LaserWriter IIf printer
- Windows NT 4.0 on a PC with an available serial port
- Adobe Drivers
- 9pin-25pin serial cable, preferably a NULL modem cable
- NULL modem adapter, 25pin-25pin, if you don't get the NULL modem cable, I bought mine at Radio Shack
- Buy a [NULL modem cable](http://www.radioshack.com/product.asp?catalog%5Fname=CTLG&category%5Fname=CTLG%5F003%5F001%5F007%5F000&product%5Fid=950%2D0188) from Radio Shack

Step by step:

1.  Set LW near PC, plug in, do not turn on
2.  Connect 9pin end of serial cable to open port on back of PC, make sure you know which COM port this is, and that it's working
3.  Connect 25pin end of serial cable to back of LW, if the cable is a NULL modem cable. If it's not a NULL modem cable, insert the NULL modem adapter between the 25pin connector on the serial cable and the printer
4.  Power up LW, after a minute or two, the status sheet should print. This may be turned off by default
5.  Power up PC if not already running
6.  Download Adobe Drivers
7.  Download Apple Drivers
8.  Install all drivers
9.  Configure printer to use correct COM port
10. Configure COM port to 9600/N/8/1 XON/XOFF (LW defaults)
11. Check that the DIP switches on the back of the LW are set correctly, read the manual from Apple's site to see what all these settings are.
12. For a LW IIf or IIg, [here](http://til.info.apple.com/tilarchive.nsf/artnum/n15066) are the communication switch settings.

------------------------------------------------------------------------

The other install is downstairs on my father's Win98 laptop. We hooked an Apple II NTX printer up via null modem serial cable, 9pin-25pin. Tried using the latest Adobe drivers and they didn't work, they only support Postscript II, the NTX is Postscript I. Went to "add a printer", selected "apple", then "laserwriter II ntx", installed. Then in properties for that printer, I set the com1: to 9600/N/8/1. Presto, it works. Kinda slow, but workable.

Items needed:

- LaserWriter II NTX or NT printer
- Windows 95/98 on a PC with an available serial port
- Windows 95/98 install disk
- 9pin-25pin serial cable, preferably a NULL modem cable
- NULL modem adapter, 25pin-25pin, if you don't get the NULL modem cable
- For the LW II NTX [here](http://til.info.apple.com/tilarchive.nsf/artnum/n2031) are the communication port switch settings.
- For the LW II NT [here](http://til.info.apple.com/tilarchive.nsf/artnum/n1992) are the communication port switch settings.
- [Apple's page](http://til.info.apple.com/techinfo.nsf/artnum/n30991) on connectiong a Windows PC to a LW NT printer.

Dale Beuning

- [Apple's page](http://til.info.apple.com/techinfo.nsf/artnum/n30991) giving complete details on the correct null modem serial cable pinouts.
- Apple [TIL](http://til.info.apple.com/techinfo.nsf/printers?OpenView&Start=1&Count=100&Expand=3.1#3.1) page on hookup your LW up to Windows.
- [Adobe Windows Drivers](http://www.adobe.com/support/downloads/pdrvwin.htm)
- [Apple Windows Drivers for Windows NT](http://asu.info.apple.com/swupdates.nsf/artnum/n10083)
- [Apple Windows Drivers for Windows 95](http://asu.info.apple.com/swupdates.nsf/artnum/n10082)
- [Apple Windows Drivers for Windows 3.1.x](http://asu.info.apple.com/swupdates.nsf/artnum/n10081)
- [Apple Laserwriter PDF Documents](http://www.info.apple.com/info.apple.com/applespec/applespec.taf?cat=printer&ql=laser)
- [Apple Macintosh Printer Utility](http://asu.info.apple.com/swupdates.nsf/artnum/n10093)

------------------------------------------------------------------------

Links:

[Other ways to connect a Laserwriter to a Windows machine](http://tesla.public.lib.ga.us/pls/faqs/win-faq/LW-win95.html)
