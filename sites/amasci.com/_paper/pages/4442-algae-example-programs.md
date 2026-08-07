---
title: "Algae - Example Programs"
source_domain: amasci.com
source_path: ~ksh/algae/algae_3.html
order: 4442
reachable_from_entry: false
images: 8
internal_links: 9
extracted: 2026-08-07T17:11:13Z
extractor: site_to_paper.py (pandoc)
---

# Algae - Example Programs

*Source page: `~ksh/algae/algae_3.html`*

Go to the [first](algae_1.html), [previous](algae_2.html), [next](algae_4.html), [last](algae_11.html) section, [table of contents](algae_toc.html).

------------------------------------------------------------------------

# ![](icon.gif) <a href="algae_toc.html#TOC3" id="SEC3">Example Programs</a>

Following are several examples designed to show off Algae's capabilities as well as to give you a feel for how it is used. The `` `examples' `` directory in the source distribution of `algae` contains some additional code for perusal.

## <a href="algae_toc.html#TOC4" id="SEC4">Temperature Conversion</a>

<span id="IDX103">![](invisible.xbm)</span> <span id="IDX104">![](invisible.xbm)</span>

This Algae program prints a table of Fahrenheit temperatures and their Celsius equivalents:

    # Print temperature conversions
    fahr = sort (0:300:20, 32, 212);
    celsius = (5/9)*(fahr-32);
    [fahr;celsius]'?

Its output looks like this:

    [         0.000       -17.78 ]
    [         20.00       -6.667 ]
    [         32.00        0.000 ]
    [         40.00        4.444 ]
    [         60.00        15.56 ]
    [         80.00        26.67 ]
    [         100.0        37.78 ]
    [         120.0        48.89 ]
    [         140.0        60.00 ]
    [         160.0        71.11 ]
    [         180.0        82.22 ]
    [         200.0        93.33 ]
    [         212.0        100.0 ]
    [         220.0        104.4 ]
    [         240.0        115.6 ]
    [         260.0        126.7 ]
    [         280.0        137.8 ]
    [         300.0        148.9 ]

This program does quite a bit in only four lines. The entire first line is a **comment** (because it starts with `#`) and is ignored by Algae.

In the second line we define the Fahrenheit temperatures for our table. The expression `0:300:20` gives a vector that goes from 0 to 300 in steps of 20. We add two more elements, 32 and 212, to that vector by using the comma operator. Then we use the `sort` function to sort it in increasing order. Finally, our vector of Fahrenheit temperatures is assigned to the variable `fahr`. Nothing is printed by this statement, since it ends with a semicolon.

The third line computes the Celsius equivalents using the familiar conversion formula. First 32 is subtracted from each element of `fahr`. Then each element is multiplied by 5/9. The result is assigned to the variable `celsius`. Here, again, nothing is printed.

Even though all of the terms so far have been integers, `celsius` is a real-valued vector. Unlike some programming languages, integer division in Algae does not result in truncation--the expression `5/9` returns a real value that is approximately 0.556.

The last line prints the temperatures out as a matrix, with the Fahrenheit temperatures in the first column and their Celsius equivalents in the second column. We do that by using brackets to form a matrix with `fahr` in the first row and `celsius` in the second row and then transposing the matrix with the `'` operator. The question mark on the end is not necessary, since the matrix would also be printed without it, but it does call attention to the line as one that prints.

## <a href="algae_toc.html#TOC5" id="SEC5">Reading and Summing Numbers</a>

<span id="IDX105">![](invisible.xbm)</span> <span id="IDX106">![](invisible.xbm)</span>

This Algae program reads a bunch of numbers, adds them up, and prints the result:

    # Read and sum some numbers
    sum = 0;
    $read = 1;
    while ($read) { sum += readnum(); }
    sum?

The program reads numbers one at a time and adds them to `sum`, so in the first line `sum` is initialized to zero. The `readnum` function is used to read the numbers. This function is one of the few standard functions that has a side effect: it assigns to the variable `$read` the number of values that it read. It will be less than the number you asked for if `readnum` runs out of data.

The `while` loop executes its statements repeatedly until its condition tests true. We set `$read` to 1 (true) first, so we know that the `while` loop will execute at least once. After that, the `while` loop continues until `$read` is eventually set to 0 by the `readnum` function. When the `while` loop is done, the last line prints `sum`.

Usually, we give the `readnum` function two arguments: a "shape" vector and a file name. The "shape" vector describes the number of values to read and in what form (vector, matrix, etc.) they should be returned. The values are read from the named file. Since the program above gives neither argument, `readnum` simply reads one value from the standard input device.

The `+=` operator adds the value on the right to the variable on the left; the expression `sum+=readnum()` does the same thing as `sum=sum+readnum()`. Every time the `while` loop repeats, `sum` is increased by the value returned by `readnum`. When `readnum` runs out of data, it returns 0 (so `sum` isn't changed) and sets `$read` to 0 (so the `while` loop quits looping).

<span id="IDX107">![](invisible.xbm)</span> Unless you redirect standard input, this program will quietly read what you type until you signal an end-of-file (<span class="kbd">C-d</span> on UNIX systems and <span class="kbd">C-z</span> on VMS).

## <a href="algae_toc.html#TOC6" id="SEC6">Integer Powers</a>

<span id="IDX108">![](invisible.xbm)</span> <span id="IDX109">![](invisible.xbm)</span>

This program illustrates the use of a function. In it, we define the function `power` that computes integer powers of its argument. We also show some Algae code that calls `power`.

    # power:  raise `x' to the `n'-th power
    power = function (x; n)
    {
      local (y);
      y = x;
      while (n > 1)
      {
        y = y * x;
        n -= 1;
      }
      return y;
    };

    power (2; 8)?
    power ([ 1, 2; 2, 3 ]; 4)?

The first line of this program is an ordinary assignment statement, which assigns the function on its right side to the variable `power`. The function's arguments are defined in the parentheses that follow the `function` keyword. In this case, there are two arguments: `x` and `n`.

In Algae, all function arguments are called "by value". When a function is called, it gets copies of what the calling program gave as arguments and can modify them without changing the values retained by the calling program. In the `power` function we decrement `n` each time through the `while` loop, but this has no effect on the calling program.

The `local` statement defines its argument, the variable `y`, as having local scope. This means that `power` has its own temporary variable called `y` that is defined only within that function. This `y` is first given the value of `x` and then, inside the `while` loop, repeatedly multiplied by `x` until `n` is no longer greater than 1.

The value that `power` computes is returned to its caller by the `return` statement. Any expression may follow `return`, and any number of `return` statements may appear in a function. If the function has no return statement, it returns NULL to its caller.

The first time we call `power`, it returns (and the calling program prints) the value 256. In this case `power` is really not very useful, since we could have obtained the same result with the expression `2^8` using Algae's exponentiation operator.

The `power` function does have a use, though, as the second call to it shows. Algae's exponentiation operator performs in an element-by-element sense, so `[1,2;2,3]^4` returns

    [           1         16 ]
    [          16         81 ]

In contrast, `power` performs in a matrix sense. In the program above, it returns

    [          89        144 ]
    [         144        233 ]

The algorithm used in the `power` function above can be improved upon by using successive squaring:

    power = function (x; n)
    {
      if (n == 1)
      {
        return x;
      elseif (n%2)
        return x * self (x; n-1);
      else
        x = self (x; n/2);
        return x * x;
      }
    };

This `power` function might be useful, but it's certainly not ready for prime-time. Notice that it gives wrong answers if `n` is 0 or a negative integer. What happens for the expression `power(4;1/2)`, in which `n` is not an integer? To make `power` more robust you'd probably want to add some `if` statements to check for illegal arguments.

------------------------------------------------------------------------

Go to the [first](algae_1.html), [previous](algae_2.html), [next](algae_4.html), [last](algae_11.html) section, [table of contents](algae_toc.html).
