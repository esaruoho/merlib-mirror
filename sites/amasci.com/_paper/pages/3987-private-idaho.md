---
title: "Private Idaho"
source_domain: amasci.com
source_path: ~joelm/pi.html
order: 3987
reachable_from_entry: false
images: 2
internal_links: 1
extracted: 2026-08-07T17:10:43Z
extractor: site_to_paper.py (pandoc)
---

# Private Idaho

*Source page: `~joelm/pi.html`*

<img src="pi.gif" width="156" height="28" alt="Private Idaho" />

------------------------------------------------------------------------

\
 

<table width="85%">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td>If you already know what it is, and have a copy, thanks for your support. If you've just stumbled on this page, read the "<a href="pi.html#WHAT%20IS">What is it</a>?" section below. There's also a lot more privacy related information at this site's <a href="http://www.eskimo.com/~joelm/index.html">main page</a>. Version <a href="#dl">2.8b3</a> is now available for downloading (1/9/97). This will be my last official release of Private Idaho (see <a href="#Future">The Future of Private Idaho</a>). 
<p>Since I did release the source code, there are a number of independent efforts going on to create enhanced versions of Private Idaho. Here's some of them:</p>
<ul>
<li><a href="mailto:ian@lynagh.demon.co.uk">Ian Lynagh</a> has added a variety of features I thought about, but never got around to. Check out PIt (the latest version, as of March 4, 1998 is <a href="http://home.sn.no/~balchen/igloo/pidaho/">PI3.52t</a>).</li>
<li>Based on the distributed source code, C.A.T.S. International has a <a href="http://wkweb4.cableinet.co.uk/hmartin/pidaho.html">32-bit version of Private Idaho now available</a>. Entirely new interface with a button bar and other cool features.  Henry Martin is working on PGP 5.0 support.</li>
<li>Alex Cameron has a 32-bit version that's available <a href="http://www.itech.net.au/pi/">here</a>.</li>
</ul>
Remember, the above releases come from the publicly available source code. I'm not affiliated with any of the third party releases. I'm involved with a number of projects these days, and unfortunately don't have the chance to answer very much e-mail.
<hr />
<p>Although it may look the same, version 2.8 has a lot of new features. Including:</p>
<ul>
<li><strong>Auto encrypt/decrypt of configuration files</strong> - If started with the command line PIDAHO.EXE C:\WINDOWS\PIDAHO.INI (or whatever the path of the INI file), PI will PGP decrypt the following files on startup, and decrypt them on exit: PIDAHO.INI, NYMS.TXT, ADDRESS.TXT, and PUBKEYS.OUT. Recommended for high security requirements.</li>
<li><strong>Support for auto-encrypt/decrypt of PGP's secring and pubring files</strong> - Conventionally encrypts the key rings on exit, and decrypts them when PI first runs. This prevents someone from examing your secret key ring to view your nym keys, or your public ring to see who you correspond with.</li>
<li><strong>Update remailer info command</strong> - When connected to the Net, this command downloads the REMAILER.HTM file (a copy of Raph's Web page) and updates current remailer info. This eliminates the RMINO and CPMAILER files and the need to manually update them. If Mixmaster type remailers are selected in the Remailers menu, information is updated about them from Raph's MM page.</li>
<li><strong>Get remailer keys command</strong> - Connects to the remail key page and downloads the contents to the message box. Keys can be added with the Add key from message command.</li>
<li><strong>Submit key to server command</strong> - Submits the public key in the message box to the MIT server via an e-mail message.</li>
<li><strong>Get key from server command</strong> - Attempts to retreive a public key from the MIT server based on the user ID in the To: box.</li>
<li><strong>Generate key pair command</strong> - Support for creating PGP key pairs is now available.</li>
<li><strong>Load passphrase at startup</strong> (in PGP Options) - Prompts for passphrase at start. Keeps in memory so you never need to enter in the DOS box during encrypt and decrypt operations.</li>
<li><strong>Remailer newsgroup header command</strong> - Adds a "Newsgroups" header in the message body to support news gateways such as mail2news@anon.lcs.mit.edu.</li>
<li><strong>nym.alias.net support</strong> - The nym.alias.net nym servers (newnym type) are now supported. An "Edit existing alias.net nym" command has been added once a nym has been created. Creation of this type of nyms works is identical in interface to the alpha nyms. Note: Advanced features such as multiple and probability-based reply blocks are currently not implemented.</li>
<li><strong>Delete nym command</strong> - This command deletes a nym from the NYMS.TXT file and optionally sends a delete message to the nym server.</li>
<li><strong>Attachment support</strong> - Users can now attach files to mail messages. These are encoded as Base 64 MIME compliant. Attachments may be encrypted or not. Note: Remailers and newsgroup postings do not support attachments.</li>
<li><strong>Keys menu added</strong> - A new menu called Keys now supports key related commands.</li>
<li><strong>Update PUBKEYS.OUT command</strong> - Renamed from update public key to be more accurate in meaning.</li>
<li><strong>Support for private remailers</strong> - Remailers that are in operation but are no longer displayed in Raph's pinging list may be listed in a text file named PRIVATE.TXT in the PI directory. Each line should contain only the remailer address. These remailers will be appended to remailers shown in Raph's list.</li>
<li><strong>X-headers command</strong> - Allows user defined headers to be inserted in a mail message.</li>
<li><strong>Append on send command</strong> - When checked, automatically appends remailer info (including encrypting to remailers if selected) to the message before sending. Eliminates the need to manually use the Append info command.</li>
<li><strong>Transfer options command</strong> - To transfer a message to an application, only scripting is supported now. The tabbed, message headers have been eliminated.</li>
<li><strong>Add system info command</strong> - When you use the "Send feedback" command in the Help menu to report a problem, check this menu item first. It adds system and configuration information to the message to help me resolve problems.</li>
<li><strong>ViaCrypt support removed</strong> - Due to compatibility problems in getting PI to work with the 4.0 version of ViaCrypt, and a small user base, support has been removed. ViaCrypt users should simply put a copy of the DOS version of PGP in their PGP directory to continue to use PI.</li>
<li><strong>Windows online help removed</strong> - PIDAHO.HLP is no longer shipped. Users are encouraged to go to: http://www.eskimo.com/~joelm/pihelp.html and use a browser to access the help file. The file can be printed or saved locally if the user wants a copy on their hard drive for reference. The HTML file is distributed with Private Idaho.</li>
<li><strong>Anon.penet.fi support removed</strong> - As of September 1996, Anon.penet.fi is no longer operation. Because of this, support has been removed from PI.</li>
<li><strong>Font changes</strong> - Ugly FixedSys font has been replaced by MS San Serif.</li>
<li><strong>Under the hood</strong> - The IPP20.VBX file is no longer required. The following controls enhance PI's Internet connectivity and performance and should be placed in the C:\WINDOWS\SYSTEM directory: HTTP20.VBX, NETC20.VBX, POP20.VBX, SMTP20.VBX</li>
</ul></td>
</tr>
</tbody>
</table>

------------------------------------------------------------------------

\
 

<table width="85%">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td><span id="WHAT IS"></span><strong>WHAT IS IT?</strong> Private Idaho is an Internet privacy utility for Windows. It simplifies using e-mail with PGP, anonymous remailers, and nym servers, providing you with more electronic privacy. Some of its features include: 
point and click ease of use 
works with popular commercial and Windows e-mail, Web browsers, news readers
supports PGP message/file encryption, decryption, and signing 
advanced PGP options such as multiple keys and encrypt to self 
PGP key management features 
directly send e-mail through SMTP 
directly receive PGP messages from POP3 mailboxes 
USENET posting from remailers 
support for nym servers
advanced remailer options such as encryption, chaining, latent time, and cutmarks 
supports Cypherpunk, Mixmaster, and Soda anonymous remailers
Private Idaho is currently being used all over the world, and seems to be one of the more popular PGP tools. Based on suggestions from many of its users, it is always improving.
<p>Private Idaho is free, with no shareware or registration fees. Its purpose is to encourage the wide spread use of strong cryptography and provide users with a greater level of on-line privacy.</p></td>
</tr>
</tbody>
</table>

------------------------------------------------------------------------

### <span id="dl"></span>Files for Downloading

<table width="85%">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td>Version <a href="ftp://ftp.eskimo.com/u/j/joelm/pi28b3.exe">2.8b3</a> was released on 1/9/97. It corrects some minor bugs, particularly dealing with changing nym server reply blocks. This is a self extracting .ZIP file. Create a directory, copy the PI28B3.EXE file, and run it. All of the files will be uncompressed. You can either manually update old files (if you already have a copy), or use PI-SETUP.EXE to install them for you. If you have 2.8b1 or 2.8b2, you can just download <a href="ftp://ftp.eskimo.com/u/j/joelm/pidaho.exe">pidaho.exe</a> and replace the old .EXE with it. 
<p>The previous version (<a href="ftp://ftp.eskimo.com/u/j/joelm/pi27b1.exe">2.7b1</a>) of Private Idaho was released on 7/24/96. </p>
<p>If you don't have the VBRUN300.DLL (which Private Idaho and its setup application require), get it <a href="ftp://ftp.eskimo.com/u/j/joelm/vbrun300.zip">here</a>.</p>
<p>Having problems downloading from eskimo.com? Try:</p>
<p><a href="ftp://ftp.rivertown.net/pub/win/privacy/">ftp://ftp.rivertown.net/pub/win/privacy/</a></p></td>
</tr>
</tbody>
</table>

------------------------------------------------------------------------

### Product Support

<table width="85%">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td>Private Idaho is unsupported freeware. I've tried to answer most technical support questions over the past two years, but unfortunately, due to a variety of circumstances, just don't have the time. If Private Idaho doesn't seem to work right, check the <a href="http://www.eskimo.com/~joelm/pihelp.html">Troubleshooting</a> section in the on-line documentation. 
<p>You can always post a question to the alt.security.pgp USENET newsgroup. In many cases, a Private Idaho user will answer your question.</p>
<p>Wil Ussery has put together some pretty good <a href="http://www.dnai.com/~wussery/pgp.html">FAQs</a> on how to use Private Idaho to post anonymously to USENET newsgroups and how to use it with nym servers. Thanks Wil! Much more expanded coverage than I've included in the documentation.</p>
<p>A <a href="http://www.geocities.com/CapitolHill/2358/pium12.zip">Private Idaho user's guide</a> in Microsoft Word format is also available as of 10/17/96. Thanks to Luca Venuti - lucven@compumaint.it.</p></td>
</tr>
</tbody>
</table>

------------------------------------------------------------------------

### Donations

<table width="85%">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td>Private Idaho is and always will be free. I'm a strong believer in electronic privacy, which on the Internet, is extremely fragile and potentially quite easy to abuse. That's why I wrote Private Idaho, and that's why it's free. 
<p>Even though Private Idaho isn't a commercial product, I sometimes get e-mail from people who like it so much they want to contribute to its further development. In the past, I've declined, but after giving it some thought, if you want to support the application, send a donation in the name of Private Idaho to the <a href="http://www.epic.org">Electronic Privacy Information Center</a> (EPIC). I personally feel this organization is doing some great things, standing up for a variety of rights that are critical to the continued growth and success of the Internet. Check out their Web page, whether it has to do with freedom of speech or cryptography, I think you'll agree. Also, since they're a non-profit organization, your donation is tax deductible. Reduce your taxes while supporting strong crypto and electronic privacy. What a deal...</p>
<hr />
<h3 id="the-future-of-private-idaho"><span id="Future"></span>The Future of Private Idaho</h3>
When I first released Private Idaho, almost two years ago, I had no idea it would evolve into what it is today. From all of the e-mail I get, it appears PI has helped make a degree of electronic privacy possible for people all over the world. I first logged on to the Net 15 years ago, and have benefited from it ever since. I'm happy to have been able to contribute something back.
<p>Unfortunately, different projects and other directions are reducing the amount of time I can devote to Private Idaho, and version 2.8b3 will be my last official release. I'd still like PI to continue to evolve though. So, in an effort to see this happen, I'm releasing the entire set of <a href="ftp://ftp.eskimo.com/u/j/joelm/pisource.zip">Visual Basic sources</a>. My hope is some talented, like-minded developer(s) can take PI beyond what it is today.</p>
<p>Before you download the sources, a small amount of fine print:</p>
<ul>
<li>First, there are no cryptographic algorithms within the Private Idaho source code (there never were, for export restriction reasons).</li>
<li>I'm now licensing the source code and program under the Free Software Foundation's <a href="http://www.gnu.org/copyleft/gpl.html">GNU General Public License</a>. A copy of the license is included with the sources and EXE. If you plan on modifying or redistributing Private Idaho, please pay attention to the terms of the "copyleft" license agreement.</li>
<li>The source code is unsupported. Because of time constraints, don't expect replies to programming questions.</li>
<li>Much of the Internet-related code (sending and receiving e-mail) is based on calls to the IP*Works set of VBXs, which I licensed from a company called <a href="http://www.devlink.com/devsoft/">devSoft</a>. When you build and run the Visual Basic sources, if you don't have a developer's license, a dialog box will appear when each of the VBXs is called for the first time. This is annoying, but doesn't impact PI's functionality. While the VBXs and OCXs are reasonably priced, they may be out of the price range for some developers. If you're interested in enhancing Private Idaho for public use, let me know. I'm willing to compile final release versions with my licensed VBXs and OCXs (for a 32-bit version).</li>
<li>The current code base is in Visual Basic 3.0 (but is easily compiled under VB 4.0 or 5.0). The reason I kept developing under VB 3.0, was I felt it produced more efficient 16-bit code than the later versions (which tend to produce bloated code oriented toward Win95). Why VB in the first place? Originally PI was designed to be an internal tool with limited distribution. And I wanted a quick and dirty, fast development environment. At one point I was going to port everything to C, but realized there was too much legacy code, and it was easier just to continue using VB for updates.</li>
<li>Finally, don't expect fully commented, perfectly structured, clean code, that can easily be localized. PI started out as a personal tool, and was progressively built on, piece by piece. There are many kludges and hacks. If I had any idea I was ever going to share the code with anyone, I would have used better programming practices. Oh well...</li>
</ul>
I'm willing to serve as a central contact point for people who want to carry on the Private Idaho tradition. If you're seriously interested in contributing to future releases of PI, send me e-mail. I'll put you in touch with other folks who have the same interests. I'm also willing to keep this site as the primary distribution point for future versions.<br />
 </td>
</tr>
</tbody>
</table>

###### [<img src="back.gif" data-border="0" width="46" height="19" alt="Back" />](http://www.eskimo.com/~joelm)

###### *last modified 3/04/98*
