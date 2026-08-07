---
title: "Table"
source_domain: amasci.com
source_path: ~bloo/indexdot/html/tagpages/t/table.htm
order: 1570
reachable_from_entry: false
images: 0
internal_links: 8
extracted: 2026-08-07T17:07:52Z
extractor: site_to_paper.py (pandoc)
---

# Table

*Source page: `~bloo/indexdot/html/tagpages/t/table.htm`*

\

<table data-border="3" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td><h1 id="table" class="pagetitle">Table</h1>
<strong>End Tag:</strong> <span class="magicword">Required</span><br />
<a href="../standards.htm">Standards Details:</a> In all HTML 4.x DTDs<br />
<strong><a href="../../../misc/suppkey.htm">Support Key:</a></strong> <span class="nosupport"> 2 </span>| <strong><em>3</em></strong> | <strong>3.2</strong> | <strong>4</strong> | <strong>IE2</strong> | <strong><em>M2A8</em></strong> | <strong>N1.1</strong> | <strong>O2.1</strong></td>
<td><a href="#what">What is it?</a><br />
<a href="#attrib">Attributes</a><br />
<a href="#example">Tag Example</a></td>
<td><a href="#model">Parent/Content Model</a><br />
<a href="#tips">Tips &amp; Tricks</a><br />
<a href="#peculiar">Browser Peculiarities</a></td>
</tr>
<tr>
<td colspan="3" style="text-align: center;">= <span class="sitetitle">Index DOT Html</span> by Brian Wilson [<a href="../../../misc/email.htm">indexdot@blooberry.com</a>] =</td>
</tr>
</tbody>
</table>

[Main Index](../../index.html) \| [Element Tree](../../tree/htmltree.htm) \| [Element Index](../../tagindex/a.htm) \| [HTML Support History](../../supportkey/a.htm)

------------------------------------------------------------------------

\
<span id="what"></span>

**What is it?**  
This is the top level containing element for HTML table structures. All formatting information lies between the beginning and ending Table tags. By default, tables have no borders. All attributes of the Table element apply globally to each cell in the table unless overridden at a sub-element level (row, cell, etc.) by other attributes.\
\
*SOME* attributes to the TABLE element are only applicable when the table is constructed using the [Complex Table Model](../tables.htm#complex) which allows a finer level of control than the [Simple Table Model](../tables.htm#simple) while maintaining backward compatibility with the simpler model.

<span id="attrib"></span>

\
**Common Attributes**\
**%[Core](../attributes/core.htm)%**  
<span class="nosupport"> 2 </span>\| ***3*** \|<span class="nosupport"> 3.2 </span>\| **4** \| ***IE3*** \|<span class="nosupport"> M </span>\| **N6B1** \| **O3.5**

**%[Events](../attributes/events.htm)%**  
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\|<span class="nosupport"> 3.2 </span>\| ***4*** \| ***IE4B1*** \|<span class="nosupport"> M </span>\| **N6B1** \| **O4**

**%[Language](../attributes/language.htm)%**  
<span class="nosupport"> 2 </span>\| ***3*** \|<span class="nosupport"> 3.2 </span>\| **4** \| ***IE4*** \|<span class="nosupport"> M </span>\| **N6B1** \|<span class="nosupport"> O </span>

**%[Data](../attributes/data.htm)%**  
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\|<span class="nosupport"> 3.2 </span>\| ***4*** \| ***IE4*** \|<span class="nosupport"> M </span>\|<span class="nosupport"> N </span>\|<span class="nosupport"> O </span>

**%[Editing](../attributes/editing.htm)%**  
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\|<span class="nosupport"> 3.2 </span>\|<span class="nosupport"> 4 </span>\| ***IE5.5*** \|<span class="nosupport"> M </span>\|<span class="nosupport"> N </span>\|<span class="nosupport"> O </span>

\
**Specific Attributes**\
**Align**\
<span class="nosupport"> 2 </span>\| ***3*** \| **3.2** \| **4** \| ***IE2*** \| **M3** \| ***N2*** \| **O2.1**  
**[Standards Details:](../standards.htm)** Deprecated in HTML 4.x

**Required?** No

**Description:**\
At the Table level this attribute indicates horizontal alignment of the table itself relative to the browser window.

**Values:** **Left** \| **Center** \| **Right**

**Background**\
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\|<span class="nosupport"> 3.2 </span>\|<span class="nosupport"> 4 </span>\| ***IE3A1*** \|<span class="nosupport"> M </span>\| **N4B3** \|<span class="nosupport"> O </span>  
**[Standards Details:](../standards.htm)** NA

**Required?** No

**Description:**\
This attribute specifies a background image to be used as the backdrop for the table. All cell contents will be displayed over this image. If the referenced image is smaller than the table size, it will be tiled to fit all of the table area.

**Values:** Either an absolute or relative URL. All URLs should be [URL encoded](../../topics/urlencoding.htm) where required.

**BGColor**\
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\|<span class="nosupport"> 3.2 </span>\| ***4*** \| ***IE2*** \|<span class="nosupport"> M </span>\| **N3B1** \| **O2.1**  
**[Standards Details:](../standards.htm)** Deprecated in HTML 4.x

**Required?** No

**Description:**\
Specifies the background color of all the table cells. This value can also be overridden at the cell level.

**Values:** The standard [HTML color specification](../../../color/colors.htm) methods.

**Border**\
<span class="nosupport"> 2 </span>\| ***3*** \| **3.2** \| **4** \| **IE2** \| ***M2A8*** \| **N1.1** \| **O2.1**  
**[Standards Details:](../standards.htm)** In all HTML 4.x DTDs

**Required?** No

**Description:**\
This is an attribute that specifies the size of the border around the table. If the value is 0 or absent, no border is rendered. An additional value of **Border** can be specified \[this is a legacy value that is supported only for backward compatibility with early Table specifications.\]

**Values:** Integers indicating pixel width of the border.

**BorderColor**\
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\|<span class="nosupport"> 3.2 </span>\|<span class="nosupport"> 4 </span>\| ***IE2*** \|<span class="nosupport"> M </span>\| **N4** \|<span class="nosupport"> O </span>  
**[Standards Details:](../standards.htm)** NA

**Required?** No

**Description:**\
This attribute sets the external border color to be used for the entire table. Display of this attribute is dependent on the presence of the BORDER attribute in the TABLE element.

**Values:** The standard [HTML color specification](../../../color/colors.htm) methods.

**BorderColorDark**\
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\|<span class="nosupport"> 3.2 </span>\|<span class="nosupport"> 4 </span>\| ***IE2*** \|<span class="nosupport"> M </span>\|<span class="nosupport"> N </span>\|<span class="nosupport"> O </span>  
**[Standards Details:](../standards.htm)** NA

**Required?** No

**Description:**\
This attribute allows independent, 3-D color control over the lower and right hand borders of the external border color for the current table. To change the upper and left hand borders of the external cell border color for the current table, use the BorderColorLight attribute (see below.) Display of this attribute is dependent on the presence of the BORDER attribute in the [TABLE](table.htm) element.

**Values:** The standard [HTML color specification](../../../color/colors.htm) methods.

**BorderColorLight**\
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\|<span class="nosupport"> 3.2 </span>\|<span class="nosupport"> 4 </span>\| ***IE2*** \|<span class="nosupport"> M </span>\|<span class="nosupport"> N </span>\|<span class="nosupport"> O </span>  
**[Standards Details:](../standards.htm)** NA

**Required?** No

**Description:**\
This attribute allows independent, 3-D color control over the upper and left hand borders of the external border color for the current table. To change the lower and right hand borders of the external cell border color for the current table, use the BorderColorDark attribute (see above.) Display of this attribute is dependent on the presence of the BORDER attribute in the [TABLE](table.htm) element.

**Values:** The standard [HTML color specification](../../../color/colors.htm) methods.

**BottomPadding**\
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\|<span class="nosupport"> 3.2 </span>\|<span class="nosupport"> 4 </span>\|<span class="nosupport"> IE </span>\|<span class="nosupport"> M </span>\| ***<u>N4-4.x</u>*** \|<span class="nosupport"> O </span>  
**[Standards Details:](../standards.htm)** NA

**Required?** No

**Description:**\
This attribute specifies the padding/spacing on the bottom side of the table in pixels.

**Values:** Positive integers.

**CellPadding**\
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\| ***3.2*** \| **4** \| **IE2** \| **M3** \| ***N1.1*** \| **O2.1**  
**[Standards Details:](../standards.htm)** In all HTML 4.x DTDs

**Required?** No

**Description:**\
This specifies globally for all cells in the table the spacing between data in a table cell and the border of the cell.

**Values:**\
Integers indicating pixel width of the padding.

**CellSpacing**\
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\| ***3.2*** \| **4** \| **IE2** \| **M3** \| ***N1.1*** \| **O2.1**  
**[Standards Details:](../standards.htm)** In all HTML 4.x DTDs

**Required?** No

**Description:**\
This specifies globally for all cells in the table the spacing between individual cells.

**Values:**\
Integers indicating pixel width of the spacing.

**Clear**\
<span class="nosupport"> 2 </span>\| ***3*** \|<span class="nosupport"> 3.2 </span>\|<span class="nosupport"> 4 </span>\|<span class="nosupport"> IE </span>\|<span class="nosupport"> M </span>\|<span class="nosupport"> N </span>\| ***O2.1***  
**[Standards Details:](../standards.htm)** NA

**Required?** No

**Description:**\
This attribute helps an author in situations with floating objects (images, tables, etc.) produced through the **Left** and **Right** ALIGN attributes. It allows content to stop being flowed around the floated element.

**Values:**\
   **None** \[**DEFAULT** - No special line breaking effects are applied relative to the floating element.\]\
   **Left** \[breaks line after this element and moves down vertically until the left margin is clear of floated objects.\]\
   **Right** \[breaks line after this element and moves down vertically until the right margin is clear of floated objects.\]\
   **All** \[breaks line after this element and moves down vertically until both margins are clear of floated objects.\]

**Cols**\
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\|<span class="nosupport"> 3.2 </span>\|<span class="nosupport"> 4 </span>\| ***IE3A1*** \|<span class="nosupport"> M </span>\| **N4B2** \|<span class="nosupport"> O </span>  
**[Standards Details:](../standards.htm)** NA

**Required?** No

**Description:**\
This Complex Table Model attribute explicitly specifies the number of columns in the table. Using this attribute can allow the browser to dynamically render the table as it is downloaded. If this attribute is absent, it is necessary to receive all of the Table code structure to determine the number of columns and their appropriate widths before display.

**Values:**\
Positive integers representing the number of columns listed in the Table HTML content.

**Datapagesize**\
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\|<span class="nosupport"> 3.2 </span>\| ***4*** \| ***IE4*** \|<span class="nosupport"> M </span>\|<span class="nosupport"> N </span>\|<span class="nosupport"> O </span>  
**[Standards Details:](../standards.htm)** In all HTML 4.x DTDs

**Required?** No

**Description:**\
Sets the number of records displayed in a data bound repeated table.

**Values:**\
Positive integers.

**Frame**\
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\|<span class="nosupport"> 3.2 </span>\| ***4*** \| ***IE3A1*** \|<span class="nosupport"> M </span>\| **N6B1** \|<span class="nosupport"> O </span>  
**[Standards Details:](../standards.htm)** In all HTML 4.x DTDs

**Required?** No

**Description:**\
This Complex Table Model attribute allows independent control over the outer border display of the table. Using this attribute coupled with the RULES attribute yields much greater border display control than the older Simple Table Model. This attribute takes a single value representing the sides of the outer table border for which to draw borders

**Values:**\
  **Void** \[Do not render any borders\]\
  **Above** \[Border on top side only\]\
  **Below** \[Border on bottom side only\]\
  **HSides** \[Render horizontal borders only (top and bottom sides.)\]\
  **VSides** \[Render vertical borders only (left and right sides.)\]\
  **LHS** \[Border on left side only\]\
  **RHS** \[Border on right side only\]\
  **Box** \[Border on all four sides\]\
  **Border** \[Border on all four sides - just like BOX - **DEFAULT**\]

**Height**\
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\|<span class="nosupport"> 3.2 </span>\|<span class="nosupport"> 4 </span>\| **IE2** \|<span class="nosupport"> M </span>\| ***N1.1*** \| **O2.1**  
**[Standards Details:](../standards.htm)** NA

**Required?** No

**Description:**\
Specifies the height of the entire table.

**Values:**\
Specified in pixels or a percentage of the browser window height.

**HSpace**\
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\|<span class="nosupport"> 3.2 </span>\|<span class="nosupport"> 4 </span>\|<span class="nosupport"> IE </span>\|<span class="nosupport"> M </span>\| ***N2*** \|<span class="nosupport"> O </span>  
**[Standards Details:](../standards.htm)** NA

**Required?** No

**Description:**\
This attribute specifies the horizontal spacing around the table in pixels (left and right padding.)

**Values:** Positive integers.

**LeftPadding**\
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\|<span class="nosupport"> 3.2 </span>\|<span class="nosupport"> 4 </span>\|<span class="nosupport"> IE </span>\|<span class="nosupport"> M </span>\| ***<u>N4-4.x</u>*** \|<span class="nosupport"> O </span>  
**[Standards Details:](../standards.htm)** NA

**Required?** No

**Description:**\
This attribute specifies the padding/spacing on the left side of the table in pixels.

**Values:** Positive integers.

**RightPadding**\
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\|<span class="nosupport"> 3.2 </span>\|<span class="nosupport"> 4 </span>\|<span class="nosupport"> IE </span>\|<span class="nosupport"> M </span>\| ***<u>N4-4.x</u>*** \|<span class="nosupport"> O </span>  
**[Standards Details:](../standards.htm)** NA

**Required?** No

**Description:**\
This attribute specifies the padding/spacing on the right side of the table in pixels.

**Values:** Positive integers.

**Rules**\
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\|<span class="nosupport"> 3.2 </span>\| ***4*** \| ***IE3A1*** \|<span class="nosupport"> M </span>\| **N6B1** \|<span class="nosupport"> O </span>  
**[Standards Details:](../standards.htm)** In all HTML 4.x DTDs

**Required?** No

**Description:**\
This Complex Table Model attribute is similar to the FRAME attribute, but where FRAME controls the outer borders around a table, RULES controls the interior dividing line display in a table. Using this attribute coupled with the FRAME attribute yields much greater border display control than the older Simple Table Model.

**Values:**\
  **None** \[No interior borders are displayed\]\
  **Groups** \[Horizontal borders are displayed between all table groups specified using the [THEAD](thead.htm), [TBODY](tbody.htm), [TFOOT](tfoot.htm) and [COLGROUP](../c/colgroup.htm) tags.\]\
  **Rows** \[Horizontal borders are displayed between all table rows ([TR](tr.htm))\]\
  **Cols** \[Vertical borders are displayed between all table columns\]\
  **All** \[Borders displayed between all table cells\]

**Summary**\
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\|<span class="nosupport"> 3.2 </span>\| ***4*** \|<span class="nosupport"> IE </span>\|<span class="nosupport"> M </span>\| ***N6B1*** \|<span class="nosupport"> O </span>  
**[Standards Details:](../standards.htm)** In all HTML 4.x DTDs

**Required?** No

**Description:**\
This attribute aids accessibility for non-visual browsers by providing a summary of the table's purpose and structure.

**Values:**\
Alphanumeric characters.

**TopPadding**\
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\|<span class="nosupport"> 3.2 </span>\|<span class="nosupport"> 4 </span>\|<span class="nosupport"> IE </span>\|<span class="nosupport"> M </span>\| ***<u>N4-4.x</u>*** \|<span class="nosupport"> O </span>  
**[Standards Details:](../standards.htm)** NA

**Required?** No

**Description:**\
This attribute specifies the padding/spacing on the top side of the table in pixels.

**Values:** Positive integers.

**VSpace**\
<span class="nosupport"> 2 </span>\|<span class="nosupport"> 3 </span>\|<span class="nosupport"> 3.2 </span>\|<span class="nosupport"> 4 </span>\|<span class="nosupport"> IE </span>\|<span class="nosupport"> M </span>\| ***N2*** \|<span class="nosupport"> O </span>  
**[Standards Details:](../standards.htm)** NA

**Required?** No

**Description:**\
This attribute specifies the vertical spacing around the table in pixels (top and bottom padding.)

**Values:** Positive integers.

**Width**\
<span class="nosupport"> 2 </span>\| ***3*** \| **3.2** \| **4** \| **IE2** \| **M3** \| ***N1.1*** \| **O2.1**  
**[Standards Details:](../standards.htm)** In all HTML 4.x DTDs

**Required?** No

**Description:**\
Specifies the width of the entire table.

**Values:**\
Specified in pixels or a percentage of the available width (eg, the parent table cell width or the browser canvas, etc.)

<span id="example"></span>

**Example**\
**\[Using the [Complex Table Model](../tables.htm#simple)\]**  
<div class="example">

\<**table** <span class="tagattrib">BORDER</span>="2" <span class="tagattrib">ALIGN</span>="left" <span class="tagattrib">CELLPADDING</span>="5" <span class="tagattrib">BORDERCOLOR</span>="#ff0000"\
<span class="tagattrib">COLS</span>="4" <span class="tagattrib">FRAME</span>="vsides" <span class="tagattrib">RULES</span>="rows" <span class="tagattrib">WIDTH</span>="75%"\>\
\<**caption** <span class="tagattrib">ALIGN</span>="top"\>Juggling Capabilities of Waterfront Performers\</**caption**\>\
\<**thead**\>\
      \<**tr**\> \<**th**\>Juggler\</**th**\> \<**th**\>Pins\</**th**\> \<**th**\>Bowling Balls\</**th**\> \<**th**\>Flaming Baseballs\</**th**\> \</**tr**\>\
\</**thead**\>\
\<**tfoot**\>\
      \<**tr**\> \<**th** <span class="tagattrib">COLSPAN</span>=4\>NOTE: This is only a small sample\</**th**\> \</**tr**\>\
\</**tfoot**\>\
\<**tbody**\>\
      \<**tr**\> \<**td**\>Bob\</**td**\> \<**td**\>5\</**td**\> \<**td**\>2\</**td**\> \<**td**\>5\</**td**\> \</**tr**\>\
      \<**tr**\> \<**td**\>Larry\</**td**\> \<**td**\>2\</**td**\> \<**td**\>7!!!\</**td**\> \<**td**\>NA\</**td**\> \</**tr**\>\
      \<**tr**\> \<**td**\>Julie the Great\</**td**\> \<**td**\>1\</**td**\> \<**td**\>2\</**td**\> \<**td**\>20\<**br**\> (She IS great!)\</**td**\> \</**tr**\>\
\</**tbody**\>\
\</**table**\>

</div>

**\[Same table using the [Simple Table Model](../tables.htm#simple)\]**  
<div class="example">

\<**table** <span class="tagattrib">BORDER</span>="2" <span class="tagattrib">ALIGN</span>="left" <span class="tagattrib">CELLPADDING</span>="5"\
<span class="tagattrib">BORDERCOLOR</span>="#ff0000" <span class="tagattrib">WIDTH</span>="75%"\>\
      \<**caption** <span class="tagattrib">ALIGN</span>="top"\>Juggling Capabilities of Waterfront Performers\</**caption**\>\
      \<**tr**\> \<**th**\>Juggler\</**th**\> \<**th**\>Pins\</**th**\> \<**th**\>Bowling Balls\</**th**\> \<**th**\>Flaming Baseballs\</**th**\> \</**tr**\>\
      \<**tr**\> \<**td**\>Bob\</**td**\> \<**td**\>5\</**td**\> \<**td**\>2\</**td**\> \<**td**\>5\</**td**\> \</**tr**\>\
      \<**tr**\> \<**td**\>Larry\</**td**\> \<**td**\>2\</**td**\> \<**td**\>7!!!\</**td**\> \<**td**\>NA\</**td**\> \</**tr**\>\
      \<**tr**\> \<**td**\>Julie the Great\</**td**\> \<**td**\>1\</**td**\> \<**td**\>2\</**td**\> \<**td**\>20\<**br**\>(She IS great!)\</**td**\> \</**tr**\>\
      \<**tr**\> \<**th** <span class="tagattrib">COLSPAN</span>=4\>NOTE: This is only a small sample\</**th**\> \</**tr**\>\
\</**table**\>

</div>

<span id="model"></span>

**Parent Model**  
**%[Block Parent](../shorthands.htm#blockparent)%**

**Content Model**  
\<[caption](../c/caption.htm)\> \| \<[col](../c/col.htm)\> \| \<[colgroup](../c/colgroup.htm)\> \| \<[tr](../t/tr.htm)\> \| \<[thead](../t/thead.htm)\> \| \<[tbody](../t/tbody.htm)\> \| \<[tfoot](../t/tfoot.htm)\>

<span id="tips"></span> **Tips & Tricks**

- If you are writing your HTML by hand, it is always highly recommended to use an HTML validator, but when authoring tables, this holds doubly true, as it is easy to make mistakes in this area.
- Make sure that the only content of the top-level table tags are legal structures (such as [TR](tr.htm) elements.) Also make sure that the only content of your TRs are [TH or TD](thtd.htm) elements. Otherwise, some browsers may display table contents incorrectly.
- The Table model (even the Simple Table Model) is easily the most complex markup structure in HTML. If you have other general questions about this structure see the [Table Overview](../tables.htm).
- **Compatibility Tip:** Centering a Table structure using any of the commonly available centering methods in HTML can cause the entire contents of the table cells to be centered in browsers that only support centering and not tables. This can cause visual display problems in such cases.
- **Compatibility Tip:** To enable Table cell contents to display well on browsers that do not support tables, it is common practice to put either an extra space at the end of each table cell, or even better, put a \<**br**\> element at the end of the last cell in each table row (eg: \<tr\> \<td\>cell 1\</td\> \<td\>cell 2\<br\>\</td\>\</tr\>.) This is perfectly legal HTML and should cause no display problems for browsers that support tables (as there is an implied line break anyway at the end of every table cell) and should greatly improve readability on older browsers. (notice that I have not used this tip in these pages yet. I hope to at some point in the future.)
- If you are having problems with table layout and borders are turned off, it can be helpful to temporarily turn them on - this can reveal clues of why the layout is misbehaving.

<span id="peculiar"></span> **Browser Peculiarities**

- Netscape does not render a table until the entire table structure is received. This behavior is very noticeable with pages using very large table structures - especially when using a slower connection. Internet Explorer tries to render the table as it receives it, which tends to affect user perception of the download time as being faster. A way to combat this difference is to break tables up into smaller chunks, if possible. (Opera behavior is not known here.)

- Internet Explorer requires the THEAD, TBODY and TFOOT sections to exist in order to use the RULES and FRAME attributes of the TABLE element. This is counter to the statement in the specifications for tables that the omission of THEAD, TBODY and TFOOT elements *IMPLIES* that the table content is all one TBODY section.

- Currently, when using only the simple table model the only way to create complex borders for tables is to use nested tables. Nested tables are entirely legal under the HTML Tables specifications, but Mosaic versions below 3.0 do not support nested tables (all nested table content appears as a solid square and content is lost.)

- Internet Explorer seems to be generally more tolerant of invalid HTML in the creation of table structures than Netscape or Mosaic is, but do *NOT* rely on this robustness; check the display on other browsers as well.

- The Tables specification says the CAPTION element should always come at the beginning of a table structure (this is to ensure proper rendering in progressive table display.) I have yet to see a browser misbehave if the CAPTION is placed in a position other than the beginning of a table (as long as it is within a legal table row hierarchy relationship.)

- The ALIGN attribute for the table element does not appear to work very robustly in either Netscape or Internet Explorer.

- Netscape now supports the BACKGROUND attribute for placement of background images for the entire table. I have never found this documented anywhere and it was a reader that alerted me to the fact. When testing the behavior, an occasional glitch seemed apparent - be sure to check display of this attribute in supporting Netscape versions for proper behavior if you plan to use it.

- The use of CENTER as a value for the ALIGN attribute in Internet Explorer and Netscape does not work like the LEFT and RIGHT floating behaviors. CENTER causes no floating behavior - it just centers the table on the screen (like wrapping the table in the DIV ALIGN=CENTER or CENTER elements.)

- The COLS attribute in Netscape makes all the columns of the table have equal width, regardless of the size of the cell content.

- The BORDERCOLOR attribute affects a table differently in Internet Explorer and Netscape - In Internet Explorer, both exterior and interior borders are given the border color. In Netscape, only the outermost edge of the exterior 'box' border of the table uses the border color.

- The effects of the FONT element are generally not inherited by content nested inside tables. If an author wishes to ensure that the effects of the FONT element are applied everywhere, the element must also be applied for every table cell in a table (in such a case CSS would be a simpler answer.) These are the FONT attributes which apply to content within tables:\
  **Internet Explorer**  
  **2.0:** COLOR and FACE applied, SIZE ignored

  **3.0+:** FACE applied, COLOR and SIZE ignored

  **Netscape:**  
  None of the FONT element attributes has any effect on content nested in tables.

  **Opera:**  
  All FONT element attributes have an effect on content nested in tables.

- Netscape and Opera: Both browsers ignore percentage values (pixel values are fine) for the HEIGHT attribute for TABLE *only if* the table it is being applied to is nested within another table. Internet Explorer, on the other hand, honors percentage values for HEIGHT whether a table is un-nested or nested.

- I *finally* discovered the answer to a strange behavior that I had seen for a long time in Netscape: occasionally, some text was unselectable.\
  The answer: the content of tables in Netscape (text especially), is not selectable by the reader if the table is floated (using the ALIGN="left" or ALIGN="right".) This behavior has been the case ALL the way back to Netscape 2.0.

- An author with an eagle eye pointed this one out:\
  The scenario - In Netscape 4.x, if you use a background image on a table, any nested tables will inherit the same background image and not be transparent the way they should be. In other words, the background image is re-started (overlaid) in the nested table. The author who pointed this bug out also mentioned a useful fix which does not appear to be at all harmful: specify an empty BACKGROUND attribute (BACKGROUND="") in nested TABLE elements in this scenario.

- Netscape 4.x error condition bug: if a BGCOLOR and BACKGROUND attribute have been specified for the table, and the URL to the image fails to load, the bgcolor should be used instead. Netscape 4.x does that for a moment, but then this changes to a block only the size of the broken image placeholder with the specified BGCOLOR in the upper, left corner of each of the cells in the table.

- Netscape 4.x has a strange rendering bug with checkbox and radio button form fields. If a BGCOLOR attribute is declared for a table - or a cell within a table - the rendering boxes of any checkboxes and radio buttons (also INPUT FILE fields to a small extent) in that cell/table will not use the indicated BGCOLOR - it will instead use the BGCOLOR of the document itself. If you use Netscape 4.x, you will see this bug apparent at almost every large-scale site you go to.\
  **Workaround:** Using the CSS '[background-color](http://www.blooberry.com/indexdot/css/properties/colorbg/bgcolor.htm)' <span class="external">\[--\>Index DOT Css\]</span> property on the checkbox or radio element itself, set to the background color of the cell/table that you are in, things will be correctly displayed.

\
[Boring Copyright Stuff...](../../../misc/copyright.htm)
