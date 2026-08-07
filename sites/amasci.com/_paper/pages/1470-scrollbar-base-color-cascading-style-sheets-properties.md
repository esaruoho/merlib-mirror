---
title: "Scrollbar-Base-Color - Cascading Style Sheets Properties"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/properties/scrollbar/scrollbarbc.htm
order: 1470
reachable_from_entry: false
images: 0
internal_links: 8
extracted: 2026-08-07T05:55:11Z
extractor: site_to_paper.py (pandoc)
---

# Scrollbar-Base-Color - Cascading Style Sheets Properties

*Source page: `~bloo/indexdot/css/properties/scrollbar/scrollbarbc.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td rowspan="2"><h1 id="scrollbar--base-color" class="pagetitle">scrollbar-<br />
base-color</h1>
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> [<strong><em>IE5.5B1</em></strong>|<strong>O7</strong>]<br />
</td>
<td colspan="2" style="text-align: center;"><strong>Other Scrollbar Properties</strong><br />
</td>
</tr>
<tr>
<td style="text-align: center;"><a href="scrollbarfc.htm">scrollbar-face-color</a><br />
<a href="scrollbarac.htm">scrollbar-arrow-color</a><br />
<a href="scrollbarsc.htm">scrollbar-shadow-color</a><br />
<br />
</td>
<td style="text-align: center;"><a href="scrollbardsc.htm">scrollbar-darkshadow-color</a><br />
<a href="scrollbarhc.htm">scrollbar-highlight-color</a><br />
<a href="scrollbar3dlc.htm">scrollbar-3dlight-color</a><br />
<a href="scrollbartc.htm">scrollbar-track-color</a><br />
</td>
</tr>
<tr>
<td colspan="3" style="text-align: center;">= <span class="sitetitle">Index DOT Css</span> by <a href="../../../misc/email.htm">Brian Wilson</a> =<br />
</td>
</tr>
</tbody>
</table>

<div align="center">

|  |
|----|
|   [Main Index](../../index.html) \| [Property Index](../../propindex/font.htm) \| [CSS Support History](../../supportkey/syntax.htm) \| [Browser History](../../../history/browsers.htm)   |

</div>

------------------------------------------------------------------------

\
\

<table data-border="1" data-cellspacing="0" data-cellpadding="5">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td><table data-border="0" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr>
<th colspan="2" class="field" style="text-align: left;" data-valign="bottom"><u><strong>   Quick Statistics   </strong></u><br />
</th>
</tr>
</thead>
<tbody>
<tr>
<th style="text-align: left;"><strong>Default Value:</strong><br />
</th>
<td>NA</td>
</tr>
<tr>
<th style="text-align: left;" data-valign="top"><strong>Applicable Elements:</strong><br />
</th>
<td>Elements whose intrinsic display may use scrollbars<br />
(<strong>APPLET</strong>, <strong>BODY</strong>, <strong>EMBED</strong>, <strong>OBJECT</strong>, <strong>SELECT</strong>, <strong>TABLE</strong>, <strong>TEXTAREA</strong>)<br />
or elements with an assigned 'overflow' property value of "scroll" or "auto".</td>
</tr>
<tr>
<th style="text-align: left;"><strong>Inherit From Parent:</strong><br />
</th>
<td>Yes</td>
</tr>
<tr>
<th style="text-align: left;"><strong>Applicable Media:</strong><br />
</th>
<td>Visual</td>
</tr>
<tr>
<th style="text-align: left;"><strong>HTML Equivalent:</strong><br />
</th>
<td>NA</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

**What is it?**  
This property describes the color of the button face of the scrollbar arrow widgets, the button face color of the slider widget and half of the dither colors for the scrollbar slider tray (please see also the [illustrated diagram](../scrollbar.htm#diagram) showing the components of a scrollbar interface.)

<!-- -->

\
**Allowed Values**\
**\[color\]**\
\[***IE5.5B1***\|**O7**\]  
**Type:** Explicit

**Description:**\
This is a representation of the values for Red/Green/Blue used to determine a final display color. Please see the section on [Color Units](../../syntax/units/color.htm) for details on the various color specification schemes.

<!-- -->

**Example**  
<div class="example">

Ext/Doc: **body** { <span class="property">scrollbar-base-color:</span> blue }

</div>

<div class="example">

In-Line:  \<**body** <span class="tagattrib">STYLE</span>="<span class="property">scrollbar-base-color:</span> blue"\>text\</**body**\>

</div>

**Browser Peculiarities**

- **Internet Explorer**
  **5.5 Beta 1:**
  \- The listing for "Applicable Elements" previously mentioned is taken directly from the IE online reference. Under direct experimentation, it looks like BODY, DIV and TEXTAREA are all supported, but I could not find a way to get APPLET, EMBED, OBJECT, SELECT and TABLE to recognize this property.
  \- It appears that when this CSS property is used, the default color used for the "shadows" of the scrollbar arrow and slider widgets is black instead using the current OS settings for the shadow color.
  \- It appears that when this CSS property is used, the default color used for the "highlights" of the scrollbar arrow and slider widgets is white instead using the current OS settings for the highlight color.
- **Opera**
  **7.x:**
  \- Opera supports CSS scrollbar coloring, but this feature is not enabled by default, nor is the setting available in the UI. The user has to manually add a line to their Opera6.ini file. In the "\[User Prefs\]" section, the following line should be added on its own line:\
  *Enable Scrollbar Colors=1*
  \- Since IE is the "reference implementation" (so to speak) of this property, it seems best to mention differences under Opera rather than IE: Opera seems to use slightly different color dithering for the scrollbar-track than IE does.

\
\
[Boring Copyright Stuff....](../../../misc/copyright.htm)\
