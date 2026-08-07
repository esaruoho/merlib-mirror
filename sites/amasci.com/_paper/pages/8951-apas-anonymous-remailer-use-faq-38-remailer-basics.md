---
title: "APAS Anonymous Remailer Use [FAQ 3/8]: Remailer Basics"
source_domain: amasci.com
source_path: ~turing/remailer/FAQ/faq.3.html
order: 8951
reachable_from_entry: false
images: 0
internal_links: 3
extracted: 2026-08-07T06:01:28Z
extractor: site_to_paper.py (pandoc)
---

# APAS Anonymous Remailer Use [FAQ 3/8]: Remailer Basics

*Source page: `~turing/remailer/FAQ/faq.3.html`*

[Up: APAS Anonymous Remailer Use \[FAQ\]](./)\
[Next: APAS Anonymous Remailer Use \[FAQ 4/8\]: Remailer Details](./faq.4.html)\
[Previous: APAS Anonymous Remailer Use \[FAQ 2/8\]: alt.privacy.anon-server](./faq.2.html)

------------------------------------------------------------------------

# APAS Anonymous Remailer Use \[FAQ 3/8\]: Remailer Basics

- [Introduction](#0)
- [\[FAQ 3.1\] What is an anon server or anonymous remailer?](#1)
- [\[FAQ 3.2\] Who runs these remailers and why?](#2)
- [\[FAQ 3.3\] What is a Cypherpunk Remailer?](#3)
- [\[FAQ 3.4\] How do I get the key for a particular remailer?](#4)
- [\[FAQ 3.5\] How can I get all the keys for all the remailers?](#5)
- [\[FAQ 3.6\] What is a Mixmaster Remailer?](#6)

<span id="0"></span>

------------------------------------------------------------------------

    Subject: APAS Anonymous Remailer Use [FAQ 3/8]: Remailer Basics

    This is the third of eight parts of a list of frequently-asked
    questions and their answers regarding anonymous remailer use.  This
    part introduces anonymous remailers.

    This FAQ is provided "as is" without any express or implied
    warranties.  While every effort has been taken to ensure the accuracy
    of the information contained in these message digests, the maintainer
    assumes no responsibility for errors or omissions, or for damages
    resulting from the use of the information contained herein.  This FAQ
    is provided for information only; reference to a Web page does not
    constitute endorsement of that page's content.

<span id="1"></span>

------------------------------------------------------------------------

    Subject: [FAQ 3.1] What is an anon server or anonymous remailer?

    An anonymous remailer is a computer which has been configured to run
    remailer software. This software is a specialized kind of email server
    software. Unlike the average email server which goes to great lengths
    to log all incoming/outgoing traffic and add identifying and traceable
    info to its outgoing mail (in the form of headers) remailer software
    ensures that outgoing mail has been STRIPPED CLEAN of any identifying
    information! Thus the name 'anonymous' remailer.

    The remailer performs certain automated tasks which include retrieving
    mail, decrypting/processing that mail (only mail that is properly
    encrypted and formatted), obeying the directives within the message
    and, finally, delivering - remailing - the finished product to a
    second party in anonymized form. When received by that second party it
    will reveal only that it was sent from an anonymous source (usually
    the remailer's name and email address). The IP address shown will be
    the IP address of the remailer machine.

    Ideally, no logs are kept by the remailer software. This ensures both
    the anonymity of the user and protects the operator from liability.
    (See Mike Shinn's work in progress FAQ For Remailer Operators
    <http://mixmaster.shinn.net/faq/index.html>.)

    The process is not completely automated since a human operator is
    required - called a remailer operator, or RemOp - to ensure that
    traffic is running smoothly, that PGP and Mixmaster encryption keys
    are kept updated, that complaints of abuse are dealt with, and also
    that users and fellow operators are kept up to speed on any changes to
    the remailer's configuration. APAS is the place where such updates are
    posted. They are also posted to the Remailer Operator's Mailing List
    (Blank email to remailer-operators-request@anon.lcs.mit.edu for
    details on how to subscribe.) There is also an archive of the Remop's
    List <http://lexx.shinn.net/mailman/listinfo/remops>. You can even
    post to the list from this Web page! (Thanks Mike Shinn.)

    That's basically how a remailer works. Some anonymous remailers can
    send both email and newsgroups posts. And most will require newly
    arrived messages to be encrypted. More about that later.  See also:
    Andre Bacard's Remailer FAQ <http://www.andrebacard.com/remail.html>
    and William Knowles' overview of anonymity on the 'Net
    <http://www.c4i.org/erehwon/anonymity.html>.

<span id="2"></span>

------------------------------------------------------------------------

    Date: 07 July 2001 12:00 Z
    From: turing+apas-user-faq@eskimo.com (Computer Cryptology)
    Subject: [FAQ 3.2] Who runs these remailers and why?
    Summary: Determine for yourself the remailer operators' character.

    Some documents will refer to the "traditional remailer network".  This
    refers to the remailers listed on the many stats pages (see FAQ 5.1)
    available on the Web.  These are run, mostly, by individuals like
    those in APAS, who value free speech, especially anonymous speech, and
    want to provide a free service to those you need to communicate
    anonymously.  Keep in mind that there is no way to know the real
    motivation a remailer operator has unless you know them personally,
    and even then you may not know the full story.

    Since anyone with the technical ability and network connectivity can
    operate a remailer, there are endless possibilities as to the real
    motivations behind offering such a service to the public at large.
    Always floating around the APAS rumor mill are accusations that one or
    more remailers are really being run by intelligence agencies, law
    enforcement agencies, and even terrorist organizations and other
    criminal types.  Of course no credible evidence is ever presented to
    back up these accusations so they are mostly dismissed as trolling.
    But if one takes the devil's advocate position, there is never any
    evidence presented to refute these rumors either; that is, it is
    entirely possible they could be true.

    One way to learn more about individual remops might be to visit their
    home pages, some of which are here in alphabetical order:

    __Remailer Web Pages__
    Austria
        <http://www.tahina.priv.at/~cm/stats/>   
    Cracker
        <http://anon.efga.org/> 
    Dizum
        <https://ssl.dizum.com/help/remailer.html>
    Farout
        <http://www.nuther-planet.net/farout/>
    Lefarris (en Franais) 
        <http://www.citeweb.net/arris/>
    Narnia (mostly German)
        <http://www.trumpkin.Narnias-Door.com/remailer/>
    Noisebox
        <http://noisebox.remailer.org/remailer/>
    Randseed
        <http://melontraffickers.com> 
    Riot
        <http://www.riot.eu.org/anon/>
    Senshi
        <http://private.addcom.de/SenshiRemailer/>
    Shinn
        <http://mixmaster.shinn.net/>
    SubZer0
        <http://www.press.nu/leiurus/subzer0/>
    Cmeclax
        <http://lexx.shinn.net/cmeclax/>

    __Nym Servers__
    NYM.ALIAS.NET Nym Server <http://www.publius.net/n.a.n.html>
    ANON.XG.NU Nym Server <http://anon.xg.nu/>
    Redneck Nym Server (middleman) <http://anon.efga.org>

    (Submit other Web page URLs to CC <turing+apas-user-faq@eskimo.com>.)

    Learning to use the traditional remailer network takes some time and
    effort. And this time and effort pays off handsomely by providing the
    user with a highly secure method to communicate privately and
    anonymously. But many privacy-minded folks (and their ranks are
    increasing daily!) are looking for an easier and less time-intensive
    approach. Some are even willing to pay for it. To satisfy this niche
    there have arrived many new products and services that provide various
    combinations of anonymous email, newsgroup posting and Web-surfing
    with varying degrees of anonymity.

    To describe and evaluate these services is, for now, beyond the scope
    of this FAQ. I have provided URLs for some of these services below. I
    have categorized them into two groups: free of charge and fee-based.
    Noteworthy amongst these is the fee-based Freedom Software by the
    Montreal-based Zero Knowledge Systems (ZKS). Launched in December
    1999, Freedom is a 'privacy system' not unlike the traditional
    remailer network . It allows users to send email, post to newsgroups,
    chat and surf the Web in total privacy without having to trust third
    parties with their personal information. Freedom users create multiple
    digital identities - "nyms" - with which their online activities are
    associated. All data packets Freedom users send are encrypted and
    routed through a global privacy infrastructure called the Freedom
    Network, which is hosted by participating ISPs and other independent
    server operators. A 30-day free trial is available.

    The package has been criticized <http://cryptome.org/zks-v-tcm.htm>
    for not being open-source. But that is changing. The source code of
    the kernel module of the Linux version of Freedom
    <http://opensource.zeroknowledge.com/> has been released; and the
    release of the Windows version source code is "coming soon";
                                        
     _Free of Charge_ 
    GILC Web-Based Remailer
    <http://www.gilc.org/speech/anonymous/remailer.html> 
    Hushmail <http://www.hushmail.com> 
    Safeweb <http://www.safeweb.com>
    Zixmail <http://www.zixmail.com>
    Anonymouse <http://anonymouse.is4u.de/> 
    COTSE <http://www.cotse.com/home.html> 
    Somebody.net <http://somebody.net/>
    ANON.XG.NU's Web-Based Remailer <http://anon.xg.nu/remailer.html>
    Chicago <http://xenophon.r0x.net/cgi-bin/mixnews-user.cgi>
        
    _Fee-Based_ 
    ZKS Freedom <http://www.freedom.net>
    SkuzNET's The Internet Mail Network <http://www.theinternet.cc/>
    Mailanon <http://www.mailanon.com/> 
    IDcide <http://www.idcide.com>

    For an interesting discussion of the pros and cons of anonymous speech
    check out this link from LCS.MIT.EDU:
    <http://www.lcs.mit.edu/anniv/speakers/presentation?id=041399-15>

    (I'm looking for more links of this nature: political, legal
    perspectives on remailers. If you know of any please pass them on to
    CC <turing+apas-user-faq@eskimo.com>.)

<span id="3"></span>

------------------------------------------------------------------------

    Subject: [FAQ 3.3] What is a Cypherpunk Remailer? 

    Also referred to as a Type I, this is a remailer that accepts messages
    encrypted with its publicly available PGP key. PGP is Pretty Good
    Privacy, the well-respected public-key encryption program which is
    widely available and, with a few exceptions, freeware. Users encrypt
    their clear-text, outgoing message with the Cypherpunk remailer's
    public key. This can be done with any text editor like Notepad and a
    properly installed version of PGP. There is a particular message
    format to follow, one that the remailer software can understand:

    ============ 
    ::
    Anon-To: news.reporter@nbc.com">news.reporter@nbc.com
    Latent-Time: +0:00

    ##
    Subject: My Company Dumps Toxic Waste

    I'm writing this anonymously because I don't want to lose my job.
    My company has, for the past three years... 
    ============ 

    The above message is cut and paste into PGP and encrypted with the
    chosen remailer's key, say gretchen@neuropa.net

    ============ 
    -----BEGIN PGP MESSAGE-----

    Version: PGP 2.6x
    hQCMA8asoPEC0e2BAQP9GqR2aXNOstRq8eJW2QVubioR0gO7Ue0AOL/rFdnxXknC
    YPpe2X2TKlcvd961+lhe9w2Y8vo3JcBYYBifTJRwmMjnXLagCU4Mhh0VZtk/QXMZ
    /FLeJWi67qsb45a2mNw0/Q8eXHKfOQyHcmEQ7cg/bq4Xz6LusfxBHF8zsojVOgal
    8RVRtr9drjBlOzJvWxaq7LrKidME6q0tM7pRiLN5dvVBon2NKlmpJI6vAFjyi8ma
    f5Bg6Zor+PMxcm3EmuWbjLEiOu5USrTgU4OiaC7PHF9INxwXuKmdNz/JprgOc0c6
    6s6RvbOo6rsvlwqPKw==
    =ICz/
    -----END PGP MESSAGE-----
    ============= 

    Finally, the user has to append a directive to the top of the
    encrypted message, making it look like this:

    ============ 
    ::
    Encrypted: PGP

    -----BEGIN PGP MESSAGE-----
    Version: PGP 2.6x 

    hQCMA8asoPEC0e2BAQP9GqR2aXNOstRq8eJW2QVubioR0gO7Ue0AOL/rFdnxXknC
    YPpe2X2TKlcvd961+lhe9w2Y8vo3JcBYYBifTJRwmMjnXLagCU4Mhh0VZtk/QXMZ
    /FLeJWi67qsb45a2mNw0/Q8eXHKfOQyHcmEQ7cg/bq4Xz6LusfxBHF8zsojVOgal
    8RVRtr9drjBlOzJvWxaq7LrKidME6q0tM7pRiLN5dvVBon2NKlmpJI6vAFjyi8ma
    f5Bg6Zor+PMxcm3EmuWbjLEiOu5USrTgU4OiaC7PHF9INxwXuKmdNz/JprgOc0c6
    6s6RvbOo6rsvlwqPKw== 
    =ICz/
    -----END PGP MESSAGE-----
    ============ 

    The user then mails the above encrypted message (double colons and
    all) NOT to the intended recipient but instead to the remailer's
    address: <gretchen@neuropa.net>. This arrives at the remailer where it
    is eventually processed, decrypted and mailed to
    <news.reporter@nbc.com">news.reporter@nbc.com> appearing to have come from "Anonymous"
    <nobody@neuropa.net>.

    Most remailers are not purely Cypherpunk but will accept both
    Cypherpunk and Mixmaster messages. Keep in mind too that there are
    currently only a few Cypherpunk (Type I) remailers that will accept
    non-PGP messages and their numbers are dwindling.

    See also:

    This tutorial with pictures and step by step instructions
    <http://anon.xg.nu/shotsof.htm>.

    Read some history about how Cpunk remailers first came about
    <http://cryptome.org/zks-v-tcm.htm>.

    Visit this link at LCS.MIT.EDU about remailers and their importance
    <http://www.lcs.mit.edu/impact/perspect/perspective?name=9901>.

<span id="4"></span>

------------------------------------------------------------------------

    Date: 24 October 2001 12:00 Z
    From: turing+apas-user-faq@eskimo.com (Computer Cryptology)
    Subject: [FAQ 3.4] How do I get the key for a particular remailer?
    Summary: Send remailer an email message with "Subject: remailer-key".

    That's easy!  Send a blank email message to the remailer with
    "remailer-key" (without the quotation marks) as the subject line.  The
    reply from the remailer should contain its PGP (perhaps both RSA and
    DH/DSS) and Mixmaster keys.  If you can't get a reply to a
    remailer-key request it's likely you won't get any mail through that
    remailer either!

<span id="5"></span>

------------------------------------------------------------------------

    Date: 02 March 2001 12:00 Z
    From: turing+apas-user-faq@eskimo.com (Computer Cryptology)
    Subject: [FAQ 3.5] How can I get all the keys for all the remailers?
    Summary: Get them individually; see question 3.4.

    There are some stats maintainers who will maintain an up-to-date
    collection of all the current remailer keys.  Here are a few places to
    download all the keys, starting with the newest:

    Computer Cryptology's Database
    <http://www.eskimo.com/~turing/cgi-bin/db.cgi>

    Frog's Thesaurus Data
    <http://www.privacyresources.org/frogadmin/Thesaurus/Thesaurus.html> OR
    <http://www.chez.com/frogadmin/Thesaurus/Thesaurus.html> OR
    <http://members.nbci.com/frogadmin/Thesaurus/Thesaurus.html>

    Trex is out-of-date and Peter removed it.  As Weasel used to say,
    "*Get [the keys] yourself from each remailer!* I mean it!"  Frog's
    Web page agrees that collecting information and/or remailer keys
    second hand is a bad idea. The most secure (but not the fastest) way
    to do this is to send individual requests to all the remailers
    according to your needs:

        Subject: remailer-key
        Subject: remailer-conf
        Subject: remailer-help
        Subject: remailer-stats

    If you nevertheless permit your client to refresh keys from keyrings
    on the Web, lists of the known key sources likely to be more current
    than this FAQ are here:

    Frog's MetaStats
    <http://www.privacyresources.org/frogadmin/MetaStats/index.html> OR
    <http://www.chez.com/frogadmin/MetaStats/index.html> OR
    <http://members.nbci.com/frogadmin/MetaStats/index.html>

    The following URLs might be current--check the date of this FAQ.  (The
    links come from Computer Cryptology's List of Known Stats Sources,
    <http://www.eskimo.com/~turing/remailer/stats/db//rlists.txt> and
    <http://www.eskimo.com/~turing/remailer/stats/db//mlists.txt>.)

    efga    <http://anon.efga.org/Remailers/TypeIList/pubring.asc>
        <http://anon.efga.org/Remailers/type2.list> ;
        <http://anon.efga.org/Remailers/pubring.mix>
    farout  <http://www.nuther-planet.net/farout/keys/rsa-dss.asc>
        <http://www.nuther-planet.net/farout/keys/type2.lis> ;
        <http://www.nuther-planet.net/farout/keys/pubring.mix
    frog    <http://www.privacyresources.org/frogadmin/Keys/dsskeys.asc>
        <http://www.privacyresources.org/frogadmin/Keys/type2.lis> ;
        <http://www.privacyresources.org/frogadmin/Keys/pubring.mix>
    shinn   <http://mixmaster.shinn.net/stats/rsa-pubring.asc>
        <http://mixmaster.shinn.net/stats/type2.list> ;
        <http://mixmaster.shinn.net/stats/pubring.mix>
    subzer0 <http://www.press.nu/leiurus/subzer0/pubring.asc>
        <http://www.press.nu/leiurus/subzer0/type2.lis> ;
        <http://www.press.nu/leiurus/subzer0/pubring.mix>
    turing  <http://www.eskimo.com/~turing/remailer/keys/remailers.asc>
        <http://www.eskimo.com/~turing/remailer/keys/type2.lis> ;
        <http://www.eskimo.com/~turing/remailer/keys/pubring.mix>

    Use of these URLs depends on the remailer client.  For example, for
    the Mixmaster keys, one might need pubring.mix and, perhaps, type2.lis
    depending on the Mixmaster version.  Examples illustrating how to
    place these in various clients are on these Web pages:

    Client Configurations for DUMMIES
    <http://www.privacyresources.org/frogadmin/Configs/index.html>
    Stats - Configuration (JBN2 only)
    <http://www.eskimo.com/~turing/remailer/stats/db/JBN.html>

    Consider the comments in question 5.4 before using the following URLs:

    lefarris
        <http://pages.globetrotter.net/arris/cles/rsa-dhdss.asc>
        <http://pages.globetrotter.net/arris/cles/type2.lis ;
        <http://pages.globetrotter.net/arris/cles/pubring.mix>
    xganon  <http://anon.xg.nu/list/pubring.asc>
        <http://anon.xg.nu/list/type2.list> ;
        <http://anon.xg.nu/list/pubring.mix>

    These may be out of date!

<span id="6"></span>

------------------------------------------------------------------------

    Subject: [FAQ 3.6] What is a Mixmaster Remailer?

    Also known as a Type II remailer, this kind of remailer accepts
    messages in the Mixmaster format. It doesn't use a PGP key but instead
    it uses it's own Mix key which looks like something like this:

    -----Begin Mix Key-----
    08daa0412580b473b0405a27b6eb72f6
    258
    AATLm+Il10etAgaOBsAMfggFXi2ghiyypIkZkqhh
    W0Ef6LvDNLdPZ94Gu4QgPDD+q13JyRwmU/TvTgIk
    SBGxv9dUH3J22BEg600vD9lWOcFiq3ApjUuxS76T
    Zf+lGTINOIs+zkAmrojqueQfHFxBE0rMembno8jg
    VHlOpyeHRfJNIQAAAAAAAAAAAAAAAAAAAAAAAAAA
    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    AAAAAAAAAAAAAAAAAAAAAQAB
    -----End Mix Key-----

    Mixmaster uses a message format based on RSA and Triple-DES
    encryption. Messages are multiply encrypted and formatted so as to
    appear identical to other Mixmaster messages . Messages are sent
    through chains of Mixmaster remailers. Each remailer removes one layer
    of encryption, and forwards the message. When the final remailer
    delivers the decrypted message to the recipient, it is impossible to
    find out where it came from even if part of the remailer chain is
    compromised.

    Mixmaster remailers improve on Cypherpunk remailers by making traffic
    analysis much more difficult. It does this by making all incoming and
    outgoing messages the same size (28.1kb) and by re-ordering messages
    before delivery - so that traffic coming in cannot be associated
    necessarily with traffic going out.

    The building of a Mixmaster message cannot be done with a text editor!
    Special client software is required.

    See also Mixmaster FAQ
    <http://www.obscura.com/~loki/remailer/mixmaster-faq.html>.

------------------------------------------------------------------------

[Up: APAS Anonymous Remailer Use \[FAQ\]](./)\
[Next: APAS Anonymous Remailer Use \[FAQ 4/8\]: Remailer Details](./faq.4.html)\
[Previous: APAS Anonymous Remailer Use \[FAQ 2/8\]: alt.privacy.anon-server](./faq.2.html)

------------------------------------------------------------------------

Computer Cryptology \<<turing@eskimo.com>\>\
Generated by [digest2html.pl](http://www-viz.tamu.edu/~sgi-faq/tools/), 2001-12-02
