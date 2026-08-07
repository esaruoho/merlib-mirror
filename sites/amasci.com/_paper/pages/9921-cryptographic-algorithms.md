---
title: "Cryptographic Algorithms"
source_domain: amasci.com
source_path: ~weidai/algorithms.html
order: 9921
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T17:18:15Z
extractor: site_to_paper.py (pandoc)
---

# Cryptographic Algorithms

*Source page: `~weidai/algorithms.html`*

Cryptographic Algorithms

# Cryptographic Algorithms

This page lists commonly used cryptographic algorithms and methods, and tries to give references to implementations and textbooks. Where available, comments are also made about the usefulness or other aspects of the algorithms. The comments should be interpreted as the author's subjective opinion and should not be considered authoritative in any way.

- [Public Key Algorithms](#asymmetric)
- [Secret Key Algorithms](#symmetric)
- [Block Cipher Modes](#modes)
- [Cryptographic Hash Functions](#hash)
- [Random Number Generators](#random)

------------------------------------------------------------------------

## <span id="asymmetric">Public Key Algorithms</span>

Public key algorithms use a different key for encryption and decryption, and the decryption key cannot (practically) be derived from the encryption key. Public key methods are important because they can be used to transmit encryption keys or other data securely even when the parties have no opportunity to agree on a secret key in private. All known methods are quite slow, and they are usually only used to encrypt session keys (randomly generated "normal" keys), that are then used to encrypt the bulk of the data using a symmetric cipher (see below).

- <span id="rsa"></span> **RSA** (Rivest-Shamir-Adelman) is the most commonly used public key algorithm. Can be used both for encryption and for signing. It is generally considered to be secure when sufficiently long keys are used (512 bits is insecure, 768 bits is moderately secure, and 1024 bits is good). The security of RSA relies on the difficulty of factoring large integers. Dramatic advances in factoring large integers would make RSA vulnerable. RSA is currently the most important public key algorithm. It is patented in the United States (expires year 2000), and free elsewhere.

  For information on the recommended key lengths for RSA, see the [article by Bruce Schneier](http://www.cs.hut.fi/ssh/crypto/rsa-key-length-recommendations). At present, 512 bit keys are considered weak, 1024 bit keys are probably secure enough for most purposes, and 2048 bit keys are likely to remain secure for decades.

  One should know that RSA is very vulnerable to [chosen plaintext attacks](http://www.cs.hut.fi/ssh/crypto/intro.html#chosen-plaintext). There is also a new [timing attack](http://www.cs.hut.fi/ssh/crypto/intro.html#timing-attack) that can be used to break many implementations of RSA. The RSA algorithm is believed to be safe when used properly, but one must be very careful when using it to avoid these attacks.

  Many implementations of RSA are freely available. See e.g. [RSAREF](http://www.cs.hut.fi/ssh/crypto/software.html#rsaref) , [RSAEURO](http://www.cs.hut.fi/ssh/crypto/software.html#rsaeuro), [SSLeay](http://www.cs.hut.fi/ssh/crypto/software.html#ssleay), [PGP](http://www.cs.hut.fi/ssh/crypto/software.html#pgp) source code, [Ssh](http://www.cs.hut.fi/ssh/crypto/software.html#ssh) source code, and the [Crypto++](http://www.cs.hut.fi/ssh/crypto/software.html#crypto++) library. See also [ftp.funet.fi:/pub/crypt/cryptography/asymmetric/rsa.](ftp://ftp.funet.fi/pub/crypt/cryptography/asymmetric/rsa)

  For more information, see e.g.

  - Bruce Schneier: Applied Cryptography. John Wiley & Sons, 1994.
  - Jennifer Seberry and Josed Pieprzyk: Cryptography: An Introduction to Computer Security. Prentice-Hall, 1989.
  - Man Young Rhee: Cryptography and Secure Data Communications. McGraw-Hill, 1994.
  - R. Rivest, A. Shamir, and L. M. Adleman: Cryptographic Communications System and Method. US Patent 4,405,829, 1983. [(Available here.)](http://www.cs.hut.fi/ssh/crypto/4405829.rivest-shamir-adleman)
  - Hans Riesel: Prime Numbers and Computer Methods for Factorization. Birkhauser, 1994.
  - The RSA Frequently Asked Questions document by RSA Data Security, Inc., 1995. [(Available here.)](http://www.cs.hut.fi/ssh/crypto/rsa-faq)
  - RSA in 3 lines of perl by Adam Back \<aba@atlax.ex.ac.uk\>, 1995. Available [here.](http://www.cs.hut.fi/ssh/crypto/rsa-in-3-lines-of-perl)
  - [Sherry Mayo's cryptography page](http://rschp2.anu.edu.au:8080/crypt.html) contains a description of RSA.

- <span id="diffie-hellman"></span> **Diffie-Hellman** is a commonly used public-key algorithm for key exchange. It is generally considered to be secure when sufficiently long keys and proper generators are used. The security of Diffie-Hellman relies on the difficulty of the discrete logarithm problem (which is believed to be computationally equivalent to factoring large integers). Diffie-Hellman is claimed to be patented in the United States, but the patent expires April 29, 1997. There are also strong rumors that the patent might in fact be invalid (there is evidence of it having been published over an year before the patent application was wiled).

  Diffie-Hellman is sensitive to the choice of the strong prime and the generator. One possible prime/generator pair is suggested in the [Photuris draft](http://www.cs.hut.fi/ssh/crypto/ipsec/draft-ietf-ipsec-photuris-02.txt). The size of the secret exponent is also important for its security. Conservative advice is to make the random exponent twice as long as the intended session key.

  One should note the results presented in Brian A. LaMacchia and Andrew M. Odlyzko, [Computation of Discrete Logarithms in Prime Fields](http://www-swiss.ai.mit.edu/~bal/), Designs, Codes and Cryptography 1 (1991), 47-62. Basically, they conclude that by doing precomputations, it is possible to compute discrete logarithms relative to a particular prime efficiently. The work needed for the precomputation is approximately equal or slightly higher than the work needed for factoring a composite number of the same size. In practice this means that if the same prime is used for a large number of exchanges, it should be larger than 512 bits in size, preferably 1024 bits.

  There is also a new [timing attack](http://www.cs.hut.fi/ssh/crypto/intro.html#timing-attack) that can be used to break many implementations of Diffie-Hellman.

  Many implementations of Diffie-Hellman are freely available. See e.g. [RSAREF](http://www.cs.hut.fi/ssh/crypto/software.html#rsaref), [RSAEURO](http://www.cs.hut.fi/ssh/crypto/software.html#rsaeuro), [SSLeay](http://www.cs.hut.fi/ssh/crypto/software.html), [alodes](http://www.cs.hut.fi/ssh/crypto/software.html#alodes), or [Crypto++](http://www.cs.hut.fi/ssh/crypto/software.html#crypto++).

  For further information, see e.g.

  - Bruce Schneier: Applied Cryptography. John Wiley & Sons, 1994.
  - Jennifer Seberry and Josed Pieprzyk: Cryptography: An Introduction to Computer Security. Prentice-Hall, 1989.
  - Man Young Rhee: Cryptography and Secure Data Communications. McGraw-Hill, 1994.
  - M. E. Hellman and R. C. Merkle: Public Key Cryptographic Apparatus and Method. US Patent 4,218,582, 1980. [(Beginning available here.)](http://www.cs.hut.fi/ssh/crypto/4212582.hellman-merkle.part)
  - The RSA Frequently Asked Questions document by RSA Data Security, Inc., 1995. [(Available here.)](http://www.cs.hut.fi/ssh/crypto/rsa-faq)

- **Elliptic curve public key cryptosystems** is an emerging field. They have been slow to execute, but have become feasible with modern computers. They are considered to be fairly secure, but haven't yet undergone the same scrutiny as for example RSA.

  For further information, see e.g.

  - Bruce Schneier: Applied Cryptography, 2nd edition. John Wiley & Sons, 1995.
  - IEEE P1363 Draft Standard on [Elliptic Curve Cryptosystems and Related Methods](http://www.cs.hut.fi/ssh/crypto/p1363-draft.ps).

  Several public domain implementations are available. See e.g. the [eliptic](http://www.cs.hut.fi/ssh/crypto/software.html#eliptic) package.

- <span id="dss"></span> **DSS** (Digital Signature Standard). A signature-only mechanism endorsed by the United States Government. Its design has not been made public, and many people have found potential problems with it (e.g., leaking hidden data the signature, and revealing your secret key if you ever happen to sign two different messages using the same random number). It was recently patented by the US government, and there is also another patent on it, which is licensed at an initial payment of USD 25.000 plus royalties in US and Europe.

  There should be no reason whatsoever to use DSS for anything (with the potential exclusion of US government contracts) since better methods are widely available. DSS source code is included in in the [Crypto++](http://www.cs.hut.fi/ssh/crypto/software.html#crypto++) library.

- <span id="elgamal"></span> **ElGamal** public key cryptosystem. Based on the discrete logarithm problem. See e.g. Bruce Schneier: Applied Cryptography, John Wiley and Sons, 1994. Elgamal source code is included in the [Crypto++](http://www.cs.hut.fi/ssh/crypto/software.html#crypto++) library.

- <span id="luc"></span> **LUC** is a public key encryption system. A short description is in [luc-algorithm.txt](http://www.cs.hut.fi/ssh/crypto/luc-algorithm.txt). The algorithm is said to be patented. Source code can be found in [ftp.funet.fi:/pub/crypt/cryptography/asymmetric/luc](ftp://ftp.funet.fi/pub/crypt/cryptography/asymmetric/luc/) and is included in the [Crypto++](http://www.cs.hut.fi/ssh/crypto/software.html#crypto++) library.

  LUC was published in the January 1993 issue of Dr. Dobb's Journal in an article by Peter Smith.

## <span id="symmetric">Secret Key Algorithms (Symmetric Ciphers)</span>

Secret key algorithms use a the same key for both encryption and decryption (or the other is easily derivable from the other).

- <span id="idea"></span> **IDEA** (International Data Encryption Algorithm) is an algorithm developed at ETH Zurich in Switzerland. It uses a 128 bit key, and it is generally considered to be very secure. It is currently one of the best public known algorithms. It is a fairly new algorithm, but it has already been around for several years, and no practical attacks on it have been published despite of numberous attempts to analyze it.

  IDEA is patented in the United States and in most of the European countries. The patent is held by Ascom-Tech. Non-commercial use of IDEA is free. Commercial licenses can be obtained by contacting idea@ascom.ch.

  Several implementations of IDEA are freely available. See e.g. [SSLeay](http://www.cs.hut.fi/ssh/crypto/software.html#ssleay), [PGP](http://www.cs.hut.fi/ssh/crypto/software.html#pgp) source code, and [Ssh](http://www.cs.hut.fi/ssh/crypto/software.html#ssh) source code, [idea86](http://www.cs.hut.fi/ssh/crypto/software.html#idea86), [Crypto++](http://www.cs.hut.fi/ssh/crypto/software.html#crypto++).

- <span id="rc4"></span> **RC4** is a cipher designed by RSA Data Security, Inc. It used to be a trade secret, until someone posted source code for an algorithm in Usenet News, claiming it to be equivalent to RC4. There is very strong evidence that the posted algorithm is indeed equivalent to RC4. The algorithm is very fast. Its security is unknown, but breaking it does not seem trivial either. Because of its speed, it may have uses in certain applications. It can also accept keys of arbitrary length. RC4 is essentially a pseudo random number generator, and the output of the generator is xored with the data stream. For this reason, it is very important that the same RC4 key never be used to encrypt two different data streams.

  Source code and information about RC4 can be found [here](http://www.cs.hut.fi/ssh/crypto/rc4) and in many cryptographic libraries, e.g. [SSLeay](http://www.cs.hut.fi/ssh/crypto/software.html#ssleay), [Crypto++](http://www.cs.hut.fi/ssh/crypto/software.html#crypto++), and [Ssh](http://www.cs.hut.fi/ssh/crypto/software.html#ssh) source code.

  The United States government routinely approves RC4 with 40 bit keys for export. Keys that are this small can be easily broken by governments, criminals, and amateurs.

  It is interesting to know that the exportable version of SSL (Netscape's Secure Socket Layer), which uses RC4-40, was recently broken by at least two independent groups. Breaking it took about eight days; in many major universities (or companies) the corresponding amount of computing power is available to any computer science major. More information about the incident can be found on [Damien Doligez's SSL cracking page](http://pauillac.inria.fr/~doligez/ssl/) , and a collection of various articles is in [a local file](http://www.cs.hut.fi/ssh/crypto/rc4-breaking).

- <span id="safer"></span> **SAFER** is an algorithm developed by J. L. Massey (one of the developers of IDEA). A [paper describing it](http://www.cs.hut.fi/ssh/crypto/safer/safer_1.ps) was published recently. It is claimed to provide secure encryption with fast software implementation even on 8-bit processors. Two variants are available, one for 64 bit keys and the other for 128 bit keys. An implementation is in [ftp.funet.fi:/pub/crypt/cryptography/symmetric/safer](ftp://ftp.funet.fi/pub/crypt/cryptography/symmetric/safer) and a [copy is available locally](http://www.cs.hut.fi/ssh/crypto/safer.V1.0.tar.Z).

  An analysis of SAFER-K64 was presented in Crypto'95 and is in the proceedings.

- **S1**: Nothing is really known about this algorithm. It was recently posted on the cypherpunks mailing list. It may be a prank, or it may be something interesting. The posted code and the resulting discussion can be found [here](http://www.cs.hut.fi/ssh/crypto/s1).

- **Ciphers based on a hash function**. Any cryptographically strong hash function (see below) can be turned into a cipher. There are several possible arrangements; the general idea is that the hash function is used as a random number generator, and the hash value is xored with the data to be encrypted. When all bytes of the hash value have been used, a new hash value is obtained by modifying the key (or whatever was hashed) somehow, and taking a hash of that. The data to be hashed may include a key, the previous hash value, a sequence number, previous plaintext, etc.

  An example of a hash-based cipher is MDC/SHA; code can be found e.g. in the [Crypto++](http://www.cs.hut.fi/ssh/crypto/software.html#crypto++) library.

- <span id="enigma"></span> **Enigma** was the cipher used by the Germans in World War II. It is trivial to solve with modern computers; see the [Crypt Breaker's Workbench](http://www.cs.hut.fi/ssh/crypto/software.html#cbw) tool. This cipher is used by the unix crypt(1) program, which should thus not be used.

- <span id="vigenere"></span> **Vigenere** is a historical cipher mentioned in many textbooks. It is easily solvable; a [program for this](http://www.cs.hut.fi/ssh/crypto/software.html#solve-vigenere) is freely available.

- Several **other classical ciphers** are described in <http://rschp2.anu.edu.au:8080/cipher.html>. These ciphers should not be used because they are not secure.

These and a number of other ciphers are available from [ftp.funet.fi:/pub/crypt/cryptography/symmetric](ftp://ftp.funet.fi/pub/crypt/cryptography/symmetric) .

## <span id="modes">Block Cipher Modes</span>

Many commonly used ciphers (e.g., IDEA, DES, BLOWFISH) are block ciphers. This means that they take a fixed-size block of data (usually 64 bits), an transform it to another 64 bit block using a function selected by the key. The cipher basically defines a one-to-one mapping from 64-bit integers to another permutation of 64-bit integers.

If the same block is encrypted twice with the same key, the resulting ciphertext blocks are the same (this method of encryption is called Electronic Code Book mode, or **ECB**). This information could be useful for an attacker.

In practical applications, it is desirable to make identical plaintext blocks encrypt to different ciphertext blocks. Two methods are commonly used for this:

- **CFB** mode: a ciphertext block is obtained by encrypting the previous ciphertext block, and xoring the resulting value with the plaintext.
- **CBC** mode: a ciphertext block is obtained by first xoring the plaintext block with the previous ciphertext block, and encrypting the resulting value.

The previous ciphertext block is usually stored in an Initialization Vector (IV). An initialization vector of zero is commonly used for the first block, though other arrangements are also in use.

More information on cipher modes can be found e.g. in Bruce Schneier: Applied Cryptography, John Wiley & Sons, 1994.

## <span id="hash">Cryptographic Hash Functions</span>

- <span id="md5"></span> **MD5** (Message Digest Algorithm 5) is a secure hash algorithm developed at RSA Data Security, Inc. It can be used to hash an arbitrary length byte string into a 128 bit value. MD5 is in wide use, and is considered reasonable secure.

  However, some people have reported potential weaknesses in it, and "keyed MD5" (typically used for authentication by having a shared secret, and computing an authentication value by hashing first the secret (as a key), and then the data to be hashed) has been reported to be broken. It is also reported that one could build a special-purpose machine costing a few million dollars to find a plaintext matching given hash value in a few weeks.

  MD5 is available from [ftp.funet.fi:/pub/crypt/hash/mds/md5](ftp://ftp.funet.fi/pub/crypt/hash/mds/md5) . It is also included in [PGP](http://www.cs.hut.fi/ssh/crypto/software.html#pgp) source code, [SSLeay](http://www.cs.hut.fi/ssh/crypto/software.html#ssleay), [RSAREF](http://www.cs.hut.fi/ssh/crypto/software.html#rsaref), [Crypto++](http://www.cs.hut.fi/ssh/crypto/software.html#crypto++), and [Ssh](http://www.cs.hut.fi/ssh/crypto/software.html#ssh) source code. MD5 is described e.g. in Bruce Schneier: Applied Cryptography, John Wiley & Sons, 1994.

- **MD2**, **MD4**: These are older hash algorithms from RSA Data Security. They have known flaws, and their use is not recommended. Source code for MD2 is included at least in [SSLeay](http://www.cs.hut.fi/ssh/crypto/software.html#ssleay) and [RSAREF](http://www.cs.hut.fi/ssh/crypto/software.html#rsaref) on the [software page](http://www.cs.hut.fi/ssh/crypto/software.html). They are also available from [ftp.funet.fi:/pub/crypt/hash/mds](ftp://ftp.funet.fi/pub/crypt/hash/mds) .

- <span id="sha"></span> **SHA** (Secure Hash Algorithm) (also **SHS**, Secure Hash Standard): This is a cryptographic hash algorithm published by the United States Government. It produces an 160 bit hash value from an arbitrary length string. Many people consider it quite good. It is a fairly new algorithm.

  SHA is available from [ftp.funet.fi:/pub/crypt/hash/sha](ftp://ftp.funet.fi/pub/crypt/hash/sha), and is included in many cryptographic libraries, such as [Crypto++](http://www.cs.hut.fi/ssh/crypto/software.html#crypto++).

## <span id="random">Random Number Generators</span>

Cryptographic systems need cryptographically strong random numbers that cannot be guessed by an attacker. Random numbers are typically used to generate session keys, and their quality is critical for the quality of the resulting systems. The random number generator is easily overlooked, and becomes the weakest point of the system.

Some machines may have special purpose hardware noise generators. Noise from the leak current of a diode or transistor, least significant bits of audio inputs, times between interrupts, etc. are all good sources of randomness when processed with a suitable hash function. It is a good idea to acquire true environmental noise whenever possible.

Examples of cryptographic random number generators can be found e.g. in [PGP](http://www.cs.hut.fi/ssh/crypto/software.html#pgp) source code, [Noiz](http://www.cs.hut.fi/ssh/crypto/software.html#noiz), and [Ssh](http://www.cs.hut.fi/ssh/crypto/software.html#ssh) source code.

------------------------------------------------------------------------

Please send updates and additions to [Tatu Ylnen](http://www.cs.hut.fi/~ylo) \<ylo@cs.hut.fi\>

Disclaimer: Any opinions and evaluations presented here are speculative, and the author cannot be held responsible for their correctness.
