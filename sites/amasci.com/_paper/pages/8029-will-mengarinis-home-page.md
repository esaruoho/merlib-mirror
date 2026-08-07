---
title: "Will Mengarini's home page"
source_domain: amasci.com
source_path: ~seldon/index.html
order: 8029
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T17:15:39Z
extractor: site_to_paper.py (pandoc)
---

# Will Mengarini's home page

*Source page: `~seldon/index.html`*

# Will Mengarini's home page

[in association with Amazon.com](http://www.amazon.com/exec/obidos/redirect?tag=willmengarshomep&path=subst/partners/associates/associates.html)

[](mailto:seldon@eskimo.com)

I'm a software engineer in Seattle WA USA.\
The focus of my professional interest is quality in software.\
All software on this page is free.

[now.h](now.h) [wm-root.h](wm-root.h) [now.cpp](now.cpp) This is a self-testing C++ package that implements a more powerful version of the `assert()` macro. It was designed for Borland C++ v3.1, which doesn't have exceptions, so it includes a workaround for that lack; the workaround could be a nuisance when using more modern compilers, but this package could be modified for use with them.

[filemenu.el](filemenu.el) An [Emacs](http://www.amazon.com/exec/obidos/ASIN/0387976167/willmengarshomep) package that lets you take a text file containing the names of other files that you visit frequently and use it as a menu. File names may contain spaces, may be arranged in multiple columns on a line, and may have their directories elided. Richard Stallman has decided to incorporate this package into GNU Emacs.

[vi-dot.el](vi-dot.el) This Emacs package defines a command that repeats the preceding command, whatever that was. The command is called \`vi-dot' because the vi editor does that when "." is pressed in its command mode. This lets you easily repeat commands that have multi-key bindings, such as <span class="kbd">C-x e</span> for `call-last-kbd-macro`. Richard Stallman has decided to incorporate this package into GNU Emacs.

[counter.el](counter.el) An Emacs package that inserts series of numbers or other objects into the buffer. You can insert whole series with a single command, or one item per command, allowing you to use keyboard macros to control the formatting and positioning of series elements (as when you're inserting columns of numbers). There is also a facility to allow you to renumber a possibly-noncontiguous column, such as occurs with numbered paragraphs.

[diminish.el](diminish.el) An Emacs package that diminishes the amount of space taken on the mode line by the names of minor modes. People do seem to have a problem with this; some minor mode developers have gone to the trouble of defining customizable variables for mode line displays. But most minor modes don't have such customization, and this package makes mode-specific code in each minor-mode package unnecessary. Richard Stallman has decided to incorporate this package into GNU Emacs.

[jiggle.el](jiggle.el) An Emacs minor mode that jiggles the cursor in situations where it can be hard to find. On windowing systems, the Emacs cursor is a steady box rather than the blinking underscore common on terminal systems; with small fonts, this can be hard to find when you're switching to a new buffer. I found I was constantly just flicking the cursor to the beginning or end of the line just to find it when I switched buffers. This jiggles it automatically when switching buffers, without moving point or requiring a command. It also optionally jiggles it during searches and query-replaces, when manual cursor flicking would terminate the search or replace. Implementing this required implementing a buffer-switch-hook; no such hook is built in to GNU Emacs 19.34, so just having the hook might be a sufficient reason to load the package, even if you don't need cursor jiggling. I have been told that this package also works with XEmacs 20.3.

[fuzz.el](fuzz.el) [fastfuzz.el](fastfuzz.el) Emacs packages containing functions to compensate for floating-point roundoff problems. For example, `fuzzyzerop` is a replacement for `zerop` that returns `t` if its argument is nearly zero, rather than requiring it to be exact. Fastfuzz.el defines equality without using division, so it's faster, but inaccurate at extreme magnitudes; it would be useful for something like checking whether probabilities sum to 1.0.

[orthodox.el](orthodox.el) An Emacs package that preserves the orthodox Emacs keymap, so that after the user customizes its mappings with functions like `global-set-key`, the orthodox mappings can still be accessed and executed by prefixing them with <span class="kbd">M-o</span> (aka <span class="kbd">\<Alt-o\></span>).

[abbrev-sort.el](abbrev-sort.el) An Emacs package that causes abbrevs to be written sorted, for both <span class="kbd">M-x edit-abbrevs</span> and <span class="kbd">M-x write-abbrev-file</span>. This makes them easier to find when editing abbrevs (they're sorted on expansion), and allows meaningful comparison with previous versions of abbrev files that are under version control.

[typematic.el](typematic.el) An Emacs package that causes multiple taps on <span class="kbd">C-u</span> to produce successive arguments of 1, 2, 3, etc., instead of 4, 16, 64, etc. (On a modern keyboard with fast typematic, large arguments can still be easily generated, and this gives them more precision.) It remains possible to use `(interactive "P")` to distinguish whether arguments were implicitly or explicitly generated.

[orwell.el](orwell.el) An Emacs package that exchanges the <span class="kbd">C-h</span> and <span class="kbd">DEL</span> keys (aka <span class="kbd">\<Ctrl-h\></span> and <span class="kbd">\<Backspace\></span>) without affecting prefix mappings; in other words, <span class="kbd">C-h</span> becomes `delete-backward-char` and <span class="kbd">DEL</span> becomes `help-command`, but mappings like <span class="kbd">C-M-h</span> and <span class="kbd">C-x DEL</span> are unaffected.

[dotemacs.el](dotemacs.el) The file I use to initialize my Emacs sessions, loaded from .emacs under Unix or \_emacs under Windows. This file contains more than 3,000 lines of Lisp code, with many utility functions not usually found in .emacs files. Examples: a set of 8 iteration macros for counting loops, allowing code like

         (upto i 0 8
           (do-something-with i))

along with aliases intended for use in the eval-expression minibuffer that allow a minibuffer entry like

> (u i 0 8 (f "%02d" i))

to insert `01` to `08` into the text buffer; a set of mapping macros that have the lambda built in; an `apply*` that works like `apply` but can handle special forms as well as functions, so something like

> (if (apply\* 'and (mapcar 'fboundp list-of-symbols)) ...)

works; a `save-syntax` analogous to `save-excursion`, for temporarily modifying syntax tables; Perl's `split` and `join`; a `tabs` function that allows `(tabs 7 10 12)` to set tab stops at 7, 10, 12, 14, 16, etc (i.e. the final interval is repeated); a function called `show` that's equivalent to Fortran `NAMELIST` (ah, nostalgia) or PL/I `PUT DATA`; a function for dittoing chars from the preceding line; a wrapper for `fill-paragraph` that allows a sequence of <span class="kbd">M-q</span> commands to each refill the paragraph with a temporary `fill-column` one less than that used by the previous command; a replacement `string-rectangle` that respects `overwrite-mode`; an analogous `expression-rectangle` that inserts the value of an expression, instead of a literal string, along with a default expression history for that command including expressions that insert columns of contiguous or noncontiguous numbers, or sum columns; code to dial the phone number at point by sending strings to a modem; a hack that lets `sort-columns` work on Windows, where it normally fails because it can't find the Unix system sort; a hack that causes <span class="kbd">C-h f</span> (or <span class="kbd">\<Backspace\>\<f\></span> if you're using my orwell.el) to display the function description in a window that's been shrunk as much as possible; a hack that removes the "~" from the ends of backup files' names and instead puts them in subdirectories subordinate to the original files' directories; and quite a bit more. Remember that this is a dotemacs, not a polished package; it's mostly the equivalent of beta code, or even alpha. You need to be an Emacs Lisp hacker to benefit from it.

[selftest.pl](selftest.pl) Most of my code is self-testing; i.e., it has built-in automated regression testing. I use this package to implement self-testing code in Perl; it works for Perl 4.036, 5.001, and 5.004.

[ask.pl](ask.pl) A Perl (version 4 or 5) package for line-oriented user interaction. For example, to ask a yes/no question or prompt for a number, you could use the functions defined here.

[ttyForm.pl](ttyForm.pl) A Perl (version 4 or 5) package implementing filling out a form consisting entirely of numeric fields on a line-oriented terminal. Non-numeric answers are used to move around among the fields, giving the effect of the random access that's available on smarter terminals. It would be fairly easy to extend the package to accept non-numeric field entries, using things like control characters for moving around.

[fp.pl](fp.pl) A Perl (version 5.004) package for computing function points, which are software metrics intended to give a scalar measure of quantity of functionality in software. For an introduction to software metrics including function points, see the book *Applied Software Measurement* by Capers Jones.

[URLs](URLs) An [AWK](http://www.amazon.com/exec/obidos/ASIN/020107981X/willmengarshomep) filter that inputs text containing URLs and outputs an HTML page that can be used for accessing those URLs. Useful when reading Usenet under a Unix shell.

[bin](bin) A ksh script that works around the poor command-line path completion of pdksh; a command like <span class="kbd">bin scri\*</span>, executed in `$HOME`, could be used to edit `bin/scriptWithReallyLongName`.

[ng](ng.txt) A bash or ksh shell function that shows how to cope with a sometimes-annoying feature of the Unix system sort: when the comparison function considers two lines to be equal, the order in which it outputs them is random. This function, `ng()`, displays newsgroup names that match a regexp; but it searches two files for them, `/usr/lib/news/newsgroups`, which is sometimes out of date but contains one-line descriptions, and `/usr/lib/news/active`, which is always up to date but contains no descriptions. I wanted to print the `**/active` line only if `**/newsgroups` had no corresponding line. I eventually found a painful one-liner that does it.

[fnortpth.icn](fnortpth.icn) A program in [Icon](http://www.cs.arizona.edu/icon/), a string-processing derivative of Snobol that is syntactically completely different but retains the succeed/fail concept of expression evaluation. This program translates output from some old file-listing utilities into a different format; the application is not useful for modern OSs, but the program shows a structured approach to Icon string scanning.

[dabbrev.m](dabbrev.m) A macro for BRIEF 2.10 that simulates the Emacs function `dabbrev-expand`.

[dabbrev-vi.txt](dabbrev-vi.txt) A macro for classic vi that simulates the Emacs function `dabbrev-expand`.

[attribute](attribute) An [AWK](http://www.amazon.com/exec/obidos/ASIN/020107981X/willmengarshomep) filter that inputs e-mail (perhaps quoted with leading `> `), searches for the `From: ` line, and prepends an attribution like `On <date> <name> wrote: `. This could be useful to people using the *Elm* mail user agent.

[Loop control in Perl](winkies.htm) a style issue

[either.cpp](either.cpp) This is what happens when an [Icon](http://www.amazon.com/exec/obidos/ASIN/1573980013/willmengarshomep) programmer learns C++. Very sad, really; very sad. I was younger then. Much younger. Ah, youth.

[Dweeb Loneliness](dweeb.htm) Thoughts of a dry brain in a dry season.
