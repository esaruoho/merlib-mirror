---
title: "ircle Miscellany"
source_domain: amasci.com
source_path: ~pristine/irclem.html
order: 6182
reachable_from_entry: false
images: 2
internal_links: 6
extracted: 2026-08-07T17:13:19Z
extractor: site_to_paper.py (pandoc)
---

# ircle Miscellany

*Source page: `~pristine/irclem.html`*

# ircle Miscellany

[<img src="http://www.mactimes.com/cgibin/mtn/adcafe_gif.cgi?site=puremac" height="60" />](http://www.mactimes.com/cgibin/mtn/adcafe_click.cgi?site=puremac)

**A Hodgepodge of Partial Answers to Common ircle Questions**

------------------------------------------------------------------------

**Ok, before we go any further, all these answers apply to the latest ircle only.**\
Get it from the [ircle home page](http://www.xs4all.nl/~ircle/) or click on this link to download [ircle 3.0b10](ftp://alf8.speech.cs.cmu.edu/pub/mac/ircle/ircle3.0b.sit.hqx) (1175 Kb - January 7, 1998 release).\
Well, they might apply to earlier betas and even ircle 2.5 but don't count on it.\
After you download a new release of ircle, always go to your preferences folder and trash your old ircle preferences.\
**Don't forget to check out [Pure Mac](http://www.eskimo.com/~pristine/) for all your internet apps.**\

------------------------------------------------------------------------

\
<img src="images/ircle.gif" data-align="Left" width="32" height="32" alt="Icon" />

<table data-border="12" data-cellspacing="10" data-cellpadding="8">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr>
<th><a href="#colors">Colors</a><br />
</th>
<th><a href="#dcc">DCC</a><br />
</th>
<th><a href="#faces">Faces</a><br />
</th>
<th><a href="#popups">Popups</a><br />
</th>
</tr>
</thead>
<tbody>
<tr>
<th><a href="#scripts">Scripts</a><br />
</th>
<th><a href="#sounds">Sounds</a><br />
</th>
<th><a href="#video">Video</a><br />
</th>
<th><a href="#netscape">The Web</a><br />
</th>
</tr>
&#10;</tbody>
</table>

\
**What this Page Isn't:** - It's not a manual on how to use ircle. ircle does have an online help file. Start up ircle and look under the apple menu. See the item that says help. It may not be complete, but it has more than enough info to get you started.\
\

------------------------------------------------------------------------

<span id="colors"></span>\

**Colors**

\
\
As annoying as it is, you can send and receive colored text in ircle.\
\
To send colored text you need to type the following key combinations before you type your text:\
^c 1 and text - types black text (that's the control key, the c key and the 1 key)\
^c 2 and text - types red text\
^c 3 and text - types orange text\
^c 4 and text - types yellow text\
^c 5 and text - types light green text\
^c 6 and text - types green text\
^c 7 and text - types bluish green text\
^c 8 and text - types light blue text\
^c 9 and text - types blue text\
^c 0 and text - types white text\
^c = and text - types dark pink text\
^c ; and text - types purple text\

------------------------------------------------------------------------

<span id="dcc"></span>\

**DCC**

\
DCC is a direct client to client connection. Once you have a DCC connection established you are no longer in need of the server. This comes in quite handy when you are experiencing lag. Wnen lag is at intolerable levels and you are in the middle of a hot discussion with someone, just open a DCC chat connection with the other person. Poof, no more lag. DCC is also used to transfer files from one person to another. This is quite convenient since it does not require the server and therefore absolves them from any responsibility.\
\
**To start a DCC Chat connection, do the following:**\
**1.** Enter a channel with the person you would like to DCC Chat with. You may already be on the same channel.\
**2.** Open your Windows menu and select both Users and DCC Status.\
**3.** Select the person you would like to chat with in the Userlist window.\
**4.** Click the Chat button. This will send a DCC Chat request to the person you wish to Chat to.\
**5.** If that person accepts your request, a window will appear. Chat away lag free.\
**6.** Alternatively, you can type **/dcc chat nick** This is actually easier in most cases and does not require you to be on the same channel as the person you wish to dcc chat with to start the connection.\
**7.** You can leave the channel you were on and even disconnect from the server or servers you were on and still maintain this connection.\
**8.** To accept DCC chat requests in ircle, you basically just need to do the steps listed above. (ie. select that person in the User list window and click Chat, or do the much easier **/dcc chat nick** command.\
**9.** You can also set your preferences to automatically accept DCC Chat requests. Open up your ircle preferences, click on the DCC tab and check Auto accept DCC Chat.\
\
**To send and receive files through DCC, do the following:**\
**1.** Enter a channel with the person you would like to send a file to. You may already be on the same channel.\
**2.** Open your Windows menu and select both Users and DCC Status.\
**3.** Select the person you would like to send the file to in the Userlist window.\
**4.** Click the Send button.\
**5.** You will be presented with a dialog box. Depending on the type of file you are sending, select either Text, Binary or Macbinary. Text files would include text files obviously and not so obviously Binhexed (.hqx) files. Binary would be a good choice for gifs and jpegs (if you want to save the type and creator and you are sending to another Mac user, select Macbinary). Macbinary would be the best choice for applications including Stuffed (.sit) but not binhexed files. Don't ever send a file in MacBinary mode to any client which is not a Mac client.\
**6.** Navigate through the dialog box to the file you wish to send and click the Send button.\
**7.** If that person accepts your request, your file will be sent. You can watch it's progress in the DCC Status window.\
**8.** Alternatively, you can type **/dcc send nick** This is actually easier in many cases and does not require you to be on the same channel as the person you wish to send a file to. You will also have to do steps 5 and 6.\
**9.** To accept a file you select the name of the person in the Userlist window and click on Get in the DCC Status window.\
**10.** Alternatively you can also type the command **/dcc get nick** to receive the file.\
**9.** You can also set your preferences to automatically accept DCC Send requests. Open up your ircle preferences, click on the DCC tab and check Auto DCC GET. It is also a good idea to check Auto save to and select the folder you would like your DCC downloads saved to. That way you know where they are:-)\
\
**XDCC**\
\
XDCC is a way to keep files available for your irc friends and others to download without having to send them yourself. You don't even need to be near your Mac.\
\
**1.** This is pretty simple. Open up your ircle preferences (ie. choose Preferences in the File menu). Click on the DCC tab.\
**2.** Check Enable XDCC/FServe. Click Select and select the folder you want to use to make files available through XDCC. The FServe folder that comes with ircle is a good choice.\
**3.** Put any files you want to make available in the folder you selected.\
**4.** Anyone who wants to see what files you have available can type **/xdcc yournick list** This will give them a listing of your file with a number before each file.\
**5.** If they want to retrieve one of those files, they need to type **/xdcc yournick send \#** where \# is the number of the file they want.\
**6.** Other commands for XDCC include **/xdcc nick** to show a users XDCC commands and **/xdcc nick version** to see what version of XDCC they are using. ircle uses 1.0\
\
**FServe**\
\
FServe is essentially the same thing as XDCC but works somewhat differently.\
\
**1.** Open up your ircle preferences (ie. choose Preferences in the File menu). Click on the DCC tab.\
**2.** Check Enable XDCC/FServe. Click Select and select the folder you want to use to make files available through XDCC. The FServe folder that comes with ircle is a good choice.\
**3.** Put any files you want to make available in the folder you selected. Same as XDCC so far.\
**4.** You need a script to use FServe. The latest ircle 3.0b8 comes with an fserver script that now works.\
**5.** The fserver script needs to be in the Scripts folder that came with ircle.\
**6.** The FServer settings file is a text file that goes with the fserver script. It will look familiar to anyone who uses Unix scripts. Any line following a \# symbol is inconsequential except to give directions or information. There are directions within the settings file on how to set up which commands you want to use and how to make your fserve folder available to users of your choosing.\
**7.** The creator of the FServe settings file is R\*ch. If you have BBEdit, you can just click on it to open and edit it. If you don't have BBEdit, the file will look like a plain file. You can drop it on SimpleText to edit it or get [BBEdit Lite](tools.html#bbedit).\
**8.** To use the fserver script you then need to load it. Start ircle and type **/load fserver**\
**9.** This will put up a dialog box asking you to select the settings file. Select the file called FServer settings we discussed above.\
**10.** To see what files you have available another user needs to type **!fserve yournick** to the channel you are both in. Or whatever command(s) you put in your FServer settings file to do this. Only users who you have specified in your FServer settings file can do this. If you did not modify the file that you downloaded above anyone who is on the same channel as you can do this.\
**11.** Alternatively someone can type **/msg yournick !fserve** if they do not wish to do this through the channel.\
**12.** This will open a DCC window with a listing of your files.\
**13.** For someone to obtain one of the files they just need to type **get filename** in the DCC window.\
\

------------------------------------------------------------------------

<span id="faces"></span>\

**Faces**

\
Faces are the genius (ok, I have pretty low standards of what I call genius) of Toby Smith, the author of Homer. They are now well incorporated into ircle. Faces are basically just icons that come up in your faces window when the corresponding nick is on the channel you are on.\
\
ircle comes with a faces file. It only has faces for Onno and Possible in it. You can add faces to this file yourself or get a faces file already full of faces. Some more complete faces files are already out there, scroll down the [ircle home page](http://www.xs4all.nl/~ircle/) for links to faces files you can download. For what it's worth, I use the [Faces file](ftp://ftp.eskimo.com/u/p/pristine/faces28.hqx) compiled by [Skatter](http://www.public.iastate.edu/~rimmer/) for the Undernet's \#macintosh channel.\
\
**Setting up Faces**\
\
**1.** After you get a faces file, put it in the folder called faces within your ircle folder.\
**2.** With ircle loaded and open, select preferences from the File menu.\
**3.** Click on the tab that says faces.\
**4.** Click the CTCP FACE EXIST and CTCP FACE GET boxes if you want others to be able to get your face if you have one.\
**5.** Click on Faces File...\
**6.** Navigate to your faces file which is most likely in the folder called faces in your ircle folder.\
**7.** Save your preferences from the file menu.\
**8.** After you join a channel, open the faces window by selecting it from the Windows menu in ircle. If any of the nicks on the channel you are chatting on have a face in your faces file that face will appear in the faces window. Any nicks which do not have a face will have an empty square in its place.\
\
**Adding Faces to your Faces File**\
\
**1.** Join a channel and open your faces window. Select Faces from the Windows Menu.\
**2.** You should see some faces or just blank squares for all the members on the channel.\
**3.** If someone has a face but you don't have it in your faces file, you can get it from them if they are using ircle. Don't be silly and try to get faces from people using ircii or mIRC for crissakes.\
**4.** Click on the nick of the person who's face you want in the faces window.\
**5.** Click on Get Face. This will automatically dcc you their face and install it in your faces file. That is if they have a face of course. You can alternatively type /dcc nick face get\
\
**Adding Your Own Face to Your Faces File**\
\
**1.** Make a picture that you want to use for your face. You can use Photoshop, Color It!, [BME](graph.html#bme), [GraphicConverter](graph.html#graphconv), or [NIH Image](graph.html#nih) to make your picture. Save it as a pict file. The faces are 32 X 32 images so you might want to scale any picts you ripped off from somewhere else to this size. BME and NIH Image will do this for free if you don't have Photoshop or Color It!. GraphicConverter does not do scaling but it will convert almost any graphic format to a pict. Also, ircle itself will now convert some file formats to pict. Just do the steps below and click on convert. Then do the steps again and select the resulting file from the conversion.\
**2.** With your faces window open in ircle, click on the Set Face button. You have to be connected to irc. Navigate to the pict you made. Your face will be installed in the faces file for the nick you are currently using.\
**3.** Now when anyone does a Face Get for your nick, ircle will automatically send your face to them. That is if you have CTCP FACE EXIST and FACE GET checked in your ircle preferences. See above "Setting Up Faces".\
**4.** Of course you can use this method to customize and add faces for other nicks to your faces file. Just get on irc and use the nick of the person who's face you want to customize (of course they can't be on the same irc net you are on at the time), and do steps 1 through 3 as listed above. The possibilities are endless.\
\

------------------------------------------------------------------------

<span id="popups"></span>\

**Popups**

\
Popups are not functional in the current version of ircle. A future version will have this feature. You are probably familiar with the popup menus in Netscape. When you click on a window and hold down the mouse button in Netscape, a menu appears wherever your cursor is pointing and gives you such options as Back, Open this Link, Save this Link as..., etc. A similar feature will eventually be incorporated into ircle but with useful irc options of course. So, don't worry about popups for now but await their appearance anxiously.

------------------------------------------------------------------------

<span id="scripts"></span>\

**Scripts**

\
This is just a quick and simple explaination on what scripts are and how to use them with ircle. It does not tell you how to make your own scripts. For more info on how to make your own scripts, check out [The AppleScript Language Guide](http://devworld.apple.com/dev/techsupport/insidemac/AppleScriptLang/AppleScriptLang-2.html). The [ircle home page](http://www.xs4all.nl/~ircle/) has some links to scripts you can download. ircle also comes with a few basic scripts.\
\
AppleScripts are used to add functionality to ircle. Instead of having to type some long string such as /kick \#macintosh bonehead you can just type /k bonehead. Much easier. Scripts can be much more complex than this as well. They can be used for any number of things from reading Netscape bookmarks and posting urls to channels to posting your entire 10th grade term paper on boogers with just the typing of a few characters.\
If you have a PPC, make sure you get the latest [ObjectSupportLib](appud.html#osl) or many scripts just may not work for you.\
There are basically two types of scripts, those you need to load and those you don't.\
\
Many of the scripts that come with ircle you don't need to load. Some examples of scripts that come with ircle of this type are j, k and m. To use them you just need to type / and the name of the script. For example: you can type /j macintosh to join \#macintosh. No need to type /join \#macintosh. A simple but very effective script.\
\
Other scripts you will need to load. You do this by typing /load script , where script is the name of the script you want to load. Likewise, to unload them you type /unload script. You can only load one of these scripts at a time. Many of these types of scripts come with documentation on how to use them. RTFM.\
\
Just make sure any scripts you want to use with ircle are in the Scripts folder within your ircle folder.\
\

------------------------------------------------------------------------

<span id="sounds"></span>\

**Sounds**

\
\
You can send commands to hear sounds with ircle. Note: I said, "send **commands** to hear sounds" not send sounds. Of course you can dcc someone a sound file but this can take months, even years. To hear a sound with ircle, the receiver of the command has to have ircle configured correctly to play the sound and must already have a sound file with the exact name of the command that was sent to her or him.\
\
**Setting Up ircle for Sounds**\
\
**1.** First you need some sounds. Download them from numerous places on the net. Most sounds on the net will be in formats such as au, aiff and wav.\
Here are just a few places to get sounds:\
[Snausages ircle Page](http://www2.pcix.com/~harris/ircle.html) Sounds are already in System 7 format\
[Dalmac's FTP Directory](ftp://ftp.netmug.org/pub/dalmac/) Sounds are already in System 7 format\
[Doc's Chat Sounds](http://www.nwlaser.com/wavs/) Sounds in wav format. You may want to convert them.\
There is no shortage of sounds on the net. Do a search for sounds. Try [**Lycos**](http://lycos.cs.cmu.edu), they have a search engine specifically for sounds.\
**2.** You may want to convert any sounds you have to System 7 sounds if they are not already in this format. You can use [SoundApp](graph.html#sndapp) for this. Start up SoundApp. Select convert in the menu and navigate to the sound file you want to convert. Save the sound as a System 7 sound.\
**3.** If you want your sounds to be compatible with mIRC users, name your sounds with the 8 - 3 wav format. (eg. if you have a sound named Wizard of Oz, rename it wizofoz.wav. Keep the wav extension on it even though it's really a System 7 sound).\
**4.** Put your sounds in the Sounds folder in your ircle folder.\
**5.** Start up ircle and select Preferences in the File menu.\
**6.** Click on the CTCP tab. Not the sound tab.\
**7.** Click the Enable CTCP sound box. Make sure Disable CTCP completely is not checked.\
**8.** Click on the Select Sounds Folder button.\
**9.** Navigate to your Sounds folder and click Select "Sounds"\
**10.** You can click the Select button next to Select wav Sound Player and choose SoundApp to play wavs if you don't want to convert wavs to System 7 sounds. Also, if you have QuickTime 2.5 the latest realease of ircle will play wav automatically. I prefer using System 7 sounds but to each her/his own.\
**11.** Click Ok.\
**12.** Select Save Preferences in the File menu.\
**13.** Now when anyone types the command **/ctcp yournick sound soundfile** (where soundfile is the name of a sound file of course) ircle will play that sound if the soundfile's name is exactly like one of the files in your sounds folder.\
**14.** Likewise you can type **/ctcp nick sound soundfile** to make someone else's ircle play the appropriate sound.\
**15.** Alternatively you can type **/sound nick soundfile**\

------------------------------------------------------------------------

<span id="video"></span>\

**Video**

\
\
You can now see your irc cronies in living color or in black and white through ircle. Of course you'll need a video camera for them to see you. QuickCam's work well and are dirt cheap. You don't need to have a camera to see others.\
\
**Setting Yourself Up to be Seen in ircle**\
\
**1.** Make sure your video software is loaded. (ie. make sure you have your video extensions installed)\
**2.** Load ircle and join an irc net.\
**3.** Type /video\
**4.** Your smiling face should appear in a window.\
**5.** There will also be some buttons under your picture. You can change the size of the screen using the percentage buttons. If you click the Video button, you can further refine your image. There are options for Compression format, Source, Image and which port your Source (ie. camera) is using.\
Here's some advice from Onno from his ircle beta changes page.\
**For best results with VIDEO STREAM:**\
If you have a screen with 256 colors or less: set the Compressor to Photo Jpeg, any quality (but 50 will do)\
If you have a screen with more than 256 colros: set the Compressor to Video, set Key Frames to some number, for instance 30. and set the quality to any value (but 50 will do most of the time)\
If you have a b&w Quickcam, make sure you set the popup menu with the Compressor settings to Grayscale.\
**6.** There is also a Sound button. If you click on it, you will be presented with options for a voice chat session such as Compression format, Sampling rate and Source (eg. your microphone). This does not work in the current version of ircle but you can play around with it and hear yourself talk. A future version will support this.\
\
**Seeing Someone Else With ircle**\
\
**1.** Make sure the person you are trying to see has set herself/himself up to be seen.\
**2.** Type /ctcp nick video stream. Ta da...that's it\
**3.** You can alternatively type /ctcp nick video get to get a still image\
\

------------------------------------------------------------------------

<span id="netscape"></span>\

**The Web**

\
\
You can use your browser to launch irc sessions. You need to set up Netscape appropriately to do so.\
\
**Setting Up ircle as a Helper App in Netscape 2.X**\
\
**1.** Launch Netscape.\
**2.** Select General Preferences from the Options Menu\
**3.** Click on the Helpers tab.\
**4.** Make sure you take any plug-ins that do irc out of your Netscape plug-ins folder such as ichat. Likewise, make sure there is not already a helper app set up for chat. If there is, delete it from the helpers app window that you just opened from step three.\
**5.** Click on the New button.\
**6.** For MIME Type put in application.\
**7.** For Subtype put x-chat\
**8.** Click ok.\
**9.** In the extensions box type chat,cha\
**10.** Click the browse button.\
**11.** Navigate to your ircl application and select it\
**12.** Click Launch Application next to action.\
**13.** Click Ok.\
**14.** You might want to do the above steps for the MIME subtype x-nschat with the extension nsc as well\
**15.** Of course you can basically do the same thing for Internet Explorer and other browsers.\
**16.** Just a little troubleshooting tip. If after clicking a chat url in Netscape and ircle is launched but it doesn't attempt to connect to the server, a file with the name of the chat file (eg. undermac.chat) will be saved to your disk with an ircle icon on it. Click on this file to make ircle connect. You can also keep it around for a quick shortcut to opening that server and channel.\
\
**Setting Up ircle as a Helper App in Netscape 3.X**\
\
Setting up MIME types in Netscape 3.X is essentially the same with some minor differences in terms.\
\
**1.** Launch Netscape.\
**2.** Select General Preferences from the Options Menu\
**3.** Click on the Helpers tab.\
**4.** Make sure you take any plug-ins that do irc out of your Netscape plug-ins folder such as ichat. Likewise, make sure there is not already a helper app set up for chat. If there is, delete it from the helpers app window that you just opened from step three.\
**5.** Click on the New button.\
**6.** For Definition it doesn't really matter what you put in but IRC will do.\
**7.** For MIME type put application/x-chat\
**8.** For suffixes put chat,cha\
**9.** Check the circle for "Application" and navigate to ircle.\
**13.** Click Ok.\
**14.** You might want to do the above steps for the MIME subtype x-nschat with the suffix nsc as well\
**15.** Of course you can basically do the same thing for Internet Explorer and other browsers.\
**16.** Just a little troubleshooting tip. If after clicking a chat url in Netscape and ircle is launched but it doesn't attempt to connect to the server, a file with the name of the chat file (eg. undermac.chat) will be saved to your disk with an ircle icon on it. Click on this file to make ircle connect. You can also keep it around for a quick shortcut to opening that server and channel.\
\
**Putting Chat Links on Your Web Page**\
\
You can add links to your favorite irc channel on your web page. You will need to do the following if your server is not set up for the MIME type chat, many aren't.\
\
On a Unix server you need to do this:\
**1.** Make a file named .htaccess\
**2.** Put this line in the file: **AddType application/x-chat chat**\
You need to type return also (you need a blank line after this line, so push return twice). Then save the file.\
**3.** Put this file in the same directory as your web page and chat file.\
\
On a Mac server using WebStar you need to do this.\
**1.** Open the WebStar Admin utilty\
**2.** choose Suffix Mapping from the Configure menu\
**3.** set action to binary\
**4.** set suffix to .chat\
**5.** set MIME type to application/x-chat\
\
For any type of server you need to do the following to add a chat link to your page.\
**1.** Make a file with the appropriate information to include server, port and channel. For example:\
SERVER phoenix.az.us.undernet.org\
PORT 6664\
CHANNEL macintosh\
**2.** Save this file with the extension chat at the end of it's name. For example:\
undermac.chat\
You can use a text editor on your Mac to make this file or use the text editor on your Unix account. Carriage returns are different in Unix and MacOS therfore you should use a text editor such as [BBEdit Lite](tools.html#bbedit) which can save your file as a Unix file. If you use SimpleText to make a .chat file on your Mac to use as a shortcut, it won't work correctly because of the differences in carriage returns.\
**3.** Put this file in your home page directory.\
**4.** Make a link to it on your home page. Use the standard a href="your-url here" format. (ie. the url for the following Chat link is http://www.eskimo.com/~pristine/undermac.chat).\
\
[\#macintosh on the Undernet](http://www.eskimo.com/~pristine/undermac.chat) Come chat with me (Pristine) or maybe even Onno\
Of course, as with everything on the internet these days, the server may be busy. If it is, just keep trying. You can also check the "Autoreconnect when connection closes" box in the Misc. section of ircle's preferences. This will continually try connecting to the server until you get in.\
\
**5.** If someone's browser is set up correctly, ircle (or even mIRC for PC users) will be automatically launched and logged into the appropriate server and channel.\

------------------------------------------------------------------------

\
