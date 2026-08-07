---
title: "Roger - Programming"
source_domain: amasci.com
source_path: ~roger/programming/index.html
order: 7223
reachable_from_entry: false
images: 0
internal_links: 3
extracted: 2026-08-07T05:59:53Z
extractor: site_to_paper.py (pandoc)
---

# Roger - Programming

*Source page: `~roger/programming/index.html`*

1.  **Programming Projects** - All files can be found in [http://www.eskimo.com/~roger/files/](http://www.eskimo.com/~roger/files)\
    Newer additions are at bottom of the page.

    ##### This page was  last edited on:  Fri Jun 25 13:52:52 EDT 2004

2.  [**<u>SCTL - Serial/com port utility for the BC245XLT</u>**](http://sourceforge.net/projects/bc-sctl/) -  Is a small linux utility to backup data from a Bearcat scanner, as well as perform other operations.  (2002.08.11)

    - Ok.  It would appear the author of this utility hasn't updated his page in a while, as such, I'm going to an SRPM here.

      - [sctl-0.2.0-2mdk.src.rpm  (Jan 30, 2002)](../SRPMS/files/SRPMS/)

    - My srpm also offers a manfile also for the sctl.  If you're interested with the developement of this utility, please try contacting me also at "roger at eskimo.com" but I won't be able to do anything for about six months or so until the newer BC250D is released.  There is also a bug with the allowed formating of the ~/.sctl file were it causes sctl to segfault.  Omitting the blank line at the end of the file supresses the error(?)

3.  [**Creative's Webcam Go**](http://sourceforge.net/projects/winbond-webcam/)- Have the starts of a driver to enable this device in the Linux o/s.  This is very raw and don't expect anything to work yet.  

    - Just got some news today from the webcamgo mailing list.  It's now said that the Webcam Go now is able to produce some rather raw black & white snapshots by using the code from here:  `cvs -z3 -d:pserver:anonymous@cvs.linux-usb.sourceforge.net:/cvsroot/linux-usb co usbvideo`  \<-- If you have problems compiling usbvideo.c, you might want to try adding `-DEXPORT_SYMTAB`to the CFLAGS line of the Makefile.  The code is said to be built on the kernel-2.4.4 tree per hear-say.  Unfortunately, I've yet to be able to load the webcamgo.o driver with the "kernel-2.4.16 version's usbvideo.o" because usbvideo has gone through some changes since kernel-2.4.4.  If somebody has worked the webcamgo.c code to build on 2.4.16 tree, let me know. (2001.12.14)

    - We're currently struggling to get the webcamgo.c compatable with kernel-2.4.16 version's of usbvideo.o (2001.12.16)

    - Mine is now collecting dust somewhere. mmm...just realized i lost it now. imho, there are probabely better h/w solutions out there with linux drivers already (ie phillips).  (2002.08.11)

4.  [**Backup Bashscript**](../files/bin/bashscript.backup) - Have already written up a small Bash script to do backups of files and folders and can be placed in the cron folder for timely backups!  Many out there, but this one is over-all simplicity exempting most of the un-needed stuff which is not used on most Linux boxes. (I now utilize rsync (or draksync) to backup to an external ieee1394 hdd and a similar script (drakbackup) has been incorporated into Mandrake 9.0.  (2002.12.18)

5.  [**Mozilla**](http://www.mozilla.org/)- A huge open source project for which I would highly recommend any enthusists to get involved with.  Or, if you just want to check out some nightly builds, go here for pre-built stuff at a place called [Mozillazine](http://www.mozillazine.org/).  I just re-compiled `mozilla-0.9.7-2mdk.src.rpm` with`CFLAGS=-O9 -mcpu pentiumpro -march pentiumpro` and I must say, "Oh my!  Mozilla is sure starting to perform nicely!"  I would recommend users to upgraded to the latest on the Mandrake Cooker site and recompile also.  Just be aware that Cooker is developement and there maybe unknown bugs & you may incure dependency problems.

6.  [**<u>Avifile</u>**](http://avifile.sourceforge.net/) - A video recording tool.  This is alpha quality code and I usually use the more stable XAwtv tool for recording.

    - Be Advised, many SRPM's are not built correctly for Mandrake!  As such, I've have an updated [<u>avifile.spec</u>](avifile.spec) to build for Mandrake.  The problem is with specifing the qt2 files.  If you don't specify them initially, 'make clean' may not remove any initial Makefiles.  So, easier just to rm -rf the avifile-0.6/  folder and downloading a fresh copy of the cvs tree. (2001.12.14). (Superseded. See following Mjpegtools build log (2002.06.03)

7.  [**<u>The MJPEG/Linux square</u>**](http://sourceforge.net/projects/mjpeg/) - MJPEG Project for Linux (2002.06.03).  If you have a bttv848 capture card, you want to grab 1.5 (CVS) as it has added features (from what I'm told).   I'm also using a Canopus ADVC-100 for capturing.  I first capture with dvgrab and edit with kino.  I then use lav2divx to compress.  My build log to build mjpegtools-1.6.0 with avifile/divx support [can be found here](divx.install.log).

8.  [**Mondo**](http://www.microwerks.net/~hugo/) - A backup utilty (when I get more time).  Suppose to be really great and is suppose to create rescue cdrom's like Mandrake cdrom \#1 does, which is a very useful tool for those that "like to break things" (--a quote from one of the Mandrake Developers)

9.  PVR 501 (model=dp501) ( [Echostar's Dish Pro 501](http://www.dishnetwork.com/content/technology/receivers/dishpvr501/index.shtml)) - ok. an extraction utility can be found here at [Dishrip Yahoo Groups](http://groups.yahoo.com/group/dishrip/).  You need to sign up for a Yahoo Groups account and then submit a request to Dishrip (the maintainer) for approval to join.  Yes.  I know.  A hassle but once done I was pretty amazed at how well streamlined Yahoo Groups is.  However, the archives are not searchable via google.com :-(    As such, I still prefer the Maillling list structure of the GNU community.  Dishnetwork has also unveiled a new [PVR 721](http://www.dbstalk.com/review/review1.htm)(model=dp721?) and it supposedly runs a linux based o/s.  Is it better?  I've heard it is faster and more robust.  But that's it.  As to whether you can log-into it via a bash shell or what-not, I don't know.  It has been on the market from what I hear since July 2002, but I don't see any info about it on dishnetwork.com. For more info on the PVR 721's inards, see http://www.innermatrix.net/forums/showthread.php?s=&threadid=32803 and also search for all posts posted by dmc5439 and omega-EFA (I've found most of these threads deal with illegally hacking the pvr to gain access to channels for which the user neither subscribed or paid for. I neither condone nor do I endorse this type activity.) I've also been advised that the video feeds saved to the hdd on the pvr 721 are triple des encrypted. As to trying to extract those recordings, I am not sure of the legallities. (ie: extracting a free public broadcast that was saved to the pvr 721)

10. [Gnokii](http://www.gnokii.org/) - A user interface for [Nokia](http://www.nokiausa.com/) brand cellular phones.  It now has support for the model 8290. ;-)   Other programs that are usable with the model 8290 are [mygnokii2](http://marcin-wiacek.fkn.pl/english/main.htm) and [gsmlib.](http://www.pxh.de/fs/gsmlib/)  However, mygnokii2 is commandline only until all the bugs are worked out.  Once that is done, the author will re-integrate the gui.  Gsmlib is pretty basic.  I don't have much time to mess with this stuff for the time being so I'm using Gnokii and am pretty happy with it's performance (just some bugs that I'd like to fix).  You need to get the cvs version of gnokii that is older then Aug 06 2002 or older then 0.4.3 release.  Support for the 8290 wasn't added until very recently.  (Also, make sure you unload the maestro sound module and the lt_modem/lt_serial drivers (or any others) prior to booting linux if your having problems starting irda services.)  As far as Gnokii is concerned, the 8290 is considered as a model = 6110 within the /etc/gnokiirc (also, use connection = irda)

11. [JHead](http://www.sentex.net/~mwandel/jhead/) - Jhead extracts the EXIF data from image files which are usually associated with Digital Cameras.  Also provides makehtml.\
    The latest info and versions can be found at <http://www.sentex.net/~mwandel/jhead>

    - > I have merged both the latest release of jhead-1.8 and the makehtml (automagickly create  html thumbnail directories) into one package.

      - > [jhead-1.8-2mdk.src.rpm](../files/SRPMS)  (July 28, 2002)

    - > I have also modified the makehtml to create "black background" with "light grey font" (this  provides the images the increased contrast that they need for easier viewing -- it also appears to be a defacto for the photography world to post photos on a black background).

    - > I created a link at the top of the page for the html pages to view the exif image information that jhead creates. (It would appear that the file that makehtml creates with jhead needs better formatting.  ie. placing 1 to 2 blank lines between each images info section).

    - > I think that the makehtml utility should also format the html thumbnail page with a slight space in between the verticle row of images.  The horizontal row of images already have this space.  (see my Photographs for an example of this as well as what I have mentioned previously.  If anyone gets around to patching the code to do this, or any other modifications that might peak my interest, email the patch to me also at "roger at eskimo.com" and I'll think about implementing it into the srpm.  (2002.08.11)

    - > [Image Organization Plan](http://www.varp.net/photos/digital.html) (2002.12.18) In a desprite attempt to database my quickly growing digital image collection, I found this page.  It gives a decent overview of a standard method for the process. (...and, it's about the only page that I have found yet for Linux (or FreeBSD).)

12. [E17](e17) - Here are the beginnings of the E17 rpm packaging.  Very rough, but just getting somebody started on packaging E17 (the next version of Evolution Desktop.  The main site for enlightenment along with it's cvs can be found here<http://www.enlightenment.org/>

    - > Well, as of 20021116, the cvs is failing to build. Looks like raster did some major function renaming in evas which appears to kill the builds of ebits, etox, etc. I just remembered that I do have a cvs from 200208. Maybe I'll continue trying to build a set of SRPM's.

13. [i8kutils-1.17-2mdk.src.rpm](../files/SRPMS) - Are needed for Dell Inspiron and Latitude laptops to utilize adjust the fans and use the buttons on the laptops.  This contains an additional script called /etc/rc.d/init.d/i8kutils to associate the volume buttons with aumix.  (20021222)

14. [i8kpci-saveconfig-1.0-1mdk.src.rpm](../files/SRPMS) - Required for Dell I8K laptop network cards to perform a successful restore from apm suspend becuase of buggy kernel drivers (ie: actiontek w/ eepro100). (20021129)

15. [crw-1.92-1mdk.src.rpm](../files/SRPMS)- Converts raw to ppm format for canon digital cameras and others.  This was developed for the Canon raw file format but appears to be the same format used by Minolta in my Dimage 7i digital camera.  This code is copyright, however, it is freely available.  The oringal authors website including source code is: [http://www2.primushost.com/~dcoffin/powershot/"](http://www2.primushost.com/~dcoffin/powershot/). (20030115)

16. [mrwtoppm-0.0.a8-1mdk.src.rpm](../files/SRPMS) - Converts raw to ppm format for digital cameras.  This also includes a very nice Gimp Plugin.  If you work with a mrw files, this is probably the package you want.  Original source location is <http://home.swbell.net/dobroom/mintoppm/>. (i'm in the process of preparing an SRPM/specfile. This also appears to be under the GNU License so I may submit this to Mandrake officially.)  (20030212)

17. [Linpha](http://linpha.sourceforge.net/) - Linpha is a photo database utility using MYSQL, PHP and Apache combination.  I have created some experimental [SRPMS](../files/SRPMS) and pre-built [RPMS](../files/RPMS).  This tool is very similar to the utility that I want to use to archive/backup my growing \>5GB digital image collection.  It would be pretty cool if this utility kept track of archived photos burned to CD-R.  (20030227)

18. [Dell Inspiron 8100 and IRDA Quick Howto](irda.txt) - I've spent some time configuring the new smsc-ircc2 driver within kernel-2.6.1 to work with my Dell Inspiron 8100 laptop.  You can see my quick howto in ascii/text format here [irda.txt](irda.txt).  All I've got to say now, is it finally works without ltmodem conflicting! (I think) (20040128)

19. [Using an IRIVER IHP-120 from within Linux](iriver_ihp-120.html) - I've created a quick howto for using an Iriver IHP-120 with Linux which is intended to be a supplementary to some other websites concerning similar information.  I felt some information was amiss.  The device is an mp3 portable player capable of playing the vorbis/ogg format.  (20040422)

20. Using the Sony Erricson GC82 with AT&T EDGE Wireless in Linux - I have gathered my configuration files and knowledge on enabling this device under Linux.  The HTML file is here [files/doc/howto-gc82.html](../files/doc/howto-gc82.html) or the pdf file is here [files/doc/howto-gc82.pdf](../files/doc/howto-gc82.pdf).  I've also just aquired the [PDF file detailing all the AT Commands](http://webapp.etsi.org/exchangefolder/ts_100916v070800p.pdf) for the GC82.and the url requires a web browser to download the pdf (wget may not work). I took some time to also create a gc82con.sh script to automatically connect to either the local or roaming networks and a gc82sig.sh script that continuously loops checking for signal level. Both files can be found in my file folder <http://www.eskimo.com/~roger/files/> --  As for the Sierre Wireless with TMOBILE Wireless, I have failed as I keep getting a [ConfRej error](../files/doc/ac750-error.txt) in my syslog.  Also note the AC750 device will conflict with irda (smcc) using kernel-2.6.6.  Further debug info can be found in here [Kernel Bugzilla bug \#2945](http://bugme.osdl.org/show_bug.cgi?id=2945).  (20040710)

\
\
