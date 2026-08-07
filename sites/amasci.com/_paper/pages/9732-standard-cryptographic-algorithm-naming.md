---
title: "Standard Cryptographic Algorithm Naming"
source_domain: amasci.com
source_path: ~weidai/scan-mirror/list.html
order: 9732
reachable_from_entry: false
images: 3
internal_links: 162
extracted: 2026-08-07T06:02:19Z
extractor: site_to_paper.py (pandoc)
---

# Standard Cryptographic Algorithm Naming

*Source page: `~weidai/scan-mirror/list.html`*

<span id="top"></span> <a href="intro.html" class="idx" target="d">Introduction</a> \| <a href="conventions.html" class="idx" target="_blank">Conventions</a>

------------------------------------------------------------------------

<a href="mdi.html" class="idx" target="_top">MessageDigest</a> \| <a href="maci.html" class="idx" target="_top">MAC</a> \| <a href="uhi.html" class="idx" target="_top">UniversalHash</a> \| <a href="prfi.html" class="idx" target="_top">PRF / KDF</a> \| <a href="phi.html" class="idx" target="_top">PassphraseHash</a> \| <a href="demi.html" class="idx" target="_top">DEM</a> \|\
<a href="sri.html" class="idx" target="_top">SecureRandom</a> \| <a href="csi.html" class="idx" target="_top">Symmetric Cipher</a> \| <a href="csm.html" class="idx" target="_top">Block Mode</a> \| <a href="csp.html" class="idx" target="_top">Block Padding</a> \| <a href="csk.html" class="idx" target="_top">KeyGenerator</a> \| <a href="#ca" class="idx">Public key algorithms</a>

------------------------------------------------------------------------

**Colour/symbol coding:**\
 • <span class="s">Blue - stable</span>\
 ? <span class="p">Green - provisional</span>\
× <span class="x">Red - experimental</span>\
+ <span class="a">Purple - alleged</span>

------------------------------------------------------------------------

<a href="#top" class="top">^</a> <a href="md.html" id="md" class="head" target="d">MessageDigest</a>

 ? <a href="md.html#BRS-Hn" class="p" target="d">BRS-H1</a>(*cipher*)\
    ...<a href="md.html#BRS-Hn" class="p" target="d">BRS-H20</a>(*cipher*)\
 • <a href="md.html#GOST-Hash" class="s" target="d">GOST-Hash</a>\
 ? <a href="md.html#HAS-V" class="p" target="d">HAS-V</a>\
 • <a href="md.html#HAVAL" class="s" target="d">HAVAL</a>\[(*digestLength*\[*,\
passes*\])\]\
 • <a href="md.html#MD2" class="s" target="d">MD2</a>\
 • <a href="md.html#MD4" class="s" target="d">MD4</a>\
 • <a href="md.html#MD5" class="s" target="d">MD5</a>\
 • <a href="md.html#Panama" class="s" target="d">Panama</a>\
 • <a href="md.html#RIPEMD-128" class="s" target="d">RIPEMD-128</a>\
 • <a href="md.html#RIPEMD-160" class="s" target="d">RIPEMD-160</a>\
 • <a href="md.html#RIPEMD-256" class="s" target="d">RIPEMD-256</a>\
 • <a href="md.html#RIPEMD-320" class="s" target="d">RIPEMD-320</a>\
 • <a href="md.html#SHA-0" class="s" target="d">SHA-0</a>\
 • <a href="md.html#SHA-1" class="s" target="d">SHA-1</a>\
 • <a href="md.html#SHA-256" class="s" target="d">SHA-256</a>\
 • <a href="md.html#SHA-384" class="s" target="d">SHA-384</a>\
 • <a href="md.html#SHA-512" class="s" target="d">SHA-512</a>\
 • <a href="md.html#Snefru-2" class="s" target="d">Snefru-2</a>\[(*digestLength*\[*,\
passes*\])\]\
 • <a href="md.html#Tiger" class="s" target="d">Tiger</a>\[(*digestLength*\[*,\
passes*\])\]\
 • <a href="md.html#Whirlpool-0" class="s" target="d">Whirlpool-0</a>\
 ? <a href="md.html#Whirlpool" class="p" target="d">Whirlpool</a>\

------------------------------------------------------------------------

× <a href="md.html#MGF1" class="x" target="d">MGF1</a>(*digest*)\
 • <a href="md.html#Parallel" class="s" target="d">Parallel</a>(*digests*+)\
+ <a href="md.html#alleged" class="a" target="d">Alleged MessageDigests</a>\

<a href="#top" class="top">^</a> <a href="mac.html" id="mac" class="head" target="d">MAC</a>

 • <a href="mac.html#CBC-MAC-DES-FIPS113" class="s" target="d">CBC-MAC-DES-FIPS113</a>\
 • <a href="mac.html#CBC-MAC" class="s" target="d">CBC-MAC</a>(*cipher*)\
 • <a href="mac.html#XCBC-MAC" class="s" target="d">XCBC-MAC</a>(*cipher*)\
 • <a href="mac.html#HMAC" class="s" target="d">HMAC</a>(*digest*)\
 • <a href="mac.html#MD5-MAC" class="s" target="d">MD5-MAC</a>\
 • <a href="mac.html#RIPEMD-128-MAC" class="s" target="d">RIPEMD-128-MAC</a>\
 • <a href="mac.html#RIPEMD-160-MAC" class="s" target="d">RIPEMD-160-MAC</a>\
 ? <a href="mac.html#SSL3-MAC" class="p" target="d">SSL3-MAC</a>(*digest*)\
 ? <a href="mac.html#Two-Track-MAC" class="p" target="d">Two-Track-MAC</a>\
 ? <a href="mac.html#UMAC16" class="p" target="d">UMAC16</a>\[(...)\]\
 ? <a href="mac.html#UMAC32" class="p" target="d">UMAC32</a>\[(...)\]\
× <a href="mac.html#XMACWithDigest" class="x" target="d">XMACWithDigest</a>(*digest*\[*,\
seedLength*\])\
× <a href="mac.html#PCSWithDigest" class="x" target="d">PCSWithDigest</a>(*digest*)\
+ <a href="mac.html#alleged" class="a" target="d">Alleged MACs</a>\

<a href="#top" class="top">^</a> <a href="uh.html" id="uh" class="head" target="d">UniversalHash</a>

× <a href="uh.html#UHASH16" class="x" target="d">UHASH16</a>\
× <a href="uh.html#UHASH32" class="x" target="d">UHASH32</a>\
+ <a href="uh.html#alleged" class="a" target="d">Alleged UniversalHashes</a>\

<a href="#top" class="top">^</a> <a href="prf.html" id="prf" class="head" target="d">PRF / KDF</a>

 ? <a href="prf.html#HMAC-PRF" class="p" target="d">HMAC-PRF</a>(*digest*)\
 ? <a href="prf.html#KDF2" class="p" target="d">KDF2</a>(*digest*)\
 ? <a href="prf.html#SSL3-PRF" class="p" target="d">SSL3-PRF</a>\
 • <a href="prf.html#TLS-PRF" class="s" target="d">TLS-PRF</a>\
+ <a href="prf.html#alleged" class="a" target="d">Alleged PRFs and KDFs</a>\

<a href="#top" class="top">^</a> <a href="ph.html" id="ph" class="head" target="d">PassphraseHash</a>

 ? <a href="ph.html#bcrypt" class="p" target="d">bcrypt</a>\
 ? <a href="ph.html#BSD" class="p" target="d">BSD</a>\
 • <a href="ph.html#IteratedAndSalted" class="s" target="d">IteratedAndSalted</a>(*digest*)\
 ? <a href="ph.html#MD5-crypt" class="p" target="d">MD5-crypt</a>\
 • <a href="ph.html#Simple" class="s" target="d">Simple</a>(*digest*)\
 • <a href="ph.html#Salted" class="s" target="d">Salted</a>(*digest*)\
 ? <a href="ph.html#Traditional-crypt3" class="p" target="d">Traditional-crypt3</a>\
 • <a href="ph.html#WindowsNT" class="s" target="d">WindowsNT</a>\
+ <a href="ph.html#alleged" class="a" target="d">Alleged PassphraseHashes</a>\

<a href="#top" class="top">^</a> <a href="dem.html" id="dem" class="head" target="d">DEM</a>

 ? <a href="dem.html#DEM1" class="p" target="d">DEM1</a>(*cipher*,\
     *mac*\[,*cipherKeyLength*\])\
× <a href="dem.html#DEM1withPRF" class="x" target="d">DEM1withPRF</a>\
     (*prf,cipher,mac*\
     \[,*cipherKeyLength*\])\
× <a href="dem.html#UST" class="x" target="d">UST</a>(...)\

<a href="#top" class="top">^</a> <a href="sr.html" id="sr" class="head" target="d">SecureRandom</a>

 • <a href="sr.html#Default" class="s" target="d">Default</a>\
× <a href="sr.html#LongTermKeyGen-Interactive" class="x" target="d">LongTermKeyGen-Interactive</a>\
× <a href="sr.html#LongTermKeyGen-NonInteractive" class="x" target="d">LongTermKeyGen-NonInteractive</a>\
× <a href="sr.html#SessionKeyGen" class="x" target="d">SessionKeyGen</a>\
× <a href="sr.html#FastUniform" class="x" target="d">FastUniform</a>\
× <a href="sr.html#Statistical" class="x" target="d">Statistical</a>\

------------------------------------------------------------------------

× <a href="sr.html#BBS" class="x" target="d">BBS</a>\
× <a href="sr.html#DevRandom" class="x" target="d">DevRandom</a>\
 • <a href="sr.html#URandom" class="s" target="d">URandom</a>\
× <a href="sr.html#SHA1PRNG" class="x" target="d">SHA1PRNG</a>\
 • <a href="sr.html#WiderWake4+1" class="s" target="d">WiderWake4+1</a>\

<a href="#top" class="top">^</a> <a href="cs.html" id="cs" class="head" target="d">Symmetric Cipher</a>

 • <a href="cs.html#3-Way" class="s" target="d">3-Way</a>\
 • <a href="cs.html#AES128" class="s" target="d">AES128</a>\
 • <a href="cs.html#AES192" class="s" target="d">AES192</a>\
 • <a href="cs.html#AES256" class="s" target="d">AES256</a>\
 ? <a href="cs.html#Anubis" class="p" target="d">Anubis</a>\
 • <a href="cs.html#Blowfish" class="s" target="d">Blowfish</a>\
 ? <a href="cs.html#BMGL" class="p" target="d">BMGL</a>\
× <a href="cs.html#Camellia" class="x" target="d">Camellia</a>\
 • <a href="cs.html#CAST-128" class="s" target="d">CAST-128</a>\
 • <a href="cs.html#CAST-256" class="s" target="d">CAST-256</a>\
 • <a href="cs.html#CRYPTON-0.5" class="s" target="d">CRYPTON-0.5</a>\
 • <a href="cs.html#CRYPTON-1.0" class="s" target="d">CRYPTON-1.0</a>\
 • <a href="cs.html#CS-Cipher" class="s" target="d">CS-Cipher</a>\
 • <a href="cs.html#DEAL" class="s" target="d">DEAL</a>\
 • <a href="cs.html#DES" class="s" target="d">DES</a>\
 • <a href="cs.html#DESede" class="s" target="d">DESede</a>\
 • <a href="cs.html#DESX" class="s" target="d">DESX</a>\
 • <a href="cs.html#DFC" class="s" target="d">DFC</a>\
 ? <a href="cs.html#DFCv2-128" class="p" target="d">DFCv2-128</a>\[(*rounds*\[*,s*\])\]\
 • <a href="cs.html#Diamond2" class="s" target="d">Diamond2</a>(*rounds*)\
 • <a href="cs.html#E2" class="s" target="d">E2</a>\
 ? <a href="cs.html#FROG" class="p" target="d">FROG</a>\[(*blockSize*\[*,rounds*\])\]\
× <a href="cs.html#GrandCru" class="x" target="d">GrandCru</a>\
 ? <a href="cs.html#GOST" class="p" target="d">GOST</a>\
× <a href="cs.html#Hierocrypt-L1" class="x" target="d">Hierocrypt-L1</a>\
× <a href="cs.html#Hierocrypt-3" class="x" target="d">Hierocrypt-3</a>\
 • <a href="cs.html#HPC-1" class="s" target="d">HPC-1</a>\[(*blockSize*\[*,backup*\])\]\
 ? <a href="cs.html#HPC-2" class="p" target="d">HPC-2</a>\[(*blockSize*\[*,backup*\])\]\
 • <a href="cs.html#ICE" class="s" target="d">ICE</a>\
 • <a href="cs.html#IDEA" class="s" target="d">IDEA</a>\
× <a href="cs.html#ISAAC-BE" class="x" target="d">ISAAC-BE</a>\
× <a href="cs.html#ISAAC-LE" class="x" target="d">ISAAC-LE</a>\
× <a href="cs.html#ISAAC-64-BE" class="x" target="d">ISAAC-64-BE</a>\
× <a href="cs.html#ISAAC-64-LE" class="x" target="d">ISAAC-64-LE</a>\
× <a href="cs.html#JEROBOAM" class="x" target="d">JEROBOAM</a>\
 • <a href="cs.html#Khazad" class="s" target="d">Khazad</a>\
× <a href="cs.html#LEVIATHAN-BE" class="x" target="d">LEVIATHAN-BE</a>\
× <a href="cs.html#LEVIATHAN-LE" class="x" target="d">LEVIATHAN-LE</a>\
× <a href="cs.html#LILI-128" class="x" target="d">LILI-128</a>\
 • <a href="cs.html#LOKI91" class="s" target="d">LOKI91</a>\
 • <a href="cs.html#LOKI97" class="s" target="d">LOKI97</a>\
 • <a href="cs.html#MAGENTA" class="s" target="d">MAGENTA</a>\
 • <a href="cs.html#MARS" class="s" target="d">MARS</a>\
 ? <a href="cs.html#MDC" class="p" target="d">MDC</a>\
 • <a href="cs.html#MISTY1" class="s" target="d">MISTY1</a>\[(*rounds*)\]\
 ? <a href="cs.html#MISTY2" class="p" target="d">MISTY2</a>\[(*rounds*)\]\
× <a href="cs.html#Nimbus" class="x" target="d">Nimbus</a>\
 ? <a href="cs.html#Noekeon" class="p" target="d">Noekeon</a>\[(*rounds*)\]\
 ? <a href="cs.html#Noekeon-Direct" class="p" target="d">Noekeon-Direct</a>\[(*rounds*)\]\
 ? <a href="cs.html#Panama" class="p" target="d">Panama</a>\
× <a href="cs.html#Q" class="x" target="d">Q</a>\
 ? <a href="cs.html#Rainbow" class="p" target="d">Rainbow</a>\
 • <a href="cs.html#RC2" class="s" target="d">RC2</a>\
 • <a href="cs.html#RC4" class="s" target="d">RC4</a>\
 • <a href="cs.html#RC4-drop" class="s" target="d">RC4-drop</a>\[(*nbytes*)\]\
 • <a href="cs.html#RC5" class="s" target="d">RC5</a>\[(*rounds*)\]\
 ? <a href="cs.html#RC5-64" class="p" target="d">RC5-64</a>\[(*rounds*)\]\
 • <a href="cs.html#RC6" class="s" target="d">RC6</a>\[(*rounds*)\]\
 ? <a href="cs.html#RC6-64" class="p" target="d">RC6-64</a>\[(*rounds*)\]\
 • <a href="cs.html#Rijndael" class="s" target="d">Rijndael</a>\
 • <a href="cs.html#Rijndael-160" class="s" target="d">Rijndael-160</a>\
 • <a href="cs.html#Rijndael-192" class="s" target="d">Rijndael-192</a>\
 • <a href="cs.html#Rijndael-224" class="s" target="d">Rijndael-224</a>\
 • <a href="cs.html#Rijndael-256" class="s" target="d">Rijndael-256</a>\
 • <a href="cs.html#SAFER-K" class="s" target="d">SAFER-K</a>\[(*rounds*)\]\
 • <a href="cs.html#SAFER-SK" class="s" target="d">SAFER-SK</a>\[(*rounds*)\]\
 • <a href="cs.html#SAFER+" class="s" target="d">SAFER+</a>\
 • <a href="cs.html#SAFER++" class="s" target="d">SAFER++</a>\
 • <a href="cs.html#SAFER++" class="s" target="d">SAFER++-64</a>\
 ? <a href="cs.html#Sapphire-II" class="p" target="d">Sapphire-II</a>\
× <a href="cs.html#SC2000" class="x" target="d">SC2000</a>\
 • <a href="cs.html#Scream" class="s" target="d">Scream</a>\
 • <a href="cs.html#Scream-F" class="s" target="d">Scream-F</a>\
 • <a href="cs.html#SEAL-3.0-BE" class="s" target="d">SEAL-3.0-BE</a>\[(*Lbytes*)\]\
 • <a href="cs.html#SEAL-3.0-LE" class="s" target="d">SEAL-3.0-LE</a>\[(*Lbytes*)\]\
 • <a href="cs.html#Serpent" class="s" target="d">Serpent</a>\
× <a href="cs.html#SHACAL" class="x" target="d">SHACAL</a>\
 ? <a href="cs.html#SHARK-A" class="p" target="d">SHARK-A</a>\
 • <a href="cs.html#SHARK-E" class="s" target="d">SHARK-E</a>\
 • <a href="cs.html#SKIPJACK" class="s" target="d">SKIPJACK</a>\
× <a href="cs.html#SNOW" class="x" target="d">SNOW</a>\
× <a href="cs.html#SOBER-t16" class="x" target="d">SOBER-t16</a>\
× <a href="cs.html#SOBER-t32" class="x" target="d">SOBER-t32</a>\
 • <a href="cs.html#SPEED-64" class="s" target="d">SPEED-64</a>\[(*rounds*)\]\
 • <a href="cs.html#SPEED-128" class="s" target="d">SPEED-128</a>\[(*rounds*)\]\
 • <a href="cs.html#SPEED-256" class="s" target="d">SPEED-256</a>\[(*rounds*)\]\
 • <a href="cs.html#Square" class="s" target="d">Square</a>\[(*rounds*)\]\
 ? <a href="cs.html#TEA" class="p" target="d">TEA</a>\
 • <a href="cs.html#Twofish" class="s" target="d">Twofish</a>\
 ? <a href="cs.html#WAKE-CFB-BE" class="p" target="d">WAKE-CFB-BE</a>\
 ? <a href="cs.html#WAKE-CFB-LE" class="p" target="d">WAKE-CFB-LE</a>\
 • <a href="cs.html#WiderWake4+1-BE" class="s" target="d">WiderWake4+1-BE</a>\
 • <a href="cs.html#WiderWake4+1-LE" class="s" target="d">WiderWake4+1-LE</a>\
 ? <a href="cs.html#WiderWake4+3-BE" class="p" target="d">WiderWake4+3-BE</a>\
 ? <a href="cs.html#WiderWake4+3-LE" class="p" target="d">WiderWake4+3-LE</a>\

------------------------------------------------------------------------

× <a href="cs.html#Cascade" class="x" target="d">Cascade</a>(*ciphers*+)\
× <a href="cs.html#CascadeWithPRF" class="x" target="d">CascadeWithPRF</a>(*prf,\
ciphers*+)\
 • <a href="cs.html#NullCipher" class="s" target="d">NullCipher</a>\

<a href="#top" class="top">^</a> <a href="cs.html#mode" id="mode" class="head" target="d">Block cipher Mode</a>

 • <a href="cs.html#mode_ECB" class="s" target="d">ECB</a>\
 • <a href="cs.html#mode_CBC" class="s" target="d">CBC</a>\
 • <a href="cs.html#mode_PCBC" class="s" target="d">PCBC</a>\
 • <a href="cs.html#mode_CFB" class="s" target="d">CFB</a>\[(*feedbackBits*)\]\
 • <a href="cs.html#mode_OFB" class="s" target="d">OFB</a>\
 • <a href="cs.html#mode_InterleavedCBC" class="s" target="d">InterleavedCBC</a>(*nStreams*)\
 • <a href="cs.html#mode_InterleavedPCBC" class="s" target="d">InterleavedPCBC</a>(*nStreams*)\
 • <a href="cs.html#mode_InterleavedCFB" class="s" target="d">InterleavedCFB</a>(*nStreams*)\
 • <a href="cs.html#mode_Counter-BE" class="s" target="d">Counter-BE</a>\
 • <a href="cs.html#mode_Counter-LE" class="s" target="d">Counter-LE</a>\
× <a href="cs.html#mode_KFB" class="x" target="d">KFB</a>(*m*)\

<a href="#top" class="top">^</a> <a href="cs.html#pad" id="pad" class="head" target="d">Block cipher Padding</a>

 • <a href="cs.html#pad_CTS" class="s" target="d">CTS</a>\
 • <a href="cs.html#pad_OneAndZeroes" class="s" target="d">OneAndZeroes</a>\
 • <a href="cs.html#pad_PKCSPadding" class="s" target="d">PKCSPadding</a>\
× <a href="cs.html#pad_TBC" class="x" target="d">TBC</a>\
 • <a href="cs.html#pad_NoPadding" class="s" target="d">NoPadding</a>\

<a href="#top" class="top">^</a> <a href="cs.html#kg" id="kg" class="head" target="d">KeyGenerator</a>

 • <a href="cs.html" class="s" target="d">one per symmetric cipher or MAC</a>\
 • <a href="cs.html#kg_AES128" class="s" target="d">AES128</a>\
 • <a href="cs.html#kg_AES192" class="s" target="d">AES192</a>\
 • <a href="cs.html#kg_AES256" class="s" target="d">AES256</a>\
 • <a href="cs.html#kg_DES-EDE2" class="s" target="d">DES-EDE2</a>\
 • <a href="cs.html#kg_DES-EDE3" class="s" target="d">DES-EDE3</a>\

<a href="#top" class="top">^</a> <a href="ca.html" id="ca" class="head" target="d">Asymmetric Cipher</a>

× <a href="ca.html#DLIES-ISO" class="x" target="d">DLIES-ISO</a>(*prf,dem*)\
× <a href="ca.html#ECIES-ISO" class="x" target="d">ECIES-ISO</a>(*prf,dem*)\
 • <a href="ca.html#ElgamalEnc" class="s" target="d">ElgamalEnc</a>(*outputFormat*)\
     /<a href="ca.html#cem_Raw" target="d">Raw</a>\
 • <a href="ca.html#ElgamalEnc" class="s" target="d">ElgamalEnc</a>(*outputFormat*)\
     /<a href="ca.html#cem_PKCS1-1.5" class="s" target="d">PKCS1-1.5</a>\
 • <a href="ca.html#RSA" class="s" target="d">RSA</a>/<a href="ca.html#cem_Raw" class="s" target="d">Raw</a>\
 • <a href="ca.html#RSA" class="s" target="d">RSA</a>/<a href="ca.html#cem_PKCS1-1.5" class="s" target="d">PKCS1-1.5</a>\
 • <a href="ca.html#RSA" class="s" target="d">RSA</a>/<a href="ca.html#cem_OAEP-MGF1" class="s" target="d">OAEP-MGF1</a>(*digest*)\
 • <a href="ca.html#RSA" class="s" target="d">RSA</a>/<a href="ca.html#cem_KEM" class="x" target="d">KEM</a>(*prf,dem*)\
× <a href="ca.html#RSA" class="s" target="d">RSA</a>/<a href="ca.html#cem_OAEP++" class="x" target="d">OAEP++</a>(*digest,dem*)\

<a href="#top" class="top">^</a> <a href="sig.html" id="sig" class="head" target="d">Signature</a>

 • <a href="sig.html#DSA" class="s" target="d">DSA</a>\[(*outputFormat*)\]\
 • <a href="sig.html#DSA-1363" class="s" target="d">DSA-1363</a>\[(*outputFormat*)\]\
     /<a href="sig.html#sem_EMSA1" target="d">EMSA1</a>(*digest*)\
 • <a href="sig.html#ECDSA" class="s" target="d">ECDSA</a>\[(*outputFormat*)\]\
     \[/<a href="sig.html#sem_EMSA1" target="d">EMSA1</a>(*digest*)\]\
 ? <a href="sig.html#ECNR" class="p" target="d">ECNR</a>(*outputFormat*)\
     /<a href="sig.html#sem_EMSA1" target="d">EMSA1</a>(*digest*)\
× <a href="sig.html#ECNR" class="p" target="d">ECNR</a>(*outputFormat*)\
     /<a href="sig.html#sem_PSS-MGF1" class="x" target="d">PSS-MGF1</a>(*digest*)\
 • <a href="sig.html#ElgamalSig" class="s" target="d">ElgamalSig</a>(*outputFormat*)\
     /<a href="sig.html#sem_EMSA1" target="d">EMSA1</a>(*digest*)\
 • <a href="sig.html#ElgamalSig" class="s" target="d">ElgamalSig</a>(*outputFormat*)\
     /<a href="sig.html#sem_PKCS1-1.5" target="d">PKCS1-1.5</a>(*digest*)\
× <a href="sig.html#ElgamalSig" class="s" target="d">ElgamalSig</a>(*outputFormat*)\
     /<a href="sig.html#sem_PSS-MGF1" class="x" target="d">PSS-MGF1</a>(*digest*)\
× <a href="sig.html#ESIGN" class="x" target="d">ESIGN</a>\
     /<a href="sig.html#sem_EMSA5-MGF1" class="x" target="d">EMSA5-MGF1</a>(*digest*)\
 ? <a href="sig.html#NR" class="p" target="d">NR</a>(*outputFormat*)\
     /<a href="sig.html#sem_EMSA1" target="d">EMSA1</a>(*digest*)\
× <a href="sig.html#NR" class="p" target="d">NR</a>(*outputFormat*)\
     /<a href="sig.html#sem_PSS-MGF1" class="x" target="d">PSS-MGF1</a>(*digest*)\
 • <a href="sig.html#RSA" class="s" target="d">RSA</a>/<a href="sig.html#sem_Raw" class="s" target="d">Raw</a>\
 • <a href="sig.html#RSA" class="s" target="d">RSA</a>/<a href="sig.html#sem_EMSA2" class="s" target="d">EMSA2</a>(*digest*)\
 • <a href="sig.html#RSA" class="s" target="d">RSA</a>/<a href="sig.html#sem_PKCS1-1.5" class="s" target="d">PKCS1-1.5</a>(*digest*)\
 ? <a href="sig.html#RSA" class="s" target="d">RSA</a>/<a href="sig.html#sem_SSL3" class="p" target="d">SSL3</a>\
 ? <a href="sig.html#RSA" class="s" target="d">RSA</a>/<a href="sig.html#sem_TLS" class="p" target="d">TLS</a>\
× <a href="sig.html#RSA" class="s" target="d">RSA</a>/<a href="sig.html#sem_PSS-MGF1" class="x" target="d">PSS-MGF1</a>(*digest*)\
× <a href="sig.html#RSA" class="s" target="d">RSA</a>/<a href="sig.html#sem_PSSR-MGF1" class="x" target="d">PSSR-MGF1</a>(*digest*)\
 • <a href="sig.html#RSA2" class="s" target="d">RSA2</a>/<a href="sig.html#sem_EMSA2" class="s" target="d">EMSA2</a>(*digest*)\
 • <a href="sig.html#RW" class="s" target="d">RW</a>/<a href="sig.html#sem_EMSA2" class="s" target="d">EMSA2</a>(*digest*)\
× <a href="sig.html#RW" class="s" target="d">RW</a>/<a href="sig.html#sem_PSS-MGF1" class="x" target="d">PSS-MGF1</a>(*digest*)\
× <a href="sig.html#RW" class="s" target="d">RW</a>/<a href="sig.html#sem_PSSR-MGF1" class="x" target="d">PSSR-MGF1</a>(*digest*)\

<a href="#top" class="top">^</a> <a href="ka.html" id="ka" class="head" target="d">KeyAgreement</a>

× <a href="ka.html#DH" class="x" target="d">DH</a>\
× <a href="ka.html#DH2" class="x" target="d">DH2</a>\
× <a href="ka.html#ECDHC" class="x" target="d">ECDHC</a>\
× <a href="ka.html#ECMQVC" class="x" target="d">ECMQVC</a>\
× <a href="ka.html#ECSTS" class="x" target="d">ECSTS</a>\
× <a href="ka.html#MQV" class="x" target="d">MQV</a>\
× <a href="ka.html#STS" class="x" target="d">STS</a>\

<a href="#top" class="top">^</a> <a href="kf.html" id="kf" class="head" target="d">KeyFactory</a>

 ? <a href="kf.html#Generic/ASN1" class="p" target="d">Generic/ASN.1</a>\
 ? <a href="kf.html#Generic/Base64-ASN1" class="p" target="d">Generic/Base64-ASN.1</a>\
× <a href="kf.html#Generic/OpenPGP" class="x" target="d">Generic/OpenPGP</a>\
× <a href="kf.html#DH/ASN1" class="x" target="d">DH/ASN.1</a>\
 • <a href="kf.html#DH/OpenPGP" class="s" target="d">DH/OpenPGP</a>\
× <a href="kf.html#DSA/ASN1" class="x" target="d">DSA/ASN.1</a>\
 • <a href="kf.html#DSA/OpenPGP" class="s" target="d">DSA/OpenPGP</a>\
× <a href="kf.html#ECDH/ASN1" class="x" target="d">ECDH/ASN.1</a>\
× <a href="kf.html#ECDSA/ASN1" class="x" target="d">ECDSA/ASN.1</a>\
× <a href="kf.html#ECNR/ASN1" class="x" target="d">ECNR/ASN.1</a>\
× <a href="kf.html#ElgamalSig/ASN1" class="x" target="d">ElgamalSig/ASN.1</a>\
 • <a href="kf.html#ElgamalSig/OpenPGP" class="s" target="d">ElgamalSig/OpenPGP</a>\
× <a href="kf.html#ESIGN/ASN1" class="x" target="d">ESIGN/ASN.1</a>\
× <a href="kf.html#NR/ASN1" class="x" target="d">NR/ASN.1</a>\
 • <a href="kf.html#RSA/ASN1" class="s" target="d">RSA/ASN.1</a>\
 • <a href="kf.html#RSA/OpenPGP" class="s" target="d">RSA/OpenPGP</a>\
× <a href="kf.html#RW/ASN1" class="x" target="d">RW/ASN.1</a>\

<a href="#top" class="top">^</a> <a href="apg.html" id="apg" class="head" target="d">AlgorithmParameterGenerator</a>

 • <a href="apg.html#DH" class="s" target="d">DH</a>\
 • <a href="apg.html#DSA" class="s" target="d">DSA</a>\
 • <a href="apg.html#ElgamalSig" class="s" target="d">ElgamalSig</a>\

<a href="#top" class="top">^</a> <a href="ap.html" id="ap" class="head" target="d">AlgorithmParameters</a>

 ? <a href="ap.html#Generic/ASN1" class="p" target="d">Generic/ASN.1</a>\
× <a href="ap.html#DH/ASN1" class="x" target="d">DH/ASN.1</a>\
× <a href="ap.html#DSA/ASN1" class="x" target="d">DSA/ASN.1</a>\
 ? <a href="ap.html#ECDH/ASN1" class="p" target="d">ECDH/ASN.1</a>\
 ? <a href="ap.html#ECDSA/ASN1" class="p" target="d">ECDSA/ASN.1</a>\
× <a href="ap.html#ECNR/ASN1" class="x" target="d">ECNR/ASN.1</a>\
× <a href="ap.html#ElgamalSig/ASN1" class="x" target="d">ElgamalSig/ASN.1</a>\
× <a href="ap.html#ESIGN/ASN1" class="x" target="d">ESIGN/ASN.1</a>\
× <a href="ap.html#NR/ASN1" class="x" target="d">NR/ASN.1</a>\
× <a href="ap.html#RSA/ASN1" class="x" target="d">RSA/ASN.1</a>\
× <a href="ap.html#RW/ASN1" class="x" target="d">RW/ASN.1</a>\

------------------------------------------------------------------------

<a href="intro.html#copyright" target="d">Copyright and trademark information</a>

![](cryptix-s.gif)

<a href="http://validator.w3.org/check/referer" target="_blank"><img src="vh40.gif" data-border="0" width="88" height="31" alt="Valid HTML 4.0" /></a> <a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank"><img src="vcss.gif" data-border="0" width="88" height="31" alt="Valid CSS" /></a>
