---
title: "Standard Cryptographic Algorithm Naming"
source_domain: amasci.com
source_path: ~weidai/scan-mirror/intro.html
order: 9939
reachable_from_entry: false
images: 2
internal_links: 20
extracted: 2026-08-07T17:18:16Z
extractor: site_to_paper.py (pandoc)
---

# Standard Cryptographic Algorithm Naming

*Source page: `~weidai/scan-mirror/intro.html`*

Standard Cryptographic\
Algorithm Naming
=======================

Version 1.0.20a - 22 October, 2002

------------------------------------------------------------------------

<a href="index.html" target="_top">FRAMES</a> \| <a href="intro.html" target="_top">NO FRAMES</a>\
<a href="http://www.eskimo.com/~weidai/scan-mirror/" target="_top">U.S. MIRROR</a> \| <a href="http://www.users.zetnet.co.uk/hopwood/crypto/scan/" target="_top">U.K. MAIN SITE</a> \| [DOWNLOAD AS ZIP FILE](scan.zip)

This document gives references for a collection of cryptographic algorithms. Each algorithm is assigned a standard ASCII name, and zero or more aliases. The intention is for each algorithm to be specified in sufficient detail that independent implementations will be able to interoperate.

The list has been designed initially for use by the Java Cryptography Architecture, but should be useful in any situation where a convention is needed for referring to algorithms by a string. It can also serve as a source of references for definitions and cryptanalysis of various algorithms. The intention is to develop API mappings for languages other than Java in future (probably based on existing cryptography libraries).

## <span id="definitions">Definitions</span>

These documents use the terms "MUST", "SHOULD", and "MAY", and their negated forms, as defined in <a href="http://www.rfc-editor.org/rfc/rfc2119.txt" target="_blank">RFC 2119</a>. These terms apply to crypto algorithm and library implementations that are intended to conform to some subset of SCAN.

In addition, the terms "WILL" and "WILL NOT" specify consistency requirements and policies for SCAN itself. If it is stated that something WILL be true, but it is not actually true, please report it as an error. New SCAN entries or changes to existing entries must satisfy all WILL and WILL NOT constraints.

The term "byte" always refers to an 8-bit byte, or octet. The value of a byte is an integer between 0 and 255 inclusive.

In algorithm descriptions,

- "A \|\| B" denotes the concatenation of byte strings A and B,
- "A XOR B" denotes exclusive-OR of equal-length byte strings A and B,
- "floor(*x*)" is the largest integer less than or equal to *x*,
- "ceiling(*x*)" is the smallest integer greater than or equal to *x*,
- "I2OSP<sub>*n*</sub>(*i*)" is an *n*-byte big-endian representation of the integer *i*.

The accompanying <a href="conventions.html" target="_blank">SCAN Conventions</a> document includes other important information on the conventions used in compiling this list, which you should read before relying on it for any significant application. Also see these <a href="suggestions.html" target="_blank">suggestions for cryptosystem designers</a>.

## <span id="resources">General Resources</span>

The following are very useful resources for a wide range of algorithms:

- Lars Knudsen and Vincent Rijmen's <a href="http://www.ii.uib.no/~larsr/bc.html" target="_blank">Block Cipher Lounge</a>.
- The <a href="http://www.counterpane.com" target="counterpane">Counterpane web site</a> (including their <a href="http://www.counterpane.com/biblio/" target="_blank">index of cryptography papers available on-line</a>, and <a href="http://www.counterpane.com/researchers.html" target="_blank">list of crypto researchers' home pages</a>).
- The <a href="http://www.cryptography.com" target="_blank">Cryptography Research web site</a> (including more lists of <a href="http://www.cryptography.com/resources/papers/index.html" target="_blank">on-line CRYPTO and EUROCRYPT conference papers</a>, and of <a href="http://www.cryptography.com/resources/authors/index.html" target="_blank">researcher's home pages</a>).
- Yet more <a href="http://www.cs.berkeley.edu/~daw/people/crypto.html" target="_blank">lists of home pages</a>, this time compiled by <a href="http://www.cs.berkeley.edu/~daw/" target="_blank">David Wagner</a>.
- The IACR <a href="http://eprint.iacr.org/" target="_blank">Cryptology ePrint Archive</a>, which archives recent papers (since 1996) on cryptography and cryptanalysis.
- <a href="http://search.ieice.or.jp/2000/index.htm" target="_blank">IEICE Transactions</a> web site.
- <a href="http://www.ams.org/" target="_blank">American Mathematical Society</a> web site and <a href="http://www.ams.org/jourhtml/journalsearch.html" target="_blank">journal search engine</a>.
- The <a href="http://citeseer.nj.nec.com/" target="_blank">ResearchIndex</a> web site, also known as CiteSeer (very useful for literature searches).
- More <a href="http://www.cryptosoft.com/html/secpub.htm" target="_blank">on-line crypto papers</a> from <a href="http://www.cryptosoft.com/" target="_blank">www.cryptosoft.com</a>.
- <a href="http://www.tcs.hut.fi/~helger/" target="_blank">Helger Lipmaa</a>'s <a href="http://www.tcs.hut.fi/~helger/crypto/" target="_blank">Cryptology pointers</a>.
- <a href="http://www.uni-mannheim.de/studorg/gahg/PGP/cryptolog1.html" target="_blank">Crypto-Log: Internet Guide to Cryptography</a>.
- <a href="http://www.mat.dtu.dk/persons/Jakobsen_Thomas/" target="_blank">Thomas Jakobsen</a>'s page on <a href="http://www.mat.dtu.dk/persons/Jakobsen_Thomas/capapers.html" target="_blank">Cryptanalysis of Block Ciphers</a>.
- Applied Cryptography, Second Edition, by <a href="http://www.counterpane.com/schneier.html" target="_blank">Bruce Schneier</a>:\
  <a href="http://www.counterpane.com/applied.html" target="_blank">web page</a>, <a href="http://www.amazon.com/exec/obidos/ASIN/0471117099/cryptix" target="_blank">order from Amazon.com</a>.
- Handbook of Applied Cryptography, by Alfred J. Menezes, Paul C. van Oorschot, and Scott J. Vanstone:\
  <a href="http://www.cacr.math.uwaterloo.ca/hac/" target="_blank">web page</a>, <a href="http://www.amazon.com/exec/obidos/ASIN/0849385237/cryptix" target="_blank">order from Amazon.com</a>.

Thanks to <a href="http://www.eskimo.com/~weidai/" target="_blank">Wei Dai</a> for providing the U.S. mirror site for SCAN.

------------------------------------------------------------------------

## Contents

- [`MessageDigest`](md.html)
- [`Mac`](mac.html) (Message Authentication Codes)
- [`Cipher`](cs.html) (symmetric)
  - [Block Cipher Modes](cs.html#mode)
  - [Block Cipher Padding](cs.html#pad)
- [`KeyGenerator`](kg.html)
- [`PRF`](prf.html) (Pseudo Random Functions) \*
- [`PassphraseHash`](ph.html) \*
- [`SecureRandom`](sr.html)
- [`Cipher`](ca.html) (asymmetric)
  - [Asymmetric Cipher Encoding Methods](ca.html#cem)
- [`Signature`](sig.html)
  - [Signature Encoding Methods](sig.html#sem)
  - [Signature Output Formats](sig.html#sof)
- [`KeyAgreement`](ka.html)
- [`KeyPairGenerator`](kpg.html)
- [`KeyFactory`](kf.html)
- [`AlgorithmParameterGenerator`](apg.html)
- [`AlgorithmParameters`](ap.html)

\* Experimental; not in JCE 1.2. <span id="copyright"></span>

------------------------------------------------------------------------

## Copyright

Copyright © 1995-2002 The Cryptix Foundation Limited and David Hopwood. All Rights Reserved.

This document and translations of it may be copied and furnished to others, and derivative works that comment on or otherwise explain it or assist in its implementation may be prepared, copied, published and distributed, in whole or in part, without restriction of any kind, provided that the above copyright notice and this paragraph are included on all such copies and derivative works. However, this document itself may not be modified in any way, such as by removing the copyright notice, except as needed for the purpose of developing Internet standards in which case the procedures for copyrights defined in the Internet Standards process must be followed, or as required to translate it into languages other than English.

The limited permissions granted above are perpetual and will not be revoked by the copyright holders or their successors or assigns.

This document and the information contained herein is provided on an "AS IS" basis and THE AUTHORS AND CONTRIBUTORS DISCLAIM ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTY THAT THE USE OF THE INFORMATION HEREIN WILL NOT INFRINGE ANY RIGHTS OR ANY IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.

**Author and current maintainer**:\
David Hopwood \<<david.hopwood@zetnet.co.uk>\>

## Trademarks

"Cryptix" is a trademark of <a href="http://www.cryptix.org" target="_blank">The Cryptix Foundation Ltd.</a>

"Java" is a registered trademark of <a href="http://www.sun.com" target="_blank">Sun Microsystems, Inc.</a>

"DESX", "RC2", "RC4", "RC5", "RC6", "MD2", "MD4", and "MD5" are registered trademarks of <a href="http://www.rsasecurity.com" target="_blank">RSA Security, Inc.</a>

"CAST5", "CAST-128", and "CAST-256" are registered trademarks of <a href="http://www.entrust.com" target="_blank">Entrust Technologies, Inc.</a>

"Diamond2 Block Cipher" is a trademark of Michael Paul Johnson.

"IDEA" is a registered trademark of <a href="http://www.mediacrypt.com" target="_blank">Mediacrypt</a>.

Other brand, product, and algorithm names may be trademarks or registered trademarks of their respective holders.

------------------------------------------------------------------------

<img src="cryptix-s.gif" data-align="right" />

<a href="http://validator.w3.org/check/referer" target="_blank"><img src="vh40.gif" data-border="0" width="88" height="31" alt="Valid HTML 4.0" /></a>

[Copyright and trademarks](intro.html#copyright)
