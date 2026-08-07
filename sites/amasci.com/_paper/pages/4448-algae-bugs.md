---
title: "Algae: Bugs"
source_domain: amasci.com
source_path: ~ksh/algae/algae_9.html
order: 4448
reachable_from_entry: false
images: 1
internal_links: 8
extracted: 2026-08-07T17:11:14Z
extractor: site_to_paper.py (pandoc)
---

# Algae: Bugs

*Source page: `~ksh/algae/algae_9.html`*

<span id="SEC54"></span>

|  |  |  |  |  |  |  |  |  |  |  |
|----|----|----|----|----|----|----|----|----|----|----|
| \[ [\<\<](algae_8.html#SEC53) \] | \[ [\>\>](algae_10.html#SEC57) \] |   |   |   |   |   | \[[Top](algae.html#SEC_Top)\] | \[[Contents](algae_toc.html#SEC_Contents)\] | \[[Index](algae_10.html#SEC57)\] | \[ [?](algae_abt.html#SEC_About) \] |

------------------------------------------------------------------------

# ![](icon.gif) 9. Bugs

Your bug reports play an essential role in making `algae` reliable. By reporting a bug, you may or may not get a timely solution to your problem. Either way, bug reports help us to make the next version of `algae` better. In addition, your comments or criticisms on `algae` or the Algae language are also welcomed.

<span id="IDX540"></span> The `algae` interpreter is incomplete. There are several operations that it should be able to perform but that have not yet been implemented. These cases elicit a "detour" message from `algae`. Since they're not bugs, you don't need to tell us about them. Still, complaining about them might get them fixed.

> |                                          |     |     |
> |:-----------------------------------------|-----|:----|
> | [9.1 Reporting Bugs](algae_9.html#SEC55) |     |     |
> | [9.2 Reported Bugs](algae_9.html#SEC56)  |     |     |

<span id="Reporting Bugs"></span>

------------------------------------------------------------------------

<span id="SEC55"></span>

## 9.1 Reporting Bugs

In order for a bug report to serve its purpose, you must include the information we need to fix it. As the GNU people say, "report all the facts". But never mind Joe Friday--the more information the better. It usually doesn't pay to explore the "envelope" of the bug; that is, changes to the input that affect it. Providing a simple example is the best way to get a bug fixed.

You should include the following information with your bug report:

- The version of `algae`. You can get this by running it with the `` `-V' `` option.
- A complete input file that will reproduce the bug. A single statement is generally not sufficient.
- The type of machine you are using, and the operating system name and version number.
- A description of what behavior you observe that you believe is incorrect.

Send bug reports to:

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>ksh@sideslip.org</code></pre></td>
</tr>
</tbody>
</table>

or, as a last resort, mail them to:

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>Algae Bugs
Attn: Scott Hunziker
The Boeing Company
P.O. Box 3707, MC 4C-41
Seattle, WA  98124-2207</code></pre></td>
</tr>
</tbody>
</table>

<span id="Reported Bugs"></span>

------------------------------------------------------------------------

<span id="SEC56"></span>

## 9.2 Reported Bugs

Below is a list of bugs that are known to exist in the current version of `algae` and are waiting to be fixed.

1  
Recurse deep enough, and `algae` dumps core. For example, the expression

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>function () { return self(); } ()</code></pre></td>
</tr>
</tbody>
</table>

will not return gracefully. (I just tried it, and I had to reboot my machine!) It usually takes more than 500 levels of recursion to hit this bug, though, so you'll probably only encounter it with runaway functions.

16  
We have problems when a parse error occurs in a recursive call to the parser. Local variables created in the recursive call are left in an invalid state. This happens, for example, if you call the `source` function from an interactive session and encounter a parse error in the process.

22  
Every time Algae parses a file, it leaks the memory in which the name of that file is stored. The names are kept around because user functions refer to them. Instead, we should arrange for the names to be stored with each user function so that they get deleted when the function is deleted.

23  
When Algae reads a binary file that contains a user function, it allocates memory for every string constant in that function. If you then delete that function, this memory is leaked.

24  
We use the texi2html program to make Algae's HTML documentation from the texinfo source. Among its numerous deficiencies, it sometimes splits an anchor from the text with which it is supposed to be associated. For example (from algae-3.5.0), the anchor for the section named "Running Algae" is put at the bottom of the file `` `algae_6.html' `` instead of at the top of `` `algae_7.html' `` where it belongs. For this reason, the Algae `info` function may not take you to the right place in the document.

<span id="Concept Index"></span>

------------------------------------------------------------------------

|  |  |  |  |  |  |  |  |  |  |  |
|----|----|----|----|----|----|----|----|----|----|----|
| \[ [\<\<](algae_9.html#SEC54) \] | \[ [\>\>](algae_10.html#SEC57) \] |   |   |   |   |   | \[[Top](algae.html#SEC_Top)\] | \[[Contents](algae_toc.html#SEC_Contents)\] | \[[Index](algae_10.html#SEC57)\] | \[ [?](algae_abt.html#SEC_About) \] |

\
This document was generated by *K. Scott Hunziker* on *October, 31 2001* using [*texi2html*](http://www.mathematik.uni-kl.de/~obachman/Texi2html%0A)
