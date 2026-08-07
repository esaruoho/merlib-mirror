---
title: "DV-VCD HOWTO"
source_domain: amasci.com
source_path: ~johnnyb/computers/DV-VCD_HOWTO.html
order: 3969
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T05:57:13Z
extractor: site_to_paper.py (pandoc)
---

# DV-VCD HOWTO

*Source page: `~johnnyb/computers/DV-VCD_HOWTO.html`*

# Digital Video to VideoCD HOWTO

This HOWTO describes taking a video from your digital video camera and putting it onto a VideoCD for playback in most DVD players.\

## What you need to have installed

- libdv (<http://libdv.sourceforge.net/>)\
- MJPEGTools (<http://mjpeg.sourceforge.net/>)
- dvgrab 1.2 or above (<http://kino.schirmacher.de/>)
- vcdimager (<http://www.vcdimager.org/>)
- cdrdao (<http://cdrdao.sourceforge.net/>)
- A Firewire card
- The firewire kernel module\

libdv should be built first, because you need to build MJPEGTools with libdv enabled.\

## Recording the Video

I know jack squat about video recording.  The only hint I can give you here is RECORD USING 16-BIT AUDIO MODE IF YOU HAVE THE OPTION.  Some video cameras default to 12-bits.  Don't do this.  You can't change it later.  You'll end up with really quiet audio.  There is probably some way to fix it, but I'm sure it's long and complicated and just not worth the effort.\

## Capturing the Video

To capture the video, you have to perform the following steps:\

- Rewind your camera to the right spot
- Plug your video camera into the firewire port
- Load the firewire module using <span style="font-family: monospace;">modprobe raw1394</span>
- Start the dvgrab utility: <span style="font-family: monospace;">dvgrab --format dv2 --autosplit --size 100 base_filename\
  </span>
- Hit "play" on your video camera
- Wait until video is done
- Hit "stop" on your video camera
- Hit "Ctl-C" on your keyboard to stop dvgrab

The parameters as shown will result in a type-2 DV file being made (NOTE - this is very important, or else the mjpegtools won't be able to process it).  It will automatically split the file into multiple files every 100 Megabytes.  Each file will be named base_filenameXXX.avi.  A one-hour video will eat up approximately 16 Gigabytes of disk space.  You shouldn't be doing anything else while this is going on, or dvgrab will miss frames.\

## Encoding the Video

MJPEGTools has a handy utility called lav2mpeg.  It's just a bash script.  Depending on the version, you may need to modify it (it uses toolame by default for audio encoding, rather than mp2enc which comes with MJPEGTools).  Somewhere in the first few lines it will have some code relating to toolame, and just replace toolame with mp2enc.\

Now we can encode the video.  It's very simple:\

- Type in lav2mpeg -m vcd -o output.mpg base_filename\*
- Wait for about 10 hours on a fast machine
- output.mpg has your file

## Preparing the Burn

Preparing the burn is easy.  Just type in vcdimager output.mpg.  This will create two files - videocd.cue and videocd.bin.\

## Burning

To find out where your burner is on the SCSI chain, you'll have to look at the CD-Burning HOWTO.  Usually, for IDE-only systems, your burner is at <span style="font-family: monospace;">0,0,0</span> (no spaces).  Once you know that, it's easy.  Just do\

    cdrdao write --device YOURDEVICE videocd.cue

If it doesn't know what driver to use, <span style="font-family: monospace;">generic-mmc</span> usually works. YOURDEVICE refers to, in my case, <span style="font-family: monospace;">0,0,0</span>.  The CD Burner will burn away, and afterwards you can just put it in your DVD player and hit play.\

\
