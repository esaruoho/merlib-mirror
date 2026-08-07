---
title: "Standard Cryptographic Algorithm Naming"
source_domain: amasci.com
source_path: ~weidai/scan-mirror/ph.html
order: 9948
reachable_from_entry: false
images: 3
internal_links: 1
extracted: 2026-08-07T17:18:17Z
extractor: site_to_paper.py (pandoc)
---

# Standard Cryptographic Algorithm Naming

*Source page: `~weidai/scan-mirror/ph.html`*

## Passphrase Hashes

\[Note that throughout this section, passphrases can also be considered to include passwords. We use the term "passphrase" because for security, these should be much longer than a typical word.\]

A passphrase hash is a method of transforming a text string that can be remembered by a human user, into a result that can be used either:

- as an "authenticator", which can be stored and used at a later time to check whether a user knows the passphrase (authenticators can be encoded in binary and/or string form).
- as pseudorandom data for a cipher or MAC secret key, initialisation vector, etc. In this case the passphrase hash is called a PBKDF (Password-Based Key Derivation Function).

The security properties required for these uses are effectively identical, which motivates considering passphrase hashes as a single algorithm category, rather than two different categories. However, particular algorithms may only be defined for one of these uses.

<span id="BSD"></span>

------------------------------------------------------------------------

? <span class="p">BSD</span>

PassphraseHash

**Designers:**  
The OpenBSD Project

**Description:**  
The BSD passphrase hash is used by OpenBSD; it is upwardly compatible with the hash used by NetBSD ([MD5-crypt](#MD5-crypt)), and the original Unix crypt(3) algorithm ([Traditional-crypt3](#Traditional-crypt3)), but the recommended way to generate new hashes is to use [bcrypt](#bcrypt). It is defined only for generation of authenticators.

When a passphrase is verified, the first few characters of the authenticator determine which mechanism is used:

- If the first three characters are "\$1\$", MD5-crypt is used.
- If the first four characters are "\$2a\$", bcrypt is used.
- If the first character is *not* "\$" or "\_", Traditional-crypt3 is used.
- Otherwise, the mechanism is unrecognised, and the passphrase is always considered to be invalid.

When an authenticator is generated, bcrypt is always used, because it is the most secure of the mechanisms.

**References:**  
- \[*Def*\] David Burren,\
  OpenBSD Hypertext Man Pages - crypt(3),\
  <a href="http://www.openbsd.org/cgi-bin/man.cgi?query=crypt&amp;sektion=3&amp;apropos=0&amp;manpath=OpenBSD+Current" target="_blank">http://www.openbsd.org/cgi-bin/man.cgi?query=crypt&amp;sektion=3&amp;apropos=0<br />
  &amp;manpath=OpenBSD+Current</a>
- \[also see references for [bcrypt](#bcrypt), [MD5-crypt](#MD5-crypt), and [Traditional-crypt3](#Traditional-crypt3)\]

**Output types:**  
Binary and string authenticators, as specified above.

**Missing information:**  
Test vectors.

**Security comment:**  
The security of this algorithm depends on which mechanism is used. See the security comments for [Traditional-crypt3](#Traditional-crypt3) and [MD5-crypt](#MD5-crypt). The [bcrypt](#bcrypt) mechanism does not appear to have any significant weaknesses.

<span id="bcrypt"></span>

------------------------------------------------------------------------

? <span class="p">bcrypt</span>

PassphraseHash

**Designers:**  
Niels Provos, David Mazières, The OpenBSD Project

**Published:**  
1999

**References:**  
- \[*Def, An*\] Niels Provos, David Mazières,\
  "A Future-Adaptable Password Scheme,"\
  Presented at USENIX '99.\
  <a href="http://www.usenix.org/events/usenix99/provos.html" target="_blank">http://www.usenix.org/events/usenix99/provos.html</a>

**Salt length:**  
16 bytes.

**Output types:**  
- Binary authenticator: 1 unsigned byte for the cost parameter, followed by 16 bytes of salt, followed by 24 bytes of encrypted output, as described in the Provos and Mazières paper.
- String authenticator: The string "\$2a\$", followed by a base64 encoding of the binary authenticator.
- Cipher initialisation \[\[remove this and reclassify eksblowfish as a cipher?\]\]:\
  The cipher name MUST be "eksblowfish", in which case it is initialised as described in the Provos and Mazières paper.
- \[\[consider defining a PBKDF based on Blowfish with the resulting key schedule in CTR mode\]\]

**Missing information:**  
Test vectors.

<span id="IteratedAndSalted"></span>

------------------------------------------------------------------------

IteratedAndSalted(*digest*)

PassphraseHash

**Designers:**  
Phil Zimmerman, OpenPGP working group

**Published:**  
1998

**Description:**  
See section 3.6.1.3 of RFC 2440. The passphrase is encoded as UTF-8. This hash is defined only as a PBKDF.

**Aliases:**  
"OpenPGP.S2K.3"

**References:**  
- \[*Def*\] Jon Callas, Lutz Donnerhacke, Hal Finney, Rodney Thayer\
  "OpenPGP Message Format,"\
  <a href="http://www.rfc-editor.org/rfc/rfc2440.txt" target="_blank">RFC 2440</a>, November 1998.

**Parameters:**  
- `String digest` \[creation/read, no default\] - the name of the message digest on which this Mac is to be based.

**Salt length:**  
OpenPGP only specifies use of a 64-bit salt. However, it is RECOMMENDED that implementations support any salt length.

**Output types:**  
- PBKDF: as specified in RFC 2440.

<span id="MD5-crypt"></span>

------------------------------------------------------------------------

? <span class="p">MD5-crypt</span>

PassphraseHash

**Description:**  
This is a password hash function used in NetBSD (and some other BSD variants).

**References:**  
- \[*Def, An*\] David Hopwood,\
  Some notes on MD5-crypt,\
  <a href="algs/md5crypt.txt" target="_blank">http://www.users.zetnet.co.uk/hopwood/crypto/scan/algs/md5crypt.txt</a>

**Salt length:**  
Minimum 12, maximum 48 bits, multiple of 8 bits (always 48 bits when generating authenticators).

**Output types:**  
- Binary authenticator: The salt \[\[padded with zeroes??\]\], followed by 16 bytes of MD5 output.
- String authenticator: The string "\$1\$", followed by a base64 encoding of the binary authenticator.

**Missing information:**  
Test vectors.

**Security comments:**  
The amount of computation needed (1000 hash iterations) is not sufficient to adequately slow down dictionary attacks. Therefore, MD5-crypt SHOULD NOT be used for new applications.

<span id="Simple"></span>

------------------------------------------------------------------------

Simple(*digest*)

PassphraseHash

**Designers:**  
Phil Zimmerman, OpenPGP working group

**Published:**  
1998

**Description:**  
See section 3.6.1.1 of RFC 2440. The passphrase is encoded as UTF-8. This hash is defined only as a PBKDF.

**Aliases:**  
"OpenPGP.S2K.0"

**References:**  
- \[*Def*\] Jon Callas, Lutz Donnerhacke, Hal Finney, Rodney Thayer\
  "OpenPGP Message Format,"\
  <a href="http://www.rfc-editor.org/rfc/rfc2440.txt" target="_blank">RFC 2440</a>, November 1998.

**Parameters:**  
- `String digest` \[creation/read, no default\] - the name of the message digest on which this Mac is to be based.

**Output types:**  
- PBKDF: as specified in RFC 2440.

**Security comments:**  
- The lack of any salt, or method of slowing down the hash function, makes dictionary attacks much easier than necessary.
- The fact that the same key is always generated for a given passphrase means that breaking this key immediately compromises all data encrypted under the same passphrase, and also that it is completely insecure to use this hash to generate keys for an additive stream cipher.
- Therefore, the Simple hash SHOULD NOT be used for new applications.

<span id="Salted"></span>

------------------------------------------------------------------------

Salted(*digest*)

PassphraseHash

**Designers:**  
OpenPGP working group

**Published:**  
1998

**Description:**  
See section 3.6.1.2 of RFC 2440. The passphrase is encoded as UTF-8. This hash is defined only as a PBKDF.

**Aliases:**  
"OpenPGP.S2K.1"

**References:**  
- \[*Def*\] Jon Callas, Lutz Donnerhacke, Hal Finney, Rodney Thayer\
  "OpenPGP Message Format,"\
  <a href="http://www.rfc-editor.org/rfc/rfc2440.txt" target="_blank">RFC 2440</a>, November 1998.

**Parameters:**  
- `String digest` \[creation/read, no default\] - the name of the message digest on which this Mac is to be based.

**Salt length:**  
OpenPGP only specifies use of a 64-bit salt. However, it is RECOMMENDED that implementations support any salt length.

**Output types:**  
- PBKDF: as specified in RFC 2440.

**Security comment:**  
The lack of any method of slowing down the hash function makes dictionary attacks much easier than necessary. Therefore, the Salted hash SHOULD NOT be used for new applications.

<span id="Traditional-crypt3"></span>

------------------------------------------------------------------------

? <span class="p">Traditional-crypt3</span>

PassphraseHash

**Designer:**  
Dennis Ritchie

**Published:**  
Apparently in Version 7 of AT&T UNIX \[1979?\].

**Alias:**  
"crypt3-DES"

**Description:**  
This is the "traditional" Unix crypt(3) algorithm, based on DES. Unfortunately there appears to be no definitive reference for this algorithm, so it is described below:

A 12-bit salt is used, considered here as an integer between 0 and 4095. The password is represented as a US-ASCII string, and padded with zeroes up to 8 bytes. Passwords containing non-US-ASCII characters (with code points \>= 128), or that are longer than 8 characters are invalid. (Note that many Unix implementations *silently* truncate passwords to 8 characters; to interoperate with an implementation that does this, the user of the "Traditional-crypt3" algorithm must do the truncation.)

Each byte of the US-ASCII-encoded, zero-padded password is then shifted left by one bit, and the result used as a key for a modified variant of DES. The key is used to encrypt a block of 8 zero bytes, 25 times. The parity of key bytes is ignored.

In standard DES, the output of each expansion permutation is a block of 48 bits, which are numbered as in FIPS PUB 46-2 (i.e. from 1 on the left to 48 on the right). Salt bits are numbered from 1 for the least significant bit, to 12 for the most significant bit. The modification of DES is that if salt bit *i* is set, then bits *i* and *i* + 24 are swapped in the DES expansion permutation (a.k.a. "E-box") output.

The salt and final modified-DES ciphertext are encoded in 13 bytes as follows:

> encode(*x*) =\
> `    `("`./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ`" \|\|\
> `    ` "`abcdefghijklmnopqrstuvwxyz`")\[*x*\]\
> E<sub>*salt*</sub>(*P*) = encryption of the 8-byte block *P*, using DES modified\
> `    `by the salt.\
> *C* = E<sub>*salt*</sub><sup>25</sup>(\<0, 0, 0, 0, 0, 0, 0, 0\>)\
> output =\
> `    `encode(*salt* & 0x3F) \|\|\
> `    `encode(*salt* \>\>\> 6) \|\|\
> `    `encode(*C*\[0\] \>\>\> 2) \|\|\
> `    `encode(((*C*\[0\] \<\< 4) & 0x3F) \| (*C*\[1\] \>\>\> 2)) \|\|\
> `    `encode(((*C*\[1\] \<\< 2) & 0x3F) \| (*C*\[2\] \>\>\> 6)) \|\|\
> `    `encode(*C*\[2\] & 0x3F) \|\|\
> `    `encode(*C*\[3\] \>\>\> 2) \|\|\
> `    `encode(((*C*\[3\] \<\< 4) & 0x3F) \| (*C*\[4\] \>\>\> 2)) \|\|\
> `    `encode(((*C*\[4\] \<\< 2) & 0x3F) \| (*C*\[5\] \>\>\> 6)) \|\|\
> `    `encode((*C*\[5\] & 0x3F) \|\|\
> `    `encode(*C*\[6\] \>\>\> 2) \|\|\
> `    `encode(((*C*\[6\] \<\< 4) & 0x3F) \| (*C*\[7\] \>\>\> 2)) \|\|\
> `    `encode((*C*\[7\] \<\< 2) & 0x3F)\
> where\
> `    `\<\< denotes shift left,\
> `    `\>\>\> denotes unsigned shift right,\
> `    `\|\| denotes concatenation,\
> `    `& denotes bitwise AND,\
> `    `\| denotes bitwise OR.\

When verifying an authenticator A, the salt is recovered from the first two characters of A (least significant 6 bits first):

> *salt* = encode<sup>-1</sup>(A\[0\]) \| (encode<sup>-1</sup>(A\[1\]) \<\< 6)

and the authentication succeeds iff the correct output can be derived from the password and this salt.

**References:**  
- \[*Inf*\] R. Morris, Ken Thompson,\
  "Password Security: A Case History",\
  Communications of the ACM, vol. 22, pp. 594-597, November 1979.\
  Also in troff format (readable as ASCII) at\
  <a href="http://plan9.bell-labs.com/7thEdMan/vol2/password" target="_blank">http://plan9.bell-labs.com/7thEdMan/vol2/password</a>
- \[*An*\] Niels Provos, David Mazières,\
  "A Future-Adaptable Password Scheme,"\
  Presented at USENIX '99.\
  <a href="http://www.usenix.org/events/usenix99/provos.html" target="_blank">http://www.usenix.org/events/usenix99/provos.html</a>
- \[*Impl*\] Eric Young,\
  libdes (DES and crypt(3) implementation),\
  Available from [www.openssl.org](http://www.openssl.org/).

**Output types:**  
- Binary authenticator: 13 bytes as specified above.
- String authenticator: The binary authenticator treated as a US-ASCII string.

**Missing information:**  
Test vectors.

**Comments:**  
- Some implementations of Unix use a variant of the Traditional-crypt3 algorithm, which produces outputs that start with "\_". Extended crypt is not currently defined in SCAN.
- Some implementations of Traditional-crypt3 accept salt values that cannot be decoded as above (i.e. are not in the range of the encode function). This algorithm may be changed to cover that case.

**Security comments:**  
Traditional-crypt3 has the following weaknesses:

- Only the first 8 characters of the password are significant. 8 characters is not long enough for a secure password.
- The salt is only 12 bits. This is not enough to prevent precomputed dictionary attacks.
- The amount of computation needed is not sufficient to adequately slow down dictionary attacks, taking into account improvements in processor speed since the algorithm was developed.
- Optimisations of DES (such as bitslice implementations) can be used to further speed up a dictionary attack, relative to the work performed in computing a hash.

It therefore SHOULD NOT be used for new applications.

<span id="WindowsNT"></span>

------------------------------------------------------------------------

WindowsNT

PassphraseHash

**Designers:**  
Microsoft Corp.

**Description:**  
A WindowsNT passphrase hash is calculated by applying the MD4 message digest to a UTF16-LE encoding of the passphrase (which is case-sensitive, and of length 0 to 256 Unicode characters). It is defined for generation of authenticators only.

**References:**  
- \[*Def, Test*\] G. Zorn, S. Cobb,\
  "Microsoft PPP CHAP Extensions,"\
  <a href="http://www.rfc-editor.org/rfc/rfc2433.txt" target="_blank">RFC 2433</a>, October 1998.
- \[*Inf, Impl* (for MD4)\] Ron Rivest,\
  "The MD4 Message-Digest Algorithm,"\
  <a href="http://www.rfc-editor.org/rfc/rfc1320.txt" target="_blank">RFC 1320</a>, April 1992.

**Security comments:**  
- The lack of any salt, or method of slowing down the hash function, makes dictionary attacks much easier than necessary.
- The fact that the same authenticator is always generated for a given passphrase is the cause of many security holes in Microsoft-designed protocols that use this hash. It should therefore only be used for backward compatibility with those protocols, and SHOULD NOT be used for new applications.

<span id="alleged"></span>

------------------------------------------------------------------------

### Alleged PassphraseHashes

- PBKDF1 and PBKDF2 from [PKCS \#5 v2 / RFC 2898](http://www.rfc-editor.org/rfc/rfc2898.txt). These are likely to be added to SCAN, possibly with PBKDF2 restricted to HMAC.

------------------------------------------------------------------------

<img src="cryptix-s.gif" data-align="right" />

<a href="http://validator.w3.org/check/referer" target="_blank"><img src="vh40.gif" data-border="0" width="88" height="31" alt="Valid HTML 4.0" /></a> <a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank"><img src="vcss.gif" data-border="0" width="88" height="31" alt="Valid CSS" /></a>

[Copyright and trademarks](intro.html#copyright)
