---
title: "int main() vs. void main()"
source_domain: amasci.com
source_path: ~scs/readings/voidmain.990301.html
order: 8020
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T17:15:39Z
extractor: site_to_paper.py (pandoc)
---

# int main() vs. void main()

*Source page: `~scs/readings/voidmain.990301.html`*

\[This article was originally posted on March 1, 1999. I have edited the text slightly for this web page.\]

From: scs@eskimo.com (Steve Summit)\
Newsgroups: comp.lang.c\
Subject: Re: "`void main`" is a lifestyle choice\
Date: 1 Mar 1999 17:16:39 GMT\
Message-ID: \<7bei1n\$tsl\$1@eskinews.eskimo.com\>\
References: \<36D9A98B.56C1@customized.removethis.com\> \<36D9B89F.287C@customized.removethis.com\> \<7bco1u\$cjd\$1@eskinews.eskimo.com\> \<36DA149D.757D@customized.removethis.com\>

In article \<36DA149D.757D@customized.removethis.com\>, Sven writes:\
\>Steve Summit wrote:\
\>\> Ben went a bit too far. Yes, to keep your compiler or `lint`\
\>\> from complaining, you will probably need a "`return 0`" statement.\
\>\> Yes, this is a statement that may never be executed, inserted\
\>\> just to keep everyone happy. Yes, inserting it will bloat your\
\>\> executable by a few bytes. All of that is okay in this case --\
\>\> really. If nothing else, it'll most certainly cost you less time\
\>\> than arguing about it here.\
\>\
\> I made a point and I think you agree with it. I am not worried\
\> about code bloat or lost time for argument. Can't I raise an\
\> objection to an ANSI decision?

As a practical matter, no, you can't. That part of the Standard is very solidly set in stone. Furthermore, like almost all aspects of the Standard, it codifies existing practice, which has always been that `main` has been presumed to return `int`.

\> Please keep this discussion in the academic/language-theory realm\
\> it was intended. If you disagree with me, then I expect a cogent\
\> argument in favour of "`int main`" and why it was chosen.

Unfortunately I don't have time for a full-blown argument this morning; perhaps another day. But consider this: any interface specification must be adhered to by both sides unless renegotiated. You have no more freedom to choose your own return type for `main` than you do for `matherr`, nor for the functions passed as the last argument to `qsort` or `bsearch`, nor for the functions passed to `atexit`, nor for the functions passed as the second argument to `signal`. Somebody else's code, code over which you have no control, will be calling all of these functions, and unless you are prepared to get all compiler and RTL authors to simultaneously rewrite their code to support your revised interface specification, **and** to get all authors of C code in the world to simultaneously rewrite their code to work with the revised compilers and RTLs, you're simply going to have to write this one off as one of life's little miseries, and move on to fight other battles.

My (sincere, I am not being sarcastic here) recommendation to you is to write

        return 0;   /* This statement serves no purpose except  */
                /* to coddle misguided and narrow-minded    */
                /* specifications made by an ANSI committee */
                /* which didn't realize that I might write  */
                /* a main() which never returns.            */

at the end of `main()`. That's the sort of thing I do whenever I'm forced to comply with an inept interface specification which I don't have time to fix. This accomplishes your purpose: you have written code which is correct and which compiles without warning or error, and you have stated for the record your objection to the way you were forced to write it. Then, as I said, move on.

I see that I haven't quite answered your question. Why was `int` chosen instead of, say, `void`? There are two explanations. `main` has to have a single return type; there is no overloading in C. Some programs do want to return an exit status from main and some don't, so one group or the other is sure to be disappointed.

I was about to claim that it's easier for programs which don't want to return to comply with the dictum that `main` must return `int` than it would be for programs that do want to return to deal with a world in which ANSI specified that `main` was declared `void`, but I guess I might have gotten that backwards. In a hypothetical world where `main` had to be declared `void`, programs which wanted to return an exit status at the top level could simply call `exit` instead of returning. (This would wreak havoc with programs which call `main` recursively, of course, but they're almost so rare they can be ignored.) So I guess I have to fall back on the second explanation.

Once upon a time, C had no `void` type. Functions which didn't want to return anything just left out the expressions in the `return` statements and left the return type out of function declarations. But the default for a function with an omitted return type was always (until C99 came out) `int`. Ergo, in the days before `void`, programmers who didn't want to return a value from `main` (and who thought they were declaring `main` as returning nothing) were declaring `main` as `int`. Pre-ANSI, pre-`void` practice was unanimously for `main` to be declared as returning `int`, so there was no other possible choice for ANSI to standardize.

\>\> Other options -- depending on your compiler or `lint` -- are to\
\>\> tell your compiler or `lint` that your program's `main` function\
\>\> (that is, the one called from `main` that does all the work and has\
\>\> a call to `exit` buried somewhere down within it) never returns,\
\>\> or to insert some kind of a "notreached" directive right after\
\>\> the call to that function in `main()`. Either of these options\
\>\> (if available) may serve to suppress the "control reaches end of\
\>\> `int`-valued function without `return`" message, *without* polluting\
\>\> your code with a statement which will never be executed.\
\>\
\> Now we're talking about non-portable work-arounds to legitimately\
\> generated warnings and deliberately inserted unreachable code.\
\> Are you serious?

Yes.

Let me ask you this: what do you do when you have a function with an imposed, unchangeable signature but which doesn't happen to need one of its parameters? Many compilers will warn you that "argument `x` is unused in function `f`". Many times, this is an appropriate warning. Sometimes it is not. How do you cleanly shut it off? (I honestly don't know. Right now, I'm ignoring it in a fair amount of production code I'm compiling with `gcc`. Ten years ago, I would have inserted an `/* ARGSUSED */` comment to silence `lint`, but that's a nonstandard extension. If I finally get so sick of the warnings that I decide to do something about it, I'll probably insert some dummy code which seems to do something with `x`, but then that's wasted code which pollutes my clean program and accomplishes nothing at run time and exists only to coddle various compiler warnings and interface specifications at compile time.)

\>\>\> Remember that `lint` or compilers set to their highest warning levels\
\>\>\> don't understand program flow.\
\>\>\
\>\> Actually, many of them *do*.\
\>\
\> They can not. Program flow is not deterministic. A compiler can not\
\> determine ahead of time whether a function called in `main` will ever\
\> return control to `main`.

Yes, Sven, I've heard of the halting problem, too.

Many compilers know, *semantically*, that a call to a function named `exit()` never returns. Based on this information, when faced with the code

        int f()
        {
            exit(0);
        }

they will suppress their normal warning about "control reaches end of non-`void` function without `return`". Furthermore, some of these compilers allow you to specify (via some `#pragma` or nonstandard declaration) that certain of your functions do not return, either.

My point is that these compilers do have a notion of control flow, a notion which is based not on exhaustive analysis but on hints which the compiler has been given. Furthermore, since it's this very same, weak form of control flow "analysis" that is driving the compiler's determinations that a "statement is not reached" or a "variable is set but not used" or that "control reaches end of non-`void` function without `return`", it is not inappropriate to be tying in with that weak control-flow analysis mechanism when you're trying to suppress one of the warnings based on information which you have but which the compiler cannot otherwise know. (But no, since all of this is compiler-specific, there is no Standard or portable way to supply the hints or otherwise tie in with the mechanisms.)

\>\> "They" could not have left it as `void`, because it never was `void`.\
\>\> The defined return type of `main` has always been `int`. `main` does\
\>\> have to be a function returning `int`, because that's what the\
\>\> calling code (remember, there is some code, namely in the\
\>\> program's run-time start-up, that is going to call `main`) expects\
\>\> it to be.\
\>\
\> Perhaps what I'm asking for is bona fide support for ANSI convention in\
\> the form of a prototype for "`main`" - maybe it should be in `<stdlib.h>`.

That would be wonderful, and it might help to put this eternal debate to rest. Alas, it's impossible, because there is no one prototype for `main` -- it's either

        int main(void);

or

        int main(int, char **);

This is one of the larger warts on the ANSI/ISO C Standard, and it's there (like all the others) to codify existing practice.

\> Until then I can code my `main` function anyway I want to, despite\
\> ANSI wishes or the yelling to the contrary from this newsgroup.

Sure. And you can write `a[i] = i++`, or cross the street after the DON'T WALK sign has started flashing, or take 13 items through the "12 items or less" aisle at the supermarket, or do any of a million other things that sit squarely in the grey area between legality and illegality and which you might or might not get called on.

\

Look, don't get me wrong. I salute your wish to write clean programs which express the programmer's intent. I salute your wish not to pollute your code with nonstandard directives or meaningless or unreachable code. Both of these are goals which I have for my own work as well. But I urge you to pick your battles. (Reinhold Niebuhr's serenity prayer is applicable, too.) The situation with respect to `main`'s return status is not perfect, but it is a comparatively minor issue, and you will not have forsaken your quest to write good, clean code by conceding defeat on this one. When you design your own, perfect language (no sarcasm here, either; this is what I'm doing, too) you can fix the situation with respect to `main's` return value once and for all.

(Also, I might explain or apologize for some of the other responses you've gotten in this thread. We're not as stupid as you think we are, but you're new here, I think, and you've taken a fairly argumentative and intolerant tone. It looks like some of your respondents have dealt with you rather summarily, not noticing where you're coming from underneath.)

[Steve Summit](http://www.eskimo.com/~scs/)\
<scs@eskimo.com>

P.S. No, `matherr` isn't standard, either.
