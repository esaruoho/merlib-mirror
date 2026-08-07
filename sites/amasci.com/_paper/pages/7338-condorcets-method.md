---
title: "Condorcet's Method"
source_domain: amasci.com
source_path: ~robla/politics/condorcet.html
order: 7338
reachable_from_entry: false
images: 3
internal_links: 1
extracted: 2026-08-07T17:14:55Z
extractor: site_to_paper.py (pandoc)
---

# Condorcet's Method

*Source page: `~robla/politics/condorcet.html`*

# Condorcet's Method

All of the dirt on Condorcet's method, an innovative (but not new) method of electing officials in single seat elections. Condorcet's method is a pairwise election system where ranked ballots are used to simulate many head-to-head elections. The winner of a Condorcet election is the candidate who wins all pairwise matchups.

News items:

- (**3/10/2002**) - Randall Burns updated the [Condorcet U.S. Presidential poll](http://www.outlander.com/condorcet/) for 2004 (now at a new location).
- (2/18/2002) - Here's [an article I wrote for Kuro5hin](http://www.kuro5hin.org/story/2002/2/17/23347/8051) about campaign finance reform, which presents the pins the problems typically associated with campaign finance on the two party system. Good background material for why Condorcet's method is important.
- (10/28/2001) - [Wikipedia](http://www.wikipedia.com), a free collaborative encyclopedia building effort, has a [page describing Condorcet's method](http://www.wikipedia.com/wiki/Condorcets_Method).
- (11/18/2000) - Randall Burns put up a U.S. Presidential poll based on the aformentioned Perl scripts.
- (10/19/2000) - Russ Paielli and Mike Ossipoff have put together an excellent new page on Condorcet's method (<http://electionmethods.org>) which is much more up-to-date with the current state of thinking, and probably explains it better than I do. It even has it's own domain name (fancy, huh?)

About Condorcet's method:

- If you are unsure why we even need to fuss with our election system at all, you should read [the political justification for electoral reform and Condorcet's method](http://www.eskimo.com/~robla/politics/condorcet-explain.html). Campaign finance reform activists, media critics, and those that whine about voter apathy take note. This one is written for you.
- Here's an [interactive demo of Condorcet's method](http://www.eskimo.com/~robla/politics/condorcet-front.html). The user interface is a tad crude, but I think you can get the idea of how Condorcet's method works. This program was [featured in *The Perl Journal*](http://www.samag.com/documents/s=1282/sam01030002/).
- A technical explanation of Condorcet's method is available [here](http://www.eskimo.com/~robla/politics/condorcet-tech.html). I get into the specifics of how my program to calculate Condorcet winners works.
- Speaking of my program, [here's where you can find out how and where to get it from](http://www.eskimo.com/~robla/politics/condorcet-program.html). It's freeware (a.k.a. "[open source](http://www.opensource.org)"), which means you have access to the source code and can modify and redistribute it, with a few strings attached. It's licensed under the [GNU Public License](http://www.gnu.org/copyleft/gpl.html)
- I'm not the only person who has written a program to calculate Condorcet winners. [Lucien Saumur](http://www.igs.net/~lsaumur/) has also written a program. It does require downloading, and works only on Microsoft Windows. It has a lots of buttons and little clicky things though, so if you are into that sort of thing, you might want to try his.
- Blake Cretney has a great explanation on a Condorcet variant called [Path Voting](http://www.fortunecity.com/meltingpot/harrow/124/path).
- If you are interested in talking about Condorcet's method and other methods of election reform, by all means, join the [Election Methods Mailing list](http://www.eskimo.com/~robla/em).
- It looks as though the [Debian Project](http://www.debian.org) has been using a variant on Condorcet for some time called the "Concorde Method". Read about it in the [appendix of the group's constitution](http://www.debian.org/devel/constitution). For those that are unfamiliar with Debian, they are responsible for Debian GNU/Linux, which is one of the leading Linux operating system distributions.
- More links can be found on [the links page](/~robla/condorcet/links.html)

## What is "Condorcet's method"?

Condorcet's method is one of several *pairwise* methods, which are great methods for electing people in single-seat elections (president, governor, mayor, etc.). Condorcet's method is named after the 18th century election theorist who invented it. Unlike most methods which make you choose the lesser of two evils, Condorcet's method and other pairwise methods let you rank the candidates in the order in which you would see them elected. The way the votes are tallied is by computing the results of separate pairwise elections between *all* of the candidates, and the winner is the one that wins a majority in *all* of the pairwise elections.

The best result of this is that if there is Candidate A on one extreme who pulls 40% of the vote, Candidate B in the middle who only pulls 20% of the vote, and Candidate C on the other extreme who pulls 40% of the vote, Candidate B will get elected as a compromise. Why? Because in a two-way contest between A and B, B would win with 60% of the vote, and in a two-way contest between B and C, B would also win with 60% of the vote. (Note that if B is a looney billionaire, he might not be able to win separate pairwise elections against anyone, and this *would* be reflected with Condorcet's method.)

Condorcet's method lets voters mark their sincere wishes for who they would like to win the election, without having to consider strategy ("I'd vote for Candidate B, but I'm afraid of wasting my vote."). It's really just a logical extension of majority rule when more than two choices are involved. Other pairwise methods, such as Copeland's method and Smith's method, have other desireable characteristics. The best of the pairwise methods is something that is [quite debatable](http://www.eskimo.com/~robla/em/).

## Wait, I've heard of this before...

You may have. However, there are many methods other methods similar to this one (though in my opinion, inferior), so don't be so sure. In order to be fair, here are a couple of those other methods:

- **Majority preference voting (MPV)** -- related to PV. Like PV, the voter simply ranks candidates in an order of preference (e. 1. Perot 2. Clinton 3. Bush). The candidate with the least number of first place votes is eliminated, and their votes are "transferred" to their 2nd choice until a candidate has a majority. It is frequently advocated and is better than our current system, but still has some nasty properties (like possibly knocking compromise candidates out of the running early). MPV is actually in use in Austrailia, among other places. Also known as Hare's Method.
- **Approval** -- Voters are allowed to vote for *all* candidates they approve. For example, Bush-Yes Perot-No Clinton-Yes. The candidate with the highest number of "yes" votes wins. For a more complete explanation, see <http://bcn.boulder.co.us/government/approvalvote/center.html>
- **[Other Election Methods](http://dmoz.org/Society/Politics/Campaigns_and_Elections/Voting_Systems/)**-The Netscape Open Directory Project now has a pretty complete list of alternate voting systems (ok, I'm probably biased since I'm the maintainer).

Both of these methods are somewhat reasonable solutions. However, they fail in many fundemental respects that are discussed on the [Election Methods Mailing list](http://www.eskimo.com/~robla/em).

|  |  |  |  |
|----|----|----|----|
| [Political Justification of Condorcet's Method](http://www.eskimo.com/~robla/politics/condorcet-explain.html) | [Interactive Demo of Condorcet's Method](http://www.eskimo.com/~robla/politics/condorcet-front.html) | [Technical Explanation of Condorcet's Method](http://www.eskimo.com/~robla/politics/condorcet-tech.html) | [Source Code for Condorcet Winner Calculator](http://www.eskimo.com/~robla/politics/condorcet-program.html) |

Related sites:\
[The Condorcet Project](http://wwwis.cs.utwente.nl:8080/kbs/condorcet). This is named after Marquis de Condorcet, and has little to do with Condorcet's method, but it is related.

[<img src="http://www.eskimo.com/~robla/politics/cvdsmall.gif" data-hspace="5" data-vspace="5" data-border="0" width="196" height="79" alt="The Center For Voting &amp; Democracy" />](http://www.igc.apc.org/cvd)[<img src="http://www.eskimo.com/~robla/politics/wacprsml.gif" data-hspace="5" data-vspace="5" data-border="0" width="172" height="79" alt="Washington CitizensFor Proportional Representation" />](http://www.eskimo.com/~robla/cpr/)[<img src="http://www.eskimo.com/~robla/politics/littleho.gif" data-hspace="5" data-vspace="5" data-border="0" width="125" height="80" alt="Rob&#39;s Homepage" />](http://www.eskimo.com/~robla)

------------------------------------------------------------------------

*<robla@eskimo.com>*\
