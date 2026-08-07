---
title: "Standard Cryptographic Algorithm Naming"
source_domain: amasci.com
source_path: ~weidai/scan-mirror/prf.html
order: 9739
reachable_from_entry: false
images: 3
internal_links: 3
extracted: 2026-08-07T06:02:19Z
extractor: site_to_paper.py (pandoc)
---

# Standard Cryptographic Algorithm Naming

*Source page: `~weidai/scan-mirror/prf.html`*

## PRF and KDF algorithms

<span id="links"></span>

### Links

- Helger Lipmaa's page on PRFs and KDFs:\
  <a href="http://www.tcs.hut.fi/~helger/crypto/link/prf/" target="_blank">http://www.tcs.hut.fi/~helger/crypto/link/prf/</a>

<span id="description"></span>

### Description

A Pseudo-Random Function family, or PRF, expands a key and a seed to a pseudo-random output, which is usually of variable length. Normally the key should be chosen uniformly at random (or at least with high entropy), but the seed can be any byte string.

A PRF is sometimes called a Key Derivation Function, or KDF, especially when it is used to derive or "separate" keys.

(Note that the classification used in this version of SCAN is different from that in previous versions: functions with variable-length output that are always used with only one input, rather than separate seed and key inputs, are treated as MessageDigests. The only example of this was [MGF1](md.html#MGF1).)

Key derivation algorithms intended for use with low-entropy inputs (e.g. passwords or passphrases) are classified separately, in the <a href="phi.html" target="_top">PassphraseHash</a> section.

<span id="HMAC-PRF"></span>

------------------------------------------------------------------------

? <span class="p">HMAC-PRF</span>(*digest*)

PRF Construction

**Designers:**  
David Hopwood\
(HMAC: <a href="http://www-cse.ucsd.edu/users/mihir/" target="_blank">Mihir Bellare</a>, Ran Canetti, Hugo Krawczyk, Adi Shamir)

**Published:**  
2000 (HMAC: June 1996)

**Description:**  
HMAC-PRF is defined as:

> HMAC-PRF(*digest*)(*key*, *seed*) =\
> `    `HMAC(*digest*)(*key*, I2OSP<sub>4</sub>(0) \|\| *seed*) \|\|\
> `    `HMAC(*digest*)(*key*, I2OSP<sub>4</sub>(1) \|\| *seed*) \|\|\
> `    `HMAC(*digest*)(*key*, I2OSP<sub>4</sub>(2) \|\| *seed*) \|\| ...

The maximum output length of the PRF is 2<sup>32</sup> × (output length of digest).

**References:**  
- \[*Def, Impl* (for HMAC)\] M. Bellare, R. Canetti, H. Krawczyk,\
  "HMAC: Keyed-Hashing for Message Authentication,"\
  <a href="ftp://ftp.isi.edu/in-notes/rfc2104.txt" target="_blank">RFC 2104</a>, February 1997.
- \[*Def, An* (for HMAC)\] M. Bellare, R. Canetti, H. Krawczyk,\
  "Keying hash functions for message authentication,"\
  Extended abstract in Advances in Cryptology - CRYPTO '96 Proceedings, Volume 1109 of Lecture Notes in Computer Science (N. Koblitz, ed.). Springer-Verlag, 1996.\
  Full paper: <a href="http://www-cse.ucsd.edu/users/mihir/papers/hmac.html#kmd5-paper" target="_blank">http://www-cse.ucsd.edu/users/mihir/papers/hmac.html#kmd5-paper</a>
- \[*Inf* (for HMAC)\] M. Bellare, R. Canetti, H. Krawczyk,\
  "Message authentication using hash functions: The HMAC construction,"\
  RSA Laboratories' CryptoBytes vol. 2, no. 1, Spring 1996.\
  <a href="http://www-cse.ucsd.edu/users/mihir/papers/hmac.html#hmac-cryptobytes" target="_blank">http://www-cse.ucsd.edu/users/mihir/papers/hmac.html#hmac-cryptobytes</a>

**Parameters:**  
- `String digest` \[creation/read, no default\] - the name of the Block MessageDigest on which this PRF is to be based.

**Key length:**  
Any multiple of 8 bits that does not cause the maximum input length for the MessageDigest to be exceeded.

**Missing information:**  
Test vectors.

<span id="KDF2"></span>

------------------------------------------------------------------------

? <span class="p">KDF2</span>(*digest*)

PRF Construction

**Designers:**  
P1363 Working Group

**Published:**  
2001

**Description:**  
KDF2 is defined as:

> KDF2(*digest*)(*key*, *seed*) =\
> `    `*digest*(*key* \|\| I2OSP<sub>4</sub>(1) \|\| *seed*) \|\|\
> `    `*digest*(*key* \|\| I2OSP<sub>4</sub>(2) \|\| *seed*) \|\|\
> `    `*digest*(*key* \|\| I2OSP<sub>4</sub>(3) \|\| *seed*) \|\| ...

The maximum output length of the PRF is (2<sup>32</sup> - 1) × (output length of digest).

**See the comments below concerning compatibility with IEEE P1363a.**

**References:**  
- \[*Inf*\] IEEE,\
  IEEE P1363a draft version 10 (D10).\
  <a href="http://grouper.ieee.org/groups/1363/P1363a/index.html" target="_blank">http://grouper.ieee.org/groups/1363/P1363a/index.html</a>
- \[*An*\] Victor Shoup,\
  "A Proposal for an ISO Standard for Public Key Encryption (version 2.1)"\
  Revised December 20, 2001.\
  <a href="http://www.shoup.net/papers/" target="_blank">http://www.shoup.net/papers/</a>

**Parameters:**  
- `String digest` \[creation/read, no default\] - the name of the message digest on which this PRF is to be based.

**Key length:**  
Any multiple of 8 bits that does not cause the maximum input length for the MessageDigest to be exceeeded.

**Missing information:**  
Test vectors.

**Comments:**  
- This algorithm has changed incompatibly (twice) from SCAN 1.0.12. It now aligns more closely with P1363a, if *seed* is considered to be the "key derivation parameters".

- If the current P1363a definition of KDF2 were used with a little-bit-endian message digest, then it would be incompatible with this algorithm. This is because, in the P1363a definition, byte string key and seed inputs are converted to a bit string using the OS2BSP primitive (which always uses big-bit-endian order), and then processed by the digest function using its native bit order. Therefore the bits in each byte of the key and seed would need to be reversed, relative to the algorithm defined here.

  However, P1363a only defines KDF2 for a specific set of message digest functions: SHA-1, SHA-{256,384,512}, and RIPEMD-160. All of these are big-bit-endian, and so there is no incompatibility in practice. It is likely that if some future amendment of IEEE Std 1363 allowed any little-bit-endian digest functions, it would correct this bit order problem.

**Security comments:**  
- Extension attacks are possible on the seed, due to the Merkle-Damgård structure of most message digest algorithms. The suggested way to prevent these attacks is to ensure that the seed has a prefix-free encoding.
- In section 12.3 of the cited paper by Victor Shoup, use of KDF2 for applications that require entropy smoothing, is criticised as being dependent on the security of "a quite unorthodox construction that does not appear to be based on any well-worn or otherwise sound principles."

<span id="SSL3-PRF"></span>

------------------------------------------------------------------------

? <span class="p">SSL3-PRF</span>

PRF

**Designers:**  
Netscape Communications Corp.

**Description:**  
SSL3-PRF is defined as:

> SSL3-PRF(*key*, *seed*) =\
> `    `MD5(*key* \|\| SHA-1("A" \|\| *key* \|\| *seed*)) \|\|\
> `    `MD5(*key* \|\| SHA-1("BB" \|\| *key* \|\| *seed*)) \|\|\
> `    `MD5(*key* \|\| SHA-1("CCC" \|\| *key* \|\| *seed*)) \|\| ...

A maximum of 26 × 16 = 416 bytes may be generated.

When used as a KDF, set *seed* to the zero-length string.

**References:**  
- \[*Def*\] Netscape Communications Corp.,\
  SSL v3 specification,\
  <a href="http://www.netscape.com/eng/ssl3/" target="_blank">http://www.netscape.com/eng/ssl3/</a>

**Key length:**  
Any multiple of 8 bits that does not cause the maximum input length for MD5 or SHA-1 to be exceeeded.

**Missing information:**  
Test vectors.

**Comment:**  
When SSL3-PRF is used to implement SSL version 3, the master_secret described in the SSL specification corresponds to the PRF key, and (ServerHello.random \|\| ClientHello.random) corresponds to the PRF seed.

<span id="TLS-PRF"></span>

------------------------------------------------------------------------

TLS-PRF

PRF

**Designers:**  
IETF Transport Layer Security Working Group

**Published:**  
January 1999

**Description:**  
TLS-PRF is defined as follows:

> TLS-PRF(*key*, *seed*) =\
> `    `P<sub>MD5</sub>(S1, *seed*) XOR P<sub>SHA-1</sub>(S2, *seed*)\
> L<sub>*key*</sub> = length in bytes of *key*\
> L<sub>S1</sub> = L<sub>S2</sub> = ceiling(L<sub>*key*</sub> / 2)\
> S1 = first L<sub>S1</sub> bytes of *key*\
> S2 = last L<sub>S2</sub> bytes of *key*\
> A<sub>*H*</sub>(0) = *seed*\
> A<sub>*H*</sub>(i) = HMAC(*H*)(*key*, A<sub>*H*</sub>(i-1)), for i \> 0\
> P<sub>*H*</sub>(S1, *seed*) =\
> `    `HMAC(*H*)(*key*, A<sub>*H*</sub>(1) \|\| *seed*) \|\|\
> `    `HMAC(*H*)(*key*, A<sub>*H*</sub>(2) \|\| *seed*) \|\|\
> `    `HMAC(*H*)(*key*, A<sub>*H*</sub>(3) \|\| *seed*) \|\| ...

**References:**  
- \[*Def*\] T. Dierks, C. Allen,\
  "The TLS Protocol Version 1.0,"\
  <a href="ftp://ftp.isi.edu/in-notes/rfc2246.txt" target="_blank">RFC 2246</a>, January 1999.
- \[*Test*\] To: "IETF Transport Layer Security WG" \<ietf-tls@lists.consensus.com\>\
  Subject: PRF Testvector for the standard\
  From: Rene Eberhard \<rene.eberhard@entrust.com\>\
  Date: Mon, 5 Oct 1998 03:33:57 -0400\
  <a href="http://www.imc.org/ietf-tls/mail-archive/msg01589.html" target="_blank">http://www.imc.org/ietf-tls/mail-archive/msg01589.html</a>

**Key length:**  
Any multiple of 8 bits that does not cause the maximum input length for MD5 or SHA-1 to be exceeeded.

**Comment:**  
When TLS-PRF is used to implement the TLS protocol, the "label" argument to the PRF should be prepended to the seed. The key is referred to as the "secret" by the TLS specification. I.e. where the TLS spec says "PRF(*secret*, *label*, *seed*)", this may be implemented as "TLS-PRF(*secret*, *label* \|\| *seed*)".

**Security comment:**  
The intention of using both MD5 and SHA-1 in the design was to try to ensure that weaknesses in only one of these hashes would not cause any security problem. However, only the first half of the key is used in P<sub>MD5</sub>, and only the second half in P<sub>SHA-1</sub>. This means that the security cannot be guaranteed to depend on the stronger of MD5 and SHA-1, unless there is sufficient entropy in both the first and last halves of the input key. If the key contains non-random fields (e.g. the version field in the master secret for TLS RSA ciphersuites), these will only affect one of P<sub>MD5</sub> or P<sub>SHA-1</sub>.

Arguably, this does not matter much in practice because either P<sub>MD5</sub> or P<sub>SHA-1</sub> would be secure PRFs on their own.

<span id="alleged"></span>

------------------------------------------------------------------------

### Alleged PRFs and KDFs

- <span class="a">KDF3</span> and <span class="a">KDF4</span> from [Shoup's ISO paper (version 2.1)](http://www.shoup.net/papers/).
- The name <span class="a">KDF1</span> is used in Shoup's paper to refer to [MGF1](#MGF1), and in IEEE Std 1363-2000 to refer to direct use of a hash function as a KDF.
- IKE KDF from [RFC 2409](http://www.rfc-editor.org/rfc/rfc2409.txt).
- Uri Blumenthal's KDFs from [draft-blumenthal-keygen-03.txt](ftp://ftp.isi.edu/internet-drafts/draft-blumenthal-keygen-03.txt).

------------------------------------------------------------------------

<img src="cryptix-s.gif" data-align="right" />

<a href="http://validator.w3.org/check/referer" target="_blank"><img src="vh40.gif" data-border="0" width="88" height="31" alt="Valid HTML 4.0" /></a> <a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank"><img src="vcss.gif" data-border="0" width="88" height="31" alt="Valid CSS" /></a>

[Copyright and trademarks](intro.html#copyright)
