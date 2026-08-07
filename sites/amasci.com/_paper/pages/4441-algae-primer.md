---
title: "Algae: Primer"
source_domain: amasci.com
source_path: ~ksh/algae/algae_2.html
order: 4441
reachable_from_entry: false
images: 1
internal_links: 7
extracted: 2026-08-07T17:11:13Z
extractor: site_to_paper.py (pandoc)
---

# Algae: Primer

*Source page: `~ksh/algae/algae_2.html`*

<span id="SEC2"></span>

|  |  |  |  |  |  |  |  |  |  |  |
|----|----|----|----|----|----|----|----|----|----|----|
| \[ [\<\<](algae_1.html#SEC1) \] | \[ [\>\>](algae_3.html#SEC3) \] |   |   |   |   |   | \[[Top](algae.html#SEC_Top)\] | \[[Contents](algae_toc.html#SEC_Contents)\] | \[[Index](algae_10.html#SEC57)\] | \[ [?](algae_abt.html#SEC_About) \] |

------------------------------------------------------------------------

# ![](icon.gif) 2. Primer

What follows is a quick introduction to Algae. It shows many simple examples, but leaves out the detailed descriptions. See section [4. The Algae Language](algae_4.html#SEC7), for more details about the Algae language.

The first thing that you'll need to know is how to get `algae` started. If your system is properly set up, it's a simple matter of typing the command `` `algae' ``. This brings `algae` up in interactive mode; a prompt is displayed and it waits for you to start typing statements. Later we'll discuss other options, such as giving `algae` a file of statements to execute in "batch" mode.

This manual is available on-line through the `info` function; type `info()` to view it. You can go to a specific topic by naming it as an argument. For example, `info("operators")` takes you directly to the description of Algae's operators.

<span id="IDX1"></span> <span id="IDX2"></span> <span id="IDX3"></span> <span id="IDX4"></span> <span id="IDX5"></span> <span id="IDX6"></span> <span id="IDX7"></span> <span id="IDX8"></span> An Algae *statement* describes the operations to be performed. For example, the statement

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>1+sin(2)</code></pre></td>
</tr>
</tbody>
</table>

tells Algae to add 1 to the sine of 2. Statements may be terminated with a newline, a semicolon, or a question mark; the results are printed unless a semicolon is used.

The statement

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>printf (&quot;hello, world\n&quot;);</code></pre></td>
</tr>
</tbody>
</table>

prints a hopeful little "hello, world" message to the terminal. This is exactly like the C language, right down to the `` `\n' `` escape sequence to indicate a newline. If you know C, you'll probably notice many other similarities between its syntax and that of Algae.

<span id="IDX9"></span> Like most computer languages, Algae has *variables* to which values can be assigned. In Algae, these variables need not be declared before being used, and may be created or destroyed during a session. If you type the statement `x=1`, the variable `x` will be created if it doesn't already exist. If `x` already had a value, then assignment to `x` destroys its previous contents.

<span id="IDX10"></span> <span id="IDX11"></span> The values taken on by variables are known as *entities*, which have various *classes* such as `` `scalar' ``, `` `vector' ``, `` `matrix' ``, `` `table' ``, etc. A builtin function called `class` returns the class of its argument, so if you make the assignment `x=1` then the statement `class(x)` returns `` `"scalar"' ``.

<span id="IDX12"></span> <span id="IDX13"></span> <span id="IDX14"></span> Notice that a scalar is not the same thing as a one-element vector or as a one-by-one matrix. The builtin functions `scalar`, `vector`, and `matrix` may be used to convert from one to another. For example, `matrix(7)` returns a matrix with one row and one column, its single element having the value 7. Algae will often make these conversions between classes automatically. In the code

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>x = [ 3, 2, 1 ];
y = sort (x);</code></pre></td>
</tr>
</tbody>
</table>

the `sort` function first converts its matrix argument `x` into a vector and then returns another vector with the same elements but sorted in increasing order. (An expression enclosed in brackets defines a matrix, as we'll discuss later.)

<span id="IDX15"></span> <span id="IDX16"></span> <span id="IDX17"></span> <span id="IDX18"></span> <span id="IDX19"></span> Besides its class, an entity may have other attributes which are stored as its *members*. For example, the number of rows in a matrix is stored in a member called "nr". Members are referenced with the "dot" operator, so if `M` is a matrix, then `M.nr` returns its row size. Most entities have one or more predefined members (such as `nr` in matrices) that you cannot directly modify. You can create new members simply by assignment.

A function called `show` prints information about an entity and its members. Another function, `members`, returns a vector containing the names of all the members of its argument.

<span id="IDX20"></span> <span id="IDX21"></span> <span id="IDX22"></span> When a non-existent variable or member is referenced, the special value `NULL` is returned. For example, the line

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>a = 1; a.nr</code></pre></td>
</tr>
</tbody>
</table>

(which consists of two statements) prints "NULL", since scalars do not start life with a member `nr`.

The NULL constant may be used on the right-hand side of assignments, effectively deleting the previous value of an entity. Actually, the entity still exists, but it has the value NULL. You can perform a number of other operations on NULL, such as in

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>if (x != NULL) { x.class? }</code></pre></td>
</tr>
</tbody>
</table>

<span id="IDX23"></span> <span id="IDX24"></span> <span id="IDX25"></span> <span id="IDX26"></span> <span id="IDX27"></span> <span id="IDX28"></span> All array entities (and that includes scalars) have a member called `type`, which may have one of these values: "integer", "real", "complex", or "character". The constant `1` is an integer, but `1.0` has real type. Algae has no complex constant like Fortran does--you have to use an expression such as `sqrt(-1)`. Users often make the assignment `i=sqrt(-1)` when they first start up Algae and then use expressions like `1+2*i` for their complex numbers.

The "character" type refers to a string of characters. It is specified using double-quotes as we did for `"hello world"` above. A character scalar like `"1"` is different than an integer scalar like `1`, and an expression like `1+"1"` is not allowed.

<span id="IDX29"></span> <span id="IDX30"></span> A *vector* is a one-dimensional array of values. For example, `x=1,2,3` specifies a vector with three elements. The elements in a vector are numbered starting at one, and the total number of elements is given by its `ne` member. All of the elements have the same type.

<span id="IDX31"></span> <span id="IDX32"></span> <span id="IDX33"></span> Actually, the comma character is Algae's "append" operator. You can put several expressions together in a vector, as in

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>v = 1, sin(2), 3+4;</code></pre></td>
</tr>
</tbody>
</table>

<span id="IDX34"></span> A "subvector" expression may be used to specify a particular element or elements. You do that simply by following the vector with a *specifier* enclosed in brackets. For example, `v[3]` gives a scalar having the value of the third element of `v`. If the specifier is a scalar, then the result is a scalar; otherwise, the result is a vector.

A more complicated example is

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>aset = 3, 9, 15;
x = v[aset][2];</code></pre></td>
</tr>
</tbody>
</table>

<span id="IDX35"></span> Here, `x` gets the value of the ninth element of `v`. You can also assign to a subvector, so `v[1]=0` sets the first element of `v` to zero.

<span id="IDX36"></span> <span id="IDX37"></span> Vectors have a member `eid` (it stands for *element id*) that contains labels for its elements. You don't need labels (`eid` may be NULL), but they can be pretty useful. For one thing, they can help you to avoid errors by not allowing you to perform certain operations unless the labels match. If you try to add two vectors and they both have labels, then the labels must be identical.

<span id="IDX38"></span> You can also use labels instead of element numbers in a subvector expression. You do this by using character strings as the specifier. For example, the code

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>weight =        172,    216,     188;
weight.eid =  &quot;Tom&quot;, &quot;Dick&quot;, &quot;Harry&quot;;</code></pre></td>
</tr>
</tbody>
</table>

sets up the vector `weight` with character string labels. Then `weight["Dick"]` gives Dick's weight of 216.

<span id="IDX39"></span> <span id="IDX40"></span> <span id="IDX41"></span> <span id="IDX42"></span> <span id="IDX43"></span> Vectors can be generated by using the colon operator. The expression `1:5:2` gives a vector whose first element is `1`, last element is no more than `5`, and has a difference of `2` between each successive element. In other words, `1:5:2` is the same as `1,3,5`. If you leave off the second colon and the third operand, then Algae infers a `1` for the third operand. Thus, if `n=100`, then `1:n` is the vector containing all the integers from `1` through `100`.

<span id="IDX44"></span> A *matrix* is a two-dimensional array of values. The expression `[1,2;3,4;5,6]` specifies a matrix with three rows and two columns--rows are given as vectors and are separated by semicolons.

<span id="IDX45"></span> <span id="IDX46"></span> Submatrix expressions work just like subvector expressions, but with a semicolon to separate the row specifier from the column specifier. The expression `M[3;2,3]` gives a vector containing the elements of `M` in its third row and second and third columns. If both specifiers are scalars, then the result is a scalar. If only one specifier is a scalar, then the result is a vector. Otherwise, the result is a matrix. The members `nr` and `nc` give the number of rows and columns of a matrix.

<span id="IDX47"></span> <span id="IDX48"></span> Matrices have both row and column labels. They're stored in the members `rid` and `cid`, respectively. As with vectors, character strings used as specifiers in submatrix expressions refer to the labels.

<span id="IDX49"></span> <span id="IDX50"></span> A *table* is an entity that simply holds a collection of other entities. For example, the statements

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>x = 1; y = &quot;foo&quot;, &quot;bar&quot;;
t = { x; y };</code></pre></td>
</tr>
</tbody>
</table>

result in a table `t` that contains the scalar `x` and the vector `y`. Instead, we could write

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>t = { x = 1; y = &quot;foo&quot;, &quot;bar&quot; };</code></pre></td>
</tr>
</tbody>
</table>

and get the same table. In the latter case, though, `x` and `y` exist only inside the table.

<span id="IDX51"></span> You can put any class of entity into a table, even another table. The members are referenced with the "dot" operator, just like the other entities. The line `a={u=1;v=2}; a.u+a.v` prints the value 3. You can add two tables (the members of the right-hand table are inserted into the left-hand table) and subtract two tables (the members of the left-hand table having the same name as a member of the right-hand table are removed).

<span id="IDX52"></span> <span id="IDX53"></span> <span id="IDX54"></span> Algae normally executes statements in the order that it receives them, but the control-flow statements `if`, `for`, and `while` can change that. The code

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>if (x &gt; 0) { y = 1/x; }</code></pre></td>
</tr>
</tbody>
</table>

is an example of an `if` statement. The parentheses are required around the test expression. If that expression is "true", then the statements following it are executed. The `if` statement may also have an `elseif` part, an `else` part, or both, so

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>if (x &gt; 0)
{
    printf (&quot;positive&quot;);
elseif (x &lt; 0)
    printf (&quot;negative&quot;);
else
    printf (&quot;zero&quot;);
}</code></pre></td>
</tr>
</tbody>
</table>

prints the sign of `x`. (But you should use the `sign` function, instead.)

<span id="IDX55"></span> <span id="IDX56"></span> <span id="IDX57"></span> <span id="IDX58"></span> <span id="IDX59"></span> <span id="IDX60"></span> <span id="IDX61"></span> <span id="IDX62"></span> <span id="IDX63"></span> <span id="IDX64"></span> <span id="IDX65"></span> <span id="IDX66"></span> <span id="IDX67"></span> <span id="IDX68"></span> <span id="IDX69"></span> <span id="IDX70"></span> <span id="IDX71"></span> As long as only scalars are involved, Algae's relational, equality, and logical operators probably won't surprise you. An expression is `1` if it's true and `0` if it's false. The relational operators are `>`, `>=`, `<`, `<=`. The equality operators are `==` and `!=`. The logical operators are `&`, `|`, and `!`. Two additional logical operators, `&&` and `||`, are special; they are described later.

Where these operators might surprise you is when vectors and matrices are involved. Like most Algae operators, they work on an element-by-element basis. For example, if `A` and `B` are both matrices, then the expression `A==B` has several features:

- `A` and `B` must have the same size.
- Their labels must match.
- The expression returns a matrix with the same size as `A` and `B`, every element of which is either `1` or `0` depending on whether the corresponding elements of `A` and `B` are equal.

You can see, then, that `A==B` doesn't give you a simple true or false answer but rather a matrix of answers.

<span id="IDX72"></span> <span id="IDX73"></span> The `if` statement, however, does need a simple true or false in order to decide whether to execute its statements or not. It does this by recognizing certain entities as false--all others are true. The "false" entities are as follows:

- NULL.
- Numeric entities in which every element is zero.
- Character entities in which every element is `""`.
- Vectors and matrices with no elements.
- Tables with no members.

<span id="IDX74"></span> What gets new users into trouble is a statement like

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>if (A == B) { done = 1; }</code></pre></td>
</tr>
</tbody>
</table>

If `A` and `B` are matrices, then `A==B` returns a matrix of ones and zeros. The `if` statement interprets that as "true" if even one of its elements is nonzero. In words, the above statement starts out "If any element of `A` is equal to the corresponding element of `B`, then <span class="small">...</span>" The difficulty is that the element-by-element "equality" operation is not the same as a test of the equality of two arrays. If the latter test is what you really want, then you should use the `equal` function instead.

On the other hand, the statement

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>if (A != B) { done = 0; }</code></pre></td>
</tr>
</tbody>
</table>

does work in both senses. The expression `A!=B` returns a matrix that has nonzero elements where the corresponding elements of `A` and `B` are unequal. Thus this expression also serves as a test of the inequality of the two arrays.

The `&&` ("and") and `||` ("or") operators are special in two ways: they don't perform element-by-element like the other operators in this section, and they "short-circuit" by skipping evaluation of the second operand if the result is already established by the first operand.

Each operand of `&&` and `||` is evaluated for "truth" in the same way that the `if` test does. For `&&`, if the first operand evaluates to "false" then the second operand is not evaluated and the result of the operation is 0. For `||`, if the first operand evaluates to "true" then the second operand is not evaluated and the result of the operation is 1.

For example, in the expression

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>x != NULL &amp;&amp; x.type == &quot;integer&quot;</code></pre></td>
</tr>
</tbody>
</table>

`x` is first checked to see if it's NULL. If it is, then the first operand of `&&` is 0 and that's also the result of the entire expression. In that case, the member reference `x.type` is never evaluated. This is convenient, since that would otherwise be an error.

An `if` statement such as

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>if (x &lt; tol) { x = tol; }</code></pre></td>
</tr>
</tbody>
</table>

could be written instead as

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>x &lt; tol &amp;&amp; (x = tol);</code></pre></td>
</tr>
</tbody>
</table>

The parentheses are required in the second version, since the precedence of `=` is lower than that of `&&`. Although they accomplish the same thing, the first version is recommended; it is easier to read and executes a bit faster.

<span id="IDX75"></span> <span id="IDX76"></span> Besides `if`, Algae has two other control-flow statements: `while` and `for`. The `while` statement executes a set of statements over and over, as long as a given condition is true. For example, the code

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>a=0; b=1;
while (b &lt; 10000)
{
  c = b;
  b = a+b;
  a = c;
}
c?</code></pre></td>
</tr>
</tbody>
</table>

computes and prints the largest Fibonacci number less than 10000. The interpreter checks to make sure that `b<10000`, executes the statements in the `while` block, and then repeats. The first time that the expression `b<10000` evaluates false, the loop terminates.

<span id="IDX77"></span> <span id="IDX78"></span> <span id="IDX79"></span> The `for` statement also causes looping, but in a different way. Assuming that `v` is a numeric vector, the code

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>for (i in 1:v.ne) { v[i] = 1 / v[i]; }</code></pre></td>
</tr>
</tbody>
</table>

inverts each of its members. Inside the parentheses, the keyword `in` separates an identifier on the left and a vector expression on the right. In this example, the vector expression is `1:v.ne` which contains the integers from 1 to the length of `v`. The `for` loop sets `i` equal to the first element, 1, and then executes the statement `v[i]=1.0/v[i];`. Then `i` is set equal to the second element, and the statement is executed again. This cycle repeats until all of the elements of `1:v.ne` are used.

<span id="IDX80"></span> The previous example also illustrates an important topic concerning both `while` loops and `for` loops. Essentially the same results would be obtained with the statement `v=1/v`. This obviously takes less typing and is easier to read. The really important difference, though, is that it is far more efficient. With the `for` loop, all of the operations (assignment, division, etc.) are performed by the interpreter. Although `algae` is fast, it can't possibly compete with doing the same job in C, as `v=1/v` is. On my computer, it's about 60 times faster.

<span id="IDX81"></span> <span id="IDX82"></span> Sometimes it's convenient to interrupt the execution of `while` and `for` loops. The `continue` statement causes another iteration of the loop to begin immediately. If we wanted to invert the nonzero elements of a vector, we could write

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>for (i in 1:v.ne)
{
  if (v[i] == 0) { continue; }
  v[i] = 1 / v[i];
}</code></pre></td>
</tr>
</tbody>
</table>

<span id="IDX83"></span> The `break` statement goes even further, exiting the loop altogether. For example, we could have written our Fibonacci routine as

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>a=0; b=1;
while (1)
{
  c = b;
  if ((b = a+b) &gt; 10000) { break; }
  a = c;
}
c?</code></pre></td>
</tr>
</tbody>
</table>

The `continue` and `break` statements affect execution of only the innermost enclosing loop.

It's important to note that `continue` and `break` are statements, not expressions. The code

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>x &lt; 0 &amp;&amp; break;</code></pre></td>
</tr>
</tbody>
</table>

is not valid, since the operands of `&&` must be expressions.

<span id="IDX84"></span> <span id="IDX85"></span> <span id="IDX86"></span> <span id="IDX87"></span> <span id="IDX88"></span> <span id="IDX89"></span> <span id="IDX90"></span> Like other computer languages, Algae has *functions*. Some functions (like `sin` and `printf`) are *builtin*, meaning that they are part of the Algae executable file. Others, called *user functions*, are those written in the Algae language. A function is called by giving its name followed by a parenthesized list of *arguments*. The arguments are separated by semicolons, and their values are passed to the function. Since only the values are passed, the function cannot modify the variables that you pass it.

For example, let's assume that you're calling the function `shady`.

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>x = 1;
y = shady (x);</code></pre></td>
</tr>
</tbody>
</table>

The value returned by `shady` is assigned to `y`. You can't tell by looking at it what class of entity (scalar, matrix, etc.) `shady` returns. In fact, that might even change from one call to the next. Rest assured, though, the value of `x` is still 1, no matter what happened in `shady`.

<span id="IDX91"></span> Algae functions are entities--just like scalars and matrices. That means that you can perform operations on them as you do with other entities. For example, the statement

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>my_sin = sin</code></pre></td>
</tr>
</tbody>
</table>

creates a new function called `my_sin` that works just like the original `sin` function. Of course,

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>sin = NULL;</code></pre></td>
</tr>
</tbody>
</table>

gets rid of the `sin` function completely--probably not a very good idea in most cases.

<span id="IDX92"></span> Functions may be defined during an interactive session or simply included from files. As an example, consider writing a function called "findit" that will look through the elements of a vector for a given value, returning the locations where it found it. The following function should do the job:

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>findit = function (s; v)
{
  local (w; i);
  w = vector ();
  for (i in 1:v.ne)
  {
    if (v[i] == s) { w = w, i; }
  }
  return w;
}</code></pre></td>
</tr>
</tbody>
</table>

<span id="IDX93"></span> <span id="IDX94"></span> <span id="IDX95"></span> (The builtin function `find` does this job much more efficiently.) The `local` statement declares its arguments as having local scope. For example, the assignment to `w` would have no effect outside this function. Without the `local` declaration, the assignment would change the value of `w` globally.

<span id="IDX96"></span> <span id="IDX97"></span> The `return` statement causes execution of the function to terminate and passes it's expression as the function's return value. Recursive calls to a function are no problem. For example, we could write a function to compute factorials as

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>fact = function (n)
{
  if (n &lt; 2) { return 1.0; else return n * fact (n-1); }
}</code></pre></td>
</tr>
</tbody>
</table>

<span id="IDX98"></span> This function has one slight problem. (Several, really, if you consider that it does no error checking.) If we later decide to change its name by typing `factorial=fact`, it still calls function `fact` internally. Now if we're really mean-spirited we can change `fact` as in `fact=sin`; now `factorial` gives wrong answers. The way to handle this is to call the function `self` when you make a recursive function call, as in

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>fact = function (n)
{
  if (n &lt; 2) { return 1.0; else return n * self (n-1); }
}</code></pre></td>
</tr>
</tbody>
</table>

The `self` keyword refers to the current function. Besides recursive function calls, it's also useful for keeping data local to a function. For example, consider a function that returns the "shape" of its argument:

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>shape = function (x)
{
  return self.(class(x)) (x);
};
&#10;shape.scalar = function (x) { return NULL; };
shape.vector = function (x) { return x.ne; };
shape.matrix = function (x) { return x.nr, x.nc; };</code></pre></td>
</tr>
</tbody>
</table>

This `shape` function determines the class of its argument and then calls the appropriate member function. (The standard `shape` function additionally provides some error checking.)

<span id="Examples"></span>

------------------------------------------------------------------------

|  |  |  |  |  |  |  |  |  |  |  |
|----|----|----|----|----|----|----|----|----|----|----|
| \[ [\<\<](algae_1.html#SEC1) \] | \[ [\>\>](algae_3.html#SEC3) \] |   |   |   |   |   | \[[Top](algae.html#SEC_Top)\] | \[[Contents](algae_toc.html#SEC_Contents)\] | \[[Index](algae_10.html#SEC57)\] | \[ [?](algae_abt.html#SEC_About) \] |

\
This document was generated by *K. Scott Hunziker* on *October, 31 2001* using [*texi2html*](http://www.mathematik.uni-kl.de/~obachman/Texi2html%0A)
