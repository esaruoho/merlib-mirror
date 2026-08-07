---
title: "One Step Procmail UCE Filter Installation"
source_domain: amasci.com
source_path: ~parents/filter/index.html
order: 5697
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T05:58:41Z
extractor: site_to_paper.py (pandoc)
---

# One Step Procmail UCE Filter Installation

*Source page: `~parents/filter/index.html`*

## One Step UCE (Spam) Filter Installation

[Introduction](#intro)\
[The Script](#script)\
[Examples](#examples)\
[Available UCE Filters](#filters)\
[Including Available Filters into Existing .procmailrc](#edit)\
[Monitoring the Filter Activity](#monitor)\
[Contributing Your Recipes](#contrib)\
[Frequently asked questions](#faq)\

### <span id="intro">Introduction</span>

Procmail is a really powerful tool for filtering unwanted unsolicited commercial emails (UCE) aka SPAM, but it is a bit of pain to learn and it is easy to screw up.\
This page shows you how to easily take advantage of an already existing set of excellent UCE filters written by proficient users here at eskimo.\
All you have to do is type one line at the shell prompt in your home directory. A little script will take care of writing the necessary files into your home directory and you are set. But before you do so, please read all of this page, as it contains important information about what might happen to your email.\
Basically the filters just divert suspected UCE to a file, where you can inspect them later. No filter is perfect, so you might still receive UCE in your inbox, and legit email might be diverted to the spambox. Apparently it's a matter of taste which one is worse. You will have the choice between various filters, so you can get the results you like the most. Even if legit mail get's accidently filtered, you shouldn't lose it (unless you designated /dev/null as your spambox (Don't do it!)). Monitor your spambox periodically.

### <span id="script">The Script</span>

install_spam_filter ([source here](install_spam_filter)) by Christian Bantzer <parents@eskimo.com>\
(for now) run as

    /u/p/parents/install_spam_filter

It is intended for the user who doesn't want to bother with creating and editing files using the unix shell. So it only runs if .forward and .procmail don't exist yet. If they do you are probably using procmail already and you are expected to be capable of editing those files again to take advantage of publicly available filter recipes ([see below](#edit)).

You can customize the script's result by supplying it with one or more of the following command line options

-h  
Prints a short message on how to use install_spam_filter on the screen.

-f 'filter-names'  
You can select one or more filters from a [set of available filters](#filters). If you choose more than one filter make sure to enclose the list of names in quotes. \[Default: jon1\]

-l logfile  
Procmail keeps a log of what it does with your email and writes it into the file you specify with the -l option \[Default: procmail.log\]\
There is a routine called mailstat which you can feed the logfile into. It will produce a little statistic of how many emails were put where. Type:

     mailstat logfilename

-s spambox  
When a suspected UCE is filtered it will be written into the file you specifiy with the -s option. Be sure to check the content of this file periodically. No filter is perfect. Sometimes a legitimate email might be filtered. This file is still in mailbox format, so you can read it from a mail reader like pine or elm. \[Default: spambox\]

<span id="voption">-v 'virtualdomains'</span>  
If you want to use the [jon6](#jon6) filter **and** have virtual domain(s), you should specify your domain(s) with this option. All mail addressed to those domains will be exempted from jon6. If you want to exempt more than one domain name, be sure to enclose the list of domains in 'quotes'

If you want to stop using the UCE filters just remove the .foward and .procmail files from your home directory. Type:

    rm .forward .procmailrc

If you want to remove or add a specific filter, remove your .forward and .procmailrc and run install_spam_filter again with changed options.

------------------------------------------------------------------------

<span id="examples"></span>

### Examples

- You want to use the filters jon1, jon2, and jon5 and the default logfile and spambox names are ok with you. Type:

      /u/p/parents/install_spam_filter -f 'jon1 jon2 jon5'

- You want to give the logfile a different name. Type:

      /u/p/parents/install_spam_filter -f 'jon1 jon2 jon5' -l logname

- You want to put the spambox into the default mail folder for pine, so it will show up in pine as one of your mail folders for easy monitoring. Type:

      /u/p/parents/install_spam_filter -f 'jon1 jon2 jon5' -s mail/spambox

- You want to filter out all mail which is not explicitly addressed to you, or one of your virtual domains (vdom1.com vdom2.org). Type:

       /u/p/parents/install_spam_filter -f jon6 -v 'vdom1.com vdom2.org'

------------------------------------------------------------------------

<span id="filters"></span>

### The Filters

These filters have been written by generous individuals here on eskimo, please direct your comments about a specific filter to the filter's author.\
Supply the names of the filters you want to install to install_spam_filter with the -f option.

**Open Relay Filter**.

Mail servers can be configured to allow anyone on the internet to send email through them (open relay). Since this allows the sender to cover the true originating server of the email, most spam is sent through open relay servers.

relay ([source here](relay))  
This filter uses the [ORBS](http://www.orbs.org) database of open relay mail servers, and rejects all email sent through a server listed in the database.

Open relay servers are usually abused by spammers, i.e. the organization responsible for the server usually is legitimate, and the server is just misconfigured. That means there might be legitimate email coming from legitimate users of that system, which will be rejected. However, before listing a server in the ORBS database, its administrator will have been informed about the potential for abuse of his/her server, and will have had time to take simple measures to stop the abuse.

**Filters by Jon** (<raquele@eskimo.com>). Details [here](http://www.eskimo.com/~raquele/filter/) (like how to receive automatic email notifications when the filters are changed)

<span id="Jon">jon1</span> ([source here](jon1))  
This filter works on the header of the email and filters mail

- from known spam domains,
- sent with spam program (Extractor, floodgate)
- addressed to you@ or friend@
- with \$\$ in the subject line
- etc., details [here](http://www.eskimo.com/~raquele/filter/index.html#jon1)

There is a chance that legit email get's caught by this one, particularly if you have friends who write you letters with \$\$\$ in the subject. I don't, so it never happened for me.

<!-- -->

jon2 ([source here](jon2))  
This filter works on the body of the email and filters mail which contains

- one time mailing
- reply remove
- Check out the hottest new
- This message was composed using extractor
- \$\$\$\$
- etc., details [here](http://www.eskimo.com/~raquele/filter/index.html#jon2)

There is a chance that legit email get's caught by this one, particularly if you have friends who write you about how much \$\$\$ they make or that this is a one time mailing. I don't, so it never happened for me. (And this one catches most of the UCE I receive)

<!-- -->

jon3 ([source here](jon3))  
This filter works on the body of the email and filters mail which contains

- Dear friend at the very beginning of a line, details [here](http://www.eskimo.com/~raquele/filter/index.html#jon3)

This was spun out of jon2 because it looks pretty drastic, but it is good for those \$50000 in 90 days mailings. I actually received a legit email addressing me as "Dear friend" ONCE.

<!-- -->

jon4 ([source here](jon4))  
This filter works on the header of the email and filters mail

- from a long list of blacklisted sites and individuals, details [here](http://www.eskimo.com/~raquele/filter/index.html#jon4)

It is really unlikely that this one will catch legit email.

<!-- -->

jon5 ([source here](jon5))  
This filter works on the header of the email and filters mail

- which's header contains "Comment: authenticated" but no X-Mailer, details [here](http://www.eskimo.com/~raquele/filter/index.html#jon5)

(A sign that the header was tempered with) It is really unlikely that this one will catch legit email.

<!-- -->

<span id="jon6">jon6</span> ([source here](jon6))  
This filter works on the header of the email and filters mail

- which is not addressed to you, i.e. your email address appears in neither the To: nor the CC: field. details [here](http://www.eskimo.com/~raquele/filter/index.html#jon6)

Be sure to divert **all** mailing list mail before this filter is invoked. This filter also catches mail where your address is in the blind carbon copy field, so be sure to check your spambox for legit mail.\
If you have a virtual domain you should use the [-v option](#voption).

------------------------------------------------------------------------

<span id="edit"></span>

### Adding publicly available filters to existing .procmailrc

Set the Variable `SPAMBOX` in your .procmailrc and append the following line to your existing .procmailrc once for each filter you want to add.

    INCLUDERC=filterpath

where filterpath is the path to the file containing the recipe.

Paths are:

- For [Jon's filters](#Jon)

       /u/r/raquele/procmail/spamfilter#.rc 

  where \# goes from 1 through 5.

------------------------------------------------------------------------

<span id="monitor"></span>

### Monitoring Filter Activity

You should monitor the spambox file periodically, especially in the beginning, to make sure the filters do what you expect them to do.\
A convenient way to check the content of the spambox is to access it with a mail reader like pine or elm. Then you just need to read through the subject lines. (`pine -f spambox` or `elm -f spambox`, see the [examples](#examples) on how to set it up to be even more convenient)\
Should you find a legit email open (read) it and look into the header (in pine you need to type H to get into full header mode) the last line of the header will be something like

    X-Suspected-Spam: Caught by /u/r/raquele/procmail/spamfilter2.rc

This tells you which filter filtered the mail you actually expected in your inbox. If one particular filter catches a lot of your legit email you might consider droping it.

------------------------------------------------------------------------

<span id="contrib"></span>

### Contributing Your Recipes

There are basically only two requirements for your recipes.

- Suspected UCE should go to the file specified in the variable `$SPAMBOX`
- A `X-Suspected-Spam:` line should be added to the filtered mail's header, identifying the specific filter recipe.

Then you should write a short web page which describes in detail what will be filtered. That page will be linked to from this page here.\
Also it would be nice if you gave users of your filter the option to subscribe to a mailing list, so you can let them know, when you change the recipes.\
mail me: <parents@eskimo.com>

------------------------------------------------------------------------

<span id="faq"></span>

### No questions so far
