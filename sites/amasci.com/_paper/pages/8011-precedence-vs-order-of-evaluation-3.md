---
title: "precedence vs. order of evaluation, #3"
source_domain: amasci.com
source_path: ~scs/readings/precvsooe.960725.html
order: 8011
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T17:15:38Z
extractor: site_to_paper.py (pandoc)
---

# precedence vs. order of evaluation, #3

*Source page: `~scs/readings/precvsooe.960725.html`*

\[This article was originally posted on July 26, 1996, in the midst of a discussion on precedence and order of evaluation. I have corrected one or two errors which appeared in the original posting.\]

    Newsgroups: comp.lang.c
    From: scs@eskimo.com (Steve Summit)
    Subject: precedence vs. order of evaluation (was: HELP: Comma operator)
    Message-ID: <1996Jul25.1157.scs.0001@eskimo.com>
    Lines: 434
    References: <BRAD.96Jul23005938@rosalyn.cs.washington.edu> <01bb78bb$62355360$87ee6fce@timpent.airshields.com> <TANMOY.96Jul23132821@qcd.lanl.gov> <01bb796a$4e873a40$87ee6fce@timpent.airshields.com> <01bb798a$11913f80$87ee6fce@timpent.airshields.com>
    Date: Thu, 25 Jul 1996 18:57:00 GMT

Tim Behrendsen (tim@airshields.com) wrote:

    >>> I think I'm going to have to disagree with you; what do you think
    >>> side effects are?  The assignment operator is just an operator with
    >>> it's own precedence.  Side effects come into play based on the order
    >>> of evaluation, which is *purely* defined by the precedence rules.

This is a common misconception, but it's quite false. Order of evaluation is affected by much more than "precedence rules"; precedence affects order of evaluation much less than many people think.

    > There is only one thing that is relevent when you are talking about
    > expression evaluation, and that is the precedence rules. Everything else
    > falls out from those.

There's the misconception again. Order of evaluation does *not* "fall completely out of" precedence rules. It's true that precedence seems to have something to do with expression evaluation; in the expression

        a + b * c

we frequently say things like, "The multiplication happens before the addition, because `*` has higher precedence than `+`." But it turns out this is a risky thing to say; because it gives the listener the impression that precedence dictates order of evaluation, which as we'll see it does not. In my classes, I try desperately not to use the words "happens before" when explaining operator precedence, although I'm afraid I rarely succeed.

Let's imagine that we had some kind of omniscient processor, which could look at an expression and instantly give its value, without doing step-by-step evaluations. If we gave it the expression

        1 + 2 * 3

it would give us the result 7. Precedence tells us why it gave us that answer and not 9. That is, even if thoughts of "order of evaluation" never enter our heads, precedence is an important and independent concept, because it tells us what an expression *means*.

Another way to think about precedence is that it controls how the compiler parses expressions. The expression

        1 + 2 * 3

results in the "parse tree"

          +
         / \
        1   *
           / \
          2   3

Once it has determined the parse tree, the compiler sets about emitting instructions (in some order) which will implement that parse tree. The shape of the tree may determine the ordering of some of the instructions, and precedence affects the shape of the tree. But the order of some operations may not even be strictly determined by the shape of the tree, let alone the precedence. So while precedence certainly has an influence on order of evaluation, precedence *does not* "determine" order of evaluation. I'd say that precedence is about 40% related to order of evaluation -- order of evaluation depends about 40% on precedence, and 60% on other things. (This 40% figure is of course meaningless; it's just a number I pulled out of the air that "sounds right" \[Barry, 1994\]. The point I'm trying to make is that precedence is not entirely disconnected from order of evaluation, but the connection is nowhere near 100%.)

We've seen how precedence can affect or influence order of evaluation. Now let's start looking at all of the ways it does *not*, or, stated another way, at all of the ways that order of evaluation is determined by things other than precedence. (As we'll see, many of the "other things" turn out to be the whim of the compiler.)

Most of you have seen this example before, but I'll drag it out again. Suppose we have an expression containing three function calls:

        f() + g() * h()

Now, the result of calling `g()` will be multiplied by the result of calling `h()` "before" that product is added to the result of calling `f()`, and indeed, precedence tells us that. But, unless we have multiple parallel processors, those three functions `f()`, `g()`, and `h()` are going to be called in some order. What order will they be called in?

I don't know what order they'll be called in, and you don't know what order they'll be called in. Precedence doesn't tell us, and in fact *nothing* in K&R, the ANSI/ISO C Standard, or Dan Streetmentioner's Boffo C Primer Triple Plus will tell us. (C: The Complete Reference might tell us, but that's another story.) There's absolutely nothing preventing the compiler from calling `f()` first, even though its result will be needed "last."

If you have any doubts about this, I encourage you to compile and run this little program:

        #include <stdio.h>
        main() { printf("%d\n", f() + g() * h()); return 0; }
        f() { printf("f\n"); return 1; }
        g() { printf("g\n"); return 2; }
        h() { printf("h\n"); return 3; }

For the very first two compilers I tried this program with, one printed:

        g
        h
        f
        7

But the other printed:

        f
        g
        h
        7

Even if your compiler(s) prints `g h f 7` "as expected," bear with me while we look at this from yet another angle.

What do you do when the precedence is "wrong," that is, when you want to override the default precedence? You use explicit parentheses, of course. Parentheses force the operators and operands within an expression to be grouped in a certain way, and if you believe that precedence dictates order of evaluation, you might believe that parentheses dictate order of evaluation, too. But they do not.

Let's go back to the `f() + g() * h()` example. Suppose your compiler were emitting code which called `f()` first, and for some reason you wanted it to call `f()` last. How could you force this? Could you write

        f() + (g() * h())

where the parentheses are supposed to force the stuff inside them to happen first? You could try it, but I doubt it would make any difference. Those parentheses would tell the compiler that the result of `g()` was supposed to be multipled by the result of `h()` before the product was added to the result of `f()`, but the compiler was already going to do it that way, anyway, based on the default precedence. It would still be free to call `f()` first. (Indeed, for the compiler of mine that calls `f()` first, it still calls `f()` first even if I add the extra parentheses.)

Suppose, on the other hand, that your compiler is calling `g()` and `h()` first, and `f()` last. What if, for some reason, you want it to call `f()` first? How can you force this? If you belong to the hit-or-miss, aimless meandering, or drug-induced hallucination schools of programming, you might try

        (f()) + g() * h()

but I'll pay you (or anyone) \$100 if you can show me a compiler (other than one you wrote for the purpose) that can be forced to call `f()` first by putting a pair of parentheses around it like that.

In ANSI/ISO Standard C, when you care about the order in which things happen, you must take care to ensure that order by using "sequence points." Sequence points have nothing to do with precedence, and only partly to do with expressions; in my head they're up there next to statements. In general, when you want to control the order in which two things happen, you make the two things separate statements, and you put one statement after the other in the order you desire, perhaps using control flow constructs (e.g. if statements, loops, etc.) to control whether a statement gets executed at all, or how many times. Indeed, "the end of an expression statement" is essentially one of the defined sequence points in Standard C.

K&R C didn't have "sequence points"; Kernighan and Ritchie said that "explicit temporary variables can be used to force a particular order of evaluation" and "intermediate results can be stored in temporary variables to ensure a particular sequence" \[K&R1 p. 49; K&R2 p. 53\]. In fact, although Standard C gives us sequence points, it doesn't give us a tool to get a hold on `f()` in `f() + g() * h()`; if we needed `f()` called first, we'd have to write

        t = f(); t + g() * h()

or

        t = f(), t + g() * h()

The most obvious sequence points in Standard C are the ones at the ends of full expressions in expression statements, that is, as exemplified by the semicolon in the first line just above. Other sequence points are at the comma operator (as in the second line just above), at the && and \|\| operators, in the ?: operator, and just before a function call. (I do not claim that this is an exhaustive list.) On those (hopefully rare) occasions when you care about the ordering of operations within a single expression, you have to make sure that the expression contains one or more sequence points, and in places which will in fact constrain the order to the one you want. Most of the time, though, when you have a troublesome expression with too many ordering dependencies, the right response is the same as that of the doctor in the old joke about the patient who complains that his hand hurts if he shakes it in a certain way: "Well, don't do that, then." Break the expression up into separate statements, using temporary variables if you have to, and you'll be much happier.

(I confess that this advice may be easier to give than to apply. In the article that started this thread, the poster thought that the insertion of a sequence point or two, in the form of comma operators, should have constrained the order of evaluation sufficiently, but unfortunately it did not, because there still weren't *enough* sequence points. It didn't help that the poster thought that full parenthesization should have resolved any remaining evaluation-order problems.)

If the `f() + g() * h()` example seemed artificial and hence unconvincing, let's look at a morphologically identical but eminently realistic example. Suppose we're reading a two-byte integer from a binary data file in big-endian (most significant byte first) order. We could call `fread()` and then swap bytes if necessary, but that's a cheesy solution, because if (as is conventional) we implement the "if necessary" test with an `#ifdef`, we've condemned everyone who ever compiles our program to choose an appropriate setting for the `#ifdef` macro. Instead, let's call `getc()` twice, to read the first and then the second byte, and combine them like this:

        i = (firstbyte << 8) | secondbyte;

(Remember, the first byte we read is the most-significant byte, and the second byte is the least-significant.) So could we write that as

        i = (getc(ifp) << 8) | getc(ifp); /* WRONG */

? No! We could not! We *do not know* which call to `getc()` will happen first, and we very definitely care, because the order of those two calls is precisely what will determine whether we read the integer in big-endian or little-endian order. So, instead, we should write

        i = getc(ifp) << 8;           /* MSB */
        i |= getc(ifp);             /* LSB */

By writing this as two separate statements, we get a sequence point, which ensures the order of evaluation we need. If, on the other hand, we wanted to read in little-endian order, we'd write

        i = getc(ifp);              /* LSB */
        i |= getc(ifp) << 8;          /* MSB */

But, to repeat, we could not write

        i = (getc(ifp) << 8) | getc(ifp); /* "big-endian", but WRONG */

or

        i = getc(ifp) | (getc(ifp) << 8); /* "little-endian", WRONG */

Both of these seem to depend (and, in fact, would depend, if we wrote them) on a left-to-right ordering of the actual calls to `getc()`, which is *not* guaranteed. (And yes, I know that `getc()` is usually implemented as a macro, which means that both of these last two expressions would in fact expand to big, complicated expressions without any necessary function calls, but they would still not have any internal sequence points which would force the two getc's to happen in a well-defined order.)

\* \* \*

Unless you want to be a language lawyer, you don't have to memorize the definition of a sequence point or the list of sequence points which Standard C guarantees, or even use the words "sequence point" in casual conversation. (As you saw above, I can't remember the list off the top of my head with confidence, either, and that's because I'm not usually interested in being a language lawyer.) What I recommend you do, instead, is develop a sense of expressions that are "clean" versus expressions that are "ugly," and shy away from the ugly ones. ("Well, don't do that, then.") Ugly expressions are those that have multiple assignments in them, or comma operators, or multiple modifications of the same object, or which are so complicated and hard to understand that all the king's horses and all of comp.std.c require at least a week to figure out what they're guaranteed to do (or not). The cleanest expressions are those that calculate a single value, and perhaps assign it to a single location, without caring about the order in which various sub-operations (such as interior function calls) take place.

In between the cleanest expressions and those that are unremittingly ugly are several classes of mildly-tricky expressions which are well-defined and are useful and are commonly used and which I'm not trying to discourage you from using. It's easier to present these by example, as exceptions to my qualifications above of ugly expressions as those containing comma operators, ordering dependencies, or multiple assignments.

It's perfectly okay to depend on precedence, as long as you understand what it does and doesn't guarantee you. Precedence tells you that in the expression `a + b * c`, the left-hand operand of the `*` operator is `b`, not `a + b`. If you insist, precedence tells you that in that expression, "the multiplication happens before the addition." But precedence does not tell you what order the function calls would happen in in `f() + g() * h()`, and precedence would not give meaning to the expression

        i++ + j * i++           /* XXX WRONG */

(In particular, you *cannot* say that since the multiplication happens "first," the second `i++` must happen before the first.) This last expression is, you guessed it, unremittingly ugly.

You can use the `&&`; and `||` operators to guarantee that thing B happens after thing A, and not at all if thing A tells the whole story. Both

        n > 0 && sum / n > 0

and

        p == NULL || *p == '\0'

are perfectly valid, perfectly acceptable expressions.

You can use the comma operator when you have two (or more) things to do in the first or third controlling expressions of a `for()` loop. There are precious few other realistic opportunities for using comma operators; chances are, if you find yourself using comma operators anywhere else, you're doing something tricky and are skirting the edge of ugliness. (It's no coincidence that Java, I gather, doesn't allow comma operators anywhere but the first and third expressions of a for loop.)

You can use multiple `++` and `--` operators in a single expression, perhaps in conjunction with an assignment operator, as long as you're certain that the several things being modified are all distinct, and that you aren't ever in a position of using something that you've already modified. The expressions

        a[i++] = 0

and

        *p++ = 0

are perfectly acceptable, because the things being modified, `i` and `a[i]` in the first expression and `p` and `*p` in the second, are probably distinct. For the same reason, `a[0] = i++` is okay, too. Expressions like

        a[i++] = b[j++]

and

        *p++ = *q++

are also okay, because `i`, `j`, `a[i]`, and `b[j]`, and `p`, `q`, `*p`, and `*q`, are probably all distinct. Finally, the old standby

        i = i + 1

is perfectly acceptable, because although it both uses and modifies `i`, it demonstrably uses the old value to compute the new value.

On the other hand, the expressions

        i++ * i++       /* XXX WRONG */

and

        i = i++         /* XXX WRONG */

are no good, among other things because they modify `i` twice. And

        a[i] = i++      /* XXX WRONG */

and

        a[i++] = i      /* XXX WRONG */

are both wrong, because there's no telling whether `i` is used before it's modified, or vice versa. (If you think that either of these somehow *does* guarantee whether the plain `i` on one side means the value of `i` before or after the incrementation performed by the `i++` on the other, think again.)

Finally, it's perfectly acceptable to write something like

        i = j = 0

even though it contains multiple assignments, because again, it's an unambiguous idiom and it's clear that two different variables are being assigned to.

Now, I'm acutely aware that these guidelines (or any like them) can never be complete, because there are an infinite number of expressions out there, and some of them are clean and legal even though my "rules" might seem to disallow them and my exceptions don't cover them, and others of them are unremittingly ugly even though my "rules" don't disallow them or my exceptions seem to allow them. Somehow, successful programmers learn to calibrate their own inner aesthetic such that the expressions which aren't "ugly" are the ones that (a) are well-defined, and (b) are sufficient for writing real programs. I encourage all of you to nurture such an aesthetic as well, and to learn to write programs without "ugly" expressions, rather than wasting time trying to figure out what they do (and whether they're guaranteed to do it). If you've got an example of a well-defined expression which you feel is acceptable but which the guidelines I've presented seem to discourage, or of an ill-defined expression which these guidelines don't seem to discourage, I encourage you to post it here or mail it to me; I'd love to expand and refine these guidelines. (Equally importantly, I'd love to figure out how to word them so that they're useful and meaningful to someone who *hasn't* already developed a sense for good vs. ugly expressions.)

Also, if you're still with me, I'd like to repeat the main moral of this article, which is that "precedence" is not the same thing as "order of evaluation." The one certainly has something to do with the other (sort of like pointers and arrays), but it's a delicate relationship to describe precisely, so unless you care to figure out the whole story (and figure out what number I should have used above instead of 40%), you might actually be better off if you remember the statement that "Precedence has nothing to do with order of evaluation." This statement isn't true, of course, but it's much closer to the truth than "Precedence has everything to do with order of evaluation," `/* XXX WRONG */`\
which is not only false, but quite misleading.

Finally, for anyone who is still unsure on any of this, I urge you to read [section 3](http://www.eskimo.com/~scs/C-faq/s3.html) of the [FAQ list](http://www.eskimo.com/~scs/C-faq/top.html), or chapter 3 of the FAQ list book, because there's more on this in there. (Of course, it's written by the same mope you're reading now, so if you don't like something I've written here, I can't guarantee that you'll find relief in the FAQ list.)

[Steve Summit](http://www.eskimo.com/~scs/)\
<scs@eskimo.com>
