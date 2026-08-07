---
title: "SQL Tutorial: Normalizing a Database"
source_domain: amasci.com
source_path: ~ericj/comp/sql2.htm
order: 2999
reachable_from_entry: false
images: 5
internal_links: 3
extracted: 2026-08-07T17:09:35Z
extractor: site_to_paper.py (pandoc)
---

# SQL Tutorial: Normalizing a Database

*Source page: `~ericj/comp/sql2.htm`*

[<img src="/~ericj/frtitle.jpg" data-border="0" width="484" height="75" alt="Home" />](/~ericj/)

# SQL Tutorial II

**-- Normalizing a Database --**

[Back to the PostgreSQL Tutorials List](postgres.htm)

------------------------------------------------------------------------

> ## Normalizing a Database
>
> To "normalize" a database, or to split things up into unique and manageable chunks, I'll create the following (switching to a store-front example this time):
>
> - A table for customer information, "sales_customer";
> - a table for item information, "sales_item";
> - a table for purchase information, "sales_purch"; and
> - a view combining all three to show an invoice, "sales_invoice".
>
> If in this example I were continuing the first example, I might have chosen to create (a) a table for stock purchase information, (b) a table for current prices, (c) a view combining pieces of each to show the captial gain, and any number of other items.
>
> What information do we need for the new database example?
>
> **sales_customer**  
> Name, address, city, state, zip, country code, and an ID code to keep each separate customer out of each other's invoices.
>
> **sales_item**  
> Name, description, price, and an ID code to keep each item separate from others in the invoices. Let's toss in a space for an HTML image tag as well, so we can show a picture on the store-front.
>
> **sales_purch**  
> The customer's ID, the item's ID, the date, and the quantity. Of course, this needs an ID code as well to be sure things don't get mixed up while looking for particular purchase records.
>
> **sales_invoice**  
> The Customer's name, the item name and price, the purchase date and quantity. This should be sure that things aren't mixed around in the data, so we'll put a WHERE clause to be sure things match correctly.
>
> Let's create the items I mentioned above:
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
> ericj=&gt; CREATE TABLE sales_customer (
> ericj(&gt;   id         varchar(8),
> ericj(&gt;   name       varchar(30),
> ericj(&gt;   str_addr1  varchar(30),
> ericj(&gt;   str_addr2  varchar(30),
> ericj(&gt;   city       varchar(15),
> ericj(&gt;   state      varchar(2),
> ericj(&gt;   zip_4      varchar(10),
> ericj(&gt;   country    varchar(10)
> ericj(&gt; );
> ...
> ericj=&gt; CREATE TABLE sales_item (
> ericj(&gt;   id           varchar(8),
> ericj(&gt;   name         varchar(30),
> ericj(&gt;   description  varchar(255),
> ericj(&gt;   price        float,
> ericj(&gt;   imagetag     varchar(255)
> ericj(&gt; );
> ...
> ericj=&gt; CREATE TABLE sales_purch (
> ericj(&gt;   id          int,
> ericj(&gt;   purch_date  date,
> ericj(&gt;   cust_id     varchar(8),
> ericj(&gt;   item_id     varchar(8),
> ericj(&gt;   quantity    int
> ericj(&gt; );
> ...
> ericj=&gt; CREATE VIEW sales_invoice AS (
> ericj(&gt;   SELECT sales_customer.name,
> ericj(&gt;     sales_purch.purch_date,
> ericj(&gt;     sales_item.name AS item_name,
> ericj(&gt;     sales_item.price,
> ericj(&gt;     sales_purch.quantity,
> ericj(&gt;     (sales_purch.quantity * sales_item.price) AS subtotal
> ericj(&gt;   FROM sales_customer, sales_item, sales_purch
> ericj(&gt;   WHERE (sales_customer.id = sales_purch.cust_id) AND
> ericj(&gt;         (sales_item.id = sales_purch.item_id)
> ericj(&gt; );
> ...
> ericj=&gt; </code></pre></td>
> </tr>
> </tbody>
> </table>
>
> </div>
>
> Notice how the VIEW fields have now changed from a simpler "fieldname" reference to a "tablename"."fieldname" reference instead (you can usually leave out the quotes as I did this time, but if you keep them, that order is important -- it is "tablename"."fieldname", not "tablename.fieldname"). When a fieldname is unique, this is not required, but in this example, all tables have their own "id" field, and PostgreSQL needs to know which "id" I meant.
>
> Then for readability, it pays to be consistent. The same concept goes for not needing capital letters for the commands. There's no syntax difference between "**SELECT \* FROM sales_item;**" and "**select \* from sales_item;**", but on the longer lines it helps to see at a glance which are my names and which are PostgreSQL terms.
>
> To enter the HTML image tag in a field, the text for that field should simply be the usual HTML tag you'd use in any web page. This way, the image itself isn't stored in the database, but rather the URL is, which will save space in the long run if your own database has scores or hundreds of entries. There's a bit of a trick in showing the images that way from a CGI script, and I'll delve into that topic in the next section.

Next Part:\
[Images and CGI Integration](sql2b.htm)

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
