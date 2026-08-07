---
title: "PostgreSQL Usage and Tutorials"
source_domain: amasci.com
source_path: ~ericj/comp/postgres.htm
order: 2990
reachable_from_entry: false
images: 5
internal_links: 10
extracted: 2026-08-07T05:56:29Z
extractor: site_to_paper.py (pandoc)
---

# PostgreSQL Usage and Tutorials

*Source page: `~ericj/comp/postgres.htm`*

[<img src="/~ericj/frtitle.jpg" data-border="0" width="484" height="75" alt="Home" />](/~ericj/)

# PostgreSQL Usage and Tutorials

**-- Using PostgreSQL on Eskimo North and Tutorials --**

------------------------------------------------------------------------

> ## Requesting a PostgreSQL Database on Eskimo North (eskimo.com)
>
> Please contact support@eskimo.com to request a PostgreSQL database for your username -- one per username, as the database name is the same as the login -- if connecting results in an error for you. You would need to let them know a requested password for PostgreSQL tasks (used when connecting from a remote client) as well.

------------------------------------------------------------------------

> ## Connecting to the PostgreSQL Server
>
> The prompt in PostgreSQL shows the name of the database it's connected to (the same as your username here at eskimo.com).
>
> There are three methods of authentication for connecting the server here:
>
> - The shell server uses a login and password to connect to it in the first place. Ident is used to tell the SQL server which username is to be used when connecting in the method described below.
> - CGI's will run on the web server itself (the same server that's running PostgresSQL currently) under your own userid. That will be used to connect to the right database.
> - You can connect to the SQL server with clients outside our servers as well, using your username and a password used only for PostgreSQL. This will let others you tell the password to do database admin tasks for you if you so desire.
>
> To make things easier while working on your databse, be sure to set the "\$PGHOST" environment variable to "www" and add "/usr/local/pgsql/bin" to your "\$PATH" variable in your shell's configuration file (usually .profile or .login; shell syntax in these tutorials follow the bash/ksh format):
>
> **export PGHOST="www"**
>
> This will allow you to connect by simply typing "**psql**" without needing to specify the server name each time.
>
> From the shell prompt here, connecting to the database is done with:
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
> [eskimo] export PGHOST=&quot;www&quot;
> [eskimo] psql
> Welcome to psql, the PostgreSQL interactive terminal.
> &#10;Type:  \copyright for distribution terms
>        \h for help with SQL commands
>        \? for help on internal slash commands
>        \g or terminate with semicolon to execute query
>        \q to quit
> &#10;ericj=&gt; </code></pre></td>
> </tr>
> </tbody>
> </table>
>
> </div>
>
> Commands here will be shown as if typed directly in a shell connection. They can also be placed in a text file and sent in larger sets with the following example "redirect":
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
> [eskimo] (place commands in file &quot;sql-commands&quot;, for example.)
> [eskimo] psql &lt; sql-commands</code></pre></td>
> </tr>
> </tbody>
> </table>
>
> </div>

------------------------------------------------------------------------

> ## PostgreSQL Tutorials (Examples of Usage, etc.)
>
> Help with commands, syntax, and typical tricks and workarounds (for images and internal links, etc.) can be found in the tutorials below. Each set uses a different set of practical examples, to help give an idea of what sort of databases I've been fiddling with when both testing and using the server in a production environment.
>
> SQL Tutorial I -- Stock Gain Examples\
> [Creating Tables, Inserting and Updating Data](sql1.htm)\
> [Queries and Output](sql1b.htm)
>
> SQL Tutorial II -- Sales Examples\
> [Normalizing a Database](sql2.htm)\
> [Images and CGI Integration](sql2b.htm)
>
> SQL Tutorial III -- Video Database Examples\
> [Perl DBI and Optimizing Output](sql3.htm)\
> **Web-Based Searching** (coming soon)
>
> SQL Tutoral IV -- Guestbook Examples\
> **Form-Based Web Updating** (coming coon)

------------------------------------------------------------------------

------------------------------------------------------------------------

<div align="center">

</div>

[<img src="/~ericj/img/vh401.gif" data-border="0" width="88" height="31" alt="[Valid HTML]" />](http://validator.w3.org/)   [<img src="/~ericj/img/vcss.gif" data-border="0" width="88" height="31" alt="[Valid CSS]" />](http://jigsaw.w3.org/css-validator/validator-uri.html)   [<img src="/~ericj/img/eskitiny.gif" data-border="0" width="86" height="31" alt="[Hosted by Eskimo North]" />](http://www.eskimo.com/)   [<img src="/~ericj/img/gfx_by_gimp.gif" data-border="0" width="90" height="36" alt="[Graphics by GIMP]" />](http://www.gimp.org/)

[Home](/~ericj/)   [Anime](/~ericj/anime/)   [Genealogy](/~ericj/genealogy/)   [About](/~ericj/personal/)   [External Links](/~ericj/other.htm)

<a href="/~ericj/forms/mail.htm" class="local">Feedback Appreciated</a>.

Copyright ©1994-2001 by Eric T. Jorgensen.\
All rights reserved. Do not copy/redistribute.
