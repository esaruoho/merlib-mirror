---
title: "Using, Maintaining and Enhancing Cobol for the GNU Compiler Collection (GCC) - 14. Writing a Compiler Front End"
source_domain: amasci.com
source_path: ~johnnyb/computers/toy/cobol_14.html
order: 3981
reachable_from_entry: false
images: 0
internal_links: 103
extracted: 2026-08-07T05:57:14Z
extractor: site_to_paper.py (pandoc)
---

# Using, Maintaining and Enhancing Cobol for the GNU Compiler Collection (GCC) - 14. Writing a Compiler Front End

*Source page: `~johnnyb/computers/toy/cobol_14.html`*

Go to the [first](cobol_1.html), [previous](cobol_13.html), [next](cobol_15.html), [last](cobol_16.html) section, [table of contents](cobol_toc.html).

------------------------------------------------------------------------

# <a href="cobol_toc.html#TOC56" id="SEC56">14. Writing a Compiler Front End</a>

<span id="IDX6"></span> <span id="IDX7"></span> <span id="IDX8"></span>

- [Tree Background](cobol_14.html#SEC57): Background
- [Tree Introduction](cobol_14.html#SEC58)
- [Overall Principles of the GNU Compiler](cobol_14.html#SEC59)
- [Creating Your Own GNU Compiler](cobol_14.html#SEC104)
- [Codegen](cobol_14.html#SEC110): Generating code from the tree nodes
- [Tree Summary and Overview](cobol_14.html#SEC153)
- [GCC Internals Information](cobol_14.html#SEC154)
- [Tree Changes](cobol_14.html#SEC155): Summary of Subsequent Changes
- [Tree Examples](cobol_14.html#SEC156): Example code

## <a href="cobol_toc.html#TOC57" id="SEC57">14.1 Background</a>

<span id="IDX9"></span>

This chapter is based on the results of an investigation<a href="cobol_foot.html#FOOT1" id="DOCF1">(1)</a>which aimed at finding out how parts of the GNU Compiler Collection 'GCC' can be used in other compiler projects<a href="cobol_foot.html#FOOT2" id="DOCF2">(2)</a>.

It will hopefully help you to write a GNU compiler for a so far unsupported language.

We describe the structure and basic concepts of 'GCC' from the perspective of someone writing a compiler front end. We deal with two different problems.

- First we explain briefly how a new compiler is to be added to the family of GNU compilers within the framework provided by the authors of GCC:
  1.  how to call the parser from the main module,
  2.  how to integrate semantic analysis into your compiler,
  3.  how to access command line options or how to add new ones,
  4.  also how to extend and adapt `` `make' `` files.
- Then we explain how to access GNU's code generator ('backend') from the language specific parts ('frontend'). We list the most important of the numerous backend functions and explain how to use them.9

Examples are available, demonstrating how to work with these backend functions. See section [14.9 Tree Examples](cobol_14.html#SEC156).

The chapter was originally based on GCC 2.7.2 and has not been fully updated to reflect subsequent changes. For a summary of some of the changes, and other sources of information, see section [14.8 Tree Changes](cobol_14.html#SEC155) and section \`GCC Internals' in Using and Porting Gnu CC.

## <a href="cobol_toc.html#TOC58" id="SEC58">14.2 Introduction</a>

<span id="IDX10"></span>

The Free Software Foundation has developed a suite of freely usable programs which are constituents of Unix-like operating system. Included in this suite is a compiler for the language `` `C' ``.

An important goal for the compiler was a high level of reusability of the larger part of the source code of this compiler. Because Unix runs on a large number of different architectures and platforms, it was a goal to build the compiler in such a way that it was as machine independent as possible.

A second goal was very high code quality, which is possible only through intensive optimisation. Both goals could only be reached at the same time if the optimisation were as much as possible independent of the concrete machine architecture. The problem was solved by developing a more or less processor independent machine language. This language is called "RTL - Register Transfer Language". See section \`RTL' in Using and Porting Gnu CC.

The architecture for the RTL machine is an abstraction of actual processor achitectures. It therefore reflects the technical reality of familiar concepts like storage, processor registers, address types, an abstract jump command etc.

A code generator for a concrete processor is built through a language which allows you to describe the conversion of patterns of RTL into a concrete assembler language.

See section \`Machine Desc' in Using and Porting Gnu CC, section \`Target Macros' in Using and Porting Gnu CC, section \`Config' in Using and Porting Gnu CC and section \`Fragments' in Using and Porting Gnu CC for a comprehensive description of how with the help of this description language, you can create new code generators or improve existing ones. There and in section \`RTL' in Using and Porting Gnu CC the language RTL is abundantly described.

These instructions for implementing an optimised platform independent representation with the aim of providing a conversion process into real machine specific assembler code also has the objective of making it possible to create a cross compiler without additional effort.

Reusability should also be achievable in another sense: It should with minimum possible effort be feasible to write a compiler for another language other than C, based on the pre-existing code.

Therefore again it is necessary for as many as possible of the existing high level language constructs to be easily converted into RTL.

Therefore an intermediate language was created, which allows existing constructs from high level languages to be respresented in a unified form, including:

1.  Declarations of routines<a href="cobol_foot.html#FOOT3" id="DOCF3">(3)</a>, types, local and global variables, formal parameters and jump labels
2.  Types such as the pre-existing basic types for integral and floating point numbers, truth values and characters, references, arrays, links, enumerations, routines, and derived types
3.  logical, arithmetical, conversion and comparison expressions
4.  pointers, calling of routines
5.  control structures such as loops and conditions

The syntax tree stored in `tree` nodes which are created via function calls described later, is then converted into RTL code by the use of functions as described in section [14.5 Generating RTL from the syntax tree](cobol_14.html#SEC110). For control structures, variable scope and functions there are additionally functions in the back end which allow direct creation of RTL from each such fragment.

Unfortunately, comprehensive documentation, explaining how one creates such `tree` expressions and how one can use the very capable GCC code generator for a new compiler, has not previously existed.

This chapter attempts to at least partly fill this gap.

It is true that the source code of GCC<a href="cobol_foot.html#FOOT4" id="DOCF4">(4)</a> is commented, but after painful experience the authors can report that the this information does not suffice to explain as you might hope how to write a new front end in the same manner as the existing front ends. Because the documentation is all local, you need to understand all of it before you can understand any of it.

The next section section [14.3 Overview of the GCC Compiler back end](cobol_14.html#SEC59) describes in detail the construction of the GNU C Compiler and the basic concepts insofar as they apply to our problem.

The following section [14.4 Creating Your Own GNU Compiler](cobol_14.html#SEC104) explains exactly what you need to do, to create a new member of the GNU Compiler Collection, in accordance with the concepts of the compiler's authors: how to call the parser and semantic analayis out of the existing code, how to obtain existing command line options or to add new ones; also how to enhance and adapt `` `make' ``-data. Additionally there is another possibility presented, the one used by the author of this chapter, to include the GNU backend into your own project.

The section section [14.5 Generating RTL from the syntax tree](cobol_14.html#SEC110) decribes in detail, how the code generator is controlled by the language specific part of the compiler. The most important of the numerous functions, data structures and access operations are presented and their interoperation is explained.

All that remains is the studying of the commented source code of GCC. A sample program is provided in section [14.9 Tree Examples](cobol_14.html#SEC156) which hopefully may greatly ease the use of the GNU C Codegenerator. The examples contain important and comprehensive researched information in packaged form and may limit the need to study the `tree` structures and associated code.

This example can also be used as an illustrated example for the section [14.4 Creating Your Own GNU Compiler](cobol_14.html#SEC104).

The section section [14.6 Tree Summary and Overview](cobol_14.html#SEC153) brings all the work together and gives an overview.

## <a href="cobol_toc.html#TOC59" id="SEC59">14.3 Overview of the GCC Compiler back end</a>

This chapter describes the construction of the family of GNU Compilers, known above all through its best known member, the C Compiler GCC. This establishes the foundation for understanding information presented in the subsequent section [14.4 Creating Your Own GNU Compiler](cobol_14.html#SEC104) and particularly the section [14.5 Generating RTL from the syntax tree](cobol_14.html#SEC110).

- [GCC Construction Overview](cobol_14.html#SEC60)
- [Compiler Driver](cobol_14.html#SEC65)
- [Modules of Interest](cobol_14.html#SEC73)
- [Symbol Table](cobol_14.html#SEC93)
- [Callback](cobol_14.html#SEC94)

### <a href="cobol_toc.html#TOC60" id="SEC60">14.3.1 GCC Construction Overview</a>

The concept of the GNU family compilers is, as already stated, to support as many high level languages and machine architectures with as little source code as possible, through intensive reuse and at the same time to achieve the highest quality generated assembler code.

- [GCC Size](cobol_14.html#SEC61)
- [Separation of Language from Common Code](cobol_14.html#SEC62)
- [Modularity](cobol_14.html#SEC63)
- [Extension of the tree Structure](cobol_14.html#SEC64)

#### <a href="cobol_toc.html#TOC61" id="SEC61">14.3.1.1 Code size analysis</a>

<span id="IDX11"></span> <span id="IDX12"></span>

The base package<a href="cobol_foot.html#FOOT5" id="DOCF5">(5)</a>contains the translation core, and front ends for the languages C, C++, Chill, Fortran and Objective C. Front ends also exist for Ada 95<a href="cobol_foot.html#FOOT6" id="DOCF6">(6)</a>, and for Pascal<a href="cobol_foot.html#FOOT7" id="DOCF7">(7)</a>.

To the knowledge of the author compilers for Modula-3 and Cobol are in progress and will in time be available.

The code generator can create code for about 30 various processor families, including prominent ones like DEC Alpha, Intel 80386 up to Pentium, Sun Sparc, HPPA, IBM RS/6000, but also such veterans as Motorola 68k, DEC VAX, IBM S/370.

One recognises here representatives of the RISC as well as the CICS architectures which in combination with the sheer number of processors clearly shows that the concept of processor independence - or better: simple portability to new processor families - has been achieved.

The base package includes over 500,000 lines of commented source code. The code generator comprises by far the greater part of this, over 450,000 lines which comprises two roughly equal parts: the processor descriptions for the previously-described 30 architectures<a href="cobol_foot.html#FOOT8" id="DOCF8">(8)</a>and the essential translator core each with around 225,000 lines. The remaining 100,000 lines is the code of the front ends for C, C++ and Objective C, of which more than two thirds stem from C++.

This work describes how the the 225,000 lines of source code of the translator core can be used for your own project.

#### <a href="cobol_toc.html#TOC62" id="SEC62">14.3.1.2 Separation of Language and Common Part</a>

<span id="IDX13"></span>

The implementation language C provides little modularisation support so there is no other option than to simulate the desired modularisation through division of the function into C Source files. In this manner the language specific parts were separated from the language independent parts. Files which contain special code for C, have for example the prefix `` `c-' ``. Files for Objective C begin with `` `objc-' ``. Files for C++ are contained in the subdirectory `` `cp' ``.

It is unfortunately not the case however that the front end and back end are completely separated. The back end routines need access to callback routines in the front end. Therefore there are several global variables which the front end must intialize and which remain unchanged during the translation and whose values represent the declaration of the current translation routine. These routines and variables have partly only cosmetic tasks and may remain unimplemented, partly they can use standard implementations but must in some cases be changed for specific languages.

Which routines and variables these are and how they are used, is described in detail in section [14.3.5 Callback](cobol_14.html#SEC94).

#### <a href="cobol_toc.html#TOC63" id="SEC63">14.3.1.3 Modularity</a>

<span id="IDX14"></span> <span id="IDX15"></span>

In a large project which GCC is - as shown above - success unavoidably requires a certain discipline in programming. The programming language `` `C' `` is here also not very helpful. It does not fully support abstract concepts like data types and encourages the data interchange between modules using global variables. Object oriented programming, which offers much for the implementation of the transalator, is only possible with great difficulty.

The programmers of GCC have however partially implemented the concept of abstract data types, in which important important divisions between logical modules take procedural form. The creation of the `tree` nodes happens exclusively through function calls, as does the creation of the RTL code. Even the transition between various states<a href="cobol_foot.html#FOOT9" id="DOCF9">(9)</a>happens through function calls. For the modification of fields in the `tree` nodes certainly macros are used, though it is also possible, though not recommended, to manipulate these fields directly.

Unfortunately there is intensive data exchange through global variables, an approach which makes the reading and understanding of the source code more difficult and which is not very consistent with the philosophy of abstract data types.

#### <a href="cobol_toc.html#TOC64" id="SEC64">14.3.1.4 Extension of the tree Structure</a>

<span id="IDX16"></span> <span id="IDX17"></span>

Fully aware that it can be impossible through the procedural pattern to make available counterparts to all the significant constructs of all programming languages for which someone may at some time want to write a compiler, the possibility of extensions by the user in the future was forseen.

It is thus in principle possible, to define your own classes of `tree` nodes, certainly though one must then also implement the translation of the nodes into RTL-format. We not further discuss this possibility.

### <a href="cobol_toc.html#TOC65" id="SEC65">14.3.2 Compiler Driver</a>

<span id="IDX18"></span> <span id="IDX19"></span>

The user does not directly call the core compiler himself. Rather, the user calls a control program (driver) named "gcc" which should be installed in the path. This program "gcc" with source code in `` `gcc.c' ``

1.  interprets the command line parameters
2.  determines file names from options
3.  decides on the basis of the file names, which compiler for which language or which other utility program to run, for example the binders (linkers) or preprocessors, which parameters to run the mwith and then actually runs them
4.  can on the basis of a specification in a formal language named `` `specs' ``<a href="cobol_foot.html#FOOT10" id="DOCF10">(10)</a>convert command line parameters from the format input by the user into the format expected by the compiler; this language allows rules like "if gcc is called with the option `` `-abc' `` then call the compiler or service program with the option `` `-def' ``"

and places therefore at the disposal of the programmer a unified entry point to all compilers of the GNU family. However it should be noted that some of the compilers have their own version of the driver `` `gcc.c' ``.

The core compiler is usually placed in a sub-directory `` `gcc-lib' ``\\`Architecture`\\`Version`, where the directory `` `gcc-lib' `` lies in `` `Unix' `` under `` `/usr/local/lib' ``, and the compiler which is usually called `` `cc1' `` lies for example in `` `/usr/local/lib/gcc-lib/sun-sparc-subos4.1.3/2.7.2/cc1' ``

In principle one is not prevented from controlling other programs is this way using `` `gcc' ``, but in the end it "specs" is a weakly expressive language with limited syntax at its disposal with only the ability to write loop free simple script type programs. It is similar in its goals to the `` `make' `` program, but without its power.

- [Translation Process](cobol_14.html#SEC66)
- [Two Principal Possibilities](cobol_14.html#SEC67)
- [Translation into RTL](cobol_14.html#SEC68)
- [Constructs Supported by the Tree Format](cobol_14.html#SEC69)
- [Control Structures](cobol_14.html#SEC70)
- [Additional Constructs](cobol_14.html#SEC71)
- [Calling Up of Optimization and Code Creation](cobol_14.html#SEC72)

#### <a href="cobol_toc.html#TOC66" id="SEC66">14.3.2.1 Translation Process</a>

As described above, the user does not call the compiler directly, but the driver `` `gcc' `` which in its turn calls the actual compiler, being `` `cc1' `` for `` `C' ``. Our task is to develop a 'brother' to `` `cc1' `` which can compile the desired language.

Compilers of the GNU family, particularly the C compiler `` `cc1' `` compile only one source file each time they are run.

After various soon to be described initializations the source file is opened and the parser is called by the standard main routine in `` `toplev.c' ``.

#### <a href="cobol_toc.html#TOC67" id="SEC67">14.3.2.2 Two Principal Possibilities</a>

There are in fact two significant possibilities, for writing your own compiler within the GNU realm.

1.  like GCC, the GNU C compiler: The parser creates a syntax tree directly into the `tree` format, processes the semantic analysis on this tree and passes the created partial trees from time to time through calls described to routines described in section [14.5 Generating RTL from the syntax tree](cobol_14.html#SEC110) for conversion to RTL. This approach has the advantage that you need not define your own format for the syntax tree, and this also minimises the need for definition of data structures, because you can use the pre-existing `tree` format. This also enables fast "one pass" compilation. The disadvantage is however the sometimes onerous operations on the somewhat unfamiliar `tree` format, which is only documented in the source code and in this document. Language dependent data structures could ease the implementation of semantic analysis. Additionally it can be very difficult to place the GNU back end into a consistent state again after the discovery of a syntactic or semantic error.
2.  like GNAT, the GNU Ada 95 compiler: The parser craetes a syntax tree in another format, on which it carries out all the semantic analysis. The semantically error-free tree is then converted piece by piece into the `tree` format, and such `tree` part branches are from time to time as above translated into RTL format through corresponding routine calls. The advantage is that you can relatively easily integrate front ends for programming languages with the back end, because the program can translate the language into the `tree` format when it chooses. In cases where components like 'pretty printer' or abstract interpreters are to be integrated into a translator, which requires a complete syntax tree to work on, this is the only sensible possibility, because the GNU `tree` representation never creates a full representation of the syntax tree of the translated program, neither in the `tree` or in the intentionally incomplete RTL format. In this case the GNU back end is never placed in a failure mode and it is never necessary to recover it from an inconsistent state, because it never gets into such a state. The disadvantage is that you must define many additional data structures; in addition the conversion of the syntax tree into the `tree` format makes the program neither smaller nor faster.

In this chapter, we concentrate on the second alternative - using your own syntax tree.

#### <a href="cobol_toc.html#TOC68" id="SEC68">14.3.2.3 Translation into RTL</a>

The following sections describe how the known high level language constructs - in each case after a conversion into `tree` format - can be translated into RTL.

#### <a href="cobol_toc.html#TOC69" id="SEC69">14.3.2.4 Constructs Supported by the Tree Format</a>

1.  Declarations
    1.  Variables
    2.  Types like
        1.  Fundamdental types like:
            - Whole numbers with various bit widths, signed or unsigned
            - Floating point numbers in various bit widths (`` `float' ``, `` `double' `` in C, `` `real' `` in Pascal
            - Characters (`` `char' `` in C)
            - Strings
        2.  Block types
        3.  Aggregate types (like `` `struct' `` in C `` `record' `` in Pascal)
        4.  Pointer types (like `*` in C, `` `^' `` in Pascal)
        5.  Reference types (like `` `&' `` in C++)
        6.  Field types (`` `array' `` in Pascal)
        7.  Procedure types
        8.  Type variations like `` `const' `` or `` `volatile' `` in C
    3.  Routines including procedures and functions
    4.  Methods
    5.  Constants
    6.  Others
2.  Blocks and associated scope of variables
3.  Assignments (`` `x := e' `` in Pascal, `` `x = e' `` in C)
4.  Callsing Routines
5.  Expressions in the sense of procedural languages - important inbuilt operations over inbuilt types like
    1.  arithmetic: addition, subtraction, multiplication, division, exponentiation and other operations over whole or floating point numbers of various bit sizes,
    2.  logical: `` `and' `` and `` `or' `` (inclusive and exclusive) and negation,
    3.  comparisons: equality, inequality, "greater than", "less than", "greater than or equal", "less than or equal" on whole or floating point numbers.
    4.  Access: pointer dereferencing and access to variables, array elements and fields of records.
6.  Control structures like
    1.  Abstracting/lambda expressions used in functional languages like Scheme
    2.  Looping
    3.  Conditional Statements and case statements
    4.  Unconditional jumps

    generally conceived as *expressions*, as is usual in functional languages.

as they are built into most programming languages, and are recorded recursively in the `tree` format. There is available for the constructs named above a special routine or a special parameter for a common routine, to create a tree object of the desired type.

#### <a href="cobol_toc.html#TOC70" id="SEC70">14.3.2.5 Control Structures</a>

<span id="IDX20"></span>

In the enumeration above, control structures were comprehended as expressions. This viewpoint however does not correspond to the tradition of imperative languages from the Algol family, such as `` `C' `` where one makes a clear distinction between expressions and control structures. In this case control structures like `if`, `while`, `do`, `goto`, or `switch` (examples from C) are translated into `tree` format.

In many cases for each of the constructs above there are lots of routines to call, in order to convert each fragment of the desired construct into the necessary tree codes and then RTL codes. Thereby the intermediate `tree` codes or parts of them required in each case<a href="cobol_foot.html#FOOT11" id="DOCF11">(11)</a> are created and converted into RTL code.

By way of example for clarification of the basic ideas, here is the calling scheme for the conditional branch. The details, including those for other constructs, follow later in section [14.5 Generating RTL from the syntax tree](cobol_14.html#SEC110).

`IF cond1 THEN stmt1 ELSEIF cond2 THEN stmt2 ELSE stmt3 END`

Code for creation of the branch condition `cond1`:

`expand_start_condition(cond1)`;

Code for the instructions resulting `stmt1`

Code for the second condition `cond2`:

`expand_start_elseif(cond2)`;

Code for the instructions resulting `stmt2`

`expand_start_else();`

Code for the instructions resulting `stmt3`

`expand_end_cond();`

#### <a href="cobol_toc.html#TOC71" id="SEC71">14.3.2.6 Additional Constructs</a>

For marking the beginning and end of routines, variable scope, routine bodies, there are special routines for each case.

#### <a href="cobol_toc.html#TOC72" id="SEC72">14.3.2.7 Calling Up of Optimization and Code Creation</a>

At the end of each of the routines to be translated, the function `end_of_compilation` from the module `` `toplev.c' `` must be called, in order for these routines to produce fully processed RTL code, processed through the numerous optimisation phases, and in order to finally generate assembler source from the now optimized RTL code.

For global variables and local static (in the C sense, meaning variables that do not reside on the stack) variables, structures or arrays you must instead call `rest_of_decl_compilation` from the same `` `toplev.c' `` before you call `rest_of_compilation`.

For composite and enumeration types you must call `rest_of_type_compilation` in order to provide information for the debugger.

### <a href="cobol_toc.html#TOC73" id="SEC73">14.3.3 Modules of Interest</a>

This section provides an overview of what you will find each source file and the role each plays for our problem. Most source files with the suffic `` `.c' `` are described.

- [Top Level Module](cobol_14.html#SEC74)
- [Debugging Output](cobol_14.html#SEC75)
- [Creation of syntax trees for expressions and more](cobol_14.html#SEC76)
- [Old Style Storage Management](cobol_14.html#SEC77)
- [New Style Storage Management](cobol_14.html#SEC78)
- [Data Formats](cobol_14.html#SEC79)
- [Initialization functions](cobol_14.html#SEC80)
- [Access Macros](cobol_14.html#SEC81)
- [TREE_CODE Constants](cobol_14.html#SEC82)
- [Creation of RTL code for Control Structures](cobol_14.html#SEC83)
- [Creation of RTL code for Routines](cobol_14.html#SEC84)
- [Processing of Type Declarations](cobol_14.html#SEC85)
- [Simplification of Constant Expressions](cobol_14.html#SEC86)
- [Creation of External Declarations](cobol_14.html#SEC87)
- [Tree Debugging Information](cobol_14.html#SEC88)
- [Other Modules for Creation of of RTL Code](cobol_14.html#SEC89)
- [Transformation of RTL code](cobol_14.html#SEC90)
- [Machine Independence](cobol_14.html#SEC91)
- [Conclusion](cobol_14.html#SEC92)

#### <a href="cobol_toc.html#TOC74" id="SEC74">14.3.3.1 Top Level Module</a>

The top module (where you will find `` `main' ``) of the main compiler is in the file `` `toplev.c' ``. Here

1.  the command lines parameters are interpreted
2.  initialization routines for various modules are called
3.  files are opened at the beginning
4.  and closed at the end
5.  and the various compiler pocesses like syntactic and semantic analysis, code creation and the numerous optimisation processes<a href="cobol_foot.html#FOOT12" id="DOCF12">(12)</a> are started
6.  error output routines are made available for use

#### <a href="cobol_toc.html#TOC75" id="SEC75">14.3.3.2 Output of Debugging Information in Various Formats</a>

The files `` `sdbout.c, xcoffout.c, dbxout.c' `` and `` `dwarfout.c' `` contain in each case a module which, if requested through the `` `-g' `` option, enhances the assembler output with information in the corresponding debugging format. This additional information allows one to investigate problems and bugs at source level using a program like `` `gdb' ``. This module will not concern us further, because its routines are automatically called from `` `toplev.c' ``.

#### <a href="cobol_toc.html#TOC76" id="SEC76">14.3.3.3 Creation of syntax trees for expressions and more</a>

<span id="IDX21"></span>

The files `` `tree.c, tree.h' `` and `` `tree.def' `` contain the module which is of decisive importance for our task. Here you will find

1.  Routines for (old style) storage management
2.  Descriptions of the data formats for nodes of the syntax tree to be created
3.  Functions which make it possible to create such nodes and to initialize them (described and defined in `` `tree.c' `` and with protypes in `` `tree.h' ``)
4.  The definition of constants as values for these node fields and their respective meanings.

We will make extensive use of all these components. You will probably want to print out these modules.

#### <a href="cobol_toc.html#TOC77" id="SEC77">14.3.3.4 Storage Management</a>

<span id="IDX22"></span> <span id="IDX23"></span>

This section describes the old style storage managament, which is now not used in the main compilers.

The code generator manages basically three storage areas, out of which storage is allocated from the system for objects to be created. These are called `` `permanent' ``, `` `temporary' `` and `` `momentary' ``. In these storage areas are placed objects such as `tree` nodes and RTL objects.

1.  Permanent: Here are created objects whose life span encompasses the entire translation of the source file, like names and declarations for global constants, global variables, type declarations and function declarations of global visibility.
2.  Temporary: Here are created objects whose life span encompasses the translation of a (possibly nested) single routine, like declarations for local variables, local constants, and the entire RTL code for a (possibly nested) routine. At the end of the translation of a function the temporary storage should be freed.
3.  Momentary: Here are created objects, whose life span encompasses only the translation of a single statement. Accordingly, as already stated, these can include only `tree` nodes for expressions, assignments and calls, which are at once translated into RTL codes. RTL codes must remain until the end of the routine, at which point it is optimized through `rest_of_compilation`. At the end of the statement the `` `momentary' `` storage should be freed.

Given that statements and routines can be nested, it is necessary to form the `` `temporary' `` and `` `momentary' `` storage areas as stacks.

#### <a href="cobol_toc.html#TOC78" id="SEC78">14.3.3.5 Storage Management</a>

<span id="IDX24"></span> <span id="IDX25"></span>

This section describes the new style storage managament, which is now used in the main compilers.

In this world, the concepts of permament temporary and momentary storage no longer exist. Instead storage is recovered by one os several garbage collection mechanisms.

The files `` `ggc*.[ch]' `` contain the storage management routines. There is unfortunately no external documentation and the docuemntation in some of the modules is somewhat scanty. You should start with `` `ggc.h' `` and `` `ggc-common.c' `` which largely define the interface. If you need to look at the actual garbage collection modules then `` `ggc-page.c' `` while more complex than `` `ggc-simple.c' `` is better commented and easier to follow.

The basic concept is as follows:

1.  Turn garbage collextion on by creating variable `` `int ggc_p' `` and setting it to 1.
2.  Use the normal routines described below to create `tree` nodes and turn them into `` `rtl' ``. Do not use the calls to switch between permanent, temporary and momentary allocation modes.
3.  Use `` `ggc_alloc' `` or `` `ggc_alloc_string' `` to allocate your own data items.
4.  For storage allocated by the GCC back end, there is little to do. The function `` `build_decl' `` to create a function and all the other `` `tree' `` and `` `rtl' `` calls will allocate garbage collectable storage. The main routine in `` `toplev.c' `` sets `` `current_function_decl' `` as a storage root and thereby arranges for the storage under the current function to be automatically preserved. You do need to be careful to place the address of current function decl into `` `current_function_decl' `` to ensure that it doesn't get freed right away.
5.  For storage allocated by yourself, You need to inform GC (garbage collection) routines which storage is still being used. You do this by defining storage 'roots' and providing a callback routine which is required to work its way down the data structures and mark the used nodes. The standard `tree` and rtl node have prebuilt callback routines which you can use, however you still need to define these nodes within root structures and call the appropriate routines tell GC about the root structures. For example you would probably define `tree` for the current function as a root, via `` `ggc_add_tree_root' ``. The callback routine is called when the GC and `` `toplev.c' `` decide it is time to free some storage. This could occur any time storage is allocated or during `` `rest_of_compilation' `` and perhaps at other times also. So you need to ensure that all used storage is covered by a root and callback routine at all times. One thing to be careful of when writing the callback routines is to ensure that they do not recurse too deeply. The use of `` `varray' `` - virtual array - data structures may be of assistance in this regard as they can be used to conveniently store up all the 'pending' nodes.
6.  If you decide this is too hard, you need to link `` `ggc-none.c' `` into your compiler and define `` `ggc_p' `` as 0. You will also need toensure that you do all the right things with permanent. temporary and momentary storage.
7.  You can call the garbage collection using `` `ggc_collect' ``.

Further documentation and a sample is needed of GC which I intend to provide shortly.

#### <a href="cobol_toc.html#TOC79" id="SEC79">14.3.3.6 Data Formats</a>

In the file `` `tree.h' ``, various structures which collectively make up the `tree` format are defined. In accordance with the philosophy of abstract data types we will not concern ourselves with the formats of these structures, following the convention that you read and write the fields of these structures only via the access macros (to be described shortly).

In the following, it is sufficient only to consider the quasi-abstract data type `tree` defined using `typedef`.

#### <a href="cobol_toc.html#TOC80" id="SEC80">14.3.3.7 Initialization functions</a>

<span id="IDX26"></span>

In `` `tree.c' ``, a series of functions whose names begin with `` `build' `` are defined, which each return a new `tree` node. They reserve, corresponding to the mode the system is in, storage from the `` `permanent' ``, `` `temporary' `` or `` `momentary' `` areas or using new style memory allocation and initialize the fields of the nodes according to the arguments of the call, or set them to 0.

#### <a href="cobol_toc.html#TOC81" id="SEC81">14.3.3.8 Access Macros</a>

<span id="IDX27"></span>

In `` `tree.h' `` a whole series of macros is defined, by means of which, according to convention, access to the fields of the `tree` nodes is achieved. It is unfortunately the case that one field or even one access macro can have multiple meanings for different constructs and in different phases of the compiler, and in nodes of some types fields may be unused. That makes understanding not at all easier.

#### <a href="cobol_toc.html#TOC82" id="SEC82">14.3.3.9 TREE_CODE Constants</a>

<span id="IDX28"></span>

While there are routines for the creation of `tree` nodes which represent types, and for practically each different type a different routine exists, for the declaration of arithmetical, logical and other expressions it is different:

There is a creation routine for a whole familty of `tree` nodes, the type of which which may be determined through the `` `TREE_CODE' `` field. Thus `` `TREE_CODE' `` can have the value `` `MULT_EXPR' ``, which means that this node represents the multiplication of two child nodes.

The possible values are defined in `` `tree.def' ``. It explains what meaning and what purpose the various constructs have.

#### <a href="cobol_toc.html#TOC83" id="SEC83">14.3.3.10 Creation of RTL code for Control Structures</a>

<span id="IDX29"></span>

The source text and the explanation of the functions, which as indicated above, create RTL code for control structures, are found in `` `stmt.c' ``.

In order to include correct line number information in the RTL code, it is necessary in many cases, to output RTL code for an empty statement: a function for this purpose is also found here (maybe its `` `emit_line_note' `` in `` `emit_rtl.c' `` actually).

In order to convert statements that are expressions, such as assignments and calls, into RTL, a special function is needed.

Also here you will find functions to mark the beginning and end of the scope of a variable. These are not defined in the module `` `function.c' `` described below because `` `C' `` and several other languages have a block structure which makes it possible to declare local variables in the middle of the body of a routine not just at the start.

#### <a href="cobol_toc.html#TOC84" id="SEC84">14.3.3.11 Creation of RTL code for Routines</a>

<span id="IDX30"></span>

The source text and the explanation of the functions which create RTL code for (possibly nested) functions, is in `` `function.c' ``. Here are the functions to convert function declarations to RTL and also at the appropriate times to mark the beginning and end of the function.

#### <a href="cobol_toc.html#TOC85" id="SEC85">14.3.3.12 Processing of Type Declarations</a>

<span id="IDX31"></span>

In order to convert type declarations into RTL, there is a function in the module `` `stor-layout.c' `` and one in `` `toplev.c' ``.

In order to realise the conversion between elementary data types, there is a function in `` `convert.c' ``.

#### <a href="cobol_toc.html#TOC86" id="SEC86">14.3.3.13 Simplification of Constant Expressions</a>

<span id="IDX32"></span>

In module `` `fold-const.c' `` are modules at your disposal, which enable the values of simple constant expressions to be calculated. Integers of up to 64 bits can be manipulated.

#### <a href="cobol_toc.html#TOC87" id="SEC87">14.3.3.14 Creation of External Declarations</a>

<span id="IDX33"></span>

In order to put external declarations, in `` `C' `` `extern` into the RTL code and thereby into the assembler source code, you can use a function from the module `` `varasm.c' ``.

#### <a href="cobol_toc.html#TOC88" id="SEC88">14.3.3.15 Tree Debugging Information</a>

<span id="IDX34"></span>

In order to ease the laborious process of debugging, there is a module `` `print-tree.c' ``: The functions here have no use for the translation process, but they enable the recursive output of structures in the `tree` format. They are particularly useful when using the debugger `` `gdb' ``, to concisely and quickly print tree and rtl structures.

#### <a href="cobol_toc.html#TOC89" id="SEC89">14.3.3.16 Modules for Creation of of RTL Code</a>

<span id="IDX35"></span> <span id="IDX36"></span>

The modules `` `expr.c' ``, `` `calls.c' ``, `` `explow.c' ``, `` `expmed.c' ``, `` `optabs.c' ``, `` `emit-rtl.c' `` and `` `insn-emit.c' `` indirectly take part in the conversion from `tree` to RTL format. They are called by the above desribed modules but not from the front end directly.

#### <a href="cobol_toc.html#TOC90" id="SEC90">14.3.3.17 Transformation of RTL code</a>

<span id="IDX37"></span>

These modules are not called from the front end directly, rather they are called from `rest_of_compilation`. There is some documentation of them in the main GCC manual.

1.  `` `integrate.c' ``, entry function `` `expand_inline_function' ``, allows the expansion of a function call as an 'inline' function.
2.  `` `jump.c' ``, entry function `` `jump_optimize' ``, leads jump optimization and thereby removes superfluous jumps. This process can be run several times.
3.  `` `regclass.c' ``, entry functions `` `regclass' `` and `` `reg_scan' ``, contain two processes which together are needed for the association of real to virtual registers.
4.  `` `cse.c' ``, entry function `` `cse_main' `` finds common subexpressions within an expression, and changes the syntax tree of the expression, into an acyclic graph, whereby expressions like `(a + b)*(a + b)`, which can be transformed into `(a + b)^2`, can have processing time saved
5.  `` `loop.c' `` and `` `unroll.c' ``, entry function `` `loop_optimize' `` carries out loop optimization, constants are moved out of the loop, loops are simplified, as for example `` `for(i = 0; i != n;i++) printf("%d", i * 5);' `` is simplified into `` `for(i = 0, k= 5 * n; i != k; i+=5) printf("%d", i);' ``. In this example a multiplication is no longer needed in each loop iteration, but only a more efficiently processed addition, which saves processing time. Constant loops are unrolled at translation time as in `` `for(i = 0; i != 2; i++) printf("%d", i);' `` which becomes `` `printf("%d", 0); printf("%d", 1); printf("%d", 2);' ``
6.  `` `stupid.c' ``, entry function `` `stupid_life_analysis' `` assigns local variables to registers.
7.  `` `flow.c' ``, entry function `` `flow_analysis' ``, carries out a control flow analysis and divides the function to be translated into basic blocks. Thereby unreachable loops and function calls, whose results are irrelevant are uncovered. Additionally a data flow analysis is made, which is later needed to assign the virtual registers to real registers.
8.  `` `combine.c' ``, entry function `` `combine_instructions' ``. Here small groups of RTL instructions are combined, in an attempt to simplify them using real instructions from the machine description.
9.  `` `sched.c' ``, entry function `` `sched_insns' `` is necessary for the RISC architectures, whereby instructions within a basic block are so reordered so that the minimum time is spent waiting on the results of instructions which take several cycles.
10. `` `local-alloc.c' ``, entry function `` `local_alloc' ``, converts to real registers those which only exist within a basic block.
11. `` `global.c' ``, entry function `` `global_alloc' ``, converts other virtual registers into real registers.
12. `` `reload.c, reload1.c' ``, entry function `` `reload' ``, processes corrections and additional optimisations for register allocation.
13. `` `reorg.c' ``, entry function `` `dbr_schedule' ``, orders instructions in a similar manner to `` `sched.c' `` so that the delays in certain (RISC) instructions are reduced, is used for the processing of other instructions.
14. `` `reg-stack.c' ``, entry function `` `reg_to_stack' ``, stores registers when necessary on the stack.
15. `` `final.c' ``, entry function `` `final' ``, finally takes over the conversion of the now optimized RTL codes and converts them into assembler code. Here also the module `` `insn-output.c' `` is used.
16. At long last the corresponding information for the debugger is produced.

More on the calling of the opitimisation routines is found in the function `` `rest_of_compilation' `` in module `` `toplev.c' `` and in section \`Passes' in Using and Porting Gnu CC.

#### <a href="cobol_toc.html#TOC91" id="SEC91">14.3.3.18 Machine Independence</a>

<span id="IDX38"></span>

You may have wondered how GCC version decides which machine architecture to generate code for: the source code of both modules `` `insn_emit.c' `` and `` `insn_output.c' `` is initially synthesised during the building of GCC out of the machine descriptions, so that here the properties of the concrete machine architectures can flow into the compiler.

#### <a href="cobol_toc.html#TOC92" id="SEC92">14.3.3.19 Conclusion</a>

One sees that fundamentally the functions which are necessary for the compilation of the program in a high level anguage like C or Pascal are present within only in a few modules.

In order to write a front end then, it is not necessary to be in intimate contact with RTL, in theory at least. In practice for reasons of debugging you will most likely become well acquainted with RTL.

If the described interface does not support the desired functionality then enhancement or modification of the back end is necessary. Of course, the current functionality is sufficient to produce a program as powerful as a Turing machine. Doing some things that way could be laborious or create inefficient code.

### <a href="cobol_toc.html#TOC93" id="SEC93">14.3.4 Symbol Table</a>

<span id="IDX39"></span>

The alert reader will have observed that until now no mention has been made of an essential component of all compilers, the symbol table. In addition, it is striking that in the sections above on the `tree` format no mention has been made of nodes for variable references, for named types<a href="cobol_foot.html#FOOT13" id="DOCF13">(13)</a> and similar usual constructs which many languages would need.

That is no deficiency. Nodes which represent references to declared names, do not exist, because the declarations are represented by the inclusion the declaration node itself in, for example, an expression.

Which declaration is represented through a name in a concrete situation depends of course on the scope visibility rules of the translated high level language. The front end will obviously resolve this with the help of a symbol table, but that is not a problem for the back end to solve. The symbol table is almost<a href="cobol_foot.html#FOOT14" id="DOCF14">(14)</a> solely the concern of the front end.

This method makes possible a very high degree of flexibiliy with regard to the still very diverse rules of visibility of names in the various high level languages. The back end itself can hardly take into account all conceivable cases. Given that the front end, in building up the expression inserts the referenced declaration itself into the tree; at the same time the back end needs no knowledge of the scope rules of the translated language, which makes for a considerable easing its task.

Together with the previously described storage management, one must therefore naturally be constantly aware of the need to ensure that `tree` nodes which represent declarations are not freed as long as they remain visible according to the rules and may therefore be referenced. This creates the well known and tiresome problem of 'dangling references'.

### <a href="cobol_toc.html#TOC94" id="SEC94">14.3.5 Callback</a>

As previously mentioned, there are several global variables and functions, which can be called by the back end, but are not defined there. In other words, whoever implements a new front end, is therefore required to define and set these variables, and to define and implement the functions.

It is not forbidden to call these functions also from the front end itself, provided they work correctly with the back end; they must just fulfil their implicit specifications.

- [Top Level Variables - tree nodes](cobol_14.html#SEC95)
- [Other Variables - tree nodes](cobol_14.html#SEC96)
- [Functions for Types](cobol_14.html#SEC97)
- [Back end Access to Symbol Table](cobol_14.html#SEC98)
- [Initialization and Cleanup](cobol_14.html#SEC99)
- [Language Specific Initialization](cobol_14.html#SEC100)
- [Accounting](cobol_14.html#SEC101)
- [Debugging Help](cobol_14.html#SEC102)
- [Input](cobol_14.html#SEC103)

#### <a href="cobol_toc.html#TOC95" id="SEC95">14.3.5.1 Top Level Variables - tree nodes</a>

<span id="IDX40"></span> <span id="IDX41"></span>

Note: These nodes are now mostly in an array called `global_trees` and are accessed via macros, although the names are not in caps as is usual with macros.

1.  `tree error_tree_mark_node` used as a `tree` node, represents a partial tree in which during semantic analysis errors were found, as for example, an incorrectly typed partial tree. This is done, in order to avoid the code generator working on empty or untranslatable references to incompplete trees. If you prefer to work in the manner in which semantic analysis does not take place on the `tree` format (see section [14.3.2.2 Two Principal Possibilities](cobol_14.html#SEC67)), then this variable plays no role, but it must nonetheless be set. Usually it is set in the function `` `init_decl_processing' ``.
2.  `tree integer_type_node` used as a `tree` node that shows that the declaration for a fundamental type represents an integer, eg in the language C on the declaration of the type `` `int' ``. This is also usually set in the function `` `init_decl_processing' `` and then not changed.
3.  `tree char_type_node`: similar, but for letters, in C this is `` `char' ``
4.  `tree void_type_node` The name says it already: represents the empty type, especially important for procedures.
5.  `tree integer_zero_node, tree integer_one_node` denote respectively constants of type `` `integer_type_node' ``, with the values 0 or 1, are used in numerous places, among others as true and false in C.
6.  `tree current_function_decl` - is `` `NULL' `` as long as no function is being translated, and points otherwise to a `tree` node with type `` `FUNCTION_DECL' `` which represents the function being translated at the moment, representing the current translated function.

#### <a href="cobol_toc.html#TOC96" id="SEC96">14.3.5.2 Other Variables - tree nodes</a>

1.  `char *language_string`: A character string, eg `` `"Pascal"' ``, which contains the name of the currently translated language; has only cosmetic use, output at the start of the module `` `toplev.c' ``.
2.  `int flag_traditional`: Is needed by module `` `dwarfout.c' `` and used only by the language C. Thereby various dialects of this language are distinguished - See section \`C Dialect Options' in Using and Porting Gnu CC

#### <a href="cobol_toc.html#TOC97" id="SEC97">14.3.5.3 Functions for Types</a>

<span id="IDX42"></span>

The functions in this group serve to create fundamental types with the desired properties. This is particularly necessary in the language C. Many other high level lenguages create only one type for whole numbers, so these functions are no longer so important. Yet you must place an implementation at the disposal of the back end.

In general it is not recommended to implement these functions from nothing, rather to take as a model an implementation in a previous compiler and make only the necessary changes to it.

1.  `tree type_for_mode(enum machine_mode mode, int unsignedp)`: Creates a `tree` node, which is of the desired `` `mode' `` , where `` `mode' `` represents machine data types like whole or floating point numbers, processor conditions, or higher data types and so forth. For details see the files `` `machmode.h' `` and `` `machmode.def' ``.
2.  `tree type_for_size(unsigned precision, int unsignedp)`: a `tree` node of type whole number of exactly `` `precision' `` bits, which is unsigned precisely when `` `unsignedp' `` is non-zero.
3.  `tree unsigned_type(tree type)`: takes a basic type and returns the unsigned variant.
4.  `tree signed_type(tree type)`: similarly, takes a basic type and returns the signed variant.
5.  `tree signed_or_unsigned_type(int unsignedp, tree type)`: creates a variant of `` `type' ``, which is signless precisely when `` `unsignedp' `` is non-zero.
6.  `tree convert(tree type, tree expr)`: creates an expression, which has the same value as `` `expr' ``, but has type `` `type' ``. The simplest approach here is to use the implementation in `` `c-convert.c' ``.

#### <a href="cobol_toc.html#TOC98" id="SEC98">14.3.5.4 Back end Access to Symbol Table</a>

For some special operations it is necessary for the back end to have the option to access the symbol table of the front end, in order to insert things into it.

Particularly for the following functions it is sensible to use standard implementations, for these functions are very complex in their interactions.

Double book-keeping is recommended, which means the management of all symbols in two tables: one expressely for the front end, with the help of which the semantic analysis is performed, and which is also used to find the `tree` nodes which correspond to a given declaration, and a second, which works with the following functions, and whose main purpose is the construction of a `` `BLOCK' `` node for each scope level.

1.  `void init_decl_processing` called from `` `toplev.c' `` in order to initialize the symbol table: sets global variables, as documented for example in section [14.3.5 Callback](cobol_14.html#SEC94), inserts predefined variables into the symbol table and so forth.
2.  `int global_bindings_p()` is non-zero just when the current scope is global; necessary in `` `toplev.c' `` for the correction of an error, but which can be called, if, as in GCC, the semantic analysis is carried out on the `tree` nodes.
3.  `tree getdecls()` gives back a linked list of all declarations in the current level of the symbol table. The order is inverted, opposite to the original insertion sequence. These are needed in `` `toplev.c' `` in order to output the symbol table, and on the other hand, in order to define global variables which are declared but never defined.
4.  `int kept_level_p()` is non-zero when a `` `BLOCK' `` must be created for the current level of the symbol table. This function is presently not used by the back end, only by the front end<a href="cobol_foot.html#FOOT15" id="DOCF15">(15)</a>.
5.  `void pushlevel(int ignore)` creates a new level of the symbol table, so that the introduction of a symbol with an already known name causes a covering of the previous symbol. The parameter is always `` `0' `` when called from the back end. It is recalled that new levels are created not only by entry into a new function. Thus in C the declaration of variables in the middle of the source text is enabled, via a block statement<a href="cobol_foot.html#FOOT16" id="DOCF16">(16)</a> which corresponds to a level in the symbol table.
6.  `tree poplevel(int keep, int reverse, int functionbody)` again removes a level created by `` `pushlevel' ``, returns the symbol table back into the condition in which it was before the last `` `pushlevel' ``. Returns a node of type `` `BLOCK' ``. `tree` nodes of this type are used in order to generate information in the various debugging formats. They have no real use for the actual translation. If `keep != 0`, then a `tree` node of type `` `BLOCK' `` must be created, otherwise this is not necessary. If `reverse != 0`, then the list of declarations be must inverted, before they are are inserted into the `` `BLOCK' ``. This has a partly historical basis<a href="cobol_foot.html#FOOT17" id="DOCF17">(17)</a>. If `functionbody != 0`, then the uncovered scope belongs to a function<a href="cobol_foot.html#FOOT18" id="DOCF18">(18)</a>.
7.  `void insert_block(tree block)` inserts the `` `BLOCK' `` nodes into the list of the blocks within the current scope; this is required in `` `expr.c' `` for the translation of the lambda-abstraction.
8.  `void set_block(tree block)` sets the `` `BLOCK' `` for the current scope; this is needed in several places in `` `integrate.c' ``, also in `` `stmt.c' `` of the creation of RTL for `` `goto' `` constructs, which jump over the bounds of the scope regions.
9.  `tree pushdecl(tree decl)` inserts the declaration `` `decl' `` into the symbol table, and returns a `tree` node back. The returned node need not necesarily be identical to the argument. In the case of an equivalent declaration already in the symbol table, this is returned. Thus redundant declarations can be easily caught. The declarations are thereby placed at the front of the declaration list, so that the list is inverted with respect to the insertion order. These functions are used in `` `integrate.c' `` for 'inlining' in order to insert into the containing function the declaration of the inserted function.

#### <a href="cobol_toc.html#TOC99" id="SEC99">14.3.5.5 Initialization and Cleanup</a>

<span id="IDX43"></span> <span id="IDX44"></span>

All these functions are called from `` `toplev.c' ``. They neither take input parameters nor return a result. In the case when information transfer is necessary, then for good or evil global variables must result.

1.  `void lang_init()`: Front end specific initialization like setting certain global variables.
2.  `void lang_finish()`: Front end specific cleanup.
3.  `init_lex()`: No longer called.
4.  `init_parse`. Initialization for the parsing and lexical analysis. Can be used to open files etc.
5.  `finish_parse`. Wrap up the parsing and lexical analysis.
6.  `void lang_init_options()`: Front end specific initialization for option processing.

#### <a href="cobol_toc.html#TOC100" id="SEC100">14.3.5.6 Language Specific Initialization</a>

<span id="IDX45"></span>

This group of functions encompass functions which really depend on the semantics of the language. But here also again, it is easiest to adapt the source code of previous implementations.

1.  `tree maybe_build_cleanup(tree decl)` creates a `tree` node, which represents an automatic cleanup action. This is needed in languages like C++ for the automatic calling of of destructors on departure from a scope region or for exception handling. Otherwise `` `NULL_TREE' `` can be returned.
2.  `tree incomplete_type_error(tree value, tree type)` outputs an error report, in the case where the type `` `type' `` was only declared by way of a forward declaraion, but till now has not been defined. `` `value' `` is the expression in which the error was detected, or `` `NULL_TREE' ``, in case the error is common.
3.  `tree truthvalue_conversion(tree expr)` returns an expression which has the same value as `` `expr' `` but in a type which represents truth values.
4.  `void mark_addressable(tree expr)` marks `` `expr' `` as a construct which needs an address in storage. If `` `expr' `` is a variable declaration, it may not be placed in a register, whereas if it is a function declaration, then it may not only exist in 'inline' form. This relates to the address operator `` `&' `` in `` `C' ``.
5.  `copy_lang_decl(tree node)` is needed in `` `integrate.c' ``, in order to copy declarations, in which `` `DECL_LANG_SPECIFIC != 0' ``; if there are no such nodes, the routine body may remain empty.

#### <a href="cobol_toc.html#TOC101" id="SEC101">14.3.5.7 Accounting</a>

<span id="IDX46"></span>

1.  `void print_lang_statistics()` is called from `` `toplev.c' `` at the end of the compilation process. This can therefore be used to output statistical information about the compilation process, such as the number of created `tree` nodes, elapsed time for the various language specific optimization processes, and so forth. Bear in mind that generally the compiler should produce no messages for a correct input file, so it is probably best to output nothing unless an option requests statistics (eg absence of the `` `quiet' `` option).
2.  `void yyerror(char *)` is needed by parsers created by `` `bison' `` or `` `yacc' ``, in order to output error messages about sytax errors.

#### <a href="cobol_toc.html#TOC102" id="SEC102">14.3.5.8 Debugging Help</a>

<span id="IDX47"></span>

1.  `void print_lang_decl(FILE *file, tree node, int indent)` outputs the declaration for `` `node' `` with indentation depth `` `indent' `` to the file `` `file' ``.
2.  `void print_lang_type(FILE *file, tree node, int indent)` outputs the type for `` `node' `` with indentation depth `` `indent' `` to the file `` `file' ``.
3.  `void print_lang_identifier(FILE *file, tree node, int indent)` outputs the identifier `` `node' `` with indentation depth `` `indent' `` to the file `` `file' ``.
4.  `void set_yydebug(int value)` sets the debugging control for the sytax analysis on (`value != 0`) or off (`value == 0`).

#### <a href="cobol_toc.html#TOC103" id="SEC103">14.3.5.9 Input</a>

1.  `int lang_decode_option(char *opt)` is called from `` `toplev.c' `` for all options in the command line, which are declared in the field `` `lang_options' `` and returns `` `0' `` if the option is not recognized. Significantly it is recorded in global variables, that this variable was recognized. These variables can then be read from a common place.
2.  `int yyparse()` is called from the function `` `compile_file' `` in the module `` `toplev.c' ``. This function starts the syntax analysis and thereby the translation process. As is known of `` `bison' `` or `` `yacc' ``, the return value is precisly zero if no errors occurred. It is of course not necessary to realise the `` `yyparse' `` syntax analysis with a `` `bison' `` generated program; other preparation methods are quite acceptable. For the case where `` `bison' `` is used however, the convention exists, to hold the results of the reduction of processed statements in the parser for only a brief time, in order to make the grammar readable. The greater part of the work - the semantic analysis and the control of the code generator - are implemented in functions, which are called from the grammar actions.

## <a href="cobol_toc.html#TOC104" id="SEC104">14.4 Creating Your Own GNU Compiler</a>

In this chapter, two solutions of a practical problem should be discussed: what to do in order to annex the GNU back end to your own compiler, or how do you write a compiler, which integrates seamlessly into the GNU compiler family?

Fundamentally these are two different questions, on which here also separate answers should be given. One question is expressed in precise form: what to do exactly, in order to write a compiler which complies with the non-binding principles laid down by the authors of GCC? This "official" method of proceeding is especially recommended, if the semantic analysis uses the `tree` format as described above in section [14.3.2.2 Two Principal Possibilities](cobol_14.html#SEC67).

The author of this report has not himself held to this method of proceeding in his experimental implementation and instead proceeded in a different way to connect the GNU back end to a compiler.

Small modifications must be made to the driver `` `gcc' `` in order to inform it that the family of GNU compilers has grown. The module `` `toplev.c' `` must also take on small changes for each new member of the GNU compiler family, in order to recognize language specific options. This will be described shortly.

For the following it is useful, if you have installed GCC yourself, or at least have read and understood the file `` `INSTALL' ``. A certain experience with `` `make' `` files, the programming language `` `C' ``, macros and the like must be assumed.

We start with the assumption that GCC is already unpacked and has been built and that the object files have not been deleted.

- [The Official GNU Way](cobol_14.html#SEC105)
- [A Possible Alternative](cobol_14.html#SEC106)
- [Driver Program](cobol_14.html#SEC107)
- [Modifying toplev.c](cobol_14.html#SEC108)
- [Makefile and Configuration](cobol_14.html#SEC109)

### <a href="cobol_toc.html#TOC105" id="SEC105">14.4.1 The Official GNU Way</a>

The official GNU philosophy is that each new language should correspond to its own subdirectory<a href="cobol_foot.html#FOOT19" id="DOCF19">(19)</a> in the main directory<a href="cobol_foot.html#FOOT20" id="DOCF20">(20)</a>. First therefore you must create a new directory from the main directory using the `` `mkdir' `` command, and in which all of the following takes place.

In this directory the two files `` `Make-lang.in' `` and `` `Makefile.in' `` must be present. Both are part of the `` `make' `` file, which are incorporated into the larger `` `make' `` file through being called from the `` `make' `` file in the main directory.

`` `Make-lang.in' `` is actually included in the main makefile in the `` `gcc' `` directory. Its main role is to call the makefile in the language directory. For this makefile, the current directory `` `.' `` relates to the gcc object directory and the current source directory `` `srcdir' `` relates to the `` `gcc' `` source directory.

`` `Makefile.in' `` is used to create the makefile in the language directory. Thus the current directory and current source directory refer to the language source and object directory.

In addition, `` `config-lang.in' ``, which is read by the shell script `` `configure' ``, is needed. Concerning the contents of these files, the simplest approach is to copy the files from another language, such as for C++ from the directory `` `cp' `` and make appropriate changes. Simple sample files for this are also found in Kenner95b. Be sure to set the 'outputs' value as this tells configure where to place the generated Makefile.

Obviously also the source files and include files belong in the new subdirectory. Be careful to ensure that all the callback functions presented in section [14.3.5 Callback](cobol_14.html#SEC94) are implemented in the source code.

### <a href="cobol_toc.html#TOC106" id="SEC106">14.4.2 A Possible Alternative</a>

The original author has not himself adhered to the GNU scheme, though the translator did. It is indeed very flexible, general and capable, but - particularly for the inexperienced - difficult to see through. In addition, you can increase productivity if you manually bind together parts of the larger compiler.

You can speed up linking by using the following procedure. However with a reasonably fast CPU, this prociedure is not needed and the standard GNU procedure is sufficient. The procedure below has not been tested for several years and may no longer work.

The file `` `build-directory/gcc/stamp-objlist' `` has a list of the object files in GCC which are language independent}:

../diagnostic.o ../toplev.o ../version.o ../tree.o ../print-tree.o ../stor-layout.o ../fold-const.o ../function.o ../stmt.o ../except.o ../expr.o ../calls.o ../expmed.o ../explow.o ../optabs.o ../real.o ../builtins.o ../intl.o ../varasm.o ../rtl.o ../print-rtl.o ../rtlanal.o ../emit-rtl.o ../genrtl.o ../dbxout.o ../sdbout.o ../dwarfout.o ../dwarf2out.o ../xcoffout.o ../bitmap.o ../alias.o ../gcse.o ../integrate.o ../jump.o ../cse.o ../loop.o ../unroll.o ../flow.o ../combine.o ../varray.o ../regclass.o ../regmove.o ../local-alloc.o ../global.o ../reload.o ../reload1.o ../caller-save.o ../insn-peep.o ../reorg.o ../haifa-sched.o ../final.o ../recog.o ../reg-stack.o ../regrename.o ../insn-opinit.o ../insn-recog.o ../insn-extract.o ../insn-output.o ../insn-emit.o ../lcm.o ../profile.o ../insn-attrtab.o ../sparc.o ../convert.o ../mbchar.o ../dyn-string.o ../splay-tree.o ../graph.o ../sbitmap.o ../resource.o ../hash.o ../predict.o ../lists.o ../ggc-common.o ../ggc-page.o ../simplify-rtx.o ../ssa.o ../bb-reorder.o ../sibcall.o ../conflict.o

On different architectures from sparc, the file `` `sparc.o' `` will be replaced by the appropriate file.

With `` `ld -r stamp-objlist -o ind.o' `` one can gather these object files into one large object file, which can serve again as input to the linker<a href="cobol_foot.html#FOOT21" id="DOCF21">(21)</a>.

The make file should then be enhanced as follows:

    VPATH = . $(OTHER_DIRS)
    foo: ind.o toplev.o $(OTHER_OBJS)
            $(CC) -o foo ind.o toplev.o $(OTHER_OBJS)

and in order to create the driver:

    prefix = /home/nadler # Installations directory
    exec_prefix = $(prefix)
    libdir = $(exec_prefix)/lib # gcc-lib comes from here
    version = 2.7.2 # change correspondingly for other versions
    target = sparc-sun-sunos4.1.3_U1
                      # change correspondingly for others
    gcc_input_dirs = -Igcc272 -Igcc272/config # or where also
                      # the source code of GCC lies

    MAKEGCCFLAGS =   -DSTANDARD_STARTFILE_PREFIX=\"$(libdir)/\" \
      -DSTANDARD_EXEC_PREFIX=\"$(libdir)/gcc-lib/\" \
      -DDEFAULT_TARGET_VERSION=\"$(version)\" \
      -DDEFAULT_TARGET_MACHINE=\"$(target)\" \
      -DTOOLDIR_BASE_PREFIX=\"$(exec_prefix)/\"

    gcc: gcc.c specs.h lang-specs.h version.o obstack.o
         /home/nadler/bin/gcc  $(gcc_input_dirs) $(MAKEGCCFLAGS)\
         -o gcc gcc.c version.o obstack.o

Where `` `$(OTHER_OBJS)' `` is a `` `make' `` variable, in whose contents belong all other object files belonging to the compiler and `` `$(OTHER_DIRS)' `` contains other project directories<a href="cobol_foot.html#FOOT22" id="DOCF22">(22)</a>.

The callback functions and the other variables mentioned are obviously defined in these object files. It is important to define the above mentioned make variables correctly, whereby the driver knows where it can find the compiler. As already stated above, it looks for the compiler in the directory `` `$(libdir)/gcc-lib/$(version)/$(target)/' ``.

For practical work it turns out for be advantageous, if you have various GCC programs: one which is never changed, which is called by `` `make' ``, and which is used for practical work, and another, which one can play around with, try out new `` `specs' `` and for forth.

If part of the front end is already stable in the sense that one expects almost no more changes, then it is recommended to gather these parts into a larger object file using `` `ld -r' ``. The fewer open references the linker must close, the faster it runs. It pays therefore, to close cross references within the front end in this manner. However on modern CPUs this is not a big issue, as it only makes a difference of a second or two.

### <a href="cobol_toc.html#TOC107" id="SEC107">14.4.3 Driver Program</a>

In order for the driver program `` `gcc' `` to know about the new compiler, it must be slightly modified. Note - you need not modify the source of the driver - the modification occurs automatically as part of the build process.

One should copy a file `` `lang-specs.h' `` into the new language's directory, for example out of the C++ directory `` `cp' ``, and make modifications to it there.

In the already mentioned language `` `specs' ``<a href="cobol_foot.html#FOOT23" id="DOCF23">(23)</a> two facts must be specified:

1.  With which compiler is a file to be compiled, which has a certain ending? This ending is not unique, there can be several endings for one language; for C++ there are as many as five endings:

        {".cc", "@c++"},
        {".cxx", "@c++"},
        {".cpp", "@c++"},
        {".c++", "@c++"},
        {".C", "@c++"},

        This is read as follows: if the file ends with one of the endings
        `.cc, .cxx, .cpp, .c++' or `.C', then it is to be compiled
        with the yet to be defined 'virtual' compiler named `C++'.

2.  This definition happens for example as follows:

        {"@c++",
         "cpp -lang-c++ %{nostdinc*} %{C} %{v} %{A*} %{I*} %{P}\
           %{C:%{!E:%eGNU C++ does not support -C without using -E}}\ 
           -D__cplusplus %{W*}\n",
         "%{!M:%{!MM:%{!E:cc1plus %{!pipe:%g.ii} %1 %2\ 
            %{!Q:-quiet} -dumpbase %b.cc %{d*} %{m*} %{a}\ 
            %{g*} %{O*} %{W*} %{w} %{pedantic*}\ 
            %{v:-version} %{pg:-p} %{p}\ 
            %{f*} \ 
            %{S:%W{o*}%{!o*:-o %b.s}}}|\n\ 
            %{!S:as %a %Y\ 
            %{c:%W{o*}%{!o*:-o %w%b%O}}%{!c:-o %d%w%u%O}\ 
            %{!pipe:%g.s} %A\n }}}}"},

    The translator was called 'virtual' because it is not a program at the operating system level, but is simply a name that refers to the calling of a real program.

The example above is for illustrative purposes much shortened from `` `cp/lang-specs.h' ``. It means approximately;

1.  call the preprocessor `` `cpp' `` with the options `` `-lang-c++' `` and `` `-D__cplusplus' ``
2.  in case such a command line parameter is given, pass through the options `` `-C, -v, -P' ``
3.  if they are given, pass through all options which begin with `` `A, I, W' ``
4.  if the option `` `-E' `` but not the option `` `-C' `` was given, output an error message.
5.  if none of the options `` `-M, -MM' `` or `` `-E' `` are given, start the compiler `` `cc1plus' `` afterwards
6.  under what conditions which option is set for `` `cc1plus' `` should be clear with the explanation above and the previously mentioned definitions in `` `gcc.c' ``. What the individual options in general mean, can be determined from the gcc help information and manual.

A `` `specs' `` program is therefore simply a result of the expression of either or both of the forms described.

Therefore, what is required is to write a program to describe your own compiler. It can only be emphasised again, that the copying of pre-existing code is expressly encouraged, both by the author - from painful experience - and by the authors of GCC.

### <a href="cobol_toc.html#TOC108" id="SEC108">14.4.4 Modifying toplev.c</a>

<span id="IDX48"></span>

The author has not completely held to the GNU scheme in his experimental implementation. In order to be able to maintain a strict separation between the syntactic analysis, semantic analysis and code creation phases, which is not envisaged in the GNU scheme, instead of calling `` `yyparse' ``, my own routine called `` `yyparse' ``is called, which in turn calls a the real though renamed `` `yyparse' ``, obtains from this a syntax tree, and then from this starts the semantic analysis and the code creation. This decision is naturally purely a quetion of taste.

Also other changes may not be necessary but can be useful. Thus one can define additional options, in which the field `` `f_' `` is extended. These should certainly not be merely language specific options. It may thus be useful to define an option, whether a formatted output<a href="cobol_foot.html#FOOT24" id="DOCF24">(24)</a> is desired.

For really language specific options the callback function previously mentioned `lang_decode_option` may be used. To have this called, you must place the options to be handled into the field `` `lang_options' ``. It should obviously be noted that the language specific options and the `` `specs' `` programs must be coordinated with one another. In the choice of options you should take care not to come into conflict with already-used options.

It is useful, if your compiler uses the functions placed in `` `toplev.c' `` for error reporting, because that can contribute to a desirable unity. It is however not absolutely necessary.

### <a href="cobol_toc.html#TOC109" id="SEC109">14.4.5 Makefile and Configuration</a>

<span id="IDX49"></span> <span id="IDX50"></span>

A more detailed explanation of how the GCC makefiles work and how to integrate them is needed, but unfortunately does not exist. TODO.

See section [14.4.1 The Official GNU Way](cobol_14.html#SEC105) for some information on this..

A detailed explanation of how to use the GCC configuration information is needed but unfortunately does not exist. TODO when I have worked it out myself!

## <a href="cobol_toc.html#TOC110" id="SEC110">14.5 Generating RTL from the syntax tree</a>

<span id="IDX51"></span>

In this chapter the most important functions, constants and macros of the GNU back end are presented. The following is ordered according to themes, that is linguistic constructs.

Functions are given with their prototypes.

This chapter contains two examples section [14.9 Tree Examples](cobol_14.html#SEC156) which illustrate this material in context.

- [Memory Management](cobol_14.html#SEC111)
- [Common to All Tree Nodes](cobol_14.html#SEC114)
- [Routines](cobol_14.html#SEC115)
- [Scope](cobol_14.html#SEC116)
- [Types](cobol_14.html#SEC117)
- [Declarations](cobol_14.html#SEC126)
- [Building Expressions](cobol_14.html#SEC134)
- [Code for Control Structures](cobol_14.html#SEC144)
- [Other Statements](cobol_14.html#SEC150)

### <a href="cobol_toc.html#TOC111" id="SEC111">14.5.1 Memory Management</a>

<span id="IDX52"></span>

Note this discussion refers to the obsolete old style memory management. See above in section [14.3.3.5 Storage Management](cobol_14.html#SEC78) for the details of the new style memory management.

Defined in `` `tree.c' ``, prototype declared in `` `tree.h' ``.

It depends on the current storage mode, from which area storage is obtained by the `` `build*' `` and `` `expand*' `` routines described in this section.

- [Storage for enduring objects](cobol_14.html#SEC112)
- [Storage for short-lasting objects](cobol_14.html#SEC113)

#### <a href="cobol_toc.html#TOC112" id="SEC112">14.5.1.1 Storage for enduring objects</a>

<span id="IDX53"></span>

1.  `void temporary_allocation()`: from now reserve storage from the current `` `temporary' `` storage area.
2.  `void end_temporary_allocation()`: switch temporarily, until the next `resume_temporary_allocation` back into the `` `permanent' ``, but leave the `` `temporary' `` storage area unchanged.
3.  `void resume_temporary_allocation()`: reverse `end_temporary_allocation` and allocate from now on in the `` `temporary' `` mode.
4.  `void permanent_allocation(int function_end)`: switch permanently back to the `` `permanent' `` mode and release all the objects allocate in the `` `temporary' `` storage area; `function_end != 0`, if we have completed translating a global function.
5.  `void push_obstacks_nochange():` creates a recovery marker in the current storage area.
6.  `void pop_obstack()`: returns to the previous recovery marker, but does not free any storage.

#### <a href="cobol_toc.html#TOC113" id="SEC113">14.5.1.2 Storage for short-lasting objects</a>

<span id="IDX54"></span>

The momentary area is intended for allocation of objects which only exist transiently. This includes above all `tree` nodes which will soon be translated into RTL code through an `expand_(something)` call, thus for example expressions in statements, calls, conditions in loops, conditional statements, case statements, but also assignments and calls themsleves.

1.  `void push_momentary()`: switch into the `` `momentary' `` mode, if this mode is already active, creates a recovery marker.
2.  `void pop_momentary()`: returns to the previous recovery marker or returns to the previous mode respectively.
3.  `void clear_momentary()`: frees all the objects allocated since the last recovery marker.
4.  `int suspend_momentary()`: switch temporarily again back to the `` `temporary' `` mode. This is useful, if declarations are to be translated, which in C as in many languages come in the middle of the source code.
5.  `void resume_momentary(int flag)`: switches back to the `` `momentary' `` mode, the parameter is the value returned from the `suspend_momentary` call.

In a language like Pascal, it will seldom be necessary to use the `` `momentary' `` storage property. An important use case arises from the compilation of multiple branch statements. In this, `expand_end_case` normally requires the branching expression as a parameter, so after `expand_start_case` is called `push_momentary()` is called, thereby through the following `clear_momentary()` calls the branching expression is not freed.

### <a href="cobol_toc.html#TOC114" id="SEC114">14.5.2 Calls Common to All Tree Nodes</a>

The unified format in which the (partial) syntax tree is represented, is called `tree` format and is defined in the file `` `tree.h' ``.

It exists as a series of `struct` types. Certainly it is not quite as one may have expected, that is for each program language construct its own `struct` type is defined. Rather a basic type `struct treee_common` is defined which contains various fields, which all nodes in the `tree` format have in common. Thereon to build up for each 'class' of `tree` nodes, as for example declarations, expressions or types, a `struct` type is defined, which contains all fields which are only needed by nodes in this class. In all other node types of this class the field remains unused.

The macros following access the fields common to all node types:

1.  `enum tree_code TREE_CODE(tree node)`: this particularly important field contains a value which indicates exactly which node type this node is. An example of the value is `` `INTEGER_TYPE' `` for nodes which represent a kind of whole number, or `` `VAR_DECL' `` for nodes which represent a variable declaration, `` `MULT_EXPR' `` for a multiplication expression. The node types are explained and defined in `` `tree.def' ``. Unfortunately these values often have names which are similar to the names of the access macros defined in `` `tree.h' ``. Care is needed to avoid becoming confused.
2.  `tree node_type(tree node)`: often contains an pointer to the the type of the node. For derived types like arrays this points to the base type for example. The code generator carries out almost no type consistency checks; this is the responsibility of the front end. Generally if you get it wrong you will find that no code is generated, or the compiler may crash. For array nodes it is your respnsibility to set the type field. For pointer type nodes, this field points to the type to which the pointer type points, similarly for field and reference types.
3.  `tree node_chain(tree node)`: each node can be included in a linked list through this pointer. Note that some linked lists use this field. In other case the nodes are linked togther via another set of nodes which point to the subject nodes.
4.  otherwise all nodes have only a few boolean fields in common, which are often used in special cases. For details you are referred to `` `tree.h' ``.

You are again reminded, that the convention is never to access the fields of a node directly, but always only by means of the macros defined in `` `tree.h' ``.

### <a href="cobol_toc.html#TOC115" id="SEC115">14.5.3 Routines</a>

<span id="IDX55"></span>

For the fields of `tree` nodes and their respective access macros, in general the fields must be set *before* they have been passed to an `` `expand' `` routine, for values subsequently set have no further influence.

The code generator supports nested routines<a href="cobol_foot.html#FOOT25" id="DOCF25">(25)</a>. One should create a new level in the `` `temporary' `` storage area for each level of nested routines if you are using old style memory management.

`` `decl' `` is always in this section a `tree` node, which represents a declaration of node type `` `FUNCTION_DECL' ``.

1.  `void announce_function(tree decl)`, in `` `toplev.c' ``: is called at the beginning of the definition. Th effect is merely that an announcement is output, which is generally suppressed through the option `` `-quiet' ``.
2.  `void make_function_rtl(tree decl)`, in `` `varasm.c' ``: call for a declaration or definition of the function `` `decl' ``, only once naturally for each function. Issues the RTL code for the declaration of the function (as opposed to the function body itself).
3.  `void init_function_start(tree decl, char *filename, int line)`, in `` `function.c' ``: called at the beginning of the code creation of the body of the routine<a href="cobol_foot.html#FOOT26" id="DOCF26">(26)</a> for function declared with `` `decl' ``. Several variables are set in file `` `function.c' `` to prepare it for the translation of a new routine. `` `filename' `` is the name of the input file; this information is required for the output of debugging information, the same for the line number `` `line' ``. For other expressions you have to insert the file/lineno information by other means (by inserting empty statements).
4.  `void expand_function_start(tree decl, int parms_have_cleanups)`, in `` `function.c' ``: likewise called at the beginning of the code creation of the routine body for the function declared with `` `decl' ``; `parms_have_cleanups != 0` just when upon reurn from the routine `` `decl' `` certain cleanup actions on the input parameters are required, which could be useful for certain parameter passing mechanisms. It is important that the file name and line number be filled in as line number == 0 is a magic flag in various parts of the code and its use can cause crashes.
5.  `void expand_function_end(tree decl, int line, int end_bindings)`, in `` `function.c' ``: At the end of the code creation for the routine's body, this is called for the function declared with `` `decl' ``; `` `line' `` is again the line number; `end_bindings != 0` just when `` `expand_function_end' `` should call the function `` `expand_end_bindings' ``. It is important that the file name and line number be filled in as line number == 0 is a magic flag in various parts of the code and its use can cause crashes.
6.  `rest_of_compilataion(tree decl)`, in `` `toplev.c' ``: carries out optimisation on prepared RTL code of the routine `` `decl' `` and creates assembler code.
7.  Field `DECL_RESULT(decl)`: return variable of the function `` `decl' ``, is a declaration with `` `tree_code' `` `` `RESULT_DECL' `` or `` `NULL_TREE' `` for procedures wihich which have no return value. This variable contains the result of the function, which is given back to the calling function.
8.  Field `DECL_ARGUMENTS(decl)`: points to the first element of a list linked via `` `TREE_CHAIN' `` containing the declarations of the formal parameters (`` `PARM_DECL' ``) of `` `decl' ``.
9.  Field `TREE_TYPE(decl)`: function type of the routine `` `decl' ``, a `tree` node created by `` `build_function_type' ``.
10. Field `DECL_INITIAL(decl)`: contains `` `BLOCK' `` nodes with all declarations with `` `decl' `` for output in debugger format, `tree` nodes created by `` `build_block' ``, here most simply the return value from `` `poplevel' `` (???).
11. Field `TREE_PUBLIC(decl) != 0` when `` `decl' `` should also be visible outside the current compilation unit, not used for routines which are merely local. This is the opposite of `static` in `C`.
12. Field `TREE_STATIC(decl) != 0` just when `` `decl' `` has not only been declared but also defined (not to be confused with `` `static' `` in C).
13. Field `TREE_EXTERNAL(decl) != 0` just when `` `decl' `` is only a declaration for a definition outside the current compilation unit.
14. Field `TREE_ADDRESSABLE(decl) != 0` just when `` `decl' `` is a function which must have a non-inline version. This does not prevent it from being inlined however, it just needs a non-inline copy..

### <a href="cobol_toc.html#TOC116" id="SEC116">14.5.4 Scope</a>

<span id="IDX56"></span>

1.  `void expand_start_bindings(int exit_flag):`, in `` `stmt.c' ``, creates RTL for the beginning of a new scope region; `exit_flag != 0` just when this scope region can be exited by means of an `` `expand_exit_something' ``.
2.  `void expand_decl(tree decl)`, in `` `stmt.c' ``, inserts the local variable `` `decl' `` into the current scope region. In this case `TREE_CODE(decl) == VAR_DECL`. This may ne incorrect - I think pushdecl actually inserts it into the scope.
3.  `void expand_end_bindings(tree vars, int mark_ends, int dont_jump_in)`, in `` `stmt.c' ``, creates RTL for the end of a scope region. In this case `` `vars' `` is the list of declaration nodes for the variables declared in this scope region; this list is generally supplied by a call to the callback function `` `getdecls()' ``. `mark_ends != 0` just when semantically meaningless RTL markers would be placed at the beginning and end of the scope region; `dont_jump_in != 0` just when it is not allowed to jump into the middle of the scope region, for example using `` `goto' ``.
4.  `void expand_decl_init(tree decl)`, in `` `stmt.c' ``, creates RTL for the initialization of the variable `` `decl' ``, if `` `DECL_INITIAL' `` is set, then to this value, otherwise 0 for basic types.
5.  `int expand_decl_cleanup(tree decl, tree cleanup)`, in `` `stmt.c' ``, creates RTL for a cleanup action<a href="cobol_foot.html#FOOT27" id="DOCF27">(27)</a> `` `cleanup' `` for the variable `` `decl' ``, which wll be automatically called up on departure from the scope region. `` `cleanup' `` could be a call to a cleanup routine, but it may in principle perform any complex `tree` expression.
6.  The callback functions `` `global_bindings_p' ``, `` `getdecls' ``, `` `pushlevel' ``, `` `poplevel' ``, `` `pushdecl' ``, `` `insert_block' ``, `` `set_block' `` and `` `kept_level_p' `` belong in a certain sense to this group. They were already comprehensively discussed in the section section [14.3.5.4 Back end Access to Symbol Table](cobol_14.html#SEC98).
7.  The data structure `` `BLOCK' `` is defined in `` `tree.h' ``. The function `` `poplevel' `` returns such a data structure. It has strictly speaking no semantic meaning, but nodes of type `` `FUNCION_DECL' `` store their `` `BLOCK' `` and in appropriate cases also their subblocks in their field `` `DECL_INITIAL' `` for use by the debugger, I believe.
8.  `tree build_block(vars, tags, subblocks, supercontext, chain)`, in `` `tree.c' ``. This function is really only used in `` `poplevel' ``. It creates a `tree` node of type `` `BLOCK' `` and initializes it:
    - `` `vars' `` is a chain of declarations
    - `` `tags' `` are a chain with names of `` `struct' `` `` `union' `` declarations; these are presumably not used in most other languages.
    - `` `subblocks' `` is the chain of `` `BLOCK' `` structures of the scope region lying immediately within this scope region.
    - `` `supercontext' `` is the block `` `BLOCK' `` of the enclosing scope region.
    - `` `chain' `` is the value to which the field `` `TREE_CHAIN' `` should be initialized, generally `` `NULL_TREE' ``

### <a href="cobol_toc.html#TOC117" id="SEC117">14.5.5 Types</a>

<span id="IDX57"></span>

This are numerous types supported. The `` `tree_code' `` constants for types all have the form `` `*_TYPE' ``. For the creation of `tree` nodes of many useful varieties of types, each one has its own `` `build_*' `` function.

- [Basic Types](cobol_14.html#SEC118)
- [Integral Types](cobol_14.html#SEC119)
- [Array Types](cobol_14.html#SEC120)
- [Function Types](cobol_14.html#SEC121)
- [Record Types](cobol_14.html#SEC122)
- [Pointer Types](cobol_14.html#SEC123)
- [Variant Types](cobol_14.html#SEC124)
- [Other Types](cobol_14.html#SEC125)

#### <a href="cobol_toc.html#TOC118" id="SEC118">14.5.5.1 Basic Types</a>

<span id="IDX58"></span>

`` `make_node(enum tree_code code)' ``: returns a node of the kind specified by `` `code' ``. Allocated from the storage area which is appropriate to the current mode. Nodes for the basic types are created using `` `make_node' ``.

The following values for `` `code' `` define the important basic types:

- `` `VOID_TYPE' ``: empty type, primarily used as return type for functions which are procedures, created by means of `` `make_node(VOID_TYPE)' ``
- `` `INTEGER_TYPE' ``: (??? seems to be missing)
- `` `BOOLEAN_TYPE' ``: Type which can only contain a value of true or false.
- `` `CHAR_TYPE' ``: Type for individual signs and characters (Pascal)
- `` `REAL_TYPE' ``: Type for floating point numbers

#### <a href="cobol_toc.html#TOC119" id="SEC119">14.5.5.2 Integral Types</a>

<span id="IDX59"></span>

`` `tree make_node(enum tree_code INTEGER_TYPE)' ``: creates a basic type for an integer type). This is primarily needed, in order to set the variable `` `integer_type_node' `` and for the implementation of the callback functions in section [14.3.5 Callback](cobol_14.html#SEC94).

#### <a href="cobol_toc.html#TOC120" id="SEC120">14.5.5.3 Array Types</a>

<span id="IDX60"></span>

- `` `ARRAY_TYPE' ``: `` `tree_code' `` Value for the array type (`` `ARRAY type in Pascal' ``). Be aware that C arrays are not always treated in this way, because they are sometimes handled like pointers. More precisely, they are created as arrays but accessed via pointers.
- `tree build_index_type(tree maxval)`: create an index type for a field with possible index values between 0 and `` `maxval' ``.
- `tree build_index_2_type(tree lowval, tree highval)`: create an index type for an array with possible indexes between `` `lowval' `` and `` `highval' ``
- `tree build_array_type(tree elt_type, tree index_type)`: create a type "array of `` `elt_type' ``"; `` `index_type' `` is an index type created with `` `build_index_type' `` or `` `build_index_2_type' ``.

#### <a href="cobol_toc.html#TOC121" id="SEC121">14.5.5.4 Function Types</a>

<span id="IDX61"></span>

The creation of function is quite involved.

You have to create what is effectively a function prototype which contains a list of the types of the paramaters and also their names and the return value.

The type list is a list of `tree_list` nodes whose value field contains a pointer to the type. This list is created with `tree_cons`.

A special 'magic' type node `type_void_node` pointed to by the `tree_list` node at the end of the list is used to indicate that the parameter list is fixed in length. In its absence the parameter list can have extra elements (as in `` `printf(FILE f,char * s,,...)' `` in C).

You need to create the return value type and store it in the `DECL_RESULT` field. If the return value is void, them you can <a href="cobol_foot.html#FOOT28" id="DOCF28">(28)</a> use `NULL_TREE` or `void_type_node` in the `DECL_RESULT` field to indicate this.

When creating the body of a function you also have to create the format parameters. These are a list of variable declarations and are lisked together by the `tree_chain` field. You can use `chainon` to link them together.

You need to create two levels of blocks at least within the function, and assign the return value and then call a macro to say that it is the return value.

When calling a function you have to create a `tree` node for a pointer to the function as well as all the actual parameters and link them together, then create the function call and embed it in an expression. The actual parameters are linked via `tree_list` nodes using `tree_cons`.

It is important to set the flags indicating that the function has side-effects for example if it returns a void, otherwise it will not have code generated. Finally it is inportant to ensure that all the actual parameters are cast to the right values, even if this is a no-op (ie a NOP_EXPR).

Take close note of the sample calls in the sample applications and in the `` `cobcbei.c' `` routine in the Cobol compiler.

- The value in `` `TREE_CODE' `` is `` `FUNCTION_TYPE' ``
- `tree build_function_type(tree (value_type, tree arg_types)`: creates a node for the type of function with return type `` `value_type' `` and then parameter types `` `arg_types' ``. `` `arg_types' `` is a `` `TREE_LIST' `` of `` `*_TYPE' `` nodes. Each `` `FUNCTION_DECL' `` requires in its `` `CODE_TYPE' `` field a pointer to a node of type `` `FUNCTION_TYPE' ``.

#### <a href="cobol_toc.html#TOC122" id="SEC122">14.5.5.5 Record Types</a>

<span id="IDX62"></span>

Unfortunately there is no complete single function for the creation of `tree` nodes for record types.

- `tree make_node(RECORD_TYPE)`: creates an initially empty record type like `` `struct' `` in C or `` `record' `` in Pascal, the fields are progressively inserted. When the record type is ready, `` `layout_type' `` and `` `rest_of_type_compilation' `` must be called.
- `` `UNION_TYPE' ``: similar to the `RECORD_TYPE`, but here all fields lie at the same address, corresponding to `` `union' `` in C
- `` `QUAL_UNION_TYPE' ``: similar to the `` `UNION_TYPE' ``, for a variant union.
- `tree build_decl(FIELD_DECL, tree name, tree type)`: creates a field declaration with a name `` `name' `` and the type `` `type' ``, does not insert it into any record however. This must be done "by hand", in which it is connected into the list, connected by `` `TREE_CHAIN' ``, and linked off the `` `TYPE_FIELDS' `` field of the record node.
- `void layout_type(tree type)`, in the module `` `stor-layout.c' ``, must be called in order to calculate the size of an object of type `` `type' ``.
- `rest_of_type_compilation(tree type)`, in module `` `toplev.c' ``, must be called in order to convert the format of a record into a format readable by the debugger.

#### <a href="cobol_toc.html#TOC123" id="SEC123">14.5.5.6 Pointer Types</a>

<span id="IDX63"></span>

- `tree build_pointer_type(tree type)`: creates a type of the form "pointer to `` `type' ``", where `` `type' `` is a type itself of course.
- `` `POINTER_TYPE' ``: corresponding `` `code' `` value

#### <a href="cobol_toc.html#TOC124" id="SEC124">14.5.5.7 Variants of Types</a>

<span id="IDX64"></span>

- `` `build_type_copy' ``
- `` `build_type_variant' ``
- `` `build_type_attribute_variant' ``

#### <a href="cobol_toc.html#TOC125" id="SEC125">14.5.5.8 Other Types</a>

<span id="IDX65"></span>

For the sake of completeness, several types are mentioned here, but not further explained. Further reference is available in `` `tree.h' `` and above all in `` `tree.def' ``.

- `` `build_range_type' ``: for subrange types
- `` `ENUMERAL_TYPE' ``: for enumeration types, like `` `enum' `` in C
- `` `SET_TYPE' ``: for set types like in Pascal
- `` `OFFSET_TYPE' ``: for offset types, similar to a pointer, but relative to a base address
- `` `METHOD_TYPE' ``: for method types, like in C++
- `` `REFERENCE_TYPE' ``: for reference types like in C++
- `` `FILE_TYPE' ``: for file types like in Pascal
- `` `build_complex_type' ``: for complex number types (`` `COMPLEX_TYPE' ``)
- `` `LANG_TYPE' ``: for language specific types

### <a href="cobol_toc.html#TOC126" id="SEC126">14.5.6 Declarations</a>

<span id="IDX66"></span>

- `tree get_identifier(char *str)`: returns a `tree` node for the name `` `str' ``.
- `tree build_decl(enum tree_code code, tree name, tree type)`: creates a declaration node with the (following later) permissible value of `` `code' ``. Name is a node created with `` `get_identifier' ``.
- it is the job of the caller, to place the declaration in each case into a symbol table, as `` `build_decl' `` does not do so.
- Before the conversion into RTL the field `` `DECL_CONTEXT' `` must be set. For global declarations it contains `` `NULL_TREE' ``.
- DECL_SOURCE_FILE and DECL_SOURCE_LINE can be used to set the line number and file name from which the declaration came. It is recommended you set these values, as 0 is sometimes used as a magic value and can cause crashes.

<!-- -->

- [Variables](cobol_14.html#SEC127)
- [Formal Parameters](cobol_14.html#SEC128)
- [Field Declarations for Record Types](cobol_14.html#SEC129)
- [Declarations for Routines](cobol_14.html#SEC130)
- [Declarations for Jump Labels](cobol_14.html#SEC131)
- [Declarations for Symbolic Constants](cobol_14.html#SEC132)
- [Declarations for Named Types](cobol_14.html#SEC133)

#### <a href="cobol_toc.html#TOC127" id="SEC127">14.5.6.1 Variables</a>

<span id="IDX67"></span>

`` `tree_code' `` for `` `build_decl' ``: `` `VAR_DECL' ``

- `DECL_CONTEXT(decl)` must point to the `` `FUNCTION_DECL' ``: in which the variable is declared, or `` `NULL_TYPE' `` for global variables.
- `TREE_TYPE(decl)` is the declared type.
- `DECL_INITIAL(decl)` can contain a value (`tree`), to which the variable should be initialized.
- Field `TREE_PUBLIC(decl) != 0` just when `` `decl' `` should be visible also outside the current translation unit, only useful for global variables.
- Field `TREE_STATIC(decl) != 0` just when `` `decl' `` is not only declared but also defined (not to be confused with `` `static' `` in C).
- Field `TREE_EXTERNAL(decl) != 0` just when `` `decl' `` a declaration is outside the current translation unit, only useful for global variables.
- Field `TREE_ADDRESSABLE(decl) != 0` just when `` `decl' `` is a function, for which a non-inline version is required.

A special case is the `` `RESULT_DECL' ``: it declares the result variable of a function. It is only useful as `` `DECL_RESULT' `` field in a `` `FUNCTION_DECL' ``.

#### <a href="cobol_toc.html#TOC128" id="SEC128">14.5.6.2 Formal Parameters</a>

<span id="IDX68"></span>

- `` `PARM_DECL' ``: `` `DECL_CONTEXT' `` must point to the `` `FUNCTION_DECL' `` in which the formal parameters were declared.
- `` `TREE_TYPE' `` is the declared type.
- `` `DECL_INITIAL' `` can contain a value (`tree`) to which the formal parameter should be pre-initialized. I am not sure where this feature is used if anywhere.
- `` `DECL_ARG_TYPE' `` can contain a value (`tree`) to which the argument should be converted. In C for example `` `char' `` is converted into `` `int' ``.
- `TREE_READONLY != 0`, when parameter may not be set. Many languages, for example Eiffel, permit no writing to formal parameters.

#### <a href="cobol_toc.html#TOC129" id="SEC129">14.5.6.3 Field Declarations for Record Types</a>

<span id="IDX69"></span>

were already explained in section [14.5.5.5 Record Types](cobol_14.html#SEC122).

#### <a href="cobol_toc.html#TOC130" id="SEC130">14.5.6.4 Declarations for Routines</a>

<span id="IDX70"></span>

See above in section [14.5.3 Routines](cobol_14.html#SEC115).

#### <a href="cobol_toc.html#TOC131" id="SEC131">14.5.6.5 Declarations for Jump Labels</a>

<span id="IDX71"></span>

- `` `LABEL_DECL' ``: The `` `TYPE_CODE' `` contains the value `` `NULL_TREE' ``. `` `DECL_CONTEXT' `` must point to the `` `FUNCTION_DECL' ``, in which the jump label was declared.

#### <a href="cobol_toc.html#TOC132" id="SEC132">14.5.6.6 Declarations for Symbolic Constants</a>

<span id="IDX72"></span>

- `build_decl(CONST_DECL, tree name, tree type)`: creates a symbolic constant with the name `` `name' `` and the type `` `type' ``.
- the value must be placed in the field `` `DECL_INITIAL' ``.

#### <a href="cobol_toc.html#TOC133" id="SEC133">14.5.6.7 Declarations for Named Types</a>

<span id="IDX73"></span>

- `` `TYPE_DECL' ``: for the creation of named types, like `` `typedef' `` in C or `` `TYPE' `` declarations in Pascal.
- `` `TREE_TYPE' `` contains the type, the name is in `` `DECL_NAME' ``. `` `DECL_CONTEXT' `` must point to the `` `FUNCTION_DECL' ``, in which the type was declared or is `` `NULL_TREE' `` for global types.

### <a href="cobol_toc.html#TOC134" id="SEC134">14.5.7 Building Expressions</a>

<span id="IDX74"></span>

`tree` representations of expressions as constructs which represent objects, which have values at run time, are primarily created with the help of the following three functions:

- `tree build(enum tree_code code, tree type, ...)`: this is the basic function with the help of which the majority of the expressions in this section are created. `` `code' `` is a constant of enumeration type `` `enum tree_code' ``, which gives the type of the desired expression. There are constants for addition, comparisons, function calls, dereferencing and so on. In the following sections the creation of expressions with the various values is presented. Each expression has a type `` `type' ``. This is a `tree` of the form presented in section [14.5.5 Types](cobol_14.html#SEC117).
- `tree build1(enum tree_code code, tree type, tree expression)`: is a special case, which runs faster, of build for the case that the expression has only one child node.
- `tree build_nt(enum tree_code code, ...)`: just like `` `build' ``, but without a type parameter.

<!-- -->

- [Building Logical Expressions](cobol_14.html#SEC135)
- [Building Arithmetic Expressions](cobol_14.html#SEC136)
- [Building Comparison Expressions](cobol_14.html#SEC137)
- [Building Constant Expressions](cobol_14.html#SEC138)
- [Building Function Call Expressions](cobol_14.html#SEC139)
- [Building Conversion Expressions](cobol_14.html#SEC140)
- [Building Storage Access Expressions](cobol_14.html#SEC141)
- [Control Structures for Functional Programs](cobol_14.html#SEC142)
- [Building Other Expressions](cobol_14.html#SEC143)

#### <a href="cobol_toc.html#TOC135" id="SEC135">14.5.7.1 Logical Expressions</a>

<span id="IDX75"></span>

`` `TRUTH_ANDIF_EXPR' `` and `` `TRUTH_ORIF_EXPR' `` denote semi-strict expressions, which means that the calculation operation is terminated, if the result is clear from the result of the left hand side operand.

`` `type' `` is most usefully a type which only represents the values true and false. But that need not be the case. C for example uses whole number types for truth expressions.

- `build1(NOT_EXPR, tree type, tree expression)`: logical negation (NOT) of `` `expression' ``.
- `tree build(TRUTH_ANDIF_EXPR, tree type, tree left, tree right)`: semistrict conjunction (AND).
- `tree build(TRUTH_AND_EXPR, tree type, tree left, tree right)`: strict conjunction (AND).
- `tree build(TRUTH_ORIF_EXPR, tree type, tree left, tree right)`: semistrict disjunction (OR).
- `tree build(TRUTH_OR_EXPR, tree type, tree left, tree right)`: strict disjunction (OR).
- `tree build(TRUTH_XOR_EXPR, tree type, tree left, tree right)`: exclusive OR.

#### <a href="cobol_toc.html#TOC136" id="SEC136">14.5.7.2 Arithmetic Expressions</a>

<span id="IDX76"></span>

The usual arithmetic expressions for negation, addition, subtraction, multiplication, and exponentiation are supported. Besides there is a whole series of division and modulus expressions which all behave differently according to whether upward or downward rounding or truncation should be done, in case of a remainder.

Either both operands must be floating point or both operands must be fixed point. (It must not be a matter of the same types ??? Es mu"s sich nicht um denselben Typ handeln.) `` `type' `` must come from the same family of types as both operands. If a floating point number needs to be combined with a fixed point number, then a type conversion is necessary, see `` `CONVERT_EXPR' ``.

- ` build1(NEGATE_EXPR, type, expression)`: create unary negation, thus an expression of the form `` `-expression' ``.
- `build(PLUS_EXPR, type, left, right)`: addition of `` `left' `` and `` `right' ``.
- `build(MINUS_EXPR, type, left, right)`: subtraction - `` `right' `` from `` `left' ``
- `build(MULT_EXPR, type, left, right)`: multiplication

There are various divisions operations supported for whole numbers:

- `` `TRUNC_DIV_EXPR' ``: truncate after the (decimal) point
- `` `CEIL_DIV_EXPR' ``: round up
- `` `FLOOR_DIV_EXPR' ``: round down
- `` `ROUND_DIV_EXPR' ``: round to the closest whole number
- `` `EXACT_DIV_EXPR' ``: has no remainder, makes sense only for cases where it is already known that there can be no remainder, like pointer arithmetic in C.

There are also the corresponding remainder operations; here are the `` `TREE_CODE' `` values:

- `` `TRUNC_MOD_EXPR' ``
- `` `CEIL_MOD_EXPR' ``
- `` `FLOOR_MOD_EXPR' ``
- `` `ROUND_MOD_EXPR' ``

#### <a href="cobol_toc.html#TOC137" id="SEC137">14.5.7.3 Comparison Expressions</a>

<span id="IDX77"></span>

Equality and inequality tests are permitted for the supported (??? beliebige) types. `` `type' `` is most usefully of the same type which is used in logical expressions.

- `build(EQ_EXPR, tree type, tree left, tree right)`: equality test
- `build(NE_EXPR, tree type, tree left, tree right)`: inequality test

Ordinal relations on the other hand are only supported for whole number, floating point and pointer types.

- `build(LT_EXPR, tree type, tree left, tree right)`: less than
- `build(LE_EXPR, tree type, tree left, tree right)`: less than or equal
- `build(GT_EXPR, tree type, tree left, tree right)`: greater than
- `build(GE_EXPR, tree type, tree left, tree right)`: greater than or equal

#### <a href="cobol_toc.html#TOC138" id="SEC138">14.5.7.4 Constant Expressions</a>

<span id="IDX78"></span>

The types `` `HOST_WIDE_INT' `` and `` `REAL_VALUE_TYPE' `` are defined the the `` `machmode.h' `` and `` `real.h' `` architecture dependent files.

- `tree build_int_2(HOST_WIDE_INT low, HOST_WIDE_INT hi)`: creates a constants of whole number type `` `integer_type_node' ``. If desired the type (`` `TREE_TYPE' ``) of the constant can later be set to another whole number type. In order to make it possible to have constants which are larger than those directly supported by the machine architecture, the value must be given in two halves. In case only the usually wide value is used, `` `hi' `` must be set to the correct sign: `build_int_2(low, low >= 0 ? 0 : -1);` is a correct call in this case.
- `tree build_real(tree type, REAL_VALUE_TYPE value)`: creates a floating point constant of type `` `type' `` with value `` `value' ``.
- `tree build_real_from_int_cst(tree type, tree value)`: the same, but value `` `value' `` is here a whole number constant `tree` created with `` `build_int_2' ``.
- `tree build_string(int len, char *str)`: creates a character string of length `` `len' `` and with contents `` `str' ``. You must set the `TREE_TYPE`, probably to an array of bytes.

#### <a href="cobol_toc.html#TOC139" id="SEC139">14.5.7.5 Function Call Expressions</a>

<span id="IDX79"></span>

It is not necessary to distinguish between function and procedure calls. See procedure calls in section [14.5.9.1 Calls and Assignments](cobol_14.html#SEC151).

#### <a href="cobol_toc.html#TOC140" id="SEC140">14.5.7.6 Conversion Expressions</a>

<span id="IDX80"></span>

- `build1(NOP_EXPR, void_type_node, NULL_TREE)`: empty expression, useful only for conversion expressions for which no code creation is needed, as perhaps between whole number and pointer types, or between different pointer types.
- `build1(CONVERT_EXPRESSION, tree type, tree expression)`: creates a `tree` expression with the same value as `` `expression' ``, but with a new type. Used for conversions, for which code must be created.
- for the special case of conversion from floating point to whole number types there are rounding variations corresponding to the rounding types for a division, thus `` `FIX_TRUNC_EXPR' ``, `` `FIX_CEIL_EXPR' ``, `` `FIX_FLOOR_EXPR' ``, `` `FIX_ROUND_EXPR' `` for truncation, up rounding, down rounding and conventional rounding.
- also for the converse special case, conversion from whole numbers into floating point, there is one node type: `` `FLOAT_EXPR' ``.

#### <a href="cobol_toc.html#TOC141" id="SEC141">14.5.7.7 Storage Access Expressions</a>

<span id="IDX81"></span>

- `build1(INDIRECT_REF, type, expr)`: returns an expression which represents the dereferencing of a pointer. `` `expr' `` is an expression which must have pointer type.
- `build(COMPONENT_REF, type, record, field)`: returns an expression, which accesses the field `` `field' `` from the record `` `record' ``. The expression `` `record' `` must have record type, `` `field' `` must be a field declaration from the type of `` `record' ``.
- `build(ARRAY_REF, type, array, index_list)`: returns an expression which represents access to a field. `` `array' `` must be a possibly multi-dimensional array; `` `index_list' `` must be a `` `TREE_LIST' `` of expressions with whole number type.
- for the representation of expressions, to represent the access to declared variables, simply use the corresponding declaration nodes. In order to find these, it is best to use a symbol table.

As always, `` `type' `` is the type of the returned expression; as always pay attention to consistency. For dereferencing of a pointer to a whole number type, you should specify the whole number type and not the field type. "She'll be right mate" will not work - you need to get the types just right.

#### <a href="cobol_toc.html#TOC142" id="SEC142">14.5.7.8 Control Structures for Functional Programs</a>

<span id="IDX82"></span>

For the compilation of functional programs, several expressions are needed which represent control structures. For the compilation of imperative programs the functions explained above in section [14.3.2.5 Control Structures](cobol_14.html#SEC70) may be used to regulate the flow of control. It is naturally possible to do this also with the constructs presented here.

As far as I am aware these constructs are not used by any language - there are no functional languages in the GCC family. So use them with caution.

- `build(COMPOUND_EXPR, type, expression, value)`: creates an expression, which first computes `` `expression' ``, then `` `value' `` and returns the results of `` `value' ``. Corresponds to the `` `,' `` operator in C.
- `build1(LABEL_EXPR, void_type_node, label)`: creates an expression, which is a jump label set to `` `label' ``. `` `label' `` is a `` `LABEL_DECL' ``.
- `build1(GOTO_EXPR, void_type_node, label)`: creates an expression, which executes an unconditional jump to the jump label `` `label' ``. `` `label' `` is a `` `LABEL_DECL' ``.
- `build1(RETURN_EXPR, type, expression)`: creates an expression, which the current function leaves (??? verl"a"st) after evaluation of `` `expression' ``. The returned value is the momentary value of `` `RESULT_DECL' `` of the current function.
- `build1(LOOP_EXPR, void_type_node, body)`: creates an expression, which represents a loop with body `` `body' ``.
- `build1(EXIT_EXPR, void_type_node, cond)`: creates an expression, which leaves the surrounding loop, if the condition `` `cond' `` is evaluated to 'true'.
- `build(COND_EXPR, type, cond, then_part, else_part)`: creates an expression, which first evaluates `` `cond' ``, and returns the value of `` `then_part' `` if `` `cond' `` is evaluated to 'true', and otherwise returns the value of `` `else_part' ``. This corresponds to the `` `? :' `` operator in C. `` `type' `` type is as always the type of the created expression.
- `build(BIND_EXPR, type, vars, body, block)` creates a lambda-abstraction, over the variables listed in `` `vars' ``, with `` `body' `` as body of the expression in which the variables in `` `vars' `` occur. `` `vars' `` is the first element of list linked by `` `tree_chain' ``. `` `body' `` is an expression. `` `block' `` is a `` `BLOCK' `` created by means of `` `build_block' ``, which contains the variables for the debugger. If one encloses the body of the abstraction through `` `pushlevel' ``/`` `poplevel' ``, one obtains `` `BLOCK' `` as the return from the `` `poplevel' ``.

#### <a href="cobol_toc.html#TOC143" id="SEC143">14.5.7.9 Other Expressions</a>

<span id="IDX83"></span>

There are yet more expressions than have been presented up to now, for example for shift and rotation operations, for bitwise combination, for Pascal style set operations, for auto increment and decrement, for complex numbers and even more. They are defined and explained in `` `tree.def' ``.

### <a href="cobol_toc.html#TOC144" id="SEC144">14.5.8 Code for Control Structures</a>

<span id="IDX84"></span>

- [Conditional Statements](cobol_14.html#SEC145)
- [Looping Statements](cobol_14.html#SEC146)
- [Multibranch Statements](cobol_14.html#SEC147)
- [Jump Statements](cobol_14.html#SEC148)
- [Other Jump Statements](cobol_14.html#SEC149)

The following functions are defined and explained together in `` `stmt.c' ``. Some of these functions take a `tree` node representing an expression, as a parameter. The expression is translated into RTL upon request.

#### <a href="cobol_toc.html#TOC145" id="SEC145">14.5.8.1 Conditional Statements</a>

<span id="IDX85"></span>

- `void expand_start_cond(tree cond, int exitflag)`: creates RTL code for the beginning of a conditional statement. `` `cond' `` is the test condition; `exitflag != 0` just when the conditional statement can be left through `expand_exit_something`.
- `void expand_start_elseif(tree cond)`: creates RTL code for a further test condition.
- `void expand_start_else()`: creates the beginning of the RTL for the statement, which is executed if all the previous tests of this conditional statement were false.
- `void expand_end_cond()`: creates RTL for the end of this conditional statement.
- `void expand_elseif(tree cond)`: converts the `` `else' `` branch into a `` `elseif' `` under the condition `` `cond' ``. Purpose unknown, not used in GCC itself.

#### <a href="cobol_toc.html#TOC146" id="SEC146">14.5.8.2 Looping Statements</a>

<span id="IDX86"></span>

Several of the following functions return a structure of type `` `struct nesting' `` or require such a value as a parameter. The contents of this structure are irrelevant for us, as it must merely be ensured that in each case the correct structure corresponding to the loop concerned is passed.

- `struct nesting *expand_start_loop(int exit_flag)`: Creates the beginning of a loop; again `exit_flag != 0` just when the loop can be exited by `` `expand_exit_something' ``. A corresponding `` `expand_continue_loop' `` will jump back to this place.
- `void expand_continue_loop(struct nesting *whichloop)`: jumps, according to whether the beginning of the loop was created with `` `expand_start_loop' `` or with `` `expand_start_loop_continue_elsewhere' ``, to the beginning or respectively to the place established by `` `expand_loop_continue_here' ``.
- `void expand_end_loop()`: marks the end of a loop, is it certainly *not* implicit that a jump back to the start of the loop will take place; that is done by `` `expand_continue_loop' ``.
- `struct nesting (expand_start_loop_continue_elsewhere(int exit_flag))`, like `` `expand_start_loop' ``, but the continuation point of the loop must be explicitly set with `` `expand_loop_continue_here' ``.
- `void expand_loop_continue_here()`: sets the continuation point for the current loop.
- `void expand_exit_loop(struct nesting *whichloop)`: Creates RTL code for an unconditional exit from the loop `` `whichloop' ``, corresponding to `` `break' `` in C.
- `int expand_exit_loop_if_false(struct nesting *whichloop, tree cond)`: Creates RTL for a conditional departure from the loop `` `whichloop' ``. If the runtime value of the expression `` `cond' `` is false, then exit the loop, otherwise continue with the next statement.

#### <a href="cobol_toc.html#TOC147" id="SEC147">14.5.8.3 Multibranch Statements</a>

<span id="IDX87"></span> <span id="IDX88"></span> <span id="IDX89"></span>

- `void expand_start_case(int exit_flag, tree expr, tree type, char *printname)`: creates RTL for beginning of a multibranch statement; `` `expr' `` is the branch condition, `` `type' `` the nominal<a href="cobol_foot.html#FOOT29" id="DOCF29">(29)</a> type; `exit_flag != 0` is again true, if this multibranch statement can be exited using `` `expand_exit_something' ``. It is recommended, to set `` `exit_flag' `` in order to allow exit from the statement in a manner similar to a C `` `break' ``. `` `printname' `` is an identifier which gives the name of the high level construct, thus for example `` `switch' `` in C; this is needed for certain error messages.
- `` `int pushcase(tree value, tree (*converter)(tree t, tree v), tree label, tree *duplicate)' ``: is called at the beginning of a branch.
  - `` `value' `` is the constant value, which `` `expr' `` (see above in `` `expand_start_case' ``) must taken for the following branch to be followed or `` `NULL_TREE' ``, if it should be followed, in case none of the conditions in the current multibranch statement are met<a href="cobol_foot.html#FOOT30" id="DOCF30">(30)</a>.
  - `` `converter' `` is a pointer to a function often `` `convert' ``, which returns an expression in `tree` form, with the same value as `` `v' `` but with type `` `t' ``.
  - `` `label' `` is a jump label declaration created with `` `build_decl(LABEL_DECL, NULL_TREE, NULL_TREE)' ``
  - `` `duplicate' `` is a `tree` pointer, which is set in the case of an overlap, to the overlapping `tree`.

  The return values:
  - `` `0' ``: no error
  - `` `1' ``: there is no enclosing multibranch statement
  - `` `2' ``: overlap with another branch condition
  - `` `3' ``: value outside the allowed range; can happen for example if `` `type' `` in `` `expand_start_case' `` is only a `` `char' `` but the value is an `` `int' `` (in C).
  - `` `4' ``: can only get via `` `pushcase_range' `` in case the declared range is empty.
  - `` `5' ``: in the case of a jump into a new scope region, which requires incompatible cleanup actions.
- `void pushcase_range(tree value1, tree value2, tree (*converter)(tree, tree), tree label, tree *duplicate)`: just like `` `pushcase' ``, but for all cases between `` `value1' `` and `` `value2' `` inclusive instead of only one value `` `value' ``.
- `` `void expand_end_case(tree expr)' ``: creates RTL for the end of a multibranch statement;`` `expr' `` is the same expression passed to `` `expand_start_case' ``.

#### <a href="cobol_toc.html#TOC148" id="SEC148">14.5.8.4 Jump Statements</a>

<span id="IDX90"></span> <span id="IDX91"></span> <span id="IDX92"></span> <span id="IDX93"></span>

- `` `void declare_nonlocal_label(tree label)' ``: creates RTL for the declaration of a jump point `` `label' ``
- `` `void expand_label(tree label)' ``: places the jump point for the jump label declaraion `` `label' `` here
- `` `void expand_goto(tree label)' ``: creates an unconditional jump to the jump point declared through `` `label' ``

#### <a href="cobol_toc.html#TOC149" id="SEC149">14.5.8.5 Other Jump Statements</a>

<span id="IDX94"></span>

`` `void int exit_something' ``: creates RTL for exiting from the innermost enclosing structure, for which `` `exitflag = 1' `` was set. Returns `` `1' `` if no such statement exists.

### <a href="cobol_toc.html#TOC150" id="SEC150">14.5.9 Other Statements</a>

<span id="IDX95"></span>

- [Calls and Assignments](cobol_14.html#SEC151)
- [Return from Routines](cobol_14.html#SEC152)

#### <a href="cobol_toc.html#TOC151" id="SEC151">14.5.9.1 Calls and Assignments</a>

<span id="IDX96"></span>

- `` `void expand_expr_stmt(tree node)' ``: converts the expression represented by the `` `node' `` into RTL code, mainly used for assignments and routine-calls. This procedure is also useful if one wants to convert the functional constructs presented in section [14.5.7.8 Control Structures for Functional Programs](cobol_14.html#SEC142) to RTL.
- `` `tree build(CALL_EXPR, function, arguments, NULL_TREE)' ``: creates a routine-call of the routine `` `function' `` (must be a `` `FUNCTION_DECL' ``) with the actual parameters `` `arguments' ``<a href="cobol_foot.html#FOOT31" id="DOCF31">(31)</a>; the parameters must be linked in the forward direction - which means you should add them to the list in reverse order..
- `` `tree build(MODIFY_EXPR, destination, source)' ``: creates an assignment, `` `destination' `` und `` `source' `` are `tree` expressions.

#### <a href="cobol_toc.html#TOC152" id="SEC152">14.5.9.2 Return from Routines</a>

<span id="IDX97"></span>

- `` `void expand_return(tree value)' ``, in `` `stmt.c' ``: leave the current function and return `` `value' ``.
- `` `void expand_null_return()' ``, in `` `stmt.c' ``: for return from a procedure.

## <a href="cobol_toc.html#TOC153" id="SEC153">14.6 Tree Summary and Overview</a>

This chapter is the result of an extended engagement with the source code of GNAT, GPC and above all GCC<a href="cobol_foot.html#FOOT32" id="DOCF32">(32)</a>.

An overview of the architecture and plan of the GNU compiler has been produced and presented, for how one's own front end can be connected to the GNU back end. The high level language constructs supported by the back end were described in detail, what to do in order to use these, including the data structures and functions which belong to each of these constructs, all presented in context.

Finally an example is presented (see section [14.9 Tree Examples](cobol_14.html#SEC156)) to demonstrate and hopefully simplify the use of the GNU back end.

An originally envisaged goal of this report, to make available for use an equally high level language independent and machine independent intermediate language, has not been fully realised. But that was not the main goal strived for. The main goal was to gather sufficient information, in order to be able to write this report, which gathers together the explicit and implicit information from the source code.

A really new programming language often distinguishes itself by its support of constructs which other languages do not posses. And to translate these into RTL may often be very difficult, because therefore detailed knowledge of RTL and the functions and data structures present in the GCC back end which are necessary for the direct creation of RTL code for the new constructs is needed, knowledge which is not needed for the simple use of the currently existing constructs.

One can also say, that the GNU back end suffices to translate 'conventional' languages. In order perhaps to realise a "Warren Abstract Machine" as is needed for the compilation of Prolog, the method of exclusive calls to the `` `build*' `` or `` `expand*' `` functions is probably not a good choice, even if on account of the undoubted `` `Turing' `` power available it must be possble to do so.

On the other hand the back end is sufficiently comprehensive for C, C++, Objective C, Pascal and Ada 95. Even functional languages can be relatively easily translated into the `tree` as shown in section [14.5.7.8 Control Structures for Functional Programs](cobol_14.html#SEC142). And additionally especially for modern languages, their innovations are less in 'higher constructs' but rather in encapsulation mechanisms like hiding and modularity. The associated problems are rather a matter for the semantic analysis than a matter for the code generator. One can therefore expect, that the back end in its present form will suffice for many, though not all conceivable languages.

The question certainly remains open, whether it would not be simpler, to output another less abstract high level language, like C, as the output from the compiler. True, that is also not trivial - for one thing simply on account of the possibility of semantic mismatch between the two languages - also open is the compilation strategy for certain source constructs<a href="cobol_foot.html#FOOT33" id="DOCF33">(33)</a>, but this saves inbuilding the compiler into such a complex product as GCC and creates in spite of this comparatively high quality code. The immediate use of the code generator certainly has the advantage of offering better debugging possibilities due to the intimate knowledge of the data structures this makes possible..

One may wish that the code generator used fewer global variables: this would not only increase the comprehensibility of the code, it would also sooner allow the creation of a 'shared library'. Such a library would contribute to savings of processing resources: the program data for a GNU compiler in large part, for "C" over four fifths, arises from the code generator which is really the same for all languages; thus much disk space could be saved. However RMS is against the creation of a shared library in any case because this makes the use of parts of GCC in non-free programs more feasible.

The code generator also suffers from a limitation that it assumes the existence of a resgiter based machine. This has made it difficult to support so-called 'Java Chips' and certain functions such as the packed decimal support available in many mainframe computers.

Not all details could be comprehensively reported, simply on account of the extent of GCC. Whether the documentation gathered together in this report suffices to make the development of one's own compiler using GCC for code generation decisively easier, so that no intensive familiarisation is needed, the future will show. At least this report should suffice as the basis for one's own further investigation.

A few more tips:

- `` `grep' `` has been very useful to find useful and important places<a href="cobol_foot.html#FOOT34" id="DOCF34">(34)</a>.
- It appears that only the files `` `tree.c' ``, `` `tree.def' ``, `` `tree.h' ``, `` `stmt.c' ``, `` `function.c' ``, `` `stor-layout.c' ``, `` `convert.c' ``,`` `fold-const.c' ``, `` `toplev.c' `` und `` `gcc.c' `` have relevant routines and data structures and the others need not come into consideration.
- In case it is unclear, what a certain function does or what information is stored in a certain data item, because the associated commentary is somewhat sparse, it often helps to seek out all places where the function or variable is used.
- For most functions, there are several lines of commentary, which informally explain the function and parameters expected.
- Functions, which are declared `` `static' `` can not be called from the front end and are not therefore of further interest.
- The source code of the C or Pascal front end always offers the possibility to learn in meticulous detail how the code generator is controlled and to use and adapt this method of processing. This would be confusing, because code creation and semantic anlysis are there not clearly separated. This is most clearly shown in the syntax anlysis routine`` `c-parse.in' ``.
- Many data items have at the top a short indication of what they contain. That can help to focus the search.
- The option `` `-dr' `` can be used in order to put the created RTL code into a file before the any optimisation.
- If you are having trouble generating code for a given construct it can be helpful to trace with GDB the C compiler when compiling a similar construct. You can even trace you own program and the C compiler in parallel and see where your program is getting it wrong.
- From GDB you can call functions like debug_tree and debug_rtl to easily print tree structures etc. For example `` `p debug_tree(decl)' ``.

The author and translator would be pleased to receive questions and comments at <jnadler@gmx.net> and <tej@melbpc.org.au>..

We intend to offer this document to the FSF for inclusion in the GCC book, subject to having the appropriate documents signed by our school and employer respectively.

## <a href="cobol_toc.html#TOC154" id="SEC154">14.7 GCC Internals Information</a>

<span id="IDX98"></span> <span id="IDX99"></span>

This section lists known sources of information about GCC internals and interfacing.

1.  "GNAT": <http://www.gnat.com/papers/gnat94.ps> and possibly other documents in the same directory.
2.  "GCC": "Using and Porting GNU CC", included in each distribution package of GCC.
3.  "Kenner95a": Slides from the Presentation to the conference "Principles of Programming Languages (POPL95)", obtained by email from the author, Richard Kenner(<kenner@vlsi1.ultra.nyu.edu>).
4.  "Kenner95b": "toy", example for Kenner95a, also obtained by email from the author, Richard Kenner(<kenner@vlsi1.ultra.nyu.edu>). Updated version for GCC 2.92 available from <http://members.wri.com/johnnyb/compilers/toy295.tar.gz>
5.  "GCC Changes": File `` `LANGUAGES' ``, contained in the GCC source directory, contains documentation of some changes made to the front end interface.
6.  "Fortran Front End Reference": <http://egcs.cygnus.com/onlinedocs/g77_26.html>
7.  "Tree": <http://gcc.gnu.org/onlinedocs/ir_toc.html>. G++ tree representation internals.
8.  "G++ Internals": <http://gcc.gnu.org/onlinedocs/gxxint_toc.html>
9.  "GNU Pascal Source Reference": <http://didaktik.physik.uni-essen.de:80/~gnu-pascal/gpc_7.html>
10. "Insel Design": <http://wwwspies.informatik.tu-muenchen.de/personen/pizka/>
11. "Porting GCC for Dummies" <ftp://ftp.axis.se/pub/users/hp/pgccfd/>

The list below lists miscellaneous references.

1.  "Titania" J@"urgen Buchner, Titania Sprachbeschreibung,<http://www.pu.informatik.tu-darmstadt.de/~buchner/Titania/Titania.html>; Material relating to the "Warren Abstract Machine" (???)

## <a href="cobol_toc.html#TOC155" id="SEC155">14.8 Tree Changes</a>

<span id="IDX100"></span>

This section briefly records known changes made to GCC since this chapter was originally written.

1.  Memory management is moving from obstacks to a garbage collection based approach. See modules `` `ggc*' `` for details.
2.  The interface to HANDLE_PRAGMA has changed. It now takes three arguments. The first two are pointers to functions that should be used to read characters from the input stream, and to push them back into the input stream respectively. The third argument is a pointer to a null terminate string which is the first word after \#pragma. The expression supplied by HANDLE_PRAGMA should return non-zero if it parsed and implemented the pragma. Otherwise it should return zero, and leave the input stream as it was before the expression was evaluated.
3.  A new back-end definable macro has been added: INSERT_ATTRIBUTES. This macro allows backend to add attributes to decls as they are created.
4.  The interface to lang_decode_option has changed. It now uses an argc/argv interface to allow for options that use more than one input string. The new declaration is: int lang_decode_option (int argc, char\*\* argv). It now returns the number of input strings processed, or 0 if the option is unknown.
5.  Front-ends must now define lang_init_options. It is safe for this function to do nothing. See c-lang.c.
6.  Front ends which link with c-common or other files from the C/C++ front-ends may need to handle TI types. Look for references to \[unsigned\]int_DI_type_node in your front end. If you have references to these variables, you'll need up update the front end. To update the front end you must mirror all the code which currently deals with int_DI_type_node to also handle int_TI_type_node.
7.  The interface between toplev.c and the language front ends for opening the source file has changed:
    - init_lex() has been renamed to init_parse (char \*filename) where filename is the name of the source file.
    - The code in toplev.c which opened the source file should be moved to the new init_parse function.
    - toplev.c now calls finish_parse() instead of closing the source file using fclose(). This should now be done in finish_parse, if necessary.
8.  Front-ends must now define lang_print_xnode. It is safe for this function to do nothing. See c-lang.c.
9.  GCC used to store structure sizes & offsets to elements as bitsize quantities. This causes problems because a structure can only be (target memsize / 8) bytes long (this may effect arrays too). This is particularly problematical on machines with small address spaces. So: All trees that represent sizes in bits should have a TREE_TYPE of bitsizetype (rather than sizetype). Accordingly, when such values are computed / initialized, care has to be takes to use / compute the proper type. When a size in bits is converted into a size in bytes, which is expressed in trees, care should be taken to change the tree's type again to sizetype. We've updated C, C++, Fortran & Objective-C to work with the new scheme. Other languages will need to be updated accordingly. Contact <amylaar@cygnus.com> for additional information.
10. In an effort to decrease cache thrashing and useless loads we've changed the third argument to the DEFTREECODE macro to be a single char. This will affect languages that defined their own tree codes (usually in a .def file). Old way: DEFTREECODE (CLASS_METHOD_DECL, "class_method_decl", "d", 0) New way: DEFTREECODE (CLASS_METHOD_DECL, "class_method_decl", 'd', 0) Note the double quotes are now single.

## <a href="cobol_toc.html#TOC156" id="SEC156">14.9 Tree Examples</a>

<span id="IDX101"></span>

- [Tree Examples Intro](cobol_14.html#SEC157): Overview of the examples
- [Tree Example Code - exa](cobol_14.html#SEC158)
- [Tree Example Code - toy](cobol_14.html#SEC159)

### <a href="cobol_toc.html#TOC157" id="SEC157">14.9.1 Introduction to the Tree Examples</a>

<span id="IDX102"></span>

This section contains firstly two small examples, which illustrate in practical terms the calling sequences and exchange of data required for interfacing to the code generation back end.

They were created "by hand", and implement two well known simple algorithms. The first example recursively calculates the nth Fibonacci number and particularly illustrates function calls and branching. The second example iteratively calculates the factorial of the input parameter and thereby particularly illustrates looping.

Both show throughout the correct use of common constructs such as function declarations and variables.

The structure of both examples is as follows:

1.  First we create and initialize the `tree`-nodes for the implementation functions.
2.  Then we call a series of Backend-Functions in order to start the translation ("let's go!").
3.  Finally follows the implementation of the body of the functions.
4.  At the end a series of back end functions are again called, to mark the end of the body of the functions, to optimize the now complete RTL code and to transform it into assembler code.

The source is commented (in English): the first example somewhat more comprehensively than the second, as many details are practically the same in both. These examples have been successfully tested.

A further example 'toy' is also included.

All these examples are available for download including all the files, Makefiles, test cases etc from <http://www.geocities.com/timjosling>.

### <a href="cobol_toc.html#TOC158" id="SEC158">14.9.2 Tree Example Code - exa</a>

<span id="IDX103"></span>

    /* exa.c by Joachim Nadler */ 

    /* declare required prototypes: */
    #include "config.h"
    #include "system.h"
    #include "gansidecl.h"
    #include "tree.h"
    #include "flags.h"
    #include "output.h"
    #include <stdio.h>
    #include "c-lex.h"
    #include "c-tree.h"
    #include "rtl.h"
    #include "tm_p.h"
    #include "ggc.h"
    #include "toplev.h"

    /* const char * version_string = "1.0.1tj sample application"; */

    tree global_trees[TI_MAX];

    tree current_function_decl;

    const char * const language_string="exa Demo Language";

    int flag_traditional;       /* Used by dwarfout.c.  */

    /* A list (chain of TREE_LIST nodes) of all LABEL_DECLs in the function
       that have names.  Here so we can clear out their names' definitions
       at the end of the function.  */

    static tree named_labels;

    #define NULL_BINDING_LEVEL (struct binding_level *) NULL
      
    /* A chain of binding_level structures awaiting reuse.  */

    static struct binding_level *free_binding_level;

    /* The elements of `ridpointers' are identifier nodes
       for the reserved type names and storage classes.
       It is indexed by a RID_... value.  */
    tree ridpointers[(int) RID_MAX];

    int flag_short_double=0;
    int flag_short_wchar=0;
    int flag_no_builtin=0;
    int flag_no_nonansi_builtin=0;
    /* static tree shadowed_labels=NULL; */

    tree c_global_trees[CTI_MAX];

    /* Local variables */
    static FILE* yyin;

    tree listify(tree chain);

    /*
      As an example, we create code "manually" for the following 
      two functions, in order to illustrate how to use the 
      GCC backend in own compiler projects.

      int fib(int n)
      {
        int Result;

        if (n < 2) Result = n;
        else Result = fib(n - 1) + fib(n - 2);
        return Result;
      }

      int fak(int n)
      {
        int Result=1; 

        while(n >= 0)
        {
          Result = Result * n;
          n = n - 1;
        }    
        return Result;
      }

     */

    int 
    yyparse()
    {
      /* 'tree' nodes used for both functions */
      tree arg_type_list, resultdecl, parmdecl, functype;
      tree void_type_list;
      tree funcid, parmid, block;

      {
        /****************************
        **
        ** 1. recursive fibonacci
        **
        ****************************/

        /* local variables for intermediate 'tree' nodes */
        tree fibdecl, fibdeclptr;
        tree cond, assign, two, sum, call1, args1, call2, args2;
        tree diff1, diff2;

        /* build & initialize declaration node for 'fib' */
        /* type for "fib" is: int -> int */
        /* the void is to mark the function as having a fixed number of parameters */
        void_type_list = listify(void_type_node);
        arg_type_list = listify(integer_type_node);
        arg_type_list =  chainon(arg_type_list, void_type_list);
        functype = build_function_type(integer_type_node, arg_type_list);

        /* build tree node for the function declaration 'fib' :*/
        funcid = get_identifier("fib");  
        fibdecl = build_decl(FUNCTION_DECL, funcid, functype);
        TREE_TYPE(fibdecl) = functype;
        pushdecl(fibdecl);

        /* all following tree and RTL should be allocated in 'temporary' memory: */
        temporary_allocation();

        /* build 'tree' for the Result variable */
        resultdecl = build_decl(RESULT_DECL, NULL_TREE, integer_type_node);
        TREE_TYPE(resultdecl) = integer_type_node;
        /* let it know its scope is the function 'fib' */
        DECL_CONTEXT(resultdecl) = fibdecl;
        /* and insert it as "Result" variable into 'fib' */
        DECL_RESULT(fibdecl) = resultdecl;
        /* determine its size (well, probably four bytes) */
        layout_decl(resultdecl, 0);

        /* build 'tree' for the formal parameter 'n' : */
        parmid = get_identifier("n");
        parmdecl = build_decl(PARM_DECL, parmid, integer_type_node);
        /* let 'n' know its scope */
        DECL_CONTEXT(parmdecl) = fibdecl;
        /* actual parameters should be passed as integers: */
        DECL_ARG_TYPE(parmdecl) = integer_type_node;
        /* let 'fib' know its formal parameter 'n' : */
        DECL_ARGUMENTS(fibdecl) = parmdecl;
        /* determine its size (it's an integer, so probably also four bytes) */
        layout_decl(parmdecl, 0);
        /* this is not only a function declaration, but also a definition */
        TREE_STATIC(fibdecl) = 1;
        /* it must have a real address in momory, so it can't be mere inline */
        TREE_ADDRESSABLE(fibdecl) = 1;
        /* we want this function to be visible to the linker */
        TREE_PUBLIC(fibdecl) = 1;

      /* let's go! */
        /* before we create any RTL, let GCC know the current scope is 'fib' : */
        current_function_decl = fibdecl;

        /* make GCC emit "fib" on the console at compile time 
          (unless this feature was switched of by command line option "-quiet" */
        announce_function(fibdecl);
        /* create RTL for function declaration */
        rest_of_decl_compilation(fibdecl, NULL, 1, 0);
        /* create RTL for function definition */
        make_function_rtl(fibdecl);
        /* prepare creation of RTL for a new function */
        init_function_start(fibdecl, NULL, 0);
        /* create RTL for startup code of function, such as saving registers */
        expand_function_start(fibdecl, 0);

        /* function.c requires a push at the start of the function */
        pushlevel (0);
        /* create RTL for the start of a new scope */
        expand_start_bindings(2);

        /* insert 'n' into the debugger symbol table: */
        pushdecl(parmdecl);

        /* add a new level to the debugger symbol table */
        pushlevel(0);
        /* create RTL for the start of a new scope */
        expand_start_bindings(0);

      /* implement function body */
        /* integer constant 2: */
        two = build_int_2(2, 0); 
        /* n < 2: */
        cond = build(LT_EXPR, integer_type_node, parmdecl, two);
        /* flag 'n' as used */
        /* TREE_USED(parmdecl) = 1;*/
        /* if n < 2 */
        expand_start_cond(cond, 0);

          /* build tree of Result := n : */
          assign = build(MODIFY_EXPR, void_type_node, resultdecl, parmdecl);
          /* flag 'Result' as used */
          TREE_USED(resultdecl) = 1;
          /* an assign has side effects (obviously) */
          TREE_SIDE_EFFECTS(assign) = 1;
          /* convert tree for assignment "Result := n" to RTL */
          expand_expr_stmt(assign);
        /* emit RTL for "else" :*/
        expand_start_else();

          /* grab address of function 'fib' to prepare recursive function call */
          fibdeclptr = build1(ADDR_EXPR, build_pointer_type(functype), fibdecl);

          /* build tree for "fib(n - 1)" :*/
          diff1 = build(MINUS_EXPR, integer_type_node, 
                          parmdecl, integer_one_node);
          args1 = listify(diff1);
          /* notice how 'fibdeclptr' is used here to determine which function
             to call : */
          call1 = build(CALL_EXPR, integer_type_node, 
                          fibdeclptr, args1, NULL_TREE);
          TREE_USED(fibdecl) = 1;

          /* build tree for "fib(n - 2)": */
          diff2 = build(MINUS_EXPR, integer_type_node, parmdecl, two);
          args2 = listify(diff2);
          call2 = build(CALL_EXPR, integer_type_node, 
                           fibdeclptr, args2, NULL_TREE);

          /* build tree for "fib(n - 1) + fib(n - 2)": */
          sum = build(PLUS_EXPR, integer_type_node, call1, call2);

          /* build tree for "Result := fib(n - 1) + fib(n - 2)" : */
          assign = build(MODIFY_EXPR, void_type_node, resultdecl, sum);
          TREE_SIDE_EFFECTS(assign) = 1;
          TREE_USED(assign) = 1;
          /* convert tree for "Result := fib(n - 1) + fib(n - 2)" to RTL :*/
          expand_expr_stmt(assign);
        /* emit RTL for endif */
        expand_end_cond();

        /* emit RTL for return from this function,
           this is very important, because mere assignments to the
           'Result' variable with be optimized away by data flow analysis */
        expand_return(resultdecl);

        /* pop inner level */
        block=poplevel(1,1,0);
        /* emit RTL for end of scope */
        expand_end_bindings(block, 1, 1);

      /* cleanup tail */
        /* get completely built level from debugger symbol table */
        block = poplevel(1,0,1);
        /* and attach it to 'fib' */
        DECL_INITIAL(fibdecl) = block;
        /* emit RTL for end of scope */
        expand_end_bindings(block, 0, 1);
        /* emit RTL for end of function */
        expand_function_end(NULL, 0, 0);
        /* call optimization and convert optimized RTL to assembly code */
        rest_of_compilation(fibdecl);
        /* resume allocation in 'permanent' memory */
        end_temporary_allocation();
        /* we are not inside of any scope now */
        current_function_decl = NULL_TREE;
      }

      /***********************/

      {
        /****************************
        **
        ** 2. iterative factorial
        **
        ****************************/

        tree fakdecl;

        tree locdecl;
        struct nesting *loop;
        tree assign;

      /* build & initialize declaration */
        void_type_list = listify(void_type_node);
        arg_type_list = listify(integer_type_node);
        arg_type_list =  chainon(arg_type_list, void_type_list);
        functype = build_function_type(integer_type_node, arg_type_list);
        funcid = get_identifier("fak");  
        fakdecl = build_decl(FUNCTION_DECL, funcid, functype);
        pushdecl(fakdecl);
        TREE_TYPE(fakdecl) = functype;
        temporary_allocation();
        resultdecl = build_decl(RESULT_DECL, NULL_TREE, integer_type_node);
        TREE_TYPE(resultdecl) = integer_type_node;
        DECL_CONTEXT(resultdecl) = fakdecl;
        DECL_RESULT(fakdecl) = resultdecl;
        layout_decl(resultdecl, 0);
        parmid = get_identifier("n");
        parmdecl = build_decl(PARM_DECL, parmid, integer_type_node);
        DECL_CONTEXT(parmdecl) = fakdecl;
        DECL_ARG_TYPE(parmdecl) = integer_type_node;
        DECL_ARGUMENTS(fakdecl) = parmdecl;
        layout_decl(parmdecl, 0);
        TREE_STATIC(fakdecl) = 1;
        TREE_ADDRESSABLE(fakdecl) = 1;
        TREE_PUBLIC(fakdecl) = 1;

      /* let's go! */
        current_function_decl = fakdecl;
        announce_function(fakdecl);
        rest_of_decl_compilation(fakdecl, NULL, 1, 0);
        make_function_rtl(fakdecl);
        init_function_start(fakdecl, NULL, 0);
        expand_function_start(fakdecl, 0);
        pushlevel(0);
        expand_start_bindings(2);
        pushdecl(parmdecl);
        pushlevel (0);
        expand_start_bindings(0);

      /* implement function body */
        /* build tree for "Result := 1" and convert it to RTL : */
        assign = build(MODIFY_EXPR, void_type_node, resultdecl, integer_one_node);
        TREE_SIDE_EFFECTS(assign) = 1;
        TREE_USED(resultdecl) = 1;
        expand_expr_stmt(assign);

        /* build local variable declaration for 'i' : */  
        locdecl = build_decl(VAR_DECL, get_identifier("i"), integer_type_node);
        /* set its scope */
        DECL_CONTEXT(locdecl) = fakdecl;
        /* set its initial value */
        DECL_INITIAL(locdecl) = integer_one_node;
        /* insert it to debugging symbol table */
        pushdecl(locdecl);
        /* convert it to RTL */
        expand_decl(locdecl);
        /* and also emit initialization assignment (i := 1) */
        expand_decl_init(locdecl);

        /* emit RTL for head of "while"-loop */
        loop = expand_start_loop(0);

        /* emit RTL for test of exit condition "i < n" : */
        expand_exit_loop_if_false(loop, build(LE_EXPR, integer_type_node, 
                                                locdecl, parmdecl));

          /* build tree for "Result := Result * i" and convert it to RTL: */
          assign = build(MODIFY_EXPR, void_type_node, 
                           resultdecl,
                           build(MULT_EXPR, integer_type_node, 
                                   resultdecl,
                                   locdecl
                                )
                        );
          TREE_SIDE_EFFECTS(assign) = 1; 
          expand_expr_stmt(assign);

          /* build tree for "i := i + 1" and convert it to RTL: */
          assign = build(MODIFY_EXPR, void_type_node, 
                           locdecl, 
                           build(PLUS_EXPR, integer_type_node, 
                                   locdecl,
                                   integer_one_node
                                )
                        );
          TREE_SIDE_EFFECTS(assign) = 1; 
          expand_expr_stmt(assign);

        /* emit RTL for end of "while" loop */
        expand_end_loop();

        /* emit RTL for return statement, see commentary above */
        expand_return(resultdecl);

        block=poplevel(1,1,0);
        expand_end_bindings(block, 1, 1);

      /* cleanup tail */
        block = poplevel(1,0,1);
        DECL_INITIAL(fakdecl) = block;
        expand_end_bindings(block, 0, 1);
        expand_function_end(NULL, 0, 0);
        rest_of_compilation(fakdecl);
        end_temporary_allocation();
        current_function_decl = NULL_TREE;
      }
      return 0;
    }

    /* ----- */

    
    /* Routines Expected by gcc:  */

    /* These are used to build types for various sizes.  The code below
       is a simplified version of that of GNAT.  */

    #ifndef MAX_BITS_PER_WORD
    #define MAX_BITS_PER_WORD  BITS_PER_WORD
    #endif

    /* This variable keeps a table for types for each precision so that we only 
       allocate each of them once. Signed and unsigned types are kept separate.  */
    static tree signed_and_unsigned_types[MAX_BITS_PER_WORD + 1][2];

    /* Return an integer type with the number of bits of precision given by  
       PRECISION.  UNSIGNEDP is nonzero if the type is unsigned; otherwise
       it is a signed type.  */

    tree
    type_for_size (precision, unsignedp)
         unsigned precision;
         int unsignedp;
    {
      tree t;
      int moment;

      if (precision <= MAX_BITS_PER_WORD
          && signed_and_unsigned_types[precision][unsignedp] != 0)
        return signed_and_unsigned_types[precision][unsignedp];

      /* Since we will keep these types around, they must be permanent.  */
      moment = suspend_momentary ();
      push_obstacks_nochange ();
      end_temporary_allocation ();

     if (unsignedp)
        t = signed_and_unsigned_types[precision][1]
          = make_unsigned_type (precision);
      else
        t = signed_and_unsigned_types[precision][0]
          = make_signed_type (precision);

      pop_obstacks ();
      resume_momentary (moment);

      return t;
    }

    /* not sure what these do - added by Jon */
    char *
    init_parse (filename)
         char *filename;
    {
         yyin = fopen(filename, "r");
         return filename;
    }

    void 
    finish_parse(void)
    {
         return;
    }

    void 
    lang_init_options(void)
    {
         return;
    }

    void 
    lang_print_xnode(file, t, i)
         FILE *file ATTRIBUTE_UNUSED;
         tree t ATTRIBUTE_UNUSED;
         int i ATTRIBUTE_UNUSED;
    {
         return;
    }

    /* Return a data type that has machine mode MODE.  UNSIGNEDP selects
       an unsigned type; otherwise a signed type is returned.  */

    tree
    type_for_mode (mode, unsignedp)
         enum machine_mode mode;
         int unsignedp;
    {
      return type_for_size (GET_MODE_BITSIZE (mode), unsignedp);
    }

    /* Return the unsigned version of a TYPE_NODE, a scalar type.  */

    tree
    unsigned_type (type_node)
         tree type_node;
    {
      return type_for_size (TYPE_PRECISION (type_node), 1);
    }

    /* Return the signed version of a TYPE_NODE, a scalar type.  */

    tree
    signed_type (type_node)
         tree type_node;
    {
      return type_for_size (TYPE_PRECISION (type_node), 0);
    }

    /* Return a type the same as TYPE except unsigned or signed according to
       UNSIGNEDP.  */

    tree
    signed_or_unsigned_type (unsignedp, type)
         int unsignedp;
         tree type;
    {
      if (! INTEGRAL_TYPE_P (type) || TREE_UNSIGNED (type) == unsignedp)
        return type;
      else
        return type_for_size (TYPE_PRECISION (type), unsignedp);
    }
    
    /* These functions and variables deal with binding contours.  We only
       need these functions for the list of PARM_DECLs, but we leave the
       functions more general; these are a simplified version of the
       functions from GNAT.  */

    /* For each binding contour we allocate a binding_level structure which records
       the entities defined or declared in that contour. Contours include:

        the global one
        one for each subprogram definition
        one for each compound statement (declare block)

       Binding contours are used to create GCC tree BLOCK nodes.  */

    struct binding_level
    {
      /* A chain of ..._DECL nodes for all variables, constants, functions,
         parameters and type declarations.  These ..._DECL nodes are chained
         through the TREE_CHAIN field. Note that these ..._DECL nodes are stored
         in the reverse of the order supplied to be compatible with the
         back-end.  */
      tree names;
      /* For each level (except the global one), a chain of BLOCK nodes for all
         the levels that were entered and exited one level down from this one.  */
      tree blocks;
      /* The back end may need, for its own internal processing, to create a BLOCK
         node. This field is set aside for this purpose. If this field is non-null
         when the level is popped, i.e. when poplevel is invoked, we will use such
         block instead of creating a new one from the 'names' field, that is the
         ..._DECL nodes accumulated so far.  Typically the routine 'pushlevel'
         will be called before setting this field, so that if the front-end had
         inserted ..._DECL nodes in the current block they will not be lost.   */
      tree block_created_by_back_end;
      /* The binding level containing this one (the enclosing binding level). */
      struct binding_level *level_chain;
    };

    /* The binding level currently in effect.  */
    static struct binding_level *current_binding_level = NULL;

    /* The outermost binding level. This binding level is created when the
       compiler is started and it will exist through the entire compilation.  */
    static struct binding_level *global_binding_level;

    /* Binding level structures are initialized by copying this one.  */
    static struct binding_level clear_binding_level = {NULL, NULL, NULL, NULL};
    
    /* Return non-zero if we are currently in the global binding level.  */

    int
    global_bindings_p ()
    {
      return current_binding_level == global_binding_level ? -1 : 0;
    }

    /* Return the list of declarations in the current level. Note that this list
       is in reverse order (it has to be so for back-end compatibility).  */

    tree
    getdecls ()
    {
      return current_binding_level->names;
    }

    /* Enter a new binding level. The input parameter is ignored, but has to be
       specified for back-end compatibility.  */

    void
    pushlevel (ignore)
         int ignore ATTRIBUTE_UNUSED;
    {
      struct binding_level *newlevel
        = (struct binding_level *) xmalloc (sizeof (struct binding_level));

      *newlevel = clear_binding_level;

      /* Add this level to the front of the chain (stack) of levels that are
         active.  */
      newlevel->level_chain = current_binding_level;
      current_binding_level = newlevel;
    }

    /* Exit a binding level.
       Pop the level off, and restore the state of the identifier-decl mappings
       that were in effect when this level was entered.

       If KEEP is nonzero, this level had explicit declarations, so
       and create a "block" (a BLOCK node) for the level
       to record its declarations and subblocks for symbol table output.

       If FUNCTIONBODY is nonzero, this level is the body of a function,
       so create a block as if KEEP were set and also clear out all
       label names.

       If REVERSE is nonzero, reverse the order of decls before putting
       them into the BLOCK.  */

    tree
    poplevel (keep, reverse, functionbody)
         int keep;
         int reverse;
         int functionbody;
    {
      /* Points to a BLOCK tree node. This is the BLOCK node construted for the
         binding level that we are about to exit and which is returned by this
         routine.  */
      tree block_node = NULL_TREE;
      tree decl_chain;
      tree subblock_chain = current_binding_level->blocks;
      tree subblock_node;
      tree block_created_by_back_end;

      /* Reverse the list of XXXX_DECL nodes if desired.  Note that the ..._DECL
         nodes chained through the `names' field of current_binding_level are in
         reverse order except for PARM_DECL node, which are explicitely stored in
         the right order.  */
      decl_chain = (reverse) ? nreverse (current_binding_level->names)
                             : current_binding_level->names;

      block_created_by_back_end = current_binding_level->block_created_by_back_end;
      if (block_created_by_back_end != 0)
        {
          block_node = block_created_by_back_end;

          /* Check if we are about to discard some information that was gathered
         by the front-end. Nameley check if the back-end created a new block 
         without calling pushlevel first. To understand why things are lost
         just look at the next case (i.e. no block created by back-end.  */
          if ((keep || functionbody) && (decl_chain || subblock_chain))
        abort ();
        }

      /* If there were any declarations in the current binding level, or if this
         binding level is a function body, or if there are any nested blocks then
         create a BLOCK node to record them for the life of this function.  */
      else if (keep || functionbody)
        block_node = build_block (keep ? decl_chain : 0, 0, subblock_chain, 0, 0);

      /* Record the BLOCK node just built as the subblock its enclosing scope.  */
      for (subblock_node = subblock_chain; subblock_node;
           subblock_node = TREE_CHAIN (subblock_node))
        BLOCK_SUPERCONTEXT (subblock_node) = block_node;

      /* Clear out the meanings of the local variables of this level.  */

      for (subblock_node = decl_chain; subblock_node;
           subblock_node = TREE_CHAIN (subblock_node))
        if (DECL_NAME (subblock_node) != 0)
          /* If the identifier was used or addressed via a local extern decl,  
         don't forget that fact.   */
          if (DECL_EXTERNAL (subblock_node))
        {
          if (TREE_USED (subblock_node))
            TREE_USED (DECL_NAME (subblock_node)) = 1;
          if (TREE_ADDRESSABLE (subblock_node))
            TREE_ADDRESSABLE (DECL_ASSEMBLER_NAME (subblock_node)) = 1;
        }

      /* Pop the current level.  */
      current_binding_level = current_binding_level->level_chain;

      if (functionbody)
        {
          /* This is the top level block of a function. The ..._DECL chain stored
         in BLOCK_VARS are the function's parameters (PARM_DECL nodes). Don't
         leave them in the BLOCK because they are found in the FUNCTION_DECL
         instead.  */
          DECL_INITIAL (current_function_decl) = block_node;
          BLOCK_VARS (block_node) = 0;
        }
      else if (block_node)
        {
          if (block_created_by_back_end == NULL)
        current_binding_level->blocks
          = chainon (current_binding_level->blocks, block_node);
        }

      /* If we did not make a block for the level just exited, any blocks made for
         inner levels (since they cannot be recorded as subblocks in that level)
         must be carried forward so they will later become subblocks of something
         else.  */
      else if (subblock_chain)
        current_binding_level->blocks
          = chainon (current_binding_level->blocks, subblock_chain);
      if (block_node)
        TREE_USED (block_node) = 1;

      return block_node;
    }
    
    /* Insert BLOCK at the end of the list of subblocks of the
       current binding level.  This is used when a BIND_EXPR is expanded,
       to handle the BLOCK node inside the BIND_EXPR.  */

    void
    insert_block (block)
         tree block;
    {
      TREE_USED (block) = 1;
      current_binding_level->blocks
        = chainon (current_binding_level->blocks, block);
    }

    /* Set the BLOCK node for the innermost scope
       (the one we are currently in).  */

    void
    set_block (block)
         tree block;
    {
      current_binding_level->block_created_by_back_end = block;
    }

    /* Records a ..._DECL node DECL as belonging to the current lexical scope.
       Returns the ..._DECL node. */

    tree
    pushdecl (decl)
         tree decl;
    {
      /* External objects aren't nested, other objects may be.  */
      if (DECL_EXTERNAL (decl))
        DECL_CONTEXT (decl) = 0;
      else
        DECL_CONTEXT (decl) = current_function_decl;

      /* Put the declaration on the list.  The list of declarations is in reverse
         order. The list will be reversed later if necessary.  This needs to be
         this way for compatibility with the back-end.  */

      TREE_CHAIN (decl) = current_binding_level->names;
      current_binding_level->names = decl;

      /* For the declartion of a type, set its name if it is not already set. */

      if (TREE_CODE (decl) == TYPE_DECL
          && TYPE_NAME (TREE_TYPE (decl)) == 0)
        TYPE_NAME (TREE_TYPE (decl)) = DECL_NAME (decl);

      return decl;
    }
    
    #ifndef CHAR_TYPE_SIZE
    #define CHAR_TYPE_SIZE BITS_PER_UNIT
    #endif

    #ifndef INT_TYPE_SIZE
    #define INT_TYPE_SIZE BITS_PER_WORD
    #endif

    #undef SIZE_TYPE
    #define SIZE_TYPE "long unsigned int"

    /* Create the predefined scalar types of C,
       and some nodes representing standard constants (0, 1, (void *) 0).
       Initialize the global binding level.
       Make definitions for built-in primitive functions.  */

    void
    init_decl_processing ()
    {
      tree array_domain_type;

      set_identifier_size (sizeof (struct tree_identifier));

      current_function_decl = NULL;
      named_labels = NULL;
      current_binding_level = NULL_BINDING_LEVEL;
      free_binding_level = NULL_BINDING_LEVEL;
      pushlevel (0);    /* make the binding_level structure for global names */
      global_binding_level = current_binding_level;

      build_common_tree_nodes (flag_signed_char);

      /* Define `int' and `char' first so that dbx will output them first.  */
      pushdecl (build_decl (TYPE_DECL, ridpointers[(int) RID_INT],
                integer_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("char"),
                char_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("long int"),
                long_integer_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("unsigned int"),
                unsigned_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("long unsigned int"),
                long_unsigned_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("long long int"),
                long_long_integer_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("long long unsigned int"),
                long_long_unsigned_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("short int"),
                short_integer_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("short unsigned int"),
                short_unsigned_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("signed char"),
                signed_char_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("unsigned char"),
                unsigned_char_type_node));
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, intQI_type_node));
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, intHI_type_node));
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, intSI_type_node));
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, intDI_type_node));
    #if HOST_BITS_PER_WIDE_INT >= 64
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, intTI_type_node));
    #endif
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, unsigned_intQI_type_node));
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, unsigned_intHI_type_node));
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, unsigned_intSI_type_node));
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, unsigned_intDI_type_node));
    #if HOST_BITS_PER_WIDE_INT >= 64
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, unsigned_intTI_type_node));
    #endif

      /* Create the widest literal types. */
      widest_integer_literal_type_node 
        = make_signed_type (HOST_BITS_PER_WIDE_INT * 2);
      widest_unsigned_literal_type_node
        = make_unsigned_type (HOST_BITS_PER_WIDE_INT * 2);
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, 
                widest_integer_literal_type_node));
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, 
                widest_unsigned_literal_type_node));

      build_common_tree_nodes_2 (flag_short_double);

      pushdecl (build_decl (TYPE_DECL, ridpointers[(int) RID_FLOAT],
                float_type_node));
      pushdecl (build_decl (TYPE_DECL, ridpointers[(int) RID_DOUBLE],
                double_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("long double"),
                long_double_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("complex int"),
                complex_integer_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("complex float"),
                complex_float_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("complex double"),
                complex_double_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("complex long double"),
                complex_long_double_type_node));
      pushdecl (build_decl (TYPE_DECL,
                ridpointers[(int) RID_VOID], void_type_node));

    #ifdef MD_INIT_BUILTINS
      MD_INIT_BUILTINS;
    #endif

      wchar_type_node = get_identifier (flag_short_wchar
                        ? "short unsigned int"
                        : WCHAR_TYPE);

      boolean_type_node = integer_type_node;
      boolean_true_node = integer_one_node;
      boolean_false_node = integer_zero_node;

      string_type_node = build_pointer_type (char_type_node);
      const_string_type_node
        = build_pointer_type (build_type_variant (char_type_node, 1, 0));

      /* Make a type to be the domain of a few array types
         whose domains don't really matter.
         200 is small enough that it always fits in size_t
         and large enough that it can hold most function names for the
         initializations of __FUNCTION__ and __PRETTY_FUNCTION__.  */
      array_domain_type = build_index_type (build_int_2 (200, 0));

      pedantic_lvalues = pedantic;

      start_identifier_warnings ();

    }

    
    /* Decode all the language specific options that cannot be decoded by GCC. The
       option decoding phase of GCC calls this routine on the flags that it cannot
       decode.  Return 1 if successful, otherwise return 0. */

    int
    lang_decode_option (a, p)
         int a ATTRIBUTE_UNUSED;
         char **p ATTRIBUTE_UNUSED;
    { return 0; }

    /* Perform all the initialization steps that are language-specific.  */

    void
    lang_init ()
    {}

    /* Perform all the finalization steps that are language-specific.  */

    void
    lang_finish ()
    {}

    /* Return a short string identifying this language to the debugger.  */

    const char *
    lang_identify ()
    { return "exa"; }

    /* If DECL has a cleanup, build and return that cleanup here.
       This is a callback called by expand_expr.  */

    tree
    maybe_build_cleanup (decl)
         tree decl ATTRIBUTE_UNUSED;
    { return NULL_TREE; }

    /* Print an error message for invalid use of an incomplete type.  */

    void
    incomplete_type_error (dont_care_1, dont_care_2)
         tree dont_care_1 ATTRIBUTE_UNUSED;
         tree dont_care_2 ATTRIBUTE_UNUSED;
    { abort (); }

    tree
    truthvalue_conversion (expr)
         tree expr;
    { return expr;}

    int
    mark_addressable (expr)
         tree expr ATTRIBUTE_UNUSED;
    {return 0;}

    /* Print any language-specific compilation statistics.  */

    void
    print_lang_statistics ()
    {}

    /* Since we don't use the DECL_LANG_SPECIFIC field, this is a no-op.  */

    void
    copy_lang_decl (node)
         tree node ATTRIBUTE_UNUSED;
    {}

    /* Hooks for print-tree.c:  */

    void
    print_lang_decl (file, node, indent)
         FILE *file ATTRIBUTE_UNUSED;
         tree node ATTRIBUTE_UNUSED;
         int indent ATTRIBUTE_UNUSED;
    {}

    void
    print_lang_type (file, node, indent)
         FILE *file ATTRIBUTE_UNUSED;
         tree node ATTRIBUTE_UNUSED;
         int indent ATTRIBUTE_UNUSED;
    {}

    void
    print_lang_identifier (file, node, indent)
         FILE *file ATTRIBUTE_UNUSED;
         tree node ATTRIBUTE_UNUSED;
         int indent ATTRIBUTE_UNUSED;
    {}

    /* Performs whatever initialization steps are needed by the language-dependent
       lexical analyzer.  */

    void
    init_lex ()
    {}

    /* Sets some debug flags for the parser. It does nothing here.  */

    void
    set_yydebug (value)
         int value ATTRIBUTE_UNUSED;
    {}

    /* Routine to print parse error message.  */

    void
    yyerror (str)
         const char *str;
    {
      fprintf (stderr, "%s\n", str);
    }

    /* Empty GC callbacks to be used by languages that don't support GC.
       Copyright (C) 1999 Free Software Foundation, Inc.

       This file is part of GNU CC.

       GNU CC is free software; you can redistribute it and/or modify
       it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2, or (at your option)
       any later version.

       GNU CC is distributed in the hope that it will be useful,
       but WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
       GNU General Public License for more details.

       You should have received a copy of the GNU General Public License
       along with GNU CC; see the file COPYING.  If not, write to
       the Free Software Foundation, 59 Temple Place - Suite 330,
       Boston, MA 02111-1307, USA.  */

    int ggc_p = 0;

    void ATTRIBUTE_NORETURN
    lang_mark_tree (t)
         union tree_node *t ATTRIBUTE_UNUSED;
    {
      /* need garbage collection if this is called */
      abort ();
    }

    void ATTRIBUTE_NORETURN
    lang_mark_false_label_stack (l)
         struct label_node *l ATTRIBUTE_UNUSED;
    {
      /* If this function is called, we are doing GC.  But, this file is
         only included in compilers for languages that don't support GC.  */
      abort ();
    }

### <a href="cobol_toc.html#TOC159" id="SEC159">14.9.3 Tree Example Code - toy</a>

<span id="IDX104"></span>

    /* toy.c */

    #include "config.h"
    #include "system.h"
    #include "gansidecl.h"
    #include "tree.h"
    #include "flags.h"
    #include "output.h"
    #include <stdio.h>

    #include "c-lex.h"
    #include "c-tree.h"
    #include "rtl.h"
    #include "tm_p.h"
    #include "ggc.h"
    #include "toplev.h"

    #include "toy.h"

    /* Global variables for our own functions */
    extern FILE *yyin;

    /* Global Variables for the various types and nodes we create.  */ 

    tree global_trees[TI_MAX];

    tree current_function_decl;

    /* Global Variables Expected by gcc: */

    /* const char * version_string = "1.0.1tj toy application"; */
    const char * const language_string="toy Demo Language";

    int flag_traditional;       /* Used by dwarfout.c.  */

    /* A list (chain of TREE_LIST nodes) of all LABEL_DECLs in the function
       that have names.  Here so we can clear out their names' definitions
       at the end of the function.  */

    static tree named_labels;

    #define NULL_BINDING_LEVEL (struct binding_level *) NULL
      
    /* A chain of binding_level structures awaiting reuse.  */

    static struct binding_level *free_binding_level;

    /* The elements of `ridpointers' are identifier nodes
       for the reserved type names and storage classes.
       It is indexed by a RID_... value.  */
    tree ridpointers[(int) RID_MAX];

    int flag_short_double=0;
    int flag_short_wchar=0;
    int flag_no_builtin=0;
    int flag_no_nonansi_builtin=0;
    /* static tree shadowed_labels=NULL; */

    tree c_global_trees[CTI_MAX];

    int ggc_p = 0; /* no garbage collection */

    /* Here are the three functions needed to compile out language and the
       variables they use.  */

    /* Number of arguments to the current function and the decls for the args.  */
    static int num_args;
    static tree *arg_decls;

    /* Make a FUNCTION_DECL for a function whose single-character name is
       NAME, that has NARGS integer operands, and returns integer.  */

    tree
    build_function_decl (name, nargs)
         char *name;
         int nargs;
    {
      tree param_list = NULL_TREE;
      tree param_type_list = tree_cons (NULL_TREE, void_type_node, NULL_TREE);
      tree parm_decl;
      tree fntype;
      tree fndecl;
      char *p;
      int i;
      static tree functype=NULL;
      static tree arglist=NULL;
      
      if (!functype) 
        {
          arglist = listify(integer_type_node);
          functype = build_function_type(integer_type_node, arglist); 
          /*    cfun = (struct function *) xcalloc (1, sizeof (struct function)); */
        }

      /* Allocate space for our PARM_DECLS and create them.  */

      num_args = nargs;
      arg_decls = (tree *) xmalloc (nargs * sizeof (tree));
      for (i = nargs - 1; i >= 0; i--)
        {
          p = (char *)xmalloc (2);
          p[0] = 'a' + i;
          p[1] = '\0';
          parm_decl = build_decl (PARM_DECL, get_identifier (p),
                      integer_type_node);
          DECL_ARG_TYPE (parm_decl) = integer_type_node;
          arg_decls[i] = parm_decl;
          param_list = chainon (parm_decl, param_list);
          param_type_list = tree_cons (NULL_TREE, integer_type_node,
                       param_type_list);
        }

      /* The function type depends on the return type and type of args.  */
      fntype = build_function_type (integer_type_node, param_type_list);

      /* Now make the function decl.  */
      p = name;

      fndecl = build_decl (FUNCTION_DECL, get_identifier (p), fntype);
      DECL_EXTERNAL (fndecl) = 0;
      TREE_PUBLIC (fndecl) = 1;
      TREE_STATIC (fndecl) = 1;
      DECL_ARGUMENTS (fndecl) = param_list;
      DECL_RESULT (fndecl)
        = build_decl (RESULT_DECL, NULL_TREE, integer_type_node);
      DECL_CONTEXT (DECL_RESULT (fndecl)) = fndecl;

      rest_of_decl_compilation (fndecl, NULL_PTR, 1, 0);
      return fndecl;
    }

    /* Get the PARM_DECL for the Nth operand.  */

    tree
    get_arg_decl (n)
         int n;
    {
      if (n >= num_args)
        {
          fprintf (stderr, "arg number too high\n");
          n = 0;
        }

      return arg_decls[n];
    }

    /* Generate code for FNDECL that returns EXP.  */

    void
    build_function (fndecl, exp)
         tree fndecl;
         tree exp;
    {
      tree param_decl, next_param;
      tree block;
      tree first_param;

      /* Set line number information; everything is line 1 for us.  */
      DECL_SOURCE_FILE (fndecl) = input_filename;
      DECL_SOURCE_LINE (fndecl) = 1;

      /* Announce we are compiling this function.  */
      announce_function (fndecl);

      /* put it in the list of decls for current scope */
      pushdecl(fndecl);

      /* Set up to compile the function and enter it.  */
      current_function_decl = fndecl;
      DECL_INITIAL (fndecl) = error_mark_node;

      temporary_allocation ();
      make_function_rtl (fndecl);

      init_function_start (fndecl, input_filename, 1);
      expand_function_start (fndecl, 0);

      pushlevel (0);
      expand_start_bindings(2);

      /* Push all the PARM_DECL nodes onto the current scope (i.e. the scope of the
         subprogram body) so that they can be recognized as local variables in the
         subprogram.   */

      for (first_param = param_decl = nreverse (DECL_ARGUMENTS (fndecl));
           param_decl;
           param_decl = next_param)
        {
          next_param = TREE_CHAIN (param_decl);
          TREE_CHAIN (param_decl) = NULL;
          pushdecl (param_decl);
        }

      /* Store back the PARM_DECL nodes. They appear in the right order. */
      DECL_ARGUMENTS (fndecl) = first_param; /*getdecls ();*/

      pushlevel (0);
      expand_start_bindings (0);

      /* The only thing in this function is a single return statement, which
         we now generate.  Note that EXP will have been allocated in
         permanent_obstack.  To do this properly, we need to enter the function 
         ontext before parsing the expression, but then error recovery is more
         complex, so we don't do that here.  */

      expand_return (build (MODIFY_EXPR, void_type_node,
                DECL_RESULT (fndecl), exp));

      block=poplevel (1, 1, 0);
      expand_end_bindings (block, 1, 1);

      /* Now get back out of the function and compile it.  */
      block=poplevel (1, 0, 1);
      expand_end_bindings (block, 0, 1);
      expand_function_end (input_filename, 1, 0);
      rest_of_compilation (fndecl);
      current_function_decl = 0;
      permanent_allocation (1);
    }
    
    /* Routines Expected by gcc:  */

    /* These are used to build types for various sizes.  The code below
       is a simplified version of that of GNAT.  */

    #ifndef MAX_BITS_PER_WORD
    #define MAX_BITS_PER_WORD  BITS_PER_WORD
    #endif

    /* This variable keeps a table for types for each precision so that we only 
       allocate each of them once. Signed and unsigned types are kept separate.  */
    static tree signed_and_unsigned_types[MAX_BITS_PER_WORD + 1][2];

    /* Return an integer type with the number of bits of precision given by  
       PRECISION.  UNSIGNEDP is nonzero if the type is unsigned; otherwise
       it is a signed type.  */

    tree
    type_for_size (precision, unsignedp)
         unsigned precision;
         int unsignedp;
    {
      tree t;
      int moment;

      if (precision <= MAX_BITS_PER_WORD
          && signed_and_unsigned_types[precision][unsignedp] != 0)
        return signed_and_unsigned_types[precision][unsignedp];

      /* Since we will keep these types around, they must be permanent.  */
      moment = suspend_momentary ();
      push_obstacks_nochange ();
      end_temporary_allocation ();

     if (unsignedp)
        t = signed_and_unsigned_types[precision][1]
          = make_unsigned_type (precision);
      else
        t = signed_and_unsigned_types[precision][0]
          = make_signed_type (precision);

      pop_obstacks ();
      resume_momentary (moment);

      return t;
    }

    /* not sure what these do - added by Jon */
    char *
    init_parse (filename)
         char *filename;
    {
         yyin = fopen(filename, "r");
         return filename;
    }

    void 
    finish_parse(void)
    {
         return;
    }

    void 
    lang_init_options(void)
    {
         return;
    }

    void 
    lang_print_xnode(file, t, i)
         FILE *file ATTRIBUTE_UNUSED;
         tree t ATTRIBUTE_UNUSED;
         int i ATTRIBUTE_UNUSED;
    {
         return;
    }

    /* Return a data type that has machine mode MODE.  UNSIGNEDP selects
       an unsigned type; otherwise a signed type is returned.  */

    tree
    type_for_mode (mode, unsignedp)
         enum machine_mode mode;
         int unsignedp;
    {
      return type_for_size (GET_MODE_BITSIZE (mode), unsignedp);
    }

    /* Return the unsigned version of a TYPE_NODE, a scalar type.  */

    tree
    unsigned_type (type_node)
         tree type_node;
    {
      return type_for_size (TYPE_PRECISION (type_node), 1);
    }

    /* Return the signed version of a TYPE_NODE, a scalar type.  */

    tree
    signed_type (type_node)
         tree type_node;
    {
      return type_for_size (TYPE_PRECISION (type_node), 0);
    }

    /* Return a type the same as TYPE except unsigned or signed according to
       UNSIGNEDP.  */

    tree
    signed_or_unsigned_type (unsignedp, type)
         int unsignedp;
         tree type;
    {
      if (! INTEGRAL_TYPE_P (type) || TREE_UNSIGNED (type) == unsignedp)
        return type;
      else
        return type_for_size (TYPE_PRECISION (type), unsignedp);
    }
    
    /* These functions and variables deal with binding contours.  We only
       need these functions for the list of PARM_DECLs, but we leave the
       functions more general; these are a simplified version of the
       functions from GNAT.  */

    /* For each binding contour we allocate a binding_level structure which records
       the entities defined or declared in that contour. Contours include:

        the global one
        one for each subprogram definition
        one for each compound statement (declare block)

       Binding contours are used to create GCC tree BLOCK nodes.  */

    struct binding_level
    {
      /* A chain of ..._DECL nodes for all variables, constants, functions,
         parameters and type declarations.  These ..._DECL nodes are chained
         through the TREE_CHAIN field. Note that these ..._DECL nodes are stored
         in the reverse of the order supplied to be compatible with the
         back-end.  */
      tree names;
      /* For each level (except the global one), a chain of BLOCK nodes for all
         the levels that were entered and exited one level down from this one.  */
      tree blocks;
      /* The back end may need, for its own internal processing, to create a BLOCK
         node. This field is set aside for this purpose. If this field is non-null
         when the level is popped, i.e. when poplevel is invoked, we will use such
         block instead of creating a new one from the 'names' field, that is the
         ..._DECL nodes accumulated so far.  Typically the routine 'pushlevel'
         will be called before setting this field, so that if the front-end had
         inserted ..._DECL nodes in the current block they will not be lost.   */
      tree block_created_by_back_end;
      /* The binding level containing this one (the enclosing binding level). */
      struct binding_level *level_chain;
    };

    /* The binding level currently in effect.  */
    static struct binding_level *current_binding_level = NULL;

    /* The outermost binding level. This binding level is created when the
       compiler is started and it will exist through the entire compilation.  */
    static struct binding_level *global_binding_level;

    /* Binding level structures are initialized by copying this one.  */
    static struct binding_level clear_binding_level = {NULL, NULL, NULL, NULL};
    
    /* Return non-zero if we are currently in the global binding level.  */

    int
    global_bindings_p ()
    {
      return current_binding_level == global_binding_level ? -1 : 0;
    }

    /* Return the list of declarations in the current level. Note that this list
       is in reverse order (it has to be so for back-end compatibility).  */

    tree
    getdecls ()
    {
      return current_binding_level->names;
    }

    /* Nonzero if the current level needs to have a BLOCK made.  */

    int
    kept_level_p ()
    {
      return (current_binding_level->names != 0);
    }

    /* Enter a new binding level. The input parameter is ignored, but has to be
       specified for back-end compatibility.  */

    void
    pushlevel (ignore)
         int ignore ATTRIBUTE_UNUSED;
    {
      struct binding_level *newlevel
        = (struct binding_level *) xmalloc (sizeof (struct binding_level));

      *newlevel = clear_binding_level;

      /* Add this level to the front of the chain (stack) of levels that are
         active.  */
      newlevel->level_chain = current_binding_level;
      current_binding_level = newlevel;
    }

    /* Exit a binding level.
       Pop the level off, and restore the state of the identifier-decl mappings
       that were in effect when this level was entered.

       If KEEP is nonzero, this level had explicit declarations, so
       and create a "block" (a BLOCK node) for the level
       to record its declarations and subblocks for symbol table output.

       If FUNCTIONBODY is nonzero, this level is the body of a function,
       so create a block as if KEEP were set and also clear out all
       label names.

       If REVERSE is nonzero, reverse the order of decls before putting
       them into the BLOCK.  */

    tree
    poplevel (keep, reverse, functionbody)
         int keep;
         int reverse;
         int functionbody;
    {
      /* Points to a BLOCK tree node. This is the BLOCK node construted for the
         binding level that we are about to exit and which is returned by this
         routine.  */
      tree block_node = NULL_TREE;
      tree decl_chain;
      tree subblock_chain = current_binding_level->blocks;
      tree subblock_node;
      tree block_created_by_back_end;

      /* Reverse the list of XXXX_DECL nodes if desired.  Note that the ..._DECL
         nodes chained through the `names' field of current_binding_level are in
         reverse order except for PARM_DECL node, which are explicitely stored in
         the right order.  */
      decl_chain = (reverse) ? nreverse (current_binding_level->names)
                             : current_binding_level->names;

      block_created_by_back_end = current_binding_level->block_created_by_back_end;
      if (block_created_by_back_end != 0)
        {
          block_node = block_created_by_back_end;

          /* Check if we are about to discard some information that was gathered
         by the front-end. Nameley check if the back-end created a new block 
         without calling pushlevel first. To understand why things are lost
         just look at the next case (i.e. no block created by back-end.  */
          if ((keep || functionbody) && (decl_chain || subblock_chain))
        abort ();
        }

      /* If there were any declarations in the current binding level, or if this
         binding level is a function body, or if there are any nested blocks then
         create a BLOCK node to record them for the life of this function.  */
      else if (keep || functionbody)
        block_node = build_block (keep ? decl_chain : 0, 0, subblock_chain, 0, 0);

      /* Record the BLOCK node just built as the subblock its enclosing scope.  */
      for (subblock_node = subblock_chain; subblock_node;
           subblock_node = TREE_CHAIN (subblock_node))
        BLOCK_SUPERCONTEXT (subblock_node) = block_node;

      /* Clear out the meanings of the local variables of this level.  */

      for (subblock_node = decl_chain; subblock_node;
           subblock_node = TREE_CHAIN (subblock_node))
        if (DECL_NAME (subblock_node) != 0)
          /* If the identifier was used or addressed via a local extern decl,  
         don't forget that fact.   */
          if (DECL_EXTERNAL (subblock_node))
        {
          if (TREE_USED (subblock_node))
            TREE_USED (DECL_NAME (subblock_node)) = 1;
          if (TREE_ADDRESSABLE (subblock_node))
            TREE_ADDRESSABLE (DECL_ASSEMBLER_NAME (subblock_node)) = 1;
        }

      /* Pop the current level.  */
      current_binding_level = current_binding_level->level_chain;

      if (functionbody)
        {
          /* This is the top level block of a function. The ..._DECL chain stored
         in BLOCK_VARS are the function's parameters (PARM_DECL nodes). Don't
         leave them in the BLOCK because they are found in the FUNCTION_DECL
         instead.  */
          DECL_INITIAL (current_function_decl) = block_node;
          BLOCK_VARS (block_node) = 0;
        }
      else if (block_node)
        {
          if (block_created_by_back_end == NULL)
        current_binding_level->blocks
          = chainon (current_binding_level->blocks, block_node);
        }

      /* If we did not make a block for the level just exited, any blocks made for
         inner levels (since they cannot be recorded as subblocks in that level)
         must be carried forward so they will later become subblocks of something
         else.  */
      else if (subblock_chain)
        current_binding_level->blocks
          = chainon (current_binding_level->blocks, subblock_chain);
      if (block_node)
        TREE_USED (block_node) = 1;

      return block_node;
    }
    
    /* Insert BLOCK at the end of the list of subblocks of the
       current binding level.  This is used when a BIND_EXPR is expanded,
       to handle the BLOCK node inside the BIND_EXPR.  */

    void
    insert_block (block)
         tree block;
    {
      TREE_USED (block) = 1;
      current_binding_level->blocks
        = chainon (current_binding_level->blocks, block);
    }

    /* Set the BLOCK node for the innermost scope
       (the one we are currently in).  */

    void
    set_block (block)
         tree block;
    {
      current_binding_level->block_created_by_back_end = block;
    }

    /* Records a ..._DECL node DECL as belonging to the current lexical scope.
       Returns the ..._DECL node. */

    tree
    pushdecl (decl)
         tree decl;
    {
      /* External objects aren't nested, other objects may be.  */
      if (DECL_EXTERNAL (decl))
        DECL_CONTEXT (decl) = 0;
      else
        DECL_CONTEXT (decl) = current_function_decl;

      /* Put the declaration on the list.  The list of declarations is in reverse
         order. The list will be reversed later if necessary.  This needs to be
         this way for compatibility with the back-end.  */

      TREE_CHAIN (decl) = current_binding_level->names;
      current_binding_level->names = decl;

      /* For the declartion of a type, set its name if it is not already set. */

      if (TREE_CODE (decl) == TYPE_DECL
          && TYPE_NAME (TREE_TYPE (decl)) == 0)
        TYPE_NAME (TREE_TYPE (decl)) = DECL_NAME (decl);

      return decl;
    }
    
    #ifndef CHAR_TYPE_SIZE
    #define CHAR_TYPE_SIZE BITS_PER_UNIT
    #endif

    #ifndef INT_TYPE_SIZE
    #define INT_TYPE_SIZE BITS_PER_WORD
    #endif

    #undef SIZE_TYPE
    #define SIZE_TYPE "long unsigned int"

    /* Create the predefined scalar types of C,
       and some nodes representing standard constants (0, 1, (void *) 0).
       Initialize the global binding level.
       Make definitions for built-in primitive functions.  */

    void
    init_decl_processing ()
    {
      tree array_domain_type;

      set_identifier_size (sizeof (struct tree_identifier));

      current_function_decl = NULL;
      named_labels = NULL;
      current_binding_level = NULL_BINDING_LEVEL;
      free_binding_level = NULL_BINDING_LEVEL;
      pushlevel (0);    /* make the binding_level structure for global names */
      global_binding_level = current_binding_level;

      build_common_tree_nodes (flag_signed_char);

      /* Define `int' and `char' first so that dbx will output them first.  */
      pushdecl (build_decl (TYPE_DECL, ridpointers[(int) RID_INT],
                integer_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("char"),
                char_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("long int"),
                long_integer_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("unsigned int"),
                unsigned_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("long unsigned int"),
                long_unsigned_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("long long int"),
                long_long_integer_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("long long unsigned int"),
                long_long_unsigned_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("short int"),
                short_integer_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("short unsigned int"),
                short_unsigned_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("signed char"),
                signed_char_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("unsigned char"),
                unsigned_char_type_node));
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, intQI_type_node));
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, intHI_type_node));
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, intSI_type_node));
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, intDI_type_node));
    #if HOST_BITS_PER_WIDE_INT >= 64
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, intTI_type_node));
    #endif
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, unsigned_intQI_type_node));
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, unsigned_intHI_type_node));
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, unsigned_intSI_type_node));
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, unsigned_intDI_type_node));
    #if HOST_BITS_PER_WIDE_INT >= 64
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, unsigned_intTI_type_node));
    #endif

      /* Create the widest literal types. */
      widest_integer_literal_type_node 
        = make_signed_type (HOST_BITS_PER_WIDE_INT * 2);
      widest_unsigned_literal_type_node
        = make_unsigned_type (HOST_BITS_PER_WIDE_INT * 2);
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, 
                widest_integer_literal_type_node));
      pushdecl (build_decl (TYPE_DECL, NULL_TREE, 
                widest_unsigned_literal_type_node));

      build_common_tree_nodes_2 (flag_short_double);

      pushdecl (build_decl (TYPE_DECL, ridpointers[(int) RID_FLOAT],
                float_type_node));
      pushdecl (build_decl (TYPE_DECL, ridpointers[(int) RID_DOUBLE],
                double_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("long double"),
                long_double_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("complex int"),
                complex_integer_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("complex float"),
                complex_float_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("complex double"),
                complex_double_type_node));
      pushdecl (build_decl (TYPE_DECL, get_identifier ("complex long double"),
                complex_long_double_type_node));
      pushdecl (build_decl (TYPE_DECL,
                ridpointers[(int) RID_VOID], void_type_node));

    #ifdef MD_INIT_BUILTINS
      MD_INIT_BUILTINS;
    #endif

      wchar_type_node = get_identifier (flag_short_wchar
                        ? "short unsigned int"
                        : WCHAR_TYPE);

      boolean_type_node = integer_type_node;
      boolean_true_node = integer_one_node;
      boolean_false_node = integer_zero_node;

      string_type_node = build_pointer_type (char_type_node);
      const_string_type_node
        = build_pointer_type (build_type_variant (char_type_node, 1, 0));

      /* Make a type to be the domain of a few array types
         whose domains don't really matter.
         200 is small enough that it always fits in size_t
         and large enough that it can hold most function names for the
         initializations of __FUNCTION__ and __PRETTY_FUNCTION__.  */
      array_domain_type = build_index_type (build_int_2 (200, 0));

      pedantic_lvalues = pedantic;

      start_identifier_warnings ();

    }
    
    /* Decode all the language specific options that cannot be decoded by GCC. The
       option decoding phase of GCC calls this routine on the flags that it cannot
       decode.  Return 1 if successful, otherwise return 0. */

    int
    lang_decode_option (a, p)
         int a ATTRIBUTE_UNUSED;
         char **p ATTRIBUTE_UNUSED;
    { return 0; }

    /* Perform all the initialization steps that are language-specific.  */

    void
    lang_init ()
    {}

    /* Perform all the finalization steps that are language-specific.  */

    void
    lang_finish ()
    {}

    /* Return a short string identifying this language to the debugger.  */

    const char *
    lang_identify ()
    { return "toy"; }

    /* If DECL has a cleanup, build and return that cleanup here.
       This is a callback called by expand_expr.  */

    tree
    maybe_build_cleanup (decl)
         tree decl ATTRIBUTE_UNUSED;
    { return NULL_TREE; }

    /* Print an error message for invalid use of an incomplete type.  */

    void
    incomplete_type_error (dont_care_1, dont_care_2)
         tree dont_care_1 ATTRIBUTE_UNUSED;
         tree dont_care_2 ATTRIBUTE_UNUSED;
    { abort (); }

    tree
    truthvalue_conversion (expr)
         tree expr;
    { return expr;}

    int
    mark_addressable (expr)
         tree expr ATTRIBUTE_UNUSED;
    {return 0;}

    /* Print any language-specific compilation statistics.  */

    void
    print_lang_statistics ()
    {}

    /* Since we don't use the DECL_LANG_SPECIFIC field, this is a no-op.  */

    void
    copy_lang_decl (node)
         tree node ATTRIBUTE_UNUSED;
    {}

    /* Hooks for print-tree.c:  */

    void
    print_lang_decl (file, node, indent)
         FILE *file ATTRIBUTE_UNUSED;
         tree node ATTRIBUTE_UNUSED;
         int indent ATTRIBUTE_UNUSED;
    {}

    void
    print_lang_type (file, node, indent)
         FILE *file ATTRIBUTE_UNUSED;
         tree node ATTRIBUTE_UNUSED;
         int indent ATTRIBUTE_UNUSED;
    {}

    void
    print_lang_identifier (file, node, indent)
         FILE *file ATTRIBUTE_UNUSED;
         tree node ATTRIBUTE_UNUSED;
         int indent ATTRIBUTE_UNUSED;
    {}

    /* Performs whatever initialization steps are needed by the language-dependent
       lexical analyzer.  */

    void
    init_lex ()
    {}

    /* Sets some debug flags for the parser. It does nothing here.  */

    void
    set_yydebug (value)
         int value ATTRIBUTE_UNUSED;
    {}

    /* Routine to print parse error message.  */

    void
    yyerror (str)
         const char *str;
    {
      fprintf (stderr, "%s\n", str);
    }

    void ATTRIBUTE_NORETURN
    lang_mark_tree (t)
         union tree_node *t ATTRIBUTE_UNUSED;
    {
      /* need garbage collection if this is called */
      abort ();
    }

    void ATTRIBUTE_NORETURN
    lang_mark_false_label_stack (l)
         struct label_node *l ATTRIBUTE_UNUSED;
    {
      /* If this function is called, we are doing GC.  But, this file is
         only included in compilers for languages that don't support GC.  */
      abort ();
    }

------------------------------------------------------------------------

Go to the [first](cobol_1.html), [previous](cobol_13.html), [next](cobol_15.html), [last](cobol_16.html) section, [table of contents](cobol_toc.html).
