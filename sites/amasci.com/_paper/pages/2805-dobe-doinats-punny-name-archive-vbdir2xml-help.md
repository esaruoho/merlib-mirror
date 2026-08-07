---
title: "Dobe Doinat's Punny Name Archive: vbDiR2XML Help"
source_domain: amasci.com
source_path: ~dobe/vbDiR2XML_Help.htm
order: 2805
reachable_from_entry: false
images: 8
internal_links: 1
extracted: 2026-08-07T17:09:23Z
extractor: site_to_paper.py (pandoc)
---

# Dobe Doinat's Punny Name Archive: vbDiR2XML Help

*Source page: `~dobe/vbDiR2XML_Help.htm`*

<div id="PNA_vbDiR2XML_Help_Start">

</div>

<table id="VBDownloads_vbDiR2XML" data-border="0">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td><table data-border="0">
<tbody>
<tr>
<td class="specialBROWN200" style="text-align: left;" width="100%" title="PNA" onmouseover="this.style.color=&#39;red&#39;; this.style.fontSize=&#39;210%&#39;;" onmouseout="this.style.color=&#39;brown&#39;; this.style.fontSize=&#39;190%&#39;;"><strong>vbDiR2XML</strong> Directory-to-XML/XSLT <strong>Help File</strong></td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

\
<span class="Green90cursive"> </span>

<table data-border="0" width="100%">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td data-valign="top" width="50%"><ul>
<li><a href="#PNA_vbDiR2XML_Help_Introduction">Introduction</a></li>
<li><a href="#PNA_vbDiR2XML_Help_UserExperience">User Experience</a> (Screenshots)</li>
<li><a href="#PNA_vbDiR2XML_Help_CoderExperience">Programming in Visual Basic</a> (Screenshots)
<ul>
<li><a href="#vbDiR2XML_DL">vbDiR2XML.ZIP files</a> (Downloads)</li>
<li><a href="#PNA_vbDiR2XML_Help_Bugs">Known Bugs</a></li>
<li><a href="#PNA_vbDiR2XML_Help_Improvements">Improvements</a> (Wish List)</li>
</ul></li>
<li><a href="#PNA_vbDiR2XML_Help_Code_Intro">Source Code Introduction</a>
<ul>
<li><a href="#PNA_vbDiR2XML_Help_GlobalVariables">Global Variables</a></li>
<li><a href="#PNA_vbDiR2XML_Help_Form_Load">Form_Load</a> (<strong>frmDobeXMLPad</strong>)</li>
<li><a href="#PNA_vbDiR2XML_Help_Code_Controls">Controls</a>
<ul>
<li><a href="#PNA__vbDiR2XML_Help_cboPatterns_Click">cboPatterns</a></li>
<li><a href="#PNA_vbDiR2XML_Help_dirSelect_Change">dirSelect</a></li>
<li><a href="#PNA_vbDiR2XML_Help_drvSelect_Change">drvSelect</a></li>
<li><a href="#PNA_vbDiR2XML_Help_filSelect_Click">filSelect</a></li>
</ul></li>
<li><a href="#PNA_vbDiR2XML_Help_Code_Events">Events</a>
<ul>
<li><a href="#PNA_vbDiR2XML_Help_Timer1_Timer">Timer1</a></li>
</ul></li>
<li><a href="#PNA_vbDiR2XML_Help_Code_Functions">Subroutines and Functions</a>
<ul>
<li><a href="#PNA_vbDiR2XML_Help_RefreshFormValues">RefreshFormValues</a></li>
<li><a href="#PNA_vbDiR2XML_Help_WriteFileToScreen">WriteFileToScreen</a></li>
<li><a href="#PNA_vbDiR2XML_Help_WriteXMLtoFile">WriteXMLtoFile</a></li>
<li><a href="#PNA_vbDiR2XML_Help_WriteXSLTFile">WriteXSLTFile</a></li>
</ul></li>
</ul></li>
</ul></td>
<td data-valign="top" width="50%"><ul>
<li><ul>
<li><a href="#PNA_vbDiR2XML_Help_Code_Menu">Menu Items</a>
<ul>
<li><a href="#PNA_vbDiR2XML_Help_mnuOLENotePad">mnuOLENotePad</a></li>
<li><a href="#PNA_vbDiR2XML_Help_mnuFileExit">mnuFileExit</a></li>
<li><a href="#PNA_vbDiR2XML_Help_mnuEditSelect">mnuEditSelect</a></li>
<li><a href="#PNA_vbDiR2XML_Help_mnuSortByName">mnuSortByName</a></li>
<li><a href="#PNA_vbDiR2XML_Help_mnuSortByType">mnuSortByType</a></li>
<li><a href="#PNA_vbDiR2XML_Help_mnuSortBySize">mnuSortBySize</a></li>
<li><a href="#PNA_vbDiR2XML_Help_mnuWriteFile">mnuWriteFile</a></li>
<li><a href="#PNA_vbDiR2XML_Help_mnuViewBrowser">mnuViewBrowser</a></li>
<li><a href="#PNA_vbDiR2XML_Help_mnuHelpViewCode">mnuHelpViewCode</a></li>
<li><a href="#PNA_vbDiR2XML_Help_mnuHelpAbout">mnuHelpAbout</a></li>
</ul></li>
<li><a href="#PNA_vbDiR2XML_Help_Code_Buttons">Buttons</a>
<ul>
<li><a href="#PNA_vbDiR2XML_Help_cmdExit">cmdExit</a></li>
<li><a href="#PNA_vbDiR2XML_Help_cmdView">cmdView</a></li>
<li><a href="#PNA_vbDiR2XML_Help_cmdWriteFile">cmdWriteFile</a></li>
</ul></li>
<li><a href="#PNA_vbDiR2XML_Help_Code_TextBox">Text Fields</a>
<ul>
<li><a href="#PNA_vbDiR2XML_Help_txtSaveDir_GotFocus">txtSaveDir_GotFocus</a></li>
<li><a href="#PNA_vbDiR2XML_Help_txtWriteFile_GotFocus">txtWriteFile_GotFocus</a></li>
<li><a href="#PNA_vbDiR2XML_Help_txtWriteFile_LostFocus">txtWriteFile_LostFocus</a></li>
</ul></li>
</ul></li>
<li><a href="#PNA_vbDiR2XML_Help_frmAboutForm">Help About Form</a> (<strong>frmHelpAbout</strong>)</li>
<li><a href="#PNA_vbDiR2XML_Help_Code_Comments">Dobe's Retrospective</a></li>
</ul></td>
</tr>
</tbody>
</table>

\

------------------------------------------------------------------------

------------------------------------------------------------------------

\

> |  |  |
> |:---|---:|
> | **Introduction** | [**Back to the Beginning of this page**](#PNA_vbDiR2XML_Help_Start) |

>     This is the <u>documentation</u> for the **Visual Basic 6.0** project called "**vbDiR2XML**" which was written as *Careware* by me, )"**Dobe Doinat**", otherwise known as "**John W. Hartman**") and is meant to demonstrate how to list the files in a directory, much as you would from a DOS command line: "DIR", except that the result is written to disk as an **XML** file, then modified by an **XSLT** file as it is **displayed in a Browser** (as long as the browser is MSIE-compatable).\
> \
>     This project is a **useful utility**, IMHO, in and of itself, but the main reason it is being published is to **share my source code and have others be able to actually modify and improve on this utility**.\
> \
>     In the meantime, if you're not interested in how this program works, go back to my website and **download the <u>EXEcutable-only</u> ZIP**, copy the resulting files to a directory and it should run.\
> \
>
> >     <u>**NOTE**</u>: If you use the application, and can show your appreciation monitarily, it would be greatly appreciated, as I have been out of work since shortly after **September 11, 2001**, the terrorist trauma having it's way with our economy. My deepest condolences to those who have suffered much greater loss.\
> > \
> >     If this is not possible, by all means use it anyway, and show your appreciation in whatever way you care to, such as being nice to the wife and kids a few more minutes a day, or treat your Secretary to lunch, or **help find me employment**...

\

------------------------------------------------------------------------

------------------------------------------------------------------------

\

> |  |  |
> |:---|---:|
> | **User Experience** | [**Back to the Beginning of this page**](#PNA_vbDiR2XML_Help_Start) |

> One [Screenshot](#vbDiR2XML_Screenshot) shows how looks when run in Windows, while another [Screenshot](#vbDiR2XML_IDE_Screenshot) shows how it looks in Design Mode of Visual Basic. [ZIP files](#vbDiR2XML_DL) also available.\
>
> - **Select Drive and Directory** to be used as the "Seed" directory (upper left)
> - **Select location** to write the XML and XSLT files ("Save to this Path:")
> - **Select XML filename** ("Use Filename:")
> - **Select a Filter** in the dropdown listbox (All files (\*.\*) is the default)
> - **Select a Sort method** in the Edit menu \<**Name \| Size \| Type** (default)\>
> - Press "**Write Directory to XML**" button
>   (shows up in textbox on right)
> - Press "**View in Browser**" button to view results (MSIE 5 default install location)

> The executable **vbDiR2XML** program looks like this:\
> \
> <img src="./_dobeTutAllCommon/vbDiR2XML_%20frmDobeXMLPad_Screenshot_Executable_DefaultStartup.jpg" id="vbDiR2XML_Screenshot" alt="Dobe Doinat&#39;s XML_Resume_VB Wizard, graphic only. Download the executable or the VB source code to try it yourself!" />

\
<u>NOTE</u>: **MSIE 5.0+** <u>must</u> be installed in default location to view\
**XML/XSLT** results from the "**<u>V</u>iew In Browser**" button (above).\
\
\

------------------------------------------------------------------------

------------------------------------------------------------------------

\

> |  |  |
> |:---|---:|
> | **Programming in VB 6.0** | [**Back to the Beginning of this page**](#PNA_vbDiR2XML_Help_Start) |

> The **vbDiR2XML** program may be run within the MS-VB6 Environment
>
> - [Screenshot](#vbDiR2XML_IDE_Screenshot_closeup) , in Design Mode (closeup)
> - [Screenshot](#vbDiR2XML_IDE_Screenshot) , in Design Mode (large graphic)
> - [ZIPs](#vbDiR2XML_DL) (download files)
>
> \

> The **vbDiR2XML** program within the Microsoft Visual Basic IDE looks like this:\
> \
> <img src="./_dobeTutAllCommon/vbDiR2XML_%20frmDobeXMLPad_Screenshot_VB6IDE_DesignMode.png" id="vbDiR2XML_IDE_Screenshot" alt="Dobe Doinat&#39;s vbDiR2XML, or Directory to XML, graphic only. Download the executable or the VB source code to try it yourself!" />\
> Here's a closeup of the form seen in Design Mode above:\
> \
> <img src="./_dobeTutAllCommon/vbDiR2XML_%20frmDobeXMLPad_Screenshot_VB6IDE_Cropped.jpg" id="vbDiR2XML_IDE_Screenshot_closeup" style="width:100.0%;height:100.0%" alt="Dobe Doinat&#39;s vbDiR2XML, or Directory to XML, graphic only. Download the executable or the VB source code to try it yourself!" />

\

>     The reason I made the Design mode form distinct from [how the form appears on actual startup](#vbDiR2XML_Screenshot) , changing the text of some of the controls before it is shown to the User, is merely Coder preferance. You can just as easily have the form look much like it does on startup, and leave out some of the code in the [Form_Load Event](#PNA_vbDiR2XML_Help_Form_Load).

\

------------------------------------------------------------------------

------------------------------------------------------------------------

\

> |  |  |
> |:---|---:|
> | **Known Bugs** | [**Back to the Beginning of this page**](#PNA_vbDiR2XML_Help_Start) |

>     **Every program ever written has bugs!** This program is no exception. I will list the ones I know about, together with **suggestions for improvements**. There are always many ways to do things to get the same result in programming, some are elegant, some window dressing, and some would be nice, but wait for future time and effort to go into implementation.\
> \
>     **I have some questions about certain behaviors I have observed which I do not understand**, so if someone comes upon **an answer to one of these**, **PLEASE let me know**!\
>
> - **Why**, after successfully generating the XML/XSLT file and viewing it in the browser, if you change the filter, but not the seed directory, the save directory, or the save filename, and then DON'T press the "View in Browser" button, but rather go **back to the open browser window and refresh it**, then the filter DOES NOT refresh? **I do not know why this is**. Close the browser, click on the button again, and a different result is shown in the browser!
> - I know to truly **sort by "size"** in the XSLT file, I would have to do some data conversions, because right now, it is sorting as if the value were a string, therefore: 112, 23, 3388, 4... would be a proper sort, but it would be preferable to have the same series sort like: 4, 23, 112, 3388...**I do not know how to do this.**
> - Also, when **sorting for "name"**, the result sort is definitely different than it would appear with no sort, but it is not a recognizable sequence to me. I would like to get some input on other's results and an **explanation of why the sort result appears in the order it does**.

\

------------------------------------------------------------------------

------------------------------------------------------------------------

\

> |  |  |
> |:---|---:|
> | **Improvements** (Wish List) | [**Back to the Beginning of this page**](#PNA_vbDiR2XML_Help_Start) |

>     If I ever find the time to improve on this project, I would incorporate an **external file (.*INI*} which would store settings for the program, then it could modified with a second "User Options" form**. The user could store more detail about how to write out the XSLT file for instance, to make the **font** different, the **table** different, the **border** of the table visible or invisible, or **other choices**. I leave much of this for now, to be improved upon and one day updated, on this site.\
> \
>     For instance, rewriting the code:
>
> - Using **Classes** instead of **global variables**
> - Use **.INI files** for **Persistance** of **User Options**
> - **Iteration** over all **Child SubDirectories** (option)
> - **Print**
> - **Print Preview**
> - **Integrated Help**
> - 
>
> **If you make modifications to it which you would like to share**, please send them to me,\
> \
>
> [**John "Dobe Doinat" Hartman**](mailto:dobe@eskimo.com)\
> \
>
> , and (depending on the suggestion or improvement), I will update the example on this site and share the credit with contributors, as well as my thanks.\

\

------------------------------------------------------------------------

------------------------------------------------------------------------

\

> |  |  |
> |:---|---:|
> | **vbDiR2XML ZIP Downloads** | [**Back to the Beginning of this page**](#PNA_vbDiR2XML_Help_Start) |

<div>

\

> ...\
> <img src="./_dobeTutAllCommon/open.gif" title="Explore this link!" id="_img_openButton" alt="Browser can&#39;t find image?" /> [ .ZIP download, (with complete VB 6.0 **source code**)](),  (**SIZE**) or\
> <img src="./_dobeTutAllCommon/open.gif" title="Explore this link!" id="_img_openButton" alt="Browser can&#39;t find image?" /> [ .ZIP download, (**Help Files Only**)](),  (**SIZE**) or\
> <img src="./_dobeTutAllCommon/open.gif" title="Explore this link!" id="_img_openButton" alt="Browser can&#39;t find image?" /> [ .ZIP download (**EXE**cutable only, with Readme File)](),  (**SIZE**).\
> \

</div>

> The XML file, the XSLT file as well as the VB6 source code may be freely modified for learning purposes and personal use as **Careware**. For business use, or resale, reasonable compensation will apply.\

\

------------------------------------------------------------------------

------------------------------------------------------------------------

\

> |  |  |
> |:---|---:|
> | **Source Code Introduction** | [**Back to the Beginning of this page**](#PNA_vbDiR2XML_Help_Start) |

> ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> ` '    Visual Basic Example Project: <b>'vbDiR2XML'</b>`\
> ` '`\
> ` '    My project is to create an XML file from the files`\
> ` '    (User-chosen directory listing), written to`\
> ` '    User-chosen path and filename. The resulting`\
> ` '    tree may then be viewed in a browser as XML`\
> ` '    (using an XSLT stylesheet developed to view`\
> ` '    results, as yet now implemented!).`\
> ` '`\
> ` '    Source code for this project is available from this site:`\
> ` '    Dobe Doinat 's Punny Name Archive`\
> ` '    MegaloMedia Copyright 2002`\
> ` '    John W. Hartman (Dobe Doinat)`\
> ` '    http://www.eskimo.com/~dobe/`\
> ` '    mailto://dobe@eskimo.com`\
> ` '`\
> ` '    Project name: vbDiR2XML.vbp`\
> ` '    Form object name: frmDobeXMLPad`\
> ` '    File name: frmDobeXMLPad.frm`\
> ` '`\
> ` '    Last modified: 01-21-2002`\
> ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\

\

------------------------------------------------------------------------

------------------------------------------------------------------------

\

> |  |  |
> |:---|---:|
> | **Global Variables** | [**Back to the Beginning of this page**](#PNA_vbDiR2XML_Help_Start) |

> Option Explicit\
> \
>   Dim **gstrOpenSeedPathOnly** As String\
>   Dim **gstrCurrentFilter** As String\
> \
>   Dim **gstrCurrentXML_SaveDirAndFileName** As String\
>   Dim **gstrCurrentXML_SaveDirOnly** As String\
>   Dim **gstrCurrentXML_FileNameOnly** As String\
> \
>   Dim **gstrCurrentXSLT_SaveDirAndFileName** As String\
>   Dim **gstrCurrentXSLT_SaveDirOnly** As String\
> ` ' XSLT file must have a constant value now...`\
> ` ' CONSTANT VALUE = "`**`vbDiR2XML_XSL.xsl`**\
>   Dim **gCONSTCurrentXSLT_FileNameOnly** As String\
>   Dim **gboolSortByNameFlag** As Boolean\
>   Dim **gboolSortByTypeFlag** As Boolean\
>   Dim **gboolSortBySizeFlag** As Boolean\
> \
> ` ' Array of '`**`Patterns`**` ' or 'Filters' for the Filter ListBox.`\
>   Private **Patterns** () As String

\

------------------------------------------------------------------------

------------------------------------------------------------------------

\

> |  |  |
> |:---|---:|
> | **Form_Load** | [**Back to the Beginning of this page**](#PNA_vbDiR2XML_Help_Start) |

> ` ''   '   '   '   '   '   '   '   '   '   '   '   '   '   '   '`\
> ` '' Form_Load() is where it all starts!`\
> ` ''   '   '   '   '   '   '   '   '   '   '   '   '   '   '   '`\
> `Private Sub Form_Load()`\
> ` ' Used for filtering extension of files in seed directory`\
>   Dim **file_pattern** As String\
> \
> ` ' Initialize default XSLT Flags!`\
>     **gboolSortByNameFlag** = False\
>     **gboolSortByTypeFlag** = True\
>     **gboolSortBySizeFlag** = False\
> \
> ` ' Initialize menu items`\
>     **mnuSortByName.Checked** = False\
>     **mnuSortByType.Checked** = True\
>     **mnuSortBySize.Checked** = False\
> \
> ` ' Initialize the Selection controls`\
>     **drvSelect.Drive** = App.Path\
>     **dirSelect.Path** = App.Path\
>     **filSelect.Path** = App.Path\
> \
> ` ' Default on startup only! May change dir, don't change filename!`\
> ` ' The reason for this is that (until future improvement of this application),`\
> ` ' the XSLT file written to disk makes no allowances for relative paths.`\
>     **gCONSTCurrentXSLT_FileNameOnly** = "**vbDiR2XML_XSL.xsl** "\
> \
> ` ' App.Path returns the current node (directory) without the "\"`\
>     **gstrCurrentXSLT_SaveDirAndFileName** = App.Path & "\\ & \_\
>                  **gCONSTCurrentXSLT_FileNameOnly**\
> \
> ` ' `**`gstrCurrentXSLT_SaveDirOnly`**` = gstrCurrentXML_SaveDirOnly `\
> ` ' `**`gstrCurrentXSLT_SaveDirAndFileName`**` = gstrCurrentXSLT_SaveDirOnly & gCONSTCurrentXSLT_FileNameOnly `\
> \
> ` ' Initialize the filter ComboBox`\
>     **cboPatterns.Clear**\
> ` ' Calls '`[`AddPattern`](#PNA_vbDiR2XML_Help_AddPattern)`' subroutine,  Syntax: AddPattern "name", "value"`\
>     [AddPattern](#PNA_vbDiR2XML_Help_AddPattern) "All files (\*.\*)", "\*.\*"\
>     AddPattern "ASP files (\*.asp)", "\*.asp"\
>     AddPattern "AVI files (\*.avi)", "\*.avi"\
>     AddPattern "BAK files (\*.bak)", "\*.bak"\
>     AddPattern "BMP files (\*.bmp)", "\*.bmp"\
>     AddPattern "CHM files (\*.chm)", "\*.chm"\
>     AddPattern "CSS files (\*.css)", "\*.css"\
>     AddPattern "DOC files (\*.doc)", "\*.doc"\
>     AddPattern "DOT files (\*.dot)", "\*.dot"\
>     AddPattern "Executables (\*.exe)", "\*.exe"\
>     AddPattern "GIF graphics files (\*.gif)", "\*.gif"\
>     AddPattern "HTA files (\*.hta)", "\*.hta"\
>     AddPattern "HTML files (\*.htm\*)", "\*.htm\*"\
>     AddPattern "INC files (\*.inc)", "\*.inc"\
>     AddPattern "JPG graphics files (\*.jpg)", "\*.jpg"\
>     AddPattern "JavaScript files (\*.js)", "\*.js"\
>     AddPattern "MDB files (\*.mdb)", "\*.mdb"\
>     AddPattern "MID files (\*.mid)", "\*.mid"\
>     AddPattern "PDF files (\*.pdf)", "\*.pdf"\
>     AddPattern "RTF files (\*.rtf)", "\*.rtf"\
>     AddPattern "Text files (\*.txt)", "\*.txt"\
>     AddPattern "WAV files (\*.wav)", "\*.wav"\
>     AddPattern "XLS files (\*.xls)", "\*.xls"\
>     AddPattern "XSD files (\*.xsd)", "\*.xsd"\
>     AddPattern "XML files (\*.xml)", "\*.xml"\
>     AddPattern "XSL files (\*.xsl)", "\*.xsl\*"\
>     AddPattern "ZIP files (\*.zip)", "\*.zip"\
> \
> ` ' Initialize the ComboBox control to the value of the zeroth element of the array`\
> ` ' Since `**`Patterns(0) = *.*`**`, this causes value to be displayed in Run Mode.`\
> ` ' Since this causes a change to the value of the control,`\
> ` ' it launches the event `[**`cboPatterns_Click()`**](#PNA__vbDiR2XML_Help_cboPatterns_Click)` `\
>     **cboPatterns.ListIndex** = 0\
> \
> ` ' `**`The controls having their colors changed are those`**\
> ` ' `**`that the User has no control over`**`!`\
> \
> ` ' Initialize `**`filSelect`**`, color optional`\
>     With **filSelect**\
>         .BackColor = &HFFFFC0\
>         .ForeColor = 16711680\
>     End With\
> \
> ` ' Initialize `**`lblStatus`**`, color optional`\
>     With **lblStatus**\
>         .BackColor = &HFFFFC0\
>         .ForeColor = 16711680\
>     End With\
> \
> ` ' Initialize `**`lblStartDir`**`, color optional`\
>     With **lblStartDir**\
>         .BackColor = &HFFFFC0\
>         .ForeColor = 16711680\
>     End With\
> \
> ` ' Initialize `**`lblFilter`**`, color optional`\
>     With **lblFilter**\
>         .BackColor = &HFFFFC0\
>         .ForeColor = 16711680\
>     End With\
> \
> ` ' Initialize other buttons`\
>     **cmdWriteFile.Caption** = "&Write Directory to XML"\
>     **cmdExit.Caption** = "E&xit"\
>     **cmdView**.Caption = "&View in Browser"\
> \
> ` ' Initialize other labels`\
>     **lblStatus.Caption** = "Watch this space for information..."\
>     **lblTime.Caption** = Now()\
> \
> ` ' Initialize other textboxes`\
>     **txtSaveDir**.Text = App.Path\
> \
> ` ' Note: '`**`<>`**`' below means '`**`NOT EQUAL TO`**`'`\
>         If Right\$(txtSaveDir.Text, 1) **\<\> "\\** Then\
>             txtSaveDir.Text = txtSaveDir.Text **& "\\**\
>         End If\
> \
>     gstrCurrentXML_SaveDirOnly = txtSaveDir.Text\
> \
> \
> ` ' Initialize txtWriteFile and other global variables`\
>     **txtWriteFile.Text = "vbDiRXML_default.xml"**\
> \
>     **gstrCurrentXML_FileNameOnly** = **txtWriteFile.Text**\
> \
>     **gstrCurrentXML_SaveDirAndFileName** = **gstrCurrentXML_SaveDirOnly** & **gstrCurrentXML_FileNameOnly**\
> \
> ` ' Calls Sub to write XML to the screen (txtEditor)...`\
>      [**WriteFileToScreen**](#PNA_vbDiR2XML_Help_WriteFileToScreen)\
> \
> ` ' Calls Sub to write XML to a file...`\
> ` ' Also prepares `[`cmdView()`](#PNA_vbDiR2XML_Help_cmdView)` or `[`mnuViewBrowser()`](#PNA_vbDiR2XML_Help_mnuViewBrowser)` for launching MSIE (with file as URL!)`\
>     [**WriteXMLtoFile**](#PNA_vbDiR2XML_Help_WriteFileToScreen)\
> \
> ` ' Calls Sub to write stylesheet to a file, see `[`cmdView()`](#PNA_vbDiR2XML_Help_cmdView)` / `[`mnuViewBrowser()`](#PNA_vbDiR2XML_Help_mnuViewBrowser)\
>     [**WriteXSLTFile**](#PNA_vbDiR2XML_Help_WriteFileToScreen)\
> \
> End Sub\

\

------------------------------------------------------------------------

------------------------------------------------------------------------

\

> |  |  |
> |:---|---:|
> | **Controls** | [**Back to the Beginning of this page**](#PNA_vbDiR2XML_Help_Start) |

> ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> ` ''~~~~~ `**`cboPatterns_Click()`**` ~~~~~~`\
> ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> `Private Sub cboPatterns_Click()`\
>   Dim **str** As String\
> ` ' User selected a pattern. Apply it to the FileListBox.`\
> ` ' `**`filSelect.Pattern`**` = `**`Patterns`**` (`**`cboPatterns.ListIndex`**` )`\
> \
> ` ' Call Subroutine to refresh global variables...`\
>     **[RefreshFormValues](#PNA_vbDiR2XML_Help_RefreshFormValues)**\
> ` ' Submit information to the Status Bar label...`\
> ` '    `**`lblStatus.Caption`**` = "Selecting a filter will effect what is written to the XML file."`\
> \
> ` ' Submit information to the Status Bar label...`\
>     If **gstrCurrentFilter** \<\> "\*.\*" Then\
>         **str** = "You have chosen the filter type: " & **gstrCurrentFilter** & " ..."\
>     Else\
>         **str** = "You have chosen the default filter type: " & **gstrCurrentFilter** & ", which means to filter for ALL of the files in the 'Seed' or 'Query' directory."\
>     End If\
> \
>     **lblStatus.Caption** = **str**\
> \
> End Sub\

\

------------------------------------------------------------------------

------------------------------------------------------------------------

\

> ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> ` ''~~~~~ `**`dirSelect_Change()`**` ~~~~~~`\
> ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> `Private Sub `**`dirSelect_Change()`**` `\
> \
> ` ' The user selected a new directory. Tell the file list.`\
>     **filSelect.Path** = **dirSelect.Path**\
> \
> ` ' This should always be true! This is for the first time through`\
> ` ' This statement also occurs in the Refresh Sub`\
>     **gstrOpenSeedPathOnly** = **dirSelect.Path**\
> \
> ` ' Initialize Global Path, File and Filter String variables`\
>     **[RefreshFormValues](#PNA_vbDiR2XML_Help_RefreshFormValues)**\
> \
> ` ' Submit information to the Status Bar label...`\
>      **lblStatus.Caption** = "Refreshed file list after changing directory"\
> \
> End Sub\

\

------------------------------------------------------------------------

------------------------------------------------------------------------

\

> ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> ` ''~~~~~ `**`drvSelect_Change()`**` ~~~~~~`\
> ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> `Private Sub `**`drvSelect_Change()`**` `\
>   Static ignore_changes As Boolean\
> \
>     If ignore_changes Then Exit Sub\
> \
>     On Error GoTo DriveError\
> ` ' User selected a new drive. Tell the directory list.`\
>     **dirSelect.Path** = **drvSelect.Drive**\
> \
> ` ' Submit information to the Status Bar label...`\
>     **lblStatus.Caption** = "A new drive was selected!"\
> \
>     Exit Sub\
> \
> DriveError:\
> `' Reselect the old drive.`\
>     Beep\
>     ignore_changes = True\
>     **drvSelect.Drive** = **dirSelect.Path**\
>     ignore_changes = False\
> \
> ` ' Submit information to the Status Bar label...`\
>     **lblStatus.Caption** = "If the new selected drive fails, it will revert back to the previously selected drive!"\
> \
> End Sub\

\

------------------------------------------------------------------------

------------------------------------------------------------------------

\

> ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> ` '~~~~~ `**`filSelect_Click()`**` ~~~~~~`\
> ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> `Private Sub `**`filSelect_Click()`**` `\
> ` ' User selected a file. Don't do anything!`\
> \
> ` ' Submit information to the Status Bar label...`\
>     **lblStatus.Caption** = "This program only displays a list of the files in the chosen subdirectory, it will not display the file. Try opening Notepad from the menu."\
> End Sub\

\

------------------------------------------------------------------------

------------------------------------------------------------------------

\

> |  |  |
> |:---|---:|
> | **Events** | [**Back to the Beginning of this page**](#PNA_vbDiR2XML_Help_Start) |

> ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> ` ''~~~~~ Timer1_Timer() ~~~~~~`\
> ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> `Private Sub Timer1_Timer()`\
> ` ' Should not submit timer information to the Status Bar label control, `\
> ` ' because it would overwrite all other status messages every second!`\
> \
> `' ALTERNATE: lblTime.Caption = Format(Now, "`*`d-mmmm h:mm`*`")`\
>     **lblTime.Caption = Now()**\
> End Sub\

> `' `<u>`Note`</u>`: To print formatted dates and times, use the format function with symbols representing date and time. (Examples assume Regional Settings Dialog Box of the Windows Control Panel is set to "English(United States)". `\
> `' `\
>
> |                                        |                        |
> |:---------------------------------------|:-----------------------|
> | **' Format() Function** (Syntax)       | **Result**             |
> | ' Format(Now, "*m/d/yy*")              | 3/17/02                |
> | ' Format(Now, "*dddd, mmmm dd, yyyy*") | Sunday, March 17, 2002 |
> | ' Format(Now, "*d-mmm*")               | 17-Mar                 |
> | ' Format(Now, "*mmmm-yy*")             | March-02               |
> | ' Format(Now, "*hh:mm* AM/PM")         | 05:23 AM               |
> | ' Format(Now, "*h:mm:ss* A/P")         | 5:23:00 A              |
> | ' Format(Now, "*d-mmmm h:mm*")         | 17-March 7:18          |
>
> \
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > |  |  |
> > |:---|---:|
> > | Subroutines and Functions | [Back to the Beginning of this page](#PNA_vbDiR2XML_Help_Start) |
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` ''~~~~~ AddPattern(pattern_name, pattern_value) ~~~~~~`\
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub AddPattern(ByVal pattern_name As String, ByVal pattern_value As String)`\
> > \
> > ` ' Add a pattern to the ComboBox and pattern list.`\
> >     cboPatterns.AddItem pattern_name\
> >     ReDim Preserve Patterns (0 To cboPatterns.NewIndex)\
> >     Patterns (cboPatterns.NewIndex) = pattern_value\
> > End Sub\
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` '~~~~~ RefreshFormValues() ~~~~~~`\
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub RefreshFormValues()`\
> >   Dim file_pattern As String\
> >   Dim strOld As String\
> > \
> >         If gstrCurrentXML_FileNameOnly = "" Then\
> > ` ' User can change this later...`\
> >             gstrCurrentXML_FileNameOnly = "vbDiRXML_default.xml"\
> >             Else\
> > ` ' Note: '<>' below means 'NOT EQUAL TO'`\
> >                If (txtWriteFile.Text \<\> "vbDiR2XML_default.xml") Then\
> > ` ' User already did change this...`\
> >                    gstrCurrentXML_FileNameOnly = txtWriteFile.Text\
> >                End If\
> >         End If\
> > \
> >         If gstrCurrentXML_SaveDirOnly = "" Then\
> >             gstrCurrentXML_SaveDirOnly = App.Path\
> >                     If Right\$(gstrCurrentXML_SaveDirOnly , 1) \<\> "\\ Then\
> >                         gstrCurrentXML_SaveDirOnly = gstrCurrentXML_SaveDirOnly & "\\\
> >                     End If\
> >             Else\
> > ` ' User already did change this...!`\
> > ` ' Note: '<>' below means 'NOT EQUAL TO'`\
> >                If (txtSaveDir.Text \<\> App.Path) Then\
> >                    gstrCurrentXML_SaveDirOnly = txtSaveDir.Text\
> >                     If Right\$(gstrCurrentXML_SaveDirOnly , 1) \<\> "\\ Then\
> >                         gstrCurrentXML_SaveDirOnly = gstrCurrentXML_SaveDirOnly & "\\\
> >                     End If\
> >                End If\
> >         End If\
> > \
> >       gstrCurrentXML_SaveDirAndFileName = gstrCurrentXML_SaveDirOnly & gstrCurrentXML_FileNameOnly\
> > \
> > ` ' Initialize parameters: what filter or pattern is to be used?`\
> >     filSelect.Pattern = Patterns (cboPatterns.ListIndex)\
> >     file_pattern = filSelect.Pattern\
> >     gstrCurrentFilter = file_pattern\
> > \
> > ` ' Someday, someone could implement it so that the User could enter`\
> > ` ' non-standard file extensions, but this label must then be a textbox!`\
> >     lblFilter.Caption = gstrCurrentFilter\
> > \
> > ` ' XSLT file must have a constant value now...`\
> > ` 'gCONSTCurrentXSLT_FileNameOnly = CONSTANT VALUE = "vbDiR2XML_XSL.xsl "`\
> > \
> > ` ' Refresh "gstrCurrentXSLT_SaveDirAndFileName "...`\
> >     gstrCurrentXSLT_SaveDirOnly = gstrCurrentXML_SaveDirOnly            '(IDENTITY)\
> >     gstrCurrentXSLT_SaveDirAndFileName = gstrCurrentXSLT_SaveDirOnly & gCONSTCurrentXSLT_FileNameOnly\
> > \
> > ` ' Refresh "gstrCurrentXSLT_SaveDirOnly "...`\
> > ` ' gstrCurrentXML_SaveDirOnly = gstrCurrentXSLT_SaveDirOnly      '(IDENTITY)`\
> > \
> > ` ' Note: '<>' below means 'NOT EQUAL TO'`\
> >         If Right\$(gstrCurrentXSLT_SaveDirOnly , 1) \<\> "\\ Then\
> >             gstrCurrentXSLT_SaveDirOnly = gstrCurrentXSLT_SaveDirOnly & "\\\
> >         End If\
> > \
> > \
> > End Sub\
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` '~~~~~ `**`WriteFileToScreen`**` Subroutine ~~~~~~`\
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub `**`WriteFileToScreen`**` ()`\
> >   Dim **i** As Integer\
> >   Dim **start_dir** As String\
> >   Dim **file_pattern** As String\
> >   Dim **strTemp** As String\
> >   Dim **files()** As String           'array of files (without path)\
> >   Dim **filesTemp()** As String       'array of files (with path)   ' FIXED BUG!!!\
> >   Dim **file_name** As String\
> >   Dim **txtFileLoop** As String\
> >   Dim **strCurrentFileType** As String\
> >   Dim **str2** As String\
> >   Dim **total_size** As Long\
> >   Dim **num_files** As Long\
> >   Dim **file_size** As Long\
> >   Dim **file_size_Kb** As Double     ' To create KBytes instead of Bytes in files loop\
> >   Dim **filNum** As Integer\
> >   Dim **totalFiles_size** As Double\
> > \
> > ` ' Initialize parameters: what path is to be used for what object at what time?`\
> > ` ' This should always be true!`\
> >     gstrOpenSeedPathOnly = dirSelect.Path\
> > \
> > ` ' Note: '<>' below means 'NOT EQUAL TO'`\
> >         If Right\$(gstrOpenSeedPathOnly , 1) \<\> "\\ Then\
> >             gstrOpenSeedPathOnly = gstrOpenSeedPathOnly & "\\\
> >         End If\
> > \
> >     start_dir = gstrOpenSeedPathOnly\
> > \
> > ` ' Note: '<>' below means 'NOT EQUAL TO'`\
> >         If Right\$(start_dir, 1) \<\> "\\ Then\
> >             start_dir = start_dir & "\\\
> >         End If\
> > \
> > ` ' Initialize parameters: what filter or pattern is to be used?`\
> > ` '  Here I should check to see value of textbox? Or change textbox to listbox?`\
> > \
> >     filSelect.Pattern = Patterns (cboPatterns.ListIndex)\
> >     file_pattern = filSelect.Pattern\
> > \
> > ` ' Only temporarily! Reset later!`\
> > ` ' `**`Hover the mouse over 'vbHourglass'`**` to see additional information`\
> >     Screen.MousePointer = <span class="cursor_wait" title="One way of optimizing perceived speed of a lengthy subroutine for the user is to make the mouse into an hourglass until the routine finishes. During this time, 'DoEvents' should be issued to allow other programs, windows and functions of the Operating System to make use of the CPU. At the very minimum, display the wait cursor to indicate the delay by setting the forms MousePointer property to 'vbHourglass' as a Progress Indicator."> vbHourglass </span>\
> > \
> > ` ' Don't tie up the computer!`\
> > ` ' `**`Hover the mouse over 'DoEvents'`**` to see additional information`\
> >      <span class="cursor_wait" title="For the User's sake, the programmer must be aware of which particular task may take a very long time. The 'DoEvents' function also provides a convenient way to allow a task to be canceled. For example, in code where a 'Run' button may change to a 'Cancel' button when it is clicked.  The clicking on 'Cancel' could interrupt the task it is performing gracefully, and change back into a 'Run' button again."> DoEvents </span>\
> > \
> > ` ' Search for matching files in this directory.  Get the first matching file.`\
> > ` '    file_name = gstrOpenPath & Dir$(start_dir & file_pattern , vbNormal)    '????`\
> >     file_name = Dir\$(start_dir & file_pattern , vbNormal)\
> > \
> >     Do While Len(file_name) \> 0\
> > ` ' Add the file to the files array.`\
> >             num_files = num_files + 1\
> > ` ' Echo filename to status bar ' "File to array: " &`\
> >             lblStatus.Caption = file_name\
> > \
> >      <span class="cursor_no_wait" title="'Dynamic Array' syntax: 'ReDim DynArray(X + 1)'"> ReDim Preserve **files**(1 To num_files) </span>\
> > \
> >             **files**(num_files) = file_name\
> > \
> > ` ' Get the next matching file.`\
> >         file_name = Dir\$(, vbNormal)\
> >     Loop\
> > \
> > ` '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`\
> > ` ' Build XML string to write to txtResult.Text`\
> >         strTemp = "\<?xml version='1.0' encoding='ISO8859-1' standalone = 'no'?\>" & vbCrLf & vbCrLf\
> > ` ' Copy elements to string, ended by CR LFs`\
> >         strTemp = strTemp & "  \<!-- A copy of the source code for this project --\>" & vbCrLf\
> >         strTemp = strTemp & "  \<!-- is available from www.eskimo.com/~dobe/ --\>" & vbCrLf\
> >         strTemp = strTemp & "  \<!-- DiR2XML is VB 6 Project of Dobe Doinat --\>" & vbCrLf\
> >         strTemp = strTemp & "  \<!-- 'John W. Hartman' \<dobe@eskimo.com\> --\>" & vbCrLf & vbCrLf\
> > \
> > ` ' `**`Change XSLT file name below`**`     `<u>`HARD-CODED: 'vbDiR2XML_XSL.xsl`</u>`'!!!`\
> >         strTemp = strTemp & "  \<?xml-stylesheet type='text/xsl' href='vbDiR2XML_XSL.xsl' ?\>" & vbCrLf\
> >         strTemp = strTemp & "  \<doc\>" & vbCrLf\
> >         strTemp = strTemp & "    \<title\>Generated by vbDiR2XML\</title\>" & vbCrLf & vbCrLf\
> >         strTemp = strTemp & "   \<dir id = '" & gstrOpenSeedPathOnly & "'"\
> >         strTemp = strTemp & " filter =   '" & gstrCurrentFilter & "'\>" & vbCrLf & vbCrLf\
> > ` '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`\
> > \
> > ` ' Loop through all the files...`\
> >      <span class="cursor_no_wait" title="'Dynamic Array' syntax: 'ReDim DynArray(X + 1)'"> ReDim Preserve **filesTemp**(1 To num_files) </span>\
> > \
> > ` ' ~~~ BEGIN:    FOR/NEXT LOOP    FOR FILE NAMES & SIZES ~~~`\
> >             For **i** = 1 To **num_files**\
> > \
> >                **filesTemp**(i) = gstrOpenSeedPathOnly & files(i)           `' FIXED BUG! 01/13/02`\
> > \
> >                file_size = FileLen(filesTemp(i))\
> > \
> > ` ' Keep track of files' sizes total in `**`KiloBytes`**` using `\
> > ` ' `**`file_size_Kb`**` which `**`1/1000`**` of `**`file_size`**\
> > \
> > ` ' `**`file_size`**` is `**`LONG`**` while `**`file_size_Kb`**` is `**`Double`**` so use '`**`CDbl`**`' `\
> > ` ' which converts or 'casts' from one data type to the other`\
> > \
> > ` ' Note '`**`Format()`**`' function syntax!`\
> > \
> >                  If file_size \> 0 Then                                                   `' NO DIVIDE BY ZERO!`\
> >                     file_size_Kb = **CDbl**(file_size / 1000)\
> >                     file_size_Kb = **Format**(file_size_Kb, "00000.00")     `' 2 DECIMAL PLACES`\
> >                 End If\
> > \
> > ` ' strCurrentFileType is used for "<file type='' ...> below"`\
> > ` ' Note '`**`UCase()`**`' or UPPERCASE function syntax!`\
> >         strCurrentFileType = **UCase**(**Right\$**(files(i), 3))\
> >             If **Left\$**(strCurrentFileType, 1) = "." Then\
> > ` ' There's at least one file extension with less than 3 chars...!`\
> >                 strCurrentFileType = Right\$(strCurrentFileType, 2) & " "\
> >                 **Beep**     ` ' Optional`\
> >             End If\
> > \
> >                txtFileLoop = txtFileLoop & "     \<file type='" & strCurrentFileType & "' size='" & file_size_Kb & " Kb'\> " & files(i) & " \</file\>" & vbCrLf\
> > \
> > ` ' totalFiles_size appears below, so format for Kilobytes ...`\
> >                totalFiles_size = totalFiles_size + file_size_Kb\
> >                totalFiles_size = Format(totalFiles_size, "00000.00")\
> > \
> >             Next **i**\
> > ` ' ~~~ END:    FOR/NEXT LOOP    FOR FILE NAMES & SIZES ~~~`\
> > \
> > ` ' Copy header elements and file elements to string, ended by CR LF`\
> >         strTemp = strTemp & txtFileLoop & vbCrLf\
> >         strTemp = strTemp & "    \<totalBytes format='Kb'\> " & totalFiles_size & " \</totalBytes\>" & vbCrLf\
> > ` ' "num_files" already has how many files are in the directory (same as array)`\
> >         strTemp = strTemp & "    \<totalFiles\> " & num_files & " \</totalFiles\>" & vbCrLf\
> > ` ' Copy end </dir> element to string, ended by CR LF`\
> >         strTemp = strTemp & "   \</dir\>" & vbCrLf & vbCrLf\
> >         strTemp = strTemp & "    \<thisFileInfo" & vbCrLf\
> >         strTemp = strTemp & "            seed_dir='" & gstrOpenSeedPathOnly & "' " & vbCrLf\
> >         strTemp = strTemp & "            this_file_dir='" & gstrCurrentXML_SaveDirOnly & "' " & vbCrLf\
> >         strTemp = strTemp & "            this_file_name='" & gstrCurrentXML_FileNameOnly & "' " & vbCrLf\
> >         strTemp = strTemp & "            this_file_generated='" & **Now()** & "'\> " & vbCrLf\
> >         strTemp = strTemp & "        " & gstrCurrentXML_SaveDirAndFileName & vbCrLf\
> >         strTemp = strTemp & "    \</thisFileInfo\> " & vbCrLf\
> > \
> > ` ' Copy end </doc> element to string, ended by CR LF`\
> >         strTemp = strTemp & "  \</doc\>" & vbCrLf & vbCrLf\
> > \
> > ` ' Reset Mouse Pointer after finished with query and screen write!`\
> >     Screen.MousePointer = vbDefault\
> > \
> >     **txtEditor.Text = strTemp**\
> > \
> > ` ' Submit information to the Status Bar label...`\
> >      lblStatus.Caption = "Finished writing string for XML to screen"\
> > \
> > \
> > End Sub\
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` '~~~~~ WriteXMLtoFile () ~~~~~~`\
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub WriteXMLtoFile ()`\
> >   Dim FNum As Integer\
> > \
> > ` ' Only temporarily! Reset later!`\
> >     Screen.MousePointer = <span class="cursor_wait" title="Here again, we're simply showing that the computer is busy. Reset later when function returns."> vbHourglass </span>\
> > \
> >      lblStatus.Caption = "The XML file is being generated in the " & \_\
> >          gstrCurrentXML_SaveDirOnly & \_\
> >          " directory, using the filename of " & \_\
> >          gstrCurrentXML_FileNameOnly & \_\
> >         ". How long this takes depends on how many files are in the seed directory and the filter used."\
> > \
> > ` ' Don't tie up the computer!`\
> > ` ' `**`Hover the mouse over 'DoEvents'`**` to see additional information`\
> >      <span class="cursor_wait" title="For the User's sake, the programmer must be aware of which particular task may take a very long time. The 'DoEvents' function also provides a convenient way to allow a task to be canceled. For example, in code where a 'Run' button may change to a 'Cancel' button when it is clicked.  The clicking on 'Cancel' could interrupt the task it is performing gracefully, and change back into a 'Run' button again."> DoEvents </span>\
> > \
> > \
> > On Error GoTo FileErrorCancel\
> >     FNum = FreeFile\
> >     Open gstrCurrentXML_SaveDirAndFileName For Output As \#1\
> >     Print \#FNum, txtEditor.Text\
> >     Close \#FNum\
> > \
> > ` ' Reset Mouse Pointer after finished with query and screen write!`\
> >     Screen.MousePointer = vbDefault\
> > \
> > \
> > ` ' Submit information to the Status Bar label...`\
> >      lblStatus.Caption = "The XML file generated has been written to the " \_\
> >         & gstrCurrentXML_SaveDirOnly & " directory, using the filename of " & gstrCurrentXML_FileNameOnly & \_\
> >         " and can now be viewed in the MSIE Browser using the button above"\
> > \
> >     Exit Sub\
> > ` '`\
> > FileErrorCancel:\
> >     If Err.Number = cdlCancel Then\
> >         Exit Sub\
> >     End If\
> >     MsgBox "Unknown error while saving file " & gstrCurrentXML_SaveDirAndFileName\
> > \
> > ` ' Reset Mouse Pointer after finished with query and screen write!`\
> >     Screen.MousePointer = vbDefault\
> > \
> > End Sub\
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` '~~~~~ WriteXSLTFile Subroutine ~~~~~~`\
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub WriteXSLTFile ()`\
> >   Dim strXSLT As String\
> >   Dim file_pattern As String\
> >   Dim FNum As Integer\
> > ` '  Dim txt As String`\
> > ` '    gboolSortByNameFlag = False`\
> > ` '    gboolSortByTypeFlag = True     'DEFAULT`\
> > ` '    gboolSortBySizeFlag = False`\
> > \
> >    strXSLT = ""\
> > ` '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`\
> > \
> >     strXSLT = strXSLT & "\<?xml version='1.0'?\>" & vbCrLf\
> >     strXSLT = strXSLT & "\<!-- Comment --\>" & vbCrLf\
> >     strXSLT = strXSLT & "\<xsl:stylesheet" & vbCrLf\
> >     strXSLT = strXSLT & "       xmlns:xsl='http://www.w3.org/TR/WD-xsl'" & vbCrLf\
> >     strXSLT = strXSLT & "       xmlns='http://www.w3.org/TR/REC-html40'" & vbCrLf\
> >     strXSLT = strXSLT & "       result-ns=''\>" & vbCrLf\
> >     strXSLT = strXSLT & "  \<xsl:template match='/'\>" & vbCrLf\
> >     strXSLT = strXSLT & "  " & vbCrLf\
> >     strXSLT = strXSLT & "    \<html\>" & vbCrLf\
> >     strXSLT = strXSLT & "      \<head\>" & vbCrLf\
> >     strXSLT = strXSLT & "        \<title\>\<xsl:value-of select='doc/title' /\>\</title\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \<style type='text/css'\> " & vbCrLf\
> >     strXSLT = strXSLT & "         body {background:#f0ffff; font-family: ariel \| helvetica \| serif;} " & vbCrLf\
> >     strXSLT = strXSLT & "         blockquote {font-size:100%; color:darkblue; margin-left:10%; margin-right:10%;} " & vbCrLf\
> >     strXSLT = strXSLT & "         table {background:#f0ffff;} " & vbCrLf\
> >     strXSLT = strXSLT & "         h1.Name {font-size:150%; color:blue;} " & vbCrLf\
> >     strXSLT = strXSLT & "         tr.tableheader {font-size:150%; color:blue; background:#f0ffff} " & vbCrLf\
> >     strXSLT = strXSLT & "         td.tablecol {font-size:120%; color:blue; background:#f0ffff;} " & vbCrLf\
> >     strXSLT = strXSLT & "         td.tableinfo {font-size:100%; color:blue; background:#f0ffff;} " & vbCrLf\
> >     strXSLT = strXSLT & "       \</style\>  " & vbCrLf\
> >     strXSLT = strXSLT & "      \</head\>" & vbCrLf\
> >     strXSLT = strXSLT & "      " & vbCrLf\
> >     strXSLT = strXSLT & "      \<body\>" & vbCrLf\
> >     strXSLT = strXSLT & "        \<!-- Begin XSL:FOR-EACH Element for FILE  --\>" & vbCrLf\
> >     strXSLT = strXSLT & "        \<xsl:for-each select='doc/thisFileInfo'\> \<br /\>  " & vbCrLf\
> >     strXSLT = strXSLT & "        \<h1 class='Name'\>\<u\>" & vbCrLf\
> >     strXSLT = strXSLT & "        \<xsl:value-of select='././@this_file_dir/text()' /\> " & vbCrLf\
> >     strXSLT = strXSLT & "        \<xsl:value-of select='././@this_file_name/text()' /\>\</u\>" & vbCrLf\
> >     strXSLT = strXSLT & "               \<i\>(vbDiR2XML-generated)\</i\> \</h1\>" & vbCrLf\
> >     strXSLT = strXSLT & "        \</xsl:for-each\>" & vbCrLf\
> >     strXSLT = strXSLT & "        \<!-- End XSL:FOR-EACH Element   --\>" & vbCrLf\
> >     strXSLT = strXSLT & "       " & vbCrLf\
> >     strXSLT = strXSLT & "        \<hr width='80%' align='center' color='blue' /\>" & vbCrLf\
> >     strXSLT = strXSLT & "        " & vbCrLf\
> >     strXSLT = strXSLT & "       \<table border='0' width='95%' align='center'\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \<tr\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \<td width='35%' class='tableinfo' align='right'\>'Seed' directory:" & vbCrLf\
> >     strXSLT = strXSLT & "       \</td\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \<td width='65%' class='tableinfo' align='left'\>  \<b\>\<xsl:value-of select='doc/thisFileInfo/@seed_dir/text()' /\>\</b\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \</td\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \</tr\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \<tr\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \<td width='35%' class='tableinfo' align='right'\>Generated:" & vbCrLf\
> >     strXSLT = strXSLT & "       \</td\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \<td width='65%' class='tableinfo' align='left'\>   \<b\>\<xsl:value-of select='doc/thisFileInfo/@this_file_generated/text()' /\>\</b\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \</td\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \</tr\>" & vbCrLf\
> > \
> >     strXSLT = strXSLT & "       \<tr\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \<td width='35%' class='tableinfo' align='right'\>View XSLT stylesheet:" & vbCrLf\
> >     strXSLT = strXSLT & "       \</td\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \<td width='65%' class='tableinfo' align='left'\>   " & vbCrLf\
> > \
> >     strXSLT = strXSLT & "       \<a href='" & gstrCurrentXSLT_SaveDirAndFileName & "'\> \<b\>" & gstrCurrentXSLT_SaveDirAndFileName & "\</b\>\</a\> " & vbCrLf\
> >     strXSLT = strXSLT & "       \</td\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \</tr\>" & vbCrLf\
> > \
> >     strXSLT = strXSLT & "       \<tr\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \<td width='35%' class='tableinfo' align='right'\>Sorted by:" & vbCrLf\
> >     strXSLT = strXSLT & "       \</td\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \<td width='75%' class='tableinfo' align='left'\>   \<b\>" & vbCrLf\
> > \
> >     If (gboolSortByNameFlag = True) Then\
> >         strXSLT = strXSLT & "        File Name   " & vbCrLf\
> >     Else\
> >         If (gboolSortByTypeFlag = True) Then\
> >             strXSLT = strXSLT & "        File Type (Extension)   " & vbCrLf\
> >         Else\
> >             If (gboolSortBySizeFlag = True) Then\
> >                 strXSLT = strXSLT & "        File Size   " & vbCrLf\
> >             Else    ' write at least one of them!\
> >                 strXSLT = strXSLT & "        File Size   " & vbCrLf\
> >             End If\
> >         End If\
> >     End If\
> > \
> >     strXSLT = strXSLT & "       \</b\>" & vbCrLf\
> > \
> >     strXSLT = strXSLT & "       \</td\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \</tr\>" & vbCrLf\
> > \
> >     strXSLT = strXSLT & "       \<tr\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \<td width='35%' class='tableinfo' align='right'\>Filter for selected files:" & vbCrLf\
> >     strXSLT = strXSLT & "       \</td\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \<td width='65%' class='tableinfo' align='left'\>   \<b\>" & vbCrLf\
> >     strXSLT = strXSLT & "        \<xsl:value-of select='doc/dir/@filter/text()' /\>\</b\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \</td\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \</tr\>" & vbCrLf\
> > \
> >     strXSLT = strXSLT & "       \<tr\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \<td width='35%' class='tableinfo' align='right'\>Total size of selected files:" & vbCrLf\
> >     strXSLT = strXSLT & "       \</td\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \<td width='65%' class='tableinfo' align='left'\>   \<b\>" & vbCrLf\
> >     strXSLT = strXSLT & "        \<xsl:value-of select='doc/dir/totalBytes/text()' /\>" & vbCrLf\
> >     strXSLT = strXSLT & "        \<xsl:value-of select='doc/dir/totalBytes/@format/text()' /\>\</b\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \</td\>" & vbCrLf\
> >     strXSLT = strXSLT & "       \</tr\>" & vbCrLf\
> > \
> >     strXSLT = strXSLT & "       \</table\>" & vbCrLf\
> >     strXSLT = strXSLT & "        " & vbCrLf\
> >     strXSLT = strXSLT & "        \<hr width='80%' align='center' color='blue' /\>\<br /\>\<br /\>" & vbCrLf\
> >     strXSLT = strXSLT & " " & vbCrLf\
> >     strXSLT = strXSLT & "       \<table border='0' width='90%' align='center' \>" & vbCrLf\
> >     strXSLT = strXSLT & "        \<thead\>" & vbCrLf\
> >     strXSLT = strXSLT & "        \<tr align='left' class='tableheader'\>" & vbCrLf\
> >     strXSLT = strXSLT & "         \<td align='left' valign='top' width='50%'\>\<b\>\<u\>Name\</u\>\</b\>   " & vbCrLf\
> >     strXSLT = strXSLT & "         \</td\>" & vbCrLf\
> >     strXSLT = strXSLT & "         " & vbCrLf\
> >     strXSLT = strXSLT & "         \<td align='left' valign='top' width='25%'\>\<b\>\<u\>Type\</u\>\</b\>  " & vbCrLf\
> >     strXSLT = strXSLT & "         \</td\>" & vbCrLf\
> >     strXSLT = strXSLT & "         " & vbCrLf\
> >     strXSLT = strXSLT & "         \<td align='left' valign='top' width='25%'\>\<b\>\<u\>Size\</u\>\</b\>  " & vbCrLf\
> >     strXSLT = strXSLT & "         \</td\>" & vbCrLf\
> >     strXSLT = strXSLT & "        \</tr\>" & vbCrLf\
> >     strXSLT = strXSLT & "        \</thead\>" & vbCrLf\
> >     strXSLT = strXSLT & "       " & vbCrLf\
> >     strXSLT = strXSLT & "        \<!-- Begin XSL:FOR-EACH Element for FILE  --\>" & vbCrLf\
> > \
> >     If (gboolSortByNameFlag = True) Then\
> >         strXSLT = strXSLT & "        \<xsl:for-each select='doc/dir/file' order-by='+@name'\>   " & vbCrLf\
> >     Else\
> >         If (gboolSortByTypeFlag = True) Then\
> >             strXSLT = strXSLT & "        \<xsl:for-each select='doc/dir/file' order-by='+@type'\>   " & vbCrLf\
> >         Else\
> >             If (gboolSortBySizeFlag = True) Then\
> >                 strXSLT = strXSLT & "        \<xsl:for-each select='doc/dir/file' order-by='+@size'\>   " & vbCrLf\
> >             Else    ' write at least one of them!\
> >                 strXSLT = strXSLT & "        \<xsl:for-each select='doc/dir/file' order-by='+@type'\>   " & vbCrLf\
> >             End If\
> >         End If\
> >     End If\
> > \
> >     strXSLT = strXSLT & "       " & vbCrLf\
> >     strXSLT = strXSLT & "        \<tr\>" & vbCrLf\
> >     strXSLT = strXSLT & "         \<td align='left' valign='top' width='50%' class='tablecol'\>" & vbCrLf\
> >     strXSLT = strXSLT & "         \<xsl:value-of select='././text()' /\>    " & vbCrLf\
> >     strXSLT = strXSLT & "         \</td\>" & vbCrLf\
> >     strXSLT = strXSLT & "         " & vbCrLf\
> >     strXSLT = strXSLT & "         \<td align='left' valign='top' width='25%' class='tablecol'\>" & vbCrLf\
> >     strXSLT = strXSLT & "         \<xsl:value-of select='././@type/text()' /\>  " & vbCrLf\
> >     strXSLT = strXSLT & "         \</td\>" & vbCrLf\
> >     strXSLT = strXSLT & "         " & vbCrLf\
> >     strXSLT = strXSLT & "         \<td align='left' valign='top' width='25%' class='tablecol'\>" & vbCrLf\
> >     strXSLT = strXSLT & "         \<xsl:value-of select='././@size/text()' /\>  " & vbCrLf\
> >     strXSLT = strXSLT & "         \</td\>" & vbCrLf\
> >     strXSLT = strXSLT & "         " & vbCrLf\
> >     strXSLT = strXSLT & "        \</tr\>" & vbCrLf\
> >     strXSLT = strXSLT & "        \</xsl:for-each\>" & vbCrLf\
> >     strXSLT = strXSLT & "        \<!-- End XSL:FOR-EACH Element   --\>" & vbCrLf\
> >     strXSLT = strXSLT & "        " & vbCrLf\
> >     strXSLT = strXSLT & "       \</table\>" & vbCrLf\
> >     strXSLT = strXSLT & "       " & vbCrLf\
> >     strXSLT = strXSLT & "        \<hr width='80%' align='center' color='blue' /\>" & vbCrLf\
> >     strXSLT = strXSLT & "              " & vbCrLf\
> >     strXSLT = strXSLT & "    \<blockquote\>" & vbCrLf\
> >     strXSLT = strXSLT & "    vbDiR2XML is a Visual Basic application written by Dobe Doinat, " & vbCrLf\
> >     strXSLT = strXSLT & "    which allows a user to choose a 'seed' directory, which is then queried " & vbCrLf\
> >     strXSLT = strXSLT & "    for file names and file sizes, using a selected filter for the type of file " & vbCrLf\
> >     strXSLT = strXSLT & "    (by extension), or '\*.\*' (the default) which is ALL the files in the 'seed'" & vbCrLf\
> >     strXSLT = strXSLT & "    directory.  " & vbCrLf\
> >     strXSLT = strXSLT & "    \</blockquote\>" & vbCrLf\
> >     strXSLT = strXSLT & "    " & vbCrLf\
> >     strXSLT = strXSLT & "     \<blockquote\>" & vbCrLf\
> >     strXSLT = strXSLT & "    The result of the query is then written as XML to a PATH and FILENAME input by " & vbCrLf\
> >     strXSLT = strXSLT & "    the user. The user is then invited to view the raw XML in a text window " & vbCrLf\
> >     strXSLT = strXSLT & "    within the application, or to 'Shell' out to the " & vbCrLf\
> >     strXSLT = strXSLT & "    Microsoft Internet Explorer browser, (if it is in the standard install " & vbCrLf\
> >     strXSLT = strXSLT & "    directory) which will then parse the XML file and encounter " & vbCrLf\
> >     strXSLT = strXSLT & "    the reference to the XSL stylesheet, also generated from the application. " & vbCrLf\
> >     strXSLT = strXSLT & "    Thus, if you are viewing this in a browser, and it looks like XHTML, " & vbCrLf\
> >     strXSLT = strXSLT & "    MSIE successfully parsed the files and wrote out a result tree, serialized " & vbCrLf\
> >     strXSLT = strXSLT & "    as markup text viewed in the browser.  " & vbCrLf\
> >     strXSLT = strXSLT & "    \</blockquote\>" & vbCrLf\
> >     strXSLT = strXSLT & "    " & vbCrLf\
> >     strXSLT = strXSLT & "" & vbCrLf\
> >     strXSLT = strXSLT & "        \<hr width='80%' align='center' color='blue' /\>" & vbCrLf\
> >     strXSLT = strXSLT & "   \<!-- //Footer --\>" & vbCrLf\
> >     strXSLT = strXSLT & " \<table align='center' width='60%' cols='1' rows='1' border='0'\>" & vbCrLf\
> >     strXSLT = strXSLT & "   \<tr\>" & vbCrLf\
> >     strXSLT = strXSLT & "   \<td valign='top' align='center' width='40%' class='tablecol'\>" & vbCrLf\
> >     strXSLT = strXSLT & "   vbDiR2XML copyright 2002 \<br /\>" & vbCrLf\
> >     strXSLT = strXSLT & "   'Dobe Doinat' (dobe@eskimo.com) \<br /\>" & vbCrLf\
> >     strXSLT = strXSLT & "   Source code available from: \<br /\>" & vbCrLf\
> > \
> >     strXSLT = strXSLT & "   \<a target='\_new' href='http://www.eskimo.com/~dobe/'\>Punny Name Archive\</a\> (www.eskimo.com/~dobe/)" & vbCrLf\
> >     strXSLT = strXSLT & "   \</td\>" & vbCrLf\
> >     strXSLT = strXSLT & "  \</tr\>" & vbCrLf\
> >     strXSLT = strXSLT & " \</table\>" & vbCrLf\
> >     strXSLT = strXSLT & "" & vbCrLf\
> >     strXSLT = strXSLT & "        \<xsl:apply-templates /\>" & vbCrLf\
> >     strXSLT = strXSLT & "                " & vbCrLf\
> >     strXSLT = strXSLT & "      \</body\>" & vbCrLf\
> >     strXSLT = strXSLT & "    \</html\>" & vbCrLf\
> >     strXSLT = strXSLT & "        \<xsl:apply-templates /\>" & vbCrLf\
> >     strXSLT = strXSLT & "  \</xsl:template\>" & vbCrLf\
> >     strXSLT = strXSLT & "        " & vbCrLf\
> >     strXSLT = strXSLT & "\</xsl:stylesheet\>" & vbCrLf\
> >     strXSLT = strXSLT & ""\
> > ` '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`\
> > ` ' Only temporarily! Reset later!`\
> >     Screen.MousePointer = <span class="cursor_wait" title="Here again, we're simply showing that the computer is busy. Reset later when function returns."> vbHourglass </span>\
> > ` ' introduces gstrOpenXSLTFile...`\
> >      lblStatus.Caption = "The XSLT file has been generated in the " \_\
> >         & gstrCurrentXSLT_SaveDirOnly & " directory, using the filename of " & gCONSTCurrentXSLT_FileNameOnly\
> > ` ' Don't tie up the computer!`\
> > ` ' `**`Hover the mouse over 'DoEvents'`**` to see additional information`\
> >      <span class="cursor_wait" title="For the User's sake, the programmer must be aware of which particular task may take a very long time. The 'DoEvents' function also provides a convenient way to allow a task to be canceled. For example, in code where a 'Run' button may change to a 'Cancel' button when it is clicked.  The clicking on 'Cancel' could interrupt the task it is performing gracefully, and change back into a 'Run' button again."> DoEvents </span>\
> > \
> > ` ' Error-trapping... `\
> > On Error GoTo **FileErrorCancel**\
> > \
> > ` ' `**`FNum`**` is merely an integer... `\
> > ` ' usually 1 if the code doesn't open more than 1 file at a time.`\
> > ` ' `**`FreeFile`**` is a VB function which returns an integer... `\
> >     **FNum = FreeFile**\
> > \
> > ` ' Open() is a VB function which opens a file for append or overwriting... `\
> > ` ' Output As #1 means overwriting the file or creating it if it does not exist... `\
> >     **Open** gstrCurrentXSLT_SaveDirAndFileName For **Output As \#1**\
> >     Print \#FNum, strXSLT\
> > \
> > ` ' `**`Always close the file`**`! `\
> >     **Close \#FNum**\
> > \
> > ` ' `**`Reset Mouse Pointer`**` after finished with query and screen write!`\
> >     Screen.MousePointer = **vbDefault**\
> > \
> > \
> > ` ' Submit information to the Status Bar label...`\
> >      **lblStatus.Caption** = "The XSLT file generated has been written to the " & \_\
> >          gstrCurrentXSLT_SaveDirOnly & \_\
> >          " directory, using the filename of " & gCONSTCurrentXSLT_FileNameOnly & \_\
> >         " and will now be used when the XML file is viewed in the MSIE Browser."\
> > \
> > ` ' `**`If`**` the file is written and closed with no errors, `\
> > ` ' continue execution of program flow without entering FileErrorCancel `\
> >     **Exit Sub**\
> > \
> > ` ' `**`Else`**` do this instead if there was an error...`\
> > \
> > **FileErrorCancel:**\
> >     If Err.Number = cdlCancel Then\
> >         Exit Sub\
> >     End If\
> > \
> >     MsgBox "**Unknown error** while saving XSLT file: " & gCONSTCurrentXSLT_FileNameOnly\
> > \
> > ` ' Reset Mouse Pointer after finished with FileErrorCancel!`\
> >     Screen.MousePointer = vbDefault\
> > \
> > **End Sub**
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > |  |  |
> > |:---|---:|
> > | **Menu Items** | [**Back to the Beginning of this page**](#PNA_vbDiR2XML_Help_Start) |
>
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` ''~~~~~ `**`mnuSortByName`**` _Click() ~~~~~~`\
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub `**`mnuSortByName_Click()`**\
> >     **gboolSortByNameFlag** = True\
> >     **gboolSortByTypeFlag** = False\
> >     **gboolSortBySizeFlag** = False\
> > \
> >     **mnuSortByName.Checked** = True\
> >     **mnuSortByType.Checked** = False\
> >     **mnuSortBySize.Checked** = False\
> > \
> >     **[RefreshFormValues](#PNA_vbDiR2XML_Help_RefreshFormValues)**\
> > \
> >     **lblStatus.Caption** = "You have chosen to sort the resulting list of files by the name of the file."\
> > End Sub\
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` ''~~~~~ `**`mnuSortBySize_Click()`**` ~~~~~~`\
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub `**`mnuSortBySize_Click()`**` `\
> >     **gboolSortByNameFlag** = False\
> >     **gboolSortByTypeFlag** = False\
> >     **gboolSortBySizeFlag** = True\
> > \
> >     **mnuSortByName.Checked** = False\
> >     **mnuSortByType.Checked** = False\
> >     **mnuSortBySize.Checked** = True\
> > \
> >     **[RefreshFormValues](#PNA_vbDiR2XML_Help_RefreshFormValues)**\
> > \
> >     **lblStatus.Caption** = "You have chosen to sort the resulting list of files by the size of the file."\
> > \
> > End Sub\
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` ''~~~~~ `**`mnuSortByType_Click()`**` DEFAULT ON STARTUP!!! ~~~~~~`\
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub `**`mnuSortByType_Click()`**` `\
> >     **gboolSortByNameFlag** = False\
> >     **gboolSortByTypeFlag** = True\
> >     **gboolSortBySizeFlag** = False\
> > \
> >     **mnuSortByName.Checked** = False\
> >     **mnuSortByType.Checked** = True\
> >     **mnuSortBySize.Checked** = False\
> > \
> >     **[RefreshFormValues](#PNA_vbDiR2XML_Help_RefreshFormValues)**\
> > \
> >     **lblStatus.Caption** = "You have chosen to sort the resulting list of files by the type (extension) of the file."\
> > \
> > End Sub\
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` ''~~~~~ mnuViewBrowser_Click() ~~~~~~`\
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub mnuViewBrowser_Click()`\
> >     [**cmdView_Click**](#PNA_vbDiR2XML_Help_cmdView)\
> > \
> > End Sub\
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` '~~~~~ mnuWriteFile_Click() ~~~~~~`\
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub mnuWriteFile_Click()`\
> >     **[cmdWriteFile_Click](#PNA_vbDiR2XML_Help_cmdWriteFile)**\
> > End Sub\
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` '~~~~~ mnuHelpViewCode_Click() starts the Help file in XHTML ~~~~~~`\
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub mnuHelpViewCode_Click()`\
> >   Dim strWriteHelpFilePath As String\
> > \
> > ` ' Open Microsoft Internet Explorer with XHTML Help file as URL...`\
> > \
> > ` ' This will fail if Microsoft Internet Explorer is not installed in the default folder...`\
> > ` ' Note there are two versions of this file, one with the www.eskimo.com/~dobe/ folder,`\
> > ` ' and one for the application, with no navigation links at the top!`\
> >     strWriteHelpFilePath = "c:\progra~1\Intern~1\iexplore.exe " & \_\
> >     App.Path & "\vbDiR2XML_Help_appPath.htm"\
> > \
> > ` ' `**`Shell()`**` is used in `[**`cmdView_Click`**](#PNA_vbDiR2XML_Help_cmdView)` and `[**`mnuOLENotePad_Click`**](#PNA_vbDiR2XML_Help_mnuOLENotePad)`, and `[**`mnuHelpViewCode_Click`**](#PNA_vbDiR2XML_Help_mnuHelpViewCode)`. `\
> > ` ' Shell() is a way to open another application from within VB code.`\
> >     **Shell strWriteHelpFilePath, 1**\
> > \
> >   End Sub\
> > \
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` '~~~~~ mnuHelpAbout_Click() ~~~~~~`\
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub mnuHelpAbout_Click()`\
> > ` ' Hey, it's my only way of bragging!`\
> > \
> > ` ' `[**`frmAbout`**](#PNA_vbDiR2XML_Help_frmAboutForm)` is a completely different Form and does not effect the program, but is generally used to show copyright and contact information, as well as date and version information.`\
> >      [**frmAbout.Show**](#PNA_vbDiR2XML_Help_frmAboutForm)\
> > End Sub\
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` '~~~~~ mnuOLENotePad_Click() ~~~~~~`\
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub mnuOLENotePad_Click()`\
> >   Dim lLongType As Long\
> > ` ' Open Microsoft NotePad with no file loaded!...`\
> > ` ' Shell() will fail if Microsoft NotePad is not installed in the default folder...`\
> > ` ' `**`Shell()`**` is used in `[**`cmdView_Click`**](#PNA_vbDiR2XML_Help_cmdView)` and `[**`mnuOLENotePad_Click`**](#PNA_vbDiR2XML_Help_mnuOLENotePad)`, and `[**`mnuHelpViewCode_Click`**](#PNA_vbDiR2XML_Help_mnuHelpViewCode)`. `\
> > ` ' Shell() is a way to open another application from within VB code.`\
> >     **lLongType = Shell("c:\windows\Notepad.exe", vbNormalFocus)**\
> > End Sub\
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` '~~~~~ EditSelect_Click() ~~~~~~`\
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub mnuEditSelect_Click()`\
> > ` ' Supports the '`**`<Control><A>`**`' shortcut which is standard for 'Select All'...`\
> >     **txtEditor.SelStart** = 0\
> >     **txtEditor.SelLength** = **Len**(txtEditor.Text)\
> > End Sub\
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` ''~~~~~ FileExit_Click() ~~~~~~`\
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub mnuFileExit_Click()`\
> > ` ' See you! Come again! Bye for now!`\
> > ` ' Submit information to the Status Bar label...`\
> >     **lblStatus.Caption** = "Goodbye!"\
> >     Unload Me\
> > End Sub\
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > |  |  |
> > |:---|---:|
> > | **Buttons** | [**Back to the Beginning of this page**](#PNA_vbDiR2XML_Help_Start) |
>
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` ''~~~~~ `**`cmdWriteFile_Click()`**` ~~~~~~`\
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub `**`cmdWriteFile_Click()`**` `\
> > \
> > ` ' Write XML to Screen`\
> >     **[WriteFileToScreen](#PNA_vbDiR2XML_Help_WriteFileToScreen)**\
> > \
> > ` ' Write XML to File (prepares `**`cmdView`**` for launching MSIE with file!`\
> >     **[WriteXMLtoFile](#PNA_vbDiR2XML_Help_WriteXMLtoFile)**\
> > \
> > ` ' Submit information to the Status Bar label...`\
> > ` ' `**`gstrCurrentXML_SaveDirOnly`**` & `**`gstrCurrentXML_FileNameOnly`**` `\
> >      **lblStatus.Caption** = "The XML file generated has been written to the " & \_\
> >          **gstrCurrentXML_SaveDirOnly** & \_\
> >          " directory, using the filename of " & \_\
> >          **gstrCurrentXML_FileNameOnly** & \_\
> >          " and can now be viewed in the Microsoft Internet Explorer Browser"\
> > \
> > ` ' Call Subroutine to write XSLT stylesheet to a file for use by `[**`cmdView_Click`**](#PNA_vbDiR2XML_Help_cmdView)`...`\
> >     **[WriteXSLTFile](#PNA_vbDiR2XML_Help_WriteXSLTFile)**\
> > \
> > End Sub\
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` ''~~~~~ `**`cmdView_Click()`**` ~~~~~~`\
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` ' See also: PNA_vbDiR2XML_Help_mnuViewBrowser"`\
> > `Private Sub `**`cmdView_Click()`**\
> >   Dim strWriteFilePath As String\
> >   Dim Path As String\
> > \
> > ` ' Open Microsoft Internet Explorer with XML file as URL...`\
> > ` ' This will fail if Microsoft Internet Explorer is not installed in the default folder...`\
> > \
> >      strWriteFilePath = "c:\progra~1\Intern~1\iexplore.exe " & **gstrCurrentXML_SaveDirAndFileName**\
> > \
> > ` ' `**`Shell()`**` is used in `[**`cmdView_Click`**](#PNA_vbDiR2XML_Help_cmdView)` and `` ' Shell() is a way to open another application from within VB code.`\
> > ` ' Also see: `[**`mnuOLENotePad_Click`**](#PNA_vbDiR2XML_Help_mnuOLENotePad)`, and `[**`mnuHelpViewCode_Click`**](#PNA_vbDiR2XML_Help_mnuHelpViewCode)`.`\
> > \
> >      Shell strWriteFilePath, 1\
> > \
> > End Sub\
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` ''~~~~~ `**`cmdExit_Click()`**` ~~~~~~`\
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub `**`cmdExit_Click()`**` `\
> > \
> > ` ' See you! Come again! Bye for now!`\
> > ` ' Submit information to the Status Bar label...`\
> >      **lblStatus.Caption = "Goodbye!"\
> > \
> >      Unload Me**\
> > \
> > End Sub\
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > |  |  |
> > |:---|---:|
> > | **Text Fields** | [**Back to the Beginning of this page**](#PNA_vbDiR2XML_Help_Start) |
>
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` ''~~~~~ Private Sub `**`txtSaveDir_GotFocus()`**` ~~~~~~`\
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub `**`txtSaveDir_GotFocus()`**` `\
> > \
> >      **lblStatus.Caption** = "Type in where you would like to save the XML file. It is currently the " & \_\
> >          **gstrCurrentXML_SaveDirOnly** & \_\
> >          " directory. This same directory will be used to write the XSLT file, (normally written to the same directory as XML)."\
> > \
> > End Sub\
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` ''~~~~~ `**`txtSaveDir_LostFocus()`**` ~~~~~~`\
> > ` ''    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub `**`txtSaveDir_LostFocus()`**` `\
> > \
> > ` ' `**`NOTE that User supplied their own Save Dir!`**\
> >      gstrCurrentXML_SaveDirOnly = txtSaveDir.Text\
> >     gstrCurrentXSLT_SaveDirOnly = gstrCurrentXML_SaveDirOnly     ` ' (IDENTITY)`\
> > \
> >         If Right\$(gstrCurrentXML_SaveDirOnly , 1) \<\> "\\ Then\
> >             gstrCurrentXML_SaveDirOnly = gstrCurrentXML_SaveDirOnly & "\\\
> >             txtSaveDir.Text = gstrCurrentXML_SaveDirOnly\
> >             **MsgBox** "The 'Save to Directory' field must end with a '\\ !"\
> >         End If\
> > \
> >      gstrCurrentXML_SaveDirAndFileName = gstrCurrentXML_SaveDirOnly & \_\
> >             gstrCurrentXML_FileNameOnly\
> > \
> > ` ' Submit information to the Status Bar label...`\
> >      **lblStatus.Caption** = "The XML file generated will now be written to the " & \_\
> >          **gstrCurrentXML_SaveDirOnly** & \_\
> >          " directory, using the filename of " & \_\
> >          **gstrCurrentXML_FileNameOnly**\
> > \
> > End Sub\
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` ' ~~~~~ `**`txtWriteFile_GotFocus()`**` ~~~~~~`\
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub `**`txtWriteFile_GotFocus()`**` `\
> > \
> > ` ' Merely echoes info to the Status Label to help the User`\
> >      **lblStatus.Caption** = "Type in the name you would like to use to save the XML file. It is currently: " & \_\
> >          **gstrCurrentXML_FileNameOnly** & "."\
> > \
> > End Sub\
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > ` ' ~~~~~ `**`txtWriteFile_LostFocus()`**` ~~~~~~`\
> > ` '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '    '`\
> > `Private Sub `**`txtWriteFile_LostFocus()`**` `\
> > \
> > ` ' User supplied their own filename!`\
> >      gstrCurrentXML_FileNameOnly = **txtWriteFile.Text**\
> >      gstrCurrentXML_SaveDirAndFileName = gstrCurrentXML_SaveDirOnly & \_\
> >         gstrCurrentXML_FileNameOnly\
> > \
> > ` ' Submit information to the Status Bar label...`\
> >      **lblStatus.Caption** = "The XML file generated will now be written to the " & \_\
> >          **gstrCurrentXML_SaveDirOnly** & \_\
> >          " directory, using the filename of " & \_\
> >          **gstrCurrentXML_FileNameOnly** & \_\
> >          " when you click the 'Write XML to File' button above."\
> > \
> > End Sub\
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > |  |  |
> > |:---|---:|
> > | vbDiR2XML's "**frmAbout**" Form | [**Back to the Beginning of this page**](#PNA_vbDiR2XML_Help_Start) |
>
> >   This is the screenshot of the one additional form in this VB project:\
> > \
> > <img src="./_dobeTutAllCommon/vbDiR2XML_frmAbout_Screenshot.jpg" id="vbDiR2XML_frmAbout_Screenshot" style="width:75.0%;height:75.0%" alt="Dobe Doinat&#39;s vbDiR2XML, or Directory to XML, &#39;About&#39; Form Screenshot" />
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> > |  |  |
> > |:---|---:|
> > | **Dobe's Retrospective** | [**Back to the Beginning of this page**](#PNA_vbDiR2XML_Help_Start) |
>
> >     A project of this nature is a real learning experience. It keeps the ability of the coder to remember syntax of the language involved up-to-date, so to speak. I have to look up the syntax for how to accomplish a programming construct in a language I have used in the past, but not recently. The more a programmer uses the syntax and the language, the more efficient they become.\
> > Working in multiple languages is usually required in the industry, so samples and example, or reusable code are very important. This is just one programmer's simple effort documented for the beginner or as a refresher for someone who normally works in C, C++, Java, Scripting, C#, VB.NET, ASP.NET, etx.\
> >     Or, maybe just use the utility, perhaps modifying it slightly, taking out the verbose explanation, perhaps changing (anything but my copywrite) how the XSL effects the final XML tree when the browser engine parses both files for a result tree, displayed in the browser. (Please don't claim complete credit for your work, that's why you usually don't see the source code published for just this fear. Perhaps in the Linux realm it is different, I know little of anything but Windows.)\
> >      <img src="./_dobeTutAllCommon/open.gif" title="Explore this link!" id="_img_openButton" alt="Browser can&#39;t find image?" /> My [Systems Development Life Cycle](PNA_SDLCglossary.htm "This is an old project and is written in HTML, not XHTML, but it contains valuable resources and good reading!") (**SDLC**) Glossary, goes into <u>how a project should be handled from beginning to end</u>. However, one has to start somewhere, so looking at simple code is a good refresher course in a language's syntax.\
> >     Although this program seems stable and remarkably useful, (not to mention fun), some of the decisions I made in creating this application may seem troublesome to you. For instance, I leave in a verbose section below the file listing which explains what is going on. In a utility, <u>ideally</u>, you would like to be able to enter whatever you want to in the resulting files. Therefore I enclose the sections of code for the project and make some **attempt to explain how it all works** and perhaps why I decided in favor of the algorithm which you see now.\
> > \
> > I hope you enjoyed this!\
> > Please let me know!\
> > [**Dobe "John Hartman" Doinat** \<dobe@eskimo.com\>](mailto:dobe@eskimo.com)\
> > January 18, 2002 (Ought-to)
>
> \
>
> ------------------------------------------------------------------------
>
> ------------------------------------------------------------------------
>
> \
>
> <table id="dobeXHTML_IntroPara" width="100%" cols="2" rows="1" data-border="0" data-cellpadding="10">
> <colgroup>
> <col style="width: 50%" />
> <col style="width: 50%" />
> </colgroup>
> <tbody>
> <tr>
> <td style="text-align: center;" data-valign="top" width="40%"></td>
> <td class="small_70bi" style="text-align: left;" data-valign="top" width="60%">Cut-and-pasting of code permitted for non-commercial use.<br />
> Check out my source code: <strong>&lt;Right-Click&gt; | View Source</strong><br />
> Thank you.<br />
> <a href="#PNA_vbDiR2XML_Help_Start"></a>
> <strong>Back to the Beginning of this page</strong></td>
> </tr>
> </tbody>
> </table>
>
> \
