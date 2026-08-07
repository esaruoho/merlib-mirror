---
title: "APAS Anonymous Remailer Use [FAQ 5/8]: Statistics"
source_domain: amasci.com
source_path: ~turing/remailer/FAQ/faq.5.html
order: 9142
reachable_from_entry: false
images: 0
internal_links: 3
extracted: 2026-08-07T17:17:08Z
extractor: site_to_paper.py (pandoc)
---

# APAS Anonymous Remailer Use [FAQ 5/8]: Statistics

*Source page: `~turing/remailer/FAQ/faq.5.html`*

[Up: APAS Anonymous Remailer Use \[FAQ\]](./)\
[Next: APAS Anonymous Remailer Use \[FAQ 6/8\]: Software](./faq.6.html)\
[Previous: APAS Anonymous Remailer Use \[FAQ 4/8\]: Remailer Details](./faq.4.html)

------------------------------------------------------------------------

# APAS Anonymous Remailer Use \[FAQ 5/8\]: Statistics

- [Introduction](#0)
- [\[FAQ 5.1\] What are stats pages?](#1)
- [\[FAQ 5.2\] How are stats Versions 1 and 2 different?](#2)
- [\[FAQ 5.3\] Where can I find stats pages?](#3)
- [\[FAQ 5.4\] Why are there dead remailers on the stats pages?](#4)

<span id="0"></span>

------------------------------------------------------------------------

    Subject: APAS Anonymous Remailer Use [FAQ 5/8]: Statistics

    This is the fifth of eight parts of a list of frequently-asked
    questions and their answers regarding anonymous remailer use.  This
    part is all about remailer statistics (stats).  It has changed to
    provide a more complete list of stats sources and to indicate how
    current those sources are in opinion of the maintainer.

    This FAQ is provided "as is" without any express or implied
    warranties.  While every effort has been taken to ensure the accuracy
    of the information contained in these message digests, the maintainer
    assumes no responsibility for errors or omissions, or for damages
    resulting from the use of the information contained herein.  This FAQ
    is provided for information only; reference to a Web page does not
    constitute endorsement of that page's content.

<span id="1"></span>

------------------------------------------------------------------------

    Date: 02 March 2001 12:00 Z
    From: turing+apas-user-faq@eskimo.com (Computer Cryptology)
    Subject: [FAQ 5.1] What are stats pages?
    Summary: Stats pages have estimates of remailer reliability and latency.

    Stats pages are a snapshot of the current status of the traditional
    remailer network. They list the remailers the maintainer of that stats
    page is "pinging", those remailers' capabilities and limitations, and
    how well those remailers are replying to those pings. From this data,
    remailer uptime and latency can be deduced.

    Keep in mind that the results shown on different stats pages often
    vary widely and that the stat page you are looking at shows the
    results as seen from the remailer doing the pinging. Network
    conditions between this remailer and the others can and will influence
    the results.

    For example, a stats source (pinger) temporarily without mail access
    will list all pinged remailers as having low reliability (assuming
    that Web access is present).  In fact, it is the pinger itself whose
    reliability has declined.  Refreshing stats from such a pinger may
    result in the remailer client complaining that there are not enough
    remailers.

    Other things that will influence the results are not having the
    current key(s) for a remailer on the pinger's keyring.  Often key
    changes are made and announced, but a stats page maintainer might miss
    this, or his remailer isn't automatically updating with new keys and
    purging old keys.  If possible (i.e., if the stats source provides
    them), check the keyrings.

    With new remailers coming on line all the time and others departing
    the network after only a brief appearance, it can be very difficult to
    maintain an accurate list of exactly which remailers are really
    online.  Also, when a remailer joins or leaves the network, the uptime
    and latency stats for that remailer will not respond instantaneously.
    Stats are an analysis of data taken over several days and presented as
    a moving average.
     
    Some stats pages are in question 5.3.

    Elcaro posts his Remailer Reliability Statistics daily in APAS. This
    guy is a stats maniac! His stats offer:

    * 1 Hop Remailer Check for a day and the last week 

    * MultiHop(1-4) Remailer Check for a day 

    * Position Check for the MultiHop Check for a day each remailer
      giving Success/Failure/Total/Percentage for every position 

    * Position Check for the MultiHop Check Summary for the last week 

    * Arc Analysis for Last 7 Days Success/Failure/Total/Percentage  

<span id="2"></span>

------------------------------------------------------------------------

    Date: 02 March 2001 12:00 Z
    From: turing+apas-user-faq@eskimo.com (Computer Cryptology)
    Subject: [FAQ 5.2] How are stats Versions 1 and 2 different?
    Summary: Different clients read different stats.

    There isn't a really big difference between them. Version 2 is
    somewhat more detailed and uses different symbols than Version 1 to
    represent the measurements of Latency, History and Uptime. Here's a
    typical Version 1 stats format
    <http://mixmaster.shinn.net/stats/remailer-list.html> and here's a
    typical Version 2 <http://www.neuropa.net/%7Egretchen/rlist2.html> .
    These are in HTML.  You may also download TXT versions of each.  The
    file names may vary (rlist, rlist.txt, remailer-list, etc...), but
    here are the recommended file names:

    Filename   Remailer-Type Format   Stats-Version 
    rlist           Cypherpunk      Plain Text      1 
    rlist.html      Cypherpunk      HTML            1 
    rlist2          Cypherpunk      Plain Text      2 
    rlist2.html     Cypherpunk      HTML            2 
    mlist           Mixmaster       Plain Text      1 
    mlist.html      Mixmaster       HTML            1 
    mlist2          Mixmaster       Plain Text      2 
    mlist2.html     Mixmaster       HTML            2 

    Further information on stats formats comes from RProcess'
    Specification and RFC for Remailer Stats Version: 2.b
    <http://www.skuz.net/potatoware/PSKB-032.html>.  Most users need only
    consider which stats version their client will read.  Here is a
    summary of the recommended version.  Further comments are below.

    Software    Recommended Version Recommended Format
    JBN1            1           HTML
    JBN2            2           Plain Text
    Mixmaster       1           HTML?
    Quicksilver     1           Plain Text
    Private Idaho       1           HTML
    Reliable        2           HTML

    Jack B. Nymble v.2 and Reliable v.1.0.5
    JBN2 and Reliable 1.0.5 can read both types of stats.  Pick a format
    that you like and stick with it.

    Quicksilver
    Quicksilver reads only Version 1 stats in TXT format (e.g., mlist.txt
    and rlist.txt).

    Mixmaster
    The operator of Cmeclax Remailer, <cmeclax@ixazon.dynip.com>, confirms
    that, as far as he can tell, "...Mixmaster 2.9 doesn't understand
    Version 2 [stats]. I tried it a while ago, and it had no reliability
    data when I made chains."

    Jack B. Nymble v.1
    Frog-Admin says that JBN1 only reads version 1 stats.  In that
    operator's experience, JBN1 works better with HTML files
    than with plain text files.

    Private Idaho
    As for Private Idaho, there are lots of different variations of this
    older program. But it's safe to assume that most of them require
    Version 1 stats in HTML format (e.g., remailer.htm) and won't work
    with Version 2.

    Other Clients
    Be aware that some of the older client software like Potato, Decrypt
    and Mixmaster 2.0.4 cannot read Version 2 Stats.

<span id="3"></span>

------------------------------------------------------------------------

    Date: 02 March 2001 12:00 Z
    From: turing+apas-user-faq@eskimo.com (Computer Cryptology)
    Subject: [FAQ 5.3] Where can I find stats pages?
    Summary: Various URLs may point to stats pages.

    First, consider where you might find stats pages that are no longer
    useful.  RProcess packaged JBN2 and Reliable when different stats
    pages were active.  The included stats lists are no longer current.

    Next, there are several indexes to stats sources (pingers).  Starting
    with the newest, below are the indexes available on the date shown
    above.

    lefarris "Les autres remailers"
        <http://www.citeweb.net/arris/stats/index.htm> OR
        <http://pages.globetrotter.net/arris/stats/index.htm>
    weasel "Anonymous Remailer Stats, Meta-Stats and other Information"
        <http://anon.noreply.org/stats/index.html>
    frog "All Pingers' Index"
        <http://www.privacyresources.org/frogadmin/Pingers.html> OR
        <http://www.chez.com/frogadmin/Pingers.html> OR
        <http://members.nbci.com/frogadmin/Pingers.html>

    As of the date of this question, the following pingers (in
    alphabetical order) are accurate and current or up-to-date--according
    to frog (see above) and turing, at least:

    austria <http://www.tahina.priv.at/~cm/stats/>
    efga    <http://anon.efga.org/Remailers/>
    farout  <http://www.nuther-planet.net/farout/stats/>
    frog    <http://www.privacyresources.org/frogadmin/Main.html>
    helferlein
        <http://www.helferlein.net/mixmaster/>
    senshi  <http://private.addcom.de/SenshiRemailer/>
    shinn   <rlist@mixmaster.shinn.net">http://www.mit.edu:8001/finger?rlist@mixmaster.shinn.net>
        <mlist@mixmaster.shinn.net">http://www.mit.edu:8001/finger?mlist@mixmaster.shinn.net>
    subzer0 <http://www.press.nu/leiurus/subzer0/>
    turing  <http://www.eskimo.com/~turing/remailer/stats/>

    The following stats sources produce lists significantly different from
    the stats sources above.  The cmeclax page, for example, says "Note: I
    am behind a modem, so my latency figures include my own latency as
    well as those of the pinged remailers. Use these stats only to decide
    what remailer to put after or before me."  Consider the comments in
    question 5.4 before using the others.

    cmeclax <http://lexx.shinn.net/cmeclax/>
    lefarris
        <http://pages.globetrotter.net/arris/stats/>
    publius <http://www.publius.net/>

    In addition to the pages above, active remailers with stats pages
    include the following that are CURRENTLY OUT OF DATE, but may someday
    return because the remailer still operates:

    bruble2 <http://www.angelfire.com/pe/rijto/remailer/>
    gretchen
        <http://www.neuropa.net/~gretchen/>
    xganon  <http://anon.xg.nu/list/>

    Check the date of this FAQ and of the stats pages!  The three above
    are NOT UP-TO-DATE as of the date of this writing.

<span id="4"></span>

------------------------------------------------------------------------

    Date: 02 March 2001 12:00 Z
    From: turing+apas-user-faq@eskimo.com (Computer Cryptology)
    Subject: [FAQ 5.4] Why are there dead remailers on the stats pages?
    Summary: Stats pages may go out of date when remailer network changes.

    This happens because the keeper of that stats page is either not aware
    that the dead remailers have officially left the network, or is behind
    on maintaining his stats pages. Often stats pages are maintained by
    remailer operators and their other remailer duties will take priority
    over updating their stats pages.

    Unfortunately, a poorly maintained stats site will often lead to
    problems for remailer users when they plug those URLs into programs
    like Jack B. Nymble, Private Idaho or QuickSilver and receive
    configuration error messages. The problem will repeat itself every
    time your stats are updated and the site with the stale keys is
    polled.

    One attempt to provide information on the problem described above is
    found in Computer Cryptology's Comparison tables:

    <http://www.eskimo.com/~turing/remailer/stats/db/rlist.html>
    <http://www.eskimo.com/~turing/remailer/stats/db/mlist.html>

    Further information is available at Frog's MetaStats Page
    <http://www.privacyresources.org/frogadmin/MetaStats/index.html>.

    Two comparisons between stats sources can help in selecting pingers to
    include in a remailer client's list.  First, the "Last update" time
    indicates if the values are current.  Second, a comparison of the
    remailers each stats source list can indicate if the problem described
    above is occurring.  For example, imagine a particular stats source
    lists many remailers at 0.00% reliability ("uptime"), is the only
    pinger to list several remailers, and doesn't list a dozen remailers
    that the majority of other pingers include.  That stats source is
    probably out of date, even if the "Last update" time is current.

    For further consideration, the cells in Computer Cryptology's
    Comparison shade to indicate suspected error values or outliers, i.e.,
    values far from the average of other stats sources.  The details are
    on those pages.

    Similarly, Frog's "All Pingers' Index Page"
    <http://www.privacyresources.org/frogadmin/Pingers.html> rates pingers
    as up to date versus poorly or not maintained.  These ratings express
    the opinion of the operator.

------------------------------------------------------------------------

[Up: APAS Anonymous Remailer Use \[FAQ\]](./)\
[Next: APAS Anonymous Remailer Use \[FAQ 6/8\]: Software](./faq.6.html)\
[Previous: APAS Anonymous Remailer Use \[FAQ 4/8\]: Remailer Details](./faq.4.html)

------------------------------------------------------------------------

Computer Cryptology \<<turing@eskimo.com>\>\
Generated by [digest2html.pl](http://www-viz.tamu.edu/~sgi-faq/tools/), 2001-12-02
