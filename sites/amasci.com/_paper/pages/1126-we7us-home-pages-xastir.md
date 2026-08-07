---
title: "WE7U's Home Pages: XASTIR"
source_domain: amasci.com
source_path: ~archer/xastir.html
order: 1126
reachable_from_entry: false
images: 1
internal_links: 0
extracted: 2026-08-07T17:07:25Z
extractor: site_to_paper.py (pandoc)
---

# WE7U's Home Pages: XASTIR

*Source page: `~archer/xastir.html`*

## XASTIR: X Amateur Station Tracking and Information Reporting

\
\
***<a href="http://www.xastir.org" target="_top">Xastir's Home Page</a>*** . Another entry point to ***<a href="http://xastir.sourceforge.net" target="_top">Xastir information</a>*** , including a link to screen shots of Xastir.

This is a mapping and amateur radio APRS-type program that currently runs on FreeBSD, Linux, Solaris, and Mac OS X platforms. Real-time mapping of APRS stations is the main usage but it can also do messaging and weather-related functions. **This software is available at no charge and comes with full source code!**

**SUPPORTED LANGUAGES:**\
1) Dutch\
2) English\
3) French\
4) German\
5) Italian\
6) Portuguese\
7) Spanish

**SUPPORTED WEATHER STATIONS:**\
1a) Peet Brothers Ultimeter 2000 (logging mode)\
1b) Peet Brothers Ultimeter 2000 (Packet mode)\
2) Peet Brothers U-II\
3) Radio Shack WX-200/Huger WM-918/Oregon Scientific WM-918\
4) Networked weather stations using ***<a href="http://wx200d.sourceforge.net" target="_top">wx200d software.</a>***

**SUPPORTED TNC's:**\
1) AX.25 kernel networking (KISS-mode TNC's, soundcard TNC's, Baycom TNC's, etc).\
2) Serial-port TNC's such as Kantronics KAM & kpc3, Kenwood TH-D7A/TM-D700A, AEA, TAPR, MFJ, Paccomm, etc.\
3) Support for HSP adapters is built-in. An HSP adapter lets you connect TNC and GPS to the same serial port.\
4) Control-E support for TNC's with GPS port built-in such as Kantronics KPC-3+ and Paccomm dual-port PicoPacket.

**SUPPORTED GPS's:**\
1) Anything putting out NMEA standard GPRMC and/or GPGGA sentences.\
2) GPS's can be used with TNC's on the same serial port via HSP adapter.\
3) Networked GPS's using ***<a href="http://russnelson.com/gpsd/" target="_top">gpsd software.</a>***\
4) Control-E support (TNC's with GPS port built-in).

**SUPPORTED MAP FORMATS:**\
1-105: ***<a href="http://www.imagemagick.org/www/formats.html" target="_top">ImageMagick.</a>*** (two formats are write-only, not included in total)\
106: ***<a href="http://web.ew.usna.edu/~bruninga/aprs.html" target="_top">APRSdos</a>*** Vector Format Maps & Weather Alert Maps\
107: ***<a href="http://aprs.rutgers.edu/" target="_top">WinAPRS/MacAPRS/X-APRS</a>*** Vector Format Maps & Weather Alert Maps\
108: 1:24k ***<a href="http://mcmcweb.er.usgs.gov/drg/" target="_top">USGS DRG</a>*** Raster Maps (geoTIFF Topo Maps)\
109: 1:100k ***<a href="http://mcmcweb.er.usgs.gov/drg/" target="_top">USGS DRG</a>*** Raster Maps (geoTIFF Topo Maps)\
110: 1:250k ***<a href="http://mcmcweb.er.usgs.gov/drg/" target="_top">USGS DRG</a>*** DRG Raster Maps (geoTIFF Topo Maps)\
111: ***<a href="http://www.esri.com/software/opengis/openpdf.html" target="_top">ESRI Shapefile</a>*** Polyline Vector Maps\
112: ***<a href="http://www.esri.com/software/opengis/openpdf.html" target="_top">ESRI Shapefile</a>*** Polygon Vector Maps\
113: ***<a href="http://www.pocketaprs.com" target="_top">PocketAPRS</a>*** PDB Vector Maps\
114: ***<a href="http://geonames.usgs.gov/gnishome.html" target="_top">USGS GNIS</a>*** files

ImageMagick can also handle automatic decryption or decompression of maps files as long as support for these utilities is present and compiled into ImageMagick. It can handle these formats: ".Z", ".gz", ".bz2", and ".pgp".

**MAP SOURCES:**

Built into Xastir (Require ImageMagick libraries):\
1: Online ***<a href="http://www.census.gov/geo/www/tiger/" target="_top">Tiger</a>*** Raster Maps\
2: Online ***<a href="http://www.terraserver.com" target="_top">Terraserver</a>*** Raster Maps\
3: Online ***<a href="http://www.noaa.gov" target="_top">NOAA</a>*** Weather Radar Maps\
4: Online GIF/JPG/PNG/etc files (http or ftp links)

Downloadable Maps (some of these require additional libraries):\
1: ***<a href="http://web.ew.usna.edu/~bruninga/aprs.html" target="_top">APRSdos</a>***\
2: ***<a href="http://aprs.rutgers.edu/Maps.htm" target="_top">WinAPRS/MacAPRS/X-APRS</a>***\
3: ***<a href="http://www.ui-view.com" target="_top">Ui-View</a>*** . Xastir's scripts directory contains a script that will make Ui-View maps usable within Xastir.\
4: ***<a href="http://www.pocketaprs.com/mapindex.html" target="_top">PocketAPRS</a>*** , some European maps are ***<a href="http://www.homepages.hetnet.nl/~pe1dnn/" target="_top">Here</a>***\
5: ***<a href="http://isl715.nws.noaa.gov/mapdata/newcat/" target="_top">NOAA</a>*** Shapefile maps\
6: ***<a href="http://www.lib.ncsu.edu/stacks/gis/data.html" target="_top">NCSU Libraries GIS Data</a>*** Shapefile maps\
7: USGS geoTIFF topo maps are available at ***<a href="http://mcmcweb.er.usgs.gov/drg/free_drg.html" target="_top">USGS</a>*** , at ***<a href="http://www.gisdatadepot.com" target="_top">GIS Data Depot</a>*** (Click on "Free Data") , and at ***<a href="http://wagda.lib.washington.edu/data/drgs.html" target="_top">WA State DRG's</a>***\
8: Scanned maps (most image formats)\
9: ***<a href="http://www.gisdatadepot.com" target="_top">GIS Data Depot</a>*** GeoTIFF topo maps, Shapefiles (Click on "Free Data")\
10: City/County/State GIS Departments (Shapefiles)\
11: Tiger97 map data converted to Shapefiles at ***[Mapshots.com](http://mapshots.com/)***\
12: TIGER/Line 2000 map data converted to Shapefiles at ***[GeographyNetwork.com](http://www.geographynetwork.com/data/tiger2000/)*** . This one requires you to register with an e-mail adress, but the data is free.

You'll need a recent version of "wget" installed on your system to enable the http/ftp functionality.

Xastir can query findu.com for the previous two weeks of posits for a particular station.

Xastir comes with a script (inf2geo.pl) which converts .INF files to .GEO files. This makes it easier to use maps from other APRS programs with Xastir.

Another script is available which creates the minimal .fgd files Xastir needs for the geoTIFF topo maps. This script also comes with Xastir. This script is only necessary if you can't download the .fgd files along with the .tif map files.

**Summary of libraries Xastir can use:**\
Motif, ***<a href="http://www.openmotif.org" target="_top">OpenMotif</a>*** , or ***<a href="http://www.lesstif.org" target="_top">LessTif</a>*** : Required : The GUI widget set\
pthreads : Required : Threading capability\
Xpm : Optional : XPM images. Not needed if installing ImageMagick.\
***<a href="http://gdal.velocet.ca/projects/shapelib/index.html" target="_top">Shapelib</a>*** : Optional : ESRI Shapefile maps\
***<a href="http://www.imagemagick.org/" target="_top">ImageMagick</a>*** : Optional : Many graphics images\
***<a href="http://www.libtiff.org" target="_top">libtiff</a>*** / ***<a href="http://www.remotesensing.org/geotiff/geotiff.html" target="_top">libgeotiff</a>*** / ***<a href="http://www.remotesensing.org/proj/" target="_top">libproj</a>*** / ***<a href="ftp://ftp.remotesensing.org/pub/proj/proj-nad27-1.1.tar.gz" target="_top">datums</a>*** : Optional : geoTIFF maps (i.e. USGS topos)\
***<a href="http://sourceforge.net/projects/hams/" target="_top">AX.25</a>*** : Optional : Kernel AX.25 networking support\
***<a href="http://www.speech.cs.cmu.edu/festival/" target="_top">Festival</a>*** : Optional : Speaking alerts\
***<a href="ftp://ftp.gnu.org/gnu/wget/" target="_top">Wget</a>*** : Optional : Internet images as maps

--------------------------------------------------------------

    Note from Chuck:
    Xastir should be able to compile (and run) on any "recent" Linux (x86) 
    machine as long as the needed libs are available.  Others, eg., *BSD, AIX 
    (Yikes!), Solaris, may (probably) will require some "tweeking."  The biggest 
    hinderance would be a GNU build environment and threading libs (pthread).

    Note from WE7U:
    Operating systems that the latest Xastir snapshots work with.
    I still need data on those with question marks (most of them):

      *Linux        ?SuSE 5.x
                    *SuSE 6.4                         WE7U,DK7IN
                    *SuSE 7.1                         WE7U,DK7IN
                    *SuSE 7.2                         N7IPB,WA7QFR,KD7NM,NV0U
                    *SuSE 7.3                         WA7QFR
                    *Red Hat 5.2                      PE1DNN(Note 3)
                    *Red Hat 6.2                      N5JXS
                    *Red Hat 7.0                      N5JXS(Note 2), KC7ZRU
                    *Red Hat 7.1                      N5JXS,KC7ZRU,N2YGK(Note 1),KJ5O(Note 4)
                    *Red Hat 7.2                      N5JXS,KC7ZRU
                    ?Slackware 5.x, 6.x
                    *Slackware 7.0                    PE1ICQ
            *Slackware 7.1                    WE7U
            *Slackware 8.0                    PE1ICQ(Note 7)
                    *Debian 2.2r0 (Potato)
            *Mandrake 7.2                     ZL2BSJ
                    *Mandrake 8.0                     K7MKG,ZL2BSJ
            *Mandrake 8.1                     ZL2BSJ(Note 6)
                    *Caldera OpenLinux eDesktop v2.4  KG0YJ
                    ?TurboLinux (versions?)
                    ?Others (versions?)
      *FreeBSD      *4.4-STABLE                       KC2ELS
      *Mac OS       *Mac OS X                         PE1LIF(Note 5),N2LBT
      ?NetBSD
      ?BSD386
      ?OpenBSD
      ?SunOS        ?4.x
      *Solaris      *2.5 (OS 5.5)                     WE7U
                    ?2.6 (OS 5.6)
                    *7                                WE7U,KD6ZWR
                    *8                                KC8OBZ
      ?AIX
      ?IRIX
      ?HPUX
      ?BeOS
      ?SCO Unix
      ?SCO Xenix
      ?VRTX
      ?QNX
      ?Others

    (*) = Confirmed.
    (?) = May compile/run.  Status currently unknown.

    (1) I had to do a
        ./configure --with-motif-includes=/usr/X11R6/LessTif/Motif1.2/include \ 
          --with-ax25 --with-xbae-includes=/usr/X11R6/include \
          --with-motif-libraries=/usr/X11R6/LessTif/Motif1.2/lib
        on Redhat 7.1.  Seems configure wasn't finding these libraries in the
        right places on my system for some reason.
    (2) Difficult to get Xastir running on 7.0
    (3) For Linux note that the CVS version does not compile on RedHat 5.2 without
        changes anymore. Older GCC compilers choke on -march=xxx and -mcpu=xxx.
        Bypass I use now is delete those flags from the Makefile and src/Makefile
        after configure.
        Futhermore I have never seen Imagemagick stuff working on RH5.2. It compiles
        but crashes and dumps an error when attempting to use it (loading an bitmap
        map). When loading a bigger image then Imagemagick eats up all memory until
        it is depleated, after which is terminates the program. Quick fix I use is
        edit config.h and comment HAVE_IMAGEMAGICK out (I'm sure there is a better
        way, but this works for me).
    (4) I had to modify maps.c to get it to compile with the latest ImageMagick 
        libraries.  Also, the stock Lesstif that was installed appeared not to 
        have the proper printing libraries, and so I uninstalled the Lesstif RPM 
        and got the tarball; after that it compiles perfectly with ImageMagick, 
        geoTiff, Festival, and ShapeLib support.
    (5) See "http://homepage.mac.com/opzeeland1/" for mods.
    (6) At the linking stage, the libax25 library isn't mentioned on the command
        line.  The linking fails because the gcc linker can't resolve a bunch of
        ax25 functions.  Before you do the 'make', edit src/Makefile. Add (append)
        to the LIBS line the following:
            -lXp -lax25
        to include libXp and libax25 in the linking process.  Do a 'make clean',
        then 'make'.  Xastir should build.
    (7) Needed to upgrade from libtiff-3.5.5 to libtiff-3.5.7 available at:
        http://sharon.esrac.ele.tue.nl/pub/slackware/pre-current/contrib/ham/packet/
        or ftp:// (same address)

    ----------------------------------------------------------------------------------

    Xastir CVS Notes:
    -----------------

    Follow the instructions on SourceForge for setting up CVS the first
    time.  After that it gets much easier and a few extra commands might
    help you get around:

    Here's how you might update your local copy of the sources from the remote
    server:

      # Update my local copy from the CVS tree
      cvs -z3 update -d -P

    The -z3 makes the CVS server compressing the files before transferring
    them with a gzip level 3. The files are automatically unzipped by your
    CVS client.  Please use always compressed transfer to reduce netload.
    I recommend to create a file ~/.cvsrc which these lines: 

      cvs -z3
      update -P -d 

    The line update -P -d makes CVS purging empty directories (-P) and
    checking out newly added directories on a later update. Once you've
    checked out the code you can easily update it from time to time. Go to
    the newly created directory and type 

      cvs -z3 update 

    All information about the repository, login, module and branch is stored
    by CVS in the subdirectories CVS, so that you don't have to care about
    this any more. The password (in this case it's empty) is stored in
    ~/.cvspass. You can move the checked out source around, you can even move
    it to another machine without losing the ability to do a CVS update.

    Some other commands I defined as aliases in the bash startup files.  Some
    of these will not work for anyone except a developer, as they change the
    CVS repository.  The "cvsstat*" cnd "cvsdiff" cmmands might be quite useful
    to see if any files have been changed or added since your last update:

    alias cvsadd='cvs add'
    alias cvsbyedel='cvs release -d'
    alias cvsdelsticky='cvs update -A'
    alias cvsdiff='cvs diff -w -r HEAD'
    alias cvsfiles='ls $CVSROOT'
    alias cvsfindsticky='cvs status -v | grep Sticky | grep -v none'
    alias cvsget='cvs checkout'
    alias cvsgetrelease='cvs checkout -r'
    alias cvslog='cvs log'
    alias cvsroot='echo $CVSROOT'
    alias cvssave='cvs commit'
    alias cvsstat='(cvs status 2>&1) | grep -E "Status: | Examining" | grep -v Up-to-date'
    alias cvsstat2='cvs -n -q update'
    alias cvsstat3='(cvs status 2>&1) | grep -E "Status: | Examining" | grep -v Up-to-date | grep -v Makefile.in'
    alias cvstag='cvs tag'
    alias cvstags='cvs status -v'
    alias cvsupdate='cvs update'

[<embed src="http://sourceforge.net/sflogo.php?group_id=45562&amp;type=2" data-border="0" width="125" height="37" />](http://sourceforge.net)
