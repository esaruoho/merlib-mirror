---
title: "More about Text in HTML"
source_domain: amasci.com
source_path: ~bloo/indexdot/html/tagpages/text.htm
order: 1571
reachable_from_entry: false
images: 0
internal_links: 11
extracted: 2026-08-07T05:55:16Z
extractor: site_to_paper.py (pandoc)
---

# More about Text in HTML

*Source page: `~bloo/indexdot/html/tagpages/text.htm`*

<span class="pagetitle">Text in HTML...</span>\
= <span class="sitetitle">Index DOT Html</span> by [Brian Wilson](../../misc/email.htm) =
=========================================================================================

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td style="text-align: center;" data-valign="top"><a href="#iso8859">ISO 8859 Character Sets</a> | <a href="#encode">To Encode or Not To Encode?</a><br />
<a href="#procon">Entity Formats - Pros and Cons</a> | <a href="#unicode">Unicode</a> | <a href="#unichars">HTML 4.0 Entities</a></td>
</tr>
<tr>
<td style="text-align: center;" data-valign="top"><a href="#related">Related Sites</a></td>
</tr>
</tbody>
</table>

**[Main Index](../index.html) \| [Element Tree](../tree/htmltree.htm) \| [Element Index](../tagindex/a.htm) \| [HTML Support History](../supportkey/a.htm)**

------------------------------------------------------------------------

<span id="iso8859"></span>

**ISO 8859 character sets**  
ISO 8859 is a set of 10 different 256-character sets used to represent a large set of the alphabetic languages used in the West. It does not address Far East languages at all. These sets were designed by the standards group ECMA (European Computer Manufacturer's Association,) and are included in the Internet charset register for use with MIME identification. <span id="iso88591"></span>

<table data-cellpadding="2">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<th rowspan="4"><strong>The ISO-8859-1<br />
Character Set<br />
Positions</strong></th>
<td><hr /></td>
</tr>
<tr>
<td><a href="entities/charentity0-31.htm">000-031</a> | <a href="entities/charentity32-64.htm">032-064</a> | <a href="entities/charentity65-96.htm">065-096</a> | <a href="entities/charentity97-126.htm">097-126</a></td>
</tr>
<tr>
<td><a href="entities/charentity127-159.htm">127-159</a> | <a href="entities/charentity160-191.htm">160-191</a> | <a href="entities/charentity192-223.htm">192-223</a> | <a href="entities/charentity224-255.htm">224-255</a></td>
</tr>
<tr>
<td><hr /></td>
</tr>
</tbody>
</table>

\
<span id="languages"></span> <span class="text">Why is ISO 8859 important you might ask? The ISO 8859-1 (also called ISO-Latin) character set is the one used for HTTP (the transport protocol for web documents) and is also used in the creation of HTML documents. This character set contains all characters necessary to type all *major* West European languages and is also the preferred encoding on the Internet. The following languages are supported under the ISO 8859-1 character set:</span>

<span class="text">**Afrikaans**, **Basque**, **Catalan**, **Danish**, **Dutch**, **English**, **Faeroese**, **Finnish**, **French**, **Galician**, **German**, **Icelandic**, **Irish**, **Italian**, **Norwegian**, **Portuguese**, **Spanish**, **Swedish**</span>

<span id="encode"></span>

**ISO 8859-1 Characters - To Encode or Not To Encode?**  
<span class="text">It is acceptable to leave all ISO 8859-1 characters as unencoded character octets, but there can be no guarantee that all destination systems will understand all of the characters. In order to increase portability/viewability of the entire character set, the HTML language additionally offers alternative versions of all ISO 8859-1 characters using coded entity representations. A special syntax is used to represent these [Character Entities](c/charents.htm) using either a number reference or a shorthand mnemonicword.\
\
These 'safe' entities are created using characters from the US ASCII (ISO 646) character set. Interestingly enough, the first half of the ISO 8859-1 set (character positions 000-127) is identical to those used in the US ASCII set. In fact, ASCII is *always* the 0-127 character position subset used in *ALL* ISO-8859 character sets. If safe character entity references are created using a safe portion of the ISO 8859-1 set, which characters in the ISO 8859-1 set need to be encoded, and which format should be used?</span>

\
**Positions 000-031 and 127-159:**  
<span class="text">The characters in the first range are non-printing characters in the HTML context and are not of any real interest to the discussion of HTML. The second range is earmarked for extended control characters, and is not used for encoding characters in HTML. The reason for this is to maintain interoperability with 7 bit devices or when the 8th bit gets stripped by faulty software. Some operating systems or code pages may use this special range for access of text characters, but this can not be relied upon.</span>

**Positions 032-064:**  
<span class="text">Includes common English punctuation and Roman numerical digits. This range does not need to be encoded except for the four [reserved HTML characters](t/text.htm#reserved) (quote, ampersand, less than and greater than characters.)</span>

**Positions 065-126:**  
<span class="text">Includes uppercase and lowercase letters (A-Z and a-z) as well as common English punctuation. These characters do not need to be encoded.</span>

**Positions 159-191:**  
<span class="text">These represent special symbols. It is always safest to encode this range as character entities (numbered or named) to ensure better portability. This range has only recently gained Named Entity support for most of the characters so using Numbered Entities is recommended.</span>

**Positions 192-255:**  
<span class="text">These represent special upper and lower case accented national characters. It is always safest to encode this range as character entities (numbered or named) to ensure better portability. The HTML specifications suggest encoding this range as named entities.</span>

<span id="procon"></span>

**Character Entity Formats - Pros and Cons**\
<span class="text">Included in the Character Entity domain are both numbered and named entities:</span>\
**Numbered Entity Syntax:** **&#charnumber;**  
<span class="text">Where *charnumber* is a distinct integer from 0-255.</span>

**Named Entity Syntax:** **&charname;**  
<span class="text">Where *charname* is a unique mnemonic shorthand of the character to be represented.</span>

\
<span class="text">Why would an author wish to use one method over the other?</span>\
\
**Using &entityname;**  
**Pros:**

- <span class="text">The mnemonic words are much easier to remember than the numbers.</span>
- <span class="text">Official support has existed for accented Latin characters (192-255 character range) since at least HTML 2.0. The standards actually recommend using the named entities for this range over the numbered entities.</span>
- <span class="text">Browser support for accented Latin characters is also very widespread.</span>

**Cons:**

- <span class="text">Not all browsers may support the newer entity names (160-191 range.)</span>

**Using &#number;**  
**Pros:**

- <span class="text">Support is excellent in most all browsers. It is hard to go wrong using them.</span>
- <span class="text">The entire printable ISO 8859-1 character set range has almost always been addressable using this method.</span>

**Cons:**

- <span class="text">The numbers are harder to remember</span>

**Special Character Cases:**  
**HTML Reserved characters:** <span class="text">(Less than, Greater than, Ampersand and Quotation mark)</span>

- <span class="text">Use character entity names</span>
- <span class="text">The quotation mark ('\&quot;') character entity was retracted from HTML 3.2 (it exists in HTML 2.0, 3.0 and 4.0 though.) Safest use of this character is its numbered version.</span>

**Newer commonly used entities:**

- **Copyright and Registered Trademark (\&#169; and \&#174;):**\
  <span class="text">Most browsers now support the named entity versions, but it is probably a bit safer to use the numbers instead.</span>
- **Non-breaking space (\&#160;):**\
  <span class="text">The named version is covered by most browsers now, but to be absolutely sure use the number instead.</span>
- **Trademark:**\
  <span class="text">In much earlier browser history, support for the trademark entity was limited, but this is no longer the case. It is entirely safe these days to use \&#174;. If you are uncertain whether a browser may or may not be able to support this entity, you could "hack" some moral equivalent to the entity using HTML elements, such as something similar to: \<sup\>\<small\>\<tt\>TM\</tt\>\</small\>\</sup\></span>

\
<span id="unicode"></span>

**The Unicode Solution**  
<span class="text">There is a shift occurring in computer text representation. Traditionally, text is represented by a single character of data (1 byte or 8 bits) at its lowest level. This allows for 256 possible distinct characters. In languages where the entire character set exceeds this range (such as in Far East languages) two characters are used to represent a single character. Many Far East languages use their own standard sets of double byte encodings to represent character sets in each language - this compounds the problem and makes the transporting of characters and documents between language locales yet more difficult. This diversity of sets can also lead to significant problems in the programmatic handling of character data as well.\
\
The Unicode standard was developed to greatly reduce all this fracturing of languages into conflicting character sets. Like Far East languages, Unicode also uses 16 bits of data to represent its characters. If you look at the number of characters possible using 16 bits of data (twice the normal amount of a single 'byte'), we see that 65536 (256\*256) distinct encodings are possible. All major character sets of the world (including Far East languages, symbols and dingbats) can be represented using a total of only about 35,000 of these character code points in the unicode set. Even though all the possible code points are not currently used in Unicode, there are many obscure characters and dead language writing systems that are not included in the set. Including ALL known languages, variations and symbols would be a never-ending task. A mechanism does exist, however, to expand the number of possible code points in Unicode into the millions in case of such a need.\
\
Current software uses 7 or 8 bit encoding of characters. Unicode uses 16 bits. What would happen if a current system reads Unicode? Could be quite nasty, so there is a work-around. Unicode can be translated into sequences of 7 bit or 8 bit encodings that allow many current and old systems to interchange or transparently pass these documents without loss of content. The most popular version of this translation mechanism in use is UTF-8 (Universal character set Translation Format, 8-bit form.) This format uses variable lengths of the current standard single-byte characters to represent Unicode character code points.\
\
The number of operating systems and applications that understand Unicode character encoding is growing, and it is the successor to ISO 8859-1 as the base character set used in HTML (beginning with HTML 4.0.)</span>

<span id="unichars"></span>

**HTML 4.0 - Unicode instead of ISO 8859-1**  
<span class="text">As mentioned, HTML 4.0 uses Unicode as its base character set. With this change a whole new set of officially named and numbered character entities are introduced. Occasionally, there may be some overlap when a distinct unicode position may represent the same display character defined by another unicode position.\
\
**Note:** In the following tables, the default font used to display content in your browser must support Unicode code points in order to display correctly.</span>

<table data-cellpadding="2">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2"><hr /></td>
</tr>
<tr>
<td rowspan="10"><strong>Unicode<br />
Character<br />
Entities</strong></td>
<td><a href="entities/arrow.htm">Arrows</a></td>
<td>Arrow Shapes</td>
</tr>
<tr>
<td><a href="entities/greekcapitals.htm">Greek Capitals</a></td>
<td>Greek capital characters</td>
</tr>
<tr>
<td><a href="entities/greeksmalls.htm">Greek Smalls</a></td>
<td>Greek 'lower case' characters</td>
</tr>
<tr>
<td><a href="entities/math.htm">Math Symbols</a></td>
<td>Characters commonly used in mathematics</td>
</tr>
<tr>
<td><a href="entities/miscletters.htm">Miscellaneous letters</a></td>
<td>Latin Extended-A and B characters and Letter-like Symbols</td>
</tr>
<tr>
<td><a href="entities/miscshapes.htm">Miscellaneous shapes</a></td>
<td>Playing card suit symbols and other graphical symbols</td>
</tr>
<tr>
<td><a href="entities/misctechnical.htm">Miscellaneous technical symbols</a></td>
<td>Characters used in various technical disciplines</td>
</tr>
<tr>
<td><a href="entities/spacebidi.htm">Bi-directional and spacing characters</a></td>
<td>Characters used to control bi-directional text and text spacing</td>
</tr>
<tr>
<td><a href="entities/genpunctuation1.htm">General punctuation set 1</a></td>
<td>Commonly used punctuation characters</td>
</tr>
<tr>
<td><a href="entities/genpunctuation2.htm">General punctuation set 2</a></td>
<td>More commonly used punctuation characters</td>
</tr>
<tr>
<td></td>
<td colspan="2"><hr /></td>
</tr>
</tbody>
</table>

\
<span id="related"></span>\

**Related Sites**\
**Official References**\
<a href="http://www.rfc-editor.org/rfc/rfc1866.txt" class="relevant">http://www.rfc-editor.org/rfc/rfc1866.txt</a>  
<span class="relevant">RFC 1866: The HTML 2.0 specification (plain text.) Appendix contains Character Entity table.</span>

<a href="http://www.w3.org/MarkUp/html-spec/html-spec_13.html" class="relevant">http://www.w3.org/MarkUp/html-spec/html-spec_13.html</a>  
<span class="relevant">The web version of the HTML 2.0 (RFC 1866) Character Entity table</span>

<a href="http://www.w3.org/MarkUp/Wilbur/" class="relevant">http://www.w3.org/MarkUp/Wilbur/</a>  
<span class="relevant">The HTML 3.2 (Wilbur) recommendation\
\[This includes all character entities listed in HTML 2.0 plus new named entities covering the ISO 8859-1 120-191 range.\]</span>

<a href="http://www.w3.org/TR/REC-html40/" class="relevant">http://www.w3.org/TR/REC-html40/</a>  
<span class="relevant">The HTML 4.0 Recommendation\
\[Includes new Unicode character entities\]</span>

<a href="http://www.w3.org/International/O-HTML.html" class="relevant">http://www.w3.org/International/O-HTML.html</a>  
<span class="relevant">The W3C HTML Internationalization area</span>

<a href="http://www.unicode.org" class="relevant">http://unicode.org</a>  
<span class="relevant">The Unicode Consortium site</span>\
\

**Other Related Links**\
(These sites provided many of the topics and ideas for this page)\
<a href="http://www.ramsch.org/martin/uni/fmi-hp/iso8859-1.html" class="relevant">http://www.ramsch.org/martin/uni/fmi-hp/iso8859-1.html</a>  
<span class="relevant">Excellent resource with good pointers on ISO-8859 issues</span>

<a href="http://ppewww.ph.gla.ac.uk/%7Eflavell/iso8859/iso8859-pointers.html" class="relevant">http://ppewww.ph.gla.ac.uk/%7Eflavell/iso8859/iso8859-pointers.html</a>  
<span class="relevant">Alan Flavell's excellent document of pointers to information about ISO-8859</span>

<a href="http://ppewww.ph.gla.ac.uk/%7Eflavell/iso8859/character-faq.txt" class="relevant">http://ppewww.ph.gla.ac.uk/%7Eflavell/iso8859/character-faq.txt</a>  
<span class="relevant">Alan Flavell's brief FAQ document regarding ISO-8859 issues in HTML</span>

<a href="http://www.bbsinc.com/iso8859.html" class="relevant">http://www.bbsinc.com/iso8859.html</a>  
<span class="relevant">Kevin J Brewer's page with MANY links regarding character set issues.</span>

\
\
[Boring Copyright Stuff...](../../misc/copyright.htm)\
