---
title: "undefined behavior"
source_domain: amasci.com
source_path: ~scs/readings/undef.981105.html
order: 8018
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T17:15:39Z
extractor: site_to_paper.py (pandoc)
---

# undefined behavior

*Source page: `~scs/readings/undef.981105.html`*

\[This article was originally posted on November 5, 1998.\]

    From: scs@eskimo.com (Steve Summit)
    Newsgroups: comp.lang.c
    Subject: Re: Interesting question in C
    Date: 5 Nov 1998 17:41:02 GMT
    Lines: 257
    Message-ID: <71snve$3cg$1@eskinews.eskimo.com>
    References: <01be08ba$4b7439c0$ec19ea93@lalex.ecitele.com> <3641B492.7AC8@gec.nospam.com>

    In article <3641B492.7AC8@gec.nospam.com>, Edward Hill writes:
    >Alex Lemelev wrote:
    >>    int i , j = 3;
    >>    i = ++j * ++j;
    > 
    > But well ++ has higher precedence than *
    > so I'd imagine j is incremented to 4 and then incremented
    > to 5 and then multiplied by itself to give 25. 
    > So what's the answer?

The answer, of course, is that there is no answer.

Attempting to use precedence rules to analyze malformed expressions like these is a popular pastime, but it turns out not to help. It's true that the "outputs" of the two ++'s are to be multiplied together, but what are those outputs?

Consider a related expression:

        i = f1() * f2();

Function calls have higher precedence than multiplication, so the two functions will be called before the multiplication can happen. But which function is called first, `f1` or `f2`? No one can say, and different compilers do it differently.

(I suppose you might try to invoke the left-to-right associativity of multiplication to claim that f1 would be called first, but associativity doesn't help here, either. Associativity says that in `f1() * f2() * f3()`, the results of `f1` and `f2` are multiplied together before being multiplied by the result of `f3`, but we still don't know which order the functions were called in. `f3` might be called first, and its result saved for last.)

The situation with `++j * ++j` is actually even worse than with `f1() * f2()`. In the function call case, it's probably true that either `f1` is called first and then `f2`, or `f2` is called first and then `f1`. Applying the same logic to `++j * ++j`, we might imagine that either the left-hand `++j` gets evaluated first and then the right-hand one, yielding 4 `*` 5 = 20, or else the right-hand one gets evaluated first and then the left-hand one, yielding 5 `*` 4 = 20. But it turns out that this analysis doesn't work, either.

The problem is that +`+j `does two things. It delivers the value `j+1` to the surrounding expression, and it stores the value `j+1` back into `j`, thus incrementing it. But we don't know (because the C Standard doesn't tell us) precisely when the updated value of `j` gets written back to j.

In some expressions, it doesn't matter. If we wrote

        i = ++j * k;

the compiler could emit code which essentially either interpreted the expression as

        j = j + 1;
        i = j * k;

or

        i = (j+1) * k;
        j = j + 1;

If we wrote

        i = ++j * ++k;

there would be at least six possible interpretations:

        j = j + 1;                    k = k + 1;
        k = k + 1;                    j = j + 1;
        i = j * k;                    i = j * k;

        i = (j+1) * (k+1);            i = (j+1) * (k+1);
        j = j + 1;                    k = k + 1;
        k = k + 1;                    j = j + 1;

        j = j + 1;                    k = k + 1;
        i = j * (k+1);                i = (j+1) * k;
        k = k + 1;                    j = j + 1;

Now, all six of those interpretations yield the same answer (16, if `j` and `k` both start out as 3). But if you replace `k` in each of them by `j`, resulting in six possible interpretations of the expression `++j * ++j`, you can get at least three different answers (16, 20, and 25, by my reckoning).

But it gets worse. The official wording in the ANSI/ISO C Standard says that if you attempt to modify the same object at one spot within an expression and refer to that same object at another spot (as in the expression `++j * j`), or if you attempt to modify the same object twice within an expression (as in the expression `++j * ++j`), the results are undefined \[footnote 1\]. What this means is that the compiler isn't even required to choose among the two (or six, or however many you can come up with) "plausible" interpretations of the expression; it can do any random thing it wants to, and it won't be in violation of the Standard. (In practice, it's not so much that compilers do "any random thing they want to" in these situations, but what does happen is that they do any random thing that falls out of their algorithms for handling well-formed expressions, algorithms which are not designed -- because they do not have to be -- to do anything reasonable with undefined expressions.)

Now, you might say (and I'd agree with you) that the expression `i = ++j * ++j` would be so unlikely to come up in a real program that it hardly matters what it does. But if you think you can analyze that expression and figure out what it does, then there's a flaw either in your analysis or in your understanding of C. And I would urge you to repair that flaw -- to teach yourself that you *cannot* analyze the behavior of expressions like these -- because that way you won't falsely imagine that you can predict the behavior of other, more insidious undefined expressions which *do* occasionally crop up in real programs, expressions which will cause real problems if they are retained, expressions which it will do nobody any positive good to be able to analyze or justify, expressions which should ideally be recognized as the undefined expressions they are and banished from the program as soon as possible.

As an example of how a "more insidious undefined expression" can in fact crop up in a real program, consider the following decidedly non-hypothetical scenario. (The reason I know it's not hypothetical is that I know the programmer it happened to.) The program is the interpreter for a stack machine, and it contains code like

        switch(op)
            {
            case ADD:
                push(pop() + pop());
                break;
            case SUBTRACT:
                tmp = pop();
                push(pop() - tmp);
                break;
            case MULTIPLY:
                push(pop() * pop());
                break;
            case SUBTRACT:
                tmp = pop();
                if(tmp == 0) {error("divide by 0"); break; }
                push(pop() / tmp);
                break;
            ...

In the original implementation, `push()` and `pop()` are function calls. The original programmer, knowing that the order of function calls within an expression is unpredictable (see our discussion of `f1` and `f2` above) has taken care to use a temporary variable to ensure that the operands are popped in the right order for subtraction and division, where it matters.

But the interpreter is too slow, and a later programmer reasons that part of the problem is function call overhead. (Most of the time, it's a good idea not to worry about function call overhead too much, but in some situations, such as the inner loop of an interpreter which might be interpreting huge amounts of code, it can indeed be significant.)

I don't remember if the push and pop functions were

        void push(val)
        {
        stack[stackp++] = val;
        }

        pop()
        {
        return stack[--stackp];
        }

or

        void push(val)
        {
        *stackp++ = val;
        }

        pop()
        {
        return *--stackp;
        }

(That is, although the stack and the stack pointer were both global, I don't remember whether the stack pointer was an index or a pointer into the stack.) But, in either case, it's easy to see how we might replace the push and pop functions with macros, thus removing the function call overhead in the critical inner loop, without rewriting the entire interpreter. (In fact, this interpreter had hundreds of operators, some much more complicated than simple arithmetic, so there were hundreds of calls to `push()` and `pop()` spread across many source files.)

The macros would, of course, either be

        #define push(val) (stack[stackp++] = (val))
        #define pop() stack[--stackp]

or

        #define push(val) (*stackp++ = (val))
        #define pop() *--stackp

and this seems like a very simple way to dramatically increase the efficiency of the interpreter. (It did, too, by 20 or 30 percent.) The problem was that the interpreter also began delivering wildly erroneous answers.

The problem turned out to be in those innocuous-looking lines

        push(pop() + pop());

and

        push(pop() * pop());

for addition and multiplication. When push() and pop() are macros, these lines expand to either

        (stack[stackp++] = (stack[--stackp] + stack[--stackp]));
        (stack[stackp++] = (stack[--stackp] * stack[--stackp]));

or

        (*stackp++ = (*--stackp + *--stackp));
        (*stackp++ = (*--stackp * *--stackp));

And these expressions bear an eerie similarity to the one that began this thread. (They're complicated by an added level of indirection, and they each attempt to modify stackp *three* times within one expression.) And yes, under a popular, real-world compiler, namely gcc, these expressions did produce some crazy result which was not at all the expected one but which, by a strict and proper interpretation of the C Standard, was *not* incorrect. (That is, it was not incorrect for the compiler and the emitted code to have produced the undesired result.) The compiler had not done anything wrong; the error was on the part of the programmer who attempted to replace the function calls with macros, macros which proved to be dangerous because of their embedded side effects.

And finally, in case anyone is doubting the truth of this story, I can tell you that the maintenance programmer who introduced the undefined behavior was (as others of you have probably already guessed) none other than the maintainer of the comp.lang.c FAQ list, Steve Summit, who presumably ought to have known better.

[Steve Summit](http://www.eskimo.com/~scs/)\
<scs@eskimo.com>

Footnote 1: The real rule on undefined expressions is that you can't modify an object twice, or modify and then inspect it, between sequence points. There are a few operators -- including function calls -- which do introduce sequence points, so it's possible to come up with expressions which contain multiple side effects but which are not undefined.
