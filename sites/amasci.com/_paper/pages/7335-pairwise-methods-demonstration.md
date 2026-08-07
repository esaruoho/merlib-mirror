---
title: "Pairwise Methods Demonstration"
source_domain: amasci.com
source_path: ~robla/politics/condorcet-front.html
order: 7335
reachable_from_entry: false
images: 3
internal_links: 4
extracted: 2026-08-07T17:14:54Z
extractor: site_to_paper.py (pandoc)
---

# Pairwise Methods Demonstration

*Source page: `~robla/politics/condorcet-front.html`*

# Pairwise Methods Demonstration

This is a fully-functional program for calculating the winner of a pairwise election, as featured in [The Perl Journal](http://www.tpj.com). I will confess that this interface was designed more for flexibility and efficiency than user-friendliness, but with a little patience, it shouldn't be too tough to figure out. The idea is that you feed it a candidate list and a bundle of ballots, and it tells you the result of that election. Currently, it calcuates the [Condorcet](condorcet.html), Copeland, and Smith winners.

To use this, enter a two column, comma-separated list of candidate number and candidate names below. Candidate numbers can be any non-negative integers of size limited only by the memory of the machine (I've hardwired a limit of 200 on this machine). For efficiency, numbering should start at zero and proceed up in increments of one, but this is not a requirement.

Here's some sample data you can try (just cut and paste this in to the field below):

    1,Joe Left
    2,Sally Middle
    3,Martha Right

Enter a list of ballots, one per line. Each line should contain a list of candidate numbers in order of preference from most preferred to least preferred. The candidates should be separated by "\>" when the next candidate is less preferred, and "=" when the next candidate is equally preferred. It is not necessary to rank all candidates on every ballot.

If you wish to specify multiple ballots with the same ranking, precede the ranked list with ":", where is the number of times that ballot should be duplicated.

You may put comments after a hash symbol (#). Any text after \# on a line will be ignored.

Here's some sample data you can try (just cut and paste this in to the field below):

    40:3>2  # 40 ballots where Martha is preferred over Sally (and both implicitly over Joe)
    9:2>3   # 9 ballots, Sally over Martha (over Joe)
    16:2>1  # 16 ballots, Sally over Joe (over Martha)
    20:1=2  # 20 ballots, Joe and Sally tied, both preferred over Martha 
    15:1>2  # 15 ballots, Joe over Sally (over Martha)

[Back to the Condorcet's method homepage](condorcet.html)

[Political Justification of Condorcet's Method](condorcet-explain.html)

[Technical Explanation of Condorcet's Method](condorcet-tech.html)

[Source Code for Condorcet Winner Calculator](condorcet-program.html)

------------------------------------------------------------------------

Related sites:\
[<img src="/~robla/cpr/cvdsmall.gif" data-hspace="5" data-vspace="5" data-border="0" width="196" height="79" alt="The Center For Voting &amp; Democracy" />](http://www.igc.apc.org/cvd) [<img src="/~robla/cpr/wacprsml.gif" data-hspace="5" data-vspace="5" data-border="0" alt="Washington Citizens For Proportional Representation" />](http://www.eskimo.com/~robla/cpr/) [<img src="/~robla/littleho.gif" data-hspace="5" data-vspace="5" data-border="0" alt="Rob&#39;s Homepage" />](http://www.eskimo.com/~robla)

------------------------------------------------------------------------

<robla@eskimo.com>

\
Last modified: Sat Jan 17 23:36:43 Pacific Standard Time 1998
