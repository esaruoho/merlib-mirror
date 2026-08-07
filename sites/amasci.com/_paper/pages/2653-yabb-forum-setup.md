---
title: "YaBB:: Forum Setup"
source_domain: amasci.com
source_path: ~dfloyd3/YaBBHelp/adminfaq.html
order: 2653
reachable_from_entry: false
images: 4
internal_links: 1
extracted: 2026-08-07T05:56:09Z
extractor: site_to_paper.py (pandoc)
---

# YaBB:: Forum Setup

*Source page: `~dfloyd3/YaBBHelp/adminfaq.html`*

<table data-cellspacing="0" data-cellpadding="5" width="95%" data-border="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr data-valign="top">
<td width="18%"><a href="http://www.yabbforum.com"><img src="images/YaBB_logo.gif" data-border="0" width="148" height="80" alt="Visit YaBB!" /></a></td>
<td data-bgcolor="#eeeeee" width="82%"><table width="100%" data-bgcolor="#003399">
<tbody>
<tr>
<td data-bgcolor="#003399">  <strong>Administration:: FAQ</strong></td>
</tr>
</tbody>
</table></td>
</tr>
<tr data-valign="top">
<td width="18%"><p><a href="index.html">Home</a></p>
<p><a href="introduction.html">Introduction</a><br />
<br />
   <strong>Users</strong>     <br />
    <a href="registering.html">Registering</a><br />
    <a href="login.html">Logging In/Out</a><br />
    <a href="profile.html">Profile</a><br />
    <a href="posting.html">Posting</a><br />
    <a href="ims.html">IM (Instant Message)</a><br />
    <a href="faq.html">FAQ</a><br />
<br />
   <strong>Moderation</strong><br />
     <a href="modact.html">Moderator Actions</a><br />
<br />
   <strong>Administration</strong><br />
     <a href="admintro.html">Introduction</a> <strong></strong><br />
     <a href="memfunc.html">Member Functions</a><a href="page.html"><br />
</a>     <a href="forumfunc.html">Forum Functions</a><br />
     <a href="forumset.html">Forum Setup</a><br />
<strong> <img src="images/bluearrow.gif" width="4" height="8" />   FAQ</strong><br />
<br />
<img src="images/valid-html401.gif" data-border="0" width="88" height="31" alt="Valid HTML 4.01!" /><br />
<img src="images/valid-css.gif" data-border="0" width="88" height="31" alt="Valid CSS!" /></p></td>
<td width="82%"><div class="content">
<h4 id="faq">FAQ</h4>
<table data-cellpadding="5" data-border="0" width="605">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td data-valign="top" width="542"><a href="#1admin">Can There Be Only One Admin?</a><br />
<a href="#turnoff">How can I turn off some of those bloat-fish features?</a><br />
<a href="#news">Ok, people are telling me the news screws up in their browser!!!</a><br />
<a href="#css">Why are the colors funny in browsers that don't support CSS?<br />
</a></td>
<td data-valign="top" width="37"></td>
</tr>
</tbody>
</table>
<p><span id="1admin"><strong>Can There Be Only One Admin?</strong></span></p>
<p>Well, that depends on what you are referring to. Ok, so you mean, "Is there only one administrator?" Initially, when YaBB is first installed, there is only ONE account by default, the "admin" account. This account is the "main" admin. When you click on the link to modify a person's profile, you have, as an Administrator, the ability to choose what membergroup he/she is in at the bottom of the profile. One of the options is "YaBB Administrator". YES, this means you can make someone else an administrator! This does not remove your status as the administrator; it is rather just a nice feature where you can give your best buddies the same privileges as you have! We advise you to use GREAT caution when choosing other administrators, as they have access to ALL of the settings of your board. As the "original" or "main" admin, there is one option you have that nobody else (even other admins have). In the membergroup dropdown box, when modifying a profile, there should be a blank line option. This allows you to take the membergroup completely off anyone, including other people you set as an administrator! That's a handy feature.</p>
<p><span id="turnoff"><strong>How can I turn off some of those bloat-fish features?</strong></span></p>
<p>Many of the features/add-ons in YaBB can be turned off via the "Admin Center" or modified in Settings.pl.</p>
<p><span id="news"><strong>Ok, people are telling me the news screws up in their browser!!!</strong></span></p>
<p>You have the option of turning the NewsFader off in Settings.pl... some browsers don't like the java associated with this news ticker. If you do this and still wish to have news, you'll need to put the tag "&lt;yabb news&gt;" tag back into template.html. That tag will put static news on every page of the forum, and YaBBC is not allowed in your news in this case.</p>
<p><span id="css"><strong>Why are the colors funny in browsers that don't support CSS?</strong></span></p>
<p>Because they don't support CSS, the color settings in Settings.pl will control the colors in those browsers. Be sure that you set the colors in template.html equivalent to those in Settings.pl. There will still be a few quirks, but getting these settings to match your CSS tag in template.html will resolve many issues.<br />
</p>
</div>
<div class="footer">
<hr />
<a href="http://www.yabbforum.com">YaBB</a>: Copyright © 2001-2003. Sponsored by <a href="http://www.ximinc.com">XIMinc</a>. All Rights Reserved.
</div></td>
</tr>
</tbody>
</table>
