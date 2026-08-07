---
title: "SQL Tutorial: Perl DBI and Optimizing Output"
source_domain: amasci.com
source_path: ~ericj/comp/sql3.htm
order: 2994
reachable_from_entry: false
images: 5
internal_links: 3
extracted: 2026-08-07T05:56:29Z
extractor: site_to_paper.py (pandoc)
---

# SQL Tutorial: Perl DBI and Optimizing Output

*Source page: `~ericj/comp/sql3.htm`*

[<img src="/~ericj/frtitle.jpg" data-border="0" width="484" height="75" alt="Home" />](/~ericj/)

# SQL Tutorial III

**-- Perl DBI and Optimizing Output --**

[Back to the PostgreSQL Tutorials List](postgres.htm)

------------------------------------------------------------------------

> ## Perl DBI
>
> With Perl's DBI interface, CGI scripts necessarily get more complicated, with commands to open a connection, execute queries, and close connections, rather than the simple form of CGI's used in the previous examples (one-line shell script entires for the most part). The logic is the same, it just needs to be spelled out in more detail.
>
> To open a database connection, I typically like to setup two variables at the top of a script, to help make it easy to edit a faulty query line if necessary:
>
> <div align="center">
>
> <table data-border="1" data-bgcolor="#ffffee" data-cellpadding="5" data-cellspacing="0">
> <colgroup>
> <col style="width: 100%" />
> </colgroup>
> <tbody>
> <tr>
> <td><pre><code>#!/usr/local/bin/perl5
> &#10;$database = &quot;DBI:Pg:dbname=ericj&quot;;
> $dbquery = join(&quot; &quot;, &quot;SELECT title, type, rating FROM video_rating&quot;,
>                      &quot;WHERE title LIKE &#39;G%&#39;&quot;,
>                      &quot;ORDER BY title;&quot;);</code></pre></td>
> </tr>
> </tbody>
> </table>
>
> </div>
>
> The variable **\$database** will tell our command (below) which database to open and which driver to use; replace 'ericj' with your own username. For these examples, you'll need the following modules from CPAN (already installed here on the eskimo servers):
>
> - CGI -- Commands to make processing forms and outputting HTML easier
> - DBI -- The database-independent portion of DBI
> - DBD::Pg -- A PostgreSQL-specific driver for DBI use
>
> Then, the variable **\$dbquery** will be used to create and execute an SQL command (also below). In case of typos or field-name changes, putting this at the top of the file can save some hunting later for lines of code to edit.
>
> To output an HTML page, open a connection to the PostgreSQL server, and run the query, we'll need a few commands to set this up:
>
> <div align="center">
>
> <table data-border="1" data-bgcolor="#ffffee" data-cellpadding="5" data-cellspacing="0">
> <colgroup>
> <col style="width: 100%" />
> </colgroup>
> <tbody>
> <tr>
> <td><pre><code>use CGI;
> $cgih = new CGI;
> print $cgih-&gt;header, &quot;\n&quot;;
> &#10;use DBI;
> $dbh = DBI-&gt;connect(&quot;$database&quot;) or die $DBI::errstr;
> &#10;$sth = $dbh-&gt;prepare(&quot;$dbquery&quot;);
> $sth-&gt;execute;</code></pre></td>
> </tr>
> </tbody>
> </table>
>
> </div>
>
> With the perl DBI interface, however, we can format the output any way we like; not simply as a brute table showing all the data in the query. I'll show some examples of different formats with the same query below. Let's process things simply first -- remember the "rule" of perl: "There's more than one way to do it."
>
> <div align="center">
>
> <table data-border="1" data-bgcolor="#ffffee" data-cellpadding="5" data-cellspacing="0">
> <colgroup>
> <col style="width: 100%" />
> </colgroup>
> <tbody>
> <tr>
> <td><pre><code>while (@row = $sth-&gt;fetchrow_array) {
>   ($title, $type, $rating) = @row;
> &#10;  print &quot;&lt;TR&gt;&lt;TD align=left&gt;$title&lt;TD&gt;
>         &quot;   &quot;,
>         &quot;&lt;TD align=right&gt;$type&lt;TD&gt;
>         &quot;   &quot;,
>         &quot;&lt;TD align=right&gt;$rating&lt;TD&gt;
>         &quot;&lt;TR&gt;n&quot;;
> }</code></pre></td>
> </tr>
> </tbody>
> </table>
>
> </div>
>
> Here, we're only printing the title, type, and rating from a video database; With a little extra printing of HTML code, we can manipulate individual field colors, make a full page surrounding the output, etc.
>
> Before we run the script, though, be sure to close the connections we opened (**\$sth** for the statement and **\$dbh** for the database connection):
>
> <div align="center">
>
> <table data-border="1" data-bgcolor="#ffffee" data-cellpadding="5" data-cellspacing="0">
> <colgroup>
> <col style="width: 100%" />
> </colgroup>
> <tbody>
> <tr>
> <td><pre><code>$sth-&gt;finish;
> $dbh-&gt;disconnect;</code></pre></td>
> </tr>
> </tbody>
> </table>
>
> </div>
>
> Here's what the above lines will show, with a little extra HTML coding for the table, new column headers, and field colors:
>
> <div align="center">
>
> <div align="center">
>
> | Title                      | Type | Rating |
> |:---------------------------|-----:|-------:|
> | **Galaxy Express 999**     | TM\* |      : |
> | **Gasaraki**               |    T |    12+ |
> | **Ghost in the Shell**     |    M |     NR |
> | **Grave of the Fireflies** |    M |     NR |
> | **Gunsmith Cats**          |    O |    15+ |
>
> </div>
>
> </div>
>
> Compare this to the shell-script method we used earlier (modified to use the same query as above):
>
> <div align="center">
>
> | title                  | type | rating |
> |:-----------------------|:-----|:-------|
> | Galaxy Express 999     | TM\* | :      |
> | Gasaraki               | T    | 12+    |
> | Ghost in the Shell     | M    | NR     |
> | Grave of the Fireflies | M    | NR     |
> | Gunsmith Cats          | O    | 15+    |
>
> (5 rows)\
>
> </div>
>
> ## Optimizing Output
>
> We touched on a bit of optimization above, when we saw the differences between the shell-script and perl-manipulated scripts. But the script walked through above still does just a simple dump to the output. But it turns out that the "type" and "rating" codes are different on these lines. In order to make it understandable, let's expand the results (adding the listed code just before the 'print' command above):
>
> <div align="center">
>
> <table data-border="1" data-bgcolor="#ffffee" data-cellpadding="5" data-cellspacing="0">
> <colgroup>
> <col style="width: 100%" />
> </colgroup>
> <tbody>
> <tr>
> <td><pre><code># Process &quot;type&quot;
> ################
>   $typtmp = &quot;&quot;;
>   $typmult = 0;
>   $typadd = 0;
>   if    ($type =~ &#39;\*&#39;) { $typtmp = &quot;Multiple &quot;;
>                           $typmult = 1;
>   }
>   if    ($type =~ &#39;T&#39;)  { $typtmp = join(&quot;&quot;, $typtmp, &quot;TV&quot;);
>                           $typadd = 1;
>   }
>   if    ($type =~ &#39;O&#39;)  { $jointmp = &quot;&quot;;
>                           if ($typmult &amp;&amp; $typadd) { $jointmp = &quot;/&quot;; }
>                           $typtmp = join($jointmp, $typtmp, &quot;OVA&quot;);
>                           $typadd = 1;
>   }
>   if    ($type =~ &#39;M&#39;)  { $jointmp = &quot;&quot;;
>                           if ($typmult &amp;&amp; $typadd) { $jointmp = &quot;/&quot;; }
>                           $typtmp = join($jointmp, $typtmp, &quot;Movie&quot;);
>   }
>   if    ($typmult)      { $typtmp = join(&quot;&quot;, $typtmp, &quot;(s)&quot;); }
> &#10;# Process &quot;rating&quot;
> ##################
>   if    ($rating =~ &#39;:&#39;)  { $rate = &quot;Unknown/multiple rating(s)&quot;; }
>   elsif ($rating =~ &#39;NR&#39;) { $rate = &quot;Not Rated&quot;; }
>   else                    { $rate = join(&quot;&quot;, &quot;Rated &quot;, $rating); }
> &#10;  $type = $typtmp;
>   $rating = $rate;</code></pre></td>
> </tr>
> </tbody>
> </table>
>
> </div>
>
> When the new script is run with these changes, the space-saving codes used in the actual data can be expanded to be read by humans:
>
> <div align="center">
>
> <div align="center">
>
> | Title                      |                 Type |                     Rating |
> |:---------------------------|---------------------:|---------------------------:|
> | **Galaxy Express 999**     | Multiple TV/Movie(s) | Unknown/multiple rating(s) |
> | **Gasaraki**               |                   TV |                  Rated 12+ |
> | **Ghost in the Shell**     |                Movie |                  Not Rated |
> | **Grave of the Fireflies** |                Movie |                  Not Rated |
> | **Gunsmith Cats**          |                  OVA |                  Rated 15+ |
>
> </div>
>
> </div>
>
> Another section of my pages here uses the full video database used as an example here. Entries include descriptions, number of episodes, reasons for the various ratings, etc. You can check out a different implementation and extension of these same CGI scripts in the **[Eric's Recommended Anime](/~ericj/anime/)** pages.

Next Part:\
Web-Based Searching\
(coming soon)

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
