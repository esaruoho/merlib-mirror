---
title: "Help -- Frequently Asked Questions."
source_domain: amasci.com
source_path: ~lhowell/bcp1662/notes/help.html
order: 4623
reachable_from_entry: false
images: 6
internal_links: 11
extracted: 2026-08-07T17:11:30Z
extractor: site_to_paper.py (pandoc)
---

# Help -- Frequently Asked Questions.

*Source page: `~lhowell/bcp1662/notes/help.html`*

## Help -- Frequently Asked Questions

Finally! I've been receiving questions and comments about my website since I first publicized it, but I haven't gotten around to updating this page to reflect the questions people have actually asked. Here's a start. If you're wondering about something else, [send me](mailto:lhowell@eskimo.com) your questions and I'll update the list.

------------------------------------------------------------------------

1.  **<span id="Psalter">I think there's a problem with your Psalter</span>**\
    Yes, there was a problem, due to my own carelessness. I had used the psalter from the 1928 American Book of Common Prayer rather than the English Book. Now that it's been pointed out to me, I've replaced the wrong version with the right one, taken from my "standard text" of 1987. Thanks to the visitors who pointed this out to me, and sorry for the mistake.

2.  **<span id="Advent">Why don't your collects for Advent match the ones I'm used to using?</span>**\
    Because I made a mistake. Sorry! Most of the collects in the 1979 American Book of Common Prayer are similar enough that I could cut-and-paste and then edit them where there were differences. Somehow, I missed the editing step for most of the Advent collects. I've rechecked everything now, so I think the other collects are safe. Thanks a lot to the visitors who pointed this out for me.

3.  **<span id="Download">Is there any way to download a particular service or the whole Book of Common Prayer at once?</span>**\
    I've finally added a collection of zipped ASCII, RTF, and HTML files, covering most (if not all) of the material on this website. See the [Download Page](../download/index.html) for information and links.

4.  **<span id="Buttons">What do the buttons mean?</span>**\
    At the bottom of each page, you'll find a set of buttons to help you find your way through the site. There are eight possible buttons, but not all buttons will be available from every page:

    | Button | Description |
    |----|----|
    | Previous | Moves you to the previous page. |
    | Contents | Takes you to the [Table of Contents](../intro/contents.html). |
    | Next | Moves you to the next page. |
    | Changes | Takes you to the [Alterations and Amendments](changes.html) page to find a modification relevant to this page. |
    | Help | Takes you to this list of frequently-asked questions. |
    | Search | Allows you to [search the site](search.html). |
    | Directory | Takes you to the [Site Directory](../directory.html). |
    | Home | Takes you to the Book of Common Prayer [home page](../index.html). |

    \

5.  **<span id="GoldenNumbers">Why are there yellow numbers</span> next to some dates in [March](../info/cal_1871/march.html) and [April](../info/cal_1871/april.html) on the [Calendar](../info/calendar.html)?**\
    These are the Golden Numbers, which are used to find Easter ([see below](#Prime)). Since 1900, the Golden Numbers shown in the Calendar are out of date. See the Table to find Easter [until 2199](../info/tables/easter1.html) or [from 2200 to 2299](../info/tables/easter3.html) for more information.

6.  **OK, so if the Golden Numbers have to do with finding Easter, why did the original Kalendar include them for all the months (eg., [September](../info/cal_1662/september.html))?**\
    I haven't a clue: I just typed what I saw. If anyone has any idea what these are for, let me know.

7.  **<span id="Prime">The</span> [Table of Moveable Feasts](../info/tables/almanac.html) lists a Golden Number, a Sunday Letter, and an Epact for each year. What are these and how are they used?**\
    The Golden Number, Epact, and Sunday Letter are useful in calculating the date of Easter. If you're looking for a detailed description of where each of these figures comes from, I recommend the [Calendar FAQ](http://www.pauahtun.org/CalendarFAQ/cal/node3.html#SECTION003122000000000000000), but I can give you a brief introduction to each. For more information about using the Golden Number and Sunday Letters, see a [Table to Find Easter](../info/tables/1752_easter3.html) and the [General Tables](../info/tables/general.html) for Finding Easter Day.

    <table width="90%" data-border="">
    <colgroup>
    <col style="width: 50%" />
    <col style="width: 50%" />
    </colgroup>
    <tbody>
    <tr data-valign="TOP">
    <td width="17%"><strong>Golden Number</strong><br />
    (also called <strong>Prime</strong>)</td>
    <td>Each year is assigned a Golden Number in order, starting at 1, going to 19, and then starting over again at 1. New moons occur on the same days in years with the same Golden Number.</td>
    </tr>
    <tr data-valign="TOP">
    <td><strong>Epact</strong></td>
    <td>The Epact is the age of the moon (in days) on January 1. I don't really know why it's included in the Table of Moveable Feasts; it isn't used in any of the other tables.</td>
    </tr>
    <tr data-valign="TOP">
    <td><strong>Sunday Letter</strong></td>
    <td>Each day of the year, starting with January 1, is assigned a letter from A to G, repeated over and over. Whatever letter is assigned to the first Sunday in the year is the Sunday Letter for that year: all other days with that letter will be Sundays. Since February 29 is not assigned a letter, leap years mess up the repetition. In the Table of Moveable Feasts, when a year is shown with two letters, it is a leap year. The first letter is the Sunday Letter for January and February; the second letter is used for the rest of the year.</td>
    </tr>
    </tbody>
    </table>

    \

8.  **Why doesn't it know what day it is? I asked for today's readings and it gave me the readings for yesterday/tomorrow.**\
    There are two possibilities:

    1.  You may be on the vigil of a Sunday or Holy-day (see the rubric for the [Collects, Epistles, and Gospels](../communion/readings.html)); or
    2.  You may be running into a problem I wasn't able to fix. The script that calculates what readings to give you is written in Perl--which I don't know very well--and I had to choose between Greenwich Mean Time and Pacific Time (my server is in Seattle, Washington, USA). I chose GMT because it seemed less random. If anyone can tell me how to get the time zone from a browser, I'll happily use that instead.

------------------------------------------------------------------------

**[<img src="../images/buttons/previous.gif" data-border="0" width="82" height="30" alt="[Previous Page]" />](index.html)[<img src="../images/buttons/contents.gif" data-border="0" width="80" height="30" alt="[Contents]" />](../intro/contents.html)[<img src="../images/buttons/next.gif" data-border="0" width="57" height="30" alt="[Next Page]" />](sources.html)[<img src="../images/buttons/search.gif" data-border="0" width="67" height="30" alt="[Help]" />](search.html)[<img src="../images/buttons/directory.gif" data-border="0" width="82" height="30" alt="[Directory]" />](../directory.html)[<img src="../images/buttons/home.gif" data-border="0" width="65" height="30" alt="[Home]" />](../index.html)**
