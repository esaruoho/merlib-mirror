---
title: "undefined behavior"
source_domain: amasci.com
source_path: ~scs/readings/precvsooe.960728.html
order: 8012
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T17:15:38Z
extractor: site_to_paper.py (pandoc)
---

# undefined behavior

*Source page: `~scs/readings/precvsooe.960728.html`*

\[This article was originally posted on July 28, 1996, in the midst of a thread on precedence and order of evaluation. I have edited the text slightly for this web page.\]

    Newsgroups: comp.lang.c
    From: scs@eskimo.com (Steve Summit)
    Subject: Re: precedence vs. order of evaluation
    Message-ID: <Dv9v5H.EGu@eskimo.com>
    X-scs-References: <199607252021.NAA15633@mail.eskimo.com>
    References: <01bb798a$11913f80$87ee6fce@timpent.airshields.com> <1996Jul25.1157.scs.0001@eskimo.com> <kluev-2607962112500001@kluev.macsimum.gamma.ru>
    Date: Sun, 28 Jul 1996 21:17:40 GMT

In article \<kluev-2607962112500001@kluev.macsimum.gamma.ru\>, kluev@macsimum.gamma.ru (Michael Kluev) writes:

    > I do not get one thing: Why there is so fundamental difference
    > between the statements and expressions? Why the evaluation order of
    > sub-expressions is undefined while the evaluation order of statements
    > within the statement sequence is defined?

I always have a hard time with questions like these. Sometimes, they hardly make sense: after all, the language is what it is, and we simply have to...

    > Sure, I know the answer: "this is C standard" or "this is how
    > language is defined", but I'm not looking for such an answer.

Oh. Then I guess I'm not allowed to use that answer, then.

    > What I am looking for is the answer of the following question:
    > "Why the language was defined such a way".

The usual answer is that it's to avoid unnecessarily constraining the compiler's ability to...

    > If your answer is a form of: "This way compilers could do the better
    > job of optimising expressions", then remember, that compiler must
    > optimise not only expressions, but statements also.

Oh. So I guess I'm not allowed to use that answer, either. (Now it seems as if you're really constraining *me*!) So I'm afraid the only truly factual answer I'm left with is "I don't know."

I posted a long article a year or two ago exploring some reasons why C might leave certain aspects of evaluation order undefined. I'd re-post it now, but it would take me too long to find it in my magtape archives, and anyway the oxide is starting to flake off (I'm not sure if it's the fault of the drive or the tapes), and I'm thinking that the next time I spin those tapes should really be to transfer them to some new media, which I haven't selected yet. \[I did eventually recover [a copy](undef.950321.html).\]

Instead, I'll explore a couple of different reasons. Bear in mind that these are only my own speculations, so they absolutely will not answer your question. If you simply must know why C *is* defined the way it is on this point, you'll have to ask Dennis Ritchie. The speculations I'll give you are some of the ones which might now lead me to design a language the same way, but I freely admit that my thinking on language design has been *very* heavily influenced by C, which I somehow find pretty congenial and easy to get along with.

A language specification is a huge set of tradeoffs. No, don't worry, I won't talk about the forbidden tradeoff between the programmer's freedom of expression and the compiler's license to optimize. The tradeoff I'm invoking now is one of documentation: how much time and how many words can we afford to spend defining the language? As in so many other areas, the law of diminishing returns sets in here, too. We have to ask ourselves whether an attempt to nail down some aspect of the language more tightly is worth it in terms of the number of programs (or programmers) that absolutely need the extra precision.

A language specification (like any detailed specification of a complex system) is also staggeringly difficult to write. The harder you try, the more questions you end up inviting from devious folk who take your previous round of ever-more-detailed specifications as a grand puzzle, the challenge being to find some loophole or ambiguous case or fascinating question which remains unanswerable in the system as constructed.

Therefore, the standard makes certain simplifications. It makes these not just to make compilers easier to write, not just to make the standard easier to write, but to make it easier for the rest of us to *read*, to wrap our brains around it and understand it. The more exceptions it contains, or overly complex explanations of overly complex devices inserted just to placate the nitpickers and puzzlemongers, the more likely it is to be unreadable by mere morals, or unimplementable by mere mortals, and so ultimately to fail.

A largely forgotten aspect of the "Unix philosophy," and an aspect which like many others is equally responsible for the design of C as Unix, and an aspect which is responsible both for the success of the operating system and the language *and* for the heaping truckloads of acrimonious criticism which both incessantly receive, is that neither system was ever intended to satisfy everybody. The designers were shooting for about a 90% solution, and were unapologetically willing to call that "good enough." They knew, if they tried to satisfy everybody, that the first 90% of the requirements would take 90% of their time, and that 9% of the remaining requirements would take the other 90% of their time, and that 0.9% of the remaining requirements would take *another* 90% of their time, and so on [\[footnote 1\]](#footnote1). Discretion being the better part of valor, they decided -- with remarkable restraint, which I for one could never manage -- to nip that infinite regression in the bud. And in one of X3J11's admirable successes at preserving the "spirit of C," that minimalist attitude largely pervades the C standard, as well.

Returning to the subject of expression evaluation, the simplification of interest to us here is, in a nutshell, that how you specify the order that things happen in is with *statements*, and how you compute values where the order doesn't matter much is with *expressions*. If you care about the order, you need separate statements. (There were always a few exceptions to this simplistic rule, of course; ANSI added a few more). The modern, more precise statement is that if you need to be sure that side effects have taken effect, you need to have a sequence point, but to keep everybody's life simple, there are still relatively few defined sequence points. If you have a complex expression with complicated sequencing requirements, you may simply have to break it up into several statements, and maybe use a temporary variable. That was true in K&R (I've already quoted the relevant sentences from section 2.12), and it's true today. It's a simple rule to state, it's a simple rule to implement, and at least 90% of expressions (and in fact far more, probably closer to 99.9%) can in fact be written as single, simple expressions, because they *are* simple and *don't* have complicated sequencing requirements.

I honestly believe that the existing rules are good enough, and that the excruciating discussions which we have about the issue here from time to time tend to overstate its importance. I probably break an expression up into two statements to keep its sequence correct about twice a year [\[footnote 2\]](#footnote2). The vast majority of the time, you don't have to worry about the order of multiple side effects (most of the time, because there aren't multiple side effects), and when you do, I claim (though I realize how patronizing this sounds to the people I most wish would think about it) that the expression is probably too complicated and that it should be probably be simplified if for no other reason than so that people could understand it, and incidentally so that it would be well-defined to the compiler.

In closing, let me offer another way of thinking about order of evaluation, which I came up with a day or two ago and refined during a brief e-mail exchange with James Robinson. As I mentioned, compilers tend to build parse trees, and precedence has some influence on the shape of parse trees which has some influence on the order of evaluation. What's a good way of thinking about the ways in which the shape of a parse tree does and doesn't necessarily affect order of evaluation?

If it weren't for side effects -- assignment operators, `++`, `--`, function calls, and (for those of you writing device drivers) fetches from volatile locations -- [\[footnote 3\]](#footnote3), the entire meaning of a parse tree would be the computation of a single value. Each node computes a new value from the values of its children, so values percolate up the tree. We have to begin evaluation at the bottom, of course, and we can therefore say that there's some ordering of the evaluation from bottom to top, but we don't care about the relative ordering of parallel branches of the tree; in fact for all we care they could be evaluated in parallel. The reason we don't care is precisely that (for the moment) we are thinking about pure expression evaluation, without side effects.

If, as I claim here, the primary purpose of a parse tree is to generate the single value that pops out of the top of it, then a good way to think about an expression (which is the basis for a parse tree) is that its primary purpose is to generate a single value, too. We should think about side effects as in some sense secondary, because it turns out that the Standard (and, hence, the compiler) accords them a good deal less respect, at least with respect to their scheduling. We should imagine that the compiler goes about the business of evaluating an expression by working its way through the parse tree, applying no more ordering constraints than the blatantly obvious one that you can't (in general) evaluate a node until you've evaluated its children. We should imagine that, whenever the compiler encounters a node within the tree mandating a side effect, which would require it to store some value in some location, it makes a little note to itself: "I must remember to write that value to that location, sometime", and then goes back to its true love, which is evaluating away on that parse tree. Finally, we should imagine that when the compiler reaches a point which the Standard labels as a sequence point, the compiler says to itself: "Oh, well, I guess I can't play all day, now I'll have to get down to business and attack that \`to do' list."

Of course, I'm not saying that you *have* to think about the situation in this way. But if you're looking for a model which will let you think about expression evaluation in a way that matches the Standard's, I think this is a pretty good one. Even though we only evaluate expressions for their side effects (that is, the statement

        i + 1;

does nothing), the right way to think about expression evaluation is that we are, after all, *evaluating* an *expression*, or figuring out what its value is. Its *one* value, singular. The only ordering dependencies are those which must apply in order to ensure that we compute the correct value. If there are any intermediate values that we care about, because we expect them to be stashed away via side effects, we must not care what order they occur in. Therefore, if there are multiple side effects, all of them had better write to different locations. Also (again because we can't be sure when they'll happen) none of them had better write to locations which we might later try to read from within the same expression.

This may have seemed like a roundabout set of explanations, and I'm sure it's still unsatisfying to those who insist on knowing *why* C is as it is. To summarize the arguments I've tried to present here, C specifies expression evaluation as it does because it's simple and good enough for most purposes while still allowing (taboo answer alert!) for decently optimized code generation, and it does not provide more guarantees about expression evaluation because few expressions would need them.

[Steve Summit](http://www.eskimo.com/~scs/)\
<scs@eskimo.com>

<span id="footnote1">Footnote 1. Melanie has dubbed this "Zeno's 90/90 rule."</span>

<span id="footnote2">Footnote 2. The number of times I've had to break expressions up into separate statements decreased by about 2/3 when I realized that the compiler does *not* have (and has probably never had) license to rearrange</span>

        int i, isc, fac1, fac2;
        ...
        isc = (long)i * fac1 / fac2;

which at one time I wrote as

        long tmp = (long)i * fac1;
        isc = tmp / fac2;

because I was worried about underflow in case the compiler evaluated it as `(long)i / fac2 * fac1` .

Footnote 3. I apologize for the two entirely different uses of -- in this sentence.
