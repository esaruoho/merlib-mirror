---
title: "Standard Cryptographic Algorithm Naming"
source_domain: amasci.com
source_path: ~weidai/scan-mirror/sig.html
order: 9952
reachable_from_entry: false
images: 3
internal_links: 2
extracted: 2026-08-07T17:18:18Z
extractor: site_to_paper.py (pandoc)
---

# Standard Cryptographic Algorithm Naming

*Source page: `~weidai/scan-mirror/sig.html`*

## Signature algorithms

The naming scheme described here is different from that described in Sun's documentation for the Java Cryptography Architecture. Several name formats have been used up to now for signature algorithms:

- in JDK 1.1, "*digest*/*signature-primitive*" (e.g. "SHA-1/RSA" and "SHA/RSA"),
- in Cryptix 3.0.x, "*digest*/*signature-primitive*/PKCS#1" (e.g. "SHA-1/RSA/PKCS#1" and "SHA/RSA/PKCS#1"),
- in JDK 1.2, "*digest*with*signature-primitive*" (e.g. "SHA1withRSA"; note that this is a slightly irregular example because of the missing hyphen in SHA1).

These names are now deprecated (but are still specified temporarily as aliases). The new preferred format is "*signature-primitive*/*signature-encoding*". For this format, the signature encoding will usually have a message digest name as a creation parameter, e.g. "RSA/PKCS1-1.5(SHA-1)".

All of the algorithms defined here use either modular exponentiation or elliptic curve multiplication, which are potentially vulnerable to timing attacks. See the following paper for details and possible countermeasures:

- \[*An*\] Paul Kocher,\
  "Timing Attacks on Implementations of Diffie-Hellman, RSA, DSS, and Other Systems,"\
  <a href="http://www.cryptography.com/timingattack/paper.html" target="_blank">http://www.cryptography.com/timingattack/paper.html</a>

<span id="DSA"></span>

------------------------------------------------------------------------

DSA\[(*outputFormat*)\]

Signature

**Description:**  
The Digital Signature Algorithm, as defined in NIST FIPS PUB 186. (This is technically equivalent to the version of DSA defined in NIST FIPS PUB 186-2. However, Change Notice 1 to FIPS PUB 186-2 requires keys to have a modulus length of exactly 1024 bits. This algorithm does *not* impose that requirement, which would be an incompatible change.)

The default *outputFormat* is "[DER](#sof_DER)".

This algorithm is separated from the generalisation, "[DSA-1363](#DSA-1363)", described below, in order to ensure that an implementation of DSA by a provider earlier in the priority list does not 'mask' an implementation of DSA-1363.

**Aliases:**  
- "1.2.840.10040.4.3", "SHA1withDSA"
- "SHA/DSA", "SHA-1/DSA", and "1.3.14.3.2.12" (all deprecated)

**References:**  
- \[*Def*\] U.S. National Institute of Standards and Technology,\
  "Digital Signature Standard (DSS),"\
  NIST FIPS PUB 186,\
  U.S. Department of Commerce.\
  <a href="http://www.itl.nist.gov/div897/pubs/fip186.htm" target="_blank">http://www.itl.nist.gov/div897/pubs/fip186.htm</a> and <a href="http://www.itl.nist.gov/div897/pubs/186chg-1.htm" target="_blank">http://www.itl.nist.gov/div897/pubs/186chg-1.htm</a>
- \[*Inf*\] U.S. National Institute of Standards and Technology,\
  "Digital Signature Standard (DSS),"\
  NIST FIPS PUB 186-2 + Change Notice 1,\
  U.S. Department of Commerce.\
  <a href="http://csrc.nist.gov/publications/fips/fips186-2/fips186-2-change1.pdf" target="_blank">http://csrc.nist.gov/publications/fips/fips186-2/fips186-2-change1.pdf</a>
- \[*Inf*\] ANSI X9.30-1,\
  "American National Standard, Public-Key Cryptography Using Irreversible Algorithms for the Financial Services Industry", 1993.
- \[*Inf*\] IEEE,\
  IEEE Std 1363-2000: Standard Specifications For Public Key Cryptography.\
  <a href="http://grouper.ieee.org/groups/1363/index.html" target="_blank">http://grouper.ieee.org/groups/1363/index.html</a>
- \[*Inf*\] Bruce Schneier,\
  "Section 20.1 Digital Signature Algorithm (DSA),"\
  Applied Cryptography, Second Edition, John Wiley & Sons, 1996.
- \[*Patent*\] The United States of America, as represented by the Secretary of Commerce (assignee),\
  "Digital signature algorithm,"\
  <a href="http://patft.uspto.gov/netacgi/nph-Parser?amp;Sect1=PTO1&amp;Sect2=HITOFF&amp;d=PALL&amp;p=1&amp;u=/netahtml/srchnum.htm&amp;r=1&amp;f=G&amp;l=50&amp;s1=5231668.WKU.&amp;OS=PN/5231668&amp;RS=PN/5231668" target="_blank">U.S. Patent 5,231,668</a>, filed July 26 1991, issued July 27 1993.
- \[*An*\] Serge Vaudenay,\
  "Hidden collisions on DSS,"\
  Advances in Cryptology - Crypto '96, Volume 1109 of Lecture Notes in Computer Science, pp. 83-88. Springer-Verlag, 1996.\
  <ftp://ftp.ens.fr/pub/reports/liens/liens-96-9.A4.ps.Z>
- \[*An*\] Phong Q. Nguyen,\
  "The Dark Side of the Hidden Number Problem: Lattice Attacks on DSA,"\
  Cryptography and Computational Number Theory, CCNT '99 (K. Lam, I. Shparlinski, H. Wang, and C. Xing, eds.)\
  Progress in Computer Science and Applied Logic 20, pp. 321-330. Birkhuser, 2001.
- \[*An*\] Phong Q. Nguyen, Igor E. Shparlinski,\
  "The Insecurity of the Digital Signature Algorithm with Partially Known Nonces,"\
  Journal of Cryptology, Volume 15 (2002), pp. 151-176.\
  <http://www.di.ens.fr/~pnguyen/pub.html#NgSh00>
- \[*An*\] Daniel Bleichenbacher,\
  "On the Generation of DSA One-Time Keys,"\
  Presented at ECC 2002.

**Comment:**  
Some providers may implement a "RawDSA" algorithm, which takes a 20-byte input corresponding to the SHA-1 hash of the message to be signed. This is not formally defined as an algorithm name in SCAN; "DSA-1363(DER)/Raw" is similar but not identical (since it uses a generalisation of DSA).

**Security comments:**  
- FIPS 186 specifies that:
  - the key parameter *p* may be between 512 and 1024 bits, in multiples of 64 bits;
  - the key parameter *q* must be 160 bits;
  - the encoding method must be that specified in the standard, using SHA-1 as the hash function.

  Values of *p* and *q* larger than 1024 and 160 bits respectively may be desirable for long term security, however implementations of this algorithm are not required to support such parameters. Applications that require a more general algorithm are encouraged to use "DSA-1363" instead.

- DSA SHOULD only be used with parameters that have been generated pseudo-randomly (as described in FIPS 186). If this is not the case, it may be possible for whoever generated the parameters to forge one or more signatures.

- The abstract of the paper by Vaudenay cited above is:

  > We explain how to forge public parameters for the Digital Signature Standard with two known messages which always produce the same set of valid signatures (what we call a collision). This attack is thwarted by using the generation algorithm suggested in the specifications of the Standard, so it proves one always need to check proper generation. We also present a similar attack when using this generation algorithm within a complexity 2<sup>74</sup>, which is better than the birthday attack which seeks for collisions on the underlying hash function.

- To prevent the attacks by Bleichenbacher, Nguyen, and Shparlinski, the random nonces generated for each signature must be independent and uniformly distributed on \[0, q).

<span id="DSA-1363"></span>

------------------------------------------------------------------------

DSA-1363\[(*outputFormat*)\]\[/*encoding*\]

Signature

**Description:**  
A generalisation of the Digital Signature Algorithm, as defined in IEEE Std 1363-2000. By default, the EMSA1 encoding method specified by IEEE Std 1363-2000 is used, with the SHA-1 message digest algorithm.

If an encoding method is explicitly specified, it is used instead of the default (this requires that the order of the base in the DSA parameters, usually denoted *q*, is large enough to accomodate message representatives generated by this encoding method).

This algorithm also differs from the "DSA" algorithm, in having "[1363](#sof_1363)" as the default *outputFormat*. The "[DER](#sof_DER)" and "[OpenPGP](#sof_OpenPGP)" output formats SHOULD normally also be supported.

**Aliases:**  
- "dsa-sha1" is an alias to "DSA-1363/EMSA1(SHA-1)" (for SPKI support).
- "http://www.w3.org/2000/02/xmldsig#dsa" is an alias to "DSA-1363/EMSA1(SHA-1)" (for DSIG support).

**References:**  
- \[*Def*\] IEEE,\
  IEEE Std 1363-2000: Standard Specifications For Public Key Cryptography.\
  <a href="http://grouper.ieee.org/groups/1363/index.html" target="_blank">http://grouper.ieee.org/groups/1363/index.html</a>
- \[*Inf*\] U.S. National Institute of Standards and Technology,\
  "Digital Signature Standard (DSS),"\
  NIST FIPS PUB 186,\
  U.S. Department of Commerce.\
  <a href="http://www.itl.nist.gov/div897/pubs/fip186.htm" target="_blank">http://www.itl.nist.gov/div897/pubs/fip186.htm</a> and <a href="http://www.itl.nist.gov/div897/pubs/186chg-1.htm" target="_blank">http://www.itl.nist.gov/div897/pubs/186chg-1.htm</a>
- \[*Inf*\] U.S. National Institute of Standards and Technology,\
  "Digital Signature Standard (DSS),"\
  NIST FIPS PUB 186-2 + Change Notice 1,\
  U.S. Department of Commerce.\
  <a href="http://csrc.nist.gov/publications/fips/fips186-2/fips186-2-change1.pdf" target="_blank">http://csrc.nist.gov/publications/fips/fips186-2/fips186-2-change1.pdf</a>
- \[*Inf*\] Bruce Schneier,\
  "Section 20.1 Digital Signature Algorithm (DSA),"\
  Applied Cryptography, Second Edition, John Wiley & Sons, 1996.
- \[*Patent*\] The United States of America, as represented by the Secretary of Commerce (assignee),\
  "Digital signature algorithm,"\
  <a href="http://patft.uspto.gov/netacgi/nph-Parser?amp;Sect1=PTO1&amp;Sect2=HITOFF&amp;d=PALL&amp;p=1&amp;u=/netahtml/srchnum.htm&amp;r=1&amp;f=G&amp;l=50&amp;s1=5231668.WKU.&amp;OS=PN/5231668&amp;RS=PN/5231668" target="_blank">U.S. Patent 5,231,668</a>, filed July 26 1991, issued July 27 1993.
- \[*An*\] Serge Vaudenay,\
  "Hidden collisions on DSS,"\
  Advances in Cryptology - Crypto '96, Volume 1109 of Lecture Notes in Computer Science, pp. 83-88. Springer-Verlag, 1996.\
  <ftp://ftp.ens.fr/pub/reports/liens/liens-96-9.A4.ps.Z>
- \[*An*\] Phong Q. Nguyen,\
  "The Dark Side of the Hidden Number Problem: Lattice Attacks on DSA,"\
  Cryptography and Computational Number Theory, CCNT '99 (K. Lam, I. Shparlinski, H. Wang, and C. Xing, eds.)\
  Progress in Computer Science and Applied Logic 20, pp. 321-330. Birkhuser, 2001.
- \[*An*\] Phong Q. Nguyen, Igor E. Shparlinski,\
  "The Insecurity of the Digital Signature Algorithm with Partially Known Nonces,"\
  Journal of Cryptology, Volume 15 (2002), pp. 151-176.\
  <http://www.di.ens.fr/~pnguyen/pub.html#NgSh00>
- \[*An*\] Daniel Bleichenbacher,\
  "On the Generation of DSA One-Time Keys,"\
  Presented at ECC 2002.
- \[*Test*\] IEEE,\
  Test Vectors for Std 1363-2000.\
  <a href="http://grouper.ieee.org/groups/1363/P1363/testvector.txt" target="_blank">http://grouper.ieee.org/groups/1363/P1363/testvector.txt</a>\
  \[for DSA-1363/EMSA1(SHA-1)\]

**Comment:**  
It is recommended that implementations make no practical restriction on the lengths of the key parameters *p*, *q*, *g* and *x* (in particular, values of *p* up to at least 4096 bits SHOULD be supported).

**Security comments:**  
- The security properties of DSA-1363 when used with an encoding method other than the default have not been extensively studied.

- DSA-1363 SHOULD only be used with parameters that have been generated pseudo-randomly (as described in FIPS 186). If this is not the case, it may be possible for whoever generated the parameters to forge one or more signatures.

- The abstract of the paper by Vaudenay cited above is:

  > We explain how to forge public parameters for the Digital Signature Standard with two known messages which always produce the same set of valid signatures (what we call a collision). This attack is thwarted by using the generation algorithm suggested in the specifications of the Standard, so it proves one always need to check proper generation. We also present a similar attack when using this generation algorithm within a complexity 2<sup>74</sup>, which is better than the birthday attack which seeks for collisions on the underlying hash function.

  These attacks apply to the default encoding method.

- To prevent the attacks by Bleichenbacher, Nguyen, and Shparlinski, the random nonces generated for each signature must be independent and uniformly distributed on \[0, q).

<span id="ECDSA"></span>

------------------------------------------------------------------------

ECDSA\[(*outputFormat*)\]\[/*encoding*\]

Signature

**Description:**  
A generalisation of the Elliptic Curve Digital Signature Algorithm, as defined in IEEE Std 1363-2000. By default, the EMSA1 encoding method specified by IEEE Std 1363-2000 is used, with the SHA-1 message digest algorithm.

If an encoding method is explicitly specified, it is used instead of the default (this requires that the order of the base point in the elliptic curve parameters, usually denoted *n*, is large enough to accomodate message representatives generated by this encoding method).

The default *outputFormat* is "[1363](#sof_1363)".

**Alias:**  
"ecdsa-sha1" is an alias to "ECDSA(1363)/EMSA1(SHA-1)" (for SPKI support).

"1.2.840.10045.4.1" is an alias to "ECDSA(DER)/EMSA1(SHA-1)".

**References:**  
- \[*Def*\] IEEE,\
  IEEE Std 1363-2000: Standard Specifications For Public Key Cryptography.\
  <a href="http://grouper.ieee.org/groups/1363/index.html" target="_blank">http://grouper.ieee.org/groups/1363/index.html</a>
- \[*Inf*\] X9.62-199x (draft),\
  Public Key Cryptography For The Financial Services Industry: The Elliptic Curve Digital Signature Algorithm (ECDSA).
- \[*Inf*\] U.S. National Institute of Standards and Technology,\
  "Digital Signature Standard (DSS),"\
  NIST FIPS PUB 186-2 + Change Notice 1,\
  U.S. Department of Commerce.\
  <a href="http://csrc.nist.gov/publications/fips/fips186-2/fips186-2-change1.pdf" target="_blank">http://csrc.nist.gov/publications/fips/fips186-2/fips186-2-change1.pdf</a>
- \[*An*\] Phong Q. Nguyen, Igor E. Shparlinski,\
  "The Insecurity of the Elliptic Curve Digital Signature Algorithm with Partially Known Nonces,"\
  To appear in Designs, Codes and Cryptography.\
  <a href="http://www.di.ens.fr/~pnguyen/pub.html#NgSh02" target="_blank">http://www.di.ens.fr/~pnguyen/pub.html#NgSh02</a>
- \[*Test*\] IEEE,\
  Test Vectors for Std 1363-2000.\
  <a href="http://grouper.ieee.org/groups/1363/P1363/testvector.txt" target="_blank">http://grouper.ieee.org/groups/1363/P1363/testvector.txt</a>

**Comment:**  
It is recommended that implementations make no practical restriction on the lengths of the key parameters.

**Security comment:**  
- The security properties of ECDSA when used with an encoding method other than the default have not been extensively studied.
- To prevent the attacks by Nguyen and Shparlinski, the random nonces generated for each signature must be independent and uniformly distributed on \[0, q).

**Patent status:**  
\[see [general elliptic curve patents](kpg.html#ECDH)\]

<span id="ECNR"></span>

------------------------------------------------------------------------

? <span class="p">ECNR</span>(*outputFormat*)/*encoding*

Signature

**Designers:**  
Kaisa Nyberg, Rainer A. Rueppel

**Description:**  
The elliptic curve analogue of the Nyberg-Rueppel signature scheme, as defined in IEEE Std 1363-2000. This algorithm is specified by the ECSSA signature scheme used with the ECSP-NR signature primitive, and the ECVP-NR verification primitive.

**References:**  
- \[*Def*\] IEEE,\
  IEEE Std 1363-2000: Standard Specifications For Public Key Cryptography.\
  <a href="http://grouper.ieee.org/groups/1363/index.html" target="_blank">http://grouper.ieee.org/groups/1363/index.html</a>
- \[*Inf*\] Kaisa Nyberg, Rainer A. Rueppel,\
  "A New Signature Scheme Based on the DSA Giving Message Recovery,"\
  1st ACM Conference on Computer and Communications Security,\
  Nov 3-5, 1993, Fairfax, Virginia.
- \[*Patent*\] r<sup>3</sup> Security Engineering AG (assignee),\
  "Digital signature method and key agreement method,"\
  <a href="http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&amp;Sect2=HITOFF&amp;d=PALL&amp;p=1&amp;u=/netahtml/srchnum.htm&amp;r=1&amp;f=G&amp;l=50&amp;s1=%275600725%27.WKU.&amp;OS=PN/5600725&amp;RS=PN/5600725" target="_blank">U.S. Patent 5,600,725</a>, filed August 17 1994, issued February 4 1997.
- \[*An*\] E. El Mahassni, Phong Nguyen, Igor Shparlinski,\
  "The Insecurity of Nyberg-Rueppel and Other DSA-Like Signature Schemes with Partially Known Nonces,\
  To appear in Proceedings of Cryptography and Lattices Conference, CaLC 2001 (J.H. Silverman, ed.)\
  Volume 2146 of Lecture Notes in Computer Science, pp. 97-109. Springer-Verlag, 2001.\
  <a href="http://www.comp.mq.edu.au/~igor/Publ.html" target="_blank">http://www.comp.mq.edu.au/~igor/Publ.html</a>

**Comment:**  
It is recommended that implementations make no practical restriction on the lengths of the key parameters.

**Security Comment:**  
To prevent the attacks by Nguyen and Shparlinski, the random nonces generated for each signature must be independent and uniformly distributed.

**Patent status:**  
r<sup>3</sup> Security Engineering (now merged with [Entrust Technologies](http://www.entrust.com/)) is the assignee of a patent on the Nyberg-Rueppel signature scheme. Certicom Corp., in a <a href="http://grouper.ieee.org/groups/1363/P1363/letters/Certicom.txt" target="_blank">letter to the IEEE P1363 Chair</a>, claims to have the exclusive North American license rights to this patent. It is not clear whether or not the patent also applies to ECNR.

<span id="ElgamalSig"></span>

------------------------------------------------------------------------

ElgamalSig(*outputFormat*)/*encoding*

Signature

**Designer:**  
Taher Elgamal

**Aliases:**  
- "MD2/ElGamal" and "MD2/ElGamal/PKCS#1" are deprecated aliases to "ElgamalSig(OpenPGP)/PKCS1-1.5(MD2)".
- "MD5/ElGamal" and "MD5/ElGamal/PKCS#1" are deprecated aliases to "ElgamalSig(OpenPGP)/PKCS1-1.5(MD5)".
- "SHA/ElGamal", "SHA-1/ElGamal", "SHA/ElGamal/PKCS#1", and "SHA-1/ElGamal/PKCS#1" are deprecated aliases to "ElgamalSig(OpenPGP)/PKCS1-1.5(SHA-1)".
- "RIPEMD160/ElGamal", "RIPEMD-160/ElGamal", "RIPEMD160/ElGamal/PKCS#1" and "RIPEMD-160/ElGamal/PKCS#1" are deprecated aliases to "ElgamalSig(OpenPGP)/PKCS1-1.5(RIPEMD-160)".

**References:**  
- \[*Def*\] Taher Elgamal,\
  "A Public-Key Cryptosystem and a Signature Scheme Based on Discrete Logarithms,"\
  IEEE Transactions on Information Theory, v. IT-31, n. 4, 1985, pp. 469-472, or\
  Advances in Cryptology - CRYPTO '84, pp. 10-18, Springer-Verlag, 1985.
- \[*Inf*\] Bruce Schneier,\
  "Section 19.6 ElGamal,"\
  Applied Cryptography, Second Edition, John Wiley & Sons, 1996.
- \[*Inf*\] D. Bleichenbacher,\
  "Generating ElGamal signatures without knowing the secret key,"\
  Advances in Cryptology - EUROCRYPT '96 (corrected version), Volume 1070 of Lecture Notes in Computer Science, pp. 10-18. Springer Verlag, 1996.\
  <a href="ftp://ftp.inf.ethz.ch/pub/publications/papers/ti/isc/ElGamal.ps" target="_blank">ftp://ftp.inf.ethz.ch/pub/publications/papers/ti/isc/ElGamal.ps</a>

**Comments:**  
- Taher Elgamal currently spells his name, and the name of the Elgamal algorithm with a lowercase 'g'.
- The reason for choosing separate names "ElgamalEnc" and "ElgamalSig", for Elgamal encryption and signatures respectively, is that ElgamalEnc keys can use the "DH" key family, while ElgamalSig requires its own key family (because Elgamal signature keys have additional security constraints).
- It is recommended that implementations make no practical restriction on the lengths of the key parameters *p*, *g* and *x* (in particular, values of *p* up to at least 4096 bits SHOULD be supported).

**Security comments:**  
- *p* SHOULD be a safe prime, i.e. such that (*p*-1)/2 is prime.
- The paper by Bleichenbacher referenced above shows that if *g* has only small prime factors, and if *g* divides the order of the group it generates, then signatures can be forged.

<span id="ESIGN"></span>

------------------------------------------------------------------------

× <span class="x">ESIGN</span>/*encoding*

Signature

**Designers:**  
Eiichiro Fujisaki, Tatsuaki Okamoto

**Published:**  
Submission dated November 1998.

**Description:**  
The ESIGN signature algorithm, as defined in the IEEE P1363a draft standard. Note that P1363a only allows use of ESIGN with the [EMSA5-MGF1](#sem_EMSA5-MGF1) encoding method.

**References:**  
- \[*Def*\] IEEE,\
  "Draft Standard Specifications for Public Key Cryptography Amendment 1: Additional Techniques,"\
  <a href="http://grouper.ieee.org/groups/1363/index.html" target="_blank">http://grouper.ieee.org/groups/1363/index.html</a>
- \[*Inf, An, Test, Impl, Patent*\] Nippon Telegraph and Telephone Corporation,\
  ESIGN Signatures Homepage,\
  <a href="http://info.isl.ntt.co.jp/esign" target="_blank">http://info.isl.ntt.co.jp/esign</a> and\
  <a href="http://www.nttmcl.com/sec/Esign/esign.html" target="_blank">http://www.nttmcl.com/sec/Esign/esign.html</a>
- \[*An*\] J. Stern, D. Pointcheval, J. Malone-Lee, N. P. Smart,\
  "Flaws in Applying Proof Methodologies to Signature Schemes,"\
  Advances in Cryptology - Proceedings of Crypto 2002, Volume 2442 of Lecture Notes in Computer Science, pp. 93-110. Springer-Verlag, 2002.
- \[*An*\] Eiichiro Fujisaki, Tatsuaki Okamoto,\
  "Security of Efficient Digital Signature Scheme TSH-ESIGN,"\
  Manuscript, November 1998, available as appendix A of "TSH-ESIGN: Efficient Digital Signature Scheme Using Trisection Size Hash."
- \[*Inf*\] Tatsuaki Okamoto, Eiichiro Fujisaki, Hikaru Morita,\
  "TSH-ESIGN: Efficient Digital Signature Scheme Using Trisection Size Hash,"\
  Submission to IEEE P1363a, November 1998. <a href="http://grouper.ieee.org/groups/1363/StudyGroup/contributions/esign.pdf" target="_blank">http://grouper.ieee.org/groups/1363/StudyGroup/contributions/esign.pdf</a>
- \[*History*\] A. Fujioka, Tatsuaki Okamoto, S. Miyaguchi,\
  "ESIGN: An efficient digital signature implementation for smart cards,"\
  Advances in Cryptology - Proceedings of EUROCRYPT '91, pp. 446-457. Springer-Verlag, 1991.
- \[*History*\] Tatsuaki Okamoto,\
  "A Fast Signature Scheme Based on Congruential Polynomial Operations,"\
  IEEE Transactions on Information Theory, IT-36, 1, pp. 47-53 (1990).
- \[*History*\] Tatsuaki Okamoto, A. Shiraishi,\
  "A Digital Signature Scheme Based on Quadratic Inequalities,"\
  Proceeding of Symposium on Security and Privacy, pp. 123-132. IEEE, April 1985.

**Comments:**  
- It is recommended that implementations make no practical restriction on the lengths of the key parameters.

<span id="NR"></span>

------------------------------------------------------------------------

? <span class="p">NR</span>(*outputFormat*)/*encoding*

Signature

**Designers:**  
Kaisa Nyberg, Rainer A. Rueppel

**Description:**  
The Nyberg-Rueppel signature scheme, with message encoding as defined in IEEE Std 1363-2000. This algorithm is specified by the DLSSA signature scheme used with the DLSP-NR signature primitive, and the DLVP-NR verification primitive.

**References:**  
- \[*Def*\] IEEE,\
  IEEE Std 1363-2000: Standard Specifications For Public Key Cryptography.\
  <a href="http://grouper.ieee.org/groups/1363/index.html" target="_blank">http://grouper.ieee.org/groups/1363/index.html</a>
- \[*Inf*\] Kaisa Nyberg, Rainer A. Rueppel,\
  "A New Signature Scheme Based on the DSA Giving Message Recovery,"\
  1st ACM Conference on Computer and Communications Security,\
  Nov 3-5, 1993, Fairfax, Virginia.
- \[*Patent*\] r<sup>3</sup> Security Engineering AG (assignee),\
  "Digital signature method and key agreement method,"\
  <a href="http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&amp;Sect2=HITOFF&amp;d=PALL&amp;p=1&amp;u=/netahtml/srchnum.htm&amp;r=1&amp;f=G&amp;l=50&amp;s1=%275600725%27.WKU.&amp;OS=PN/5600725&amp;RS=PN/5600725" target="_blank">U.S. Patent 5,600,725</a>, filed August 17 1994, issued February 4 1997.
- \[*An*\] E. El Mahassni, Phong Nguyen, Igor Shparlinski,\
  "The Insecurity of Nyberg-Rueppel and Other DSA-Like Signature Schemes with Partially Known Nonces,\
  To appear in Proceedings of Cryptography and Lattices Conference, CaLC 2001 (J.H. Silverman, ed.)\
  Volume 2146 of Lecture Notes in Computer Science, pp. 97-109. Springer-Verlag, 2001.\
  <a href="http://www.comp.mq.edu.au/~igor/Publ.html" target="_blank">http://www.comp.mq.edu.au/~igor/Publ.html</a>

**Comment:**  
It is recommended that implementations make no practical restriction on the lengths of the key parameters *p*, *q*, *g* and *x* (in particular, values of *p* up to at least 4096 bits SHOULD be supported).

**Security Comment:**  
To prevent the attacks by Nguyen and Shparlinski, the random nonces generated for each signature must be independent and uniformly distributed.

**Patent status:**  
r<sup>3</sup> Security Engineering (now merged with [Entrust Technologies](http://www.entrust.com/)) is the assignee of a patent on the Nyberg-Rueppel signature scheme. Certicom Corp., in a <a href="http://grouper.ieee.org/groups/1363/P1363/letters/Certicom.txt" target="_blank">letter to the IEEE P1363 Chair</a>, claims to have the exclusive North American license rights to this patent.

<span id="RSA"></span>

------------------------------------------------------------------------

RSA/*encoding*

Signature

**Designers:**  
<a href="http://theory.lcs.mit.edu/~rivest/" target="_blank">Ron Rivest</a>, Adi Shamir, Leonard Adelman

**Aliases:**  
- "RSASSA", "1.2.840.113549.1.1.1"
- "SHA1withRSA" is an alias to "RSA/PKCS1-1.5(SHA-1)" (for JCA 1.2 compatibility).
- "RIPEMD160withRSA" is an alias to "RSA/PKCS1-1.5(RIPEMD-160)" (for JCA 1.2 compatibility).
- "MD5withRSA" is an alias to "RSA/PKCS1-1.5(MD5)" (for JCA 1.2 compatibility).
- "MD2withRSA" is an alias to "RSA/PKCS1-1.5(MD2)" (for JCA 1.2 compatibility).
- "rsa-pkcs1-sha1" is an alias to "RSA/PKCS1-1.5(SHA-1)" (for SPKI support).
- "rsa-pkcs1-md5" is an alias to "RSA/PKCS1-1.5(MD5)" (for SPKI support).
- "http://www.w3.org/2000/02/xmldsig#rsa-sha1" is an alias to "RSA/PKCS1-1.5(SHA-1)" (for DSIG support).
- "SHA/RSA", "SHA-1/RSA", "SHA/RSA/PKCS#1", and "SHA-1/RSA/PKCS#1" are deprecated aliases to "RSA/PKCS1-1.5(SHA-1)".
- "RIPEMD160/RSA", "RIPEMD-160/RSA", "RIPEMD160/RSA/PKCS#1" and "RIPEMD-160/RSA/PKCS#1" are deprecated aliases to "RSA/PKCS1-1.5(RIPEMD-160)".
- "MD5/RSA" and "MD5/RSA/PKCS#1" are deprecated aliases to "RSA/PKCS1-1.5(MD5)".
- "MD2/RSA" and "MD2/RSA/PKCS#1" are deprecated aliases to "RSA/PKCS1-1.5(MD2)".

**References:**  
- \[*Def*\] Ron Rivest, Adi Shamir, Leonard Adelman,\
  "A Method for Obtaining Digital Signatures and Public-Key Cryptosystems,"\
  MIT Laboratory for Computer Science and Department of Mathematics.\
  Communications of the ACM, February 1978, Volume 21, Number 2, pp. 120-126.
- \[*Def*\] PKCS \#1: RSA Encryption Standard,\
  An RSA Laboratories Technical Note, Version 1.5. Revised November 1, 1993.\
  <a href="ftp://ftp.rsa.com/pub/pkcs/ascii/pkcs-1.asc" target="_blank">ftp://ftp.rsa.com/pub/pkcs/ascii/pkcs-1.asc</a>
- \[*Inf*\] Bruce Schneier,\
  "Section 19.3 RSA,"\
  Applied Cryptography, Second Edition, John Wiley & Sons, 1996.
- \[*Patent*\] R. Rivest, A. Shamir, L.M. Adelman,\
  "Cryptographic Communications System and Method,"\
  <a href="http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&amp;Sect2=HITOFF&amp;d=PALL&amp;p=1&amp;u=/netahtml/srchnum.htm&amp;r=1&amp;f=G&amp;l=50&amp;s1=%274405829%27.WKU.&amp;OS=PN/4405829&amp;RS=PN/4405829" target="_blank">U.S. Patent 4,405,829</a>, filed December 14 1977, issued September 20 1983.
- \[*Test*\] IEEE,\
  Test Vectors for Std 1363-2000.\
  <a href="http://grouper.ieee.org/groups/1363/P1363/testvector.txt" target="_blank">http://grouper.ieee.org/groups/1363/P1363/testvector.txt</a>\
  \[for RSA/EMSA2(SHA-1)\]

**Comment:**  
It is recommended that implementations make no practical restriction on the lengths of the key parameters *n* and *e* (in particular, values of *n* up to at least 4096 bits SHOULD be supported).

**Patent status:**  
RSA was previously patented in the United States and Canada; the patent has now expired.

<span id="RSA2"></span>

------------------------------------------------------------------------

RSA2/*encoding*

Signature

**Designers:**  
<a href="http://theory.lcs.mit.edu/~rivest/" target="_blank">Ron Rivest</a>, Adi Shamir, Leonard Adelman

**Description:**  
The variant of RSA defined by the IFSP-RSA2 and IFVP-RSA2 primitives from IEEE Std 1363-2000. If the modulus is *n* and the output of a normal RSA private key operation is *t*, then the output of the corresponding operation for this algorithm is min(*t*, *n*-*t*).

This variant of RSA is normally used only with the EMSA2 encoding method, and only for compatibility with ISO/IEC 9796:1991.

**References:**  
- \[*Def*\] IEEE,\
  IEEE Std 1363-2000: Standard Specifications For Public Key Cryptography.\
  <a href="http://grouper.ieee.org/groups/1363/index.html" target="_blank">http://grouper.ieee.org/groups/1363/index.html</a>
- \[*Inf*\] ISO/IEC 9796:1991,\
  "Information Technology - Security Techniques - Digital signature scheme giving message recovery."
- \[see references for [RSA](#RSA)\]

**Comment:**  
\[see comment for [RSA](#RSA)\]

**Patent status:**  
RSA was previously patented in the United States and Canada; the patent has now expired.

<span id="RW"></span>

------------------------------------------------------------------------

RW/*encoding*

Signature

**Designer:**  
Michael O. Rabin, Hugh C. Williams

**Description:**  
The Rabin-Williams signature scheme as defined in IEEE Std 1363-2000.

**References:**  
- \[*Def*\] IEEE,\
  IEEE Std 1363-2000: Standard Specifications For Public Key Cryptography.\
  <a href="http://grouper.ieee.org/groups/1363/index.html" target="_blank">http://grouper.ieee.org/groups/1363/index.html</a>
- \[*Inf*\] Michael O. Rabin,\
  "Digitalized Signatures and Public Key Functions as Intractable as Factorization,"\
  MIT Laboratory for Computer Sciences Tech Report 212, January 1979.\
  <a href="http://hdl.handle.net/ncstrl.mit_lcs/MIT/LCS/TR-212" target="_blank">hdl:ncstrl.mit_lcs/MIT/LCS/TR-212</a>
- \[*Inf*\] Hugh C. Williams,\
  "A Modification of the RSA Public-key Encryption Procedure,"\
  IEEE Transactions on Information Theory 26, pp. 726-729, 1980.

**Comments:**  
It is recommended that implementations make no practical restriction on the length of the key parameter *n* (in particular, values of *n* up to at least 4096 bits SHOULD be supported).

------------------------------------------------------------------------

## <span id="sem">Signature Encoding Methods</span>

Note that any parameters required by Signature Encoding Methods are set and retrieved by calling `set/getParameter` on the Signature object, since there is not necessarily any object explicitly representing the encoding method.

<span id="sem_EMSA1"></span>

------------------------------------------------------------------------

EMSA1(*digest*)

Signature Encoding Method

**Description:**  
The encoding scheme described as "EMSA1" in IEEE Std 1363-2000.

**References:**  
- \[*Def*\] IEEE,\
  IEEE Std 1363-2000: Standard Specifications For Public Key Cryptography.\
  <a href="http://grouper.ieee.org/groups/1363/index.html" target="_blank">http://grouper.ieee.org/groups/1363/index.html</a>
- \[*Inf*\] U.S. National Institute of Standards and Technology,\
  "Digital Signature Standard (DSS),"\
  NIST FIPS PUB 186-2,\
  U.S. Department of Commerce.\
  <a href="http://csrc.nist.gov/fips/fips186-2.pdf" target="_blank">http://csrc.nist.gov/fips/fips186-2.pdf</a>
- \[*Test*\] IEEE,\
  Test Vectors for Std 1363-2000.\
  <a href="http://grouper.ieee.org/groups/1363/P1363/testvector.txt" target="_blank">http://grouper.ieee.org/groups/1363/P1363/testvector.txt</a>\
  \[for DSA-1363/EMSA1(SHA-1)\]

**Parameters:**  
- `String digest` \[creation, no default\] - the name of the message digest that is to be used to calculate the message representative. The only message digest algorithms for which this encoding method is defined are SHA-1 and RIPEMD-160.

**Comment:**  
EMSA1(SHA-1) is compatible with the encoding used for DSA in FIPS 186, and for ECDSA in X9.62 and FIPS 186-2.

**Security comment:**  
The message representatives output by this encoding method do not contain any specification of which message digest algorithm was used. Therefore, unless public keys are certified in such a way that each key is tied to use of only one digest algorithm, there is the risk of a collision between different algorithms (i.e. Hash1(X) == Hash2(Y) for distinct algorithms Hash1 and Hash2, and messages X and Y). To reduce the possibility of such collisions, implementations of this encoding MUST NOT support message digests other than SHA-1 and RIPEMD-160, and application designers are strongly advised to use only SHA-1 for the digest, if they use this encoding method.

<span id="sem_EMSA2"></span>

------------------------------------------------------------------------

EMSA2(*digest*)

Signature Encoding Method

**Description:**  
The encoding scheme described as "EMSA2" in IEEE Std 1363-2000, based on ANSI-X9.31. This should be capable of being used with both the RSA and RSA2 signature primitives.

**Alias:**  
"X9.31"

**References:**  
- \[*Def*\] IEEE,\
  IEEE Std 1363-2000: Standard Specifications For Public Key Cryptography.\
  <a href="http://grouper.ieee.org/groups/1363/index.html" target="_blank">http://grouper.ieee.org/groups/1363/index.html</a>
- \[*Inf*\] Accredited Standards Committee X9, American Bankers Association,\
  ANSI X9.31-1998: Digital Signatures Using Reversible Public Key Cryptography for the Financial Services Industry (rDSA).
- \[*Inf*\] U.S. National Institute of Standards and Technology,\
  "Digital Signature Standard (DSS),"\
  NIST FIPS PUB 186-2,\
  U.S. Department of Commerce.\
  <a href="http://csrc.nist.gov/fips/fips186-2.pdf" target="_blank">http://csrc.nist.gov/fips/fips186-2.pdf</a>
- \[*Test*\] IEEE,\
  Test Vectors for Std 1363-2000.\
  <a href="http://grouper.ieee.org/groups/1363/P1363/testvector.txt" target="_blank">http://grouper.ieee.org/groups/1363/P1363/testvector.txt</a>\
  \[for RSA/EMSA2(SHA-1)\]

**Parameters:**  
- `String digest` \[creation, no default\] - the name of the message digest that is to be used to calculate the message representative. The only message digest algorithms for which this encoding method is defined are SHA-1 and RIPEMD-160.

<span id="sem_EMSA5-MGF1"></span>

------------------------------------------------------------------------

× <span class="x">EMSA5-MGF1</span>(*digest*)

Signature Encoding Method

**Designers:**  
Eiichiro Fujisaki, Tatsuaki Okamoto

**Description:**  
The "EMSA5" encoding defined in the IEEE P1363a draft standard, with the MGF1 Mask Generation Function. This encoding method is intended only for use with [ESIGN](#ESIGN).

**References:**  
- \[*Def*\] IEEE,\
  "Draft Standard Specifications for Public Key Cryptography Amendment 1: Additional Techniques,"\
  <a href="http://grouper.ieee.org/groups/1363/index.html" target="_blank">http://grouper.ieee.org/groups/1363/index.html</a>
- \[*Inf, An, Test, Impl, Patent*\] Nippon Telegraph and Telephone Corporation,\
  ESIGN Signatures Homepage,\
  <a href="http://info.isl.ntt.co.jp/esign" target="_blank">http://info.isl.ntt.co.jp/esign</a> and\
  <a href="http://www.nttmcl.com/sec/Esign/esign.html" target="_blank">http://www.nttmcl.com/sec/Esign/esign.html</a>

**Parameters:**  
- `String digest` \[creation, no default\] - the name of the message digest to be used. This is used both to calculate the message representative, and as the underlying digest for MGF1.

<span id="sem_PKCS1-1.5"></span>

------------------------------------------------------------------------

PKCS1-1.5(*digest*)

Signature Encoding Method

**Designers:**  
<a href="http://www.rsasecurity.com/" target="_blank">RSA Data Security, Inc.</a>

**Description:**  
Block type 01, described in section 10.1 of PKCS \#1 v1.5.

**Aliases:**  
"PKCS#1", "EMSA-PKCS1-v1_5", "EMSA3"

**References:**  
- \[*Def*\] PKCS \#1: RSA Encryption Standard,\
  An RSA Laboratories Technical Note, Version 1.5. Revised November 1, 1993.\
  <a href="ftp://ftp.rsa.com/pub/pkcs/ascii/pkcs-1.asc" target="_blank">ftp://ftp.rsa.com/pub/pkcs/ascii/pkcs-1.asc</a>
- \[*Inf*\] RSA Security, Inc.,\
  PKCS \#1: RSA Cryptography Standard, version 2.0.\
  <a href="http://www.rsalabs.com/pkcs/pkcs-1/" target="_blank">http://www.rsalabs.com/pkcs/pkcs-1/</a>

**Parameters:**  
- `String digest` \[creation, no default\] - the name of the message digest that is to be used to calculate the message representative. Only message digests for which an ASN.1 OBJECT IDENTIFIER has been defined, may be used (see comment below).

**Comments:**  
- Some existing implementations of PKCS \#1 only support moduli that are a multiple of 8 bits in length. The standard in fact makes no such restriction, and SCAN requires that bit lengths that are not a multiple of 8 MUST be supported.
- The DER encoding of an ASN.1 DigestInfo object used to construct message representatives can be found by prepending a fixed sequence of bytes to the digest result (this is much simpler than implementing generalised DER encoding). For commonly used message digest functions, the byte sequences to be prepended (in hexadecimal) are as follows:
  **MessageDigest**
  **Sequence**
  MD2
  `30 20 30 0C 06 08 2A 86 48 86 F7 0D 02 02 05 00 04 10`
  MD5
  `30 20 30 0C 06 08 2A 86 48 86 F7 0D 02 05 05 00 04 10`
  SHA-1
  `30 21 30 09 06 05 2B 0E 03 02 1A 05 00 04 14`
  RIPEMD-160
  `30 21 30 09 06 05 2B 24 03 02 01 05 00 04 14`
  Tiger(24,3)
  `30 29 30 0D 06 09 2B 06 01 04 01 DA 47 0C 02 05 00 04 18`
  SHA-256
  `30 31 30 0D 06 09 60 86 48 01 65 03 04 02 01 05 00 04 20`
  SHA-384
  `30 41 30 0D 06 09 60 86 48 01 65 03 04 02 02 05 00 04 30`
  SHA-512
  `30 51 30 0D 06 09 60 86 48 01 65 03 04 02 03 05 00 04 40`
  An implementation of PKCS1-1.5 encoding MUST allow for at least the message digests listed above to be used (although the same provider need not implement these digests). This is an incompatible change from SCAN 1.0.12-14, where Tiger(24,3) and SHA-{256,384,512} were not required. There was an error in the byte sequence for SHA-1 in SCAN 1.0.12.
- The EMSA alias for this encoding method changed from EMSA4 in earlier drafts of IEEE P1363a, to EMSA3.

<span id="sem_PSS-MGF1"></span>

------------------------------------------------------------------------

× <span class="x">PSS-MGF1</span>(*digest*)

Signature Encoding Method

**Designers:**  
<a href="http://www-cse.ucsd.edu/users/mihir/" target="_blank">Mihir Bellare</a>, <a href="http://www.cs.ucdavis.edu/~rogaway/" target="_blank">Phillip Rogaway</a>

**Description:**  
Probably, the "EMSA-PSS" encoding defined in PKCS \#1 v2.1. Note that there are several incompatible versions of PSS, and it is not clear precisely which version will become standard.

**Aliases:**  
"EMSA-PSS"

**References:**  
- \[*Def*\] RSA Security, Inc.,\
  PKCS \#1: RSA Cryptography Standard, version 2.1 (draft).\
  <a href="http://www.rsalabs.com/pkcs/pkcs-1/" target="_blank">http://www.rsalabs.com/pkcs/pkcs-1/</a>
- \[*Inf*\] IEEE,\
  IEEE P1363a draft version 6 (D6).\
  <a href="http://grouper.ieee.org/groups/1363/P1363a/index.html" target="_blank">http://grouper.ieee.org/groups/1363/P1363a/index.html</a>
- \[*Inf*\] Mihir Bellare, Phillip Rogaway,\
  PSS: Provably Secure Encoding Method for Digital Signatures,\
  Submission to IEEE P1363a, August 1998.
- \[*Inf*\] Mihir Bellare, Phillip Rogaway,\
  "The Exact Security of Digital Signatures: How to Sign with RSA and Rabin,"\
  <a href="http://www-cse.ucsd.edu/users/mihir/papers/exactsigs.html" target="_blank">http://www-cse.ucsd.edu/users/mihir/papers/exactsigs.html</a>
- \[*An*\] Burt Kaliski,\
  "Hash Function Firewalls in Signature Schemes,"\
  Slides presented at IEEE P1363 Working Group Meeting, June 2, 2000 (revised June 8, 2000). <a href="http://grouper.ieee.org/groups/1363/Research/Presentations.html#hash" target="ext">http://grouper.ieee.org/groups/1363/Research/Presentations.html#hash</a>

**Parameters:**  
- `String digest` \[creation, no default\] - the name of the message digest that is to be used by the MGF1 mask generation function.

**Comments:**  
- \[\[TODO: check for differences between PKCS \#1 v2.1 draft and P1363a.\]\]

**Security comment:**  
\[\[Talk about hash function substitution attacks, and difference between P1363a D3 and D4.\]\]

**Patent status:**  
The University of California has a patent pending on PSS. It has stated, in a <a href="http://grouper.ieee.org/groups/1363/P1363/letters/UC.html" target="_blank">letter to the IEEE</a>, that:

> If PSS is included in an IEEE standard, the University of California will, when that standard is adopted, FREELY license any conforming implementation of PSS as a technique for achieving a digital signature with appendix. No registration fee or other administrative procedure will be required.

Note that this is different to the licensing position for PSSR.

<span id="sem_PSSR-MGF1"></span>

------------------------------------------------------------------------

× <span class="x">PSSR-MGF1</span>(*digest*)

Signature Encoding Method

**Designers:**  
<a href="http://www-cse.ucsd.edu/users/mihir/" target="_blank">Mihir Bellare</a>, <a href="http://www.cs.ucdavis.edu/~rogaway/" target="_blank">Phillip Rogaway</a>

**Description:**  
Probably, the "EMSA-PSSR" encoding defined in PKCS \#1 v2.1. Note that there are several incompatible versions of PSS, and it is not clear precisely which version will become standard.

**Aliases:**  
"EMSR-PSSR"

**References:**  
- \[*Def*\] Mihir Bellare, Phillip Rogaway,\
  PSS: Provably Secure Encoding Method for Digital Signatures,\
  Submission to IEEE P1363a, August 1998.
- \[*Inf*\] Mihir Bellare, Phillip Rogaway,\
  "The Exact Security of Digital Signatures: How to Sign with RSA and Rabin,"\
  <a href="http://www-cse.ucsd.edu/users/mihir/papers/exactsigs.html" target="_blank">http://www-cse.ucsd.edu/users/mihir/papers/exactsigs.html</a>

**Parameters:**  
- `String digest` \[creation, no default\] - the name of the message digest that is to be used by the MGF1 mask generation function.

**Patent status:**  
The University of California has a patent pending on PSSR. It has stated, in a <a href="http://grouper.ieee.org/groups/1363/P1363/letters/UC.html" target="_blank">letter to the IEEE</a>, that use of this technique will require a license to be acquired "under very reasonable terms and conditions". Note that this is different to the licensing position for PSS.

<span id="sem_SSL3"></span>

------------------------------------------------------------------------

? <span class="p">SSL3</span>

Signature Encoding Method

**Designers:**  
Netscape Communications Corp.

**Description:**  
The signature encoding method used for RSA in SSL version 3.0, consisting of MD5 and SHA-1 hashes, encoded using PKCS \#1 v1.5 block type 0.

**References:**  
- \[*Def*\] Netscape Communications Corp.,\
  SSL v3 specification,\
  <a href="http://www.netscape.com/eng/ssl3/" target="_blank">http://www.netscape.com/eng/ssl3/</a>

**Missing information:**  
Test vectors.

**Comment:**  
"RSA/SSL3" is equivalent to "RSA/EMSA1(Parallel(MD5,SHA-1))". It is defined as a separate algorithm because EMSA1 is not normally used with RSA.

<span id="sem_TLS"></span>

------------------------------------------------------------------------

? <span class="p">TLS</span>

Signature Encoding Method

**Designers:**  
Netscape Communications Corp., IETF Transport Layer Security Working Group

**Description:**  
The signature encoding method used for RSA in TLS, consisting of MD5 and SHA-1 hashes, encoded using PKCS \#1 v1.5 block type 1. Block type 0 MUST also be accepted when verifying a signature.

**References:**  
- \[*Def*\] T. Dierks, C. Allen,\
  "The TLS Protocol Version 1.0,"\
  <a href="ftp://ftp.isi.edu/in-notes/rfc2246.txt" target="_blank">RFC 2246</a>, January 1999.

**Missing information:**  
Test vectors.

**Comment:**  
For generation of signatures, "RSA/TLS" is equivalent to "RSA/PKCS1-1.5(Parallel(MD5,SHA-1))". It is defined as a separate algorithm because it also accepts PKCS \#1 block type 0 on verification.

<span id="sem_Raw"></span>

------------------------------------------------------------------------

Raw

Signature Encoding Method

**Description:**  
A "null" encoding method, that passes its input directly to the underlying primitive. The block length is as large as necessary to ensure that all inputs to the public key primitive are possible (and no larger). This usually means that some block contents will not be valid; these will cause the signature to be rejected when the Signature object's `verify` method is called, or an `IllegalArgumentException` to be thrown when the `sign` method is called.

**Security comment:**  
There are many attacks possible on public key signature algorithms when this encoding method is used. It is intended only as a way to obtain access to a public key primitive (for those providers that support it), in order to implement encoding methods at the application rather than the provider level, or to maintain compatibility with legacy protocols.

------------------------------------------------------------------------

## <span id="sof">Output Formats</span>

<span id="sof_1363"></span>

------------------------------------------------------------------------

1363

Output Format

**Description:**  
Where there are several possible output formats for a signature algorithm, this name indicates that the alternative consistent with IEEE Std 1363-2000 Annex E must be used.

The convention used by 1363 for formatting more than one arbitrary-length integer, is to concatenate their big-endian unsigned representations. Each integer is padded on the left with zeroes, to the length defined by the algorithm parameters (for example if an integer is in the range 0..*n*-1, the result will have the same number of bytes as is needed to represent *n*-1). The signature algorithm is assumed to specify a canonical order for the integers.

To parse this format, the receiver must split it into blocks of the correct lengths (usually equal), one for each integer. If this cannot be done, the signature MUST be treated as invalid.

<span id="sof_DER"></span>

------------------------------------------------------------------------

DER

Output Format

**Description:**  
Where there are several possible output formats for a signature algorithm, this name indicates that the DER-encoded alternative must be used.

The type used to DER-encode more than one arbitrary-length integer, is SEQUENCE { INTEGER a, INTEGER b, ... }. The signature algorithm is assumed to specify a canonical order for the integers.

To parse this format, the receiver must always interpret it as DER, not BER. If the signature is not a DER encoding of the correct type, it MUST be treated as invalid.

<span id="sof_OpenPGP"></span>

------------------------------------------------------------------------

OpenPGP

Output Format

**Description:**  
Where there are several possible output formats for a signature algorithm, this name indicates that the alternative specified by OpenPGP must be used.

The convention used by OpenPGP for formatting more than one arbitrary-length integer, is to encode each integer as a two-byte big-endian length field indicating the bit length of the integer, followed by the bytes of the integer in big-endian order, with no leading zeroes (see section 3.2 of RFC 2440). The signature algorithm is assumed to specify a canonical order for the integers.

When parsing this format, if the length fields are inconsistent with the total length of the signature, it MUST be treated as invalid.

**References:**  
- \[*Def*\] Jon Callas, Lutz Donnerhacke, Hal Finney, Rodney Thayer\
  "OpenPGP Message Format,"\
  <a href="ftp://ftp.isi.edu/in-notes/rfc2440.txt" target="_blank">RFC 2440</a>, November 1998.

------------------------------------------------------------------------

<img src="cryptix-s.gif" data-align="right" />

<a href="http://validator.w3.org/check/referer" target="_blank"><img src="vh40.gif" data-border="0" width="88" height="31" alt="Valid HTML 4.0" /></a> <a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank"><img src="vcss.gif" data-border="0" width="88" height="31" alt="Valid CSS" /></a>

[Copyright and trademarks](intro.html#copyright)
