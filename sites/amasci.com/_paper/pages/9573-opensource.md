---
title: "opensource"
source_domain: amasci.com
source_path: ~warlock/freesoft/opensource.html
order: 9573
reachable_from_entry: false
images: 2
internal_links: 0
extracted: 2026-08-07T06:02:04Z
extractor: site_to_paper.py (pandoc)
---

# opensource

*Source page: `~warlock/freesoft/opensource.html`*

Jim's OSS contributions

# My contributions to the Open source movement.

As you can see, there's not much at the moment, but I will keep plugging away, and will add to this as I can.

------------------------------------------------------------------------

# Python program to grab maps from US Census Tiger database

A small program to grab maps from the Tiger database operated by the Census department. It's crude, it's crufty, it's free, and you can get it [here](getmap-0.01.tgz)

------------------------------------------------------------------------

# Python paragraph formatter

A short bit of python that takes a bit of text, that has paragraphs delimited by one or more blank lines, and wraps them in \<p\>\<\p\> tags.

[para_formatter.py](para_formatter-0.05.tar.gz)

------------------------------------------------------------------------

# Microwave and RF calculations

Parabolic antenna and path calculator in TCL/TK. Latest version is 0.0.3 and is available [Here](http://www.eskimo.com/~warlock/freesoft/pathcalc-0.0.3.tar.gz). Enjoy

![](pics/path_calc.png)

Status:= No known bugs, please inform me if you find any

------------------------------------------------------------------------

# Other bits of fluff.

Temperature converter, Fahrenheight/Celsius/Kelvin. Latest version is 0.01 and is available [Here](http://www.eskimo.com/~warlock/freesoft/temp-0.0.1.tar.gz).

![](pics/temp.png)

Status:= Free of known bugs. It's a rather small program, but useful. It also shows the basics of gui doodads with tcltk\

------------------------------------------------------------------------

\
Python Code to convert from a Julian day format, to dd-month. Latest version is [here](http://www.eskimo.com/~warlock/freesoft/julian_py.tgz)

- 15 August 2000 V0.05:

  Minor code clean up, this is pretty much it unless I find (or am told about) some showstopper bugs. I'll keep trying to clean the code up, but all the features I want are here now. (At least I can't think of anything else I need/want for this) However, it is a learning project, so this might change.

- 14 August 2000 V0.04:

  Added the ability to take a command line option of a julian day, and return the dd-month If no cmd line option is present (or it is a non-valid option) Ask for user input. Also cleaned up the code a little. There is still an annoying small bug. If you give a non-numerical value on the command line, julian goes to get_input() and asks for another, but no matter what you enter the first time, it fails, and calls get_input() again. I'll fix it as soon as I can figure out why. (I am new to Python, and am learning on a day by day basis.)

- 13 August 2000 V0.03:

  Added the time() checks to see what the current year is, rather than hard coding to 2000. Don't know if this will work under non-unix like osen. But it \_should\_

- 12 August 2000 V0.02:

  Bugfix for the poor handling of non-numerical strings, thanks to some of the posters on comp.lang.python

- 12 August 2000 V 0.01:

  First public release

\
