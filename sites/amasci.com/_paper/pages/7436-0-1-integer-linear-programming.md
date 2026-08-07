---
title: "0-1 Integer Linear Programming"
source_domain: amasci.com
source_path: ~rwb/misc/01ilp.html
order: 7436
reachable_from_entry: false
images: 1
internal_links: 1
extracted: 2026-08-07T17:14:59Z
extractor: site_to_paper.py (pandoc)
---

# 0-1 Integer Linear Programming

*Source page: `~rwb/misc/01ilp.html`*

Richard Bean, [contact me](contact.html)\

I use 0-1 Integer Linear Programming extensively in my combinatorics research. However the [Linear Programming FAQ](http://www-unix.mcs.anl.gov/otc/Guide/faq/) is out of date, and doesn't list all the software available.

Typically the models I use have a very high degree of symmetry, and solve set-covering problems or slight generalisations of such problems. [Francois Margot](http://web.gsia.cmu.edu/fmargot/index.html) works on these kind of problems.

These are the programs I've been using.

### Tested

- [WSAT](http://www.ps.uni-sb.de/~walser/wsatpb/wsatpb.html) This is excellent at finding the best solutions quickly, but it cannot prove maximum or mimimum bounds. A Linux version which works until December 2003 is available (January 13,2003). January 9, 2004 - now you have to email the author. I used it in the [critical sets for elementary abelian 2- and 3-groups paper.](../papers/ae23.pdf)
- [CPLEX](http://www.cplex.com) with [AMPL](http://www.ampl.com) where the demo version of CPLEX 8 is. This is apparently the industry standard for linear programming. It has a good output format providing upper and lower bounds, and many options for guiding the search. It doesn't find the best solutions quickly, but is excellent at proving bounds - you can take the WSAT answer and put it into CPLEX. Even the academic version is at least [\$US995](http://www.ilog.com/partners/academic/pricelist_us.cfm) - this is only affordable by large companies or Western universities. I used CPLEX 8 in my [smallest critical set](../papers/scs8.pdf) paper and in the [critical sets for elementary abelian 2- and 3-groups paper.](../papers/ae23.pdf) But BonsaiG, GLPK, and Sbb are all so good, I could have coped without it. Of course, ILOG claims that ILP has wonderfully improved between CPLEX 8 and CPLEX 9, but with the death of the benchmark page below, who would know?
- [OPBDP](http://www.mpi-sb.mpg.de/units/ag2/software/opbdp/) This is sometimes better than CPLEX at finding good initial solutions and uses less memory. But it cannot find provably optimal solutions as well as CPLEX.
- [PBS](http://www.eecs.umich.edu/~faloul/) The papers about it claim great performance, but the results for the kind of problems I typically solve weren't good. Email the author for information.
- [BSOLO](http://sat.inesc.pt/bsolo/) Haven't used it much. Uses ["pbf format" files,](http://sat.inesc-id.pt/~jpms/scripts/) performance doesn't seem to be exceptional. No documentation. Use "+V0" to just have the bounds displayed, "+Tn" to set the maximum CPU time used to n seconds. It seems pretty flaky too.
- [lp_solve](ftp://ftp.es.ele.tue.nl/pub/lp_solve/) A standard LP solver, but not much good for integer programming.
- [OSL](http://www-3.ibm.com/software/data/bi/osl/index.html) IBM's Optimization Solutions and Library software. Free for research. Average performance. Whoever invented MPS format should be shot.
- [LINDO](http://www.lindo.com/) Got a demo version for Linux based on Lindo 6. It wasn't so good. Sent some sample programs to them for benchmarking with latest version, not so good either.
- [BonsaiG](http://www.cs.sfu.ca/~lou/BonsaiG/) GPL. I used it in my [smallest critical set](../papers/scs8.pdf) paper. On AMD processors, it performed better than CPLEX for this kind of problem.
- [GLPK](http://www.gnu.org/software/glpk/glpk.html) GPL. Could have used it in the scs paper too.
- [MOSEK](http://www.mosek.com) Had them send a time-limited demo version - wasn't so great.
- [MOMIP](http://www.iiasa.ac.at/~marek/soft/) Free. I can't remember if it was good, but see benchmark below.
- [COIN/Sbb](http://www.coin-or.org) The author of BonsaiG suggested I use this instead when I emailed him about the FORTRAN kludge in BonsaiG beoming crufty (it only works with gcc 2.95, not gcc 3.3). Haven't tested it lately.

### Commercial or untested or maybe not even for 0-1 ILP

- [XA](http://www.sunsetsoft.com/)
- [XPRESS](http://www.dashoptimization.com/)
- [ZOOM](http://www.ubmail.ubalt.edu/~jsinghal/)
- [MINOS](http://www.sbsi-sol-optimize.com/) (Not for ILP, I don't think!).
- [FortMP](http://www.optirisk-systems.com/)
- [MINTO](http://www.isye.gatech.edu/faculty/Martin_Savelsbergh/software/)
- [SOPT](http://www.saitech-inc.com/)
- [XLSOL](http://www.frontsys.com/amplprod.htm)
- [IPENUM](http://www.wisc.edu/mathsoft/m14.html) (link broken as at 2004-03-02)
- [OR Library](http://orlab.snu.ac.kr/software/or_prog/)
- [CSPLIB](http://ai.uwaterloo.ca/~vanbeek/software/software.html) when there's no objective function (another [CSPLib](http://www.4c.ucc.ie/~tw/csplib/links.html) link for constraint solvers)
- [BOB](http://www.prism.uvsq.fr/recherche/themes/ANCIENS/teams/optimize/softs/bob.en.html) branch-and-bound library, link doesn't work 2003-02-18
- [LPABO](http://orly1.snu.ac.kr/software/lpabo)
- [PCx](http://www.mcs.anl.gov/otc/Tools/PCx/)
- [HOPDM](http://www.maths.ed.ac.uk/~gondzio/software/hopdm.html)
- [BPMPD](http://www.sztaki.hu/~meszaros/bpmpd/)
- [KNITRO](http://www.ziena.com/knitro/kindex.htm)

\
Many of the above are available at [the NEOS server.](http://www-neos.mcs.anl.gov/) And more obscure software is at [NEOS Guide.](http://www-fp.mcs.anl.gov/otc/Guide/SoftwareGuide/Categories/intprog.html) There WAS a [Mixed Integer Linear Programming Benchmark.](http://plato.la.asu.edu/bench.html) (The author didn't just stop doing the benchmarks, he took down all the current ones. How unfriendly.)\
Also, according to [the PBS paper](http://www.eecs.umich.edu/~faloul/Papers/faloul_iccad02.pdf), it should be possible to rewrite any 0-1 ILP problem in (DIMACS) CNF format, which means SAT solvers such as [zChaff](http://ee.princeton.edu/~chaff/zchaff.php) could be used. However I haven't found software to do this or written any myself. In old versions of the Linear Programming FAQ, Bob Craig from Lucent is mentioned as having written software to do this, but I couldn't find a working email address.

<a href="http://www.nedstatbasic.net/stats?ACoRtAkq4z5GYWfD8R22V6Jt34pQ" target="_blank"><img src="http://m1.nedstatbasic.net/n?id=ACoRtAkq4z5GYWfD8R22V6Jt34pQ" data-border="0" width="18" height="18" alt="Nedstat Basic - Free web site statistics Personal homepage website counter" /></a>\
<a href="http://www.nedstatbasic.net/" target="_blank">Free counter</a>
