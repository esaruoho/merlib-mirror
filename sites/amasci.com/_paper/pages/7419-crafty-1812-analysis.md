---
title: "Crafty 18.12 analysis"
source_domain: amasci.com
source_path: ~rwb/chess/kvw-crafty.html
order: 7419
reachable_from_entry: false
images: 1
internal_links: 0
extracted: 2026-08-07T17:14:59Z
extractor: site_to_paper.py (pandoc)
---

# Crafty 18.12 analysis

*Source page: `~rwb/chess/kvw-crafty.html`*

The settings were hash=24M, hashp=10M. The computers used were dual Pentium III 800Mhz computers, and the software was Crafty 18.12.

The experiment shows that computers still don't play the best moves; see the commentary below.\

## Move 15

**(3) 19 20115:48 0.34 15. ... e6 16. Be3 Ra8 17. a3 Nd5 18. Nxd5 Qxd5 19. Qe2 Qb3 20. Rab1 Ke8 21. Rfd1 d5 22. Rd3 Qc4 23. Qd1 Kf8 24. Bxb6 Kg8 25. Rc1**

15...e6 was not suggested by any analyst at the time of the game. After the game it was suggested in the SmartChess Online [analysis.](http://www.smartchess.com/SmartChessOnline/SmartChessOnline/archive/MSNKasparov/page04.htm)

Interestingly, Krush and Georgiev (2001) and van Wely (2000) all played 15...b5. Other games from 2000 and 2001, as mentioned on the commentary page, continued 15...e6.\

## Move 16

**(3) 20 11707:55 0.03 16. ... Ke8 17. Be3 Kf8 18. Bxb6 Qb4 19. Be3 Qxb2 20. Bd2 Qb6 21. Rb1 Qc7 22. Bg5 Qd7 23. Re1 Kg8 24. Qf3 h6 25. Bd2**

16...Ke8 was examined by Krush but she recommended 16...Ne4 instead. The SmartChess Online [analysis](http://www.smartchess.com/SmartChessOnline/SmartChessOnline/archive/MSNKasparov/page05.htm) suggested meeting 16...Ke8 by 17.Re1, as did [the GM Chess School.](http://www.gmchess.spb.ru/english/kasworld/sici28.html)\

## Move 18

**(3) 20 10167:59 0.00 18. ... e6 19. Qxb6 Nd4 20. Kh1 Qc6 21. Qxc6+ Nxc6 22. Ra3 d5 23. Rf3 Ne5 24. Rb3 Ke8 25. Rxb7 Rxa4 26. Bg5 Nd3 27. b3 Ra2 28. Rb8+ Kd7 29. Rb7+ Ke8**

18...e6 was Danny King's recommendation. Krush said that White will stand better with\
"22...c5 23.Bd2 Nc2 24.Rf3 Ke8 25.b3 Nd4 26.Rd3 Rb8 27.Bc3! and White has an advantage; "\
Still, it's impressive that crafty saw the next three moves in the PV. 18...e6 is not mentioned in Smartchess's post-game analysis, but we discussed it a lot at the time.\

## Move 19

**(4) 19-\> 22740:33 0.47 19. ... Be5 20. Rac1 Rxa4 21. Bd2 Rd4 22. Bc3 Rc4 23. Rce1 Qd5 24. Qxb6 Nd4 25. Bxd4 Bxd4 26. Qb3 Ke8 27. Re2 Kf8 28. Rfe1 e5 29. Qg3**

19...Be5 was recommended by the Computer Chess Team and "IM2429" but not by any analysts.\

## Move 26

**(3) 21 20876:03 0.45 26. ... Bc5 27. Qd1 Ne5 28. Re1 Bxf2+ 29. Kxf2 Nd3+ 30. Kf1 Qxe1+ 31. Qxe1 Nxe1 32. Kxe1 e5 33. Kd2 Ke6 34. h4 d5 35. Bd8 b5 36. h5 Kf7 37. h6 Kg6 38. Bg5 Kh7 39. Kd3**

Kasparov preferred 26... f4 and recommended 27. Qd1 after 26... Bc5. Krush preferred 27. Qb1 on 26... Bc5 but Kasparov did not think this was as good as 27. Qd1. The GM School looked only at 27. Be3 and 27. h4.\
The problem with the computer's PV is that the endgame after white's move 32 is winning for White, though even after 23 ply and 1536M of hash, Crafty still can't see the win for White.\

## Move 33

**(3) 23 20760:55 0.43 33. ... b4 34. Bf4 Bd4+ 35. Kh1 b3 36. g4 Kd5 37. g5 e5 38. Bc1 b2 39. Bxb2 Bxb2 40. h6 Ne7 41. Rf6 e4 42. h7 Bxf6 43. gxf6 Ng6 44. f7 e3 45. h8=Q Nxh8 46. f8=Q**

Obviously 33... b4 should lead to a draw. In the PV, as in the game, 37... e5 is incorrect but 37... e6 draws.

<a href="http://www.nedstatbasic.net/stats?ACoRvQhRR3Fb7ijdQ1kZYR0bllFA" target="_blank"><img src="http://m1.nedstatbasic.net/n?id=ACoRvQhRR3Fb7ijdQ1kZYR0bllFA" data-border="0" width="18" height="18" alt="Nedstat Basic - Free web site statistics Personal homepage website counter" /></a>\
<a href="http://www.nedstatbasic.net/" target="_blank">Free counter</a>
