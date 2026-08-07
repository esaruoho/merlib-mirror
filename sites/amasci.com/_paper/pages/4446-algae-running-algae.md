---
title: "Algae: Running Algae"
source_domain: amasci.com
source_path: ~ksh/algae/algae_7.html
order: 4446
reachable_from_entry: false
images: 1
internal_links: 12
extracted: 2026-08-07T17:11:14Z
extractor: site_to_paper.py (pandoc)
---

# Algae: Running Algae

*Source page: `~ksh/algae/algae_7.html`*

<span id="SEC47"></span>

|  |  |  |  |  |  |  |  |  |  |  |
|----|----|----|----|----|----|----|----|----|----|----|
| \[ [\<\<](algae_6.html#SEC36) \] | \[ [\>\>](algae_8.html#SEC53) \] |   |   |   |   |   | \[[Top](algae.html#SEC_Top)\] | \[[Contents](algae_toc.html#SEC_Contents)\] | \[[Index](algae_10.html#SEC57)\] | \[ [?](algae_abt.html#SEC_About) \] |

------------------------------------------------------------------------

# ![](icon.gif) 7. Running Algae

The `algae` interpreter assembles your Algae statements into its own opcodes and then executes them. When you are working interactively, it does this one statement (or one block of statements) at a time. When its input comes from a file, the entire file is assembled before execution of it begins.

> |                                            |     |     |
> |:-------------------------------------------|-----|:----|
> | [7.1 Startup Files](algae_7.html#SEC48)    |     |     |
> | [7.2 The Command Line](algae_7.html#SEC49) |     |     |
> | [7.3 Errors](algae_7.html#SEC50)           |     |     |
> | [7.4 The algae Prompt](algae_7.html#SEC51) |     |     |
> | [7.5 Signals](algae_7.html#SEC52)          |     |     |

<span id="Startup Files"></span>

------------------------------------------------------------------------

<span id="SEC48"></span>

## 7.1 Startup Files

When `algae` begins execution, it normally tries to read and execute two startup files. The first one it tries is the file in which it expects some of its standard functions to be defined. A default name for this file is given when `algae` is compiled--usually it's something like `` `/usr/local/lib/algae/3.6.2/algae.A' ``. That name can be overridden with an environment variable called `ALGAE_RC0`.

Without this file, some of `algae`'s standard functions will be missing. For this reason, `algae` will emit an error message and quit if it can't find the file. (That is, unless the `` `-S' `` option is specified on the command line.)

After `algae` reads its standard functions, it looks for the file `` `.algae' `` in your home directory and executes it if it's there. This file's name can be overridden with the `ALGAE_RC1` environment variable. Execution of this file is inhibited by the `` `-s' `` command line option. No startup files at all are read if the `` `-S' `` option is given.

<span id="Command Line"></span>

------------------------------------------------------------------------

<span id="SEC49"></span>

## 7.2 The Command Line

Algae supports command line arguments to request various actions. Arguments starting with `` `-' `` are *options*. Other arguments specify files to execute.

Option flags always begin with a hyphen. Algae supports both traditional single-letter options and mnemonic long option names. Long option names are indicated with `` `--' `` instead of `` `-' ``. Abbreviations for option names are allowed as long as they are unique.

Options which change Algae's behavior take effect before any files are executed. The order of the arguments is unimportant, with the following two exceptions:

1.  Any input scripts given (with the `` `-e' `` or `` `--script' `` option) are executed in the order that they appear on the command line. This occurs after the startup files are executed and before any other files are executed.
2.  Any input files named on the command line are executed in the order in which they appear.

Below is a list of options accepted by Algae. Both the short and long option names are indicated.

`` `-D' ``  

`` `--disassemble' ``  
<span id="IDX518"></span> This option turns on the disassembler, which prints `algae`'s opcodes to stderr in a form like assembly language. You'll probably want to combine this with the `` `-S' `` option; otherwise, you'll get more than 800 lines of opcodes from the standard functions.

`` `-d  ```i``'`  

`` `--debug  ```i``'`  
<span id="IDX519"></span> This option sets the debug level to `i`, where `i` is an integer. It is normally of use only for debugging the `algae` implementation.

`` `-e  ```commands``'`  

`` `--script  ```commands``'`  
This option allows you to provide a script for `algae` to execute from the command line, rather than from a file or from standard input. Such a script is executed after any startup files but before any other files are executed. Any number of `` `-e' `` (or `` `--script' ``) options may be given, and the specified scripts are executed in the order in which they appear on the command line.

`` `-h' ``  

`` `--help' ``  
Print a brief description of the command line arguments.

`` `-i' ``  

`` `--interactive' ``  
<span id="IDX520"></span> <span id="IDX521"></span> <span id="IDX522"></span> This option causes `algae` to use interactive mode when reading from the standard input device "stdin". Without this option, `algae` uses interactive mode only when its input appears to be from a terminal. In interactive mode, input is parsed a line at a time and exceptions do not cause `algae` to exit.

`` `-n' ``  

`` `--nowhite' ``  
This option changes the way that scalars are displayed. The printing statements (that is, statements that are terminated by either a newline or a `` `?' `` character) normally precede the scalar's value with a tab, and follow it with a newline. With this option set, neither the tab nor the newline is printed. (For character scalars, the quotation marks are also omitted.) This option affects the printing statements only, and has no effect on the functions like `printf`.

`` `-p' ``  

`` `--profile' ``  
<span id="IDX523"></span> <span id="IDX524"></span> <span id="IDX525"></span> This option enables execution profiling--a means for determining the execution time characteristics of your Algae program. When profiling is enabled, the profiler periodically interrupts `algae` and records the line that is currently being executed. When `algae` exits, it records this data in the file `` `algae.out' `` in the current directory.

Use the `prof` function to read the `` `algae.out' `` file and summarize it by file and by line number.

You may wish to use the `strip` function in conjunction with profiling. Since `strip` removes the line and file information from a function, any time spent in a call to that function gets charged to the line from which it was called.

We've encountered several systems on which operating system bugs prevent the execution profiler from working correctly. These include a DECstation and a Titan, both with MIPS architectures. If you have such a system, then `algae` should have been installed with the execution profiler disabled. In that case, you'll get an error message if you try to use the `` `-p' `` option.

`` `-R' ``  

`` `--restrict' ``  
<span id="IDX526"></span> <span id="IDX527"></span> <span id="IDX528"></span> <span id="IDX529"></span> This option causes `algae` to run in restricted mode. The `system` function is disabled, as are "pipes" (i.e., file names that begin with the `` `!' `` character).

Restricted mode should be used whenever you deal with untrusted Algae code. Without it, a malicious provider of such code could cause major damage.

`` `-r' ``  

`` `--noreadline' ``  
<span id="IDX530"></span> <span id="IDX531"></span> <span id="IDX532"></span> If the GNU Readline facility is available, `algae` normally uses it for interactive command line editing and history. The `` `-r' `` option forces `algae` to skip Readline processing. Readline's editing commands are similar to emacs: <span class="kbd">C-f</span> forward, <span class="kbd">C-b</span> backward, <span class="kbd">C-p</span> up, and <span class="kbd">C-n</span> down. You can change to `vi` style by typing <span class="kbd">M-C-j</span>.

`` `-S' ``  

`` `--nostartup' ``  
If this option is given, none of `algae`'s startup files are read. This means that many of the standard functions will be unavailable.

`` `-s' ``  

`` `--norc' ``  
This option skips reading the user's startup file.

`` `-V' ``  

`` `--version' ``  
<span id="IDX533"></span> This option prints version and date information.

`` `-x' ``  

`` `--nostdin' ``  
<span id="IDX534"></span> This option causes `algae` not to read stdin by default when no file names are given on the command line.

Any file names given on the command line are executed as input to Algae. If no file names are given (and the `-x` option is not present), input comes from stdin. You can specify stdin explicitly with a single hyphen, so a command line like

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>algae init.A -</code></pre></td>
</tr>
</tbody>
</table>

has `algae` execute `` `init.A' `` first and then read from standard input.

<span id="Errors"></span>

------------------------------------------------------------------------

<span id="SEC50"></span>

## 7.3 Errors

Several types of errors may be encountered when running `algae`. The two most common are *parse* errors and *run time* errors. Parse errors occur while `algae` is parsing its input statements. Run time errors occur while `algae` is executing its code. In both cases, `algae` prints a file name and line number associated with the error.

<span id="Prompt"></span>

------------------------------------------------------------------------

<span id="SEC51"></span>

## 7.4 The algae Prompt

When executing interactively, `algae` displays the primary prompt when it is ready to read a command, and the secondary prompt when it needs more input to complete a command. You can customize the prompt simply by assigning a character vector to the global variable `$prompt`. Its first two elements specify the primary and secondary prompts. By default, `$prompt` is `( "> ", " " )`. Assigning something other than a character vector to `$prompt` is not an error---`algae` just won't give you a prompt. (Wouldn't it be fun to accept a function? Hmm, maybe someday.)

If the GNU Readline facility is available (that is, linked with `algae` during installation), `algae` normally uses it for interactive command line editing and history. Readline's editing commands are similar to emacs: <span class="kbd">C-f</span> forward, <span class="kbd">C-b</span> backward, <span class="kbd">C-p</span> up, and <span class="kbd">C-n</span> down. You can change to `vi` style by typing <span class="kbd">M-C-j</span>. The `` `-r' `` command line option forces `algae` to skip Readline processing.

<span id="Signals"></span>

------------------------------------------------------------------------

<span id="SEC52"></span>

## 7.5 Signals

<span id="IDX535"></span> <span id="IDX536"></span> <span id="IDX537"></span> If `algae` receives an interrupt signal (because you pressed a <span class="kbd">C-c</span> on the keyboard, for example), it stops what it's doing and returns to the prompt. (If it isn't running interactively, it simply exits.) On Unix systems, you can also use the `kill` command to send a signal to a process.

The implementation of interrupt signal handling in `algae` is necessarily a compromise. We want it to respond promptly, but not at the expense of our performance. As a result, it sometimes happens that `algae` does not respond promptly to an interrupt signal. (If you find a case like this; please report it. Sometimes it's the result of an oversight.)

<span id="IDX538"></span> <span id="IDX539"></span> Sending `algae` a quit signal causes an immediate, clean exit. There are various other signals which will cause `algae` to terminate, but this is the one to use if you want your files closed properly, etc.

<span id="Projects"></span>

------------------------------------------------------------------------

|  |  |  |  |  |  |  |  |  |  |  |
|----|----|----|----|----|----|----|----|----|----|----|
| \[ [\<\<](algae_7.html#SEC47) \] | \[ [\>\>](algae_8.html#SEC53) \] |   |   |   |   |   | \[[Top](algae.html#SEC_Top)\] | \[[Contents](algae_toc.html#SEC_Contents)\] | \[[Index](algae_10.html#SEC57)\] | \[ [?](algae_abt.html#SEC_About) \] |

\
This document was generated by *K. Scott Hunziker* on *October, 31 2001* using [*texi2html*](http://www.mathematik.uni-kl.de/~obachman/Texi2html%0A)
