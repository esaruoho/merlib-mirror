WordPress &rsaquo; ReadMe 

 Version 2.9

 Semantic Personal Publishing Platform 

 First Things First 
 Welcome. WordPress is a very special project to me. Every developer and contributor adds something unique to the mix, and together we create something beautiful that I'm proud to be a part of. Thousands of hours have gone into WordPress, and we're dedicated to making it better every day. Thank you for making it part of your world. 
 &#8212; Matt Mullenweg 

 Installation: Famous 5-minute install 

 Unzip the package in an empty directory. 
 Open up wp-config-sample.php with a text editor like WordPad or similar and fill in your database connection details. 
 Save the file as wp-config.php 
 Upload everything. 
 Open /wp-admin/install.php in your browser. This should setup the tables needed for your blog. If there is an error, double check your wp-config.php file, and try again. If it fails again, please go to the support forums with as much data as you can gather. 
 Note the password given to you. 
 The install script should then send you to the login page . Sign in with the username admin and the password generated during the installation. You can then click on 'Profile' to change the password. 

 Upgrading 
 Before you upgrade anything, make sure you have backup copies of any files you may have modified such as index.php . 
 Upgrading from any previous WordPress to 2.9: 

 Delete your old WP files, saving ones you've modified. 
 Upload the new files. 
 Point your browser to /wp-admin/upgrade.php . 
 You wanted more, perhaps? That's it! 

 Template Changes 
 If you have customized your templates you will probably have to make some changes to them. If you're converting your 1.2 or earlier templates, we've created a special guide for you . 

 Online Resources 
 If you have any questions that aren't addressed in this document, please take advantage of WordPress' numerous online resources: 

 The WordPress Codex 
 The Codex is the encyclopedia of all things WordPress. It is the most comprehensive source of information for WordPress available. 
 The Development Blog 
 This is where you'll find the latest updates and news related to WordPress. Bookmark and check often. 
 WordPress Planet 
 The WordPress Planet is a news aggregator that brings together posts from WordPress blogs around the web. 
 WordPress Support Forums 
 If you've looked everywhere and still can't find an answer, the support forums are very active and have a large community ready to help. To help them help you be sure to use a descriptive thread title and describe your question in as much detail as possible. 
 WordPress IRC Channel 
 Finally, there is an online chat channel that is used for discussion among people who use WordPress and occasionally support topics. The above wiki page should point you in the right direction. ( irc.freenode.net #wordpress ) 

 System Recommendations 

 PHP version 4.3 or higher. 
 MySQL version 4.1.2 or higher. 
 ... and a link to http://wordpress.org on your site. 

 WordPress is the official continuation of b2/caf&eacute;log , which came from Michel V. The work has been continued by the WordPress developers . If you would like to support WordPress, please consider donating . 

 Upgrading from another system 
 WordPress can import from a number of systems . First you need to get WordPress installed and working as described above. 

 XML-RPC and Atom Interface 
 You can now post to your WordPress blog with tools like Windows Live Writer , Ecto , Bloggar , Radio Userland (which means you can use Radio's email-to-blog feature), NewzCrawler , and other tools that support the Blogging APIs! :) You can read more about XML-RPC support on the Codex . 

 Post via Email 
 You can post from an email client! To set this up go to your "Writing" options screen and fill in the connection details for your secret POP3 account. Then you need to set up wp-mail.php to execute periodically to check the mailbox for new posts. You can do it with Cron-jobs, or if your host doesn't support it you can look into the various website-monitoring services, and make them check your wp-mail.php URL. 
 Posting is easy: Any email sent to the address you specify will be posted, with the subject as the title. It is best to keep the address discrete. The script will delete emails that are successfully posted. 

 User Roles 
 We've eliminated user levels in order to make way for the much more flexible roles system introduced in 2.0. You can read more about Roles and Capabilities on the Codex . 

 Final notes 

 If you have any suggestions, ideas, comments, or if you (gasp!) found a bug, join us in the Support Forums . 
 WordPress now has a robust plugin API that makes extending the code easy. If you are a developer interested in utilizing this see the plugin documentation in the Codex . In most all cases you shouldn't modify any of the core code. 

 Share the Love 
 WordPress has no multi-million dollar marketing campaign or celebrity sponsors, but we do have something even better&#8212;you. If you enjoy WordPress please consider telling a friend, setting it up for someone less knowledgable than yourself, or writing the author of a media article that overlooks us. 

 Copyright 
 WordPress is released under the GPL (see license.txt ).