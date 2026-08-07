---
title: "all_dyno_testing_obdii"
source_domain: amasci.com
source_path: ~dalus/bmw/all/engine/all_dyno_testing_obdii.html
order: 2161
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T05:55:49Z
extractor: site_to_paper.py (pandoc)
---

# all_dyno_testing_obdii

*Source page: `~dalus/bmw/all/engine/all_dyno_testing_obdii.html`*

[UnofficialBMW.com](http://www.unofficialbmw.com)

\[an error occurred while processing this directive\]

------------------------------------------------------------------------

Date: Sat, 30 Jan 1999 18:43:45 -0700\
**[From: Land Shark \<lndshrk@xmission.com\>](mailto:lndshrk@xmission.com)**\
**[Subject: Re: \[E36M3\] RE: Jim C 2.8 dyno results (from Z3 list?)](mailto:lndshrk@xmission.com?SUBJECT=Re:%20%5BE36M3%5D%20RE:%20Jim%20C%202.8%20dyno%20results%20(from%20Z3%20list?))**\

At 05:51 PM 1/30/99 -0500, Tom Peluso wrote: \>\
\>-\> Sure.. lots of them.. BEYOND the fact that I have repeatedly said\
\>\> that owners cannot reliably dyno an OBD-II upgrade because of the\
\>\> adaption concerns (and no one seems to listen to me.. they just\
\>\> keep wasting money.. and the dynojet operators keep making money)\
\>\>\
\>How does one properly dyno an OBD-II upgrade?

Tom, simply.. as an owner.. you CAN'T..

Let me explain why (again ;)..

It's called adaption.. simply put, the Siemens boxes in the BMW 6 cylinder cars adapt under a much wider range than the previous OBD-I.. and worst off YOU can't clear the adaption..

See, previous to OBD-II, adaptive information was stored in battery backed SRAM. Unplug the DME to swap chips and woosh all adaptive factors set to "nominal" (1 for mult. and 0 for add.) Then came Kalifornia, and KARB, and OBD-II.. and EEPROM for storage.. this means you can't just "erase" it anymore because the last thing the DME does during shutdown is write the SRAM locations to EEPROM.. and guess what the first thing it does is.

Yup... zero SRAM, run a galpat memory check, and reload the needed ram locations from EEPROM.

The only way to clear the adaptive locations is via diagnostic commands down the serial port (even desoldering the main FLASH memory program store doesn't do it, because there is a separate EEPROM elsewhere)

So if you can't clear it.. you can't do an apples to apples comparison.

What's worse is the "quasi-tuners" out there who have no idea how it all works, spouting nonsense..

Either you trust the person your buying it from, or don't buy it. It really is like "Natural Flavors" in soda...

Either you trust the manufacturer, or you put the can back on the shelf, because it's not easy to quantify the contents.

I'll take my "Natural Flavors" in Surge or Mountain Dew flavors ;)

(Unless you carry Jones Soda, and then I want rasberry!... YUM!)

Now.. back to adaption.. since you can't clear it you can't get a valid comparison.. want to try something..

Take your car.. OBD-II.. chipped or stock.. drive it one week like a MADMAN and dyno it.. then drive it for another week very meekly.. and dyno it.. compare the results.. and they WILL NOT be anywhere NEAR the same.. and we didn't change the car at ALL..

Why?? (Prof. Shark asks the class)

Exactly.. the car ADAPTED to different areas of the maps and either enrichened or enleaned the overall mixture.

Now.. in whatever state the car is in, you can be rather assured that ON AVERAGE the chipped car is making significantly more power than the stock car.

Adaption works like this.. at lower loads and rpms it watches the AVERAGE correction (realize we swing rich and lean of stoichiometric continuously, except for WOT)... and it adds or subtracts a bit of fuel until the low speed fuel mixture is swinging evenly around Lambda = 1.0 / AFR 14.7:1..

Now as the rev range increases.. we switch to a multiplicative correction which adjusts (if you will) the SLOPE of the fuel curve by multiplying the STORED values by a factor (based on 1.00)

Depending upon how good the manufacturer tuned the low end and lower midrange, the environmental conditions, the fuel you are using, and the flavor of soda I have in my fridge (\*grin\*) .. well really what AREAS of that lower speed area you are in most of the time during the drive cycles.. that determines WHAT those two magic numbers will be.

The kicker.. and bummer.. is that even though lambda control isn't active, and adaption isn't HAPPENING at high throttle angles, those two numbers ARE STILL USED IN THE CALCULATION regardless as an "overall correction" to fueling.

So.. let's say that at 20% throttle and 3000 rpms the manufacturer is a bit rich.. the system adapts lean.. if you drove at very light load/throttle for a while at 3000.. you might see your peak HP drop 10HP on the dyno.. once the car adapts

Conversely, let's say the manufacturer is a bit lean at 2000 and 50% and you spend your week in LA traffic jams always gassing it in 4th and not downshifting.. car goes rich.. now you dyno your car and BOOM magic horsepower have appeared (well.. not really)

Simply put.. while any chip manufacturer can tell you that 90+% of the time your chipped car will have more HP than the stock one, unless you have cleared the adaption BOTH times when you run the cars you can't quantify it at all.

Jim

PS: Know that this isn't something I'm pulling out of my butt, it's

          as frustrating to me as it is to you, because to tune these cars
          you disconnect all 4 sensors and then put the car into intentional
          FAULTS to stop adaption.. which you then clear to 0 and 1 respectively
          then tune.. then test.. and on it goes.

------------------------------------------------------------------------

Date: Sat, 30 Jan 1999 22:25:58 -0700\
**[From: Land Shark \<lndshrk@xmission.com\>](mailto:lndshrk@xmission.com)**\
**[Subject: Re: \[E36M3\] RE: Jim C 2.8 dyno results (from Z3 list?)](mailto:lndshrk@xmission.com?SUBJECT=Re:%20%5BE36M3%5D%20RE:%20Jim%20C%202.8%20dyno%20results%20(from%20Z3%20list?))**\

At 09:17 PM 1/30/99 -0600, you wrote:

\>Okay, so if you drive your car gently all week, then it will adapt\
\>lean/rich based on how the engine is performing at low throttle.\
\>Then when you go to the track on saturday and stand on the throttle,\
\>it may be too lean or too rich depending upon how the engine is\
\>performing at WOT. Right?

Yes.. correct..

\>So, if you are going to the track in your daily driver, and you want\
\>it performing its best on Saturday, you may want to flog it during\
\>the week -- so the software is adapting to the engine at high\
\>throttle rather than at low throttle???? Right?

It would depend upon how the thing is tuned..

In practice, it's not something you can do reliably, and that's the whole problem.. unless you have a bunch of instrumentation on the car watching load and rpm and airflow and such..

Jim

\>P.S. Besides the lean/rich software, is there any other software that\
\>is adapting and affected by driving behavior?

Yes.. Idle Air (idle speed), Knock Control, and TPS position

Idle Air is affected most by load and engine/air temp

TPS by wear and tear

Knock Control by gas and driver behavior

Jim

------------------------------------------------------------------------
