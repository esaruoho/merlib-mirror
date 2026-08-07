---
title: "Standard Cryptographic Algorithm Naming"
source_domain: amasci.com
source_path: ~weidai/scan-mirror/mac.html
order: 9733
reachable_from_entry: false
images: 3
internal_links: 1
extracted: 2026-08-07T06:02:19Z
extractor: site_to_paper.py (pandoc)
---

# Standard Cryptographic Algorithm Naming

*Source page: `~weidai/scan-mirror/mac.html`*

## MAC Algorithms (Message Authentication Codes)

<span id="links"></span>

### Links

- Helger Lipmaa's page on MAC algorithms:\
  <a href="http://www.tcs.hut.fi/~helger/crypto/link/hash/mac.html" target="_blank">http://www.tcs.hut.fi/~helger/crypto/link/hash/mac.html</a>

<span id="CBC-MAC-DES-FIPS113"></span>

------------------------------------------------------------------------

CBC-MAC-DES-FIPS113

MAC

**Description:**  
If E<sub>K</sub> denotes DES encryption, and the input message is split into blocks M<sub>0</sub>,... M<sub>n-1</sub> (using padding with zeroes for the last block), then:

- let C<sub>0</sub> = 0
- let C<sub>i+1</sub> = E<sub>K</sub>(C<sub>i</sub> XOR M<sub>i</sub>), for i \>= 0
- the MAC value is (a prefix of) C<sub>n-1</sub>.

**References:**  
- \[*Def, Test*\] U.S. National Institute of Standards and Technology,\
  NIST FIPS PUB 113, "Standard on Computer Data Authentication,"\
  U.S. Department of Commerce, May 1985.\
  <a href="http://www.itl.nist.gov/div897/pubs/fip113.htm" target="_blank">http://www.itl.nist.gov/div897/pubs/fip113.htm</a>
- \[*An*\] M. Bellare, R. Guérin and P. Rogaway,\
  "The security of cipher block chaining,"\
  Extended abstract in Advances in Cryptology - CRYPTO '94 Proceedings, Volume 839 of Lecture Notes in Computer Science (Y. Desmedt ed.), Springer-Verlag, 1994.\
  Full paper available at <a href="http://www-cse.ucsd.edu/users/mihir/papers/cbc.html" target="_blank">http://www-cse.ucsd.edu/users/mihir/papers/cbc.html</a>
- \[*An*\] Bart Preneel, P.C. van Oorschot,\
  "A new generic attack on message authentication codes,"\
  Advances in Cryptology - CRYPTO '95 Proceedings, Volume 963 of Lecture Notes in Computer Science (D. Coppersmith, ed.). Springer-Verlag, 1995.
- \[*An*\] Bart Preneel, P.C. van Oorschot,\
  "MDx-MAC and building fast MACs from hash functions,"\
  Advances in Cryptology - CRYPTO '95, Volume 963 of Lecture Notes in Computer Science (D. Coppersmith, ed.), pp. 1-14. Springer-Verlag, 1995.\
  <a href="http://citeseer.nj.nec.com/preneel95mdxmac.html" target="_blank">http://citeseer.nj.nec.com/preneel95mdxmac.html</a>
- \[*An*\] Erez Petrank, C. Rackoff,\
  "CBC MAC for Real Time Data Sources,"\
  DIMACS Technical Report 97-26.\
  <a href="http://dimacs.rutgers.edu/TechnicalReports/abstracts/1997/97-26.html" target="_blank">http://dimacs.rutgers.edu/TechnicalReports/abstracts/1997/97-26.html</a>\
  Also in Journal of Cryptology, Vol. 13, No. 3 (2000), pp. 315-338.\
  <a href="http://citeseer.nj.nec.com/petrank97cbc.html" target="_blank">http://citeseer.nj.nec.com/petrank97cbc.html</a>

**Key length:**  
64 bits as encoded; 56 bits excluding parity bits.

**Output length:**  
Minimum 32, maximum 64, default 64 bits.

**Comment:**  
- FIPS 113 does not specify the result of applying the algorithm to a message of zero length. The interpretation used here is that in that case, the output is found by encrypting a single all-zero block.

**Security comments:**  
- The output length of 64 bits is not sufficient to prevent a brute-force attack (i.e. to find a message with a given MAC), and is very weak against birthday attacks.
- The paper "MDx-MAC and building fast MACs from hash functions," describes an attack on CBC-MAC which requires (in the case of DES) on the order of 2<sup>32</sup> known texts.
- The input is padded to a multiple of 64 bits by appending between 0 and 7 zero bytes. This means that any trailing zeroes in the last block of the message will not affect the MAC result.
- CBC-MAC-DES-FIPS113 is not secure when used on messages of variable length, unless the set of valid messages used by an application is prefix-free, and each message is checked to come from the valid set.
- If a CBC-MAC is desired, [XCBC-MAC](#XCBC-MAC) should be used instead, with a 128-bit block cipher.

<span id="CBC-MAC"></span>

------------------------------------------------------------------------

CBC-MAC(*cipher*)

MAC Construction

**Description:**  
If E<sub>K</sub> denotes encryption with the block cipher named *cipher*, and the input message is split into blocks M<sub>0</sub>, ... M<sub>n-1</sub> (using PKCS \#7-style padding for the last block), then:

- let C<sub>0</sub> = 0
- let C<sub>i+1</sub> = E<sub>K</sub>(C<sub>i</sub> XOR M<sub>i</sub>), for i \>= 0
- the MAC value is (a prefix of) C<sub>n-1</sub>.

**References:**  
- \[*Inf*\] U.S. National Institute of Standards and Technology,\
  NIST FIPS PUB 113, "Standard on Computer Data Authentication,\
  U.S. Department of Commerce, May 1985.\
  <a href="http://www.itl.nist.gov/div897/pubs/fip113.htm" target="_blank">http://www.itl.nist.gov/div897/pubs/fip113.htm</a>
- \[*An*\] M. Bellare, R. Guérin and P. Rogaway,\
  "The security of cipher block chaining,"\
  Extended abstract in Advances in Cryptology - Crypto' 94 Proceedings, Volume 839 of Lecture Notes in Computer Science (Y. Desmedt ed.), Springer-Verlag, 1994.\
  Full paper available at <a href="http://www-cse.ucsd.edu/users/mihir/papers/cbc.html" target="_blank">http://www-cse.ucsd.edu/users/mihir/papers/cbc.html</a>
- \[*An*\] Bart Preneel, P.C. van Oorschot,\
  "A new generic attack on message authentication codes,"\
  Advances in Cryptology - CRYPTO '95 Proceedings, Volume 963 of Lecture Notes in Computer Science (D. Coppersmith, ed.). Springer-Verlag, 1995.
- \[*An*\] Bart Preneel, P.C. van Oorschot,\
  "MDx-MAC and building fast MACs from hash functions,"\
  Advances in Cryptology - CRYPTO '95, Volume 963 of Lecture Notes in Computer Science (D. Coppersmith, ed.), pp. 1-14. Springer-Verlag, 1995.\
  <a href="http://citeseer.nj.nec.com/preneel95mdxmac.html" target="_blank">http://citeseer.nj.nec.com/preneel95mdxmac.html</a>
- \[*An*\] Erez Petrank, C. Rackoff,\
  "CBC MAC for Real Time Data Sources,"\
  To appear in the Journal of Cryptology.\
  <http://www.cs.technion.ac.il/~erez/pra2.ps>

**Parameters:**  
- `String cipher` \[creation/read, no default\] - the name of the block cipher on which this MAC is to be based. The algorithm must be available as a cipher.

**Key length:**  
As defined by the cipher.

**Output length:**  
Minimum 32 bits, maximum equal to the cipher block size. The default output length is 64 bits, or half of the cipher block size rounded up to the next multiple of 8 bits, whichever is greater.

**Missing information:**  
Test vectors.

**Comment:**  
The input is padded to a multiple of the cipher's block length by using PKCS \#7-style padding (as defined by the [PKCSPadding](cs.html#pad_PKCSPadding) algorithm for block ciphers).

**Security comments:**  
- The paper "MDx-MAC and building fast MACs from hash functions," describes an attack on CBC-MAC which requires on the order of 2<sup>k/2</sup> known texts, where k is the cipher block size in bits. This means that CBC-MAC has limited security when used with a 64-bit cipher (i.e. most block ciphers designed before the AES process).
- CBC-MAC is not secure when used on messages of variable length, unless the set of valid messages used by an application is prefix-free, and each message is checked to come from the valid set.
- If a CBC-MAC is desired, [XCBC-MAC](#XCBC-MAC) should be used instead, with a 128-bit block cipher.

<span id="XCBC-MAC"></span>

------------------------------------------------------------------------

XCBC-MAC(*cipher*)

MAC Construction

**Description:**  
The key K is split into three parts, K<sub>1</sub> (the key for the underlying block cipher), and masking keys K<sub>2</sub> and K<sub>3</sub>. The length of each masking key is equal to the cipher block size; that is, the length of the key for the underlying cipher will be length(K) - 2 × blocksize. Then the MAC is calculated as described in Black and Rogaway's paper.

**References:**  
- \[*Def*\] John Black, Phillip Rogaway,\
  "A Suggestion for Handling Arbitrary-Length Messages with the CBC MAC,"\
  Presented at the AES Modes Conference.\
  \[\[need URL\]\]
- \[*Inf*\] John Black, Phillip Rogaway,\
  "CBC MACs for arbitrary-length messages: The three-key constructions."\
  Advances in Cryptology - CRYPTO '2000 Proceedings, Volume 1880 of Lecture Notes in Computer Science (Mihir Bellare, ed.), pp. 197-215. Springer-Verlag, 2000.
- \[*An*\] Bart Preneel, P.C. van Oorschot,\
  "MDx-MAC and building fast MACs from hash functions,"\
  Advances in Cryptology - CRYPTO '95, Volume 963 of Lecture Notes in Computer Science (D. Coppersmith, ed.), pp. 1-14. Springer-Verlag, 1995.\
  <a href="http://citeseer.nj.nec.com/preneel95mdxmac.html" target="_blank">http://citeseer.nj.nec.com/preneel95mdxmac.html</a>

**Parameters:**  
- `String cipher` \[creation/read, no default\] - the name of the block cipher on which this MAC is to be based. The algorithm must be available as a cipher.

**Key length:**  
As defined by the cipher, plus 2 × blocksize.

**Output length:**  
Minimum 32 bits, maximum equal to the cipher block size. The default output length is 64 bits, or half of the cipher block size rounded up to the next multiple of 8 bits, whichever is greater.

**Security comments:**  
- The paper "MDx-MAC and building fast MACs from hash functions," describes an attack on CBC-MAC that extends to XCBC-MAC, and requires on the order of 2<sup>k/2</sup> known texts, where k is the cipher block size in bits. This means that XCBC-MAC has limited security when used with a 64-bit cipher (i.e. most block ciphers designed before the AES process).

<span id="HMAC"></span>

------------------------------------------------------------------------

HMAC(*digest*)

MAC Construction

**Designers:**  
<a href="http://www-cse.ucsd.edu/users/mihir/" target="_blank">Mihir Bellare</a>, Ran Canetti, Hugo Krawczyk, Adi Shamir

**Published:**  
June 1996

**Aliases:**  
- "HmacMD5" is an alias to HMAC(MD5) \[JDK compatibility\]
- "HmacSHA1" is an alias to HMAC(SHA-1) \[JDK compatibility\]
- "1.3.6.1.5.5.8.1.1" is an alias to HMAC(MD5)
- "1.3.6.1.5.5.8.1.2" is an alias to HMAC(SHA-1)
- "1.3.6.1.5.5.8.1.3" is an alias to HMAC(Tiger)
- "1.3.6.1.5.5.8.1.4" is an alias to HMAC(RIPEMD-160)\
  (<a href="http://www.iana.org/assignments/smi-numbers" target="_blank">source for OIDs</a> from iso.org.dod.internet.security.mechanisms.ipsec.isakmpOakley tree)
- "http://www.w3.org/2000/02/xmldsig#hmac-sha1" is an alias to HMAC(SHA-1)

**References:**  
- \[*Def, Impl*\] M. Bellare, R. Canetti, H. Krawczyk,\
  "HMAC: Keyed-Hashing for Message Authentication,"\
  <a href="http://www.rfc-editor.org/rfc/rfc2104.txt" target="_blank">RFC 2104</a>, February 1997.
- \[*Def, An*\] M. Bellare, R. Canetti, H. Krawczyk,\
  "Keying hash functions for message authentication,"\
  Extended abstract in Advances in Cryptology - CRYPTO '96 Proceedings, Volume 1109 of Lecture Notes in Computer Science (N. Koblitz, ed.), Springer-Verlag, 1996.\
  Full paper: <a href="http://www-cse.ucsd.edu/users/mihir/papers/hmac.html#kmd5-paper" target="_blank">http://www-cse.ucsd.edu/users/mihir/papers/hmac.html#kmd5-paper</a>
- \[*Inf*\] M. Bellare, R. Canetti, H. Krawczyk,\
  "Message authentication using hash functions: The HMAC construction,"\
  RSA Laboratories' CryptoBytes vol. 2, no. 1, Spring 1996.\
  <a href="http://www-cse.ucsd.edu/users/mihir/papers/hmac.html#hmac-cryptobytes" target="_blank">http://www-cse.ucsd.edu/users/mihir/papers/hmac.html#hmac-cryptobytes</a>
- \[*Test*\] P. Cheng, R. Glenn,\
  "Test Cases for HMAC-MD5 and HMAC-SHA-1,"\
  <a href="http://www.rfc-editor.org/rfc/rfc2202.txt" target="_blank">RFC 2202</a>, September 1997.\
  (This contains a minor editorial error; see the <a href="http://www.rfc-editor.org/errata.html" target="_blank">RFC Errata page</a>.)
- \[*Test*\] J. Kapp,\
  "Test Cases for HMAC-RIPEMD160 and HMAC-RIPEMD128,"\
  <a href="http://www.rfc-editor.org/rfc/rfc2286.txt" target="_blank">RFC 2286</a>, February 1998.

**Parameters:**  
- `String digest` \[creation/read, no default\] - the name of the Block MessageDigest on which this MAC is to be based.

**Key length:**  
Any multiple of 8 bits that does not cause the maximum input length for the MessageDigest to be exceeeded. Default 128 bits.

**Output length:**  
Minimum 32 bits, maximum equal to the message digest output length. The default is equal to the message digest output length.

<span id="MD5-MAC"></span>

------------------------------------------------------------------------

MD5-MAC

MAC

**Designers:**  
<a href="http://www.esat.kuleuven.ac.be/~preneel/" target="_blank">Bart Preneel</a>, <a href="http://cacr.math.uwaterloo.ca/hac/authors/pvo.html" target="_blank">P.C. van Oorschot</a>

**Description:**  
The MAC algorithm obtained by applying the MDx-MAC method to MD5 (MDx-MAC is not defined as a construction, since it involves changes to the internal structure of the message digest being used).

**Published:**  
1995

**References:**  
- \[*Def, An, Test*\] Bart Preneel, P.C. van Oorschot,\
  "MDx-MAC and building fast MACs from hash functions,"\
  Advances in Cryptology - CRYPTO '95, Volume 963 of Lecture Notes in Computer Science (D. Coppersmith, ed.), pp. 1-14. Springer-Verlag, 1995.\
  <a href="http://citeseer.nj.nec.com/preneel95mdxmac.html" target="_blank">http://citeseer.nj.nec.com/preneel95mdxmac.html</a>
- \[*Inf, Test*\] A. Menezes, P.C. van Oorschot, S.A. Vanstone,\
  "Algorithm 9.69 MD5-MAC,"\
  Handbook of Applied Cryptography, CRC Press, 1997.\
  <a href="http://www.cacr.math.uwaterloo.ca/hac/about/chap9.pdf" target="_blank">http://www.cacr.math.uwaterloo.ca/hac/about/chap9.pdf</a>, [.ps](http://www.cacr.math.uwaterloo.ca/hac/about/chap9.ps)

**Key length:**  
Minimum 8, maximum 128, multiple of 8 bits; default 128 bits.

**Output length:**  
Minimum 32, maximum 128, default 64 bits.

**Security comment:**  
MD5-MAC is claimed to require approximately 2<sup>64</sup> operations to forge a message (increasing the Output length property from the default, 8 bytes, does not necessarily improve this).

<span id="RIPEMD-128-MAC"></span>

------------------------------------------------------------------------

RIPEMD-128-MAC

MAC

**Designers:**  
<a href="http://www.esat.kuleuven.ac.be/~preneel/" target="_blank">Bart Preneel</a>, <a href="http://cacr.math.uwaterloo.ca/hac/authors/pvo.html" target="_blank">P.C. van Oorschot</a>

**Description:**  
The MAC algorithm obtained by applying the MDx-MAC method to RIPEMD-128 (MDx-MAC is not defined as a construction, since it involves changes to the internal structure of the message digest being used).

**Published:**  
1995

**References:**  
- \[*Def, An*\] Bart Preneel, P.C. van Oorschot,\
  "MDx-MAC and building fast MACs from hash functions,"\
  Advances in Cryptology - CRYPTO '95, Volume 963 of Lecture Notes in Computer Science (D. Coppersmith, ed.), pp. 1-14. Springer-Verlag, 1995.\
  <a href="http://citeseer.nj.nec.com/preneel95mdxmac.html" target="_blank">http://citeseer.nj.nec.com/preneel95mdxmac.html</a>
- \[*Inf, Impl, Test*\] Hans Dobbertin, Antoon Bosselaers, Bart Preneel,\
  The RIPEMD-160 page,\
  <a href="http://www.esat.kuleuven.ac.be/~bosselae/ripemd160.html" target="_blank">http://www.esat.kuleuven.ac.be/~bosselae/ripemd160.html</a>

**Key length:**  
Minimum 8, maximum 128, multiple of 8 bits; default 128 bits.

**Output length:**  
Minimum 32, maximum 128, default 64 bits.

**Security comment:**  
RIPEMD-128-MAC is claimed to require approximately 2<sup>64</sup> operations to forge a message (increasing the Output length property from the default, 8 bytes, does not necessarily improve this).

<span id="RIPEMD-160-MAC"></span>

------------------------------------------------------------------------

RIPEMD-160-MAC

MAC

**Designers:**  
<a href="http://www.esat.kuleuven.ac.be/~preneel/" target="_blank">Bart Preneel</a>, <a href="http://cacr.math.uwaterloo.ca/hac/authors/pvo.html" target="_blank">P.C. van Oorschot</a>

**Description:**  
The MAC algorithm obtained by applying the MDx-MAC method to RIPEMD-160 (MDx-MAC is not defined as a construction, since it involves changes to the internal structure of the message digest being used).

**Published:**  
1995

**References:**  
- \[*Def, An*\] Bart Preneel, P.C. van Oorschot,\
  "MDx-MAC and building fast MACs from hash functions,"\
  Advances in Cryptology - CRYPTO '95, Volume 963 of Lecture Notes in Computer Science (D. Coppersmith, ed.), pp. 1-14. Springer-Verlag, 1995.\
  <a href="http://citeseer.nj.nec.com/preneel95mdxmac.html" target="_blank">http://citeseer.nj.nec.com/preneel95mdxmac.html</a>
- \[*Inf, Impl, Test*\] Hans Dobbertin, Antoon Bosselaers, Bart Preneel,\
  The RIPEMD-160 page,\
  <a href="http://www.esat.kuleuven.ac.be/~bosselae/ripemd160.html" target="_blank">http://www.esat.kuleuven.ac.be/~bosselae/ripemd160.html</a>

**Key length:**  
Minimum 8, maximum 128, multiple of 8 bits; default 128 bits.

**Output length:**  
Minimum 32, maximum 160, default 80 bits.

**Security comment:**  
RIPEMD-160-MAC is claimed to require approximately 2<sup>80</sup> operations to forge a message (increasing the Output length property from the default, 10 bytes, does not necessarily improve this).

<span id="SSL3-MAC"></span>

------------------------------------------------------------------------

? SSL3-MAC(*digest*)

MAC Construction

**Designers:**  
<a href="http://www-cse.ucsd.edu/users/mihir/" target="_blank">Mihir Bellare</a>, Ran Canetti, Hugo Krawczyk

**Alias:**  
"SSL3MAC"

**References:**  
- \[*Def*\] Netscape Communications Corp.,\
  SSL v3 specification,\
  <a href="http://www.netscape.com/eng/ssl3/" target="_blank">http://www.netscape.com/eng/ssl3/</a>
- \[*Inf, An*\] M. Bellare, R. Canetti, H. Krawczyk,\
  "Keying hash functions for message authentication,"\
  Extended abstract in Advances in Cryptology - CRYPTO '96 Proceedings, Volume 1109 of Lecture Notes in Computer Science (N. Koblitz, ed.). Springer-Verlag, 1996.\
  Full paper: <a href="http://www-cse.ucsd.edu/users/mihir/papers/hmac.html#kmd5-paper" target="_blank">http://www-cse.ucsd.edu/users/mihir/papers/hmac.html#kmd5-paper</a>\
  (This paper describes the later HMAC design, but many of the same security properties apply to SSL3-MAC.)

**Parameters:**  
- `String digest` \[creation/read, no default\] - the name of the message digest on which this MAC is to be based. Not all message digests can necessarily be used, but at least MD5 and SHA-1 MUST be implemented.

**Key length:**  
Any multiple of 8 bits that does not cause the maximum input length for the MessageDigest to be exceeeded.

**Output length:**  
Minimum 32 bits, maximum equal to the message digest output length. The default is equal to the message digest output length.

**Comment:**  
This is an early version of [HMAC](#HMAC), which should now be used in preference (except for compatibility with SSL version 3). The difference is that in SSL3-MAC, the padding strings 'ipad' and 'opad' are appended to the key, whereas in HMAC, they are exclusive-or'd with the zero-extended key.

<span id="Two-Track-MAC"></span>

------------------------------------------------------------------------

? <span class="p">Two-Track-MAC</span>

MAC

**Designers:**  
Bart Van Rompay, Bert den Boer

**Published:**  
November 2000

**Alias:**  
"TTMAC"

**References:**  
- \[*Def*\] Bart Van Rompay, Bert den Boer,\
  NESSIE Submission - Two-Track-MAC.\
  spec.ps in <http://www.cryptonessie.org/submissions/twotrackmac/twotrackmac.zip>
- \[*Inf*\] Hans Dobbertin, Antoon Bosselaers, Bart Preneel,\
  RIPEMD-160: A Strengthened Version of RIPEMD.\
  A joint publication by the German Information Security Agency (POB 20 03 63, D-53133 Bonn, Germany) and the Katholieke Universiteit Leuven, ESAT-COSIC (K. Mercierlaan 94, B-3001 Heverlee, Belgium), 18 April 1996.\
  <ftp://ftp.esat.kuleuven.ac.be/pub/COSIC/bosselae/ripemd/ripemd160.ps.gz>
- \[*Test*\] Bart Van Rompay, Bert den Boer,\
  Two-Track-MAC Test Vectors.\
  testsuite.txt in <http://www.cryptonessie.org/submissions/twotrackmac/twotrackmac.zip>

**Key length:**  
160 bits.

**Output length:**  
Minimum 64, maximum 160, multiple of 32 bits. Default 160 bits.

<span id="UMAC16"></span>

------------------------------------------------------------------------

? <span class="p">UMAC16</span>\[(*signedFlag*,*preferredEndian*,\
*l1KeyLen*,*outputLen*,*cipher*)\]

MAC Construction

**Designers:**  
Theodore Krovetz, John Black, Shai Halevi, A. Hevia, Hugo Krawczyk, <a href="http://www.cs.ucdavis.edu/~rogaway/" target="_blank">Phillip Rogaway</a>

**Published:**  
November 2000

**Description:**  
This is the version of UMAC submitted to the NESSIE project (UMAC 2000), with the 16-bit parameter set. The default parameters are signedFlag = S, preferredEndian = LE, l1KeyLen = 1024, outputLen = 8, cipher = Rijndael.

Note that the signed default is different from [UMAC32](#UMAC32).

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
- `Integer outputLen` \[creation/read, default 8\] - the length of the MAC output in bytes. (Note that unlike most SCAN MACs, the output is not just a prefix of a fixed-length result.)
- `String cipher` \[creation/read, default "Rijndael"\] - the name of the cipher on which this MAC is to be based, which MUST be an available block cipher.

<span id="UMAC32"></span>

------------------------------------------------------------------------

? <span class="p">UMAC32</span>\[(*signedFlag*,*preferredEndian*,\
*l1KeyLen*,*outputLen*,*cipher*)\]

MAC Construction

**Designers:**  
Theodore Krovetz, John Black, Shai Halevi, A. Hevia, Hugo Krawczyk, <a href="http://www.cs.ucdavis.edu/~rogaway/" target="_blank">Phillip Rogaway</a>

**Published:**  
November 2000

**Description:**  
This is the version of UMAC submitted to the NESSIE project (UMAC 2000), with the 32-bit parameter set. The default parameters are signedFlag = U, preferredEndian = LE, l1KeyLen = 1024, outputLen = 8, cipher = Rijndael.

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
- `Integer outputLen` \[creation/read, default 8\] - the length of the MAC output in bytes. (Note that unlike most SCAN MACs, the output is not just a prefix of a fixed-length result.)
- `String cipher` \[creation/read, default "Rijndael"\] - the name of the cipher on which this MAC is to be based, which MUST be an available block cipher.

<span id="XMACWithDigest"></span>

------------------------------------------------------------------------

× <span class="x">XMACWithDigest</span>(*digest*\[*,seedLength*\])

MAC Construction

**Designers:**  
<a href="http://www-cse.ucsd.edu/users/mihir/" target="_blank">Mihir Bellare</a>, R. Guérin, <a href="http://www.cs.ucdavis.edu/~rogaway/" target="_blank">Phillip Rogaway</a>

**Description:**  
This algorithm covers both the XMACC and XMACR variants described in the "XOR MACs" paper, using a pseudo-random function constructed from a message digest compression function.

**Published:**  
October 1995

**References:**  
- \[*Def, An*\] M. Bellare, R. Guérin and P. Rogaway,\
  "XOR MACs: New methods for message authentication using finite pseudorandom functions,"\
  Extended abstract in Advances in Cryptology - Crypto 95 Proceedings, Volume 963 of Lecture Notes in Computer Science (D. Coppersmith ed.), Springer-Verlag, 1995.\
  Full paper available at <a href="http://www-cse.ucsd.edu/users/mihir/papers/xormacs.html" target="_blank">http://www-cse.ucsd.edu/users/mihir/papers/xormacs.html</a>

**Key length:**  
Minimum 32 bits, maximum 16 bits less than the message digest output length, multiple of 8 bits. The default is 128 bits or the maximum length, whichever is shorter.

**Output length:**  
Minimum 32 bits, maximum equal to the message digest output length, default 80 bits. This does not include the length of the seed.

**Parameters:**  
- `String digest` \[creation/read, no default\] - the name of the message digest on which this MAC is to be based, which MUST be a Block MessageDigest from either the same provider, or an installed provider.
- `Integer seedLength` \[creation/read, default 8\] - the length of the seed (or counter) value, in bytes.
- `Long counter` \[read/write, default null\] - the current counter value, if the XMACC variant is being used.

**Missing information:**  
- Test vectors.

**Comments:**  
- The input to the message digest compression function is an array of chaining variables, and a block of message bytes. It is formed as follows:

  - For the block containing the seed, pad the key with zeroes on the right up to the digest length, and convert to an array of chaining variables, using the normal byte order for the hash function. The message block consists of a big-endian representation of the seed value at the end of the block, padded on the left with zeroes.
  - For all other blocks, concatenate the key with a big-endian representation of the index value, so that the length of the result is equal to the digest length. Then convert to an array of chaining variables, using the normal byte order for the hash function. The message block is a direct copy of the corresponding block of the MAC input.

  The index starts with its most significant bit set to 1, and all other bits zero; it is incremented for every block. If the index reaches the all-ones value, it wraps to 1 (i.e. missing out zero). If it exhausts all possible values except zero, attempting to update more data will cause an `IllegalStateException` to be thrown.

  Note that the index or seed is encoded in big-endian order, before converting to the internal byte order used by the hash function. I.e. if the hash function interprets words as little-endian, the effect is to *always* reverse the byte order of these values.

  Padding of the last block is performed in the same way as for the underlying message digest.

- There is no difference between the XMACC and XMACR variants for MAC verification. For MAC generation, setting the `counter` parameter to a non-null value will reset the `Mac` object, and cause the given value to be used for the current message, then incremented for each subsequent message (i.e. in the Java mapping, the `counter` parameter is incremented whenever any of the `doFinal` methods is called). If the counter reaches 2<sup>seedLength</sup>, the `Mac` object becomes invalid, and always throws an `IllegalStateException`.
  When `counter` is null, the seed is generated as a random value of length `seedLength` bytes. In this case the `counter` parameter remains null, and is not incremented after a call to a `doFinal` method.

- If a `Mac` object that implements this algorithm is cloned, the cloning process MUST automatically set the `counter` parameter of the clone to null.

- The seed value is encoded as `seedLength` bytes in big-endian order, and prepended to the MAC output.

- Unlike a previous draft, this algorithm is not compatible with the implementation of XMACC in Crypto++ 3.0/3.1.

- Sun's API for `javax.crypto.Mac` appears to work only for deterministic MAC algorithms, which needs to be fixed by separating MAC computation from verification, and by providing a way to initialise the seed before using `update`.

**Security comment:**  
When using the counter variant of XMAC, it is vital to ensure that the counter never repeats for two messages with the same key. One way of doing this is to save the current value of the counter after it is finished with, and restore it when the key is re-used with a different `Mac` object; another is to avoid re-using keys entirely.

<span id="PCSWithDigest"></span>

------------------------------------------------------------------------

× <span class="x">PCSWithDigest</span>(*digest*)

MAC Construction

**Designers:**  
Dan Bernstein \[\[link to home page\]\]

**Description:**  
This algorithm specifies "Protected Counter Sum" with the pseudo-random function *f* constructed from a message digest compression function (rather than the *surf* function described in Bernstein's paper).

**Published:**  
October 1995

**References:**  
- \[*Def, An*\] D. J. Bernstein,\
  "How to Stretch Random Functions: The Security of Protected Counter Sums,"\
  Journal of Cryptology Volume 12 \#3, pp. 185-192.\
  <http://cr.yp.to/papers/stretch.dvi>\
  \[\[need to provide PS or PDF copy\]\]

**Key length:**  
Minimum 32 bits, maximum 16 bits less than the message digest output length, multiple of 8 bits. The default is 128 bits or the maximum length, whichever is shorter.

**Output length:**  
Minimum 32 bits, maximum equal to the message digest output length, default 80 bits. This does not include the length of the seed.

**Parameters:**  
- `String digest` \[creation/read, no default\] - the name of the message digest on which this MAC is to be based, which MUST be an available Block MessageDigest.

**Missing information:**  
- Test vectors.

**Comments:**  
- The input to the message digest compression function is formed in the same way as for [XMACWithDigest](#XMACWithDigest) above (except that there is no seed block).

  Padding of the last block is performed in the same way as for the underlying message digest.

**Security comment:**  
Note that the input to the PRF will be larger than in Bernstein's paper. The security proofs are not significantly affected by this.

<span id="alleged"></span>

------------------------------------------------------------------------

### Alleged MACs

- <span class="a">MAA</span> \[HAC p356\] is <a href="http://planeta.terra.com.br/informatica/paulobarreto/hflounge.html#PRO97" target="_blank">broken</a> \[also HAC p381\].
- <span class="a">CRC-MAC</span> \[HAC p359\].
- <span class="a">IBC-Hash</span> \[AC2 p458\].
- <span class="a">NMAC</span> (related to HMAC).
- <span class="a">Rogaway-bucket-MAC</span> \[HAC p382\].
- <span class="a">KHF</span>.

------------------------------------------------------------------------

<img src="cryptix-s.gif" data-align="right" />

<a href="http://validator.w3.org/check/referer" target="_blank"><img src="vh40.gif" data-border="0" width="88" height="31" alt="Valid HTML 4.0" /></a> <a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank"><img src="vcss.gif" data-border="0" width="88" height="31" alt="Valid CSS" /></a>

[Copyright and trademarks](intro.html#copyright)
