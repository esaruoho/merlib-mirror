---
title: "undefined behavior"
source_domain: amasci.com
source_path: ~scs/readings/undef.950321.html
order: 8017
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T17:15:39Z
extractor: site_to_paper.py (pandoc)
---

# undefined behavior

*Source page: `~scs/readings/undef.950321.html`*

\[This article was originally posted on March 21, 1995, in the midst of a thread on undefined behavior. I have edited the text slightly for this web page.\]

    Newsgroups: comp.lang.c
    From: scs@eskimo.com (Steve Summit)
    Subject: Re: Quick C test - whats the correct answer???
    Message-ID: <D5swGz.4Cv@eskimo.com>
    Summary: why is undefined behavior undefined?
    References: <fjm.58.000B63C1@ti.com> <D5JLGy.A63@tigadmin.ml.com>
    Date: Tue, 21 Mar 1995 17:26:59 GMT

In article \<D5JLGy.A63@tigadmin.ml.com\>, Jim Frohnhofer (jimf@nottingham.ml.com) writes:

    > In article 000B63C1@ti.com, fjm@ti.com (Fred J. McCall) writes:
    >> That's right, and that's why you should listen to him (and to me, and to
    >> everyone else telling you this).  The REASON it is undefined is BECAUSE THE
    >> STANDARD SAYS SO.
    >
    > I may regret this, but I'll jump in anyway.  I accept that the behaviour
    > of such a construct is undefined simply because the Standard says so.  But
    > isn't it legitimate for me to ask why the Standard leaves it undefined?

It is, but you should probably be careful how you ask it. If you're not careful (you were careful, but most people aren't), it ends up sounding like you don't believe that something is undefined, or that you believe -- and your compiler happens to agree -- that it has a sensible meaning. But as long as we're very clear in our heads that we're asking the abstract, intellectual question "Why are these things undefined?", and not anything at all practical like "How will these things behave in practice?", we may proceed.

The first few answers I give won't be the ones you're looking for, but towards the end I may present one which you'll find more satisfying.

First of all, you might want to take a look at who's saying what. I'll grant that statements such as Fred's above can be annoying. I agree completely that it's usually very good to know the reasons behind things. But if the people who have been posting to comp.lang.c the longest, and who have been programming in C for the longest and with the most success, keep saying "it's undefined, it's undefined, quit worrying about why, just don't do it, it's undefined", they might have a good reason, even if they don't -- or can't -- say what is, and that might be a good enough reason for you, too.

I've been programming in C for, oh, 15 years now. For at least 10 of those years, I've been regarded as somewhat of an expert. For going on 5 of those years, I've been maintaining the comp.lang.c FAQ list. I am someone who is usually incapable of learning abstract facts unless I understand the reasons behind them. When I used to study for math tests, I wouldn't memorize formulas, I'd just make sure that I could rederive them if I needed them. Yet for most of the 15 years I've been programming in C, I simply could not have told you why `i=i++` is undefined. It's an ugly expression; it's meaningless to me; I don't know what it does; I don't want to know what it does; I'd never write it; I don't understand why anyone would write it; it's a mystery to me why anyone cares what it does; if I ever encountered it in code I was maintaining, I'd rewrite it. When I was learning C from K&R1 in 1980 or whenever it was, one of their nice little sentences, which they only say once, and which if you miss you're sunk, leaped up off the page and wrapped itself around my brain and has never let go:

> Naturally, it is necessary to know what things to avoid, but if you don't know *how* they are done on various machines, that innocence may help to protect you.

As it happens, it's possible to read K&R *too* carefully here: the discussion at the end of chapter 2 about `a[i] = i++` suggests that it's implementation-defined, and the word "unspecified" appears in K&R2, while ANSI says that the behavior is undefined. The sentence I've quoted above suggests not knowing how things are done on various machines, while in fact what we really want to know is that maybe they *can't* be done on various machines. Nevertheless, the message -- that a bit of innocence may do you good -- is in this case a good one.

That's my first answer. I realize that it's wholly unsatisfying to anyone who's still interested in this question. On to answer number two.

    > As far as I know, it was created by a committee not brought down by Moses
    > from the mountain top.  If I want to become a better C programmer, won't
    > it help me to know why the committee acted as it did.

Perhaps, but again, only if you're very careful.

Let's say you're wondering why `i++ * i++` is undefined. Someone explains that it's because no one felt like defining which order the side effects happen in. That's a nice answer: it's a bit incomplete and perhaps a bit incorrect, but it's certainly easy to understand, and since you insisted on an answer you could understand (as opposed to something inscrutable like "it's just undefined; don't do it"), it's the kind of answer you're likely to get.

So next week, you find yourself writing something like

        i = 7;
        printf("%d\n", i++ * i++);

and you say to yourself, "Whoah, that might be undefined. How did that explanation go again? It's undefined... because nobody felt like saying... which order the side effects happened in. So either the first `i` gets incremented first, and it's 7 times 8 is 56, or the second `i` gets incremented first, and it's 8 times 7 is 56. Hey! It may be undefined, but I get a predictable answer, so I can use the code after all!"

So in this case, knowing a reason why has not made you a better programmer, it has made you a worse programmer, because some day when you're not around to defend it (or when you are around, but you don't have time to debug it), that code is going to print 49, or maybe 42, or maybe "Floating point exception -- core dumped".

If, on the other hand, you didn't know why it was undefined, just that it was undefined, you would have instead written

        printf("%d\n", i * (i+1));
        i += 2;

(or whatever it was that you meant), and your code would have been portable, robust, and well-defined.

Now, some of you may be thinking that

        printf("%d\n", i++ * i++);

is a ridiculous example which no one would ever write. That may be true, but it's the example I use in the FAQ list (and it's the oldest of the undefined-evaluation-order questions in the FAQ list) because it illustrates, I hope better than a "real" example would, the kind of contortions that people *do* get into when they start thinking too hard (but not too carefully) about undefined expressions. There was an actual question posted to comp.lang.c years ago (which I could probably find in my archives if I looked hard enough) in which the poster used essentially the same argument: "the evaluation order may be undefined, but no matter which order the compiler picks, I'll get the answer I want", and that was the inspiration for the `i++ * i++` question ([4.2](http://www.eskimo.com/~scs/C-faq/q4.2.html) on the current list). (Remember, it's not the evaluation order that's undefined, it's the entire expression that's undefined.)

Two paragraphs back, I suggested that the programmer who did not know why something was undefined might have been better off than the programmer who did. I am not stating (not in the current climate, anyway) that you should not know why things are undefined. But if you insist on knowing, you are going to have to get the full story, not just some simplistic justifications. And you are going to have to be excruciatingly careful that you don't use your knowledge of why something is undefined to try to second-guess how a certain undefined construct (which you've decided you simply have to use in your program) is going to behave. Undefined behavior is slippery stuff: it really, truly is undefined; it really, truly can do anything at all; yet some people (particularly those who are always clamoring to know *why* things are undefined) are always trying to salvage some remnants of definedness out of an undefined situation, and are always getting themselves in trouble, and end up convincing the people who have to come along and pick up the mess that yes, it really was a mistake trying to explain why it was undefined, and we probably should have just said it was undefined because we said it was, after all.

This has been answer number two, and I realize it's still not satisfying, because I'm still suggesting that maybe you don't want to know why.

For answer number three, I'll quit beating around the bush and try to explain why, although I have to admit that, for me, the answers from here on are going to get less satisfying, and less nicely worded, because we get down into some realms that I don't usually think about (because I really have taken to heart K&R's advice about maintaining some innocence).

An international Standard like X3.159/ISO-9899 is a tremendously difficult document to write, even for a relatively simple programming language like C. When a Standard says something, it must say it definitively and unambiguously. (When it is inaccurate, it must be definitively inaccurate, and when it contains any areas of doubt or uncertainty, they must be rigidly defined areas of doubt or uncertainty.) The Standard must withstand intense scrutiny, for many years, from all sorts of observers, including language lawyers, professional nitpickers, grudging ex-users of other languages, semicompetent implementors of spiffola new compilers for scruffola old computers, and xenophobic adherents of other sociopolitical systems. (If you think that abstract constructions like programming languages are inherently removed from sociopolitical concerns, you haven't followed the crafting of any international Standards.)

Since it's so hard to specify things precisely enough for a Standard like this, the wise Standard-writer (especially for a Standard that hews to existing practice) won't specify anything more than is necessary. Features that everyone will use (or that someone might be reasonably expected to use) must be specified precisely, but features that no sane person could be expected to use in 6,000 years might be relegated to the dustbin, instead. (Naturally, since we're being precise, we'll have to precisely define the boundaries of the parts we've decided to be imprecise about; the paraphrase above of Vroomfondel's demand from The Hitchhiker's Guide to the Galaxy is not facetious.)

In practice, you can only tell what a computer program has done when it causes a side effect. In a nutshell, then, what a Standard for a programming language does is to define the mapping between the programs you write and the side effects they produce. Consequently, we are very concerned with side effects: how they're expressed in our programs, and how the Standard defines them to behave.

The fragment

        int i;
        i = 7;
        printf("%d\n", i);

contains two obvious side effects, and it is blatantly obvious what their effect should be, and what the Standard says agrees with what you think they should do.

The fragment

        int a[10] = {0}, i = 1;
        i = i++;
        a[i] = i++;
        printf("%d %d %d %d\n", i, a[1], a[2], a[3]);

contains a few more side effects, but (I assert) it is *not* obvious how they should behave. What does the second line do? In the third line, do we decide which cell of `a[]` we assign to before or after we increment `i` again? Plenty of people can probably come up with plenty of opinions of how this fragment ought to work, but they probably won't all agree with each other, as the situation is not nearly so clear-cut.

Furthermore, a Standard obviously cannot talk about individual program fragments like `i = i++` and `a[i] = i++`, because there are an infinite number of those. It must make general prescriptions about how the various primitive elements of the language behave, which we then use in combination to determine how real programs behave. If you think you know what `a[i] = i++` should do, you can't just say that; instead you have to come up with a general statement which says how *all* expressions which modify and then use the same object should act, and you have to convince yourself that this rule is appropriate not only for the `a[i] = i++` case you thought about but also for all the other expressions (infinitely many of them, remember) that you did *not* think about, *and* you have to convince a bunch of other people of your conviction.

The people writing the C Standard decided that they could not do that. Instead, they decided that expressions such as `a[i] = i++` and `i++ * i++` and `i = i++` would be undefined. They decided this because these expressions are too hard to define and too stupid to be worth defining. They came up with some definitions (no small feat in itself) of which expressions this undefinedness applies to. You've seen these definitions; they're the ones that say

> Between the previous and next sequence point an object shall have its stored value modified at most once by the evaluation of an expression. Furthermore, the prior value shall be accessed only to determine the value to be stored.

Now, I'll grant that these definitions are at least as hard to understand as expressions such as `a[i] = i++`. But there are plenty of more complicated expressions which we can't begin to make sense of (or even decide if they make any sense) without these definitions. Perhaps I'll say more about them later, but for the moment we're still trying to answer the question of why some things (such as the expressions not defined by the two definitions quoted above) are undefined, and my opinion is, as I stated above: because they're too hard to define, and too stupid to be worth defining. (If you're still counting, call this answer number three.)

Now, you may think that I'm being overly pessimistic. You may think that it's easy to define what `a[i] = i++` or `i++ * i++` or `i = i++` should do. Perhaps you think they should be evaluated in exactly the order suggested by precedence and associativity. Perhaps you think that `i++` should increment `i` immediately after giving up `i`'s value and before evaluating any of the rest of the expression. (These rules would say that the incremented value of `i` is used to decide which cell of `a[]` to assign to, and that the left-hand `i++` in `i++ * i++` happens first, and that `i = i++` ends up -- here's a surprise -- being exactly equivalent to `i = i`, unless perhaps if `i` is volatile.) But -- and you're going to have to take my word for it here, because I'm taking other people's word for it -- these hypothetical "well-defined" expression rules, though they're easy enough to state and probably precise enough and probably comprehensive for the cases we're interested in, would result in significantly poorer performance than pre-ANSI C traditionally had and that we're used to. Optimizing compilers would have to generate code which evaluated expressions in little itsy bitsy steps, in lockstep with the precedence- and associativity-based parse. They would not be able to rearrange parts of the expression to make the best use of the target machine's instruction repertoire or available registers or pipelining or parallelization or whatnot.

When people talk about why it's good that an expression like `i++ * i++` is undefined, they usually speak of modern, parallel machines which might get really confused if they try to do, not the left-hand `i++` first or the right-hand one first, but instead both at once somehow. Instead of that example, let's imagine a very simple CPU, analogous to a four-function calculator with some memory registers. Let's play compiler, and imagine what buttons on the calculator we'll push, operating under the "well-defined" rules of the previous paragraph.

Since the (hypothetical) "well-defined" rules tell us exactly which order to evaluate the expression in, our task is straightforward. First, the left-hand side of the multiplication operator: the value we want to multiply is `i`'s previous value. Whoops, before we can think about doing the multiplication, the rules say we have to do the increment. Whoops, once we do the increment, we'll have lost the previous value. So we recall from `i`, store the value in a temporary register, add one to to the value, and store it back in `i`. Now we can recall from the temporary, and do the multiplication... no. Because first we have to do the same thing on the right-hand side: recall from `i`, store it in a second temporary, add one to it, and store it back in `i`. Now, finally, we can recall the two values from the two temporaries and do the multiplication.

If we remove the (still hypothetical, just for the purposes of this article, not part of Standard C) "well-defined" rules, and revert to ANSI's rules, under which we only have to make sure that the increments to `i` happen sometime before the next sequence point, look how much easier things become: Recall from `i`. Make a note to increment its value later. Multiply it by: recall from `i` again, make a note to increment it later. Now we've got the product, do whatever we have to with it. We've still got these two notes to increment `i`, so handle them, and we're done.

I'd never actually gone through the analysis in this level of detail until just now, but this is exactly how the example

        int i = 7;
        printf("%d\n", i++ * i++);

from [question 4.2](http://www.eskimo.com/~scs/C-faq/q4.2.html) of the FAQ list could print 49 instead of 56. (No, I'm not going to come up with a scenario under which it could print 42.)

So, if you're still with me (and after 300 lines, I can see how you might not be, but if you're one of the people who's been insisting on a reason why, you better be `:-)` ), here is my fourth, last answer: these things are undefined because if you made them defined, compilers would have to be paranoid and generate lockstep code which would be bulkier or slower or both.

Having come this far, I have to repeat that this last answer isn't one I'm particularly pleased with, partly because I'm not a code generation expert, and partly because I don't usually worry about efficiency very much. (On the other hand, it doesn't matter whether I'm pleased with it, or whether you're pleased with it either; it *is* one of the reasons.) You're probably also still harboring some doubts; you may be thinking that a compiler would only have to use the slow, bulky, lockstep code for expressions with multiple side effects, which many people (even some of the Doubting Thomases) agree that we shouldn't be writing anyway. Perhaps you're right. Perhaps we could have our cake and eat it too; perhaps we could have blazingly efficient code generated for polite little expressions and still have defined behavior for rogue ones. Perhaps we could, but not under the current Standard: it still *does* say that the rogue expressions are undefined. But the C Standard is under revision: perhaps, if this is important enough to you, you can convince the committee to pronounce defined behavior upon the rogue expressions, too. Good luck.

[Steve Summit](http://www.eskimo.com/~scs/)\
<scs@eskimo.com>
