---
title: "Standard Cryptographic Algorithm Naming"
source_domain: amasci.com
source_path: ~weidai/scan-mirror/ca.html
order: 9930
reachable_from_entry: false
images: 3
internal_links: 1
extracted: 2026-08-07T17:18:16Z
extractor: site_to_paper.py (pandoc)
---

# Standard Cryptographic Algorithm Naming

*Source page: `~weidai/scan-mirror/ca.html`*

## Asymmetric Ciphers

Where an asymmetric cipher requires an encoding method in order to be specified completely, the naming convention is "*encryption-primitive*/*encryption-encoding*".

Some existing JCE providers will accept the use of a block cipher mode and padding with an asymmetric cipher (e.g. "RSA/CBC/PKCS#7"); this is not recommended, and new providers MUST reject this usage. An encryption primitive name on its own (e.g. "RSA", as opposed to a complete encryption scheme such as "DLIES-ISO(...)") SHOULD also be rejected.

All of the algorithms defined here use either modular exponentiation or elliptic curve multiplication, which are potentially vulnerable to timing attacks. See the following paper for details and possible countermeasures:

- \[*An*\] Paul Kocher,\
  "Timing Attacks on Implementations of Diffie-Hellman, RSA, DSS, and Other Systems,"\
  <a href="http://www.cryptography.com/timingattack/paper.html" target="_blank">http://www.cryptography.com/timingattack/paper.html</a>

Generally, even if the same key pair can be used for different algorithms, this should not be done, since it will invalidate any security proofs associated with the algorithms and may permit attacks. This requirement can be achieved by associating an unambiguous specification of the algorithm with the public key when it is included in a certificate, or otherwise authenticated.

<span id="DLIES-ISO"></span>

------------------------------------------------------------------------

× <span class="x">DLIES-ISO</span>(*prf,dem*)

Asymmetric Cipher Construction

**Designers:**  
Michel Abdalla, <a href="http://www-cse.ucsd.edu/users/mihir/" target="_blank">Mihir Bellare</a>, <a href="http://www.cs.ucdavis.edu/~rogaway/" target="_blank">Phillip Rogaway</a>

**Published:**  
August 1998, updated March 1999

**Description:**  
\[\[DLIES-compatible scheme from Shoup's ISO paper, restricted to secure options.\]\] Public and private keys belong to the "DH" key family.

**References:**  
- \[*An*\] Victor Shoup,\
  "A Proposal for an ISO Standard for Public Key Encryption (version 2.1)"\
  Revised December 20, 2001.\
  <a href="http://www.shoup.net/papers/" target="_blank">http://www.shoup.net/papers/</a>
- \[*Inf, An*\] Michel Abdalla, Mihir Bellare, Phillip Rogaway,\
  DHAES: An Encryption Scheme Based on the Diffie-Hellman Problem,\
  Contribution to IEEE P1363a,\
  Updated version, March 1999.\
  <a href="http://grouper.ieee.org/groups/1363/P1363a/Encryption.html#ABR" target="_blank">http://grouper.ieee.org/groups/1363/P1363a/Encryption.html#ABR</a>
- \[*Inf, An*\] Michel Abdalla, Mihir Bellare, Phillip Rogaway,\
  DHAES: An Encryption Scheme Based on the Diffie-Hellman Problem,\
  Theory of Cryptography Library.\
  <a href="http://philby.ucsd.edu/cryptolib/1999/99-07.html" target="_blank">http://philby.ucsd.edu/cryptolib/1999/99-07.html</a>\
  \[\[update reference to eprint.iacr.org version\]\]

**Parameters:**  
- \[\[TBD\]\]

**Comments:**  
- It is recommended that implementations make no practical restriction on the lengths of the key parameters. In particular, values of *p* (the prime modulus) up to at least 4096 bits SHOULD be supported.
- This algorithm replaces, but is not compatible with, DL-DHAES in SCAN 1.0.17 and earlier.

**Security comments:**  
- DLIES-ISO has been proven semantically secure and non-malleable, under the "Hash Diffie-Hellman Assumption" (that is, the assumption that the Diffie-Hellman Problem is hard when a hash function is used to derive keys from the shared secret), and that the MAC and symmetric cipher algorithms are secure. See the Abdalla/Bellare/Rogaway paper for details.

<span id="ECIES-ISO"></span>

------------------------------------------------------------------------

× <span class="x">ECIES-ISO</span>(*prf,dem*)

Asymmetric Cipher Construction

**Designers:**  
Michel Abdalla, <a href="http://www-cse.ucsd.edu/users/mihir/" target="_blank">Mihir Bellare</a>, <a href="http://www.cs.ucdavis.edu/~rogaway/" target="_blank">Phillip Rogaway</a>

**Published:**  
August 1998, updated March 1999

**Description:**  
\[\[ECIES-compatible scheme from Shoup's ISO paper, restricted to secure options.\]\] Public and private keys belong to the "ECDH" key family.

**References:**  
- \[*An*\] Victor Shoup,\
  "A Proposal for an ISO Standard for Public Key Encryption (version 2.1)"\
  Revised December 20, 2001.\
  <a href="http://www.shoup.net/papers/" target="_blank">http://www.shoup.net/papers/</a>
- \[*Inf, An*\] Michel Abdalla, Mihir Bellare, Phillip Rogaway,\
  DHAES: An Encryption Scheme Based on the Diffie-Hellman Problem,\
  Contribution to IEEE P1363a,\
  Updated version, March 1999.\
  <a href="http://grouper.ieee.org/groups/1363/P1363a/Encryption.html#ABR" target="_blank">http://grouper.ieee.org/groups/1363/P1363a/Encryption.html#ABR</a>
- \[*Inf, An*\] Michel Abdalla, Mihir Bellare, Phillip Rogaway,\
  DHAES: An Encryption Scheme Based on the Diffie-Hellman Problem,\
  Theory of Cryptography Library.\
  <a href="http://philby.ucsd.edu/cryptolib/1999/99-07.html" target="_blank">http://philby.ucsd.edu/cryptolib/1999/99-07.html</a>\
  \[\[update reference to eprint.iacr.org version\]\]

**Parameters:**  
- \[\[TBD\]\]

**Comments:**  
- \[\[what options for EC parameters should be supported?\]\]
- This algorithm replaces, but is not compatible with, EC-DHAES in SCAN 1.0.17 and earlier.

**Security comments:**  
- ECIES-ISO has been proven semantically secure and non-malleable, under the "Hash Elliptic Curve Diffie-Hellman Assumption" (that is, the assumption that the Elliptic Curve Diffie-Hellman Problem is hard when a hash function is used to derive keys from the shared secret), and that the MAC and symmetric cipher algorithms are secure. See the Abdalla/Bellare/Rogaway paper for details.

<span id="ElgamalEnc"></span>

------------------------------------------------------------------------

ElgamalEnc/*encoding*

Asymmetric Cipher

**Designer:**  
Taher Elgamal

**References:**  
- \[*Def*\] Taher Elgamal,\
  "A Public-Key Cryptosystem and a Signature Scheme Based on Discrete Logarithms,"\
  IEEE Transactions on Information Theory, v. IT-31, n. 4, 1985, pp. 469-472, or\
  Advances in Cryptology - CRYPTO '84, pp. 10-18, Springer-Verlag, 1985.
- \[*Inf*\] Bruce Schneier,\
  "Section 19.6 ElGamal,"\
  Applied Cryptography, Second Edition, John Wiley & Sons, 1996.
- \[*An*\] Y. Tsiounis, M. Yung,\
  "On the security of ElGamal-based encryption,"\
  1998 International Workshop on Practice and Theory in Public Key Cryptography (PKC '98), February 5-6, Yokohama, Japan.\
  <http://www.ccs.neu.edu/home/yiannis/papers/eg.ps>

**Comments:**  
- Taher Elgamal currently spells his name, and the name of this algorithm with a lowercase 'g'.
- The reason for choosing separate names "ElgamalEnc" and "ElgamalSig", for Elgamal encryption and signatures respectively, is that ElgamalEnc keys can use the "DH" key family, while ElgamalSig requires its own key family (because Elgamal signature keys have additional security constraints).
- It is recommended that implementations make no practical restriction on the lengths of the key parameters *p*, *g* and *x* (in particular, values of *p* up to at least 4096 bits SHOULD be supported).

<span id="RSA"></span>

------------------------------------------------------------------------

RSA/*encoding*

Asymmetric Cipher

**Designers:**  
<a href="http://theory.lcs.mit.edu/~rivest/" target="_blank">Ron Rivest</a>, Adi Shamir, Leonard Adelman

**Aliases:**  
"RSAES", "1.2.840.113549.1.1.1", "2.5.8.1.1"

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
- \[*An*\] Don Coppersmith, Matthew K. Franklin, Jacques Patarin, Michael K. Reiter,\
  "Low-Exponent RSA with Related Messages,"\
  Advances in Cryptology - EUROCRYPT '96 Proceedings, Volume 1070 of Lecture Notes in Computer Science (U. Maurer, ed.), pp. 1-9. Springer-Verlag, 1996.\
  <http://www.bell-labs.com/user/reiter/#Lowexp>
- \[*An*\] Dan Boneh,\
  "Twenty Years of Attacks on the RSA Cryptosystem,"\
  Notices of the American Mathematical Society (AMS), Vol. 46, No. 2, pp. 203-213, 1999.\
  <a href="http://crypto.stanford.edu/~dabo/abstracts/RSAattack-survey.html" target="_blank">http://crypto.stanford.edu/~dabo/abstracts/RSAattack-survey.html</a>

**Comment:**  
It is recommended that implementations make no practical restriction on the lengths of the key parameters *n* and *e* (in particular, values of *n* up to at least 4096 bits SHOULD be supported).

**Patent status:**  
RSA is patented in the United States and Canada (see references); the patent is licensed by [RSA Data Security, Inc.](http://www.rsasecurity.com)

------------------------------------------------------------------------

## <span id="cem">Asymmetric Cipher Encoding Methods</span>

Note that any parameters required by Asymmetric Cipher Encoding Methods are set and retrieved by calling `set/getParameter` on the Cipher object, since there is not necessarily any object explicitly representing the encoding method.

<span id="cem_OAEP-MGF1"></span>

------------------------------------------------------------------------

OAEP-MGF1(*digest*)

Asymmetric Cipher Encoding Method

**Designers:**  
<a href="http://www-cse.ucsd.edu/users/mihir/" target="_blank">Mihir Bellare</a>, <a href="http://www.cs.ucdavis.edu/~rogaway/" target="_blank">Phillip Rogaway</a>

**Description:**  
Optimal Asymmetric Encryption Padding with Mask Generation Function 1, as specified in PKCS \#1 v2.0 and IEEE Std 1363-2000.

**Alias:**  
"EME-OAEP", "EME1"

**References:**  
- \[*Def*\] RSA Security, Inc.,\
  PKCS \#1: RSA Cryptography Standard, version 2.0.\
  <a href="http://www.rsalabs.com/pkcs/pkcs-1/" target="_blank">http://www.rsalabs.com/pkcs/pkcs-1/</a>
- \[*Inf*\] IEEE,\
  IEEE Std 1363-2000: Standard Specifications For Public Key Cryptography.\
  <a href="http://grouper.ieee.org/groups/1363/index.html" target="_blank">http://grouper.ieee.org/groups/1363/index.html</a>
- \[*Inf*\] M. Bellare, P. Rogaway,\
  Optimal asymmetric encryption -- How to encrypt with RSA,\
  Extended abstract in Advances in Cryptology - EuroCrypt '94 Proceedings,\
  Volume 950 of Lecture Notes in Computer Science (A. De Santis, ed.), Springer-Verlag, 1995.\
  Full paper of revised version:\
  <a href="http://www-cse.ucsd.edu/users/mihir/papers/pke.html#oae-paper" target="_blank">http://www-cse.ucsd.edu/users/mihir/papers/pke.html#oae-paper</a>
- \[*An*\] Victor Shoup,\
  "OAEP Reconsidered,"\
  Revised version, December 1 2000.\
  <a href="http://eprint.iacr.org/2000/060" target="_blank">http://eprint.iacr.org/2000/060</a>
- \[*An*\] Eiichiro Fujisaki, Tatsuaki Okamoto, David Pointcheval, Jacques Stern,\
  "RSA-OAEP is Still Alive!"\
  December 4 2000.\
  <a href="http://eprint.iacr.org/2000/061" target="_blank">http://eprint.iacr.org/2000/061</a>
- \[*An*\] Victor Shoup,\
  "A Proposal for an ISO Standard for Public Key Encryption (version 2.1)"\
  Revised December 20, 2001.\
  <a href="http://www.shoup.net/papers/" target="_blank">http://www.shoup.net/papers/</a>
- \[*Test*\] RSA Security, Inc.,\
  Test vectors for OAEP-based encryption scheme: \#1 and \#2,\
  <a href="ftp://ftp.rsasecurity.com/pub/pkcs/pkcs-1v2/p1ovect1.txt" target="_blank">ftp://ftp.rsasecurity.com/pub/pkcs/pkcs-1v2/p1ovect1.txt</a>\
  <a href="ftp://ftp.rsasecurity.com/pub/pkcs/pkcs-1v2/p1ovect2.txt" target="_blank">ftp://ftp.rsasecurity.com/pub/pkcs/pkcs-1v2/p1ovect2.txt</a>\
  \[for RSA/OAEP-MGF1(SHA-1)\]
- \[*Test*\] Hans Dobbertin, Antoon Bosselaers, Bart Preneel,\
  The RIPEMD-160 page,\
  OAEP-encoding based on RIPEMD-160: test vectors,\
  <a href="http://www.esat.kuleuven.ac.be/~bosselae/ripemd160.html#mgf1" target="_blank">http://www.esat.kuleuven.ac.be/~bosselae/ripemd160.html#mgf1</a>\
  \[for OAEP-MGF1(RIPEMD-160)\]

**Parameters:**  
- `String digest` \[creation, no default\] - the name of the message digest that is to be used by the MGF1 mask generation function.
- `byte[] parameters` \[write, default zero-length array\] - a byte array containing parameters to be used by the OAEP encoding operation. This corresponds to the byte string P in PKCS #1 v2.0 and IEEE Std 1363-2000.\
  The implementation may or may not copy the contents of arrays used to set this parameter. If any such array is subsequently changed, the output of the encoding method is undefined (it is therefore the responsibility of the caller to make sure that a reference to this array is not accessible to untrusted code). Setting this parameter will ***not*** reset the current key.

**Comments:**  
The 'digestName' and 'diversifier' parameters in SCAN 1.0.16 have been renamed 'digest' and 'parameters' respectively. This is an incompatible change.

**Security comments:**  
The original security proof that OAEP converts any trapdoor-one-way function into an encryption scheme that is secure under adaptive chosen ciphertext attack (IND-CCA2), is flawed (see the "OAEP Reconsidered" paper). The "RSA-OAEP is Still Alive!" paper shows that RSA-OAEP can still be proven IND-CCA2-secure for the RSA function, but with a reduction that is less tight. See Shoup's ISO paper for further discussion.

<span id="cem_KEM"></span>

------------------------------------------------------------------------

× <span class="x">KEM</span>(*prf,dem*)

Asymmetric Cipher Encoding Method

**Designers:**  
<a href="http://www.shoup.net/" target="_blank">Victor Shoup</a>

**Description:**  
\[\[TBD\]\]

**References:**  
- \[*An*\] Victor Shoup,\
  "A Proposal for an ISO Standard for Public Key Encryption (version 2.1)"\
  Revised December 20, 2001.\
  <a href="http://www.shoup.net/papers/" target="_blank">http://www.shoup.net/papers/</a>

**Parameters:**  
- \[\[TBD\]\]

<span id="cem_PKCS1-1.5"></span>

------------------------------------------------------------------------

PKCS1-1.5

Asymmetric Cipher Encoding Method

**Designers:**  
<a href="http://www.rsasecurity.com/" target="_blank">RSA Data Security, Inc.</a>

**Description:**  
Block type 02, described in section 8 of PKCS \#1 v1.5.

**Aliases:**  
"PKCS#1", "PKCS1Padding", "EME-PKCS1-v1_5"

**References:**  
- \[*Def*\] PKCS \#1: RSA Encryption Standard,\
  An RSA Laboratories Technical Note, Version 1.5. Revised November 1, 1993.\
  <a href="ftp://ftp.rsa.com/pub/pkcs/ascii/pkcs-1.asc" target="_blank">ftp://ftp.rsa.com/pub/pkcs/ascii/pkcs-1.asc</a>
- \[*Inf*\] Burt Kaliski, Jessica Staddon,\
  PKCS \#1: RSA Cryptography Specifications, Version 2.0\
  Internet draft, July 1998.
- \[*An*\] Daniel Bleichenbacher, Burt Kaliski, Jessica Staddon,\
  RSA Laboratories Security Bulletin No. 7: Recent Results on PKCS \#1: RSA Encryption Standard, June 26, 1998.\
  <a href="ftp://ftp.rsa.com/pub/pdfs/bulletn7.pdf" target="_blank">ftp://ftp.rsa.com/pub/pdfs/bulletn7.pdf</a>
- \[*An*\] Daniel Bleichenbacher,\
  "Chosen Ciphertext Attacks against Protocols Based on RSA Encryption Standard PKCS \#1,"\
  Advances in Cryptology - Crypto '98 Proceedings, Volume 1462 of Lecture Notes in Computer Science (H. Krawczyk ed.), pp 1-12. Springer-Verlag, 1998.\
  <http://www.bell-labs.com/user/bleichen/papers/pkcs.ps>

**Comment:**  
Some existing implementations of PKCS1-1.5 only support moduli that are a multiple of 8 bits in length. The standard in fact makes no such restriction, and SCAN requires that bit lengths that are not a multiple of 8 MUST be supported.

**Security comment:**  
The attack described in Bleichenbacher's paper relies on being able to determine whether decrypting a chosen ciphertext yields a valid PKCS1-1.5 block. Applications and protocols that use PKCS1-1.5 should therefore ensure that no information is leaked to an attacker (also taking into account timing differences and other potential side channels) about whether a decrypted block is valid.

It is recommended that new protocols use [OAEP-MGF1](#cem_OAEP-MGF1) or [KEM](#cem_KEM) in preference to PKCS1-1.5.

<span id="cem_Raw"></span>

------------------------------------------------------------------------

Raw

Asymmetric Cipher Encoding Method

**Description:**  
A "null" encoding method, that passes its input directly to the underlying primitive. The block length is as large as necessary to ensure that all inputs to the public key primitive are possible (and no larger). This usually means that some block contents will not be valid; these will cause an `IllegalArgumentException` when the Cipher object's `update` or `doFinal` methods are called.

**Security comment:**  
There are many attacks possible on public key encryption algorithms when this encoding method is used. It is intended only as a way to obtain access to a public key primitive (for those providers that support it), in order to implement encoding methods at the application rather than the provider level, or to maintain compatibility with legacy protocols.

------------------------------------------------------------------------

<img src="cryptix-s.gif" data-align="right" />

<a href="http://validator.w3.org/check/referer" target="_blank"><img src="vh40.gif" data-border="0" width="88" height="31" alt="Valid HTML 4.0" /></a> <a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank"><img src="vcss.gif" data-border="0" width="88" height="31" alt="Valid CSS" /></a>

[Copyright and trademarks](intro.html#copyright)
