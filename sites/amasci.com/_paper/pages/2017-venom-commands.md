---
title: "VeNoM [commands]"
source_domain: amasci.com
source_path: ~cmkinc/ven-cmd.htm
order: 2017
reachable_from_entry: false
images: 4
internal_links: 1
extracted: 2026-08-07T17:08:27Z
extractor: site_to_paper.py (pandoc)
---

# VeNoM [commands]

*Source page: `~cmkinc/ven-cmd.htm`*

<table data-border="0" data-cellpadding="5" data-cellspacing="0" width="100%">
<tbody>
<tr>
<td colspan="2" style="text-align: center;" data-bgcolor="#008000"><strong>V e N o M  I N T E R A C T I V E</strong></td>
</tr>
<tr>
<td style="text-align: center;" width="300" data-valign="MIDDLE"><img src="graphics/ven-cmd.gif" width="248" height="104" alt="VeNoM Commands" /></td>
<td style="text-align: center;" data-valign="MIDDLE">Running Eggdrop can be a daunting task for the novice. This page outlines some of <strong>VeNoM's</strong> more common commands and techniques.</td>
</tr>
</tbody>
</table>

\[ [**VeNoM** Home](venom.htm) \]

<img src="graphics/cactusbar.gif" data-border="0" width="419" height="22" />

> Rules of the Game\
> **VeNoM** is good, but it's far from perfect. The bot's overall functioning is a semi-controlled chaos of built-in eggdrop stuff, an assortment of tcl scripts found at places like EspReSso's Eggdrop Archive and <a href="http://www.xcalibre.com" target="_blank">XCalibre</a>, and literally dozens of hours of testing, tweaking, tuning, and customizing. As a result, **VeNoM** tends to exhibit behavior that reinforces the IRC philosophies of its creator *(me!)*, and the main one is **RESPECT!** The bot will do everything it can to protect and serve the ops it knows (including protection from renegade ops). Do not betray this sacred trust!
>
> Starting Out\
> After an administrator deems you worthy to access **VeNoM** and adds you to its user list, you'll probably want to set a password right away. It isn't *absolutely* necessary, but without a password you won't be able to get into all the nifty stuff through DCC chat or telnet connection. Besides, it doesn't take but a second; here's what to type:
>
> **`/msg VeNoM pass <password>`**
>
> The **\<password\>** in the above line is a *command argument*, in this case representing a word you make up and remember as your own personal password. Most of **VeNoM's** commands require one or more arguments telling it who, what, and/or where to perform the action. Oh, and omit the **\<brackets\>** when keying in a command argument. That's pretty standard convention, on this page, in the on-line help files, and in other eggdrop documentation you might happen across.
>
> You're SO Controlling!\
> **VeNoM** *loves* to serve! There are 3 ways to send **VeNoM** commands to make it do exactly what you want:
>
> 1.  **DCC Chat** - Commands issued "inside" the bot, after a DCC (or telnet) connection has been established. All bot functions are accessible. DCC commands are always preceded with a ***period (.)***
> 2.  **Private Message** - Commands issued in private query with the bot. Primarily op-related functions are accessible. Message commands are generally preceded with an ***exclamation point (!)***
> 3.  **Public Chat** - Commands issued directly from the channel. Op-related, channel, and some utility functions are accessible. Public commands are generally preceded with an ***exclamation point (!)***
>
> Users, Flags, and Getting Help\
> The concept of flags takes some getting used to, especially if you're comfortable with scripts, script-bots, or channel services that assign a numerical access level to users. To start to get a feel for flags, DCC chat with **VeNoM**, enter your password when asked, then type this command in the DCC window:
>
> **`.whois <your nick>`**
>
> An example of what you see might look something like this:
>
>
>               HANDLE    PASS NOTES FLAGS                     LAST
>               Bouncer   yes      0 xp                        20:32
>                 #CyberCafe         o                         20:32
>                 HOSTS: *!mel@*.aug.com
>
> Let's examine each element of this user record, paying particular attention to those cryptic letters in the **FLAGS** column:
>
> **HANDLE** - This is the name that **VeNoM** knows you by. Usually it's the same as your IRC nickname, but not necessarily so. Your bot handle and IRC nickname are independent of one another, and you need not have them match for **VeNoM** to recognize and obey you.
>
> **PASS** - Shows whether or not you've set a password.
>
> **NOTES** - Shows how many notes you have stored *(see **.notes** in the [command table](#cmdtbl))*.
>
> **FLAGS** - These determine overall access to **VeNoM**, and what channel functions you can use on which channels. Confused yet? Bear with me. The first set of flags (on the same line as the handle) are *global flags* and apply anywhere. In the above example, **"x"** denotes access to **VeNoM's** file transfer area and **"p"** allows a user to chat on the 'party line' inside the bot. On the next line we see an **"o"** flag for **\#CyberCafe**, which means that this person is a recognized chanop for that channel. A global **"o"** flag, on the other hand, would recognize the user as an op on any channel the bot sits.\
> ***Following is a complete rundown of available user flags:***
>
> *\*
>
> <div align="center">
>
> <div align="center">
>
> |  |  |  |  |  |
> |:--:|:--:|:--:|:--:|:--:|
> | **Flag** | **Meaning** | **Glob** | **Chan** | **Bot** |
> | **o** | ***op*** (bot will give this user chanop) | **X** | **X** |   |
> | **m** | ***master*** (user is a bot or channel master) | **X** | **X** |   |
> | **n** | ***owner*** (user is a bot or channel owner) | **X** | **X** |   |
> | **B** | ***botnet master*** (user is a botnet master) | **X** |   |   |
> | **x** | ***xfer*** (user has file-area access) | **X** |   |   |
> | **p** | ***party-line*** (user has party-line access) | **X** |   |   |
> | **j** | ***janitor*** (user is a file-area master) | **X** |   |   |
> | **f** | ***friend*** (user is not punished for doing bad things) |   | **X** |   |
> | **k** | ***kick*** (user is auto-kicked) |   | **X** |   |
> | **d** | ***deop*** (bot will not allow this user to become a chanop) |   | **X** |   |
> | **b** | ***bot*** (user is another bot) |   |   | **X** |
> | **h** | ***hub*** (bot is auto-linked at highest priority) |   |   | **X** |
> | **a** | ***alternate*** (bot is auto-linked if no hub bots can be linked) |   |   | **X** |
> | **l** | ***leaf*** (bot is not allowed to link in other bots) |   |   | **X** |
> | **r** | ***reject*** (bot is not allowed on the net) |   |   | **X** |
>
> </div>
>
> \
>
> </div>
>
> **LAST** - Shows the last time **VeNoM** saw you, overall and by channel *(see **!seen** in the [command table](#cmdtbl))*.
>
> **HOSTS** - Hostmask(s) **VeNoM** uses to authenticate your identity. You may have as many as you need to allow for different accounts, etc.
>
> The Console\
> **VeNoM's** console is your "window to IRC." You can fine-tune console settings to filter exactly what messages you want to see in the bot, and set the channel you want **VeNoM** to perform channel-specific commands on. Like user records, the console also uses a system of flags to determine the level of message detail you'll see.\
> ***Following is a complete listing of available console flags:***
>
> <div align="center">
>
> |          |                                                                |
> |:--------:|:--------------------------------------------------------------:|
> | **Flag** |                          **Meaning**                           |
> |  **m**   |             display private msgs/ctcps to the bot              |
> |  **p**   |          display public talk and ctcps on the channel          |
> |  **k**   |         display kicks/bans/mode changes on the channel         |
> |  **j**   |    display joins/parts/nick changes/signoffs on the channel    |
> |  **b**   |           display bot links/unlinks/userfile-sharing           |
> |  **s**   |        display server messages and connects/disconnects        |
> |  **w**   |             display msgs between IRCops (wallops)              |
> |  **1**   |                display clone-detector messages                 |
> |  **c**   |      display user commands (dcc and msg, *masters only*)       |
> |  **o**   |           display other bot notices (*masters only*)           |
> |  **x**   | display file transfers and file-area commands (*masters only*) |
>
> </div>
>
> To see your current console setting, simply type:
>
> **`.console`**
>
> A typical console display might look something like this:
>
> **            Your console is \#cybercafe: mcb1 (msgs, cmds, bots, level 1)**
>
> What that line tells me is that **\#cybercafe** is my current console channel, and that the only messages I'll see in the bot are /msgs to the bot, commands that other people use, any bot links or unlinks, and clone-detector activity. The full syntax of the **.console** command is:
>
> **`.console [channel] [+/- flags]`**
>
> The command arguments above are shown in **\[square brackets\]** because they are not required. You can change as much or as little of the console as you wish, and you can do it all in one command. The "+" and "-" simply toggle flags on or off. For instance, suppose I'd like to change to a setting that lets me see what's going on in a different channel, including all public chat, joins, kicks -- I want it ALL! I want to SNOOP! Okay, let's try this:
>
> **`.console #25+flirtz +pjk-cb`**
>
> Finally, if you find a particular console setting that you prefer, type **.store** in the DCC window. This saves the current console setting as your personal default whenever you log in to **VeNoM**.
>
> <img src="graphics/cactusbar.gif" data-border="0" width="419" height="22" />

<span id="cmdtbl"></span>

**VeNoM's** Command Table\

<div align="center">

<table width="775" data-border="3" data-cellpadding="3" data-cellspacing="0">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<tbody>
<tr>
<td class="clsCmdHead" width="122">Function</td>
<td class="clsCmdHead" width="48">Where?</td>
<td class="clsCmdHead" width="250">Format</td>
<td class="clsCmdHead" width="275">Remarks</td>
</tr>
<tr>
<td rowspan="8" class="clsCmdMain1" data-valign="middle" width="122">Opping/De-opping</td>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>Pub</strong></td>
<td class="clsCmdMain2" style="text-align: center;" width="250"><strong>!up</strong></td>
<td class="clsCmdMain2" width="275">Ops self <strong>if</strong> you are a known operator on the channel the command is issued from.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>Pub</strong></td>
<td class="clsCmdMain2" style="text-align: center;" width="250"><strong>!down</strong></td>
<td class="clsCmdMain2" width="275">De-ops self on the channel the command is issued from.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>Pub</strong></td>
<td class="clsCmdMain2" style="text-align: center;" width="250"><strong>!op &lt;nick&gt;</strong></td>
<td class="clsCmdMain2" width="275">Ops &lt;nick&gt; <strong>if</strong> you are a known operator on the channel the command is issued from.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>Pub</strong></td>
<td class="clsCmdMain2" style="text-align: center;" width="250"><strong>!deop &lt;nick&gt;</strong></td>
<td class="clsCmdMain2" width="275">De-ops &lt;nick&gt; <strong>if</strong> you are a known operator on the channel the command is issued from, <strong>and</strong> &lt;nick&gt; is not.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>DCC</strong></td>
<td class="clsCmdMain2" style="text-align: center;" width="250"><strong>.op &lt;nick&gt;</strong></td>
<td class="clsCmdMain2" width="275">Ops &lt;nick&gt; on your current console channel.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>DCC</strong></td>
<td class="clsCmdMain2" style="text-align: center;" width="250"><strong>.deop &lt;nick&gt;</strong></td>
<td class="clsCmdMain2" width="275">De-ops &lt;nick&gt; <strong>if</strong> &lt;nick&gt; is not a known operator on your current console channel.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>Pub</strong></td>
<td class="clsCmdMain2" style="text-align: center;" width="250"><strong>!voice &lt;nick&gt;</strong></td>
<td class="clsCmdMain2" width="275">Voices &lt;nick&gt; <strong>if</strong> you are a known operator on the channel the command is issued from.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>Pub</strong></td>
<td class="clsCmdMain2" style="text-align: center;" width="250"><strong>!devoice &lt;nick&gt;</strong></td>
<td class="clsCmdMain2" width="275">De-voices &lt;nick&gt; <strong>if</strong> you are a known operator on the channel the command is issued from.</td>
</tr>
<tr>
<td rowspan="7" class="clsCmdMain1" data-valign="middle" width="122">Kicking/Banning</td>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>Pub</strong><br />
or<br />
<strong>Msg</strong></td>
<td class="clsCmdMain2" style="text-align: center;" width="250"><strong>!k &lt;channel&gt; &lt;nick&gt;</strong> <em>&lt;reason&gt;</em></td>
<td class="clsCmdMain2" width="275">Kicks &lt;nick&gt; from &lt;channel&gt; <strong>if</strong> you are a known operator on &lt;channel&gt;. &lt;Reason&gt; is optional.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>Pub</strong><br />
or<br />
<strong>Msg</strong></td>
<td class="clsCmdMain2" style="text-align: center;" width="250"><strong>!bk &lt;channel&gt; &lt;nick&gt;</strong> <em>&lt;reason&gt;</em></td>
<td class="clsCmdMain2" width="275">Bans and kicks &lt;nick&gt; from &lt;channel&gt; <strong>if</strong> you are a known operator on &lt;channel&gt;. &lt;Reason&gt; is optional. Ban is temporary.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>Pub</strong><br />
or<br />
<strong>Msg</strong></td>
<td class="clsCmdMain2" style="text-align: center;" width="250"><strong>!s &lt;channel&gt; &lt;nick&gt;</strong> <em>&lt;reason&gt;</em></td>
<td class="clsCmdMain2" width="275">Shitlists &lt;nick&gt; from &lt;channel&gt; <strong>if</strong> you are a known operator on &lt;channel&gt;. &lt;Reason&gt; is optional. Ban is permanent.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>Pub</strong><br />
or<br />
<strong>Msg</strong></td>
<td class="clsCmdMain2" style="text-align: center;" width="250"><strong>!sh &lt;channel&gt; &lt;nick&gt;</strong> <em>&lt;reason&gt;</em></td>
<td class="clsCmdMain2" width="275">Shitlists &lt;nick&gt;'s <strong>entire domain</strong> from &lt;channel&gt; <strong>if</strong> you are a known operator on &lt;channel&gt;. &lt;Reason&gt; is optional. Ban is permanent.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>DCC</strong></td>
<td class="clsCmdMain2" style="text-align: center;" width="250"><strong>.bans</strong></td>
<td class="clsCmdMain2" width="275">Displays active bans on your current console channel. Use <strong>.bans all</strong> to list all bans. <strong>VeNoM</strong> uses a dynamic ban system and applies them only as needed.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>DCC</strong></td>
<td class="clsCmdMain2" style="text-align: center;" width="250"><strong>.+ban</strong> <em>&lt;channel&gt;</em> <strong>&lt;hostmask&gt;</strong> <em>&lt;reason&gt;</em></td>
<td class="clsCmdMain2" width="275">Adds &lt;hostmask&gt; to <strong>VeNoM's</strong> permanent ban list and immediately applies the ban. If &lt;channel&gt; is omitted, the ban applies to all channels. &lt;Reason&gt; is optional.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>DCC</strong></td>
<td class="clsCmdMain2" style="text-align: center;" width="250"><strong>.-ban</strong> <strong>&lt;hostmask&gt;</strong> OR <strong>&lt;number&gt;</strong></td>
<td class="clsCmdMain2" width="275">Removes &lt;hostmask&gt; OR &lt;number&gt; from <strong>VeNoM's</strong> permanent ban list and immediately removes the ban.</td>
</tr>
<tr>
<td rowspan="12" class="clsCmdMain1" style="text-align: center;" width="122">Tools and Toys</td>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>DCC</strong></td>
<td class="clsCmdMain2" style="text-align: center;" data-valign="middle" width="250"><strong>.note &lt;handle&gt;</strong></td>
<td class="clsCmdMain2" style="text-align: left;" width="275">Sends a note to &lt;handle&gt;. If they are on the bot when the note is sent, they receive it like a private message. If not, the note is stored for them to retrieve later. Remember, a person's bot &lt;handle&gt; is not necessarily the same as their IRC &lt;nick&gt;!</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>DCC</strong></td>
<td class="clsCmdMain2" style="text-align: center;" data-valign="middle" width="250"><strong>.notes read</strong></td>
<td class="clsCmdMain2" style="text-align: left;" width="275">Read any notes you have stored. <strong>VeNoM</strong> will let you know when you join the channel if you have any unread notes or not.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>DCC</strong></td>
<td class="clsCmdMain2" style="text-align: center;" data-valign="middle" width="250"><strong>.notes erase</strong></td>
<td class="clsCmdMain2" style="text-align: left;" width="275">Erase any notes after you've read them. Actually, you don't <em>have</em> to read them prior to erasing.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>DCC</strong></td>
<td class="clsCmdMain2" style="text-align: center;" data-valign="middle" width="250"><strong>.info &lt;phrase&gt;</strong> OR <strong>none</strong></td>
<td class="clsCmdMain2" style="text-align: left;" width="275">Set your "info line" and <strong>VeNoM</strong> will so greet you whenever you join a channel he's on. Set <strong>.info none</strong> to get rid of your info line.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>DCC</strong></td>
<td class="clsCmdMain2" style="text-align: center;" data-valign="middle" width="250"><strong>.email &lt;address&gt;</strong></td>
<td class="clsCmdMain2" style="text-align: left;" width="275">For informational purposes only. Setting your email will show it in your user record.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>Pub</strong><br />
or<br />
<strong>Msg</strong></td>
<td class="clsCmdMain2" style="text-align: center;" data-valign="middle" width="250"><strong>!seen &lt;nick&gt;</strong></td>
<td class="clsCmdMain2" style="text-align: left;" width="275">Reports how long it's been since <strong>VeNoM</strong> last saw &lt;nick&gt;, and where &lt;nick&gt; was at the time. &lt;Nick&gt; does not need to be a registered user to be known.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>DCC</strong></td>
<td class="clsCmdMain2" style="text-align: center;" data-valign="middle" width="250"><strong>.seen &lt;nick&gt;</strong></td>
<td class="clsCmdMain2" style="text-align: left;" width="275">Same as above.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>DCC</strong></td>
<td class="clsCmdMain2" style="text-align: center;" data-valign="middle" width="250"><strong>!ping me</strong> OR <strong>&lt;nick&gt;</strong></td>
<td class="clsCmdMain2" style="text-align: left;" width="275">Returns a standard ping reply for yourself or another &lt;nick&gt;.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>Pub</strong></td>
<td class="clsCmdMain2" style="text-align: center;" data-valign="middle" width="250"><strong>!joins</strong></td>
<td class="clsCmdMain2" style="text-align: left;" width="275">Reports a count how many times <strong>#cybercafe</strong> has been joined since a certain date, and if you're an op, how many times you have joined.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>DCC</strong></td>
<td class="clsCmdMain2" style="text-align: center;" data-valign="middle" width="250"><strong>.joins</strong></td>
<td class="clsCmdMain2" style="text-align: left;" width="275">Same as above.</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>Pub<br />
</strong>or<br />
<strong>Msg</strong></td>
<td class="clsCmdMain2" style="text-align: center;" data-valign="middle" width="250"><strong>!slots</strong></td>
<td class="clsCmdMain2" style="text-align: left;" width="275">Plugs a quarter into <strong>VeNoM's</strong> built-in slot machine and pulls the handle. Will you hit the jackpot?</td>
</tr>
<tr>
<td class="clsCmdMain2" style="text-align: center;" width="48"><strong>Pub</strong></td>
<td class="clsCmdMain2" style="text-align: center;" data-valign="middle" width="250"><strong>VeNoM &lt;question&gt;<br />
</strong>OR<br />
<strong>8ball &lt;question&gt;</strong></td>
<td class="clsCmdMain2" style="text-align: left;" width="275">Who says bots are dumb? Just ask <strong>VeNoM</strong> a question, ask anything!</td>
</tr>
</tbody>
</table>

</div>

> Eggdrop is the most advanced bot on IRC today. This list is not intended to be an all-inclusive command reference, but it does contain most of the everyday sorts of things an average user might want to use. Many of the things you see here do not necessarily work on other eggies you have access to, and some of the things other bots have may not be implemented on **VeNoM**. For example, I do not have an "XDCC" file service set up like the bot-armies you may have seen in warez or porn channels, nor do I employ (or endorse) war tools of any kind. **VeNoM's** main purpose is channel protection and chanop services.

<img src="graphics/cactusbar.gif" data-border="0" width="419" height="22" />

\[ [**VeNoM** Home](venom.htm) \]

<table data-border="0" data-cellpadding="5" data-cellspacing="0" width="100%">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td style="text-align: center;" width="100%" data-bgcolor="#008000"><strong>V e N o M   I N T E R A C T I V E</strong><br />
<strong>VeNoM INTERACTIVE</strong> is an independent producer of interactive, entertaining and useful Internet products and services. Stay tuned!</td>
</tr>
</tbody>
</table>
