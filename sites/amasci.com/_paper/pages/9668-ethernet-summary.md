---
title: "Ethernet Summary"
source_domain: amasci.com
source_path: ~webguy/service/ethernet.html
order: 9668
reachable_from_entry: false
images: 0
internal_links: 3
extracted: 2026-08-07T06:02:15Z
extractor: site_to_paper.py (pandoc)
---

# Ethernet Summary

*Source page: `~webguy/service/ethernet.html`*

<table width="80%">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr>
<td><h2 id="ethernet-summary">Ethernet Summary</h2>
<a href="../writings/reply.html">Al Wong</a><br />
May 10, 2003
<p>The ethernet network functionality is pretty simple. You have machines connected to a <em>backbone</em> party line. These machines broadcast their messages on this party line. If two machines broadcast at the same time, you have a <em>collision</em> where nothing meaningful is sent. In this case, the two machines wait a random amount of time before broadcasting again. Only one machine may communicate over the party line at any time.</p>
<p>A <strong>HUB</strong> changes the topology of the backbone from a <em>line</em> to a <em>star</em> shape. Machines still broadcast to every other machine on the network. Only one machine can talk at any one time.</p>
<p>A <strong>SWITCH</strong> is like a HUB except a SWITCH creates a dedicated communication line between two machines. More than one machine may talk at the same time if they are talking to different machines.</p>
<p>A <strong>ROUTER</strong> is a like a SWITCH except a ROUTER connects directly to a DSL connection (to the Internet) as well as to the local network. A router may also have other capabilities like provide a firewall and DHCP (Dynamic Host Configuration Protocol).</p></td>
</tr>
</tbody>
</table>

|  |  |
|----|----|
| [Internet Connection Sharing](ics.html) | [My Writings](../writings/writings.html) |

Last updated : May 12, 2003\
Copyright 2003 Al Wong, Los Angeles, California, USA
