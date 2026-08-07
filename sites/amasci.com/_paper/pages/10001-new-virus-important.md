---
title: "new virus - important!"
source_domain: amasci.com
source_path: ~wesn/waflyfishers/msg03437.html
order: 10001
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T17:18:20Z
extractor: site_to_paper.py (pandoc)
---

# new virus - important!

*Source page: `~wesn/waflyfishers/msg03437.html`*

------------------------------------------------------------------------

\[[Date Prev](msg03438.html)\]\[[Date Next](msg03436.html)\]\[[Thread Prev](msg03439.html)\]\[[Thread Next](msg03433.html)\]\[[Date Index](date44.html#03437)\]\[[Thread Index](thread36.html#03437)\]

# new virus - important!

------------------------------------------------------------------------

- *To*: (Recipient list suppressed)
- *Subject*: new virus - important!
- *From*: Patrick \<<wine@serv.net>\>
- *Date*: Thu, 04 May 2000 08:33:38 -0700
- *Reply-To*: <waflyfishers@eskimo.com>
- *Resent-Date*: Thu, 4 May 2000 08:34:04 -0700
- *Resent-From*: waflyfishers@eskimo.com
- *Resent-Message-ID*: \<"apdAQ3.0.mU4.hXP4v"@mx1\>
- *Resent-Sender*: waflyfishers-request@eskimo.com

------------------------------------------------------------------------

    Hi folks

    I'm well aware that emails about viri are almost as bad as the virus
    itself, but since this one is pretty nasty and spreading very quickly, here
    goes:

    Patrick
    _____

    Virus Characteristics
    This worm is a VBS program that is sent attached to an email with the
    subject ILOVEYOU. The mail caontains the message "kindly check the attached
    LOVELETTER coming from me." The attachment is called
    LOVE-LETTER-FOR-YOU.TXT.vbs If the user runs the attachment the worm runs
    using the Windows Scripting Host program. This is not normally present on
    Windows 95 or Windows NT unless Internet Explorer 5 is installed. When the
    worm is first run it drops copies of itself in the following places :-
    C:\WINDOWS\SYSTEM\MSKERNEL32.VBS C:\WINDOWS\WIN32DLL.VBS
    C:\WINDOWS\SYSTEM\LOVE-LETTER-FOR-YOU.TXT.VBS It also adds the registry
    keys :- HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\
    MSKernel32=C:\WINDOWS\SYSTEM\MSKernel32.vbs
    HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\
    Win32DLL=C:\WINDOWS\Win32DLL.vbs in order to run the worm at system
    startup. The worm replaces the following files :- *.JPG *.JPEG *.MP3 *.MP2
    with copies of itself and it adds the extension .VBS to the original
    filename. So PICT.JPG would be replaced with PICT.JPG.VBS and this would
    contain the worm. The worm also overwrites the following files :- *.VBS
    *.VBE *.JS *.JSE *.CSS *.WSH *.SCT *.HTA with copies of itself and renames
    the files to *.VBS. The worm creates a file LOVE-LETTER-FOR-YOU.HTM which
    contains the worm and this is then sent to the IRC channels if the mIRC
    client is installed. This is accomplished by the worm replacing the file
    SCRIPT.INI with the following script :- [script] n0=on 1:JOIN:#:{ n1= /if (
    $nick == $me ) { halt } n2= /.dcc send $nick
    C:\WINDOWS\SYSTEM\LOVE-LETTER-FOR-YOU.HTM n3=} After a short delay the worm
    uses Microsoft Outlook to send copies of itself to all entries in the
    address book. The mails will be of the same format as the original mail.
    This worm also has onother trick up it's sleeve in that it tries to
    download and install an executable file called WIN-BUGSFIX.EXE from the
    Internet. This exe file is a password stealing program that will email any
    cached passwords to the mail address MAILME@SUPER.NET.PH In order to
    facilitate this download the worm sets the start-up page of Microsoft
    Internet Explorer to point to the web-page containing the password stealing
    trojan. 
    wine@serv.net

------------------------------------------------------------------------

- Prev by Date: **[Re: Looking for used Pontoon boat](msg03438.html)**
- Next by Date: **[RE: South Sound Cutthroat](msg03436.html)**
- Prev by thread: **[Jamboree Speakers](msg03439.html)**
- Next by thread: **[Re: Seminar Schedule](msg03433.html)**
- Index(es):
  - [**Date**](date44.html#03437)
  - [**Thread**](thread36.html#03437)

**[Home](http://www.eskimo.com/~wesn/waflyfishers/) \| [Date Index](date44.html) \| [Thread Index](thread36.html) [Author Index](author.html)**
