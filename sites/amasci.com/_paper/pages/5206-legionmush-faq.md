---
title: "LegionMUSH FAQ"
source_domain: amasci.com
source_path: ~mohundro/mush/lsh/legionmush.faq.html
order: 5206
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T17:12:11Z
extractor: site_to_paper.py (pandoc)
---

# LegionMUSH FAQ

*Source page: `~mohundro/mush/lsh/legionmush.faq.html`*

<table data-border="0">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td data-valign="top" width="580"><h1 id="on-the-desk-of-ol-gardan-under-the-other-junk">On the desk of Ol Gardan (under the other junk)</h1>
<pre><code>
Date:    November 01 2993 3.34.pm
From:    Kith Geffen (kith@heckler.goatham1.grath.pla)
To:      Ol Gardan (kidkid@gardan.grath.pla)
Subject: Something I found...
&#10;Hey Ol,
    Was looking around on some old Terran ftp sites and found this 
gem.  Not sure what it all means, but the dates seem a little strange. 
It&#39;s amazing what one finds on the Internet these days.  
&#10;Oh, and my father says I can go visit you this next week!  Time to 
check out some more of those babes at your palace.  Maybe I&#39;ll bring some 
of those old comic books I told you about.  Well, gotta go.
&#10;Kith</code></pre>
<p><em>Note: LegionMUSH no longer exists. If you still read the Legion books post-Zero Hour, check out <a href="telnet://206.16.238.1:1800">Legion Outpost on DC Universe MUSH</a>. For those who don't, this is merely a bit of nostalgia.</em></p>
<h2 id="legionmush-frequently-asked-questions-faq">LegionMUSH Frequently Asked Questions (FAQ)</h2>
<h2 id="version-1.0-october-31-19932995.">Version 1.0, October 31, 1993/2995.</h2>
<hr />
Welcome! Here are a few of the questions that are commonly asked about LegionMUSH, and some answers as well. These answers are geared towards the Legion fan who perhaps is not that familiar with the concept of tinymudding; a future document will be aimed at experienced MUSHers who would like to give LegionMUSH a try.
<hr />
<h2 id="the-following-questions-are-addressed-in-this-faq">The following questions are addressed in this FAQ:</h2>
<ul>
<li>What's a MUSH?</li>
<li>What's the theme?</li>
<li>How can I find out more about the theme?</li>
<li>How do I connect?</li>
<li>Can I just look around?</li>
<li>What are the commands?</li>
<li>How do I get help?</li>
<li>How do I make a character?</li>
<li>What is a wizard?</li>
<li>Can I be a Legionnaire?</li>
<li>Can I be another 30th century character?</li>
<li>Can I make my own character?</li>
<li>Do I have to be a super-hero?</li>
<li>Can I be a villain?</li>
<li>How can I get involved?</li>
<li>What do IC and OOC mean?</li>
<li>What's a tinyplot?</li>
<li>What's a spoiler?</li>
<li>When are people usually on?</li>
<li>What are the stats for?</li>
<li>Can I try it out now?</li>
</ul>
<hr />
<h2 id="and-without-further-ado-heres-some-answers...">And, without further ado, here's some answers...</h2>
<hr />
Q: What's a MUSH?
<p>A: A MUSH is a multi-user online game, a variety of tinymud, which is a particular type of mud. The emphasis on MUSHes is roleplaying and building, over combat.</p>
<p>Q: What's the theme?</p>
<p>A: LegionMUSH is based on the _Legionnaires_ and _Legion_of_Super-Heroes_ comics. In particular, the MUSH focuses on the younger Legionnaires group and New Earth, although characters and situations from other aspects of the 30th Century DC Universe are often explored.</p>
<p>Q: How can I find out more about the theme?</p>
<p>A: The easiest way is to read the comics upon which we're based! Read _Legionnaires_ (which is only on issue #9 currently) first, as it has the most relevance to the MUSH. The _Legion_of_Super-Heroes_ comic, in both back issues and the current series, is recommended for anyone who is interested in further information on the 30th Century.</p>
<p>Q: How do I connect?</p>
<p>A: To connect to LegionMUSH, you'll need to be able to remotely connect to a specific port. The Unix 'telnet' command will usually do this; the command is typically 'telnet muds.okstate.edu 2996'; muds is the name of the machine LegionMUSH runs on, and 2996 is the port number. Programs called 'clients', such as tinyfugue or tinytalk, also can be used to connect and provide other features as well to make it easier to MUSH.</p>
<p>Q: Can I just look around?</p>
<p>A: Certainly! We have a character set up named Protean Tourist, who is the guest character. To play tourist, simply 'telnet muds.okstate.edu 2996' and, after you see the MUSH login banner, type 'connect guest guest'.</p>
<p>Q: What are the commands?</p>
<p>A: There are five main commands you need to know while exploring LegionMUSH for the first time:</p>
<ul>
<li>WHO - Typing this will show you who else is logged on</li>
<li>" - This command ("say") will let you speak to other players in your room. "</li>
<li>: - To perform an action to be seen by the other players in the room, use this command. :</li>
<li>page - You use this command to communicate with players who aren't in the same room. page =</li>
<li>look - To look at an object or room, use this command. look here, or look</li>
<li>To move around, type the name of the exit as it appears on the Obvious Exits list that you see when you look at, or enter, the room.</li>
</ul>
<p>Q: How do I get help?</p>
<p>A: The MUSH help files are accessable by typing 'help' at any time on the game, and then 'help ' or 'help ' to read specific info. Also, local commands written by other LegionMUSH players and wizards (see below) can be listed using the command '+help'. A manual for MUSH is available via anonymous ftp from caisr2.caisr.cwru.edu. You can also ask for help from one of the established players on the game.</p>
<p>Q: How do I make a character?</p>
<p>A: Anyone is free to make a normal character; a normal character is one who doesn't possess any special abilities beyond what a typical member of his or her race normally can do. To create a character, you must be at the login screen, which is what you see when you first connect. If you are using the guest character, type LOGOUT to return to this screen. Then type 'create ', the command to create a character. If you want a two-word name put "quotes" around your name, e.g. 'create "Cosmic Boy" password'. Don't forget your password, you'll need it to log on.</p>
<p>Q: What is a wizard?</p>
<p>A: A wizard is a fellow player on the MUSH who serves as a game admin- istrators. Some wizards code local commands, others run tinyplots (see below), some inspect building, and other administrative tasks to keep the game running. All are friendly and helpful, and can point you in the right direction if you need help. Type '+wizards' to list which ones are connected.</p>
<p>Q: Can I be a Legionnaire?</p>
<p>A: There are 20 Legionnaire characters; at the time of this writing, a few available. If you would like to apply for an open character, first log on as guest and check which ones are not being played. Then send email to morpheus@sandman.caltech.edu, and you will receive an application form. Complete it to apply for a Legion- naire.</p>
<p>Q: Can I be another 30th century character?</p>
<p>A: Yes indeed! While the game focusses on the Legionnaires' adv- entures on New Earth, any character from the 30th century may show up, sometimes when least expected. The procedure for app- lying for a LSHer, a Hero of Lallor, a Wanderer, or other feature character is the same as listed in the question above.</p>
<p>Q: Can I make my own character?</p>
<p>A: 'Non-feature' characters -- those characters who were created by clever players of the MUSH rather than by comic writers -- are more than welcome on the MUSH. You can have any super-powers and background you like, with one restriction: your character -must- fit the history, the theme, and the _feel_ of the Legion comics. To apply for a superpowered non-feature, send email to morpheus@sandman.caltech.edu, and you'll receive an application in which you can explain your concept. Superpowered characters on the MUSH must be cleared by the character wizard.</p>
<p>Q: Do I have to be a super-hero?</p>
<p>A: Not at all! While many of the 'stars' of the series have been superpowered, a number of non-super characters have played major roles as well. The same applies to LegionMUSH; we can always use Science Police Officers, Government Officials, Ice Cream Parlour Owners, Rich Businessmen, Scientists, Mild Mannered Reporters, and other "normal" (albeit futuristic) professions. An app- lication is not necessary, unless you are applying for a book character; if you're taking on a job of major importance, however, you should get wizard clearance first.</p>
<p>Q: Can I be a villain?</p>
<p>A: Villain characters are only run as part of a tinyplot; the nature of their role in the comics and on the MUSH makes them a poor choice for long-term play. So, basically, no.</p>
<p>Q: How can I get involved?</p>
<p>A: There are a number of ways to get involved in what goes on. If you play a feature character, hang out with your group. If you're a nonfeature, hook up with other nonfeatures; perhaps you could start your -own- 30th century team! The main thing is to be on and willing to have some fun; usually, you can find something to even if it's just talking about the latest issues (see 'spoilers' below).</p>
<p>Q: What do IC and OOC mean?</p>
<p>A: IC stands for In Character. If someone is 'acting IC', it means they are playing their role in the fictional universe of LegionMUSH. OOC means Out Of Character; if you're being OOC, then you are not, at the moment, playing your character's personality and role. Usually, it is considered proper to be IC in public areas, and to be OOC in pages. Information known OOC (such as the name of Rokk Krinn's father) shouldn't be used IC unless your character has a valid reason to know it (obviously, someone who has never even met Rokk Krinn would likely not have heard of his father).</p>
<p>Q: What's a tinyplot?</p>
<p>A: A tinyplot is a coordinated plotline run as an 'adventure' on the game. Anyone is free to run a plot, not just wizards, but it's a good idea to bounce your idea off an admin before doing it -- not only because the wizards like to keep tabs on things, but also because often they can help you with the coordination of it.</p>
<p>Q: What's a spoiler?</p>
<p>A: Spoilers are information given out that takes the fun out of reading a comic by giving away 'what happens'. This is sort of like telling someone "whodunnit" when they are only on the first chapter of a mystery novel. Spoilers are frowned upon severely on LegionMUSH, and should be restricted to private conversations or the channel. (Type +help chat for channel information.) Discussions of recent issues always need to heed these spoiler guidelines.</p>
<p>Q: When are people usually on?</p>
<p>A: This question commonly occurs when players log on, check the WHO list, find only a few people on, and log off again -- which makes it seem as if less people are playing than truly are! If you want to find someone to roleplay or chat with, the best idea is to hang out a while. Explore, maybe. If you really need to know when people are on, use the local command '+sys', coded by Brainiac 5.</p>
<p>Q: What are the stats for?</p>
<p>A: When you type +sheet, you get a list of character statistics. These stats are from the DC Heroes Roleplaying Game, published by Mayfair Games, and are used simply as an aid to measuring what your character can and can't do. For more details, type 'news system'.</p>
<p>Q: Can I try it out now?</p>
<p>A: Sure! We'll be waiting for you.</p>
<br />
<br />
&#10;<table style="width:100%;" data-border="0" data-cellpadding="0">
<colgroup>
<col style="width: 14%" />
<col style="width: 14%" />
<col style="width: 14%" />
<col style="width: 14%" />
<col style="width: 14%" />
<col style="width: 14%" />
<col style="width: 14%" />
</colgroup>
<tbody>
<tr>
<td width="60" height="32" data-bgcolor="#000099">ABODE</td>
<td width="5"> </td>
<td width="100" height="32" data-bgcolor="#cc6600"><a href="http://www.eskimo.com/~mohundro/who/index.html"><strong>WHO</strong></a></td>
<td width="180" height="32"><table data-align="left" data-border="0">
<tbody>
<tr>
<td data-bgcolor="#ff9900"> about steve, family, folks, writing</td>
</tr>
</tbody>
</table>
<br />
&#10;<table data-border="0" data-align="right">
<tbody>
<tr>
<td style="text-align: right;" data-bgcolor="#66cc99"> roleplaying, comic books</td>
</tr>
</tbody>
</table></td>
<td width="100" height="32" data-bgcolor="#ccffcc"><a href="http://www.eskimo.com/~mohundro/mush/index.html"><strong>PLAY</strong></a></td>
<td width="5"> </td>
<td width="100" height="32" data-bgcolor="#663300" data-border="1"><a href="http://www.eskimo.com/~mohundro/lsh/index.html"><strong>LLL!</strong><br />
legion of super-heroes</a></td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>
