---
title: "Standard Cryptographic Algorithm Naming"
source_domain: amasci.com
source_path: ~weidai/scan-mirror/ka.html
order: 9940
reachable_from_entry: false
images: 3
internal_links: 0
extracted: 2026-08-07T17:18:16Z
extractor: site_to_paper.py (pandoc)
---

# Standard Cryptographic Algorithm Naming

*Source page: `~weidai/scan-mirror/ka.html`*

## KeyAgreement algorithms

\[TODO: ECDH, STS, SRP-3, MQV, etc.\]

<span id="DH"></span>

------------------------------------------------------------------------

DH

KeyAgreement

**Description:**  
\[\[need more detail\]\]

**Alias:**  
"1.2.840.113549.1.3.1"

**References:**  
- \[*Def*\] PKCS \#3: Diffie-Hellman Key-Agreement Standard,\
  An RSA Laboratories Technical Note, Version 1.4. Revised November 1, 1993. <a href="ftp://ftp.rsa.com/pub/pkcs/ascii/pkcs-3.asc" target="_blank">ftp://ftp.rsa.com/pub/pkcs/ascii/pkcs-3.asc</a>
- \[*Inf*\] Whitfield Diffie et al,\
  "New Directions in Cryptography,"\
  IEEE Transactions on Information Theory, Vol. IT-22, No. 6, pp. 644-654. November 1976.
- \[*Inf*\] Whitfield Diffie et al,\
  "Multiuser Cryptographic Techniques,"\
  AFIPS Conference Proceedings, Vol. 45, pp. 109-112. June 8, 1976.
- \[*Patent*\] M. E. Hellman, R. C. Merkle,\
  "Public Key Cryptographic Apparatus and Method,"\
  <a href="http://pto.dwsearch.com/netacgi/nph-Parser?Sect1=PTO1&amp;Sect2=HITOFF&amp;d=PALL&amp;p=1&amp;u=/netahtml/srchnum.htm&amp;r=1&amp;f=G&amp;l=50&amp;s1=%274218582%27.WKU.&amp;OS=PN/4218582&amp;RS=PN/4218582" target="_blank">U.S. Patent 4,218,582</a>, filed October 6 1977, issued August 19 1980.
- \[*An*\] Paul Kocher,\
  "Timing Attacks on Implementations of Diffie-Hellman, RSA, DSS, and Other Systems,"\
  <a href="http://www.cryptography.com/timingattack/paper.html" target="_blank">http://www.cryptography.com/timingattack/paper.html</a>

**Patent status:**  
The patent referenced above, although it only directly describes knapsack-based cryptosystems, was claimed to cover all public key cryptography. It expired in 1997.

**Security comment:**  
DH key agreement on its own does not provide authentication of either party, and is therefore vulnerable to a man-in-the-middle attack.

------------------------------------------------------------------------

<img src="cryptix.gif" data-align="right" />

<a href="http://validator.w3.org/check/referer" target="_blank"><img src="vh40.gif" data-border="0" width="88" height="31" alt="Valid HTML 4.0" /></a> <a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank"><img src="vcss.gif" data-border="0" width="88" height="31" alt="Valid CSS" /></a>

**Author**: David Hopwood \<<hopwood@zetnet.co.uk>\>\
**Current maintainer**: David Hopwood \<<hopwood@zetnet.co.uk>\>\
\
Copyright © 1995-2000 The Cryptix Foundation Limited. All rights reserved.\
Cryptix is a trademark of The Cryptix Foundation Limited.
