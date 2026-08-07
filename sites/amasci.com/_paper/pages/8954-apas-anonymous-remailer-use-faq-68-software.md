---
title: "APAS Anonymous Remailer Use [FAQ 6/8]: Software"
source_domain: amasci.com
source_path: ~turing/remailer/FAQ/faq.6.html
order: 8954
reachable_from_entry: false
images: 0
internal_links: 3
extracted: 2026-08-07T06:01:28Z
extractor: site_to_paper.py (pandoc)
---

# APAS Anonymous Remailer Use [FAQ 6/8]: Software

*Source page: `~turing/remailer/FAQ/faq.6.html`*

[Up: APAS Anonymous Remailer Use \[FAQ\]](./)\
[Next: APAS Anonymous Remailer Use \[FAQ 7/8\]: Nyms](./faq.7.html)\
[Previous: APAS Anonymous Remailer Use \[FAQ 5/8\]: Statistics](./faq.5.html)

------------------------------------------------------------------------

# APAS Anonymous Remailer Use \[FAQ 6/8\]: Software

- [Introduction](#0)
- [\[FAQ 6.1\] Do you recommend that I learn PGP (Pretty Good Privacy)?](#1)
- [\[FAQ 6.2\] Which remailer client should I choose?](#2)

<span id="0"></span>

------------------------------------------------------------------------

    Subject: APAS Anonymous Remailer Use [FAQ 6/8]: Software

    This is the sixth of eight parts of a list of frequently-asked
    questions and their answers regarding anonymous remailer use.  This
    part answers the question, "Which software should I use?"

    This FAQ is provided "as is" without any express or implied
    warranties.  While every effort has been taken to ensure the accuracy
    of the information contained in these message digests, the maintainer
    assumes no responsibility for errors or omissions, or for damages
    resulting from the use of the information contained herein.  This FAQ
    is provided for information only; reference to a Web page does not
    constitute endorsement of that page's content.

<span id="1"></span>

------------------------------------------------------------------------

    Subject: [FAQ 6.1] Do you recommend that I learn PGP (Pretty Good Privacy)?

    Yes. Absolutely. There are many excellent tutorial pages on the Web
    with links pointing you to the version that's right for you. A really
    excellent tutorial for newcomers is here
    <http://home.mpinet.net/pilobilus/EZ_PGP.htm> .

    The latest stable version is PGP is 6.5.8
    <ftp://ftp.zedz.net/pub/crypto/pgp/pgp60/> Thankfully there are many
    places to download PGP <http://www.cryptography.org/getpgp.htm> .
    Desktop Security, Personal Privacy or Freeware versions; all these are
    recommended although they are rather bloated (7-11 megs).  Whatever
    version you choose, it must be capable of creating and working with
    RSA keys since this is what remailer software and nym server software
    use for the most part. Check out this excellent Web site for the
    lowdown on which versions support RSA keys, Diffie-Hellman keys or
    both. <http://rmarq.pair.com/pgp/#chart>

    Earlier command line versions of PGP are very popular with remailer
    users. PGP 2.6.3i-win32 <ftp://ftp.pgpi.com/pub/pgp/2.x/pc/windows/>
    has become something of a standard for Windows users. It is small,
    "rock" stable and seems to "play well with others". 'An excellent
    companion to any remailer client.

    See also Tom McCune's very readable FAQ about PGP
    <http://www.McCune.cc/PGPpage2.htm> ; and another PGP tutorial
    <http://www.skuz.net/pgp4dummies/> ;

<span id="2"></span>

------------------------------------------------------------------------

    Subject: [FAQ 6.2] Which remailer client should I choose?

    Get comfortable with using PGP encryption by itself. Find a friend who
    uses it and exchange keys. Then, get yourself a remailer client.

    As for which one to choose: well... the short answer: Quicksilver or
    Jack B. Nymble.

    The long answer: I have listed a handful of remailer tools below.
    There are a handful of others (Anonpost, Crusader, John Doe...) I've
    chosen to highlight the ten programs below because they are the ones
    that are readily available on the Internet and free of charge.
    However, I would add a word of warning before trying these programs:

    To my knowledge there currently does not exist a remailer client that
    functions "out of the box". All remailer clients (especially the ones
    that are no longer maintained) require a certain amount of tinkering
    and configuring to make them work with the current crop of remailers
    and stats URLs. Just so you know...

    I highly recommend QuickSilver because it is one of the only programs
    out there that is actively being maintained and developed. If you've
    spent any amount of time in APAS you'll have seen many Quicksilver
    updates announced there. JBN is great too. And you'll find answers to
    your JBN questions simply by lurking here in APAS.

    For Windows:

    QuickSilver <http://quicksilver.skuz.net/>
    Finally, Mixmaster made easy! This free program is the newest of the
    remailer clients. It's a Mixmaster email client program. It can send
    anonymous email and post anon articles to newsgroups via Mixmaster
    remailer chains. QS, itself, doesn't possess any encryption
    capabilities. Instead, it serves as a GUI "front end" to Ulf
    Mller's Mixmaster 2.9beta.

    Recently, QS author Richard Christman has written a PGP-plugin for
    Quicksilver. <ftp://skuz.net/pub/quicksilver/> So now it's not only a
    Mixmaster client. It's a Cypherpunk remailer client as well!

    Jack B. Nymble 2 <http://www.bigfoot.com/~potatoware/jbn2/index.html>
    (From the User's Manual:) "Jack B. Nymble 2 (or JBN) is a feature-rich
    Windows email client which facilitates the use of anonymous remailers
    for anonymous email and newsgroup posting. It includes ease of access
    and automation for beginning users, as well as sophisticated control
    of remailer messages for more advanced users. Support is included for
    PGP encrypted messages, Mixmaster messages, attachments, and MIME
    mail. JBN2 also includes support for nym mail and nym account
    reply-block creation (see #7.1-#7.4), centralized queuing and sending
    via SMTP, POP3 retrieval, NNTP retrieval, and automated nym mail
    decryption. It also includes a mini web browser used for downloading
    remailer reliability statistics, keys, and web pages. Support is
    included for PGP versions 5.5.3x and 6.x, in addition to DOS version
    2.6.x. Mixmaster 2.0.4 is also fully supported."

    Also, excellent documentation and help files can be found at the
    Potatoware Homepage <http://www.bigfoot.com/~potatoware> .

    Private Idaho <http://www.eskimo.com/~joelm/pi.html>
    P.I. is an email client for Windows which simplifies the creation and
    the sending of anonymous remailer messages. It also simplifies the
    creation of nym accounts and the sending/receiving and decryption of
    nym messages. It is available in both 16-bit and 32-bit versions. A
    properly installed version of PGP is required. Additionally, Mixmaster
    messages can also be created and sent if Mixmaster is installed on
    your computer.  The author, Joel McNamara, no longer maintains this
    program and it's age is showing.Trying to make PI do what you want it
    to do is probably more trouble than it's worth. If you want to give it
    a go I would recommend the 16-bit version by Ian Lynagh
    <http://www.lynagh.demon.co.uk/pidaho/> with source code available.

    See also this excellent page of FAQs related to Private Idaho
    <http://www.dnai.com/~wussery/pgp.html> and Thanatop's tutorial on
    Remailers, Nyms and Private Idaho <http://www.skuz.net/Thanatop/> .

    Potato and Decrypt <http://www.bigfoot.com/~potatoware/pot/index.html>
    Potato is a freeware DOS remailer client which operates well in
    Windows. This software prepares anonymous messages which are then
    mailed using your email client. Decrypt is a mail decryption utility
    provided with Potato, available as a separate application. These
    programs are early creations of RProcess the author of both JBN and
    the Reliable Remailer <http://www.bigfoot.com/~potatoware/reli/> - a
    popular remailer server for Win95/98.

    Mixmaster <http://www.thur.de/home/ulf/mix/> 
    For DOS users there is Mixmaster v 2.0.4. For DOS/Windows users
    Mixmaster 2.9beta is what you want.These are the two versions that are
    most commonly used. Mixmaster can be used by itself as a client or as
    remailer. But for Windows users we suggest using one of the excellent
    GUI clients mentioned above in concert with Mixmaster.

    For Mac:

    Mixfit (aka Macmixmaster)
    <http://www.geocities.com:80/SiliconValley/Byte/6176/macmixmaster.html>
    A Mac Mixmaster Client. Like Potato this program does not mail the
    Mixmaster message that it has created. You must cut and paste it into
    your favorite email client.

    For more Mac encryption and security-related downloads try here
    <ftp://erg.ucd.ie/Public/Macintosh/Cryptography/> and here
    <http://www.shopmiami.com/prs/fritz/macpgp.htm> ; For a variety of
    interesting email-related software including a Mac Remailer(!) called
    AnonAIMouS try here
    <http://download.uni-hd.de/ftp/pub/mac/info-mac/comm/inet/mail/> ;

    For Unix/Linux:

    Mixmaster <http://www.thur.de/home/ulf/mix/>
    Mixmaster for the Unix/Linux OS. The same executable can be used as a
    client or as a remailer. The remailer can be installed on any *nix
    account that can receive mail. Non-remailer messages will be delivered
    as usual. If you have root access, you may want to create a new user
    (e.g.,`remailer') and install Mixmaster under that user id. The
    iInstall script provides a simple way to set up the remailer.

    As a remailer Mixmaster can be configured to additionally accept and
    process Cypherpunk remailer messages. In fact, this is the way most
    remailers run today: as a hybrid of Cpunk and Mix.

    Premail <ftp://dl.xs4all.nl/pub/mirror/munitions/network/email/>
    Premail is an older but still useful program written by Raph Levien
    for use with remailers. It fully supports the creation of Cypherpunk
    and Mixmaster messages. Perhaps most useful is its ability to create
    and manage nym accounts with good security and easy commands.  In
    addition to being a remailer client, Premail supports PGP and S/MIME
    for standard secured Internet e-mail. It works with mh, elm, Mutt and
    newer versions of Netscape. It requires Perl to be installed on your
    computer.

    The RemOp of the now defunct Septic Remailer warns: "Premail breaks
    when fed mail to a nym which has been signed with something other than
    PGP 2.6.x."

    See also <http://www.debian.org/Packages/unstable/mail/premail.html>.

    SendNym
    <http://www.driveway.com/web/share.jsp?sid=57794b91.bacca&name=%3DIntern
    et&dwSession=vapp03-7be21aa956ea322b&view==0> 
    A brand new program by oldhack@nym.xg.nu It takes the place of
    Sendmail in relation to your mail client and facilitates the use of
    nyms by sending simple nym commands to your mail client, allowing
    users to easily switch between sending through their nym or sending
    through their regular e-mail account. It will not create a nym for
    you. This must be done manually by the user before using Sendnym. It
    supports Usenet posting,and random chain selection (through
    Mixmaster.)

    Sendnym has been successfully tested on Linux 2.2.17 . It requires: a
    *nix system with Sendmail, Perl and Mixmaster installed. Also, your
    mail client must allow you to configure the name and location of
    Sendmail (e.g. Pine).

    Mailcrypt <http://www.nb.net/~lbudney/linux/software/mailcrypt.html>
    Although not a remailer client, Mailcrypt is an Emacs interface to PGP
    and GnuPG <http://www.gnupg.org> encryption with features for
    encrypting and decrypting email and news.

    See also this page <http://www.worldnet-news.com/software.htm> for
    more anonymous remailer clients including the no-longer-maintained
    Anonpost, Easynym etc...

------------------------------------------------------------------------

[Up: APAS Anonymous Remailer Use \[FAQ\]](./)\
[Next: APAS Anonymous Remailer Use \[FAQ 7/8\]: Nyms](./faq.7.html)\
[Previous: APAS Anonymous Remailer Use \[FAQ 5/8\]: Statistics](./faq.5.html)

------------------------------------------------------------------------

Computer Cryptology \<<turing@eskimo.com>\>\
Generated by [digest2html.pl](http://www-viz.tamu.edu/~sgi-faq/tools/), 2001-12-02
