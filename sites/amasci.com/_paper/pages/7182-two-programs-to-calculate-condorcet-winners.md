---
title: "Two Programs to Calculate Condorcet Winners"
source_domain: amasci.com
source_path: ~robla/politics/condorcet-program.html
order: 7182
reachable_from_entry: false
images: 3
internal_links: 4
extracted: 2026-08-07T05:59:51Z
extractor: site_to_paper.py (pandoc)
---

# Two Programs to Calculate Condorcet Winners

*Source page: `~robla/politics/condorcet-program.html`*

Two Programs to Calculate Condorcet Winners

# Two Programs to Calculate Condorcet Winners

This is [condorcet.pl](condorcet.pl) and [condorcet.cgi](condorcetcgi.txt), two programs which tally ranked preference ballots using Condorcet's method. They are both written in Perl, and are in essense the same program with a different wrapper.

[condorcet.cgi](condorcetcgi.txt) creates much more aesthetically pleasing HTML 2.0+ tables than the plain text output of [condorcet.pl](condorcet.pl). If you want to see [condorcet.cgi](condorcetcgi.txt) in action, check out [the working version of the program](condorcet-front.html). This is only the initial alpha release of this script. It's pretty crude, and the documentation is pretty much the program. This is just a release for the technically inclined. If you do decide to try it out, please let me know what you think. I was going to wait until I had the time to get everything documented and tested, but I would probably just wait forever.

Hopefully, there will be more user-friendly releases in the near future. I'll announce new versions here as they become available.

## Getting `condorcet.pl` To Work

If you are unfamiliar with Perl, check for info in the following places:

- [Tom Christiansen's list of Perl Resources](http://www.perl.com/)
- [Yahoo's list](http://www.yahoo.com/Computers_and_Internet/Languages/Perl/)

Perl is essentially the Swiss Army Chainsaw of scripting languages, and it runs on just about every operating system available. Note, though, that this script runs only with Perl version 5.

condorcet.pl is freely available software, licensed under [the GNU Public License](/~robla/gplv2.txt).

` usage: perl condorcet.pl [-t] `*`candidate-list ballot-list`*

Here's what it all means:

     -t    Print the raw tally table. (pair-wise election results)

     candidate-list - contains a two column, comma-separated list of
                      candidate number and candidate names.  Candidate    
                  numbers can be any non-negative integers of unlimited
              size.  For efficiency, numbering should start at zero
                  and proceed up in increments of one, but this is not
                  a requirement.

     ballot-list -    this should be a list of ballots, one per line.  Each
                  line should contain a list of candidate numbers
              separated by commas.

Ballots are not checked for validity, and results may be unpredictable with bad input.

Copyright 1995 Rob Lanphier

This program may be copied under the terms of the GNU public license, version 2.

Now for [the script itself](condorcet.pl).

[Back to the Condorcet's Method Home Page](condorcet.html)

[Political Justification of Condorcet's Method](condorcet-explain.html)

[Interactive Demo of Condorcet's Method](condorcet-front.html)

[Technical Explanation of Condorcet's Method](condorcet-tech.html)

Related sites:\
[<img src="/~robla/cpr/cvdsmall.gif" data-hspace="5" data-vspace="5" data-border="0" width="196" height="79" alt="The Center For Voting &amp; Democracy" />](http://www.igc.apc.org/cvd) [<img src="/~robla/cpr/wacprsml.gif" data-hspace="5" data-vspace="5" data-border="0" alt="Washington Citizens For Proportional Representation" />](http://www.eskimo.com/~robla/cpr/) [<img src="/~robla/littleho.gif" data-hspace="5" data-vspace="5" data-border="0" alt="Rob&#39;s Homepage" />](http://www.eskimo.com/~robla)

------------------------------------------------------------------------

*<robla@eskimo.com>*\
