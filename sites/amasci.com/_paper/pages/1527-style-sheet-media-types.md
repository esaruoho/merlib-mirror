---
title: "Style Sheet Media Types"
source_domain: amasci.com
source_path: ~bloo/indexdot/css/topics/media.htm
order: 1527
reachable_from_entry: false
images: 0
internal_links: 6
extracted: 2026-08-07T17:07:50Z
extractor: site_to_paper.py (pandoc)
---

# Style Sheet Media Types

*Source page: `~bloo/indexdot/css/topics/media.htm`*

\

<span class="pagetitle">CSS Media Types</span>\
= <span class="sitetitle">Index DOT Css</span> by [Brian Wilson](../../misc/email.htm) =
========================================================================================

<div align="center">

|  |
|----|
| [Main Index](../index.html) \| [Property Index](../propindex/font.htm) \| [CSS Support History](../supportkey/syntax.htm) \| [Browser History](../../history/browsers.htm) |

</div>

\
\
**Introduction**

------------------------------------------------------------------------

In CSS1, all of the CSS properties were targeted to the then-dominant paged/visual rendering paradigm. Already, alternative web navigation devices are on the market, offering much more variety and capabilities than was common in the past. This crucial fact was recognized in the creation of CSS2, and the expectation is that the variety of rendering platforms for CSS will only grow as time goes by.\
\
CSS2 now allows for the targeting of style rules to specific media types. This means you can explicitly request that one or more style rules will only apply when rendering to certain device types, such as a printer, an aural browser or a handheld device. Several methods exist to target one or more style rules to one or more media rendering device-types:

- Some CSS properties only apply to specific media types.
- Some property values have different meanings in different Media contexts.
- The [@Media](../syntax/atrules/media.htm) At-Rule specifies a target rendering media for a group of style rules.
- The Media component of the [@Import](../syntax/atrules/import.htm) At-Rule syntax specifies the target media for an imported style sheet.
- The MEDIA attribute for the HTML [LINK](../../html/tagpages/l/link.htm) and [STYLE](../../html/tagpages/s/style.htm) elements specify target media for an entire style sheet.

\
\
**CSS2 Media Types and Descriptions**

------------------------------------------------------------------------

The following list of Media type keywords is given in the CSS2 spec, and that same spec also does not consider this list to be definitive. If a browser claims to support a specific media type, it should implement all of the CSS properties that the CSS spec should apply to the indicated media.\
**Note:** All media keywords are considered to be case-insensitive.\
\

<table data-border="2" data-cellspacing="0" data-cellpadding="5">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;"><strong>Media<br />
Keyword</strong></th>
<th style="text-align: left;" data-valign="bottom"><strong>Description</strong></th>
</tr>
</thead>
<tbody>
<tr>
<th style="text-align: left;" data-valign="top"><strong>All</strong></th>
<td>May be rendered using any media-type device.</td>
</tr>
<tr>
<th style="text-align: left;" data-valign="top"><strong>Aural</strong></th>
<td>Rendering targeted for speech and sound synthesizers.</td>
</tr>
<tr>
<th style="text-align: left;" data-valign="top"><strong>Braille</strong></th>
<td>Rendering targeted for Braille touch-feedback devices.</td>
</tr>
<tr>
<th style="text-align: left;" data-valign="top"><strong>Embossed</strong></th>
<td>Rendering targeted for Braille paged printing devices.</td>
</tr>
<tr>
<th style="text-align: left;" data-valign="top"><strong>Handheld</strong></th>
<td>Rendering targeted for small or handheld devices (eg: devices with small screens, limited bandwidth or display capabilities - perhaps monochrome screens.)</td>
</tr>
<tr>
<th style="text-align: left;" data-valign="top"><strong>Print</strong></th>
<td>Rendering targeted for page-by-page use, typically printed on paper.</td>
</tr>
<tr>
<th style="text-align: left;" data-valign="top"><strong>Projection</strong></th>
<td>Rendering targeted for projection (eg: screen projections) using transparent media (eg: slides.)</td>
</tr>
<tr>
<th style="text-align: left;" data-valign="top"><strong>Screen</strong></th>
<td>Rendering targeted for continuous (non-paged) color computer screens.</td>
</tr>
<tr>
<th style="text-align: left;" data-valign="top"><strong>TTY</strong></th>
<td>Rendering targeted for media that uses a fixed-pitch character grid (eg: terminals and teletypes.)</td>
</tr>
<tr>
<th style="text-align: left;" data-valign="top"><strong>TV</strong></th>
<td>Rendering targeted for television-like devices (eg: color, basic sound capabilities, limited resolution and scrollability.)</td>
</tr>
</tbody>
</table>

\
**CSS2 Media Groupings**

------------------------------------------------------------------------

The CSS2 specification specification defines which media groups that each CSS property applies to. It does so by aggregating the various media types by function and form

**Interface**  
**Description:** This category describes the way a user experiences the entirety of a document with a given Media type.

**Options:**\
**Continuous** - The document is experienced using a movable window/portal on the content with the Media type.\
**Paged** - The document is experienced a page at a time with the Media type.\
**Both** - CSS properties are applied using either continuous or paged media with the Media type.

**Sensory**  
**Description:** This category describes the human senses used to experience a document with a given Media type.

**Options:**\
**Visual** - A document's content is experienced primarily using the eyes with the Media type.\
**Aural** - A document's content is experienced primarily using the ears with the Media type.\
**Tactile** - A document's content is experienced primarily using the sense of touch with the Media type.

**Layout**  
**Description:** This describes the method used by a Media type to render character content.

**Options:**\
**Grid** - Content is laid out using a character grid with the Media type.\
**Bitmap** - Content is rendered as a bitmap with the Media type.\
**Both** - Content can be rendered with a character grid or bitmap device.

**Interactivity**  
**Description:** This category describes the level of interaction possible using a specific media type

**Options:**\
**Interactive** - Media types which allow interactivity with the user\
**Static** - Media types which do not allow interactivity with the user\
**Both** - Applies to both Static and Interactive Media types.

**"All"**  
**Description:** Applies to all Media types.

**Options:** **All**

**Media Types versus Media Groupings**

------------------------------------------------------------------------

Each CSS property indicates the Media grouping that it applies to. The grid below, taken from the CSS2 specification, is a guide to which Media types belong to which Media Groups.\
\  
<table data-border="0" data-cellspacing="0" data-cellpadding="0">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr>
<th> </th>
<th>    </th>
<th> </th>
<th><strong>Media Groups</strong></th>
</tr>
</thead>
<tbody>
<tr>
<th> </th>
<th colspan="2" data-bgcolor="#000000"> </th>
<th></th>
</tr>
<tr>
<th><strong>Media<br />
Types</strong></th>
<th data-bgcolor="#000000">    </th>
<th><table data-border="1" data-cellspacing="0" data-cellpadding="3" width="100%">
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td>Interface</td>
<td><strong>Sensory</strong></td>
<td><strong>Layout</strong></td>
<td><strong>Interactivity</strong></td>
</tr>
<tr>
<td style="text-align: left;"><strong>Aural</strong></td>
<td>Continuous</td>
<td>Aural</td>
<td>N/A</td>
<td>Both</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Braille</strong></td>
<td>Continuous</td>
<td>Tactile</td>
<td>Grid</td>
<td>Both</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Embossed</strong></td>
<td>Paged</td>
<td>Tactile</td>
<td>Grid</td>
<td>Both</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Handheld</strong></td>
<td>Both</td>
<td>Visual</td>
<td>Both</td>
<td>Both</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Print</strong></td>
<td>Paged</td>
<td>Visual</td>
<td>Bitmap</td>
<td>Static</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Projection</strong></td>
<td>Paged</td>
<td>Visual</td>
<td>Bitmap</td>
<td>Static</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Screen</strong></td>
<td>Continuous</td>
<td>Visual</td>
<td>Bitmap</td>
<td>Both</td>
</tr>
<tr>
<td style="text-align: left;"><strong>TTY</strong></td>
<td>Continuous</td>
<td>Visual</td>
<td>Grid</td>
<td>Both</td>
</tr>
<tr>
<td style="text-align: left;" data-valign="top"><strong>TV</strong></td>
<td data-valign="top">Both</td>
<td data-valign="top">Visual,<br />
Aural</td>
<td data-valign="top">Bitmap</td>
<td data-valign="top">Both</td>
</tr>
</tbody>
</table></th>
<th></th>
</tr>
&#10;</tbody>
</table>

\
\
[Boring Copyright Stuff....](../../misc/copyright.htm)\
