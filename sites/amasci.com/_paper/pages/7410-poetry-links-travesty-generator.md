---
title: "Poetry Links - Travesty Generator"
source_domain: amasci.com
source_path: ~rstarr/poormfa/explaintravesty.html
order: 7410
reachable_from_entry: false
images: 0
internal_links: 6
extracted: 2026-08-07T17:14:58Z
extractor: site_to_paper.py (pandoc)
---

# Poetry Links - Travesty Generator

*Source page: `~rstarr/poormfa/explaintravesty.html`*

[Home](index.html) \| [What's New](poemnew.html) \| [Anthologies and Link Sites](poemlink.html) \| [Poets](poempoet.html)\
[Journals](poemjrnl.html) \| [Movements and Criticism](poemmove.html) \| [Tools](poemtool.html) \| [Members](http://www.eskimo.com/~rstarr/poormfa/members/poemmemb.html)

<table data-noborder="" width="50%">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr data-align="center">
<td data-valign="BOTTOM"><pre><code>Tra{v,i,c,d,m}</code></pre></td>
<td data-valign="TOP">Travesty Generator</td>
</tr>
</tbody>
</table>

<table data-noborder="" width="70%" data-cellpadding="10">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td><p>Travesty creates a new text based on how often sequences of characters appear in the original text.</p>
<p>Suppose we're doing an order 3 travesty. Travesty analyzes the original text to find all the combinations of two characters (one less than the order) that appear in the text. It also constructs a table of all of the letters that follow those two-letter combinations and how often those letters follow the combination. Travesty then takes the first two letters of the original text, looks up that character sequence in the table, and randomly selects the next letter according to the frequencies in the entry. It adds the new letter to the beginning string of two characters and uses the second and third characters in that string as the new two-letter combination to look up. This process continues until Travesty produces the requested number of characters of output.</p>
<p>Thus, for an order 3 travesty, the result is a text in which all combinations of three characters appear at roughly the same frequency as all three-letter combinations in the original text. Notice that travesty uses all of the characters in the original text (letters, digits, dashes, etc.) and not just letters.</p>
<p>Travesty is often used to scramble a source text before using it in another process such as diastic reading.</p>
<p>The first version of Travesty was written by Hugh Kenner and Joseph P. O'Rourke and described in their article "A Travesty Generator for Micros" in the November 1984 issue of <em>Byte</em>.</p>
<p>For more information, see Charles O. Hartman, <em>The Virtual Muse: Experiments in Computer Poetry</em> (Hanover, NH: Wesleyan University Press, 1996), pp. 54-64. See also Hartman's "Monologues of Body and Soul" in <em>The Virtual Muse</em> for a poem incorporating Travesty-generated text. The poem also appears in his <em>Glass Enclosures</em> (Hanover, NH: Wesleyan University Press, 1995), pp. 55-68.</p>
<p>Use the back button or click <a href="travesty.html">here</a> to go to the Travesty Generator page.</p></td>
</tr>
<tr>
<td><p><em>Last updated 21 January 2002.</em></p></td>
</tr>
</tbody>
</table>
