---
title: "Standard Cryptographic Algorithm Naming"
source_domain: amasci.com
source_path: ~weidai/scan-mirror/md.html
order: 9946
reachable_from_entry: false
images: 5
internal_links: 4
extracted: 2026-08-07T17:18:17Z
extractor: site_to_paper.py (pandoc)
---

# Standard Cryptographic Algorithm Naming

*Source page: `~weidai/scan-mirror/md.html`*

## MessageDigest Algorithms

<span id="links"></span>

### Links

- Helger Lipmaa's page on hash functions:\
  <a href="http://www.tcs.hut.fi/~helger/crypto/link/hash/" target="_blank">http://www.tcs.hut.fi/~helger/crypto/link/hash/</a>
- SecurityTechNet's page on hash functions:\
  <a href="http://www.securitytechnet.com/crypto/algorithm/hash.html" target="_blank">http://www.securitytechnet.com/crypto/algorithm/hash.html</a>
- The Hashing Function Lounge:\
  <a href="http://planeta.terra.com.br/informatica/paulobarreto/hflounge.html" target="_blank">http://planeta.terra.com.br/informatica/paulobarreto/hflounge.html</a>

<span id="papers"></span>

### Design and Analysis

- S. Bakhtiari, R. Safavi-Naini, J. Pieprzyk,\
  "Cryptographic Hash Functions: A Survey," 1995.\
  <a href="http://citeseer.nj.nec.com/bakhtiari95cryptographic.html" target="_blank">http://citeseer.nj.nec.com/bakhtiari95cryptographic.html</a>\
  \[obsolete in places, but still a good overview of definitions\]
- Joan Daemen,\
  "Cipher and hash function design. Strategies based on linear and differential cryptanalysis," PhD thesis, March 1995. <a href="http://www.esat.kuleuven.ac.be/~cosicart/ps/JD-9500/" target="_blank">http://www.esat.kuleuven.ac.be/~cosicart/ps/JD-9500/</a>
- T. Sato, M. Haga, K. Kurosawa,\
  "Towards secure and fast hash functions,"\
  IEICE Trans. E82-A, \[1\], pp. 55-62 (1999). <a href="http://tsk-www.ss.titech.ac.jp/~kurosawa/1999/hash.ps" target="_blank">http://tsk-www.ss.titech.ac.jp/~kurosawa/1999/hash.ps</a>
- RSA Labs FAQ: What are some techniques against hash functions?\
  <a href="http://www.rsasecurity.com/rsalabs/faq/2-4-6.html" target="_blank">http://www.rsasecurity.com/rsalabs/faq/2-4-6.html</a>
- P. van Oorschot, M. Wiener,\
  "Parallel collision search with Cryptanalytic Applications,"\
  Journal of Cryptology, 12(1):1-28, 1999. <a href="http://members.rogers.com/paulv/papers/JoC97.pdf" target="_blank">http://members.rogers.com/paulv/papers/JoC97.pdf</a>

<span id="interop"></span>

### Interoperability

One of the attributes of message digest algorithms that sometimes causes interoperability problems or difficulty in implementation, is that by convention most message digests can be applied to either a bit string, or a byte string. (Remember that byte is synonymous with "octet" in this specification.) The specification will usually concentrate on one of these input representations, and sometimes does not make it clear how to apply the algorithm to the other. Here we use the following terminology to describe how bit and byte ordering is handled by each message digest:

- An algorithm is "little-bit-endian" if the least significant bit of each byte is first in the corresponding bit string, or "big-bit-endian" if the most significant bit is first.
- If an algorithm processes a message by converting it to words larger than 8 bits internally, then it is "little-byte-endian" if the least significant byte of each word is first in the corresponding byte string, or "big-byte-endian" if the most significant byte is first.
- Some convention must be defined for how the last bits of a message are justified within the last byte (this is true even if the input length is a multiple of 8 bits, because the padding is normally specified as "append a one bit, followed by zero bits"). An algorithm is "left-justified" if the data in the last byte is shifted towards the more significant bits (i.e. the less significant bits represent padding). It is "right-justified" if the data is shifted towards the less significant bits.

Example: if the bit string 1110 is hashed with a big-bit-endian, little-byte-endian, left-justified algorithm, then this becomes the octet string \[11101000, 00000000, 00000000, 00000000\], which corresponds to the word 00000000000000000000000011101000.

For messages that are specified as octet strings (or a multiple of 8 bits), a left-justified algorithm that employs the "one and zeroes" padding method can be implemented by appending the byte value 0x80 to the message. In the same circumstances a right-justified algorithm can be implemented by appending the byte value 0x01 to the message.

Note that the bit-endianness and byte-endianness of an algorithm are not necessarily the same (for example MD4 and MD5 are big-bit-endian, but little-byte-endian). The most consistent choice for left or right justification is that a big-bit-endian algorithm be left-justified, and a little-bit-endian algorithm be right-justified; all of the SCAN algorithms that have been defined so far follow this rule. <span id="blockmd"></span>

### Block MessageDigests

Some MessageDigest algorithms can be classified as "Block MessageDigests". These algorithms have the following properties:

- Data is processed in fixed-size blocks. The final block normally has a maximum size less than the block size, and is padded to the block size in a standard way.

- At any point (i.e. after processing some number of blocks), the state of the MessageDigest can be represented as a fixed-length sequence of bytes. The length of this sequence is called the "state size".

- The digest can be described mathematically as having an initial state, a "compression function" (called *compress*), a "padding function" (called *pad*), and a "finalisation function" (called *final*), as follows:

  > *split*(D) = D split into a sequence of n \>= 1 blocks\
  > H<sub>D, 0</sub> = initial state\
  > H<sub>D, i</sub> = *compress*(H<sub>D, i-1</sub>, *split*(D)<sub>i</sub>), for i = 1..n-1\
  > H<sub>D, n</sub> = *compress*(H<sub>D, n-1</sub>, *pad*(*split*(D)<sub>n</sub>))\
  > digest(D) = *final*(H<sub>D, n</sub>)

Block MessageDigest implementations SHOULD provide additional methods to get the state size, the block size, the maximum size of the final block, and to perform the compression, padding, and finalisation functions. This is necessary because some constructions that use MessageDigests, depend on being able to access these parameters and functions independently (rather than treating the digest as a black box).

The representation of the state always uses the same byte order convention as the rest of the algorithm, and chaining variables are represented in the same order as they are numbered or lettered.

Some algorithms, such as GOST-Hash or Panama, are not classified as Block MessageDigests even though it would technically be possible to describe them in the form given above, because the representation of the state is complicated or has not been standardised.

<span id="BRS-Hn"></span>

------------------------------------------------------------------------

? <span class="p">BRS-H1</span>(*cipher*)...<span class="p">BRS-H20</span>(*cipher*)

20 Block MessageDigest Constructions

**Description:**  
The paper by Black, Rogaway, and Shrimpton cited below specifies 20 message digest constructions based on a block cipher, which it refers to as *H*<sub>1</sub> to *H*<sub>20</sub>. BRS-H1 to BRS-H20 are based on these contructions, but with concrete choices for the initial value *h*<sub>0</sub> and the constant value *v* where applicable, and using Merkle-Damgård-strengthening as specified below.

Let B be the cipher block size in bytes. The initial value *h*<sub>0</sub> is the first block of the binary expansion of the fractional part of ![pi](pi.gif), i.e. *h*<sub>0</sub> = I2OSP<sub>B</sub>(floor((![pi](pi.gif) - 3) × 256<sup>B</sup>)). The first 32 bytes of this are:

> `<243F6A8885A308D313198A2E03707344`\
> ` A4093822299F31D0082EFA98EC4E6C89>`

(The BRS paper suggests a zero block for *h*<sub>0</sub>, but this may have unfortunate consequences for the constructions that use *h*<sub>0</sub> as a key, if the zero block is a weak key for the cipher.)

The fixed block *v* used by BRS-H{13,15,16,19} is the first block of the binary expansion of the fractional part of *e* (the base of natural logarithms), i.e. *v* = I2OSP<sub>B</sub>(floor((*e* - 2) × 256<sup>B</sup>)). The first 32 bytes of this are \[\[TBD\]\].

The MD-strengthening is done in the same way as SHA-1. That is:

- pad the message using the [OneAndZeroes](cs.html#pad_OneAndZeroes) padding method, so that 8 bytes remain in the last block for the encoded length.
- append I2OSP<sub>8</sub>(bitlength), i.e. an eight-byte big-endian representation of the length of the message in bits.

The block size, B bytes, MUST also be a valid key size for the cipher. (For BRS-H5 and BRS-H15, this constraint is not absolutely required by the definitions of the constructions, but the general case of BRS-H{5,15} where the message can be processed in blocks corresponding to any valid key size is not currently included in SCAN.)

**Aliases:**  
"Davies-Meyer" is an alias for BRS-H5.

**References:**  
- \[*Def*\] J. Black, P. Rogaway, T. Shrimpton,\
  "Black-Box Analysis of the Block-Cipher-Based Hash-Function Constructions from PGV,"\
  May 31, 2002.\
  <a href="http://www.cs.ucdavis.edu/~rogaway/papers/hash.htm" target="_blank">http://www.cs.ucdavis.edu/~rogaway/papers/hash.htm</a>
- \[*Inf*\] B. Preneel, R. Govaerts, J. Vandewalle,\
  "Hash functions based on block ciphers: A synthetic approach."\
  In Advances in Cryptology - CRYPTO '93, Lecture Notes in Computer Science, pages 368-378. Springer-Verlag, 1994.

**Parameters:**  
- `String cipher` \[creation/read, no default\] - the name of the cipher on which this MessageDigest is to be based. This MUST be an available symmetric block cipher, of block size B \>= 8 bytes. An implementation MAY also require B \<= 32 bytes.

**Digest length:**  
B bytes.

**Block size:**  
B bytes.

**Max. final block size:**  
((-9) mod B) bytes.

**State size:**  
B bytes.

**Missing information:**  
Test vectors; first 32 bytes of expansion of *e*.

**Comments:**  
BRS-H1...BRS-H20 are big-bit-endian and left-justified.

**Security comments:**  
- The digest output length is equal to the cipher block size. There are only a small number of block ciphers with a block size of 160 bits or greater, and arguably none of these have had extensive analysis (especially in the context of use in these 20 hash constructions).
- The black box model used in the BRS paper is controversial. The proofs only cover cases in which the attacker makes *no* use of any non-random properties of the block cipher; they do not imply real-world security against an unconstrained attacker for any particular instantiation of the cipher, under any standard assumption.
- Certain types of key schedule weakness in the block cipher, *even if they only affect a negligable proportion of keys*, can lead to devastating attacks on BRS-H{5...20}. For BRS-H{1...4}, the security of the hash also depends heavily on the strength of the cipher key schedule, but weaknesses that affect only a negligable subset of keys that does not include *h*<sub>0</sub>, do not appear to be as significant.

<span id="GOST-Hash"></span>

------------------------------------------------------------------------

GOST-Hash

MessageDigest

**Alias:**  
"GOST-R-34.11-94"

**Published:**  
1994

**References:**  
- \[*Def*\] GOST R 34.11-94, Gosudarstvennyi Standard of Russian Federation,\
  "Information Technology. Cryptographic Data Security. Hashing function,"\
  Government Committee of the Russia for Standards, 1994 (in Russian).
- \[*An*\] John Kelsey, Bruce Schneier, David Wagner,\
  "Key-schedule cryptanalysis of IDEA, G-DES, GOST, SAFER, and triple-DES,"\
  Advances in Cryptology - CRYPTO '96 Proceedings, Volume 1109 of Lecture Notes in Computer Science (N. Koblitz, ed.), Springer-Verlag, 1996.\
  <http://www.cs.berkeley.edu/~daw/papers/keysched-crypto96.ps>
- \[*Impl, Inf, Test*\] Markku-Juhani Saarinen,\
  C implementation and test vectors for GOST hash function,\
  <http://www.tcs.hut.fi/~mjos/gosthash.tar.gz>\
  \[This also contains *draft* translations into English of the GOST 28147-89 and GOST R 34.11-94 standards.\]

**Digest length:**  
32 bytes.

**Comments:**  
- The description of GOST-Hash in Applied Cryptography section 18.11 is incorrect.
- GOST-Hash is not defined for bit string inputs.

**Security comments:**  
- According to <a href="http://www.tcs.hut.fi/~mjos/" target="_blank">Markku-Juhani Saarinen</a>, "[\[GOST\] 28147](cs.html#GOST), the only nonlinear part of R 34.11-94, has huge weak key classes and bit changes take 8 or 9 rounds to affect all other bits."
- According to Bruce Schneier (posting to sci.crypt, 12 Nov 1998), "GOST has a 256-bit key, but its key schedule is so weak that I would not use it as a hash function under any circumstances."

<span id="HAS-V"></span>

------------------------------------------------------------------------

? <span class="p">HAS-V</span>\[(*digestLength*)\]

Block MessageDigest

**Designers:**  
Nan Kyoung Park, Joon Ho Hwang, Pil Joong Lee

**Published:**  
2000

**References:**  
- \[*Def, An*\] Nan Kyoung Park, Joon Ho Hwang, Pil Joong Lee,\
  "HAS-V: A New Hash Function with Variable Output Length,"\
  Proceedings of the Seventh Annual Workshop on Selected Areas in Cryptography, August 2000 (Waterloo, Ontario, Canada).\
  Volume 2012 of Lecture Notes in Computer Science (Doug Stinson and Stafford Tavares, eds.), p. 202 ff. Springer-Verlag.

**Parameters:**  
- `Integer digestLength` \[creation/read, default 40\] - the length of the output in bytes (minimum 16, maximum 40, multiple of 4)

**Digest length:**  
As specified by the `digestLength` parameter (in bytes).

**Block size:**  
128 bytes.

**Max. final block size:**  
118 bytes.

**State size:**  
40 bytes.

**Missing information:**  
Test vectors for tailored output (*digestLength* \< 40).

**Comment:**  
HAS-V is big-bit-endian, little-byte-endian, and left-justified. (Note the opposite bit and byte order.)

<span id="HAVAL"></span>

------------------------------------------------------------------------

HAVAL\[(*digestLength*\[*,passes*\])\]

Block MessageDigest

**Designers:**  
<a href="http://www.sis.uncc.edu/~yzheng/" target="_blank">Yuliang Zheng</a>, Josef Pieprzyk, <a href="http://www.itacs.uow.edu.au/people/jennie/" target="_blank">Jennifer Seberry</a>

**Published:**  
1992

**Alias:**  
"OpenPGP.Digest.7" for HAVAL(20,5)

**References:**  
- \[*Def, An*\] Yuliang Zheng, Josef Pieprzyk, Jennifer Seberry,\
  "HAVAL -- a one-way hashing algorithm with variable length of output",\
  Advances in Cryptology - AUSCRYPT '92 Proceedings, Lecture Notes in Computer Science, Springer-Verlag, 1993.\
  Available from <a href="http://www.sis.uncc.edu/~yzheng/src/" target="_blank">http://www.sis.uncc.edu/~yzheng/src/</a>\
  <span class="error">(This paper contains errors concerning bit and byte order; see comments below.)</span>
- \[*Inf, Test, Impl*\] Yuliang Zheng, Josef Pieprzyk, Jennifer Seberry,\
  HAVAL reference implementation (in C),\
  Corrected version, April 1997.\
  Available from <a href="http://www.sis.uncc.edu/~yzheng/src/" target="_blank">http://www.sis.uncc.edu/~yzheng/src/</a>\
- \[*An*\] Kasselman, Penzhorn,\
  "Cryptanalysis of Reduced Version of HAVAL",\
  Electronics letters, Vol. 36, No. 1, January 2000, pp. 30-31.
- \[*An*\] Sangwoo Park, Soo Hak Sung, Seongtaek Chee, Jongin Lim,\
  "On the Security of Reduced Versions of 3-Pass HAVAL,"\
  Proceedings of Information Security and Privacy -- 7th Australasian Conference, ACISP 2002, (3-5 July 2002, Melbourne, Australia).\
  Volume 2384 of Lecture Notes in Computer Science (L. Batten and J. Seberry, eds.), pp. 406-419. Springer-Verlag.

**Parameters:**  
- `Integer digestLength` \[creation/read, default 32\] - the length of the output in bytes (minimum 16, maximum 32, multiple of 4)
- `Integer passes` \[creation/read, default 5\] - the number of passes to be performed (minimum 3, maximum 5)

**Digest length:**  
As specified by the `digestLength` parameter (in bytes).

**Block size:**  
128 bytes.

**Max. final block size:**  
117 bytes.

**State size:**  
32 bytes.

**Comments:**  
- The default for the `passes` parameter has been changed from 3 to 5 since SCAN 1.0.9, which is a backward-incompatible change.

- HAVAL is little-bit-endian, little-byte-endian, and right-justified.

  Note that the beginning of section 2 of the HAVAL specification (`haval.ps`) appears to say that HAVAL is big-bit-endian, big-byte-endian and left-justified -- at least if the "left" of a bit or byte string is interpreted as being first. However, the C reference code and test vectors contradict this. We take the test vectors from the files `haval.cert` and `cert.data` in the April 1997 version of `haval.tar.Z` (which are written in the usual left-to-right order) as being definitive.

**Security comment:**  
5 passes are recommended, to protect against the attacks described in the paper "Cryptanalysis of Reduced Version of HAVAL".

<span id="MD2"></span>

------------------------------------------------------------------------

MD2

Block MessageDigest

**Designer:**  
<a href="http://theory.lcs.mit.edu/~rivest/" target="_blank">Ron Rivest</a>

**Alias:**  
"OpenPGP.Digest.5"

**Object Identifier:**  
1.2.840.113549.2.2

**References:**  
- \[*Def, Impl, Test*\] Burt Kaliski,\
  "The MD2 Message-Digest Algorithm,"\
  <a href="http://www.rfc-editor.org/rfc/rfc1319.txt" target="_blank">RFC 1319</a>, April 1992.\
  <span class="error">(This contains errors; see the <a href="http://www.rfc-editor.org/errata.html" target="_blank">RFC Errata page</a> and comments below.)</span>
- \[*Inf*\] Bruce Schneier,\
  "Section 18.6 MD2,"\
  Applied Cryptography, Second Edition, John Wiley & Sons, 1996.
- \[*An*\] RSA Laboratories Security Bulletin \#4,\
  <a href="ftp://ftp.rsa.com/pub/pdfs/bulletn4.pdf" target="_blank">ftp://ftp.rsa.com/pub/pdfs/bulletn4.pdf</a>
- \[*An*\] N. Rogier, P. Chauvaud,\
  "The compression function of MD2 is not collision-free,"\
  Workshop record, 2nd Workshop on Selected Areas in Cryptography (SAC '95), Ottowa, Canada, May 18-19 1995.

**Digest length:**  
16 bytes.

**Block size:**  
16 bytes.

**Max. final block size:**  
15 bytes.

**State size:**  
32 bytes (current value of 16-byte checksum, followed by feedback registers).

**Comments:**  
- The pseudocode description of calculating the checksum in section 3.2 of RFC 1319 is inconsistent with the reference code and test vectors; the latter are correct. There is also some missing text in the middle of the last sentence of that section. See the <a href="http://www.rfc-editor.org/errata.html" target="_blank">RFC Errata page</a> for corrections.
- MD2 is not defined on bit strings, and is byte-order-neutral.

**Security comment:**  
N. Rogier and P. Chauvaud have found a method of generating collisions for MD2's compression function. Quoting from RSA Laboratories Security Bulletin \#4:

> \[C\]aution requires that MD2 be no longer recommended for new applications where collision-resistance is required. Questions about the continuing suitability of MD2 for existing applications remain open. \[... O\]ur recommendation would be to upgrade applications away from MD2 whenever it is practical.

<span id="MD4"></span>

------------------------------------------------------------------------

MD4

Block MessageDigest

**Designer:**  
<a href="http://theory.lcs.mit.edu/~rivest/" target="_blank">Ron Rivest</a>

**Published:**  
1990

**Object Identifier:**  
1.2.840.113549.2.4

**References:**  
- \[*Def, Impl, Test*\] Ron Rivest,\
  "The MD4 Message-Digest Algorithm,"\
  <a href="http://www.rfc-editor.org/rfc/rfc1320.txt" target="_blank">RFC 1320</a>, April 1992.
- \[*Inf*\] Bruce Schneier,\
  "Section 18.4 MD4,"\
  Applied Cryptography, Second Edition, John Wiley & Sons, 1996.
- \[*An*\] RSA Laboratories Security Bulletin \#4,\
  <a href="ftp://ftp.rsa.com/pub/pdfs/bulletn4.pdf" target="_blank">ftp://ftp.rsa.com/pub/pdfs/bulletn4.pdf</a>
- \[*An*\] B. den Boer, A. Bosselaers,\
  "An attack on the last two rounds of MD4,"\
  Advances in Cryptology - Proceedings of CRYPTO '91, Volume 576 of Lecture Notes in Computer Science, pp. 194-203. Springer-Verlag, 1992.
- \[*An*\] Serge Vaudenay,\
  "On the need for multipermutations: cryptanalysis of MD4 and SAFER,"\
  Fast Software Encryption, Leuven Workshop, Volume 1008 of Lecture Notes in Computer Science, pp. 286-297. Springer-Verlag, 1995.
- \[*An*\] Hans Dobbertin,\
  "Cryptanalysis of MD4,"\
  Fast Software Encryption, Third International Workshop, Volume 1039 of Lecture Notes in Computer Science (D. Gollmann, ed.), pp. 53-69. Springer-Verlag, 1996.
- \[*An*\] Hidenori Kuwakado, Hatsukazu Tanaka,\
  "New Algorithm for Finding Preimages in a Reduced Version of the MD4 Compression Function,"\
  IEICE Transactions Vol. E83-A No. 1, pp. 97-100, 2000/1. <a href="http://search.ieice.or.jp/2000/files/e000a01.htm#e83-a,1,97" target="_blank">http://search.ieice.or.jp/2000/files/e000a01.htm#e83-a,1,97</a> (or <a href="http://search.ieice.or.jp/2000/pdf/e83-a_1_97.pdf" target="_blank">here</a>)

**Digest length:**  
16 bytes.

**Block size:**  
64 bytes.

**Max. final block size:**  
55 bytes.

**State size:**  
16 bytes.

**Comment:**  
MD4 is big-bit-endian, little-byte-endian, and left-justified. (Note the opposite bit and byte order.)

**Security comment:**  
Bert den Boer, Antoon Bosselaers and Hans Dobbertin have found a method of generating collisions for the full MD4 algorithm. Quoting from RSA Laboratories Security Bulletin \#4:

> \[I\]t has been shown that collisions for MD4 can be found in about a minute on a typical PC. \[...\] MD4 \[...\] should not be used.

<span id="MD5"></span>

------------------------------------------------------------------------

MD5

Block MessageDigest

**Designer:**  
<a href="http://theory.lcs.mit.edu/~rivest/" target="_blank">Ron Rivest</a>

**Alias:**  
"OpenPGP.Digest.1"

**Object Identifier:**  
1.2.840.113549.2.5

**References:**  
- \[*Def, Impl, Test*\] Ron Rivest,\
  "The MD5 Message-Digest Algorithm,"\
  <a href="http://www.rfc-editor.org/rfc/rfc1321.txt" target="_blank">RFC 1321</a>, April 1992.
- \[*Inf*\] Bruce Schneier,\
  "Section 18.5 MD5,"\
  Applied Cryptography, Second Edition, John Wiley & Sons, 1996.
- \[*An*\] Thomas Berson,\
  "Differential Cryptanalysis Mod 2<sup>32</sup> with Applications to MD5,"\
  Advances in Cryptology - EuroCrypt '92 Proceedings, Volume 658 of Lecture Notes in Computer Science, Springer-Verlag.
- \[*An*\] RSA Laboratories Security Bulletin \#4,\
  <a href="ftp://ftp.rsa.com/pub/pdfs/bulletn4.pdf" target="_blank">ftp://ftp.rsa.com/pub/pdfs/bulletn4.pdf</a>
- \[*An*\] Hans Dobbertin,\
  Cryptanalysis of MD5 Compress,\
  <http://www-cse.ucsd.edu/~bsy/dobbertin.ps>

**Digest length:**  
16 bytes.

**Block size:**  
64 bytes.

**Max. final block size:**  
55 bytes.

**State size:**  
16 bytes.

**Comments:**  
- <a href="http://www.faqs.org/faqs/cryptography-faq/part07/" target="_blank">Section 7 of the sci.crypt FAQ</a> says:

  > Note that a transcription error was found in the original MD5 draft RFC. The corrected algorithm should be called MD5a, though some people refer to it as MD5.

  This is wrong; the corrected algorithm should be called MD5, and is in practice never referred to as MD5a.

- MD5 is big-bit-endian, little-byte-endian, and left-justified. (Note the opposite bit and byte order.)

**Security comment:**  
Hans Dobbertin has found a method of generating collisions for MD5's compression function. Quoting from RSA Laboratories Security Bulletin \#4:

> Given the surprising speed with which techniques on MD4 were extended to MD5 we feel that it is only prudent to draw a cautious conclusion and to expect that collisions for the entire hash function might soon be found.

In addition, the 128-bit output is arguably not long enough to make generating collisions using a birthday attack infeasible.

<span id="Panama"></span>

------------------------------------------------------------------------

Panama

MessageDigest

**Designers:**  
<a href="http://www.esat.kuleuven.ac.be/~rijmen/daemen.html" target="_blank">Joan Daemen</a>, <a href="http://standard.pictel.com/ftp/research/security/readme.txt" target="_blank">Craig Clapp</a>

**Published:**  
1998

**References:**  
- \[*Def, An*\] Joan Daemen, Craig Clapp,\
  "Fast Hashing and Stream Encryption with Panama,"\
  Fast Software Encryption '98, Volume 1372 of Lecture Notes in Computer Science (S. Vaudenay, ed.), pp. 60-74. Springer-Verlag, 1998.\
  <a href="http://standard.pictel.com/ftp/research/security/panama.pdf" target="_blank">http://standard.pictel.com/ftp/research/security/panama.pdf</a>
- \[*Inf, Impl, Test*\] Joan Daemen,\
  Panama reference implementation (in C),\
  <a href="http://www.esat.kuleuven.ac.be/~rijmen/daemen/panama.zip" target="_blank">http://www.esat.kuleuven.ac.be/~rijmen/daemen/panama.zip</a>
- \[*An*\] Vincent Rijmen, Bart van Rompay, Bart Preneel, Joos Vandewalle,\
  "Producing Collisions for PANAMA,"\
  Presented at Fast Software Encryption 2001, Yokohama, Japan.

**Digest length:**  
32 bytes.

**Comments:**  
- The description of Panama in the December 1998 issue of Dr. Dobb's Journal is incorrect.

- The C reference code, and its output in `panavecs.txt`, use an unconventional byte order when printing test vectors (the order of bytes is reversed across the whole block).

  For reference, the first and last test vectors in the last section of `panavecs.txt` (input "The quick brown fox jumps over the lazy dog" represented in US-ASCII and truncated to various lengths), written using the usual left-to-right convention, are:

         input  = "T"
         output = <049D698307D8541F22870DFA0A551099
                   D3D02BC6D57C610A06A4585ED8D35FF8>

         input  = "The quick brown fox jumps over the lazy dog"
         output = <5F5CA355B90AC622B0AA7E654EF5F27E
                   9E75111415B48B8AFE3ADD1C6B89CBA1>

- Panama is little-bit-endian, little-byte-endian, and right-justified.

<span id="RIPEMD-128"></span>

------------------------------------------------------------------------

RIPEMD-128

Block MessageDigest

**Designers:**  
Hans Dobbertin, <a href="http://www.esat.kuleuven.ac.be/~bosselae/" target="_blank">Antoon Bosselaers</a>, <a href="http://www.esat.kuleuven.ac.be/~preneel/" target="_blank">Bart Preneel</a>

**Published:**  
April 1996

**Alias:**  
"RIPEMD128"

**Object Identifier:**  
1.3.36.3.2.2

**References:**  
- \[*Def, An*\] Hans Dobbertin, Antoon Bosselaers, Bart Preneel,\
  RIPEMD-160: A Strengthened Version of RIPEMD.\
  A joint publication by the German Information Security Agency (POB 20 03 63, D-53133 Bonn, Germany) and the Katholieke Universiteit Leuven, ESAT-COSIC (K. Mercierlaan 94, B-3001 Heverlee, Belgium), 18 April 1996.\
  Available from <http://www.esat.kuleuven.ac.be/~bosselae/ripemd160.html>
- \[*Inf, Impl, Test*\] Hans Dobbertin, Antoon Bosselaers, Bart Preneel,\
  The RIPEMD-160 page,\
  <a href="http://www.esat.kuleuven.ac.be/~bosselae/ripemd160.html" target="_blank">http://www.esat.kuleuven.ac.be/~bosselae/ripemd160.html</a>
- \[*Inf*\] ISO/IEC 10118-3:1998,\
  Information technology -- Security techniques -- Hash-functions -- Part 3: Dedicated hash-functions.\
  To order: <a href="http://www.iso.ch/cate/d25428.html" target="_blank">http://www.iso.ch/cate/d25428.html</a>

**Digest length:**  
16 bytes.

**Block size:**  
64 bytes.

**Max. final block size:**  
55 bytes.

**State size:**  
16 bytes.

**Comment:**  
RIPEMD-128 is big-bit-endian, little-byte-endian, and left-justified. (Note the opposite bit and byte order.) SCAN 1.0.16 incorrectly stated "little-bit-endian, little-byte-endian, and right-justified".

**Security comment:**  
The 128-bit output is arguably not long enough to make generating collisions using a birthday attack infeasible.

<span id="RIPEMD-160"></span>

------------------------------------------------------------------------

RIPEMD-160

Block MessageDigest

**Designers:**  
Hans Dobbertin, <a href="http://www.esat.kuleuven.ac.be/~bosselae/" target="_blank">Antoon Bosselaers</a>, <a href="http://www.esat.kuleuven.ac.be/~preneel/" target="_blank">Bart Preneel</a>

**Published:**  
April 1996

**Aliases:**  
"RIPEMD160", "OpenPGP.Digest.3"

**Object Identifier:**  
1.3.36.3.2.1

**References:**  
- \[*Def, An*\] Hans Dobbertin, Antoon Bosselaers, Bart Preneel,\
  RIPEMD-160: A Strengthened Version of RIPEMD.\
  A joint publication by the German Information Security Agency (POB 20 03 63, D-53133 Bonn, Germany) and the Katholieke Universiteit Leuven, ESAT-COSIC (K. Mercierlaan 94, B-3001 Heverlee, Belgium), 18 April 1996.\
  Available from <http://www.esat.kuleuven.ac.be/~bosselae/ripemd160.html>
- \[*Inf, Impl, Test*\] Hans Dobbertin, Antoon Bosselaers, Bart Preneel,\
  The RIPEMD-160 page,\
  <a href="http://www.esat.kuleuven.ac.be/~bosselae/ripemd160.html" target="_blank">http://www.esat.kuleuven.ac.be/~bosselae/ripemd160.html</a>
- \[*Inf*\] A. Menezes, P.C. van Oorschot, S.A. Vanstone,\
  "Algorithm 9.55 RIPEMD-160 hash function,"\
  Handbook of Applied Cryptography, CRC Press, 1997.\
  <a href="http://www.cacr.math.uwaterloo.ca/hac/about/chap9.pdf" target="_blank">http://www.cacr.math.uwaterloo.ca/hac/about/chap9.pdf</a>, [.ps](http://www.cacr.math.uwaterloo.ca/hac/about/chap9.ps)
- \[*Inf*\] ISO/IEC 10118-3:1998,\
  Information technology -- Security techniques -- Hash-functions -- Part 3: Dedicated hash-functions.\
  To order: <a href="http://www.iso.ch/cate/d25428.html" target="_blank">http://www.iso.ch/cate/d25428.html</a>

**Digest length:**  
20 bytes.

**Block size:**  
64 bytes.

**Max. final block size:**  
55 bytes.

**State size:**  
20 bytes.

**Comment:**  
RIPEMD-160 is big-bit-endian, little-byte-endian, and left-justified. (Note the opposite bit and byte order.) SCAN 1.0.16 incorrectly stated "little-bit-endian, little-byte-endian, and right-justified".

<span id="RIPEMD-256"></span>

------------------------------------------------------------------------

RIPEMD-256

Block MessageDigest

**Designers:**  
Hans Dobbertin, <a href="http://www.esat.kuleuven.ac.be/~bosselae/" target="_blank">Antoon Bosselaers</a>, <a href="http://www.esat.kuleuven.ac.be/~preneel/" target="_blank">Bart Preneel</a>

**Published:**  
April 1996

**Alias:**  
"RIPEMD256"

**Description:**  
A double-width variant of [RIPEMD-128](#RIPEMD-128).

**References:**  
- \[*Def, Impl, Test*\] Hans Dobbertin, Antoon Bosselaers, Bart Preneel,\
  The RIPEMD-160 page,\
  <a href="http://www.esat.kuleuven.ac.be/~bosselae/ripemd160.html#extensions" target="_blank">http://www.esat.kuleuven.ac.be/~bosselae/ripemd160.html#extensions</a>

**Digest length:**  
32 bytes.

**Block size:**  
64 bytes.

**Max. final block size:**  
55 bytes.

**State size:**  
16 bytes.

**Comment:**  
RIPEMD-256 is big-bit-endian, little-byte-endian, and left-justified. (Note the opposite bit and byte order.) SCAN 1.0.16 incorrectly stated "little-bit-endian, little-byte-endian, and right-justified".

**Security comment:**  
This message digest is not claimed to provide a security level higher than RIPEMD-128. Since the 128-bit internal state is arguably not long enough to make generating collisions using a birthday attack infeasible, RIPEMD-256 should also not be used for applications where collision-resistance is required. Consider using [SHA-256](#SHA-256) instead.

<span id="RIPEMD-320"></span>

------------------------------------------------------------------------

RIPEMD-320

Block MessageDigest

**Designers:**  
Hans Dobbertin, <a href="http://www.esat.kuleuven.ac.be/~bosselae/" target="_blank">Antoon Bosselaers</a>, <a href="http://www.esat.kuleuven.ac.be/~preneel/" target="_blank">Bart Preneel</a>

**Published:**  
April 1996

**Alias:**  
"RIPEMD320"

**Description:**  
A double-width variant of [RIPEMD-160](#RIPEMD-160).

**References:**  
- \[*Def, Impl, Test*\] Hans Dobbertin, Antoon Bosselaers, Bart Preneel,\
  The RIPEMD-160 page,\
  <a href="http://www.esat.kuleuven.ac.be/~bosselae/ripemd160.html#extensions" target="_blank">http://www.esat.kuleuven.ac.be/~bosselae/ripemd160.html#extensions</a>

**Digest length:**  
40 bytes.

**Block size:**  
64 bytes.

**Max. final block size:**  
55 bytes.

**State size:**  
20 bytes.

**Comment:**  
RIPEMD-320 is big-bit-endian, little-byte-endian, and left-justified. (Note the opposite bit and byte order.) SCAN 1.0.16 incorrectly stated "little-bit-endian, little-byte-endian, and right-justified".

**Security comment:**  
This message digest is not claimed to provide a security level higher than RIPEMD-160. Consider using [SHA-384](#SHA-384), [SHA-512](#SHA-512) or [Whirlpool](#Whirlpool) instead.

<span id="SHA-0"></span>

------------------------------------------------------------------------

SHA-0

Block MessageDigest

**Designers:**  
[U.S. National Security Agency](http://www.nsa.gov/)

**Published:**  
January 1992

**Object Identifier:**  
1.3.14.3.2.13

**References:**  
- \[*Def, Test*\] U.S. National Institute of Standards and Technology,\
  Secure Hash Standard, NIST FIPS PUB 180.
- \[*An*\] Florent Chabaud, Antoine Joux,\
  "Differential Collisions in SHA-0,"\
  Advances in Cryptology - CRYPTO'98, LNCS 1462, H. Krawczyk (Ed.) Springer-Verlag, 1998, pp. 56-71. <a href="http://fchabaud.free.fr/English/Publications/sha.pdf" target="_blank">http://fchabaud.free.fr/English/Publications/sha.pdf</a>, [.ps](http://fchabaud.free.fr/English/Publications/sha.ps)

**Digest length:**  
20 bytes.

**Block size:**  
64 bytes.

**Max. final block size:**  
55 bytes.

**State size:**  
20 bytes.

**Comment:**  
SHA-0 is big-bit-endian, big-byte-endian, and left-justified.

**Security comment:**  
This is the original version of the Secure Hash Algorithm, and has been superceded by SHA-1. Although the motivation for the change leading to SHA-1 was not made public by the NSA, the paper by Chabaud and Joux cited above provides evidence that this change improved security.

<span id="SHA-1"></span>

------------------------------------------------------------------------

SHA-1

Block MessageDigest

**Designers:**  
[U.S. National Security Agency](http://www.nsa.gov/)

**Published:**  
April 1995

**Aliases:**  
"SHA", "SHA1", "OpenPGP.Digest.2", "http://www.w3.org/2000/02/xmldsig#sha1"

**Object Identifier:**  
1.3.14.3.2.26

**References:**  
- \[*Def, Test*\] U.S. National Institute of Standards and Technology,\
  Secure Hash Standard, NIST FIPS PUB 180-1. <a href="http://www.itl.nist.gov/div897/pubs/fip180-1.htm" target="_blank">http://www.itl.nist.gov/div897/pubs/fip180-1.htm</a>
- \[*Test*\] U.S. National Institute of Standards and Technology,\
  SHA-1 Sample Vectors.\
  <a href="http://csrc.nist.gov/cryptval/shs/sha1-vectors.zip" target="_blank">http://csrc.nist.gov/cryptval/shs/sha1-vectors.zip</a>
- \[*Inf*\] Bruce Schneier,\
  "Section 18.7 Secure Hash Algorithm (SHA),"\
  Applied Cryptography, Second Edition, John Wiley & Sons, 1996.
- \[*Inf*\] A. Menezes, P.C. van Oorschot, S.A. Vanstone,\
  "Algorithm 9.53 Secure Hash Algorithm - revised (SHA-1),"\
  Handbook of Applied Cryptography, CRC Press, 1997.\
  <a href="http://www.cacr.math.uwaterloo.ca/hac/about/chap9.pdf" target="_blank">http://www.cacr.math.uwaterloo.ca/hac/about/chap9.pdf</a>, [.ps](http://www.cacr.math.uwaterloo.ca/hac/about/chap9.ps)
- \[*An*\] Florent Chabaud, Antoine Joux,\
  "Differential Collisions in SHA-0,"\
  Advances in Cryptology - CRYPTO'98, LNCS 1462, H. Krawczyk (Ed.) Springer-Verlag, 1998, pp. 56-71. <a href="http://fchabaud.free.fr/English/Publications/sha.pdf" target="_blank">http://fchabaud.free.fr/English/Publications/sha.pdf</a>, [.ps](http://fchabaud.free.fr/English/Publications/sha.ps)

**Digest length:**  
20 bytes.

**Block size:**  
64 bytes.

**Max. final block size:**  
55 bytes.

**State size:**  
20 bytes.

**Comment:**  
SHA-1 is big-bit-endian, big-byte-endian, and left-justified.

<span id="SHA-256"></span>

------------------------------------------------------------------------

SHA-256

Block MessageDigest

**Designers:**  
[U.S. National Security Agency](http://www.nsa.gov/)

**Published:**  
October? 2000

**Object Identifier:**  
2.16.840.1.101.3.4.2.1

**References:**  
- \[*Def, Test*\] U.S. National Institute of Standards and Technology,\
  FIPS 180-2, Secure Hash Standard (SHS).\
  <a href="http://csrc.nist.gov/encryption/tkhash.html" target="_blank">http://csrc.nist.gov/encryption/tkhash.html</a>

**Digest length:**  
32 bytes.

**Block size:**  
64 bytes.

**Max. final block size:**  
55 bytes.

**State size:**  
32 bytes.

**Comments:**  
- SHA-{256,384,512} are big-bit-endian, big-byte-endian, and left-justified.
- When the compression function is used directly, it is considered to include the chaining variable addition (as opposed to being separate as shown in the specification).

<span id="SHA-384"></span>

------------------------------------------------------------------------

SHA-384

Block MessageDigest

**Designers:**  
[U.S. National Security Agency](http://www.nsa.gov/)

**Published:**  
October? 2000

**Object Identifier:**  
2.16.840.1.101.3.4.2.2

**References:**  
\[see references for [SHA-256](#SHA-256)\]

**Digest length:**  
48 bytes.

**Block size:**  
128 bytes.

**Max. final block size:**  
111 bytes.

**State size:**  
64 bytes.

**Comments:**  
\[see comments for [SHA-256](#SHA-256)\]

<span id="SHA-512"></span>

------------------------------------------------------------------------

SHA-512

Block MessageDigest

**Designers:**  
[U.S. National Security Agency](http://www.nsa.gov/)

**Published:**  
October? 2000

**Object Identifier:**  
2.16.840.1.101.3.4.2.3

**References:**  
\[see references for [SHA-256](#SHA-256)\]

**Digest length:**  
64 bytes.

**Block size:**  
128 bytes.

**Max. final block size:**  
111 bytes.

**State size:**  
64 bytes.

**Comment:**  
\[see comments for [SHA-256](#SHA-256)\]

<span id="Snefru-2"></span>

------------------------------------------------------------------------

Snefru-2\[(*digestLength*\[*,passes*\])\]

Block MessageDigest

**Designer:**  
Ralph Merkle

**Published:**  
1990?

**Description:**  
This is version 2.x of Snefru. The version numbers 2.0, 2.1, 2.2, 2.3 and 2.5a for the reference implementation all refer to the same algorithm (although with a different number of default passes). Therefore, it is only necessary to specify the major version number (2) in the algorithm name.

The difference between Snefru-1 and Snefru-2 is that Snefru-2 uses a different set of initial S-boxes, derived from the Rand Corporation's list of random digits.

**References:**  
- \[*Def*, *Test*\] Ralph Merkle,\
  Snefru-2.5a reference implementation and test vectors,\
  <a href="ftp://ftp.parc.xerox.com/pub/hash/hash2.5a/snefru.tar" target="_blank">ftp://ftp.parc.xerox.com/pub/hash/hash2.5a/snefru.tar</a>
- \[*Inf*\] Ralph Merkle,\
  "A Fast One-Way Hash Function,"\
  Journal of Cryptology, Vol. 3, No. 1, pp. 43-58, 1990.\
  \[This describes version 1 of Snefru.\]
- \[*An*\] Eli Biham, Adi Shamir,\
  "Differential Cryptanalysis of Snefru, Khafre, REDOC-II, LOKI and Lucifer,"\
  Extended Abstract in Advances in Cryptology - CRYPTO '91 Proceedings, Volume ??? of Lecture Notes in Computer Science, Springer-Verlag, 1991.

**Parameters:**  
- `Integer digestLength` \[creation/read, default 32\] - the length of the output in bytes (16 or 32)
- `Integer passes` \[creation/read, default 8\] - the number of passes to be performed (4 or 8)

**Digest length:**  
As specified by the `digestLength` parameter (in bytes).

**Block size:**  
For *digestLength* = 16: 48 bytes.\
For *digestLength* = 32: 32 bytes.

**Max. final block size:**  
For *digestLength* = 16: 40 bytes.\
For *digestLength* = 32: 24 bytes.

**State size:**  
32 bytes.

**Comment:**  
Snefru-2 is not defined on bit strings, and is big-byte-endian.

**Security comment:**  
From <a href="ftp://ftp.parc.xerox.com/pub/hash/REWARD" target="_blank">ftp://ftp.parc.xerox.com/pub/hash/REWARD</a>:

> In the author \[Ralph Merkle\]'s opinion, further security analysis of Snefru is required before it can be considered for production use.

<span id="Tiger"></span>

------------------------------------------------------------------------

Tiger\[(*digestLength*\[*,passes*\])\]

Block MessageDigest

**Designers:**  
<a href="http://www.cl.cam.ac.uk/users/rja14/" target="_blank">Ross Anderson</a>, <a href="http://www.cs.technion.ac.il/~biham/" target="_blank">Eli Biham</a>

**Published:**  
1996

**Alias:**  
"OpenPGP.Digest.6" for Tiger(24,3)

**Object Identifier:**  
1.3.6.1.4.1.11591.12.2 for Tiger(24,3)

**References:**  
- \[*Def*\] Ross Anderson, Eli Biham,\
  "Tiger: A Fast New Hash Function,"\
  Proceedings of Fast Software Encryption 3, Cambridge, 1996.\
  <a href="http://www.cs.technion.ac.il/~biham/Reports/Tiger/tiger/tiger.html" target="_blank">http://www.cs.technion.ac.il/~biham/Reports/Tiger/tiger/tiger.html</a> ([.ps.Z format](http://www.cl.cam.ac.uk/ftp/users/rja14/tiger.ps.Z))\
  <span class="error">(See comments below.)</span>
- \[*Def*\] Ross Anderson, Eli Biham,\
  "Generation of the S boxes of Tiger,"\
  <http://www.cl.cam.ac.uk/ftp/users/rja14/tigersb.ps.Z>
- \[*Inf, Impl, Test*\] Ross Anderson, Eli Biham,\
  The Tiger Home Page,\
  <a href="http://www.cs.technion.ac.il/~biham/Reports/Tiger/" target="_blank">http://www.cs.technion.ac.il/~biham/Reports/Tiger/</a>

**Parameters:**  
- `Integer digestLength` \[creation/read, default 24\] - the length of the output in bytes (16, 20 or 24)
- `Integer passes` \[creation/read, default 3\] - the number of passes to be performed (minimum 3)

**Digest length:**  
As specified by the `digestLength` parameter (in bytes).

**Block size:**  
64 bytes.

**Max. final block size:**  
55 bytes.

**State size:**  
24 bytes.

**Comments:**  
- The paper "Tiger: A Fast New Hash Function," specified that padding for Tiger would be done in the same way as the MD4 family, i.e. big-bit-endian, little-byte-endian and left-justified. That would imply that the first byte of padding is 0x80, and the initial version of the Tiger reference implementation was consistent with this interpretation.

  However, it is stated on the Tiger home page that the first byte of padding is intended to be 0x01 (i.e. little-bit-endian, little-byte-endian and right-justified), and that is the interpretation used for the definition of this algorithm, *despite* the fact that it is apparently not consistent with the original paper.

  To confuse matters further, an old copy of the Tiger reference implementation, dated February 1996, was available from Ross Anderson's web site until October 2002. That version should not be used; instead refer to the reference implementation and test vectors at the <a href="http://www.cs.technion.ac.il/~biham/Reports/Tiger/" target="_blank">Tiger home page</a>.

  Finally, note that the test vectors use a non-standard convention for the order of bytes in the output. For reference, the first two test vectors written using the usual left-to-right convention are:

         input  = <>
         output = <3293AC630C13F0245F92BBB1766E16167A4E58492DDE73F3>

         input  = <616263>
         output = <2AAB1484E8C158F2BFB8C5FF41B57A525129131C957B5F93>

- The Tiger paper uses "Tiger#/N" as the name for Tiger with \# passes and N-bit output; this is equivalent to the SCAN name Tiger(N/8,#) (for consistency with other SCAN message digest names).

<span id="Whirlpool-0"></span>

------------------------------------------------------------------------

Whirlpool-0

Block MessageDigest

**Designers:**  
Paulo Barreto, <a href="http://www.esat.kuleuven.ac.be/~rijmen/" target="_blank">Vincent Rijmen</a>

**Published:**  
November 2000

**Description:**  
This is the "original" version of Whirlpool submitted to the first round of the NESSIE project.

**References:**  
- \[*Def*\] Paulo Barreto, Vincent Rijmen,\
  The Whirlpool Hashing Function.\
  Whirlpool.pdf in <http://www.cryptonessie.org/submissions/whirlpool/whirlpool.zip>
- \[*Inf, Impl, Test*\] Paulo Barreto, Vincent Rijmen,\
  The Whirlpool Hashing Function page.\
  <http://planeta.terra.com.br/informatica/paulobarreto/WhirlpoolPage.html>

**Digest length:**  
64 bytes.

**Block size:**  
64 bytes.

**Max. final block size:**  
31 bytes.

**State size:**  
64 bytes.

**Comments:**  
- Whirlpool-0 is big-bit-endian, big-byte-endian, and left-justified.
- SCAN 1.0.13 used the name "Whirlpool" to refer to Whirlpool-0, not to the [tweaked version](#Whirlpool) that is currently assigned that name. This is an incompatible change.

<span id="Whirlpool"></span>

------------------------------------------------------------------------

? <span class="p">Whirlpool</span>

Block MessageDigest

**Designers:**  
Paulo Barreto, <a href="http://www.esat.kuleuven.ac.be/~rijmen/" target="_blank">Vincent Rijmen</a>

**Published:**  
September 2001

**Alias:**  
"Whirlpool-1"

**Description:**  
This is the "tweaked" version of Whirlpool.

**References:**  
- \[*Def*\] Paulo Barreto, Vincent Rijmen,\
  The Whirlpool Hashing Function (Tweaked version).\
  <http://planeta.terra.com.br/informatica/paulobarreto/whirl-tweak.zip>
- \[*Inf, Test*\] Paulo Barreto, Vincent Rijmen,\
  The Whirlpool Hashing Function page.\
  <http://planeta.terra.com.br/informatica/paulobarreto/WhirlpoolPage.html>

**Digest length:**  
64 bytes.

**Block size:**  
64 bytes.

**Max. final block size:**  
31 bytes.

**State size:**  
64 bytes.

**Comments:**  
- Whirlpool is big-bit-endian, big-byte-endian, and left-justified.
- SCAN 1.0.13 used the name "Whirlpool" to refer to Whirlpool-0, not to this tweaked version. This is an incompatible change.
- This algorithm is preferred instead of [Whirlpool-0](#Whirlpool-0).

<span id="MGF1"></span>

------------------------------------------------------------------------

× <span class="x">MGF1</span>(*digest*)

MessageDigest Construction

**Designers:**  
<a href="http://www-cse.ucsd.edu/users/mihir/" target="_blank">Mihir Bellare</a>, <a href="http://www.cs.ucdavis.edu/~rogaway/" target="_blank">Phillip Rogaway</a>, P1363 Working Group

**Published:**  
1999

**Description:**  
MGF1 is defined as:

> MGF1(*digest*)(*input*) =\
> `    `*digest*(*input* \|\| I2OSP<sub>4</sub>(0)) \|\|\
> `    `*digest*(*input* \|\| I2OSP<sub>4</sub>(1)) \|\|\
> `    `*digest*(*input* \|\| I2OSP<sub>4</sub>(2)) \|\| ...

The maximum output length is (2<sup>32</sup> - 1) × (output length of digest).

This is the same as the definition given in PKCS \#1 v2.0.\
**See the comments below concerning compatibility with IEEE P1363a.**

**References:**  
- \[*Def*\] RSA Security, Inc.,\
  PKCS \#1: RSA Cryptography Standard, version 2.0.\
  <a href="http://www.rsalabs.com/pkcs/pkcs-1/" target="_blank">http://www.rsalabs.com/pkcs/pkcs-1/</a>
- \[*Inf*\] IEEE,\
  IEEE Std 1363-2000: Standard Specifications For Public Key Cryptography.\
  <a href="http://grouper.ieee.org/groups/1363/index.html" target="_blank">http://grouper.ieee.org/groups/1363/index.html</a>
- \[*An*\] Victor Shoup,\
  "A Proposal for an ISO Standard for Public Key Encryption (version 2.1)"\
  Revised December 20, 2001.\
  <a href="http://www.shoup.net/papers/" target="_blank">http://www.shoup.net/papers/</a>
- \[*Test*\] RSA Security, Inc.,\
  Test vectors for OAEP-based encryption scheme: \#1 and \#2,\
  <a href="ftp://ftp.rsasecurity.com/pub/pkcs/pkcs-1v2/p1ovect1.txt" target="_blank">ftp://ftp.rsasecurity.com/pub/pkcs/pkcs-1v2/p1ovect1.txt</a>\
  <a href="ftp://ftp.rsasecurity.com/pub/pkcs/pkcs-1v2/p1ovect2.txt" target="_blank">ftp://ftp.rsasecurity.com/pub/pkcs/pkcs-1v2/p1ovect2.txt</a>\
  \[these test vectors are for RSA/OAEP-MGF1(SHA-1), but include inputs and outputs for MGF1(SHA-1)\]

**Parameters:**  
- `String digest` \[creation/read, no default\] - the name of the message digest on which this PRF is to be based.

**Missing information:**  
Test vectors when used with a little-bit-endian hash function.

**Comments:**  
- If the current P1363a definition of MGF1 were used with a little-bit-endian message digest, then it would be incompatible with this algorithm. This is because, in the P1363a definition, byte string key inputs are converted to a bit string using the OS2BSP primitive (which always uses big-bit-endian order), and then processed by the digest function using its native bit order. Therefore the bits in each byte of the key would need to be reversed, relative to the algorithm defined here and in PKCS \#1 v2.0.
  However, P1363a only defines MGF1 for a specific set of message digest functions: SHA-1, SHA-{256,384,512}, and RIPEMD-160. All of these are big-bit-endian, and so there is no incompatibility in practice. It is likely that if some future amendment of IEEE Std 1363 allowed any little-bit-endian digest functions, it would correct this bit order problem.

- SCAN 1.0.12 classified MGF1 as a PRF/KDF, by setting the input to (*key* \|\| *seed*). However, that would have allowed extension attacks (due to the Markle-Damgård structure of most message digest algorithms). Thanks to Richard Parker for this observation. SCAN 1.0.13-17 disallowed use of the seed input, but still had MGF1 in the <a href="prfi.html" target="_top">PRF/KDF section</a>.

  The classification of MGF1 as a message digest is incompatible with versions of SCAN before 1.0.18. If a PRF is required, use an algorithm designed for that purpose, such as [HMAC-PRF](prf.html#HMAC-PRF).

**Security comment:**  
In section 12.3 of the cited paper by Victor Shoup, use of MGF1 (which is referred to there as "KDF1") for applications that require entropy smoothing, is criticised as being dependent on the security of "a quite unorthodox construction that does not appear to be based on any well-worn or otherwise sound principles."

<span id="Parallel"></span>

------------------------------------------------------------------------

Parallel(*digestNames*+)

MessageDigest Construction

**Description:**  
This output of this algorithm is obtained by concatenating the outputs of each of the listed algorithms. For example, "Parallel(SHA-1,RIPEMD-160)" produces a 40-byte output, the first half of which is calculated by applying SHA-1 to the input, and the second half by applying RIPEMD-160. Any non-zero number of algorithms may be listed, separated by commas.

**Parameters:**  
- `String[] digestNames` \[creation/read, no default\] - the list of component digest algorithm names. Reading this property MUST return an unaliased array; changing the array will not affect the algorithm.

**Digest length:**  
The sum of the digest lengths of the component algorithms.

**Security comments:**  
- This construction is provably at least as resistant to collisions as the most collision-resistant of the component algorithms. However, it does not help to prevent attacks against pre-image resistance, and probably should only be used in applications where the most important required property is collision resistance.
- All of the component algorithms should be distinct, since otherwise parts of the output will be repeated, which would be a serious weakness in some applications.

<span id="alleged"></span>

------------------------------------------------------------------------

### Alleged MessageDigests

- <a href="http://www.randombit.net/misc/has160.txt" class="a" target="_blank">HAS-160</a> is an earlier version of [HAS-V](#HAS-V).
- <a href="http://eprint.iacr.org/1997/001/" class="a" target="_blank">MuHASH, AdHASH, LtHASH</a>.
- <span class="a">NASD</span> is <span class="a">AdHASH</span> with small parameters, and is <a href="http://citeseer.nj.nec.com/wagner02generalized.html" target="_blank">broken</a>.
- <span class="a">FFT-Hash-I</span> \[Crypto '91 rump session\] is <a href="http://www.esat.kuleuven.ac.be/~cosicart/pdf/JD-9100.pdf" target="_blank">broken</a>.
- <a href="http://planeta.terra.com.br/informatica/paulobarreto/hflounge.html#S92" class="a" target="_blank">FFT-Hash-II</a> is <a href="http://planeta.terra.com.br/informatica/paulobarreto/hflounge.html#V92" target="_blank">broken</a>.
- <a href="http://citeseer.nj.nec.com/context/89936/0" class="a" target="_blank">N-Hash</a> is <a href="http://citeseer.nj.nec.com/86579.html" target="_blank">broken</a>. (Apparently two variants with variable \# of rounds.)
- [<span class="a">Decimal-Shift-and-Add</span> is broken](http://islab.oregonstate.edu/documents/People/preneel/hash.ps).
- <a href="http://planeta.terra.com.br/informatica/paulobarreto/hflounge.html#AR92" class="a" target="_blank">AR</a> is <a href="http://planeta.terra.com.br/informatica/paulobarreto/hflounge.html#DK93" target="_blank">broken</a>.
- <a href="http://planeta.terra.com.br/informatica/paulobarreto/hflounge.html#DGV92a" class="a" target="_blank">Boognish</a> is <a href="http://planeta.terra.com.br/informatica/paulobarreto/hflounge.html#JD02" target="_blank">"certainly weak"</a>, according to Joan Daemen.
- <a href="http://planeta.terra.com.br/informatica/paulobarreto/hflounge.html#JD95" class="a" target="_blank">StepRightUp</a> is <a href="http://planeta.terra.com.br/informatica/paulobarreto/hflounge.html#RRPV01" target="_blank">broken</a>. ([Panama](#Panama) derives from StepRightUp.)
- <a href="http://planeta.terra.com.br/informatica/paulobarreto/hflounge.html#RIPE92" class="a" target="_blank">RIPEMD</a> is <a href="http://planeta.terra.com.br/informatica/paulobarreto/hflounge.html#D97" target="_blank">broken</a> \[also HAC p380\].
- <a href="http://planeta.terra.com.br/informatica/paulobarreto/hflounge.html#DGV91" class="a" target="_blank">Cellhash</a>.
- <a href="http://planeta.terra.com.br/informatica/paulobarreto/hflounge.html#DGV92b" class="a" target="_blank">Subhash</a> \[paper on-line <a href="http://www.esat.kuleuven.ac.be/~cosicart/pub92.html" target="_blank">here</a>\]. 128-bit output. Based on Subterranean stream/hash module; derives from Cellhash.
- <span class="a">Snefru-1</span> \[see refs for [Snefru-2](#Snefru-2)\].
- <span class="a">BCA</span> (Binary Condensing Algorithm). Mentioned in Snefru-1 paper.
- <span class="a">Extended-MD4</span> is broken \[HAC p380\].
- <span class="a">MD3</span> \[AC2 p446\]. RSA Labs TR-101, apparently not on-line.
- <span class="a">SL2</span> \[CRYPTO '94\] is broken \[AC2 p446, ASIACRYPT '94\].
- <span class="a">sqmodn</span> is broken \[HAC p381\].
- <span class="a">MASH-1</span>, <span class="a">MASH-2</span> \[HAC p351\].
- <span class="a">MDC-2</span>(*cipher*), <span class="a">MDC-4</span>(*cipher*) \[HAC p378\].
- <span class="a">Merkle</span>(*cipher*) \[HAC p339, p378\].
- <span class="a">Merkle-Preneel</span>(*cipher*) \[HAC p378\].
- <span class="a">Tandem-Davies-Meyer</span>(*cipher*) \[HAC p380\].
- <span class="a">Abreast-Davies-Meyer</span>(*cipher*) \[HAC p380\].
- <span class="a">Modified-Davies-Meyer</span>(*cipher*) \[AC2 p449\]. Probably a duplicate of Tandem- or Abreast-Davies-Meyer.\
  (Note that ordinary, single-block-output Davies-Meyer is included in SCAN as [BRS-H5](#BRS-Hn).)
- <span class="a">Lai-Massey</span>(*cipher*) \[HAC p380; the "third m-bit hash function" of HAC ref. \[729\]).
- <span class="a">Miyaguchi-Preneel</span>(*cipher*) \[HAC\].
- <span class="a">Matyas-Meyer-Oseas</span>(*cipher*) \[HAC\].
- <span class="a">QG-original</span>(*cipher*), <span class="a">QG-revised</span>(*cipher*) \[HAC p379\].
- <span class="a">LOKI-DBH</span> \[HAC p379\].
- IBC-Hash \[AC2 p458\] is actually a MAC.
- also see the [UniversalHash](uh.html) category.

------------------------------------------------------------------------

<img src="cryptix-s.gif" data-align="right" />

<a href="http://validator.w3.org/check/referer" target="_blank"><img src="vh40.gif" data-border="0" width="88" height="31" alt="Valid HTML 4.0" /></a> <a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank"><img src="vcss.gif" data-border="0" width="88" height="31" alt="Valid CSS" /></a>

[Copyright and trademarks](intro.html#copyright)
