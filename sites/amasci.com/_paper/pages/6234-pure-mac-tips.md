---
title: "Pure Mac: Tips"
source_domain: amasci.com
source_path: ~pristine/tips.html
order: 6234
reachable_from_entry: false
images: 1
internal_links: 6
extracted: 2026-08-07T17:13:26Z
extractor: site_to_paper.py (pandoc)
---

# Pure Mac: Tips

*Source page: `~pristine/tips.html`*

[<img src="images/puremacsm.gif" data-align="Right" data-border="0" width="88" height="20" alt="Pure Mac" />](index.html)\
\

# Tips

\

------------------------------------------------------------------------

**All You Really Need to Know**

\
**One:** Make sure you have the latest [Stuffit Expander](compen.html#stuffite). Make sure .hqx, .bin, .cpt., .sea and .sit files are all configured to launch Stuffit Expander as a helper app (you can also set up various other file types such as .zip, .gz etc.). See below for [directions](tips.html#setup) on setting this up with Netscape.\
**Two:** 95% of the time you just click on the link and the file will download and expand automatically.\
**Three:** If you click on the link and get a lot of weird text characters, click on the link again while holding down the option key or click on the link, hold down the mouse button and select "save as". Then drop the saved file on the Stuffit Expander icon.\
**Four:** If you get a MacBinary (.bin) or other type of file that is corrupted, click on the link again, hold down the mouse button, select "copy this link location", open up Fetch or Anarchie, paste the URL into your FTP application (Fetch, Anarchie, Netfinder etc.) and FTP the file. If it is not an FTP URL (ie. http://), try clicking on the link again but this time make sure nothing else is going on in the background and just leave your computer until the file downloads. Although MacBinary files are smaller, Binhex (.hqx) files are the most dependable way to download files with your web browser since it is encoded in text.\
**Five:** If a link does not work on any of these pages, it could be that the server is busy or down. So, try again later. If you are connecting to the server and you get the message "file not found", it most likely means the file has been moved or a new version has come out. Check the parent directory or the home page to see if what you want is there.

------------------------------------------------------------------------

**Compression and Encoding**

\
All the files you will download from this site (and most sites) are either compressed or encoded or both. Compression will make a file smaller. Encoding allows binary files to be sent as text over the internet or preserves the resource fork as do both Binhex and MacBinary. Note: MacBinary is not encoded in text format and therefore does not always download correctly with your web browser.\
\
Examples of compressed files include files with these extensions: .sit, .cpt, .zip, .gz., .Z,\
Examples of encoded files include files with these extensions: hqx., .bin, .uue\
\
Binhex (.hqx) and MacBinary (.bin) files are the common ways of encoding applications for the Macintosh. This is because they preserve the type and creator of a document. Without the type and creator your Mac won't know what to do with the file. UUencoding (.uue) does not preserve types and creators so never uuencode a Mac application.\
\
All you really need is [Stuffit Expander](compen.html#stuffite) to handle the vast majority of files you will want to download. [DropStuff](compen.html#dropstuff) will enable Stuffit Expander to handle even more types of files. Check the [Compression and Encoding](compen.html) page or the [extensions key](extkey.shtml) at this site for other programs that will handle a variety of file types.\
\
**Yossarian grins**: The problem with getting Stuffit Expander is that you need Stuffit Expander or another decoder to get it off the internet. So if you don't have Stuffit Expander, beg, borrow or steal it from a friend or your local Apple dealer. It's free, so just bring a disk and ask to copy it. If you do have Fetch or Anarchie you can ftp it. Fetch and Anarchie will automatically decode it. Also, Eudora will automatically decode .bin files, so get a friend to .bin Stuffit Expander and email it to you.

------------------------------------------------------------------------

**MIME Types**

MIME is the method internet servers use to tell it and your clients how to deal with a file. For example, .hqx files are really just text files, so if the server is not set up to recognize .hqx as something besides text you will just get a bunch of weird characters in your Netscape window. Many servers are not set up to recognize the MIME type for Binhex. Thus some URL's with a link to an .hqx file will kick in Stuffit Expander appropriately and other sites will just send a bunch of weird text to your screen.\
\
<span id="setup"></span>**Setting up MIME types in Netscape 2.x**\
**One:** Select General Preferences in the Options menu within Netscape\
**Two:** Select Helpers\
**Three:** Click on the New button\
**Four:** In the Mime type box type application\
**Five:** In the Mime subtype box type x-Binary (or the appropriate subtype as listed below), then click OK\
**Six:** In the extensions box type bin (or the appropriate extension as listed below)\
**Seven:** Click on the Launch Application button where it says Action\
**Eight:** Click on Browse and navigate until you find Stuffit Expander and click on it\
**Nine:** Follow the same steps above respectively for the following subtypes:\
\
Some of the following MIME types are really quite unnecessary, however, you'd be surprised at the silly MIME types some servers have set up. For example, the preferred Subtype for Binhex files is mac-binhex40 but you'll find all kinds of strange settings.\
Remember, if a file doesn't download but appears as odd text on your Netscape screen just do an option click on the link and save it to your disk, then drop the resulting file on Stuffit Expander or whatever application you think will open it.\
\

<table data-border="6" data-cellspacing="1" data-cellpadding="1">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr>
<th>MIME Subtype</th>
<th>Extension<br />
</th>
</tr>
</thead>
<tbody>
<tr>
<th>mac-binhex40</th>
<th>hqx<br />
</th>
</tr>
<tr>
<th>x-mac-binhex40</th>
<th>hqx<br />
</th>
</tr>
<tr>
<th>binhex</th>
<th>hqx<br />
</th>
</tr>
<tr>
<th>binhex4</th>
<th>hqx<br />
</th>
</tr>
<tr>
<th>x-binhex40</th>
<th>hqx<br />
</th>
</tr>
<tr>
<th>x-Binary</th>
<th>bin<br />
</th>
</tr>
<tr>
<th>x-macbinary</th>
<th>bin<br />
</th>
</tr>
<tr>
<th>mac-binary</th>
<th>bin<br />
</th>
</tr>
<tr>
<th>macbinary</th>
<th>bin<br />
</th>
</tr>
<tr>
<th>x-stuffit</th>
<th>sit<br />
</th>
</tr>
<tr>
<th>x-sit</th>
<th>sit<br />
</th>
</tr>
<tr>
<th>mac-compactpro</th>
<th>cpt<br />
</th>
</tr>
<tr>
<th>x-cpt</th>
<th>cpt<br />
</th>
</tr>
<tr>
<th>x-compactpro</th>
<th>cpt<br />
</th>
</tr>
<tr>
<th>x-sea</th>
<th>sea<br />
</th>
</tr>
&#10;</tbody>
</table>

\
**Setting up MIME types in Netscape 3.x**\
Setting up MIME types in Netscape 3.x is essentially the same with some minor differences in terms.\
**One:** Select General Preferences in the Options menu within Netscape\
**Two:** Select Helpers\
**Three:** Click on the New button\
**Four:** It doesn't really matter what you put in the Description box but if it's for Binhex files you might want to put Binhex etc.\
**Five:** Unlike Netscape 2.X, there is only one box for MIME Type. Put application/mime-subtype here as per the table above. For example application/mac-binhex40, application/x-Binary etc.\
**Six:** Netscape 3.X uses the term Suffixes instead of extensions. Use the same extension terms as used in 2.X (ie. bin, hqx, cpt, sit, sea)\
**Seven:** Check the circle for "Application" and navigate to the application you would like to use to decode/decompress the file. Most likely, Stuffit Expander.\
\
**Setting up MIME types in Netscape 4.x, Internet Explorer, Internet Config**\
Although you can't use the exact steps described above, the basic premises are the same for setting up Netscape 4.x, Internet Explorer and Internet Config. You'll generally need to put in a description (doesn't really matter what you put here), the MIME type and extensions (suffixes). Then select the application you'd like to use for the added MIME type. You can do it, really!\
\
\
This should cover you for just about any Mac program you are likely to encounter on the internet. Binhex (.hqx) files are the most dependable but you really shouldn't have too many problems with other types of files. Check the [Extensions Key](extkey.html) for various other Extensions and MIME types for a wide variety of files (audio, video, etc.).

------------------------------------------------------------------------

[**Back to the main page of Pure Mac**](index.html)
