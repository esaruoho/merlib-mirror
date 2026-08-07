---
title: "Recursion"
source_domain: amasci.com
source_path: ~scs/readings/recursion.990209.html
order: 8013
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T17:15:38Z
extractor: site_to_paper.py (pandoc)
---

# Recursion

*Source page: `~scs/readings/recursion.990209.html`*

\[The text here is extracted from a pair of articles originally posted on February 9, 1999.\]

From: scs@eskimo.com (Steve Summit)\
Newsgroups: comp.lang.c\
Subject: Re: Other examples of recursion?\
Date: 10 Feb 1999 04:52:03 GMT\
Message-ID: \<79r39j\$4vs\$1@eskinews.eskimo.com\>

Here is one way to think about recursion.

Think about where you live, and think about the last time it was really messy, and you asked your roommate or spouse or significant other to help clean up. If you're unlucky, they picked up one totally obvious but well-constrained and easy-to-pick-up piece of trash, and then decided that they'd done enough, and curled up on the couch with a beer to watch a football game while you did all the rest of the hard work. (Or, if your roommate/spouse/significant other is the unlucky one, perhaps you pulled this stunt on them. It doesn't matter what the roles were, the point is that there was a totally unfair division of labor.)

Shifting from housecleaning to computer programming, let's imagine it's our job to take a number (in binary, say) and print out the digits of its base-ten representation in conventional left-to-right order. If you've never attacked it before, this is an at least slightly tricky problem. You can divide by 10 to get individual digits, but of course dividing by 10 gives you the rightmost digit first, so if you're not careful, you end up with the digits in the wrong order.

But let's stick with this approach a bit longer, and see if we can get anywhere. We can start with the original number, take the remainder when dividing it by 10, and print that digit. Then all we have to do it figure out how to print the remaining digits, first. In pseudocode, we have something like

        printdigits(int n)
        {
            int d;
            print all but the last digit of n;
            d = n % 10;
            print digit d;
        }

Printing one digit is easy -- the digit characters `'0'` to `'9'` are certain to have consecutive values in any sane character set (and the ANSI/ISO C Standard mandates the choice of a character set that is sane in this regard), so converting an integer `d` which is known to be in the range 0 to 9 simply requires adding that integer as an offset to the character constant `'0'`. Applying that technique, and deferring the other vaguely-defined part of the problem to a subfunction, we have a function which is no longer pseudocode, but C:

        printdigits(int n)
        {
            int d;
            print_all_but_the_last_digit_of(n);
            d = n % 10;
            putchar('0' + d);
        }

Notice how much like the lazy roommate this code is. It does the falling-off-a-log easy part, and lets somebody else (namely, the hypothetical function `print_all_but_the_last_digit_of`) do all the hard work. Moreover, it successfully pulls off an additional bit of brazen audacity which not even the laziest roommate could get away with: it lets the somebody else do the hard part *first*, then waltzes back from the couch and does the easy bit last, just before the final curtain falls and the applause begins. What cheek!

Actually, we've got one piece of cheekiness left. We've still got to figure out how to print all but the last digit of `n`, and of course we've got to print it as a string of left-to-right digits. So it looks as if we haven't gotten *anywhere* -- (no surprise, right, with a roommate this lazy and unhelpful!) -- the `print_all_but_the_last_digit_of()` function is going to be exactly as hard to write as `printdigits()` was; the "work" that's been done (or that will have been done) so far hasn't helped us out at all.

But wait -- printing out all but the last digit of `n`, in left-to-right-order, is exactly the same problem as printing out the digits of the quantity `n/10` in left-to-right order, where we use integer arithmetic to compute `n/10` and throw away the remainder. So we now have a glimmering idea of a staggeringly audacious move which will make our earlier sloth seem virtuous by comparison: what if we *call* *ourselves* to do the hard part, then finish up and be done with it? That is, what if we write

        printdigits(int n)
        {
            int d;
            printdigits(n/10);
            d = n % 10;
            putchar('0' + d);
        }

where we've replaced the call to the unwritten function `print_all_but_the_last_digit_of()` with a call to the function `printdigits()`, which is the function we were supposed to write in the first place?? (A function which in fact we've already "written", except that our attempt so far seemed laughingly incomplete and not at all functional...) We can't possibly get away with this, can we? This is like trying to become rich by borrowing a dollar from yourself one million times so that you have \$1,000,000, or inventing a time machine by inventing a time machine and then going back in time and giving it to yourself, or attempting to fly by pulling yourself up by your own bootstraps, or trying to clean your room by asking your little brother to do it, except that you're an only child, and the "little brother" you're asking is just your reflection in a mirror you're holding behind you, in which the ephemeral little brother you're asking to do the work is simultaneously asking an even-more-ephemeral little brother standing behind him, who is asking the reflection behind him, ad infinitum...

Remarkably enough, we *can* do this, as long as we back off from our stance of utter sloth by one little notch. In the case when the number we're printing has only one digit, we don't need to delegate any of the work. (Perhaps this decision only cements our reputation as a glory-hogging layabout: for one-digit numbers, we take all the credit.) At any rate, the final implementation looks like this:

        printdigits(int n)
        {
            int d;
            if(n > 9)
                printdigits(n/10);
            d = n % 10;
            putchar('0' + d);
        }

The additional test breaks the infinite recursion; the function won't call itself forever. It will call itself as many times as there are digits in the number, and the deepest recursive call will print the leftmost digit first, and on the way back, each successive invocation will append another to the right. If you're having any trouble seeing this, try rewriting the function as

        printdigits(int n)
        {
            int d;
            printf("printdigits(%d)\n", n);
            if(n > 9)
                printdigits(n/10);
            d = n % 10;
            printf("printing digit %c\n", '0' + d);
        }

When called with a number such as 12345, you'll first see a flurry of recursive calls, as each invocation madly tries to pawn the job off on somebody else, until finally there's only one digit left, and the innermost recursive call condescends to do some actual work, and the logjam is broken, and the containing calls chip in their pieces in succession, and the job is done, in a symphony of concerted laziness.

------------------------------------------------------------------------

\[The next section is adapted from the web page <http://www.eskimo.com/~scs/cclass/krnotes/sx9f.html>.\]

An even cleaner demonstration of the power of recursion concerns the traversal of binary trees. A binary tree is a linked data structure in which each node has up to two subtrees, with all the items in a node's left subtree being (by definition) less than the item contained in the node, and all the items in the right subtree being greater. For example, here is a binary tree containing the letters A though K:

              F
             / \
            /   \
           /     \
          B       H
         / \     / \
        A   D   G   J
           / \     / \
          C   E   I   K

This is not the only binary tree containing the letters A through K; there's quite a number of different ways of arranging it. But note that, for any letter, all the letters in the subtree below and to the left of it come before it in the alphabet, and all the letters in the right subtree come after. (The top item in a node's left subtree is not necessarily immediately less than the item at that node or anything; the immediately-preceding item is merely down in the left subtree somewhere, along with all the rest of the preceding items. In the tree I've just shown, for example, the letter F appears at the top of the tree although it's obviously neither the first nor the last letter in the list. The letter B which is at the top of F's left subtree does not immediately precede F; the letter immediately preceding F is E, which is indeed down in F's left subtree somewhere.)

We could represent one node in such a tree with an instance of the structure

        struct tnode
            {
            char letter;
            struct tnode *left;
            struct tnode *right;
            };

To be clear: that's one structure describing one node; for a tree with many nodes we'd have many instances of the structure. (We'd probably allocate them dynamically using `malloc`.)

This structure may look dangerous -- if we're trying to describe a `struct tnode`, what are those little `struct tnode`s doing inside it? They're pointers to the node's left and right subtrees, and the reason they're okay is precisely that they are merely pointers; they are not complete `struct tnode`s. (If every `struct tnode` tried to contain one or more complete struct tnodes, the structure would obviously need to be infinitely big.) It's perfectly acceptable (and quite common) for a structure to contain pointers to other instances of itself; this is precisely how lists, trees, and all sorts of other linked data structures are commonly implemented in C.

Suppose it's our job to print one of these binary trees. We've just been handed a pointer to the base (root) of the tree. What do we do? The only node we've got easy access to is the root node, but as we saw, it's not a very interesting node (i.e. not the first or the last element or anything); it's generally a random node somewhere in the middle of the eventual sorted list (distinguished only by the fact that it happened to be inserted first). The node that needs to be printed first is buried somewhere down in the left subtree, and the node to print just before the node we've got easy access to is buried somewhere else down in the left subtree, and the node to print next (after the one we've got) is buried somewhere down in the right subtree. In fact, everything down in the left subtree is to be printed before the node we've got, and everything down in the right subtree is to be printed after. A pseudocode description of our task, therefore, might be

        print the left subtree (in order)
        print the node we're at
        print the right subtree (in order)

How can we print the left subtree, in order? The left subtree is, in general, another tree, so printing it out sounds about as hard as printing an entire tree, which is what we were supposed to do in the first place. In fact, it's exactly as hard: it's the same problem. Are we going in circles? Are we getting anywhere? Yes, we are: the left subtree, even though it is still a tree, is at least *smaller* than the full tree we started with. The same is true of the right subtree. Therefore, we can use a recursive call to do the hard work of printing the subtrees, and all we have to do is the easy part: print the node we're at. The function might look like this:

        void treeprint(struct tnode *p)
        {
            if(p->left != NULL)
                treeprint(p->left);
            printf("%c\n", p->letter);
            if(p->right != NULL)
                treeprint(p->right);
        }

In any recursive function, it is (obviously) important to terminate the recursion, that is, to make sure that the function doesn't recursively call itself forever. In the case of binary trees, the fact that the left and right subtrees are smaller (than the tree containing them, that is) gives us the leverage we need to make a recursive algorithm work. When we reach a "leaf" of the tree (more precisely, when the left or right subtree is a null pointer), there's nothing more to visit, so the recursion can stop. It turns out that we can test for this in two different ways, either before or after we make the "last" recursive call. In the code just above, we tested before the call. Here's the other way to do it:

        void treeprint(struct tnode *p)
        {
            if(p == NULL)
                return;

            treeprint(p->left);
            printf("%c\n", p->letter);
            treeprint(p->right);
        }

Sometimes, there's little difference between one approach and the other. Here, though, the second approach has a distinct advantage: it will work even if the very first call is on an empty tree. It's extremely nice if programs work well at their boundary conditions, even if we don't think those conditions are likely to occur.

Another impressive thing about a recursive `treeprint` function is that it's not just *a* way of writing it, or a nifty way of writing it; it's really the *only* way of writing it. You might try to figure out how to write a nonrecursive version. Once you've printed something down in the left subtree, how do you know where to go back up to? Our `struct tnode` only has pointers down the tree; there aren't any pointers back to the "parent" of each node. If you write a nonrecursive version, you have to keep track of how you got to where you are, and it's not enough to keep track of the parent of the node you're at; you have to keep a stack of *all* the nodes you've passed down through. (Even if we did have back pointers, it's not clear that they'd give us enough extra information to work our way though the tree in the correct order.) When you write a recursive version, on the other hand, the normal function-call stack essentially keeps track of all this for you.

------------------------------------------------------------------------

Subject: Re: Other examples of recursion?\
Date: 10 Feb 1999 05:52:21 GMT\
Message-ID: \<79r6ql\$72q\$1@eskinews.eskimo.com\>

Here are two more examples, one for computing the greatest common denominator by Euclid's method, and one for computing Fibonacci numbers:

        int gcd(int a, int b)
        {
            if(b == 0)
                return a;
            else    return gcd(b, a % b);
        }

        int fib(int n)
        {
            static int fibs[24] = {0, 1};

            if(n < 0 || n >= 24)
                return -1;

            if(fibs[n] == 0 && n > 0)
                fibs[n] = fib(n-1) + fib(n-2);

            return fibs[n];
        }

\[Both of these examples are lifted from Volume II, Chapter 3 of Macmillan's Handbook of Programming Languages.\]

The `fib()` implementation uses "memoization", involving static data, to avoid the exponential recursive explosion which otherwise dooms Fibonacci numbers to being the classic example of when *not* to use recursion.

[Steve Summit](http://www.eskimo.com/~scs/)\
<scs@eskimo.com>
