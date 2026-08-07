---
title: "Index DOT Html: Common Authoring Questions"
source_domain: amasci.com
source_path: ~bloo/indexdot/misc/topics.htm
order: 1591
reachable_from_entry: false
images: 0
internal_links: 7
extracted: 2026-08-07T17:07:54Z
extractor: site_to_paper.py (pandoc)
---

# Index DOT Html: Common Authoring Questions

*Source page: `~bloo/indexdot/misc/topics.htm`*

<span class="pagetitle">Common Authoring Questions</span>\
= <span class="sitetitle">Index DOT Html</span> by Brian Wilson \[[indexdot@blooberry.com](email.htm)\] =
=========================================================================================================

|  |
|----|
| [Main Index](../html/index.html) \| [Element Index](../html/tagindex/a.htm) \| [Element Tree](../html/tree/htmltree.htm) \| [HTML Support History](../html/supportkey/a.htm) |

\
\

<table width="90%">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td style="text-align: left;"><hr />
If you frequent any forums on HTML, many of the following questions may seem VERY familiar. I see these questions asked more than any others, and I hope I can do my part to answer or address them all in one place (whether for better or worse.) If you know of any other FATDQ [Frequently Asked To Death Questions =)] of HTML, please <a href="email.htm">e-mail me</a> - I would be interested in trying to address them.
<dl>
<dt><strong><a href="../html/topics/starting.htm">How Do I Get Started Learning HTML?</a></strong></dt>
<dd>
When I first started to create this site, I decided to stay away from introductory topics in order to concentrate on the heart of HTML. I have had some readers rave about my site, and then subsequently confess that it was a bit too advanced for the level they were currently at. When these people ask me for sites that would be good starting points, I have been at somewhat of a loss - until now. Hopefully the sites reviewed here can serve as a gateway into the wonderful world of HTML. 'When yer done with these, y'all come back now!' =)
</dd>
<dt><strong><a href="../html/topics/indent.htm">How Do I Indent Using HTML?</a></strong></dt>
<dd>
This is one of the most frequently asked questions posed by many HTML authors. I will try to cover all possible methods that can (or <em>SHOULD</em>) be used and weigh the pros and cons for each method. Hopefully, you can draw your own conclusion about which method will work best for you.
</dd>
<dt><strong><a href="../html/topics/naturalsize.htm">What is the 'NATURALSIZEFLAG' attribute for the IMG element?</a></strong></dt>
<dd>
Due to a design decision by an HTML editor company, there are more than a few pages running around with this unexplained phantom attribute. What is it, where did it come from, and why isn't it part of the HTML specifications? [I knew part of the answer to this a while back, but a reader was kind enough to send me the clarification that he received directly from the company on the matter.]
</dd>
<dt><strong><a href="../html/topics/frameborders.htm">How can frame borders be controlled in <em>BOTH</em> Netscape and Internet Explorer?</a></strong></dt>
<dd>
When the basic HTML frame syntax was extended in Netscape and Internet Explorer to allow control over the appearance of the borders around frames, both browsers chose to use a slightly differing syntax from the other. Despite this inconsistency, it <em>IS</em> possible to get the same rendering behavior in both browsers if simple rules are followed.
</dd>
<dt><strong><a href="../html/topics/mailto.htm">How do I include the subject line in a 'mailto:' URL?</a></strong></dt>
<dd>
The original syntax for 'mailto:' URLs is clear that it is meant only for specifying email addresses. A new RFC proposes an updated format for the 'mailto:' URL syntax that has long had support in Netscape, but has only recently gained wider acceptance.
</dd>
<dt><strong><a href="../html/topics/hiding.htm">How do I hide the source of my HTML document from readers?</a></strong></dt>
<dd>
I have yet to understand the desire to do this, but I see this question asked all the time. Using just HTML this cannot be done, but people have sent me several suggestions on how this might be accomplished using other methods.
</dd>
<dt><strong><a href="../html/topics/windowopen.htm">How do I create a new window in Javascript?</a></strong></dt>
<dd>
I have seen this question quite a bit. I have tried to address this question, and I also include a little form to pick and choose the new window features you want. It creates the code for you or shows an example in use.
</dd>
<dt><strong><a href="../html/topics/selectwidth.htm">How can the width of a form SELECT field be controlled?</a></strong></dt>
<dd>
This is a brief one, but a good one. The answer is quite safe and works across a wide range of browsers.
</dd>
<dt><strong><a href="../html/topics/urlencoding.htm">What are those strange "%20" codes I see in URLs?</a></strong></dt>
<dd>
The types of characters legally allowed in URLs are very constrictive. Any characters that are not allowed need to be specially encoded using legal characters. Read all about URL character encoding here.
</dd>
<dt><strong><a href="../html/topics/uastring-navobj.htm">How to detect a browser's capabilities?</a></strong></dt>
<dd>
A dash of magic, a pinch of knowledge about User Agent string conventions... and a lot of Javascript.
</dd>
<dt><strong><a href="../html/topics/bodycssmapping.htm">How do HTML &lt;BODY&gt; attributes map to CSS properties?</a></strong></dt>
<dd>
Its a pretty easy one-to-one mapping...read more about it here.
</dd>
<dt><strong><a href="../html/topics/breakframe.htm">How do I break my pages out of frames?</a></strong></dt>
<dd>
If there is anything more unpopular than frames, it is being stuck inside them. Several simple methods are detailed. <span id="favicon"></span>
</dd>
<dt><strong>How can you create a custom icon for your site's bookmark in IE5+?</strong></dt>
<dd>
Rather than address this issue myself, there are a few pages that cover this particular question to such great depth that to try to re-hash it myself would be a waste of effort. For great coverage of this question, see <a href="http://msdn.microsoft.com/workshop/author/dhtml/howto/shortcuticon.asp">Microsoft's reference page</a>, <a href="http://www.favicon.com/">Favicon.com</a>, or the <a href="http://www.wdvl.com/Authoring/Design/Images/Favicon/index.html">WDVL's great page</a> on the topic. (BTW...this now works in Mozilla as of 0.9.7 - it should be in Netscape 6.x builds soon.)
</dd>
<dt><strong>How do I insert background music in my pages?</strong></dt>
<dd>
For best compatibility with the most browsers, this will probably serve best:<br />
&lt;<strong>embed</strong> <span class="tagattrib">SRC</span>="mysound.wav" <span class="tagattrib">HIDDEN</span>="True"&gt;&lt;<strong>bgsound</strong> <span class="tagattrib">SRC</span>="mysound.wav"&gt;&lt;/<strong>embed</strong>&gt;<br />
(other EMBED attributes which may be useful are: AUTOPLAY=[true/false] and LOOP=[true/false].)
</dd>
</dl>
<hr /></td>
</tr>
</tbody>
</table>

\
[Boring Copyright Stuff...](copyright.htm)\
