---
title: "Standard Cryptographic Algorithm Naming"
source_domain: amasci.com
source_path: ~weidai/scan-mirror/uh.html
order: 9956
reachable_from_entry: false
images: 3
internal_links: 3
extracted: 2026-08-07T17:18:18Z
extractor: site_to_paper.py (pandoc)
---

# Standard Cryptographic Algorithm Naming

*Source page: `~weidai/scan-mirror/uh.html`*

## UniversalHash Algorithms

<span id="links"></span>

### Links

- Helger Lipmaa's pages on hash functions:\
  <a href="http://www.tcs.hut.fi/~helger/crypto/link/hash/" target="_blank">http://www.tcs.hut.fi/~helger/crypto/link/hash/</a>\
  and MAC algorithms:\
  <a href="http://www.tcs.hut.fi/~helger/crypto/link/hash/mac.html" target="_blank">http://www.tcs.hut.fi/~helger/crypto/link/hash/mac.html</a>

<span id="papers"></span>

### Design and Analysis

- J. Kim, D. Simon, P. Tetali,\
  "Limits on the Efficiency of One-Way Permutation-Based Hash Functions,"\
  Microsoft Research, 1999. <a href="http://www.research.microsoft.com/scripts/pubDB/pubsasp.asp?RecordID=234" target="_blank">http://www.research.microsoft.com/scripts/pubDB/pubsasp.asp?RecordID=234</a>

<span id="description"></span>

### Description

UniversalHash algorithms are keyed hash functions with specific provable security properties. Although they have an interface similar to a MAC, it is not secure to use a UniversalHash directly as a MAC. \[\[Explain what should be done instead.\]\]

In some cases, a MAC algorithm based on a particular UniversalHash may be defined (e.g. [UMAC32](mac.html#UMAC32) is based on [UHASH32](#UHASH32)). Alteratively, a DEM or MAC construction can be defined generically in terms of any UniversalHash. (<a href="dem.html#UST" class="x">UST</a> may be an example of this.)

<span id="UHASH16"></span>

------------------------------------------------------------------------

× <span class="x">UHASH16</span>\[(*signedFlag*,\
*preferredEndian*,*l1KeyLen*,*outputLen*)\]

UniversalHash Construction

**Designers:**  
Theodore Krovetz, John Black, Shai Halevi, A. Hevia, Hugo Krawczyk, <a href="http://www.cs.ucdavis.edu/~rogaway/" target="_blank">Phillip Rogaway</a>

**Published:**  
November 2000

**Description:**  
This is UHASH from the version of UMAC submitted to the NESSIE project (UMAC 2000), with the 16-bit parameter set. The default parameters are signedFlag = S, preferredEndian = LE, l1KeyLen = 1024, outputLen = 8.

Note that the signed default is different from [UHASH32](#UHASH32).

**References:**  
- \[*Def*\] T. Krovetz, J. Black, S. Halevi, A. Hevia, H. Krawczyk, P. Rogaway,\
  UMAC: Message Authentication Code using Universal Hashing.\
  draft-krovetz-umac-00.txt in <http://www.cosic.esat.kuleuven.ac.be/nessie/workshop/submissions/umac.zip>
- \[*Inf, Impl, Test*\] T. Krovetz,\
  PhD Thesis,\
  thesis.pdf in <http://www.cosic.esat.kuleuven.ac.be/nessie/workshop/submissions/umac.zip>
- \[*Inf*\] Phillip Rogaway,\
  UMAC Home Page,\
  <a href="http://www.cs.ucdavis.edu/~rogaway/umac/" target="_blank">http://www.cs.ucdavis.edu/~rogaway/umac/</a>
- \[*An*\] Bart van Rompey, Vincent Rijmen, Jorge Nakahara Jr.,\
  "A First Report on UMAC,"\
  NESSIE Project public report, March 12, 2001.\
  <a href="https://www.cosic.esat.kuleuven.ac.be/nessie/reports/kulwp3-006-1.pdf" target="_blank">https://www.cosic.esat.kuleuven.ac.be/nessie/reports/kulwp3-006-1.pdf</a>
- \[*Test*\] Bart Van Rompay, Bert den Boer,\
  UMAC Test Vectors.\
  testsuite.txt in <http://www.cosic.esat.kuleuven.ac.be/nessie/workshop/submissions/umac.zip>

**Key length:**  
As block cipher.

**Output length:**  
As given by outputLen parameter.

**Parameters:**  
- `String signedFlag` \[creation/read, default "S"\] - "S" for signed, or "U" for unsigned.
- `String preferredEndian` \[creation/read, default "LE"\] - "LE" for little-endian, or "BE" for big-endian.
- `Integer l1KeyLen` \[creation/read, default 1024\] - the length of the seed (or counter) value, in bytes.
- `Integer outputLen` \[creation/read, default 8\] - the length of the hash output in bytes.

<span id="UHASH32"></span>

------------------------------------------------------------------------

× <span class="x">UHASH32</span>\[(*signedFlag*,\
*preferredEndian*,*l1KeyLen*,*outputLen*,*cipher*)\]

UniversalHash Construction

**Designers:**  
Theodore Krovetz, John Black, Shai Halevi, A. Hevia, Hugo Krawczyk, <a href="http://www.cs.ucdavis.edu/~rogaway/" target="_blank">Phillip Rogaway</a>

**Published:**  
November 2000

**Description:**  
This is UHASH from the version of UMAC submitted to the NESSIE project (UMAC 2000), with the 32-bit parameter set. The default parameters are signedFlag = U, preferredEndian = LE, l1KeyLen = 1024, outputLen = 8.

Note that the unsigned default is different from [UMAC16](#UMAC16).

**References:**  
- \[*Def*\] T. Krovetz, J. Black, S. Halevi, A. Hevia, H. Krawczyk, P. Rogaway,\
  UMAC: Message Authentication Code using Universal Hashing.\
  draft-krovetz-umac-00.txt in <http://www.cosic.esat.kuleuven.ac.be/nessie/workshop/submissions/umac.zip>
- \[*Inf, Impl, Test*\] T. Krovetz,\
  PhD Thesis,\
  thesis.pdf in <http://www.cosic.esat.kuleuven.ac.be/nessie/workshop/submissions/umac.zip>
- \[*Inf*\] Phillip Rogaway,\
  UMAC Home Page,\
  <a href="http://www.cs.ucdavis.edu/~rogaway/umac/" target="_blank">http://www.cs.ucdavis.edu/~rogaway/umac/</a>
- \[*An*\] Bart van Rompey, Vincent Rijmen, Jorge Nakahara Jr.,\
  "A First Report on UMAC,"\
  NESSIE Project public report, March 12, 2001.\
  <a href="https://www.cosic.esat.kuleuven.ac.be/nessie/reports/kulwp3-006-1.pdf" target="_blank">https://www.cosic.esat.kuleuven.ac.be/nessie/reports/kulwp3-006-1.pdf</a>
- \[*Test*\] Bart Van Rompay, Bert den Boer,\
  UMAC Test Vectors.\
  testsuite.txt in <http://www.cosic.esat.kuleuven.ac.be/nessie/workshop/submissions/umac.zip>

**Key length:**  
As block cipher.

**Output length:**  
As given by outputLen parameter.

**Parameters:**  
- `String signedFlag` \[creation/read, default "U"\] - "S" for signed, or "U" for unsigned.
- `String preferredEndian` \[creation/read, default "LE"\] - "LE" for little-endian, or "BE" for big-endian.
- `Integer l1KeyLen` \[creation/read, default 1024\] - the length of the seed (or counter) value, in bytes.
- `Integer outputLen` \[creation/read, default 8\] - the length of the hash output in bytes.

<span id="alleged"></span>

------------------------------------------------------------------------

### Alleged UniversalHashes

- <a href="http://cr.yp.to/papers/hash127.ps" class="a">hash127</a>.
- <a href="ftp://theory.lcs.mit.edu/pub/people/shaih/mmh.ps.gz" class="a">TMMH16, TMMH32</a>.

------------------------------------------------------------------------

<img src="cryptix-s.gif" data-align="right" />

<a href="http://validator.w3.org/check/referer" target="_blank"><img src="vh40.gif" data-border="0" width="88" height="31" alt="Valid HTML 4.0" /></a> <a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank"><img src="vcss.gif" data-border="0" width="88" height="31" alt="Valid CSS" /></a>

[Copyright and trademarks](intro.html#copyright)
