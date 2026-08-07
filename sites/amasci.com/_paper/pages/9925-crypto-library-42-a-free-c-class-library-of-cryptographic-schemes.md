---
title: "Crypto++ Library 4.2 - a Free C++ Class Library of Cryptographic Schemes"
source_domain: amasci.com
source_path: ~weidai/cryptlib.v42.html
order: 9925
reachable_from_entry: false
images: 2
internal_links: 13
extracted: 2026-08-07T17:18:16Z
extractor: site_to_paper.py (pandoc)
---

# Crypto++ Library 4.2 - a Free C++ Class Library of Cryptographic Schemes

*Source page: `~weidai/cryptlib.v42.html`*

[news](#news)

[platforms](#platforms)

[download](#download)

[manual](http://cryptopp.sourceforge.net/docs/ref/)

[CVS](http://sourceforge.net/cvs/?group_id=6152)

[FAQ](http://www.eskimo.com/~weidai/cgi-bin/fom.cgi)

[mailing lists](#lists)

[related links](http://www.mobiuslinks.com/links.asp?sid=1)

# Crypto++™ Library 4.2

## What is it?

Crypto++ Library is a free C++ class library of cryptographic schemes. Currently the library consists of the following, some of which are other people's code, repackaged into classes.

- a class hierarchy with an API defined by abstract base classes
- Proposed [AES](http://csrc.nist.gov/encryption/aes/aes_home.htm) ([Rijndael](http://www.esat.kuleuven.ac.be/~rijmen/rijndael/)) and other AES candidates: [RC6](http://www.rsa.com/rsalabs/aes), [MARS](http://www.research.ibm.com/security/mars.html), [Twofish](http://www.counterpane.com/twofish.html), [Serpent](http://www.cl.cam.ac.uk/~rja14/serpent.html), [CAST-256](http://www.ietf.org/rfc/rfc2612.txt)
- other [symmetric block ciphers](algorithms.html#symmetric): [IDEA](algorithms.html#idea), DES, Triple DES (DES-EDE2 and DES-EDE3), DESX (DES-XEX3), RC2, RC5, Blowfish, Diamond2, TEA, [SAFER](algorithms.html#safer), 3-WAY, GOST, SHARK, CAST-128, Square, Skipjack
- generic [cipher modes](algorithms.html#modes): CBC padded, CBC ciphertext stealing (CTS), CFB, OFB, counter mode
- stream ciphers: Panama, ARC4, SEAL, WAKE, Sapphire II, BlumBlumShub
- [public key cryptography](algorithms.html#assymetric): [RSA](algorithms.html#rsa), [DSA](algorithms.html#dss), [ElGamal](algorithms.html#elgamal), Nyberg-Rueppel (NR), BlumGoldwasser, Rabin, Rabin-Williams (RW), [LUC](algorithms.html#luc), LUCELG
- padding schemes for public-key systems: PKCS#1 v2.0, OAEP, PSSR, IEEE P1363 EMSA2
- key agreement schemes: [Diffie-Hellman](algorithms.html#diffie_hellman) (DH), Unified Diffie-Hellman (DH2), Menezes-Qu-Vanstone (MQV), LUCDIF, XTR-DH
- [elliptic curve cryptography](http://www2.certicom.com/ecc/index.htm): ECDSA, ECNR, ECIES, ECDHC, ECMQVC
- one-way hash functions: [SHA-1](http://www.nist.gov/sha), MD2, MD4, [MD5](algorithms.html#md5), HAVAL, RIPEMD-160, Tiger, SHA-2 (SHA-256, SHA-384, and SHA-512), Panama
- message authentication codes: MD5-MAC, HMAC, XOR-MAC, CBC-MAC, DMAC
- [cipher constructions based on hash functions](algorithms.html#hash_cipher): Luby-Rackoff, MDC
- pseudo random number generators (PRNG): ANSI X9.17 appendix C, PGP's RandPool
- Shamir's [secret sharing scheme](http://www.rsa.com/rsalabs/faq/html/3-6-12.html) and Rabin's information dispersal algorithm (IDA)
- DEFLATE (RFC 1951) [compression/decompression](http://www.cis.ohio-state.edu/hypertext/faq/usenet/compression-faq/part2/faq-doc-1.html) with gzip (RFC 1952) and zlib (RFC 1950) format support
- fast multi-precision integer (bignum) and polynomial operations
- finite field arithmetics, including GF(p) and GF(2^n)
- [prime number](http://www.utm.edu/research/primes/prove/) generation and verification
- various miscellaneous modules such as base 64 coding and 32-bit CRC
- class wrappers for these operating system features (optional):
  - high resolution timers on Windows, Unix, and MacOS
  - Berkeley and Windows style sockets
  - Windows named pipes
  - /dev/random and /dev/urandom on Linux and FreeBSD
  - Microsoft's CryptGenRandom on Windows
- A high level interface for most of the above, using a [filter/pipeline](http://cryptopp.sourceforge.net/cgi-bin/fom?file=29) metaphor
- [benchmarks](benchmarks.html) and validation testing

One purpose of Crypto++ is to act as a repository of public domain (not copyrighted) source code. Although the library is copyrighted as a compilation, the individual files in it (except for a few exceptions listed in the [license](LICENSE.txt)) are in the public domain.

## <span id="news">What's new?</span>

- 8/26/2002 - Added porting note for Sun WorkShop 6 with Forte C++
- 2/19/2002 - Added note that no modification is needed to compile Crypto++ 4.2 with MSVC .NET.
- 11/5/2001 - Version 4.2 released.
  - added HMAC support for longer keys
  - added MD4 (which is not secure so use for compatibility purposes only)
  - added compatibility fixes/workarounds for STLport 4.5, GCC 3.0.2, and MSVC 7.0
  - changed MD2 to use public domain code
  - fixed a bug with decompressing multiple messages with the same object
  - fixed a bug in CBC-MAC with MACing multiple messages with the same object
  - fixed a bug in RC5 and RC6 with zero-length keys
  - fixed a bug in Adler32 where incorrect checksum may be generated
- 7/1/2001 - Added a list of [recommended books](http://www.mobiuslinks.com/links.asp?sid=102) for Crypto++ users.
- 6/2/2001 - Daniel LEON's [patch for Borland C++Builder 5](http://www.chez.com/psylon/cppbuilder/cryptopp/ReadMepatch41.htm) has been updated to work around more problems.
- 5/25/2001 - Added links to denis bider's [Crypto++ User Guide](http://www.bitvise.com/users-guide.html) and Daniel LEON's [patch for compiling with Borland C++Builder 5](http://www.chez.com/psylon/cppbuilder/cryptopp/ReadMepatch41.htm).
- 4/14/2001 - Posted [project file](crypto++.v41.mcp.zip) for CodeWarrior 6.1.

## <span id="platforms">Platforms</span>

Crypto++ was designed to be easily portable to a large variety of platforms. Unfortunately most compilers do not have a complete implementation of the C++ standard yet, and only the latest version of Crypto++ incorporates all of the workarounds needed to compile on most popular compilers. These porting notes will help you compile earlier versions of Crypto++.

Compiler

OS

To Compile Crypto++ 3.2

To Compile Crypto++ 4.1

To Compile Crypto++ 4.2

MSVC 6.0 SP5

WIN32

no changes needed

no changes needed

no changes needed

MSVC .NET

WIN32

not recommended

not recommended

no changes needed

Borland C++Builder 5

WIN32

[see note](borland5.txt)

[patch available](http://www.chez.com/psylon/cppbuilder/cryptopp/ReadMepatch41.htm) by Daniel LEON ([local mirror](borland5-patch41b.zip))

no patch available yet

GCC 2.95.2

UNIX/WIN32/BeOS

no changes needed

no changes needed

no changes needed

MSDOS\
(DJGPP 2.03)

replace [Makefile](djgpp-Makefile)

no changes needed

no changes needed

GCC 3.0.2

UNIX/WIN32/BeOS

not recommended

not recommended

no changes needed

CodeWarrior Pro 5.3

MacOS

no changes needed\
project file by Ranko Orlic: [stuffed](crypto++.v32.mcp.sit), [zipped](crypto++.v32.mcp.zip)

no changes needed

unknown

WIN32

CodeWarrior Pro 6.1

MacOS

[project file](cw6-crypto++.mcp.sit) and [porting notes](codewarrior6.txt) by Jeff Watkins

no changes needed\
[project file](crypto++.v41.mcp.zip) now available\
(based on Ranko Orlic's contribution)

no changes needed, use 4.1 project file

WIN32

not recommended

Sun WorkShop 6, Forte C++

Solaris

not recommended

not recommended

[note](forte6.txt) and [diff](forte6-diff.txt) by David Lamkin

## <span id="download">Download</span>

US Original

[US Mirror](http://download.sourceforge.net/cryptopp)

[Austrian Mirror](http://gd.tuwien.ac.at/privacy/crypto/libs/cryptlib)

[Australian Mirror](http://www.mirrors.wiretapped.net/security/cryptography/libraries/cryptolib)

[Crypto++ 3.2](http://www.eskimo.com/~weidai/crypto32.zip)

[Crypto++ 3.2](http://download.sourceforge.net/cryptopp/crypto32.zip)

[Crypto++ 3.2](http://gd.tuwien.ac.at/privacy/crypto/libs/cryptlib/crypto32.zip)

[Crypto++ 3.2](http://www.mirrors.wiretapped.net/security/cryptography/libraries/cryptolib/crypto32.zip)

[Crypto++ 4.1](http://www.eskimo.com/~weidai/crypto41.zip)

[Crypto++ 4.1](http://download.sourceforge.net/cryptopp/crypto41.zip)

[Crypto++ 4.1](http://gd.tuwien.ac.at/privacy/crypto/libs/cryptlib/crypto41.zip)

[Crypto++ 4.1](http://www.mirrors.wiretapped.net/security/cryptography/libraries/cryptolib/crypto41.zip)

[Crypto++ 4.2](http://www.eskimo.com/~weidai/crypto42.zip)

[Crypto++ 4.2](http://download.sourceforge.net/cryptopp/crypto42.zip)

[Crypto++ 4.2](http://gd.tuwien.ac.at/privacy/crypto/libs/cryptlib/crypto42.zip)

[Crypto++ 4.2](http://www.mirrors.wiretapped.net/security/cryptography/libraries/cryptolib/crypto42.zip)

Please remember to use the "-a" (auto-convert text files) option when unzipping on a Unix machine. The zip files should have the following hashes:

**crypto32.zip:**

    MD5: 4691A506C991C366DA4392E97385EABF
    SHA-1: AE810841F0F2ECC5332A5DBA0C2C078EFBB9EE42
    RIPEMD-160: 28245D6CC799213336BA0572A9D0E6AF4490C73C
    SHA-256: BF62FA23AFEF737466F5F8746E59D17DF28CDF223051EA4A9B0BE86F25FF65AA

**crypto41.zip:**

    MD5: AAAA77CF49A8517D815862219FEB4DCD
    SHA-1: F4860802824A86F5A737621FD2C9473776859CCE
    RIPEMD-160: 2F3A51B1ED1A90E2B740782046F40D2EA17306AD
    SHA-256: 72290C6E081494296E4AECE990EF5210ED718E82EE142317CB186B69F35ACC96

**crypto42.zip:**

    MD5: C1700E6E15F3189801E7EA47EEE83078
    SHA-1: 505EC40485519971A07DF6708B7DED3E5D3D08C4
    RIPEMD-160: 5D4CC8E5987B2416CF7D71AA6276AFAC61702E55
    SHA-256: CDF8A1EBB142759E928A323F47F228F4F93CEB2FE97C19DC59D6868989E0D76E

## While You Are Downloading

- Take a look at the [related links](http://www.mobiuslinks.com/links.asp?sid=1) page. It includes links to crypto libraries for other languages, products that use Crypto++, etc.
- Consider the list of [recommended books](http://www.mobiuslinks.com/links.asp?sid=102) for Crypto++ users.
- Examine the [Crypto++ license agreement](LICENSE.txt).
- Read denis bider's [Crypto++ User Guide](http://www.bitvise.com/users-guide.html)
- Browse the [Crypto++ Reference Manual](http://cryptopp.sourceforge.net/docs/ref/) ([mirrored here](http://trolocsis.com/crypto++)).
- <span id="charts"></span>View these Crypto++ class hierarchy charts to see how Crypto++ is organized. Note that these charts only include a small number of actual algorithms as examples.
  - [symmetric algorithms and hash functions](filters.gif)
  - [public key algorithms](pubkey.gif)

## <span id="lists">Mailing Lists</span>

There are two mailing lists for Crypto++.

- cryptopp-announce@lists.sourceforge.net - [Crypto++ announcements](http://lists.sourceforge.net/mailman/listinfo/cryptopp-announce)
- cryptopp-list@eskimo.com - user questions and general discussion related to Crypto++, archived at <http://www.escribe.com/software/crypto>. Send an email to [cryptopp-list-request@eskimo.com](mailto:cryptopp-list-request@eskimo.com?subject=subscribe) with the subject "subscribe" to subscribe.

## To Contribute

The Crypto++ source code and FAQ are hosted on [<embed src="http://sourceforge.net/sflogo.php?group_id=6152&amp;type=1" data-border="0" width="88" height="31" />](http://sourceforge.net/projects/cryptopp/).

- The [SourceForge CVS Repository](http://sourceforge.net/cvs/?group_id=6152) allows you to view the latest (unreleased) Crypto++ source code and to contribute bug fixes or new features.
- The [Crypto++ Faq-O-Matic](http://www.eskimo.com/~weidai/cgi-bin/fom.cgi) allows you to view frequently asked questions and to contribute new questions or answers.

## <span id="paid">Paid Support and Consulting</span>

If you are interested in paid support for Crypto++ or consulting on a Crypto++ related project, please take a look at this [list of companies and individuals providing such services](http://cryptopp.sourceforge.net/cgi-bin/fom?file=39). This listing is a free service for the Crypto++ community, and anyone may sign up to be listed by following the above link.

------------------------------------------------------------------------

<a href="http://www.TheCounter.com" target="_top"><img src="http://c3.thecounter.com/id=2040115" data-border="0" alt="TC" /></a>

hits since 3/20/2000.

Written by: [Wei Dai](http://www.eskimo.com/~weidai/index.html) \<<weidai@eskimo.com>\> Last modified: 8/26/2002
