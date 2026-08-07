---
title: "Suggestions for cryptosystem designers"
source_domain: amasci.com
source_path: ~weidai/scan-mirror/suggestions.html
order: 9955
reachable_from_entry: false
images: 3
internal_links: 0
extracted: 2026-08-07T17:18:18Z
extractor: site_to_paper.py (pandoc)
---

# Suggestions for cryptosystem designers

*Source page: `~weidai/scan-mirror/suggestions.html`*

<table style="width:60%;" width="80%">
<colgroup>
<col />
<col style="width: 60%" />
</colgroup>
<tbody>
<tr>
<td><img src="cryptix.gif" data-align="left" /></td>
<td><h1 id="suggestions-for-cryptosystem-designers" data-align="center">Suggestions for cryptosystem designers</h1></td>
</tr>
</tbody>
</table>

------------------------------------------------------------------------

Here are some general suggestions to designers of cryptographic algorithms, on how to promote interoperability and make life easier for implementors:

1.  If an algorithm is a research contribution rather than intended for serious use, or if a paper includes variants of an algorithm that are defined for exposition only, say so clearly. The remainder of these suggestions apply mainly to algorithms intended for serious use.
2.  If a paper defines more than one algorithm, give each of them a distinct name, and explain why an implementor might want to use one as opposed to another.
3.  For parameterised algorithms, specify precisely the set of allowable values for each parameter, and give recommended values. Don't include values that would be insecure in the allowable range.
4.  Use consistent capitalisation and punctuation for algorithm names, and define an unambiguous way to specify any parameters as part of the name. Consider submitting the algorithm to SCAN (Standard Cryptographic Algorithm Naming), and following the "`name(parameter,...)`" format used there.
5.  As far as possible, there should be sufficient information in the paper defining the algorithm, that independent implementations that are consistent with the paper will automatically interoperate. (For network protocols and other algorithms involving two or more parties, that might be unrealistic.)
6.  Specify any binary inputs, outputs, keys, etc. as sequences of octets (i.e. integers between 0 and 255 inclusive). Allowing arbitrary bit sequences rather than octet sequences is more hassle than it is worth, and very rarely used. Define octet-sequence representations for any abstract mathematical objects that would need to be stored, transmitted, etc. As far as possible, try to follow existing standards (e.g. IEEE Std 1363-2000) when doing this, but *don't* use ASN.1.
7.  For public key algorithms, specify the distribution of key pairs that should be used, and algorithms for validating keys. For protocols, include explicit checks that received values are in the sets assumed by the mathematical description.
8.  Number sequences and indexed variables starting with zero. If there is a completely arbitrary choice of byte order, use big-endian. Don't use inconsistent byte order in different parts of an algorithm (although this needn't prevent using auxiliary functions like hashes, etc. that internally use a different byte order to the algorithm being defined).
9.  Write octet sequences as two hex characters per octet (most followed by least significant nybble), and left-to-right as they would be stored in memory or transmitted. This may sound obvious, but the documentation and test vectors for at least three of the 1st round AES submissions (FROG, SAFER+ and Serpent) used the opposite (right-to-left) convention.
10. Provide a C reference implementation that is byte-order independent, uses only aligned memory accesses, does not depend on the sizes of built-in C types or the signedness of '`char`', does not assume that signed types are twos-complement, and does not use compiler-specific directives, or any other non-portable tricks. Test it with several compilers on different platforms. Ideally use `<inttypes.h>` for integer types, and provide a minimal version of this (which can just be a few lines in most cases) for compilers that don't have it. "Byte-order independent" means using code that accesses individual bytes/octets, *not* `BIG_ENDIAN` and `LITTLE_ENDIAN` conditional compilation and pointer casts. Use macros only where it clarifies rather than obfuscates the code.
11. Provide an optimised C/assembler implementation. This may use compiler-specific embedded assembler, conditional compilation of code that works better on some machines, etc., but it should still act as a plain C version when assembler for the target machine is not available.
12. In both reference and optimised C implementations, treat inputs, outputs, keys etc. as arrays of an unsigned 8-bit type (e.g. `uint8_t` from `<inttypes.h>`), to correspond with the mathematical definition in terms of octets. Put test code that checks an implementation against test vectors in a separate source file, that can be compiled with either the reference or the optimised implementation.
13. Optionally provide a Java reference implementation that interoperates with the C ones. For this treat inputs, outputs, keys etc. as byte arrays (with the obvious two's-complement mapping between the Java `byte` type and octet values). Look at other optimised Java crypto code to see how to fake unsigned types efficiently, and various other tricks. Put test code in a separate class from the algorithm.
14. Put up a WWW page from which all of the papers, code, test vectors, etc. relating to the algorithm are available. Post an announcement about this page to at least [sci.crypt](news:sci.crypt). Keep the page up to date, and reference any published cryptanalysis of the algorithm from it, including that by other researchers. If the page is mirrored then use some method that ensures that mirrors will be kept up to date.
15. Make available, at least as a text file and as C test code, test vectors for *all variants* of the algorithm, and for a selection of parameter choices (if it is a block cipher then this should cover all block sizes, and a selection of numbers of rounds or key sizes, for example). Include both values that are byte-order-invariant (e.g. 0x12343412 for 32-bit words), and values that are not, for each input to the algorithm.
16. For the most common parameter combinations, also include a fully worked out example with intermediate values at each stage of the computation (including dumps of such things as scheduled keys). Make sure that the test vectors are sufficient to test all parts of the algorithm (e.g. encryption and decryption, or signing and verifying). In the case of non-deterministic algorithms, e.g. a public key algorithm with a randomised padding method, give test vectors that use fixed values for the random input. For yes/no tests give both values that should pass, and values that should fail for various different reasons, if applicable.
17. Don't revise papers, implementations, test vectors, etc. without stating that they have been revised, and when. Make sure that all on-line versions are up-to-date, using Archie and WWW search engines to search for any copies you might not otherwise know about. Also include a brief summary of what has changed, and post this summary to sci.crypt.
18. If an algorithm is modified incompatibly, give the modified version a new name. Don't change the name for simple mistakes such as typographical errors that are found soon after publication (but see 17). If the spec and the reference implementation are found to be inconsistent, consider carefully which one needs to be changed, or whether it is better to define a new version, considering both disruption and security consequences.
19. Make papers available on-line in at least PDF and Postscript formats, and preferably also as the original source (e.g. LaTeX or whatever). Use an HTML page that has an abstract of the paper and links to the various formats, and recommend that links from other sites be made to this page rather than directly to the .pdf/.ps files. Some journals have restrictions on when a paper submitted to them can be made publically available; in that case put it on-line as soon as possible within those restrictions. Put a reference to the algorithm's web page in the journal version.
20. If the algorithm is ever broken (perhaps not completely, but enough that you no longer recommend its use), say so on the web page, and post an announcement of that to sci.crypt.

------------------------------------------------------------------------

<img src="cryptix.gif" data-align="right" />

<a href="http://validator.w3.org/check/referer" target="_blank"><img src="vh40.gif" data-border="0" width="88" height="31" alt="Valid HTML 4.0" /></a>

**Author**: David Hopwood \<<david.hopwood@zetnet.co.uk>\>\
**Current maintainer**: David Hopwood \<<david.hopwood@zetnet.co.uk>\>\
\
Copyright © 1995-2001 The Cryptix Foundation Limited\
and David Hopwood. All rights reserved.\
Cryptix is a trademark of The Cryptix Foundation Limited.
