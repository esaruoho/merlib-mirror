---
title: "Standard Cryptographic Algorithm Naming"
source_domain: amasci.com
source_path: ~weidai/scan-mirror/dem.html
order: 9936
reachable_from_entry: false
images: 3
internal_links: 0
extracted: 2026-08-07T17:18:16Z
extractor: site_to_paper.py (pandoc)
---

# Standard Cryptographic Algorithm Naming

*Source page: `~weidai/scan-mirror/dem.html`*

## DEM algorithms

None of the algorithms in this section are finished.

<span id="DEM1"></span>

------------------------------------------------------------------------

DEM1(*mac*,\
*symCipher*\[,*macKeyLength*\])

AuthenticatedCipher

**Description:**  
...

**Parameters:**  
- `String mac` \[creation/read, no default\] - the name of the MAC to be used.
- `String symCipher` \[creation/read, no default\] - the name of the symmetric cipher to be used.
- `String macKeyLength` \[creation/read, no default\] - the length of the MAC key, in bits (the remainder of the key is used for the cipher). This MUST be a multiple of 8.

**Security comment:**  
...

<span id="DEM1WithPRF"></span>

------------------------------------------------------------------------

DEM1WithPRF(*mac*,\
*symCipher*, *prf*)

AuthenticatedCipher

**Description:**  
...

**Parameters:**  
- `String mac` \[creation/read, no default\] - the name of the MAC to be used.
- `String symCipher` \[creation/read, no default\] - the name of the symmetric cipher to be used.
- `String prf` \[creation/read, no default\] - the name of the PRF used to construct MAC and cipher keys.

**Security comment:**  
...

<span id="UST"></span>

------------------------------------------------------------------------

UST(*universalHash*,\
*symCipher*)

AuthenticatedCipher

**Description:**  
Intended for use with a universal hash function and a stream cipher.

**References:**  
http://www.mindspring.com/~dmcgrew/draft-mcgrew-saag-ust-01.txt

**Parameters:**  
- `String universalHash` \[creation/read, no default\] - the name of the UniversalHash to be used.
- `String streamCipher` \[creation/read, no default\] - the name of the symmetric stream cipher to be used.
- `String prf` \[creation/read, no default\] - the name of the PRF used to construct universal hash and cipher keys.

**Security comment:**  
...

------------------------------------------------------------------------

<img src="cryptix.gif" data-align="right" />

<a href="http://validator.w3.org/check/referer" target="_blank"><img src="vh40.gif" data-border="0" width="88" height="31" alt="Valid HTML 4.0" /></a> <a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank"><img src="vcss.gif" data-border="0" width="88" height="31" alt="Valid CSS" /></a>

**Author**: David Hopwood \<<david.hopwood@zetnet.co.uk>\>\
**Current maintainer**: David Hopwood \<<david.hopwood@zetnet.co.uk>\>\
\
Copyright © 1995-2001 The Cryptix Foundation Limited\
and David Hopwood. All rights reserved.\
Cryptix is a trademark of The Cryptix Foundation Limited.
