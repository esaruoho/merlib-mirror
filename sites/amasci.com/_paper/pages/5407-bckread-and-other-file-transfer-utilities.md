---
title: "BCKREAD and Other File Transfer Utilities"
source_domain: amasci.com
source_path: ~nickz/vms/bcketc.html
order: 5407
reachable_from_entry: false
images: 5
internal_links: 1
extracted: 2026-08-07T05:58:22Z
extractor: site_to_paper.py (pandoc)
---

# BCKREAD and Other File Transfer Utilities

*Source page: `~nickz/vms/bcketc.html`*

[BCKREAD](bckread.com) VMS-RSX-DOS utility

December 2001: V2.03 -- bugfix for proper handling of certain XOR records.

June 2001: V2.02 -- bugfixes, more thorough deallocation in the event of an error writing to container file.

March 2001: V2.01 -- more enhancements; /e switch works, will write to a Files-11 container file. If certain errors occur however (e.g. not enough space on the disk) it is possible that the last directory entry will not be deallocated but will point to a deleted file header (use PIP /RM to fix that until this program is fixed). Also this kind of error may leave some bits in the bitmap allocated when they are really free; use VFY to fix that. Correctly handles a blank directory, zeroing the BAD.TSK pattern before writing file entries (SFX doesn't). Also planning to add extend-directory support (not present in SFX due to contiguity issues). There is an optional switch to force a contiguous file to noncontiguous if there are not enough contiguous blocks available on the Files-11 container file. Creation of a new UFD is not yet permitted, so either create the necessary UFD's beforehand from RSX or P/OS or zap either the file entry in the BACKUP saveset, or the directory's entry in the MFD (e.g. change USERFILES.DIR to 002054.DIR; the file header need not be changed). The UFD it will write to is always the lowest-level directory in the saveset's file entry, e.g. both \[TEST.NICK\]QQQ1.QQQ and \[NICK\]QQQ2.QQQ will be copied to the \[NICK\] UFD on the container file. VMS names that are larger than the ODS-1 9.3;version format are truncated; any files written to DOS are truncated to 8.3. If a file of the same name already exists on the container file, the file is copied again, with the version number one higher in both the index and directory entries. For copying to DOS, the first character is renamed until a unique file is obtained, since DOS (except on a CD) does not support version numbers.

February 2001: some bugs removed from BCKREAD, so that it now works with all V5.x and V6.x savesets I tested it on. The /e switch to extract to a Files-11 container file is NOT finished and should not be used yet (Only use the /e switch on v2.01 and above).

[BCKREAD.COM](bckread.com) is an executable file for MS/PC-DOS or Windows (in 80x86 assembly language). It views or extracts files from VMS Backup archives. Type BCKREAD for help.

Note: Files can be extracted to either the DOS filesystem or the Files-11 filesystem, or both or neither. The last option is useful for getting a listing similar to that obtained by BACKUP/LIST though more comprehensive. File attributes are preserved when file are written to a Files-11 container file. However, when using the /w switch to write files to the DOS filesystem, this version of BCKREAD extracts the VMS files without modification, i.e. in binary mode. This means that text files extracted in this way are not of much use until either transfered to an RSX/POS disk or container file, or converted to MSDOS text format with CR LF at the end of each line. A future edition may add the option to output text files in CR LF format.

For now, this can be done by means of a separate program: [TCONV.MAC](../rt11/tconv.mac) ([TCONV.SAV](../rt11/tconv.sav)) under RT-11 or [TCONVDOS.TRU](../rt11/tconvdos.tru) under DOS. The ODS-2 text file format is compatible with the ODS-1 format used in RSX and P/OS. To generate a blank RX-50 image from the MSDOS environment (with MFD files and creation date Y2K compliant, and with the option to specify a volume label), once can use [F11Init](../pro350/f11init.com). Or download a [pregenerated blank RX-50 image](../pro350/0304disk.zip) (1505 bytes compressed; 409,600 bytes uncompressed). For larger savesets, or to generate a bootable disk, a [blank RK-06 disk image](../pro350/rk6blank.zip) is provided (only 15912 bytes compressed; 13,888,512 uncompressed; it was hacked from an image of my RD-51). It will boot P/OS if POS.SYS is copied to it first (otherwise the LBN pointer in the bootblock must be updated), followed by the usual P/OS system files in \[ZZSYS\], etc. It will also boot RSX if an RSX11M.SYS file is copied to it followed by the necessary \[\*,54\] files, if the file ID's are preserved (if not, the system image should be VMR'd again and then SAV /WB executed to rewrite the bootblock).

These images (or any ODS-1 Files-11 container file) can be used to copy files either directly with BCKREAD's /e switch or indirectly with <a href="../rsx11m/sfx128.exe" id="sfx128">SFXPUT</a> (part of the self-extracting archive containing SFX, SFXGET and SFXPUT); use the /b switch for binary mode) or transfer to an RT-11 volume using [PUTR](ftp://ftp.dbit.com/pub/putr/) (also in binary mode). If PUTR is used, you can use TCONV.SAV to convert RSX-format text files and then use FLX.TSK from RSX or P/OS to copy and convert to RSX format automatically. If you use SFX, text files will need to have their attributes zapped to be read properly. Also note that SFX is updated from time to time, and the URL is changed to reflect the new version number; if the SFX/SFXPUT link does not work, then look in [Strobe Data's Osprey subdirectory](ftp://ftp.strobedata.com/pub/osprey/) for a file called sfx%%%.exe, where "%%%" is the version number.

*Note:* Since Strobe moved their website around August 2001, it seems that the FTP site is inaccessible, so I mirrored sfx128.exe at [the link noted above](#sfx128). Strobe's website is [here as of August 2001](http://www.strobedata.com/newhome/) in case you want to look around yourself.

Also, please note that SFX (as well as some older native RSX utilities) will not read level 402 volumes but my [402to401](../pro350/402to401.com) utility will enable it to read them by tricking it into thinking it is level 401 (it modifies the home block, so back up your image before using it if that concerns you). Many P/OS volumes are technically level 402 according to the home block but do not have any level-402-specific features (i.e. a multiheader index file). Most P/OS volumes are too small for a multiheader index file (e.g. all RX50's, plus smaller hard disks such as the RD50 and RD51), so these volumes can always be changed to level 401 without difficulty.

To transfer container or other files between just about any two operating systems that ever existed over a serial line, use [Kermit](http://www.columbia.edu/kermit/howtoget.html). To copy container files to real RX-50 diskettes, use [VBN2LBN](../pro350/vbn2lbn.zip). To copy an entire diskette to a PC or other system connected via a serial port to a Pro300-series computer or PDP-11, use the DCL command DUMP/LONG/OUT:XK: DZ1: or the MCR command DMP XK:=DZ1:/lw; substitute DZ2: if necessary. Under RSX, substitute the device name of the proper serial port (e.g. TT3: or TI:) for XK:, and the device name for DZ1: (usually a DU: device under RSX -- e.g. DMP TI:=DU:/LW). Works for files as well as devices, but devices must either be mounted foreign or the privilege bit set in DMP.TSK location 0:30. The dump can be automatically decoded on a PC by means of [DmpDeHex](../pro350/DmpDeHex.zip).

Note that TCONVDOS.TRU is in True BASIC, whose syntax is somewhat different than DEC or MS Basics and written by Kemeny and Kurtz (who also wrote the original BASIC in 1964). See [www.truebasic.com](http://www.truebasic.com) for more information, including a [complete index for on-line help](http://www.truebasic.com/manual_index.html) and [FTP site](ftp://ftp.truebasic.com/pub/) with demo versions of compilers for DOS, Windows, VMS, Unix, Mac and other operating systems.

All files listed on this page are Year 2000 and 2100 compliant. BCKREAD handles and properly displays VMS dates from 18-Nov-1858 (yes, before the U.S. Civil War) till well past 2100. The VMS date format is good for well, well beyond 2100, but the date stamps on files written to MS-DOS cannot be earlier than 1980 or later than 2099. RSX dates can be set to any 16-bit value, though BCKREAD currently supports dates up to 2199 only for the RSX files it writes.

Your comments are welcome: [Click here to send me mail!](mailto:nickz@eskimo.com)

[Click here to return to my main DEC page](../dec.html) (or just use your browser's Back function)

This site has been viewed ![\[counter GIF\]](http:/cgi-bin/Count.cgi?df=nickz.dat) times since May 3, 2001.

This BCKREAD web page has been viewed ![0](http://www.eskimo.com/~nickz/counter/0.gif)![1](http://www.eskimo.com/~nickz/counter/1.gif)![8](http://www.eskimo.com/~nickz/counter/8.gif)![3](http://www.eskimo.com/~nickz/counter/3.gif) times since December 30, 2001 07:06:00 EST.

nickz@eskimo.com

Last updated: December 30, 2001.
