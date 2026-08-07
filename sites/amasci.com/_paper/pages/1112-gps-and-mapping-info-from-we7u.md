---
title: "GPS and Mapping Info From WE7U"
source_domain: amasci.com
source_path: ~archer/gps.html
order: 1112
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T05:54:54Z
extractor: site_to_paper.py (pandoc)
---

# GPS and Mapping Info From WE7U

*Source page: `~archer/gps.html`*

**Latest News:** The Xastir APRS program now supports USGS DRG geotiff topo maps. These maps are available for most areas of the US free. Get the latest anonymous CVS snapshot of the Xastir sources to gain this capability. It should appear in the next public release as well. See my mapping page to find out how to get access via CVS.

Go to <a href="http://support.garmin.com" target="_top">Garmin Support Site</a> for upgradeable firmware for GARMIN GPS's. I would suggest doing this from DOS, not a DOS window, just to make sure it goes well. The software for doing the programming is included in the downloadable archive.

\

### <span id="Differential GPS">Differential GPS</span> :

[Next Topic](#GPS%20Parallel%20Receivers) .

First of all, buying a GPS receiver that is "DGPS Ready" does not mean that you can use DGPS out of the box. You still need to invest in a DGPS receiver, antenna, and cabling to hook it to your GPS. There are several types of DGPS, and I only describe the free US Coast Guard-style DGPS here. With USCG DGPS, you can resolve down to 1-5 meters, if your GPS is a high-quality one. See your GPS manual for the DGPS accuracy spec.

The other types of DGPS are: Commercial DGPS (where you get corrections from a receiver supplied by them), and survey-grade DGPS (where you use a special receiver that listens to the military frequency as well and might resolve down to cm accuracy). There is also post-processing, where you collect a bunch of data (usually RINEX format), then grab data off the net later and combine the two in post-processing software to get more accurate positions. Post-processing requires a receiver capable of outputing pseudo-ranges (most consumer handhelds cannot).

<a href="ftp://ftp.netcom.com/pub/rc/rcochran" target="_top">Code For Roll-Your-Own DGPS Receiver, by Richard Cochran.</a> You'll need a receiver capable of tuning 283.5 to 325 kHz, technical skill to build an FSK or MSK modem, and plenty of patience for tuning the shortwave receiver (the shift used is very narrow). This code for a PC-clone will compile under Microsoft-C or Borland-C. It receives the data from the modem on a handshake pin, and sends the RTCM-104 data out the TXD pin (which you can then put into your GPS to get a DGPS fix). Summary: You only need one COM port in order to do this. The author of the code was using a palmtop computer that only had one hardware COM port (the other was IR). Here's another place to get it, although it isn't guaranteed to be the latest: <a href="ftp://ftp.eskimo.com/u/a/archer/" target="_top">Curt's Anonymous FTP Site</a>

If you are further interested in building your own DGPS, **I have put together a mini-FAQ on DGPS** that is available if you E-Mail me (Curt, WE7U). You can send me E-Mail from the link at the top of this page. Note that this FAQ will be of no use to those wanting to buy a DGPS receiver and/or figure out how to use their DGPS system. It only discusses the U.S. Coast Guard DGPS system, and does not discuss survey quality DGPS like real-time kinematic or post-processing. U.S. Coast Guard-style DGPS will get you generally within 1-10 meters, but I have heard that you can quite often get 1-5 meter accuracy. It also depends on the quality of the GPS receiver (check your manual for DGPS accuracy specs).

<a href="http://home1.gte.net/clseng/DGPS_index.htm" target="_top">Rich Heineck</a> has some too-cool designs for DGPS receivers that can be carried along while hiking/hunting/whatever (Click on the "Pocket Sized" link when you get there. I can't say I'd recommend building the "Low Cost but Very Basic" design of his, at least not after seeing and using the "Pocket Sized" design. I got the opportunity to borrow one. It's very small and works great! His PIC processor code converts the received bits into RTCM-104 data for input into a GPS, and also runs through the parity algorithm and lights an LED if the data stream is good. Beware that the ground from your GPS must be isolated from the signal ground used in this circuit. The reason is the voltage doubler circuit, which creates higher voltages to send to the GPS (note, this is probably old info now, 'cuz his latest design doesn't use a voltage doubler or the expensive lithium battery). Make sure you click on the pictures. He includes source code for the PIC processor. Stay tuned for whatever this guy comes up with next...

<a href="http://home.san.rr.com/bix/DGPS_Project.htm" target="_top">A new from-scratch DGPS receiver design by Jim Bixby</a> . This receiver will cost just over \$100 in parts, runs from Car/Boat battery, and can use a whip or loopstick antenna. Control is via up/down switches, and it shows status via an LCD display. Be patient with this server (or click on reload a lot). This project is extremely well documented, and includes source code for the PIC processor. Until the .pdf files get replaced you won't be able to print out the schematics though. Contact Jim directly to get replacement .pdf files until the new ones get updated on the web.

To find DGPS transmitter coverage areas worldwide, try <a href="http://www.csi-dgps.com/gbl.htm" target="_top">CSI-DGPS.COM</a> . For more information on US Coast Guard DGPS, see <a href="http://www.navcen.uscg.mil/dgps/coverage/dgpssite.htm" target="_top">USCG.MIL</a> . There is a <a href="http://www.effective-solutions.co.uk/dgps1.html" target="_top">British site</a> which provides DGPS at 50pence/minute over a modem w/free DGPS software (covers 150 mile radius around Ramsey, England).

More information about DGPS:\
<a href="http://www.trimble.com/gps/nfsections/diffGPS/aa_dg1.htm" target="_top">Trimble</a>\
<a href="http://www.cnde.iastate.edu/staff/swormley/gps/dgps.html" target="_top">Sam Wormley</a>\
<a href="http://www.navcen.uscg.mil/" target="_top">US Coast Guard</a>\
<a href="http://www.navcen.uscg.mil/dgps" target="_top">US Coast Guard DGPS</a>\
<a href="http://www.dgps.com/" target="_top">DGPS.COM</a>

------------------------------------------------------------------------

### <span id="GPS Parallel Receivers">GPS Parallel Receivers</span> :

[Previous Topic](#Differential%20GPS) . [Next Topic](#Number%20of%20Satellites%20Required%20for%20a%20Position%20Fix%20) . [Go to Top](gps.html) .

Why buy a parallel GPS receiver?

The scanning (multiplexing) GPS receivers (anything with less than 5 parallel receivers) work reasonably well in marine, desert, or other fairly open environments, but can fall on their face amidst tall buildings or trees (especially trees with high moisture). The reason is that they don't have enough tracking loops to dedicate one for each satellite used in the fix, so they have to multiplex between the various satellites that are in view, and can easily lose satellites when the satellites are obstructed, even if its only a momentary obstruction. Since four satellites are needed to get one fix, any receiver with 5 or more channels (tracking loops) can use the extra channels to look for satellites with better geometry or higher signal-to-noise ratios. If using a 12-channel unit, then each channel can be dedicated to holding the lock on a particular satellite's signal constantly.

For heavy tree foliage, high buildings, or deep canyons, one needs units with 5 or more parallel receiving channels (as many channels as you can get up to 12). For marine or aviation use, parallel channels are not as important (unless you are just a passenger on a commercial airliner and therefore have poor sky visibility). The extra channels not currently being used in a fix can either search for new satellites or hold the lock on current satellites while the other four provide a good 3-D fix. There are three reasons to have more than five channels:

1\) Extra satellites can be used to reduce SA error by up to 25% according to Apelco/Raytheon. GPS receiver software must be designed to do this of course. I've heard that newer Garmins may do this.

2\) Extra satellites can help give an accurate fix when multipath reflections cause some satellite's signals to be degraded. The higher S/N ratio signals from the extra satellites will be used for the 3-D fix instead of the lower S/N ratio signals from the multipath reflections.

3\) Tracking more satellites than are necessary for a solution helps in the case of obstructions, where some of the satellites are temporarily removed from view. The GPS receiver will merely grab the highest S/N ratio and closest-to-horizon satellites it can for the solution. If it is tracking more satellites, it has more to choose from.

\
Because 12-channel receivers are in the "inexpensive" category now, it doesn't make sense to buy anything with fewer channels, unless you have very specific needs that aren't met by these units (perhaps battery-life or size). The multiplexing receivers can be compared against parallel receivers in terms of signal-to-noise ratio (S/N). The multiplexing receivers will appear to have a much lower S/N ratio than the parallel receivers. Good luck getting that kind of a figure out of the GPS manufacturers though.

------------------------------------------------------------------------

### <span id="Number of Satellites Required for a Position Fix">Number of Satellites Required for a Position Fix</span> :

[Previous Topic](#GPS%20Parallel%20Receivers) . [Next Topic](#Good%20Deals) . [Go to Top](gps.html) .

\
This chart shows how many satellites must be actively tracked in order to get a fix.

    No. of Satellites   Fix Provided
    -----------------   ------------
    2           -none-
    3           Crude 2-D Fix
    4-12            Good 3-D Fix

We need one active satellite tracked per unknown variable: Time, latitude, longitude, altitude. More than 12 channels is wasteful because the maximum satellites visible to any earth observer is 12. The exception to this is the Glonass/GPS units which track the Russian AND the U.S. satellites at the same time in order to get better position accuracy or more satellites viewable in questionable areas.

Current GPS receivers usually optimize their solution using satellites that are closer to the horizon, which makes the 2D position more accurate at the expense of altitude readings. When very low to the horizon however, the errors increase due to propagation variations through the atmosphere. Most GPS's will have a cutoff angle below which they won't use a satellite for these reasons. Once the satellite rises above this angle, it can be used again in the calculations. This angle varies with the GPS model.

Here's something to think about: A submarine can get an accurate fix with only two satellites if it has a \$50,000 atomic clock connected to the GPS receiver and they assume the altitude to be 0.

------------------------------------------------------------------------

### <span id="Good Deals">Good Deals</span> :

[Previous Topic](#Number%20of%20Satellites%20Required%20for%20a%20Position%20Fix%20) . [Next Topic](#Table%20of%20GPS%20Models) . [Go to Top](gps.html) .

My interest is in land-based portables and remote sensor units. Here are my current favorites for remote sensor units (must be hooked up to another device to be useful, as they have no screen/keyboard). All have 12-channel receivers:

        DeLorme Tripmate    $150*   With Delorme Street Atlas USA 4.0
        Etak Skymap     $250    Mapping system with 12-channel PCMCIA GPS, w/remote
        Garmin GPS-35PC     $275    Price should be lower now on this one

\* Warning about Rockwell engines: One person has done extensive tests of several models at a fixed, surveyed location, and has some surprising results. Please visit <a href="http://www.erols.com/dlwilson/gps.html" target="_top">David Wilson's GPS Page</a> . David tested the Eagle Explorer, DeLorme Tripmate, Garmin GPS-12XL, GPS-35, and GPS-45, with at least a few more to follow. Please examine all available data before making a purchasing decision.

------------------------------------------------------------------------

### <span id="Table of GPS Models">Table of GPS Models (Know of any more?)</span> :

[Previous Topic](#Good%20Deals) . [Next Topic](#General%20GPS%20Links) . [Go to Top](gps.html) .

NOTE: For a LARGE list of available GPS units, check out the January issue of GPS World magazine. Over 100 manufacturers listed, and many models. I've been told that ANY January issue will do, but of course seek out the latest one. I'm deleted my table because it was getting way to outdated.

------------------------------------------------------------------------

### <span id="General GPS Links">General GPS Links</span> :

[Previous Topic](#Table%20of%20GPS%20Models) . [Next Topic](#GPS%20Vendors) . [Go to Top](gps.html) .

1.  <a href="http://www.joe.mehaffey.com/" target="_top">Joe and Jack's GPS Information</a>
2.  <a href="http://vancouver-webpages.com/peter/index.html" target="_top">Peter Bennett's Web Pages</a> . If you haven't visited this site, you don't know much about GPS.
3.  <a href="ftp://sundae.triumf.ca/pub/peter/index.html" target="_top">Peter Bennett's FTP directory</a> . (Same info as above, different site, ftp instead of www)
4.  <a href="http://www.bridge.de/~tom/garmin.htm" target="_top">Info on Garmin Units</a>
5.  <a href="http://www.nlr.nl/nin/oemtable.htm" target="_top">Info on embedded GPS units</a>
6.  <a href="http://www.teletype.com/gps/links" target="_top">Other GPS Links</a>
7.  <a href="http://www.ron-weber.com/" target="_top">Eagle GPS Info</a>
8.  <a href="http://www.imaginegps.com" target="_top">ImagineGPS.com</a>
9.  <a href="http://www.fys.uio.no/~kjetikj/fjellet/GPS1.html#buying" target="_top">GPS Info</a>
10. <a href="http://wwwhost.cc.utexas.edu/ftp/pub/grg/gcraft/notes/coordsys/coordsys.html" target="_top">Coordinate Systems</a>
11. <a href="http://www.cnde.iastate.edu/gps.html" target="_top">Global Positioning System (GPS) Resources</a>
12. <a href="http://www.fys.uio.no/~kjetikj/fjellet/GPS1.html" target="_top">Handheld GPS's in backcountry</a>
13. <a href="http://galaxy.einet.net/editors/john-beadles/introgps.htm" target="_top">Intro to GPS Applications</a>
14. <a href="http://www.abnormal.com/~thogard/" target="_top">Tim Hogard's Home page (Garmin Info)</a>
15. <a href="http://playground.sun.com/pub/soley/garmin.txt" target="_top">http://playground.sun.com/pub/soley/garmin.txt</a> (Garmin protocol)
16. <a href="http://www.ll.mit.edu/index.html" target="_top">http://www.ll.mit.edu/index2.html</a>
17. <a href="http://satnav.atc.ll.mit.edu/gps/images/gps-scat.gif" target="_top">GPS Scatter Plot</a>
18. <a href="http://www.ngs.noaa.gov/CORS/cors-data.html" target="_top">http://www.ngs.noaa.gov/CORS/cors-data.html</a>
19. <a href="http://www.ngs.noaa.gov" target="_top">NGS Info</a>
20. <a href="http://www.paranoia.com/~filipg" target="_top">http://www.paranoia.com/~filipg</a>
21. <a href="http://www.fys.uio.no/~kjetikj/fjellet/GPS1.html" target="_top">http://www.fys.uio.no/~kjetikj/fjellet/GPS1.html</a>
22. <a href="http://everest.hunter.cuny.edu/gismo/" target="_top">GISMO Home Page</a>
23. <a href="http://everest.hunter.cuny.edu" target="_top">http://everest.hunter.cuny.edu</a>
24. <a href="http://www.gpsworld.com" target="_top">GPS World Magazine</a>
25. <a href="http://www.advanstar.com:80/GEO/GPS/Subscribe.html" target="_top">GPS World</a>
26. <a href="http://www.ggrweb.com" target="_top">GeoWeb Interactive</a>
27. <a href="http://www.hit.fi/~ppatama" target="_top">PPatama</a>
28. <a href="http://www.ualberta.ca/~norris/navigation/GPS/PlotSA.html" target="_top">SA - The Movie</a>
29. <a href="http://www.telson.net" target="_top">GPS Info</a>
30. <a href="http://www.cacd.rockwell.com/products/pgvplgr.htm" target="_top">Military GPS Info</a>
31. <a href="http://www.monmouth.army.mil/cecom/lrc/exfor/battle/plgr.html" target="_top">Military GPS Info</a>
32. <a href="http://www.cacd.rockwell.com/products/pgplgr9.htm" target="_top">Military GPS Info</a>
33. <a href="http://satnav.atc.ll.mit.edu" target="_top">Satnav</a>
34. <a href="http://sun-valley.Stanford.EDU/projects/helicopters/helicopters.html/info.html#Stats" target="_top">Stanford Autonomous Helicopter</a>
35. <a href="http://callisto.worldonline.nl/~samsvl" target="_top">Board Level GPS Receivers</a>
36. <a href="http://www.trimble.com/satview/" target="_top">Checking Number of Satellites in View</a>
37. <a href="http://sirius.chinalake.navy.mil/cgi-bin/satpred-query" target="_top">Checking Number of Satellites in View</a>
38. <a href="http://www.cnde.iastate.edu/staff/swormley/gps/satellites.html" target="_top">Checking Number of Satellites in View</a>
39. <a href="http://users1.ee.net/ptech" target="_top">NMEA Decoder, speaks to you</a>

------------------------------------------------------------------------

### <span id="GPS Vendors">GPS Vendors</span> :

[Previous Topic](#General%20GPS%20Links) . [Next Topic](#GPS%20Manufacturers) . [Go to Top](gps.html) .

1.  <a href="http://www.einet.net/editors/john-beadles/gps_dis.htm" target="_top">List of GPS Distributors</a>
2.  <a href="ftp://aleph.gsfc.nasa.gov/GPS/totally.accurate.clock/tapr-garmin-group-buy.txt" target="_top">Garmin 8-channel group buy at TAPR</a>
3.  Bass Pro, 1-800-BASS-PRO
4.  <a href="http://www.basspro.com" target="_top">Bass Pro Shops</a>
5.  Boat/U.S., 1-800-937-2628
6.  Boater's World, 1-800-826-2628, 206-575-1920?
7.  The Boating Center, 716-385-3060
8.  <a href="http://www.cabellas.com" target="_top">Cabellas</a> , 1-800-237-4444, 308-234-5555 (foreign orders)
9.  <a href="http://www.cansel.ca" target="_top">Cansel.ca</a>
10. <a href="http://www.commsysin.com" target="_top">CommSystems Intermountain</a>
11. <a href="http://www.dgps.com" target="_top">DCI</a>
12. Defender Industries, 1-800-628-8225
13. E&B Marine, 1-800-533-5007, 908-819-7400
14. Fred Meyer
15. <a href="http://rampages.onramp.net/~gcraze" target="_top">The Glass Cockpit</a>
16. <a href="http://www.he.net/~redsword/gps/market.htm" target="_top">GPS Marketplace</a>
17. <a href="http://www.gulf-coast-avionics.com" target="_top">Gulf Coast Avionics</a>
18. Inland Marine, Salem, OR, 1-800-324-1356
19. <a href="http://ares.redsword.com/gps" target="_top">J. Beadles</a>
20. <a href="http://www.csn.net/~lwjames" target="_top">James Associates</a>, lwjames@csn.net, 303-530-9014 (Garmin Dealer)
21. K-Mart
22. <a href="http://catalog.com/bahnware/commerce-market/magellan/magellan.html" target="_top">Magellan Systems Corp. Home Page</a>
23. <a href="http://www.gsn.com" target="_top">MarineNet</a>
24. <a href="http://www.mvangel.com/ham.html" target="_top">Mathew Vangel and Associates</a> (Garmin Dealer)
25. <a href="http://www.mercat.com" target="_top">Mercat GPS Dealer</a>
26. <a href="http://www.vitinc.com/nn/mud/el/el1.html" target="_top">Mud Hole</a>
27. <a href="http://www.navtechgps.com" target="_top">NavTech</a>
28. <a href="http://www.ncrm.com/" target="_top">North Coast Resource Management</a>
29. <a href="http://www.alaska.net/~avionics/nlahome.html" target="_top">Northern Lights Avionics</a>
30. <a href="http://www.novatel.ca" target="_top">NoVatel</a>
31. Offshore Angler, 1-800-4-OFFSHORE
32. <a href="http://www.premier-gps.com" target="_top">Premier GPS</a>
33. <a href="http://ourworld.compuserve.com/homepages/TT_Designs/ttd.htm" target="_top">TT Designs</a>
34. Walmart
35. <a href="http://www.flsun.com/boating/ads/weak_1.htm" target="_top">Weak Industries (Book)</a>
36. <a href="http://www.iwol.com/iww/customers/westmarine" target="_top">West Marine</a> , 1-800-538-0775, 408-728-2700
37. Most any marine/camping/hunting supply catalog or store
38. <a href="http://www.gps4fun.com" target="_top">gps4fun.com</a>

------------------------------------------------------------------------

### <span id="GPS Manufacturers">GPS Manufacturers</span> :

[Previous Topic](#GPS%20Vendors) . [Next Topic](#GPS-Related%20Software) . [Go to Top](gps.html) .

1.  <a href="http://truegnss.com" target="_top">3S Navigation</a>
2.  <a href="http://www.apelco.com" target="_top">Apelco (Raytheon)</a>
3.  <a href="http://www.ashtech.com" target="_top">Ashtech</a>
4.  <a href="http://www.marconi.ca" target="_top">Canadian Marconi</a>
5.  <a href="http://www.cmtinc.com" target="_top">Corvallis MicroTechnology</a>
6.  <a href="http://www.csi-dgps.com" target="_top">CSI DGPS</a>
7.  <a href="http://www.delorme.com" target="_top">Delorme</a> (Made by Rockwell?)
8.  <a href="http://www.eaglegps.com" target="_top">Eagle (Lowrance)</a>
9.  <a href="http://www.uni.net/eagle" target="_top">Eagle (Lowrance)</a> Italian?
10. <a href="http://www.etak.com/skymap/index.html" target="_top">Etak</a>
11. <a href="http://www.garmin.com" target="_top">Garmin,</a> 1-800-800-1020, 913-397-8200, 913-397-8282 (Fax), 913-599-2103 (Fax)
12. <a href="http://www.gec.com" target="_top">General Electric/GEC-Plessey</a>
13. II Morrow
14. Impule (See Uniden)
15. Koden
16. Leica
17. <a href="http://lowe.co.uk/" target="_top">Lowe (Antennas)</a>
18. <a href="http://www.lowrance.com" target="_top">Lowrance Electronics</a>
19. <a href="http://catalog.com/bahnware/commerce-market/magellan/magellan.html" target="_top">Magellan</a>
20. <a href="http://www.alloutdoors.com/magellan/" target="_top">Magellan</a>
21. Matsushita (See Panasonic)
22. Micrologic
23. MLR
24. <a href="http://www.motorola.com" target="_top">Motorola</a>
25. <a href="http://www.motorola.com/GSTG/" target="_top">Motorola Government Space and Technology Group</a>
26. <a href="http://mot-sps.com/rf/applications/gps/gps.html" target="_top">Motorola Oncore GPS Engine</a>
27. Northstar
28. NovAtel
29. <a href="http://www.panasonic.com" target="_top">Panasonic</a>
30. <a href="http://www.premier-gps.com" target="_top">Premier GPS</a>
31. <a href="http://www.raytheon.com" target="_top">Raytheon/Apelco</a>
32. <a href="http://www.nb.rockwell.com/pb/dcd_pb.html" target="_top">Rockwell</a>
33. <a href="http://www.ormtec.demon.co.uk/sercel/sercel.htm" target="_top">Sercel</a>
34. Silva
35. Sitex
36. <a href="http://www.sony.com" target="_top">Sony</a>
37. Stanford Telecom
38. Tigershark
39. <a href="http://www.trimble.com" target="_top">Trimble</a>, 1-800-545-7762
40. <a href="http://www.uniden.com" target="_top">Uniden/Impulse</a>

------------------------------------------------------------------------

### <span id="GPS-Related Software">GPS-Related Software</span> :

[Previous Topic](#GPS%20Manufacturers) . [Next Topic](#On-Line%20Mapping%20and%20Waypoint%20Servers) . [Go to Top](gps.html) .

1.  <a href="http://vancouver-webpages.com/peter/index.html" target="_top">Peter Bennett's Web Pages</a> . Don't all searches begin here?
2.  <a href="ftp://sundae.triumf.ca/pub/peter/index.html" target="_top">Peter Bennett's FTP directory</a> . (Same info as above, different site, ftp instead of www)
3.  <a href="http://www.shareit.com/programs/100431.htm" target="_top">GARtrip Software</a>
4.  <a href="http://www.simtel.net/pub/simtelnet/win3/gis/gart109e.zip" target="_top">GARtrip (English)</a>
5.  <a href="http://www.simtel.net/pub/simtelnet/win3/gis/gart109d.zip" target="_top">GARtrip (German)</a>
6.  <a href="http://www.tu-chemnitz.de/ftp-home/pub/simtelnet/win3/gis/gart109e.zip" target="_top">GARtrip (English)</a>
7.  <a href="http://www.tu-chemnitz.de/ftp-home/pub/simtelnet/win3/gis/gart109d.zip" target="_top">GARtrip (German)</a>
8.  <a href="ftp://col.hp.com/hamradio/packet/wa7tas/gps" target="_top">G7TO</a>
9.  <a href="http://binar.bbn.com/users/grossman" target="_top">Windows program for Tripmate</a>
10. <a href="http://ourworld.compuserve.com/homepages/rimmer/waypoint.htm" target="_top">Waypoint+ Software</a>
11. <a href="http://www.chem.ethz.ch/~peny/SGZ/Bonus.html" target="_top">S/W to extract waypoints from Eagle AccuNav WS-1 file</a>
12. <a href="http://vader.castles.com/caveman" target="_top">GPS Up/Download SW</a>
13. <a href="ftp://sunsite.unc.edu/system/daemons/gpsd-0.9.tgz" target="_top">GPS Daemon for Linux</a>
14. <a href="http://jeeves.ncsa.uiuc.edu/~chabert/GpsPilot/" target="_top">GpsPilot, S/W for USR Pilot</a>
15. <a href="http://www.llamas.org/gps" target="_top">PilotGPS, S/W for USR Pilot</a>
16. <a href="http://www.netcore.com.au/~biochem" target="_top">Magellan waypoint up/download sw and DOS GPS SW</a>
17. <a href="http://www.abnormal.com/pub/gps/avia_dbm/" target="_top">Avia SW to maintain aviation databases</a>
18. <a href="hk.linkage.net/~mcoop/MCGPS/MCGPS-FULL.zip" target="_top">MCGPS</a>
19. <a href="http://www.pinpointsys.com/" target="_top">PinPoint Systems</a> , and <a href="http://www.hamptons.com/pinpoint/" target="_top">PinPoint Systems (2nd address)</a>
20. <a href="http://www.pobox.com/~jps" target="_top">Installing SA4 as helper app under Netscape</a>
21. <a href="http://www.anali.demon.co.uk/gardown.htm" target="_top">Gardown SW</a>
22. <a href="http://www.csn.net/~lwjames/GPSPRO.html" target="_top">MacGPS Pro SW</a>
23. <a href="http://www.delorme.com/tripagent" target="_top">Voice I/O for AAA Map 'n' Go and Street Atlas 4.0</a>
24. <a href="ftp://sunsite.doc.ic.ac.uk/packages/psion" target="_top">AutoGPS</a> (overlays current location onto AutoRoute)
25. <a href="http://ourworld.compuserve.com/homepages/Jon_Duff/homepage.htm" target="_top">PsiGar</a> (Psion to Garmin ul/dl waypoints)
26. <a href="http://www.cix.co.uk/~wibble/adhoc/" target="_top">MM3A</a>
27. <a href="http://ourworld.compuserve.com/homepages/palmtopnl/" target="_top">En Route</a>
28. <a href="http://www.best.com/~williams/gccalc.htm" target="_top">JavaScript Distance Calculator</a>
29. <a href="http://www.best.com/~williams/avform.htm" target="_top">Distance Formulas</a>
30. <a href="http://www.devans.demon.co.uk/speedo.htm" target="_top">Speak your speed</a>
31. <a href="http://www.geocities.com/SiliconValley/Lakes/9420" target="_top">AirNav</a>
32. <a href="http://blkbox.com/~hub/gpsdb/" target="_top">GPSdb</a>
33. <a href="http://www.webcom.com/~criteria/mentorp/garmin.html" target="_top">Garmin GPS-25/35 control software</a>
34. <a href="http://www.geog.ubc.ca/~amoy/" target="_top">HP48 -&gt; Garmin SW</a>
35. <a href="http://www.compucat.com.au" target="_top">Compucat Fleet Tracking System</a>
36. <a href="http://www.morava.com/navigate" target="_top">Navpak</a>
37. <a href="http://www.gpspilot.com/" target="_top">SkyDiver Program for PalmPilot</a>

------------------------------------------------------------------------

### <span id="On-Line Mapping and Waypoint Servers">On-Line Mapping and Waypoint Servers</span> :

[Previous Topic](#GPS-Related%20Software) . [Next Topic](#Mapping%20Software%20and%20Complete%20Systems) . [Go to Top](gps.html) .

1.  <a href="http://www.cnde.iastate.edu/staff/swormley/maps/maps_waypoints.html" target="_top">Map Databases</a>
2.  <a href="telnet://martini.eecs.umich.edu:3000" target="_top">Geographic Name Server</a> (Requires telnet)
3.  <a href="http://www.grove.net/~tkelso/NORAD/elements" target="_top">NORAD Two-line Satellite Orbital Elements</a>
4.  <a href="http://bobcat.etsu.edu/gps/" target="_top">TAMU-Commerce GPS Waypoint Server</a>
5.  <a href="http://www.mapsonus.com" target="_top">Interactive US Maps down to street level w/lat-long (Etak Database)</a>
6.  <a href="http://www.kei.com/homepages/ckd/dns-loc/finding.html" target="_top">Online Mapping</a>
7.  <a href="http://www.etakguide.com" target="_top">Interactive US Maps (ETAK Database)</a>
8.  <a href="http://www.census.gov/cgi-bin/gazetteer" target="_top">US Gazetteer (Tiger Database)</a>
9.  <a href="http://www.census.gov/" target="_top">Tiger Mapping Service</a>
10. <a href="http://www.city.net/indexes/top_maps.html" target="_top">Interactive Maps</a>
11. <a href="http://www.mapquest.com" target="_top">Map Quest</a>
12. <a href="http://www.geocode.com/cgi-win/ef.exe" target="_top">Geocode</a>
13. <a href="http://www.geocode.com/eagle.html-ssi" target="_top">Geocode</a>
14. <a href="http://www.infoseek.com" target="_top">Infoseek Street Maps</a> (Click on "Street Maps")
15. <a href="http://www.nima.mil/gns/html/index.html" target="_top">NIMA Geonet Names Server</a>
16. <a href="http://terraserver.microsoft.com" target="_top">Terraserver</a>

------------------------------------------------------------------------

### <span id="Mapping Software and Complete Systems">Mapping Software and Complete Systems</span> :

[Previous Topic](#On-Line%20Mapping%20and%20Waypoint%20Servers) . [Go to Top](gps.html) .

1.  <a href="http://www.telson.net/mapeval.htm" target="_top">Review of Mapping Software (Telson)</a>
2.  <a href="http://www.bridge.de/~tom/garmin.htm" target="_top">Reviews of Mapping Software</a> (Site in Germany)
3.  <a href="http://vancouver-webpages.com/peter/index.html" target="_top">Reviews of Mapping Software</a> (Peter Bennett's Site)
4.  <a href="http://home.earthlink.net/~vpeng/carnav.html" target="_top">Reviews of Mapping Software</a>
5.  <a href="http://http://www.alpine.com.au/promo/promo3.html" target="_top">Alpine Mapping System</a>
6.  <a href="http://www.alpine.co.jp/ave/ae_in001.html" target="_top">Alpine Mapping System Also</a>
7.  <a href="http://www.tapr.org" target="_top">APRS Info at TAPR</a>
8.  <a href="http://aprs.rutgers.edu" target="_top">APRS SW at Rutgers</a>
9.  <a href="http://www.brincad.com/avlis\psoftwar.htm" target="_top">AVL Fleet Mapping Software</a>
10. <a href="http://www.thecapn.com" target="_top">Capn SW, supports USGS topo &amp; marine charts</a>
11. <a href="http://www.carin.com" target="_top">Phillips/Magnavox Carins System</a>
12. <a href="http://www.fet.uni-hannover.de/purnhage/gps/gps.html" target="_top">CHART</a>
13. <a href="http://www.delorme.com" target="_top">Delorme AAA MapNGo</a>
14. <a href="http://www.delorme.com" target="_top">Delorme MapExpert</a>
15. <a href="http://www.delorme.com" target="_top">Delorme Street Atlas USA</a>
16. <a href="http://www.delorme.com" target="_top">Delorme 3-D Explorer USA</a>
17. <a href="http://mcmweb.er.usgs.gov/viewers/dem_view.html" target="_top">Dem3d Viewer (USGS)</a>
18. <a href="http://www.hamilton.lv/dkart/" target="_top">dKart Navigator</a>
19. <a href="http://mcmcweb.er.usgs.gov/drg/" target="_top">DRG Maps</a>
20. <a href="http://www.earthvisions.com" target="_top">Earth Visions topo maps</a>
21. <a href="http://www.diku.dk/users/elgaard/eps/help.html" target="_top">Elgaard Positioning System</a>
22. <a href="http://www.etak.com/skymap/index.html" target="_top">Etak Skymap</a>
23. <a href="http://ourworld.compuserve.com/homepages/Fawnbench/" target="_top">Fawnbench for Psion</a>
24. <a href="http://www.t-online.de/home/flexgps/homepage.htm" target="_top">FlexGPS</a>
25. <a href="http://www.fugawi.com" target="_top">Fugawi</a>
26. <a href="http://www.GPSGIS.com" target="_top">http://www.GPSGIS.com</a> (GPS-LINK and GPS-MAP software)
27. <a href="ftp://sundae.triumf.ca/pub/peter/gps_glid.zip" target="_top">GPS Glide, S/W for HPx00LX</a>
28. <a href="http://www.segelflug.de/gps/GPS_Map_e.html" target="_top">GPSMap</a> (Newton)
29. <a href="http://www.soaring.de/gps/GPS_Map.html" target="_top">GPSMap</a> (Newton)
30. <a href="http://www.gpspro.com" target="_top">GpsPro</a>
31. <a href="http://www.gpss.co.uk" target="_top">GPSS</a>
32. <a href="http://www.gpsy.com" target="_top">Gpsy (Use with SA3 for Mac)</a>
33. <a href="http://www.netcore.com.au/~biochem/index.html" target="_top">DOS &amp; Palmtop SW</a>
34. <a href="http://www.andren.com" target="_top">LoranGPS SW</a>
35. <a href="http://www.palmtop.net" target="_top">LXGPS HP100/200LX Moving Map SW</a>
36. <a href="http://www.cas-software.de" target="_top">Map&amp;Guide</a> (Web page is in German)
37. <a href="http://www.stellarnav.com" target="_top">MapSite Mapping Software</a>
38. <a href="ftp://ftp.nadn.navy.mil/pub/oceano/microdem" target="_top">MicroDEM or WinDEM</a>
39. <a href="ftp://ftp.nadn.navy.mil/pub/oceano/website/plghome.htm" target="_top">MicroDEM or WinDEM</a>
40. <a href="http://www.microplot.co.uk" target="_top">Microplot</a>
41. <a href="http://www.microsoft.com/automap" target="_top">Microsoft Automap Streets Plus</a>
42. <a href="http://www.microsoft.com/automap" target="_top">Microsoft Automap Trip Planner</a>
43. <a href="http://www.microsoft.com/automap" target="_top">Microsoft Pocket Automap Streets for Windows CE</a>
44. <a href="http://www.microsoft.com/automap" target="_top">Microsoft AutoRoute for Europe</a>
45. <a href="http://rampages.onramp.net/~gcraze" target="_top">Moving Map Info (appears to be oriented towards pilots)</a>
46. <a href="http://www.maincourse.com/" target="_top">Nav Master</a>
47. <a href="http://www.ria.com.au/mp/" target="_top">Newton SW</a>
48. <a href="http://www.nobeltec.com" target="_top">NobelTec's Visual Navigation Suite</a>
49. <a href="http://www.powerup.com.au/~lornew/oziexp.html" target="_top">OziExplorer: GPS Software &amp; Tips</a>
50. <a href="http://www.pioneer.co.jp/news/release13.html" target="_top">Pioneer Navigation System</a>
51. <a href="http://www.chicagomap.com" target="_top">Precision Mapping</a>
52. <a href="http://3lib.ukonline.co.uk/" target="_top">Psi-Mapper</a> , SW for Psion PDA's
53. <a href="http://www.randmcnally.com" target="_top">Rand McNally Street Finder</a>
54. <a href="http://www.liikkuva.com/Products/MetroGuide/MetroGuide.html" target="_top">Retki Metroguide 2.0</a>
55. <a href="ftp://ftp.ecst.csuchico.edu/pub/ems/sar/" target="_top">SARMAP</a>
56. <a href="http://www.tdc.co.uk/psion.htm" target="_top">TDC for Psion</a>
57. <a href="http://www.teletype.com/gps" target="_top">Teletype GPS Software</a>
58. <a href="http://www.rmstek.com" target="_top">Vista</a>
59. <a href="http://www.mayko.com/xmap" target="_top">Xmap and gpsd daemon</a>
