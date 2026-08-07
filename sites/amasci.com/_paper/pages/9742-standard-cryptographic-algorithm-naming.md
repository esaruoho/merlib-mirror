---
title: "Standard Cryptographic Algorithm Naming"
source_domain: amasci.com
source_path: ~weidai/scan-mirror/sr.html
order: 9742
reachable_from_entry: false
images: 3
internal_links: 1
extracted: 2026-08-07T06:02:19Z
extractor: site_to_paper.py (pandoc)
---

# Standard Cryptographic Algorithm Naming

*Source page: `~weidai/scan-mirror/sr.html`*

## SecureRandom policies and mechanisms

**IMPORTANT: anyone writing a security provider that implements a SecureRandom algorithm should read this section in full.**

The organisation of this section is somewhat different from other categories of algorithms defined by SCAN. Many of the algorithms in other categories are deterministic, and even those that are not, have a specification that allows comparison with fixed test vectors (for example, a probabilistic signature algorithm still produces a deterministic result from signature verification, and the signatures must be generated according to an algorithm that ensures that they verify correctly).

Random number generators, on the other hand, are always non-deterministic. In fact, since the application should not rely on the output of a SecureRandom object being reproducible, it is not strictly necessary for a SecureRandom name to map to a specific algorithm.

With this in mind, there are two ways to approach naming of RNGs:

1.  Define names that correspond to particular applications or requirements for a random source. For example, "KeyGeneration" could specify a high-grade, conservatively designed source of random bytes suitable for generating long-term private keys. A provider can map the name "KeyGeneration" to any RNG that is believed to satisfy this requirement.
2.  Define names that correspond to ways of implementing a random source. For example, "URandom" could specify that the output is taken from the underlying operating system's /dev/urandom device, if present. In this case it would be incorrect to implement "URandom" in any other way, even if the alternative is believed to be at least as secure, and to perform at least as well as /dev/urandom in all respects.

Approach 1 (the "Policy" approach), has the advantage that the mechanism to be used can be tailored to the available resources. If a security flaw is found, it can be updated by changing how the policy is implemented, without disturbing or requiring any changes to applications. The flip side of this is that it may be more difficult to analyse whether an application that chooses some policy actually achieves the required randomness properties, because the policy may be implemented differently depending on the JVM, OS, and/or hardware platform, which security providers are installed (and in which order), or the mappings in various provider configuration files.

\[\[most of the "policy" entries have not been filled in yet.\]\]

Approach 2 (the "Mechanism" approach), has the advantage that an application writer knows precisely which algorithm will be used. Also, if a security flaw is found in a mechanism, it is known precisely which applications the flaw affects. However, if a security flaw is found in an algorithm, any applications will have to change which algorithm they use, rather than simply changing to a later version of a security provider.

Note that the policy approach does not have to be as loosely defined as suggested above. For example, a policy could be "use mechanism X if available, and mechanism Y otherwise, unless this is changed in a future version of SCAN". This provides most of the flexibility of an approach based purely on requirements, and allows "security fixes" if necessary, while avoiding most of the problems of attempting to analyse an unknown or moving target.

The names we define below include both policies and mechanisms. One way of implementing a mapping between them is to have each policy name as an alias for a mechanism.

Some excellent general papers on cryptanalysis of RNGs are:

- J. Kelsey, B. Schneier, D. Wagner, C. Hall,\
  "Cryptanalytic Attacks on Pseudorandom Number Generators,"\
  Fast Software Encryption, Fifth International Workshop Proceedings (March 1998), Springer-Verlag, 1998, pp. 168-188.\
  <a href="http://www.counterpane.com/pseudorandom_number.html" target="_blank">http://www.counterpane.com/pseudorandom_number.html</a>
- Peter Gutmann,\
  "Software Generation of Practically Strong Random Numbers" (updated June 2000),\
  Original version presented at the 1998 Usenix Security Symposium.\
  <a href="http://www.cryptoengines.com/~peter/06_random.pdf" target="_blank">http://www.cryptoengines.com/~peter/06_random.pdf</a>

------------------------------------------------------------------------

\[\[the following Java-specific discussion should go somewhere else\]\]

For the Java mapping of SCAN, there is a "default" SecureRandom algorithm, which an application can obtain by instantiating the SecureRandom class directly (i.e. as "`new SecureRandom()`"). In JDK 1.2 and 1.3, there is a serious design flaw in the way this is mapped to a SecureRandom implementation: the providers are searched in preference order, and for the first that implements one or more SecureRandom algorithms, one of those algorithms is picked *effectively at random*, and used as the default. (In fact the "first" key starting with "SecureRandom." is used, but because of the way provider properties are stored using a hashtable, this does not necessarily correspond to the first property that was listed in a .properties file or added using the `Provider.put` method.)

In order to work around this design bug, I recommend the following:

- Any provider that includes one or more SecureRandom algorithms SHOULD implement an algorithm called "Default", which should be the provider's most secure algorithm that does not involve interaction with the user.

- Any provider that includes *two* or more SecureRandom algorithms SHOULD override the `Provider.propertyNames` method as follows:

          import java.util.Enumeration;
          import java.util.Vector;

          public Enumeration propertyNames() {
              Enumeration e = super.propertyNames();
              Vector names = new Vector();

              while (e.hasMoreElements()) {
                  String name = e.nextElement();
                  if (name.equals("SecureRandom.Default") {
                      names.insertElementAt(name, 0);
                  } else {
                      names.addElement(name);
                  }
              }
              return names.elements();
          }

If a provider implements a SecureRandom algorithm and does not use the above workaround, it MUST use some other method of avoiding this bug.

In any case, it is recommended that new applications instantiate a SecureRandom by name.

<span id="Default"></span>

------------------------------------------------------------------------

Default

SecureRandom Policy

**Description:**  
This name should be given to the default SecureRandom policy of a given provider (if any), *in addition to* specifying it as the value of the "SecureRandom" property.

Although there is no way to enforce this constraint, choices for default SecureRandom algorithms should be believed to be at least as conservative as "SHA1PRNG", which was the default algorithm in JDK 1.1.

------------------------------------------------------------------------

<span id="BBS"></span>

------------------------------------------------------------------------

! BBS

SecureRandom Mechanism

**Designers:**  
L. Blum, <a href="http://http.cs.berkeley.edu/~blum/" target="_blank">Manuel Blum</a>, M. Shub

**Alias:**  
"Blum-Blum-Shub"

**Missing information:**  
Need to say how to derive *x*, and how updating of the seed is handled.

**References:**  
- \[*Def*\] L. Blum, M. Blum, M. Shub,\
  "A Simple Unpredictable Pseudo-Random Number Generator,"\
  SIAM Journal on Computing, vol. 15 no. 2, 1996, pp. 364-383.
- \[*Inf*\] Bruce Schneier,\
  "Section 17.9 Complexity-Theoretic Approach to Stream-Cipher Design,"\
  Applied Cryptography, Second Edition, John Wiley & Sons, 1996.
- \[*Inf*\] A. Menezes, P.C. van Oorschot, S.A. Vanstone,\
  "Section 5.5.2 Blum-Blum-Shub pseudorandom bit generator,"\
  Handbook of Applied Cryptography, CRC Press, 1997.\
  <a href="http://www.cacr.math.uwaterloo.ca/hac/about/chap5.pdf" target="_blank">http://www.cacr.math.uwaterloo.ca/hac/about/chap5.pdf</a>, [.ps](http://www.cacr.math.uwaterloo.ca/hac/about/chap5.ps)

**Parameters:**  
- `BigInteger n` \[write once, no default\] - a Blum integer (the product of two primes, both congruent to 3 mod 4).

**Security comment:**  
The security of this PRNG depends on the complexity of factoring the parameter *n*.

<span id="DevRandom"></span>

------------------------------------------------------------------------

DevRandom

SecureRandom Mechanism

**Designers:**  
(of /dev/random) Theodore Ts'o, Phil Karn, Colin Plumb, Dale Worley

**Description:**  
This algorithm obtains bytes from the device driver /dev/random originally designed for Linux, or the direct equivalent in other operating systems. /dev/urandom obtains entropy from various hardware events accessible to the OS kernel. It does not block when more bytes are requested than are directly obtainable from the hardware; instead, the available entropy is processed through a cryptographic PRNG, which in the case of the Linux implementation is constructed from a hash function.

If the operating system does not provide a suitable device, or if it cannot be opened, the provider MUST throw NoSuchAlgorithmException from the algorithm class constructor.

**References:**  
- \[*Def, Inf, Impl*\] /dev/random Support Page,\
  <a href="http://www.openpgp.net/random/index.html" target="_blank">http://www.openpgp.net/random/index.html</a>
- \[*An*\] David Honig,\
  "An Analysis of the FreeBSD /dev/random: Entropy_count Calculation is Probably Too Generous,"\
  3 May 1999,\
  <a href="http://www.geocities.com/SiliconValley/Code/4704/devr.html" target="_blank">http://www.geocities.com/SiliconValley/Code/4704/devr.html</a>
- \[*Inf*\] M. Matsumoto, Y. Kurita,\
  "Twisted GFSR generators,"\
  ACM Transactions on Modeling and Computer Simulation 2(3):179-194, 1992.
- \[*Inf*\] M. Matsumoto, Y. Kurita,\
  "Twisted GFSR generators II,"\
  ACM Transactions on Modeling and Computer Simulation 4:254-266, 1994.

**Comments:**  
- The `setSeed` method writes the given seed to the /dev/random device. This will cause the seed to be mixed into the device driver's randomness pool, which is the intended semantics of `setSeed`.
- Reading /dev/random will normally require file read permission from the Java security layer (as opposed to the operating system security layer). Since the ability to read from /dev/random enables a denial of service attack, by "starving" other applications of sufficient random input, the implementation of this algorithm SHOULD NOT open the stream to /dev/random in a privileged block. Note that this is different to the recommended behaviour for URandom.
- OpenBSD has a /dev/random device, but it is reserved for use by hardware random generators. Implementations are **not** expected to take account of differences in the semantics of /dev/random between different operating systems. \[\[Might revisit this. Do we need mechanisms corresponding to the OpenBSD \*random devices?\]\]

<span id="URandom"></span>

------------------------------------------------------------------------

URandom

SecureRandom Mechanism

**Designers:**  
(of /dev/random) Theodore Ts'o, Phil Karn, Colin Plumb, Dale Worley

**Description:**  
This algorithm obtains bytes from the device driver /dev/urandom originally designed for Linux, or the direct equivalent in other operating systems. /dev/urandom obtains entropy from various hardware events accessible to the OS kernel. It does not block when more bytes are requested than are directly obtainable from the hardware; instead, the available entropy is processed through a cryptographic PRNG, which in the case of the Linux implementation is constructed from a hash function.

If the operating system does not provide a suitable device, or if it cannot be opened, the provider MUST throw NoSuchAlgorithmException from the algorithm class constructor.

**References:**  
\[see references for [DevRandom](#DevRandom)\]

**Comments:**  
- The `setSeed` method writes the given seed to the /dev/urandom device. This will cause the seed to be mixed into the device driver's randomness pool, which is the intended semantics of `setSeed`.
- Reading /dev/urandom will normally require file read permission from the Java security layer (as opposed to the operating system security layer). The stream to /dev/urandom SHOULD be opened in a privileged block.

**Security comment:**  
At the time of writing, /dev/urandom does not ensure that a minimum amount of entropy has been collected before starting to produce output. To work around this, it is strongly recommended that implementations read 32 bytes from /dev/random, blocking as necessary and discarding the result, before reading from /dev/urandom. This need only be done once (for example in a static initialiser).\
\[\[REMIND: check that this is actually sufficient.\]\]

<span id="WiderWake4+1"></span>

------------------------------------------------------------------------

WiderWake4+1

SecureRandom Mechanism

**Description:**  
A fast RNG based on the stream cipher [WiderWake4+1](cs.html#WiderWake4+1-BE). The byte order may be whatever is convenient.

This is intended to be a fast PRNG that produces uniformly distributed output.

Reseeding is achieved by hashing the input seed with SHA-1, and XORing the result into the feedback variables (using whatever byte order is convenient).

**Alias:**  
"WiderWake41" (use for identifiers)

**Security comment:**  
WiderWake has not received a great deal of analysis, and therefore it might not be a good choice for a conservative RNG. However, it is very fast in software.

<span id="SHA1PRNG"></span>

------------------------------------------------------------------------

! SHA1PRNG

SecureRandom Mechanism

**Description:**  
This is the algorithm that was implemented by the SecureRandom class in JDK 1.1. It is similar (but not identical) to the random number generator suggested in Annex D of IEEE Std 1363-2000.

**Missing information:**  
Need full description.

**References:**  
- \[*Inf*\] IEEE Std 1363-2000, Standard for Public-Key Cryptography, 2000.

------------------------------------------------------------------------

<img src="cryptix-s.gif" data-align="right" />

<a href="http://validator.w3.org/check/referer" target="_blank"><img src="vh40.gif" data-border="0" width="88" height="31" alt="Valid HTML 4.0" /></a> <a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank"><img src="vcss.gif" data-border="0" width="88" height="31" alt="Valid CSS" /></a>

[Copyright and trademarks](intro.html#copyright)
