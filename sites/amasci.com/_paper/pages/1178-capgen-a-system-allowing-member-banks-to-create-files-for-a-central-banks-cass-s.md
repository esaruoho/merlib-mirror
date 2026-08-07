---
title: "CapGen : A System allowing Member banks to create files for a Central Banks CASS system"
source_domain: amasci.com
source_path: ~bankstar/bs/CapGen.htm
order: 1178
reachable_from_entry: false
images: 24
internal_links: 0
extracted: 2026-08-07T17:07:28Z
extractor: site_to_paper.py (pandoc)
---

# CapGen : A System allowing Member banks to create files for a Central Banks CASS system

*Source page: `~bankstar/bs/CapGen.htm`*

|  |  |  |  |
|----|----|----|----|
| <img src="images/1.jpg" width="178" height="152" /> | <img src="images/2.jpg" width="177" height="152" /> | <img src="images/3.jpg" usemap="#Map" data-border="0" width="200" height="152" /> | <img src="images/4.jpg" usemap="#Map2" data-border="0" width="225" height="152" /> |

<table width="777" data-border="0" data-cellspacing="0" data-cellpadding="0" height="1198">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<tbody>
<tr>
<td width="46" data-valign="top" data-bgcolor="#006699" height="1142"> </td>
<td width="3" data-valign="top" data-bgcolor="#CCCCCC" height="1142"></td>
<td width="10" data-valign="top" height="1142"></td>
<td data-valign="top" height="1142" width="718"><table width="713" data-border="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td colspan="2" data-valign="bottom"><img src="pics/capgen-head.gif" width="149" height="45" /></td>
</tr>
<tr>
<td width="546" data-valign="top" height="240"><p>When Central Banks introduce Clearing and Settlement Systems (CASS) to automate the clearing of payment instruments, commercial banks need to have systems which can generate files for outward clearing and accept/process files for inward clearing.</p>
<p>    Most banks will have existing computer systems prior to this event taking place and supplementing existing systems with a module to handle this is far more advantageous than replacing existing systems.</p>
<p>    Some Central Banks require the exchange of only data files while others require both data and image files to be exchanged.</p>
<p>    CapGen is a highly parameterized system, which can be used across a wide range of CASS systems for both paper and image based clearing.</p></td>
<td width="157" data-valign="top" height="240"><div data-align="right">
<img src="pics/filecap-softlook.gif" data-align="top" width="150" height="206" />
</div></td>
</tr>
</tbody>
</table>
<p><strong>Features of CapGen</strong></p>
<blockquote>
<blockquote>
<p><strong><img src="images/blue-bullet.gif" width="10" height="10" /></strong> <a href="#1">Interface to Document Processors</a><br />
<strong><img src="images/blue-bullet.gif" width="10" height="10" /></strong> <a href="#2">User Defined Payment Instruments</a><br />
<strong><img src="images/blue-bullet.gif" width="10" height="10" /></strong> <a href="#3">Branch Modules for banks having distributed databases</a><br />
<strong><img src="images/blue-bullet.gif" width="10" height="10" /></strong> <a href="#4">Interface to communicate with the Central Bank</a><br />
<strong><img src="images/blue-bullet.gif" width="10" height="10" /></strong> <a href="#5">Automatic generation of outward clearing files</a><br />
<strong><img src="images/blue-bullet.gif" width="10" height="10" /></strong> <a href="#6">Automatic Processing of inward clearing files</a><br />
<strong><img src="images/blue-bullet.gif" width="10" height="10" /></strong> <a href="#7">Automatic Send and receive feature</a><br />
<strong><img src="images/blue-bullet.gif" width="10" height="10" /></strong> <a href="#8">Interface to existing Baseline system</a><br />
<strong><img src="images/blue-bullet.gif" width="10" height="10" /></strong> <a href="#9">End-to-End regularization of paper instruments</a></p>
</blockquote>
</blockquote>
<p><strong><img src="images/red-bullet.gif" width="10" height="10" /></strong> <strong>Interface to Document Processors <span id="1"></span><br />
</strong>CapGen interfaces to popular document processors which enables a bank to decide whether it wishes to process documents at Front Office using small inexpensive document processors or at Back Office using high speed large volume processors. These document processors will capture data from the MICR line as well as scan images of one or both sides of the document and pass this data to CapGen for processing</p>
<p><strong><img src="images/red-bullet.gif" width="10" height="10" /></strong> <strong>User Defined Payment Instruments<span id="2"></span><br />
</strong>While almost all Central Banks process instruments such as cheques and transfer orders, each Central Bank also allow other instruments and these can change as time goes by. For example, promissory notes, settlement orders, reimbursement of credit card claims etc. are items that Central Banks allow processing of. CapGen allows users to themselves define new instruments and evolve along with Central Banks.</p>
<p><strong><img src="images/red-bullet.gif" width="10" height="10" /></strong> <strong>Branch Modules for banks having distributed databases<span id="3"></span><br />
</strong>Not all banks have a centralized database. Banks, which have distributed databases at branches need to process instruments at branches and then send the processed data to a Nodal Office. The Nodal Office consolidates data and transfers consolidated data to and from aCentral Bank. CapGen has a Branch Module, which allows this to take place.</p>
<p>CapGen also has built in sorting mechanism which enables sorting, preparing and transferring files to various branches at predefined intervals.</p>
<p><strong><img src="images/red-bullet.gif" width="10" height="10" /></strong> <strong>Interface to communicate with the Central Bank<span id="4"></span><br />
</strong>CapGen system has an easy interface to accept and send files to a Central Bank</p>
<p><strong><img src="images/red-bullet.gif" width="10" height="10" /></strong> <strong>Automatic generation of outward clearing files<span id="5"></span><br />
</strong>Once instrument data has been entered into CapGen, it automatically creates outward clearing files in the formats defined by Central Banks</p>
<p><strong><img src="images/red-bullet.gif" width="10" height="10" /></strong> <strong>Automatic Processing of inward clearing files<span id="6"></span><br />
</strong>On receiving inward clearing files from a Central Bank, CapGen can automatically process the instruments for parameters such as account balance, overdraft, cheque stock etc. CapGen allows users to define instruments which can be automatically processed and others that require officer intervention</p>
<p><strong><img src="images/red-bullet.gif" width="10" height="10" /></strong> <strong>Automatic Send and receive feature<span id="7"></span><br />
</strong>CapGen has automatic send and receive feature which allows Users to send and receive files from a Central Bank at user defined intervals</p>
<p><strong><img src="images/red-bullet.gif" width="10" height="10" /></strong> <strong>Interface to existing Baseline system<span id="8"></span><br />
</strong>CapGen has the capability to interface to various baseline systems using a batch or on-line interface. These interfaces are developed/fine tuned individually for each user.</p>
<p><strong><img src="images/red-bullet.gif" width="10" height="10" /></strong> <strong>End-to-End regularization of paper instruments <span id="9"></span><br />
</strong>Many Central Banks now allow clearing of instruments based on electronic images. Paper instruments however, still exist and banks need to ensure that the paper item finally arrives at the correct destination regularizing the instrument which has been cleared based on an electronic image. CapGen keeps track of the complete life cycle an instrument. until it is fully regularized.</p></td>
</tr>
<tr>
<td width="46" data-valign="top" data-bgcolor="#EAE7E3" height="9"></td>
<td width="3" data-valign="top" data-bgcolor="#CCCCCC" height="9"></td>
<td width="10" data-valign="top" height="9"></td>
<td data-valign="top" height="9" width="718"><div data-align="right">
* <strong>CapGen</strong> is scheduled to be released in Q3 2003
</div></td>
</tr>
</tbody>
</table>

<div align="right">

</div>

<div id="dropdwn" style="position:absolute; left:370px; top:137px; width:124px; height:150px; z-index:1; background-color:#666666; layer-background-color:#666666; border: 1px none #000000; visibility:hidden">

</div>

<div id="dropdwn_central_ie" style="position:absolute; left:370px; top:163px; width:124px; height:43px; z-index:1; background-color:#666666; layer-background-color:#666666; border: 1px none #000000; visibility:hidden">

</div>

<div id="dropdwn_member_ie" style="position:absolute; left:370px; top:177px; width:124px; height:72px; z-index:1; background-color:#666666; layer-background-color:#666666; border: 1px none #000000; visibility:hidden">

</div>

<div id="Centralorcommercial" style="position:absolute; width:203px; height:57px; z-index:2; left: 493px; top: 137px; background-color: #666666; layer-background-color: #666666; border: 1px none #000000; visibility: hidden">

</div>

<div id="tooltip" style="position:absolute; width:178px; height:73px; z-index:4; left: 100px; top: 201px; background-color: #CCCCCC; layer-background-color: #CCCCCC; background-image: url(pics/ToolTip_bk.gif); layer-background-image: url(pics/ToolTip_bk.gif); border: 1px none #000000; visibility: hidden">

</div>
