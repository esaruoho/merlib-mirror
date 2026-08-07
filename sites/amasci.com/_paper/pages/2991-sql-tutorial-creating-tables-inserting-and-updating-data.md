---
title: "SQL Tutorial: Creating Tables, Inserting and Updating Data"
source_domain: amasci.com
source_path: ~ericj/comp/sql1.htm
order: 2991
reachable_from_entry: false
images: 5
internal_links: 2
extracted: 2026-08-07T05:56:29Z
extractor: site_to_paper.py (pandoc)
---

# SQL Tutorial: Creating Tables, Inserting and Updating Data

*Source page: `~ericj/comp/sql1.htm`*

[<img src="/~ericj/frtitle.jpg" data-border="0" width="484" height="75" alt="Home" />](/~ericj/)

# SQL Tutorial I

**-- Creating Tables, Inserting Data, Updating Data --**

[Back to the PostgreSQL Tutorials List](postgres.htm)

------------------------------------------------------------------------

> ## Creating Tables
>
> Now that we're in, we want to create a table. Note how the prompt changes if you don't end the current line with the command-end character ';' (similar to other programming languages that can span across lines).
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
> ericj=&gt; CREATE TABLE &quot;stock_data&quot; (
> ericj(&gt;   &quot;symbol&quot;       varchar(5),
> ericj(&gt;   &quot;purch_date&quot;   date,
> ericj(&gt;   &quot;purch_price&quot;  float,
> ericj(&gt;   &quot;shares&quot;       int,
> ericj(&gt;   &quot;curr_date&quot;    date,
> ericj(&gt;   &quot;curr_price&quot;   float
> ericj(&gt; );
> ericj=&gt; </code></pre></td>
> </tr>
> </tbody>
> </table>
>
> </div>
>
> ## Inserting Data
>
> And now we need to insert some data.
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
> ericj=&gt; INSERT INTO &quot;stock_data&quot; VALUES
> ericj-&gt;   (&#39;CAT&#39;, &#39;2000-02-24&#39;, 37.8125, 13, &#39;2000-10-06&#39;, 34.5);
> ericj=&gt; INSERT INTO &quot;stock_data&quot; VALUES
> ericj-&gt;   (&#39;DD&#39;, &#39;2000-02-24&#39;, 53.25, 9, &#39;2000-10-06&#39;, 34.5);
> ericj=&gt; </code></pre></td>
> </tr>
> </tbody>
> </table>
>
> </div>
>
> This can take a lot of typing for large amounts of data, so there's an alternate method I'll use to add the rest. This uses Tab-delimited lines that you can cut-n-paste from other applications as well. Don't pad them with spaces or commas, just Tabs, one for each column.
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
> ericj=&gt; COPY &quot;stock_data&quot; FROM stdin;
> Enter data to be copied followed by a newline.
> End with a backslash and a period on a line by itself.
> &gt;&gt; IP    2000-02-24  40.25   12  2000-10-06  29.8125
> &gt;&gt; SBC   2000-02-24  35.75   13  2000-10-06  53.3125
> &gt;&gt; CAT   2000-09-21  34.8125 14  2000-10-06  53.3125
> &gt;&gt; DD    2000-09-21  38.75   12  2000-10-06  44.5625
> &gt;&gt; IP    2000-09-21  28.8125 17  2000-10-06  29.8125
> &gt;&gt; T 2000-09-21  29.25   17  2000-10-06  27.25
> &gt;&gt; \.
> ericj=&gt; </code></pre></td>
> </tr>
> </tbody>
> </table>
>
> </div>
>
> ## Updating Data
>
> Updating is done in a way similar to simply inserting data, but in order to tell the SQL server to change a record already listed, we also need to tell it which record(s) to change. This is done with the command "UPDATE" which has a "SET" clause to specify which fields to update and a "WHERE" clause to limit this update to a specific record (or multiple records):
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
> ericj=&gt; UPDATE &quot;stock_data&quot;
> ericj-&gt;   SET &quot;curr_date&quot; = 2000-10-12,
> ericj-&gt;   SET &quot;curr_price&quot; = 31.875
> ericj-&gt;   WHERE &quot;symbol&quot; = &quot;CAT&quot;;
> ericj=&gt; </code></pre></td>
> </tr>
> </tbody>
> </table>
>
> </div>
>
> In this example (until Part II), this will actually update *two* records, since there are two rows that match the "CCCC" symbol with a current date and price. Part II will show how to split this up into two tables so that the current data is only listed once.

Next Part:\
[Queries and Output](sql1b.htm)

[Back to the PostgreSQL Tutorials List](postgres.htm)

------------------------------------------------------------------------

------------------------------------------------------------------------

<div align="center">

</div>

[<img src="/~ericj/img/vh401.gif" data-border="0" width="88" height="31" alt="[Valid HTML]" />](http://validator.w3.org/)   [<img src="/~ericj/img/vcss.gif" data-border="0" width="88" height="31" alt="[Valid CSS]" />](http://jigsaw.w3.org/css-validator/validator-uri.html)   [<img src="/~ericj/img/eskitiny.gif" data-border="0" width="86" height="31" alt="[Hosted by Eskimo North]" />](http://www.eskimo.com/)   [<img src="/~ericj/img/gfx_by_gimp.gif" data-border="0" width="90" height="36" alt="[Graphics by GIMP]" />](http://www.gimp.org/)

**[Home](http://seattleotaku.com/)**   **[Reviews](http://seattleotaku.com/reviews/)**   **[Clubs](http://seattleotaku.com/clubs/)**   **Conventions**   **[Shopping](http://seattleotaku.com/shopping/)**   **[About Me](http://www.eskimo.com/~ericj/personal/)**

**[Feedback Appreciated](http://seattleotaku.com/forms/mail.htm)**.

Copyright ©1994-2003 by Eric T. Jorgensen.\
All rights reserved. Do not copy/redistribute.
