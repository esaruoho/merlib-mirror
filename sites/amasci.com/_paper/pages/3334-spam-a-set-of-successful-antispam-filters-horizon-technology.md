---
title: "Spam, A set of successful antispam filters (Horizon Technology)"
source_domain: amasci.com
source_path: ~ghawk/antispam/index.html
order: 3334
reachable_from_entry: false
images: 4
internal_links: 0
extracted: 2026-08-07T05:56:42Z
extractor: site_to_paper.py (pandoc)
---

# Spam, A set of successful antispam filters (Horizon Technology)

*Source page: `~ghawk/antispam/index.html`*

[<img src="http://www.eskimo.com/~ghawk/images/htech0.gif" data-align="right" data-border="0" width="140" height="87" />](http://www.eskimo.com/~ghawk/)\

# **My Successful AntiSpam Filters** (Step-by-step)

December 12, 2001\
\
***This is the solution I'm using to battle the flood of spam these days, an approach that is somewhere around 99% successful. This will guide you through installing the filters if you would like to try them.***

------------------------------------------------------------------------

It's not a tough as it looks!

**What you will need:**\

- An Internet Service Provider (ISP) using Unix or Linux rather than Windows.
- Ability to telnet or ftp to it.
- Installed on that server (ISP): Procmail and Formail (and Perl if you want to be able to view the summary of what worked).
- At home: Email software that can filter messages.

**How it works:**\
When your mail is processed as it passes through your ISP, a key file (*.forward*) can tell it to be sent through Procmail before being sent on to you. (Procmail is typically already there). During that processing, Procmail reads a file you create (see below) to know what you want it to do. This is similar to creating your own filters in your own home email program, but this approach adds an important layer of reporting so you can see what's going on.

The beauty of this thing is that you can look at the headers at home and see why it got filtered, and it will also create log files so you can view a summary of what is working (example below).

In the Procmail configuration file (*.procmailrc*), a new header is added to the messages if they match any of the spam filters, based on various criteria (such as keywords in the body, or certain combinations of things in the message headers). Mail is not saved to the server (as is usually done with Procmail). At home, one single filter is all that is needed to sort those messages that Procmail has "flagged" as suspected spam. All of those fine products can then be ordered all at one time later (much later).

Minimally you need to have two files on the server, *.forward* and *.procmailrc*, and set the single filter in your home email program \[steps (1), (2), and (3) below\].

**1. [.forward](forward.txt) (sends to Procmail)**\
This file contains one single line, telling the mail program on the ISP to send your mail through the Procmail filter. *.forward* goes in your home (user root) folder on the ISP and looks like this:

    "|procmail_wrapper -Yf- #ghawk"

My root folder on the ISP is /u/g/ghawk/. Configurations vary, but you are typically in that folder when you telnet in. (Note the dot (.) at the start of the filenames *.forward* and *.procmailrc* are necessary).

Create *.forward* and replace 'ghawk' with your login name. This file needs to have permissions 644 (with the essential part of that being the last '4', world-readable). If you are telnetting to your ISP, type 'chmod 644 .forward' at the shell prompt.

**2. [.procmailrc](procmailrc.txt) (your instructions to Procmail)**\
This is the heart of it, the actual set of spam filters. See the details by clicking its link above. Copy that file to your user root directory on the ISP, and name it *.procmailrc*. Edit the section that says `(apples|pears|oranges)` to add strings that would represent mail you know is never spam.

**3. Outlook/Eudora/Pegasus etc filters** (in your home email program)\
Set a filter to look for the string '*Suspected_Spam*' in the headers of incoming mail, and move those to a folder you create, so they will not go to your inbox. 'Suspected_Spam' is part of the header that these filters add while the mail is being processed on the server (and the rest is the detail of which section matched). In Outlook, a filter is added by starting with a click on 'Tools \> Rules Wizard'.

![](ruleswiz.gif)\
Set a rule (filter) to look for the string 'Suspected_Spam' in the headers.

**4. A 'mail' folder on your ISP (for log files, recommended)**\
This folder is where the log files will be kept. It is not absolutely necessary, but should be created unless you want to edit *.procmailrc* to not use logfiles. Create the folder on the ISP by typing 'mkdir mail' while in your home directory in a telnet session. It does not have to be called 'mail', could be anything else you want, but if you use something else, you'll need to edit .procmailrc. The 'mail' folder here is case-sensitive.

![](telnet.gif)\
Create a 'mail' folder if you want the log files.

Notice the log files are very large. You'll want to delete them once in awhile. Again, they are not necessary (if you don't care about the summary), but *.procmailrc* is set to use them.

------------------------------------------------------------------------

## **Now you're done.**

\
Send yourself a piece of mail with the word "Guarantee" in it (or "Credit card" or something) to make sure it is working.

------------------------------------------------------------------------

\
**5. [Summary.pl](summary.pl.txt) (Optional, to show you what is working)**\
This is a perl script that scans your *.procmailrc* and logfiles and counts the number of times a "recipe" in *.procmailrc* has matched. You can run this script whenever you like. To run it, your ISP must have Perl installed (and most do). It needs to be run from the shell prompt. Just store it in your new 'mail' folder on the server, telnet in, and type 'summary.pl'. Before running it the first time, you need to set its permissions so you can execute it. Type 'chmod 700 summary.pl' to make it executable.

Here is a sample output from summary.pl, so you can get an idea of what has been working for me lately, and see what its results look like:

    /u/g/ghawk/mail>summary.pl
            
            114     <table 
             85     removed
             72     <center
             45     ^To.*undisclosed
             31     REMOVE.*subject 
             29     1618
             24     <p.*align.*=.*center
             23     more information
             20     ^Subject:.*free 
             19     ^Subject:.*$    
             19     Credit Card    
             15     ^Subject:.*money
             12     ^From:.*free
             12     !!!   
             10     call.*[0-9][0-9][0-9]-
              9     not spam
              8     name.*______
              8     Money Order 
              7     ^To.*free   
              5     guarantee
              4     ^Subject:.*email
              4     American Express
              3     ^Subject:.*adult
              2     toll free
              2     removeyou.com
              2     click.*here  
              1     ^Subject:.*investigat
              1     ^Subject:.*Secret

I cleaned those up a tad bit for readablility here. This stuff can be a little bit cryptic to the average human but if you are disgusted enough about spam, you'll get used to Procmail syntax soon enough. And let me tell you, it's great to be winning the spam battle.

You can adjust the "recipes" in *.procmailrc* to edit or remove any that are not catching spam very often.

Note that one piece of mail may match on several different recipes. With a little analysis, you might find some recipes that can be eliminated because others always have you covered.

------------------------------------------------------------------------

\
If you run into a snag, contact 'support' at your ISP or email me.

[Procmail man page](http://www.dca.fee.unicamp.br/cgi-bin/man2html/n/mail/man/man5/procmailrc.5)\
[Formail man page](http://www.dca.fee.unicamp.br/cgi-bin/man2html/n/mail/man/man1/formail.1)

[ghawk@eskimo.com\
<img src="http://www.eskimo.com/~ghawk/images/mailbox.gif" data-border="0" />](email_rotary.htm)
