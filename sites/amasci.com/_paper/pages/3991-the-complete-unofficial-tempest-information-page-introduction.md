---
title: "The Complete, Unofficial TEMPEST Information Page - Introduction"
source_domain: amasci.com
source_path: ~joelm/tempestintro.html
order: 3991
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T17:10:44Z
extractor: site_to_paper.py (pandoc)
---

# The Complete, Unofficial TEMPEST Information Page - Introduction

*Source page: `~joelm/tempestintro.html`*

[The Complete, Unofficial\
TEMPEST Information Page](http://www.eskimo.com/~joelm/tempest.html)
====================================================================

**This page is about surveillance technology. ** If a search engine mistakenly led you here, try [**Shakespeare**](http://www.google.com/search?q=%2Bshakespear+%2B%22the+tempest%22&btnG=Google+Search)**,** [**Pontiacs**](http://www.google.com/search?q=%2Bpontiac+%2Btempest&hl=en&safe=off&btnG=Google+Search)**,** or [**Arcade Games**](http://dir.yahoo.com/Recreation/Games/Video_Games/Classic_Arcade_Games/Titles/Tempest/)**.**

## Introduction to TEMPEST

[What is TEMPEST?](#What%20is)\
[TEMPEST History](#TEMPEST%20History)\
[Just how prevalent is emanation monitoring?](#Just%20how%20prevalent%20is%20emanation%20monitoring?)\
[TEMPEST Urban Folklore](#TEMPEST%20Urban%20Folklore)\
[General TEMPEST Information](#General%20TEMPEST%20Information)\
[EMSEC](#EMSEC)\
[HIJACK and NONSTOP](#HIJACK)\
[Online Sources](#Online%20Sources)\
[Patents](#Patents)\
[Paper Sources](#Paper%20Sources)\
[Monitoring Devices](#Monitoring%20Devices)\
[Do It Yourself Shielding Sources](#Do%20It%20Yourself%20Shielding)

------------------------------------------------------------------------

### <span id="What is"></span>**What is TEMPEST?**

TEMPEST is a U.S. government code word that identifies a classified set of standards for limiting electric or electromagnetic radiation emanations from electronic equipment. Microchips, monitors, printers, and all electronic devices emit radiation through the air or through conductors (such as wiring or water pipes). An example is using a kitchen appliance while watching television. The static on your TV screen is emanation caused interference. (If you want to learn more about this phenomena, a company called NoRad has an excellent [discussion](http://www.noradcorp.com/2tutor.htm) (**X**) of electromagnetic radiation and computer monitors (and Chomerics has a good electromagnetic interference 101 [page](http://www.chomerics.com/emi.html)), that you don't need to be an electrical engineer to understand. Also, while not TEMPEST-specific, a journal called [Compliance Engineering](http://world.std.com/~billsmr) (**O**), typically has good technical articles relating to electromagnetic interference. There's also the [Electromagnetic Compliance FAQ](http://world.std.com/~techbook/compliance_faq.html).)

During the 1950's, the government became concerned that emanations could be captured and then reconstructed. Obviously, the emanations from a blender aren't important, but emanations from an electric encryption device would be. If the emanations were recorded, interpreted, and then played back on a similar device, it would be extremely easy to reveal the content of an encrypted message. Research showed it was possible to capture emanations from a distance, and as a response, the TEMPEST program was started. (For some interesting perspectives on the history of TEMPEST, see this [timeline](http://cryptome.org/tempest-old.htm) and do a text search for TEMPEST at this [UK list archive](http://www.chiark.greenend.org.uk/pipermail/ukcrypto/2000-February.txt).)

The purpose of the program was to introduce standards that would reduce the chances of "leakage" from devices used to process, transmit, or store sensitive information. TEMPEST computers and peripherals (printers, scanners, tape drives, mice, etc.) are used by government agencies and contractors to protect data from emanations monitoring. This is typically done by shielding the device (or sometimes a room or entire building) with copper or other conductive materials. (There are also active measures for "jamming" electromagnetic signals. Refer to some of the [patents listed below](#Patents).)

Bruce Gabrielson, who has been in the TEMPEST biz for ages, has a nice unclassified [general description](http://206.102.92.130/ses/papers/TEMPEST/Whatis.html) of TEMPEST that was presented at an Air Force security seminar in 1987.

In the United States, TEMPEST consulting, testing, and manufacturing is a big business, estimated at over one billion dollars a year. (Economics has caught up TEMPEST though. Purchasing TEMPEST standard hardware is not cheap, and because of this, a lesser standard called [ZONE](http://www.wangfed.com/products/infosec/homepage/zone.html#Zone) (**O**) has been implemented. This does not offer the level of protection of TEMPEST hardware, but it quite a bit cheaper, and is used in less sensitive applications.)

Emanation standards aren't just confined to the United States. NATO has a similar standard called the AMSG 720B Compromising Emanations Laboratory Test Standard. In Germany, the TEMPEST program is administered by the National Telecom Board. In the UK, Government Communications Headquarters (GCHQ), the equivalent of the NSA, has their own program.

------------------------------------------------------------------------

### <span id="TEMPEST History"></span>TEMPEST History

The original 1950s emanations standard was called NAG1A. During the 1960s it was revised and reissued as FS222 and later FS222A.

In 1970 the standard was significantly revised and published as National Communications Security Information Memorandum 5100 (Directive on TEMPEST Security), also known as NACSIM 5100. This was again revised in 1974.

Current national TEMPEST policy is set in National Communications Security Committee Directive 4, dated January 16, 1981. It instructs federal agencies to protect classified information against compromising emanations. This document is known as NACSIM 5100A and is classified.

The National Communications Security Instruction (NACSI) 5004 (classified Secret), published in January 1984, provides procedures for departments and agencies to use in determining the safeguards needed for equipment and facilities which process national security information in the United States. National Security Decision Directive 145, dated September 17, 1984, designates the National Security Agency (NSA) as the focal point and national manager for the security of government telecommunications and Automated Information Systems (AISs). NSA is authorized to review and approve all standards, techniques, systems and equipment for AIS security, including TEMPEST. In this role, NSA makes recommendations to the National Telecommunications and Information Systems Security Committee for changes in TEMPEST polices and guidance.

------------------------------------------------------------------------

### <span id="Just how prevalent is emanation monitoring?"></span>Just how prevalent is emanation monitoring?

There are no public records that give an idea of how much emanation monitoring is actually taking place. There are isolated anecdotal accounts of monitoring being used for industrial espionage (see Information Warfare, by Winn Schwartau), but that's about it. (However, see a very interesting paper written by Ian Murphy called [Who's Listening](http://www.ravenswoodinc.com/captwhos.htm) that has some Cold War TEMPEST spy stories.) Unfortunately, there's not an emanation monitoring category in the FBI Uniform Crime Reports.  (While not TEMPEST-specific, the San Jose Mercury News printed a [November 11, 1998 article](http://www.mercurycenter.com/business/top/001932.htm)(**O**) on how much money American businesses are losing to economic espionage.  Considering some of the countries involved, hi-tech spying techniques are likely being used in some cases.)

#### Threat?

There are a few data points that lead one to believe there is a real threat though, at least from foreign intelligence services. First of all, the TEMPEST industry is over a billion dollar a year business. This indicates there's a viable threat to justify all of this protective hardware (or it's one big scam that's making a number of people quite wealthy).

This scope of the threat is backed up with a quote from a Navy manual that discusses "compromising emanations" or CE. "Foreign governments continually engage in attacks against U.S. secure communications and information processing facilities for the sole purpose of exploiting CE." I'm sure those with appropriate security clearances have access to all sorts of interesting cases of covert monitoring.

#### Or not?

In 1994, the Joint Security Commission issued a report to the Secretary of Defense and the Director of Central Intelligence called "[Redefining Security](http://jya.com/jcs.htm)." It's worthwhile to quote the entire section that deals with TEMPEST.

TEMPEST (an acronym for Transient Electromagnetic Pulse Emanation Standard) is both a specification for equipment and a term used to describe the process for preventing compromising emanations. The fact that electronic equipment such as computers, printers, and electronic typewriters give off electromagnetic emanations has long been a concern of the US Government. An attacker using off-the-shelf equipment can monitor and retrieve classified or sensitive information as it is being processed without the user being aware that a loss is occurring. To counter this vulnerability, the US Government has long required that electronic equipment used for classified processing be shielded or designed to reduce or eliminate transient emanations. An alternative is to shield the area in which the information is processed so as to contain electromagnetic emanations or to specify control of certain distances or zones beyond which the emanations cannot be detected. The first solution is extremely expensive, with TEMPEST computers normally costing double the usual price. Protecting and shielding the area can also be expensive. While some agencies have applied TEMPEST standards rigorously, others have sought waivers or have used various levels of interpretation in applying the standard. In some cases, a redundant combination of two or three types of multilayered protection was installed with no thought given either to cost or actual threat.

A general manager of a major aerospace company reports that, during building renovations, two SAPs required not only complete separation between their program areas but also TEMPEST protection. This pushed renovation costs from \$1.5 million to \$3 million just to ensure two US programs could not detect each other's TEMPEST emanations.

In 1991, a CIA Inspector General report called for an Intelligence Community review of domestic TEMPEST requirements based on threat. The outcome suggested that hundreds of millions of dollars have been spent on protecting a vulnerability that had a very low probability of exploitation. This report galvanized the Intelligence Community to review and reduce domestic TEMPEST requirements.

Currently, many agencies are waiving TEMPEST countermeasures within the United States. The rationale is that a foreign government would not be likely to risk a TEMPEST collection operation in an environment not under their control. Moreover, such attacks require a high level of expertise, proximity to the target, and considerable collection time. Some agencies are using alternative technical countermeasures that are considerably less costly. Others continue to use TEMPEST domestically, believing that TEMPEST procedures discourage collection attempts. They also contend that technical advances will raise future vulnerabilities. The Commission recognizes the need for an active overseas TEMPEST program but believes the domestic threat is minimal.

Contractors and government security officials interviewed by the Commission commend the easing of TEMPEST standards within the last two years. However, even with the release of a new national TEMPEST policy, implementation procedures may continue to vary. The new policy requires each Certified TEMPEST Technical Authority (CTTA), keep a record of TEMPEST applications but sets no standard against which a facility can be measured. The Commission is concerned that this will lead to inconsistent applications and continued expense.

Given the absence of a domestic threat, any use of TEMPEST countermeasures within the US should require strong justification. Whenever TEMPEST is applied, it should be reported to the security executive committee who would be charged with producing an annual national report to highlight inconsistencies in implementation and identify actual TEMPEST costs.

Domestic implementation of strict TEMPEST countermeasures is a prime example of a security excess because costly countermeasures were implemented independent of documented threat or of a site's total security system. While it is prudent to continue spot checks and consider TEMPEST in the risk management review of any facility storing specially protected information, its implementation within the United States should not normally be required.

*The Commission recommends that domestic TEMPEST countermeasures not be employed except in response to specific threat data and then only in cases authorized by the most senior department or agency head.*\
 

It's also interesting to note that the National Reconnaissance Office (NRO) [eliminated](http://www.fas.org/irp/nro/jeremiah_9.htm) the need for domestic TEMPEST requirements in 1992.

#### Maybe

The main difficulty in tracking instances of emanation monitoring is because it's passive and conducted at a distance from the target, it's hard to discover unless you catch the perpetrator red-handed (a bad Cold War pun). Even if a spy was caught, more than likely the event would not be publicized, especially if it was corporate espionage. Both government and private industry have a long history of concealing security breaches from the public.

As with any risk, you really need to weigh the costs and benefits. Is it cheaper and more efficient to have a spy pass himself off as a janitor to obtain information, or to launch a fairly technical and sophisticated monitoring attack to get the same data? While some "hard" targets may justify a technical approach, traditional human intelligence (HUMINT) gathering techniques are without a doubt, used much more often than emanation monitoring.

------------------------------------------------------------------------

### <span id="TEMPEST Urban Folklore"></span>TEMPEST Urban Folklore

Because of the general lack of knowledge regarding TEMPEST topics, there is a fair amount of urban folklore associated with it. Here's some common myths. And if you can provide a primary source to prove me wrong, let me know (no friends of friends please).

- *It's illegal to shield your PC from emanation monitoring*. Seline's paper suggests this, but there are no laws that I've found that even come close to substantiating. Export of TEMPEST-type shielded devices is restricted under ITAR, and most manufacturers will only sell to government authorized users, but there are no laws banning domestic use of shielded PCs.

<!-- -->

- *Emanation monitoring was used to snare CIA spy Aldrich Ames and also during the Waco incident*. [Winn Schwartau](http://www.infowar.com) appears to have started the speculation on these two events. While conventional electronic surveillance techniques were used, there's no published evidence to support a "TEMPEST attack."

<!-- -->

- *You can put together a emanation monitoring device for under \$100 worth of Radio Shack and surplus parts.* Perhaps for a dumb video display terminal (VDT), but certainly not for a VGA or SVGA monitor. And definitely not for doing serious remote monitoring. There have been anecdotal accounts of television sets with rabbit ears displaying fragments of a nearby computer screen. Beyond that, effective, cheap, easy-to-build devices don't seem to exist. If they did, the plans would be available on the Net at just about every hacker site.

<!-- -->

- *LCD displays on laptops eliminate the risks of TEMPEST attacks.* Maybe, maybe not. The technology behind LCD monitors versus typical CRT monitors may somewhat reduce the risk, but I wouldn't bet my life on it. There have been anecdotal accounts of noisy laptop screens being partially displayed on TVs. If laptops were emanation proof, I seriously doubt there would be TEMPEST standard portables on the market.

<!-- -->

- *TEMPEST is an acronym*. Maybe. There have been a variety of attempts to turn TEMPEST into a meaningful acronym (such as Transient ElectroMagnetic Pulse Emanation STandard) by government and non-government sources. The official government line denies this, and states TEMPEST was a code word originally given to the standards, and didn't have any particular meaning.

<!-- -->

- *There's virtually no information about TEMPEST on the Net because it's so secret*. Nonsense. The world does not revolve around AltaVista. You just need to dig a little deeper.

------------------------------------------------------------------------

### <span id="General TEMPEST Information"></span>General TEMPEST Information

#### <span id="Online Sources"></span>Online Sources

- Ross Anderson and Markus Kuhn (from Cambridge, UK) have written a new paper that I consider one of the most definitive sources of contemporary research on TEMPEST. [Soft Tempest: Hidden Data Transmission Using Electromagnetic Emanations](http://www.cl.cam.ac.uk/~mgk25/ih98-tempest.pdf) (**X**), looks at the software side of the topic, including TEMPEST viruses that can enhance interceptions. The most startling aspect, and the issue that has a lot of spook's knickers in a knot, is the use of special fonts to defeat monitoring.  This .PDF file is a must read.  You can now also [download the anti-TEMPEST fonts](http://www.cl.cam.ac.uk/~mgk25/st-fonts.zip).

<!-- -->

- One of the most distributed sources of TEMPEST information on the Net is a paper by Christopher Seline called "[Eavesdropping On the Electromagnetic Emanations of Digital Equipment: The Laws of Canada, England and the United States.](http://www.eff.org/pub/Privacy/Security/tempest_legal.draft)" It deals with laws relating to eavesdropping on the electromagnetic emanations of digital equipment. Seline postulates that it is illegal for a U.S. citizen to shield their hardware against emanation eavesdropping. There are no laws to support this contention. Other information in the Seline paper has been questioned by informed sources, however, there is good source material contained in it.

<!-- -->

- The other widely distributed source is Grady Ward's ["TEMPEST in a teapot"](http://www.eff.org/pub/Privacy/Security/tempest_monitoring.article) (**X**) post to the Cypherpunks list that discusses practical countermeasures based on techniques radio operators use to reduce electromagnetic interference. Good technical source material.

<!-- -->

- "[Electromagnetic Radiation from Video Display Units: An Eavesdropping Risk?](http://jya.com/emr.pdf)" (**X**) by Wim van Eck, Computers & Security, 1985 Vol. 4. This is the paper that brought emanation monitoring to the public's attention. Van Eck was a research engineer at the Dr. Neher Laboratories of The Netherlands' Post, Telegraph, and Telephone (PTT) Service. His paper was purposely incomplete on several points, and modifications were required to actually build a working device based on his plans. (.PDF format)

<!-- -->

- "Electromagnetic Eavesdropping Machines for Christmas?" (**X**) Computers & Security, Vol. 7, No. 4 \[1988\] A follow-up article to the van Eck paper. Excellent source material regarding why (and what) certain details weren't included in the original. [.PDF](http://jya.com/bits.pdf) and [HTML](http://jya.com/bits.htm) formats.

<!-- -->

- ["The Threat of Information Theft by Reception of Electromagnetic Radiation from RS-232 Cables"](http://jya.com/rs232.pdf), Peter Smulders, Dept of Electrical Engineering, Eindhoven University of Technology, 1990. Many people just think their computer monitors are vulnerable to emanation monitoring. This paper clearly shows that cabling is equally at risk. (.PDF format)

<!-- -->

- ["Protective Measures Against Compromising Electromagnetic Radiation Emitted by Video Display Terminals"](http://www.fc.net/phrack/files/p44/p44-10.html) (**X**) by Professor Erhart Moller, Aachen University, Germany, 1990. A good introduction. Reprinted in Phrack 44.

<!-- -->

- "[Data Security by Design](http://jya.com/datasec.htm)" was written by George R. Wilson and appeared in Progressive Architecture, March 1995. It offers some interesting facts on shielding structures from emanation leakage.

<!-- -->

- PC Week, March 10, 1987 v4 p35(2) has an [article by Vin McLellan](http://members.aol.com/aaronh4321/vaneck.html) (**O**) about emanation monitoring and TEMPEST. 

<!-- -->

- [TEMPEST Industry and People Grapple with Changing Perspectives](http://www.blackmagic.com/ses/papers/TEMPEST/TEMPIND.html) is a 1991 paper by Dr. Bruce C. Gabrielson (a very respected name in the TEMPEST community) that discusses some of the economic challenges of the industry.  Good background.  Gabrielson also has a variety of [EMC](http://206.102.92.130/ses/bruceg/EMC.html) and I[NFOSEC](http://206.102.92.130/ses/bruceg/bgrpts.html) papers online.

<!-- -->

- Winn "Mr. Information Warfare" Schwartau gave a presentation at DefCon II (the annual Vegas hacker get together) in 1994.  Some decent information.  The ~20 minute speech is available as a [.WAV file](http://www.defcon.org/speeches/dc-2/winn-tempest-truespeech-dc2.wav)(**O**) (a little over a meg - right mouse click to download).

<!-- -->

- [TEMPEST MONITORING: A MAJOR THREAT TO SECURITY](http://www.mrs.umn.edu/~lient/Tempest.html) appears to be a university student paper. Decently written and fairly comprehensive. 

<!-- -->

- Truthnet, Issue 2 (an e-zine) has a short, general layman's article on [TEMPEST.](http://www.island.net/~truthnet/issue2/tempest.html)

<!-- -->

- COMPUTERWOCHE, August 8, 1986, \#34 [Lauschangriff auf unbekannte Schwachstelle](http://www.computerwoche.de/archiv/1986/34/8634c080.html) is a German article regarding TEMPEST shielded terminals. Thanks to Ulf Mller for the following summary:

> *The article says that authorities had long known about compromising radiation, but the information had leaked to business only recently. It was usually neglected by commercial computing centers and completely unknown to users. Experts estimate that screen contents can be received over a distance of 1 km, and of 300 m using amateur equipment. SCS GmbH gave recommendations on low-radiation screens determined in experiments. Room protection with Faraday cages is explained. Radiation-free computers, typically implemented by a Faraday cage inside the box, existed but were not available to the market. Beginning March 1 that year, authorities processing sensitive data were required by order of the ministry of interior to use only Tempest-protected devices approved by the ZfCH (= central office for encipherment, the predecessor of the BSI). The producers of those devices are obliged to secrecy and may deliver to authorities only. Ericsson was the market leader for security screens with a special version of the S41 terminal with an annual turnover of 10,000,000 DM. They would have liked to sell more of them, but were not allowed to deliver them to private companies.*

- Illegal Communications Interception Equipment Was Destined for Vietnam ([from iPartnership](http://www.ipartnership.com/))

> *7/9/99*\
> *iDEFENSE*\
> *By Bill Pietrucha*

> *Vietnam was the intended final shipping point for restricted U.S. communications intercept*\
> *equipment, iPARTNERSHIP has learned. Shalom Shaphyr, arrested earlier this week for*\
> *allegedly possessing and selling Tempest computer intercept equipment, planned to first falsify the*\
> *nature of the equipment in export papers, ship it to a U.S. NATO ally, then to Israel, and finally to*\
> *Vietnam.*

> *The Tempest computer intercept equipment, also known as a video intercept receiver, is*\
> *considered a defense article under the International Traffic in Arms Regulations (ITAR), and*\
> *cannot be shipped to Vietnam without an export license.*

> *In the U.S. District Court in the Eastern District Virginia late yesterday, Shaphyr, an Israeli citizen*\
> *living in the U.S. under a business visa, requested his detention hearing be postponed until July 20,*\
> *to give his lawyers "time to review the charges against me."*

> *Shaphyr will continue to be held in the City of Alexandria, Va. detention center until the July 20*\
> *detention hearing date.*

> *In papers filed with the court, FBI Special Agent Christian Zajac testified Shaphyr was "looking*\
> *for a Tempest monitoring system" capable of remotely capturing computer emanations. The*\
> *reason for the equipment, Shaphyr had said, was to view what was on a computer monitor from a*\
> *distance of "a few tens of feet maybe to a few hundred feet" away.*
>
> *Zajac, an FBI Special Agent for the past two years, told the court Shaphyr indicated the*\
> *equipment would be used by the Vietnamese government "in a joint venture." Along with the*\
> *equipment, Zajac told the court, Shaphyr also asked for a syllabus outlining the training that would*\
> *be provided on the Tempest equipment, indicating the trainees would be Vietnamese.*
>
> *Shaphyr, iPARTNERSHIP learned, operates a business with offices in Vietnam and England, and*\
> *is an FAA certified pilot, flight engineer and navigator listing his address in Ho Chi Minh City, Viet*\
> *Nam.*
>
> *Zajac said the joint FBI-U.S. Customs Service investigation, which began in November 1998, led*\
> *to Shaphyr's arrest this past Wednesday after Shaphyr paid an FBI undercover agent \$2,000 in*\
> *U.S. currency to export the Tempest equipment to Israel without a license. The total price*\
> *Shaphyr allegedly agreed to pay for the Tempest equipment was \$30,000, Zajac testified.*
>
> *Zajac said the investigation did not end with Shaphyr's arrest, and is continuing.*\
>  

- [Slashdot](http://slashdot.org/articles/99/07/19/1324207.shtml) has a short thread on TEMPEST (7/19/99) with some interesting personal accounts of ex-military types.

<!-- -->

- [Berke Durak](http://jya.com/tempest-cpu.htm) has some interesting test results as well as source code that demonstrates how easy a CPU can transmit data in the FM band.

<!-- -->

- Some general notes on a [presentation](http://users.ox.ac.uk/~mert0236/HIP/aug0805.html) and workshop given by Professor Mueller (Moller?) during the 1997 HIP conference. Some interesting technical notes.

<!-- -->

- [Tempest - een beeldige opsporingsmethode](http://cwis.kub.nl/~frw/people/koops/Tempest.htm) - 1997 Dutch article by Bert-Jaap Koops.  Quick summary by an anonymous reader:

> *In the article Drs. B.J. Koops -- a researcher at the Katholieke Universiteit Brabant and the Technische Universiteit Tilburg (Catholic University Brabant and Technical University Tilburg, both in the Netherlands) gives a short introduction to what TEMPEST is, what it can be used for.*
>
> *He notes that there are three ways of tapping info: wires (electrical), direct radiation and radiation emitted by screen-to-PC cable.*
>
> *He continues talking about wether or not it is legal for individuals and the police to use TEMPEST monitoring.*\
> *It turns out that it is illegal for individuals (due to some amendments to wiretapping laws), and it is illegal for police (since they need explicit permission to do so, and TEMPEST nor radiation monitoring is mentioned in Dutch law).*
>
> *He ends the article proposing a discussion in the parliament on wether or not PC-tapping would be allowed in the Netherlands, since that is a political  decision.*\
>  

- [c't interview](http://www.ix.de/ct/english/99/04/182/) (4/94) with surveillance expert Hans-Georg Wolf on industrial espionage.  Some interesting TEMPEST tidbits.  There's also another general [article](http://www.heise.de/ct/Service/English.htm/99/04/174/) in the same issue with some eavesdropped monitor photos. 

<!-- -->

- November 13, 1999 - Issue 21 of the hacking magazine [SET](http://www.set-ezine.org/) (think of a Spanish Phrack), has a lengthy text file on TEMPEST with some interesting schematics. Check out the Spanish version [here](http://www.eskimo.com/~joelm/set21tempest.txt), or cut and paste interesting bits into  Babelfish for translation [here](http://babelfish.altavista.com/) (any readers more fluent in Spanish than I are encouraged to submit a decent translation).\
   
- November 8, 1999 - New Scientist has a short [TEMPEST article](http://www.newscientist.com/ns/19991106/newsstory6.html), where Markus Kuhn predicts intercept devices for under 1000 within the next five years (and although not TEMPEST specific, an [interview](http://www.newscientist.com/ns/19991106/confidenti.html) with Ross Anderson included). Slashdot also has a [thread](http://slashdot.org/yro/99/11/08/093250.shtml) going regarding the article.

#### <span id="Patents"></span>Patents

A quick search of IBM's patent server service revealed several interesting patents:

- Patent number [4965606](http://patent.womplex.ibm.com/details?patent_number=4965606) - Antenna shroud tempest armor (1989)
- Patent number [5165098](http://patent.womplex.ibm.com/details?patent_number=5165098) - System for protecting digital equipment against remote access (1992)
- Patent number [4932057](http://patent.womplex.ibm.com/details?patent_number=4932057) - Parallel transmission to mask data radiation (1990)
- Patent number [5297201](http://patent.womplex.ibm.com/details?patent_number=5297201) - System for preventing remote detection of computer data from tempest signal emissions (1994)
- Patent number [5341423](http://patent.womplex.ibm.com/details?&pn=US05341423__) - Masked data transmission system (1994)

A note about patent 5297201. It references patent 2476337 that was issued July 1, 1949. Unfortunately, the details aren't available online, but the reference may be telling as to just how long emanation monitoring has been taking place.

#### <span id="Paper Sources"></span>Paper Sources

- "Cabinets for Electromagnetic Interference/Radio-Frequency Interference and TEMPEST Shielding" by Kenneth F. Gazarek, Data Processing & Communications Security, Volume 9, No. 6 \[1985\].

<!-- -->

- Information Warfare, Winn Schwartau, Thunder's Moth Press, New York, 1996 (second edition)

> Chapter 7, The World of Mr. van Eck, is devoted to TEMPEST-related topics. There's some good information, but it's painted pretty broadly, and really doesn't get into technical details (the second edition does present much more material on HERF guns and other topics, but nothing has been added to the van Eck chapter). Still, a good read, also some additional sources not mentioned on this page in the Footnotes section.

- [Computer Security Basics](http://www.ora.com/catalog/csb/), (**X**) Deborah Russell and G. T. Gangemi Sr., O'Reilly & Associates, Sebastpol, CA, 1991. Chapter 10, TEMPEST, provides an excellent overview of the risks of emanations as well as the government TEMPEST program. This is a must read.

<!-- -->

- I don't have a citation, but in 1997 the German computer magazine c't apparently published an article that described a home-built TEMPEST monitor.  It consisted of an old Russian television (because it wasn't limited to receiving certain channels - stepless frequency tuning) and a piece of copper for the antenna.  The testers couldn't target invidual computers though, and received images from a variety of screens when cruising through a neighborhood.  Anyone that has access to an original copy of the article, please contact me.

------------------------------------------------------------------------

<span id="EMSEC"></span>

EMSEC Those in the know no longer generically use the term TEMPEST to refer to emanations secruity.  The current buzzword d'jour is EMSEC, or Emissions Security. If you read between the lines, the change to the term EMSEC is interesting. A quote from an [Air Force site](http://tto.wpafb.af.mil/organizations/HQ-AFMC/SC/cso-scs/scss/emsec.htm)(**O**)[:](http://tto.wpafb.af.mil/organizations/HQ-AFMC/SC/cso-scs/scss/emsec.htm)

> "Emission Security (EMSEC) better known as TEMPEST has taken a drastic change over the past few years. These changes have necessitated a complete revision of rules and regulations, causing the need for new publications. While these new publications have been drafted and are in the coordination stages, we must continue to keep informed and up-to-date on EMSEC policy and procedures."

Hmmm. Just what drastic changes are we talking about?  Idle speculation might include:

- Budget cuts and [directives](http://www.bolling.af.mil/comm/adpe/AFI/mad.htm#28) have cut back on TEMPEST use forcing new policies.
- Other types of emissions have been discovered that pose a security threat.

From the same site comes this quote:

> "WHAT IS COMPROMISING EMISSIONS (sic)? Compromising emissions are unintentional intelligence-bearing signals which, if intercepted and analyzed, disclose the classified information transmitted, received, handled, or otherwise processed by any information processing equipment."

It's curious that the term "electromagnetic radiation" isn't used in the definition.  So, there are other monitoring vulnerabilities besides TEMPEST.  Which leads us to HIJACK and NONSTOP.

------------------------------------------------------------------------

### <span id="HIJACK"></span>HIJACK and NONSTOP

In my quest for open-source material regarding TEMPEST, I've started to run into two new codewords, HIJACK and NONSTOP. At first there was only some sketchy information:

- References to NONSTOP and HIJACK testing is starting to appear in outlines for TEMPEST training courses (with a reference to NACSEM 5112).  Secret clearances are required for attending the classes.  A Department of Defense [course](http://204.222.127.50/Training/DMET/ch2sb4.htm#one) description reads, "The course will train students in the operation of the Honeywell and HLDS test detection systems and in the fundamental requirements of NONSTOP/HIJACK testing."

<!-- -->

- An [Air Force training glossary](http://web4.pdc.aia.af.mil:8080/library/pubs/33/ai0203/@ebt-link;cd=2;td=3?target=%25N%13_782_START_RESTART_N%25)(**O**) lists the definitions of HIJACK and NONSTOP as classified.

<!-- -->

- Countermeasures are apparently being used against NONSTOP, with a [reference](http://www.jswg.org/chapter8.html) to NSTISSI 7001.

Then, thanks to [publicly available documents](http://www2.offutt.af.mil/wipo/emsec.html) I found on the Net, we now know a little bit more.  Although the documents had classified information excised, there were still enough tidbits to put together a speculative guess regarding what HIJACK and NONSTOP related to.

NONSTOP is a classified codeword that apparently relates to a form of compromising emanations, but involves the transmital of the signals from radio frequency devices (handheld radio, cell phone, pager, alarm system, cordless phone, wireless network - AM/FM commercial broadcast receivers are excluded) in proximity to a device containing secure information. There are specific guidelines for either turning the RF device off, or keeping it a certain distance away from the secure device (PC, printer, etc.).

HIJACK is a classified codeword that apparently relates to a form of compromising emanations, but involves digital versus electromagnetic signals. An attack is similar in nature to a TEMPEST attack, where the adversary doesn't need to be close to the device that's being compromised. It does require access to communication lines (these can be wire or wireless).  The adversary uses antennas, receivers, a display device, a recording device, and one additional piece of equipment (a special detection system that is supposedly very sensitive and very expensive; and there are not very many of them in existence - sorry, I don't have any other details).  Also, the technician using this special equipment will supposedly require a great deal of training and experience.

Remember, the above is speculation.  And whether the guesses are accurate or not, at this point you'd need to have a security clearance to know for sure.\

------------------------------------------------------------------------

### <span id="Monitoring Devices"></span>Monitoring Devices

John Williams (Consumertronics, P.O. Box 23097, Albuquerque, NM 87192) sells the Williams Van Eck System, an off the shelf emanation monitoring device. He also has a [demonstration video](http://www.tsc-global.com/hacking.html) and and a [book called "Beyond Van Eck Phreaking](http://www.tsc-global.com/hacking.html)." The updated [Consumertronics](http://www.tsc-global.com/) Web site has a variety of interesting products (the \$3 paper catalog is a good read too). In past written correspondence with Mr. Williams, he has provided a considerable amount of technical details about his products.

Ian Murphy, CEO of IAM/Secure Data System wrote a very [interesting paper](http://www.ravenswoodinc.com/captwhos.htm) on TEMPEST, including a Radio Shack parts list for building a receiver.

*I'm currently looking for first hand, real-world accounts of a monitoring device actually being used to gather intelligence (not in a demonstration). PGP-encrypted e-mail through anonymous remailers or nym servers perferred.*

**Legal News -** November 15, 1999 - I just received an [e-mail](http://www.eskimo.com/~joelm/legal.html) from a [Terrance L. Kawles, Esq.](mailto:tkawles@codexdatasystems.com) who is representing Frank Jones of Codex and DataScan fame.  Mr. Kawles takes exception to a note I recently added to this page that states some people question Mr. Jones' credibility.  Mr. Kawles feels there is some type of smear campaign going on against his client by persons unknown, and is in the process of filing an [action](http://www.eskimo.com/~joelm/CodexOSC_conformed.htm) against various parties.  In the note I suggested that interested readers check [USENET](http://www.deja.com/usenet) archives and decide for themselves about Mr. Jones (over the years there has been a lively discussion on Mr. Jones, both pro and con). Mr. Kawles feels this note is defamatory, and offers me two options: "**...*either remove the Note, or remove your references and links to the Mr. Jones and Codex.***"

I'm going to indulge Mr. Kawles and remove all links and information regarding Mr. Jones and his TEMPEST products from this section.  Not because I'm caving in to the demands of some lawyer (my legal counsel states I have not published any defamatory statements regarding Mr. Jones).  But mostly because anyone that resorts to these kinds of tactics on the Net, really doesn't deserve to be mentioned in this site, which is devoted to public disclosure.

And Mr. Kawles, in regard to your statement, "*As I understand, Mr. Jones was instrumental in providing information when you began your studies of TEMPEST, yet you reward him with this unnecessary editorial comment.*"  Ha!  I'd love to see you substantiate that by providing any logs of communications between Mr. Jones and myself.

**Update** - See an interesting [Forbes online article](http://www.forbes.com/tool/html/00/aug/0810/mu9.htm) that appeared August 10, 2000.

------------------------------------------------------------------------

### <span id="Do It Yourself Shielding"></span>Do It Yourself Shielding Sources

After you've read Grady's paper...

If you're handy with a soldering iron, Nelson Publishing produces something called the [EMI/RFI Buyers' Guide](http://www.nelsonpub.com/ee/buyguides/emibuyg.htm). This is a comprehensive list of sources for shielding material, ferrites, and other radio frequency interference and electromagnetic interference type products. There's even listings for TEMPEST products and consultants. Unfortunately, most of the sources don't have links. But company names, addresses, and phone/FAX numbers are supplied.

A more general electronics manufacturer data base is [electroBase](http://www.electrobase.com/). They have over 7,800 manufacturers of all types listed.

There's an interesting product called Datastop Security Glass, that's advertised as the only clear EMF/RFI protection glass on the market. It's free of metal mesh, so has excellent optical clarity. This is the same stuff the FAA uses in air traffic control towers. Contact [TEMPEST SECURITY SYSTEMS INC](mailto:abdn@flanet.com). for more details.

Just remember, effective emanation security begins with the physical environment. Unless you can shield the wiring (telephone lines, electrical wiring, network cables, etc.), all of the copper around your PC and in the walls isn't going to stop emanations from leaking to the outside world. In shielding, also remember that emanations can pass from one set of wires to another.

------------------------------------------------------------------------

last changed December 10, 2000\
Copyright 1996,1997, 1998, 1999, 2000 Joel McNamara

[back to main TEMPEST](http://www.eskimo.com/~joelm/tempest.html)\
