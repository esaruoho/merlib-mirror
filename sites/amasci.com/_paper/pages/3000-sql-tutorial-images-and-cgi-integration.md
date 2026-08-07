---
title: "SQL Tutorial: Images and CGI Integration"
source_domain: amasci.com
source_path: ~ericj/comp/sql2b.htm
order: 3000
reachable_from_entry: false
images: 9
internal_links: 8
extracted: 2026-08-07T17:09:35Z
extractor: site_to_paper.py (pandoc)
---

# SQL Tutorial: Images and CGI Integration

*Source page: `~ericj/comp/sql2b.htm`*

[<img src="/~ericj/frtitle.jpg" data-border="0" width="484" height="75" alt="Home" />](/~ericj/)

# SQL Tutorial II

**-- Images and CGI Integration --**

Previous Part:\
[Normalizing a Database](sql2.htm)

[Back to the PostgreSQL Tutorials List](postgres.htm)

------------------------------------------------------------------------

> ## Images and CGI Integration
>
> First, we'll enter the data as we did before (I'll only show one line here, both for space issues and the possibility of my changing the "item" entries later). For the HTML tags within the fields, just type them in as you would into a web page. Notice that the single quote (') can be used to surround texts that may include the double quotes (") that HTML uses (the need for apostrophes *and* quotes I haven't tested yet.)
>
> <div align="center">
>
> <table data-border="1" data-bgcolor="#ffffee" data-cellpadding="5" data-cellspacing="0">
> <colgroup>
> <col style="width: 100%" />
> </colgroup>
> <tbody>
> <tr>
> <td><pre><code>
> ericj=&gt; INSERT INTO sales_item VALUES (
> ericj(&gt;   &#39;DVD-CB01&#39;,
> ericj(&gt;   &#39;Cowboy Bebop #1&#39;,
> ericj(&gt;   &#39;Cowboy Bebop Session 1&lt;BR&gt;Episodes 1-5&lt;BR&gt;125 min.&#39;,
> ericj(&gt;   29.95,
> ericj(&gt;   &#39;&lt;IMG src=&quot;/~ericj/comp/img/bebop1_cover.gif&quot; width=48 height=70&gt;&#39; );
> ericj=&gt;</code></pre></td>
> </tr>
> </tbody>
> </table>
>
> </div>
>
> The HTML output I've been using in these examples does a conversion of "\<" and "\>" into their text-versions "\&lt;" and "\&gt;", so we'll want to put an extra filter in place to convert these back to the needed brackets. For this reason, and to help show how this can be integrated into CGI scripts, I'll show the actual command line my CGI scripts are using for these examples.
>
> For these examples, my scripts have been running the command exactly as you'd be able to from the command line (without the '-h www' bit, since the scripts will run on that server themselves). I turn on HTML output with '-H', and notice how table tags (with '-T') and other settings can be changed as well to make your own style of tables rather that sticking with the default. Next time, I'll bring out the Perl and DBI/DBD setup, which allows us to clean up the tables in any format we desire. Here's a sample complete shell-script CGI for the table below:
>
> <div align="center">
>
> <table data-border="1" data-bgcolor="#ffffee" data-cellpadding="5" data-cellspacing="0">
> <colgroup>
> <col style="width: 100%" />
> </colgroup>
> <tbody>
> <tr>
> <td><pre><code>#!/bin/bash
> PATH=/usr/local/pgsql/bin:/bin
> &#10;echo &quot;Content-Type: text/html&quot;
> echo 
> psql -H -T &#39;bgcolor=&quot;#ffffff&quot; cellspacing=0 cellpadding=3 width=&quot;90%&quot;&#39; \
>      -c &quot;SELECT * FROM sales_item ORDER BY id;&quot; \
>   | sed -e &#39;s/&amp;lt;/&lt;/g&#39; -e &#39;s/&amp;gt;/&gt;/g&#39;</code></pre></td>
> </tr>
> </tbody>
> </table>
>
> </div>
>
> \
>
> <div align="center">
>
> <table data-border="1" data-bgcolor="#ffffff" data-cellspacing="0" data-cellpadding="3" width="90%">
> <colgroup>
> <col style="width: 20%" />
> <col style="width: 20%" />
> <col style="width: 20%" />
> <col style="width: 20%" />
> <col style="width: 20%" />
> </colgroup>
> <thead>
> <tr>
> <th style="text-align: center;">id</th>
> <th style="text-align: center;">name</th>
> <th style="text-align: center;">description</th>
> <th style="text-align: center;">price</th>
> <th style="text-align: center;">imagetag</th>
> </tr>
> </thead>
> <tbody>
> <tr data-valign="top">
> <td style="text-align: left;">DVD-CB01</td>
> <td style="text-align: left;">Cowboy Bebop #1</td>
> <td style="text-align: left;">Cowboy Bebop 1st Session<br />
> Episodes 1-5<br />
> 125 min.</td>
> <td style="text-align: right;">24.95</td>
> <td style="text-align: left;"><img src="/~ericj/comp/img/bebop1_cover.gif" width="48" height="70" /></td>
> </tr>
> <tr data-valign="top">
> <td style="text-align: left;">DVD-CB02</td>
> <td style="text-align: left;">Cowboy Bebop #2</td>
> <td style="text-align: left;">Cowboy Bebop 2nd Session<br />
> Episodes 6-10<br />
> 125 min.</td>
> <td style="text-align: right;">24.95</td>
> <td style="text-align: left;"><img src="/~ericj/comp/img/bebop2_cover.gif" width="48" height="70" /></td>
> </tr>
> <tr data-valign="top">
> <td style="text-align: left;">DVD-MP01</td>
> <td style="text-align: left;">Macross Plus #1</td>
> <td style="text-align: left;">Macross Plus, Volume 1<br />
> Episodes 1-2<br />
> 90 min.</td>
> <td style="text-align: right;">24.95</td>
> <td style="text-align: left;"><img src="/~ericj/comp/img/mp1_cover.gif" width="48" height="70" /></td>
> </tr>
> <tr data-valign="top">
> <td style="text-align: left;">DVD-MP02</td>
> <td style="text-align: left;">Macross Plus #2</td>
> <td style="text-align: left;">Macross Plus, Volume 2<br />
> Episodes 3-4<br />
> 90 min.</td>
> <td style="text-align: right;">24.95</td>
> <td style="text-align: left;"><img src="/~ericj/comp/img/mp2_cover.gif" width="48" height="70" /></td>
> </tr>
> </tbody>
> </table>
>
> (4 rows)\
>
> </div>
>
> *Voilá*. . . . We have images in our tables now.
>
> Wondering how many customers we have so far? Here's the data I added to that table with the shell-CGI command line used to show it here:
>
> <div align="center">
>
> <table data-border="1" data-bgcolor="#ffffee" data-cellpadding="5" data-cellspacing="0">
> <colgroup>
> <col style="width: 100%" />
> </colgroup>
> <tbody>
> <tr>
> <td><pre><code>psql -H -T &#39;bgcolor=&quot;#ffffff&quot; cellspacing=0 cellpadding=3 width=&quot;90%&quot;&#39; \
>      -c &quot;SELECT * FROM sales_customer ORDER BY name;&quot;</code></pre></td>
> </tr>
> </tbody>
> </table>
>
> </div>
>
> \
>
> <div align="center">
>
> | id       | name          | str_addr1 | str_addr2      | city      | state | zip_4 | country |
> |:---------|:--------------|:----------|:---------------|:----------|:------|:------|:--------|
> | TEST0001 | Alice Testing |           | 12345 67th Ave | Somewhere | WA    | 98123 | USA     |
> | SMIT0001 | Bob Smithers  |           | PO Box 98765   | Elsewhere | WA    | 98765 | USA     |
>
> (2 rows)\
>
> </div>
>
> And what did they buy?
>
> <div align="center">
>
> <table data-border="1" data-bgcolor="#ffffee" data-cellpadding="5" data-cellspacing="0">
> <colgroup>
> <col style="width: 100%" />
> </colgroup>
> <tbody>
> <tr>
> <td><pre><code>psql -H -T &#39;bgcolor=&quot;#ffffff&quot; cellspacing=0 cellpadding=3 width=&quot;90%&quot;&#39; \
>      -c &quot;SELECT * FROM sales_invoice ORDER BY name;&quot;</code></pre></td>
> </tr>
> </tbody>
> </table>
>
> </div>
>
> \
>
> <div align="center">
>
> | name          | purch_date | item_name        | price | quantity | subtotal |
> |:--------------|:-----------|:-----------------|------:|---------:|---------:|
> | Alice Testing | 2000-10-19 | Macross Plus \#1 | 24.95 |        1 |    24.95 |
> | Alice Testing | 2000-10-27 | Macross Plus \#2 | 24.95 |        1 |    24.95 |
> | Bob Smithers  | 2000-09-30 | Cowboy Bebop \#1 | 24.95 |        7 |   174.65 |
> | Bob Smithers  | 2000-10-19 | Cowboy Bebop \#2 | 24.95 |        5 |   124.75 |
>
> (4 rows)\
>
> </div>
>
> Hmm. Looks like Bob's a purchaser for a fan club, library, or rental store. Might explain the PO box address, too. But then, these are phony sales and people anyway. Of course we wouldn't like a real invoice to include both purchasers, only the one we're asking about; the script can add "**WHERE name LIKE 'Bob Smithers'**" (or better yet, a check of the customer_id) without too much difficulty.
>
> Imagine how many duplicates we'd have all over the database if every row needed the same customer information, item description, or image tag. As it is, we only need to store each piece of information once and make some links with the "sales_purch" table. It may not make much of a difference on these samples, but when you get near a quota limit, it's a little late to redesign the whole works.

[Back to the PostgreSQL Tutorials List](postgres.htm)

------------------------------------------------------------------------

------------------------------------------------------------------------

<div align="center">

</div>

[<img src="/~ericj/img/vh401.gif" data-border="0" width="88" height="31" alt="[Valid HTML]" />](http://validator.w3.org/)   [<img src="/~ericj/img/vcss.gif" data-border="0" width="88" height="31" alt="[Valid CSS]" />](http://jigsaw.w3.org/css-validator/validator-uri.html)   [<img src="/~ericj/img/eskitiny.gif" data-border="0" width="86" height="31" alt="[Hosted by Eskimo North]" />](http://www.eskimo.com/)   [<img src="/~ericj/img/gfx_by_gimp.gif" data-border="0" width="90" height="36" alt="[Graphics by GIMP]" />](http://www.gimp.org/)

[Home](/~ericj/)   [Anime](/~ericj/anime/)   [Genealogy](/~ericj/genealogy/)   [About](/~ericj/personal/)   [External Links](/~ericj/other.htm)

<a href="/~ericj/forms/mail.htm" class="local">Feedback Appreciated</a>.

Copyright ©1994-2001 by Eric T. Jorgensen.\
All rights reserved. Do not copy/redistribute.
