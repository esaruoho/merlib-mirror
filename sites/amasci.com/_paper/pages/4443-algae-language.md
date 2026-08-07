---
title: "Algae: Language"
source_domain: amasci.com
source_path: ~ksh/algae/algae_4.html
order: 4443
reachable_from_entry: false
images: 1
internal_links: 34
extracted: 2026-08-07T17:11:13Z
extractor: site_to_paper.py (pandoc)
---

# Algae: Language

*Source page: `~ksh/algae/algae_4.html`*

<span id="SEC7"></span>

|  |  |  |  |  |  |  |  |  |  |  |
|----|----|----|----|----|----|----|----|----|----|----|
| \[ [\<\<](algae_3.html#SEC3) \] | \[ [\>\>](algae_5.html#SEC35) \] |   |   |   |   |   | \[[Top](algae.html#SEC_Top)\] | \[[Contents](algae_toc.html#SEC_Contents)\] | \[[Index](algae_10.html#SEC57)\] | \[ [?](algae_abt.html#SEC_About) \] |

------------------------------------------------------------------------

# ![](icon.gif) 4. The Algae Language

In Algae, variables and operators combine to form expressions and statements. The rules for this are mostly conventional; for example, the statement `a=b+c` means that the sum of `b` and `c` is assigned to the variable `a`. In Algae, however, the concept of addition (as well as many other operations) is expanded to include operations between a variety of data classes.

> |                                       |     |     |
> |:--------------------------------------|-----|:----|
> | [4.1 Entities](algae_4.html#SEC8)     |     |     |
> | [4.2 Variables](algae_4.html#SEC9)    |     |     |
> | [4.3 Operators](algae_4.html#SEC14)   |     |     |
> | [4.4 Expressions](algae_4.html#SEC32) |     |     |
> | [4.5 Statements](algae_4.html#SEC33)  |     |     |
> | [4.6 Functions](algae_4.html#SEC34)   |     |     |

<span id="Entities"></span>

------------------------------------------------------------------------

<span id="SEC8"></span>

## 4.1 Entities

The basic unit of data in Algae is the *entity*. Every entity has an attribute called its *class* which describes it as a "scalar", "vector", "matrix", etc. The built-in function `class` returns the class of its argument as a character string. Thus

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>x = 1.2E3; class(x)?</code></pre></td>
</tr>
</tbody>
</table>

prints "scalar" and

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>class (cos)?</code></pre></td>
</tr>
</tbody>
</table>

prints "function". Naturally, the statement

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>class (class (log))?</code></pre></td>
</tr>
</tbody>
</table>

prints "scalar", since `class` returns a scalar character string.

<span id="IDX100"></span> <span id="IDX101"></span> Entities also contain *members*, in which various additional attributes of the entity are stored. For example, matrix entities have members such as `type`, `density`, and `symmetry`. These members are themselves entities, so it is not unusual to have several levels of membership (a member of a member of a member). See section [5. Data](algae_5.html#SEC35), for a description of the various classes.

<span id="IDX102"></span> The "dot" operator is used to refer to members. The statements

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>x = 1; x.type?</code></pre></td>
</tr>
</tbody>
</table>

print "integer", the value of the `type` member in `x`. The line

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>foo = 1492; foo.bar?</code></pre></td>
</tr>
</tbody>
</table>

prints "NULL", since scalars don't contain a `bar` member when they're created. You could give it one, of course:

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>foo.bar = &quot;Columbus&quot;</code></pre></td>
</tr>
</tbody>
</table>

<span id="Variables"></span>

------------------------------------------------------------------------

<span id="SEC9"></span>

## 4.2 Variables

A *variable* is a symbol that refers to a named entity; the entity is known as the symbol's *value*. A variable comes into being when a value is assigned to it; there are no explicit declarations.

> |                                                     |     |     |
> |:----------------------------------------------------|-----|:----|
> | [4.2.1 Variable Names](algae_4.html#SEC10)          |     |     |
> | [4.2.2 Evaluation of Variables](algae_4.html#SEC11) |     |     |
> | [4.2.3 Scope of Variables](algae_4.html#SEC12)      |     |     |
> | [4.2.4 Predefined Variables](algae_4.html#SEC13)    |     |     |

<span id="Variable Names"></span>

------------------------------------------------------------------------

<span id="SEC10"></span>

### 4.2.1 Variable Names

<span id="IDX103"></span> Variables have names consisting of letters, digits, dollar signs (<span class="kbd">\$</span>) and underscores (<span class="kbd">\_</span>). A variable name cannot begin with a digit. Variable names are case sensitive, so the variables `foo` and `Foo` are distinct.

<span id="IDX104"></span> We generally use names that begin with <span class="kbd">\$</span> to refer to global variables that are set at startup or that have some kind of side effect. For example, the variable `$beep` acts like any other variable, but also control's `algae`'s sound effects. The `who` function does not report variables that begin with <span class="kbd">\$</span> unless you give it the argument `"$"`.

<span id="IDX105"></span> <span id="IDX106"></span> <span id="IDX107"></span> One variable name is special--the variable `$$` refers to the global symbol table. For example,

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>a = &quot;x&quot;;
$$.(a)</code></pre></td>
</tr>
</tbody>
</table>

prints the value of the global variable `x`. You can use `$$` like any other variable, except that you cannot reassign its value.

<span id="IDX108"></span> The only limitation on the length of a variable name is that it must have at least one character. Short names are convenient for interactive work, but longer, descriptive names have advantages in functions and scripts.

<span id="Evaluation"></span>

------------------------------------------------------------------------

<span id="SEC11"></span>

### 4.2.2 Evaluation of Variables

When a variable name is encountered in an expression, it is evaluated by replacing the variable name with the corresponding named entity. If it is an argument to a function, then a copy is made (conceptually, if not in fact) and passed to the function. Thus, in a function call like `func(a)` (see section [4.6 Functions](algae_4.html#SEC34)), the function `func` only gets a copy of `a` and can't modify the `a` belonging to its caller.

There is one exceptional case, involving the "dot" operator, in which an identifier is not evaluated as a variable name. An identifier on the right side of a member expression is taken literally as the name of the member. For example, the statement

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>v.type</code></pre></td>
</tr>
</tbody>
</table>

prints the value of `v`'s member called `type`. You could well have a variable named `type`, but it would not affect the member expression above.

Alternatively, the statement

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>v.(type)</code></pre></td>
</tr>
</tbody>
</table>

has an expression to the right of the "dot" operator, not a simple identifier, and so prints the value of the member of `v` named by the variable `type`.

<span id="Scope"></span>

------------------------------------------------------------------------

<span id="SEC12"></span>

### 4.2.3 Scope of Variables

Variables referenced from within functions are global in scope unless they are arguments to the function or are declared local with the `local` statement. For example, the function

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>init = function ()
{
  i = sqrt (-1);
  e = exp (1);
  pi = acos (-1);
};</code></pre></td>
</tr>
</tbody>
</table>

could be used to initialize some commonly used variables. Once you executed `init()`, the variables `i`, `e`, and `pi` would be globally defined.

At the same time, you could have another function

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>egg_hunt = function (v)
{
  local (i);
  for (i in 1:v.ne)
  {
    if (v[i] == 0) { return i; }
  }
}</code></pre></td>
</tr>
</tbody>
</table>

in which `i` has local scope. Here, you can't modify or even get the value of the global variable `i`.

<span id="Predefined Variables"></span>

------------------------------------------------------------------------

<span id="SEC13"></span>

### 4.2.4 Predefined Variables

Several variables are already defined for you when `algae` starts up. Some of these are used to control `algae`, and some provide you information. The predefined variables are:

`$beep`  
If this variable is "true" (that is, `test($beep)` returns 1), then error messages include a BEL character. This causes most terminals to beep. On startup, `$beep` is 0.

<span id="IDX110"></span>

`$pid`  
On startup, `$pid` contains the "process id" of the `algae` process.

`$program`  
On startup, `$program` gives the name of the current `algae` program. This will normally be `"algae"`. It would be different if, for example, you had changed the name of the `algae` executable.

<span id="IDX111"></span>

`$prompt`  
This variable controls `algae`'s interactive prompt. It is expected to be a character vector with two elements--on startup it is

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>(  &quot;&gt; &quot;, &quot;  &quot; )</code></pre></td>
</tr>
</tbody>
</table>

The first element is `algae`'s first-level prompt. When `algae` is waiting for another line of input before it executes what it has already seen, it presents its second-level prompt. The second element of `$prompt` defines this second-level prompt. If `algae` can't make sense of `$prompt`'s value, it does without a prompt.

`$read`  
The `$read` variable is set as a side-effect of the `readnum` function. It reports the number of values read in the last call to `readnum`.

<span id="IDX112"></span> <span id="IDX113"></span> <span id="IDX114"></span>

`$term_width`  
This variable tells `algae` the width of your terminal in characters. `algae` will attempt to adjust its display to fit within this width. On startup, `algae` will attempt to sense this on its own. If `term_width` is set to 0, `algae` will not wrap lines.

`help`  
This is simply a character scalar that provides a few basic instructions for using `algae`.

You may wish to set some of these variables (like `$beep` or `$prompt`) every time you use `algae`. This is conveniently done by putting the assignments in the `` `.algae' `` file in your home directory.

<span id="Operators"></span>

------------------------------------------------------------------------

<span id="SEC14"></span>

## 4.3 Operators

Algae has unary, binary, and ternary operators to perform a variety of operations. The standard arithmetic operators (`` `+' ``, `` `-' ``, `` `*' ``, `` `/' ``, etc.) are available and have the usual precedence. The caret `` `^' `` is for exponentiation: 8^2 equals 64. The single quote character `` `'' `` denotes the conjugate transpose.

With a few exceptions, all operators work in the "element by element" sense. For example, if `A` and `B` are matrices with the same size, then `A/B` returns a matrix, each element of which is the quotient of the corresponding elements of `A` and `B`. The `` `*' `` operator works in an "inner product" sense, so `A*B` is a matrix multiplication. The `` `@' `` operator is Algae's "element by element" multiplication operator.

<span id="IDX115"></span> <span id="IDX116"></span> <span id="IDX117"></span> When an operator has array operands of different types, one will be automatically converted so that they have a common type, if possible. An `integer` may be converted to `real` or `complex`, and a `real` may be converted to `complex`. No conversion to or from `character` type is possible.

Unlike some other languages, the result of an operation in Algae may have a type that is different than its operands. For example, the result of `1/2` has `real` type, even though its operands have type `integer`. Another example is `(-1)^0.5`, which returns a complex number.

<span id="IDX118"></span> <span id="IDX119"></span> <span id="IDX120"></span> With the exception of `*`, if a binary operator has both a `vector` and a `matrix` as its operands the `vector` is converted to a `matrix` before the operation is performed. Upon conversion, a vector becomes a matrix with one row. For example, in the statement

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>( 1, 2 ) + [ 3, 4 ]</code></pre></td>
</tr>
</tbody>
</table>

the left-hand operand of `+` is the vector `(1,2)`. This is converted to a `matrix` before being added to `[3,4]`.

<span id="IDX121"></span> <span id="IDX122"></span> <span id="IDX123"></span> <span id="IDX124"></span> The following table summarizes the precedence and associativity of Algae's operators. Those shown on the same line have equal precedence, and the rows are in order of decreasing precedence.

**operators**  
**associativity**

`()` `[]` `.`  
left to right

`'`  
right to left

`^`  
right to left

`!` `+` `-`  
(unary) left to right

`*` `/` `%` `@`  
left to right

`+` `-`  
(binary) left to right

`<` `>` `<=` `>=` `==` `!=`  
left to right

`&`  
left to right

`|`  
left to right

`&&`  
left to right

`||`  
left to right

`:`  
left to right

`,`  
left to right

`=` `+=` `-=` `*=` `/=` `@=` `%=`  
right to left

> |  |  |  |
> |:---|----|:---|
> | [4.3.1 Function Calls](algae_4.html#SEC15) |    | `` `()' `` |
> | [4.3.2 Element References](algae_4.html#SEC16) |    | `` `[]' `` |
> | [4.3.3 Member References](algae_4.html#SEC17) |    | `` `.' `` |
> | [4.3.4 Transpose](algae_4.html#SEC18) |    | `` `'' `` |
> | [4.3.5 Power](algae_4.html#SEC19) |    | `` `^' `` |
> | [4.3.6 Not](algae_4.html#SEC20) |    | `` `!' `` |
> | [4.3.7 Negation](algae_4.html#SEC21) |    | `` `+' `` and `` `-' `` (unary) |
> | [4.3.8 Multiplication](algae_4.html#SEC22) |    | `` `*' ``, `` `/' ``, `` `%' ``, and `` `@' `` |
> | [4.3.9 Addition](algae_4.html#SEC23) |    | `` `+' `` and `` `-' `` (binary) |
> | [4.3.10 Relation](algae_4.html#SEC24) |    | `` `<' ``, `` `>' ``, `` `<=' ``, `` `>=' ``, `` `==' ``, and `` `!=' `` |
> | [4.3.11 And](algae_4.html#SEC25) |    | `` `&' `` |
> | [4.3.12 Or](algae_4.html#SEC26) |    | `` `|' `` |
> | [4.3.13 Short And](algae_4.html#SEC27) |    | `` `&&' `` |
> | [4.3.14 Short Or](algae_4.html#SEC28) |    | `` `||' `` |
> | [4.3.15 Generate](algae_4.html#SEC29) |    | `` `:' `` |
> | [4.3.16 Append](algae_4.html#SEC30) |    | `` `,' `` |
> | [4.3.17 Assign](algae_4.html#SEC31) |    | `` `=' ``, `` `+=' ``, `` `-=' ``, `` `*=' ``, `` `/=' ``, `` `@=' ``, and `` `%=' `` |

<span id="Call"></span>

------------------------------------------------------------------------

<span id="SEC15"></span>

### 4.3.1 Function Calls

Functions are called in the usual way: the function reference is followed by a list of arguments. For example,

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>w = union (u; v);</code></pre></td>
</tr>
</tbody>
</table>

calls the function `union`, passing it the values of `u` and `v` for arguments. The value returned by the function's `return` statement (or NULL if it doesn't have one) is the value of the function call.

<span id="IDX125"></span> The arguments may be any expressions, and are separated by semicolons. The called function gets only the values of the expressions you give it as arguments, so it can't modify the variables that you give it.

From its definition, the function knows how many arguments to expect. Passing too many arguments is an error. If you pass fewer arguments than the function definition calls for, NULL's are passed in place of the missing ones.

<span id="IDX126"></span> Besides their use in function calls, parentheses are used for several other purposes, including grouping expressions, `if`, `for`, and `while` conditions, function definitions, etc.

<span id="Element"></span>

------------------------------------------------------------------------

<span id="SEC16"></span>

### 4.3.2 Element References

The element reference operation returns specified vector elements or matrix rows and columns. Applied to a table, the operation is performed on each of the table's members.

Elements are referenced by following a vector or matrix expression with a bracket-enclosed list of the desired elements. For vector `v`, the expression `v[w]` gives the elements specified by `w`. The expression within the brackets is expected to be a scalar or a vector--if it's a matrix, it will be converted into a vector if possible. So, for example,

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>v[3:8]</code></pre></td>
</tr>
</tbody>
</table>

prints the third through eighth elements of `v`. If the vector inside the brackets has a numeric type, then it is converted to integer if necessary (by taking the real part and rounding) and then used to refer to the element numbers.

The class of the element reference expression is determined by the class of the specifiers. Once any matrix specifiers are converted to vectors, the dimension of the result is equal to the sum of the dimensions of the specifiers. For example, `M[1;2]` is a scalar, `M[[1];2]` and `M[1;[2]]` are vectors, and `M[[1];[2]]` is a matrix. Notice that the class of the result does not depend on the class of the original entity.

If the vector inside the brackets has character type, then it is taken to refer to the element labels instead of the element numbers. For example, if you set `x` as

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>x = 1:3;
x.eid = &quot;this&quot;, &quot;that&quot;, &quot;other&quot;;</code></pre></td>
</tr>
</tbody>
</table>

then `x["that"]` returns 2, the value of the element of `x` having the label `"that"`. If the labels do not have character type, they are temporarily converted to character type for the comparison.

Element references work the same way for matrices, except that both rows and columns are specified. For example,

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>M[ 1,3; 7:12 ]</code></pre></td>
</tr>
</tbody>
</table>

specifies rows 1 and 3, columns 7 through 12, of the matrix `M`.

The specifiers need not be irredundant. For example, `M[1,1,1;]` returns three copies of the first row of `M`.

Besides their use for element references, brackets are also used to form matrices.

<span id="Member"></span>

------------------------------------------------------------------------

<span id="SEC17"></span>

### 4.3.3 Member References

Members of an entity are referenced with the "dot" operator. For example, `x.type` returns the value of `x`'s member `type`. Notice that, if the right-hand operand is an identifier, then it is taken literally as the name of the desired member. You might have a variable called `type`, but that is irrelevant when it comes to evaluating `x.type`.

On the other hand, if the right-hand operand is an expression, then its value (converted to a character scalar) is taken as the desired member name. Since you can change an identifier into an expression simply by enclosing it in parentheses, the expression `x.(type)` does use the value of the variable `type` as the name of the member.

<span id="IDX127"></span> <span id="IDX128"></span> Member names do not share the same limitations as variable names. In fact, any string of ASCII characters (excluding NUL) will work. This can be pretty useful. For example, you could set up a "vector" of entities (of any class) as in

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>V = {};
V.(1) = A;
V.(2) = B;
V.(3) = C;
V.(4) = D;</code></pre></td>
</tr>
</tbody>
</table>

and then refer to the individual "elements" (that is, the members of `V`) by number. You could handle multiple dimensions by referring to element `"3,2,4"`, for example.

<span id="Transpose"></span>

------------------------------------------------------------------------

<span id="SEC18"></span>

### 4.3.4 Transpose

The transpose operator applies the conjugate transpose operation to a matrix. For integer, real, and character types, this means moving every element from row `i` and column `j` to row `j` and column `i`. If the matrix has complex type, the complex conjugate operation is applied as well.

If you want the transpose of a complex matrix `M`, and not its conjugate transpose, then use the expression `conj(M')`.

If transpose is applied to a scalar or vector, the entity is first converted to a matrix and then transposed. For example, `(1,2)'` is the same as `[1;2]`---the vector is first converted into a matrix with one row and then transposed to form a matrix with one column.

If this operator is applied to a table, then the operation is performed on each member of that table.

<span id="Power"></span>

------------------------------------------------------------------------

<span id="SEC19"></span>

### 4.3.5 Power

The "power" operator `` `^' `` is a binary operator that raises its left operand to the power of its right operand. Thus `2^3` gives 8. It associates right-to-left, so the expressions `x^y^z` and `x^(y^z)` are equivalent.

When vectors and matrices are involved, the "power" operator performs in an "element-by-element" sense. For example, if `M` is a matrix, then `M^2` squares each element of `M`. This is definitely not the same thing as `M*M`!

In an expression such as `2^M`, where the left operand is scalar and the right operand is a vector or matrix, the result has each element `i` of `M` replaced by `2^M[i]`. For example,

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>2^(0:3)</code></pre></td>
</tr>
</tbody>
</table>

prints the vector `(1,2,4,8)`.

Notice that the precedence of `` `^' `` is higher than `` `-' ``, so the expression `-1^2` returns `-1`.

In mathematical usage, `0^0` is undefined--it yields an error in `algae`.

If both left and right operands are arrays, then they must have matching dimensions and labels.

If this operator is applied to a table, then the operation is performed on each member of that table.

<span id="Not"></span>

------------------------------------------------------------------------

<span id="SEC20"></span>

### 4.3.6 Not

The `` `!' `` operator is a unary, prefix operator that returns 1 if its operand is considered "false", and 0 otherwise. The "false" operands are:

- NULL.
- Numeric entities in which every element is zero.
- Character entities in which every element is `""`.
- Vectors and matrices with no elements.
- Tables with no elements.

If this operator is applied to a table, then the operation is performed on each member of that table.

<span id="Negation"></span>

------------------------------------------------------------------------

<span id="SEC21"></span>

### 4.3.7 Negation

The unary negation operator `` `-' `` multiplies its numeric argument by `-1`. The `` `+' `` operator is for user convenience--Algae ignores it in its unary context. For example, `+-1` gives a negative one. On the other hand, `1+-1` and `1-+1` both return 0.

If one of these operators is applied to a table, then that operation is performed on each member of the table.

<span id="Multiplication"></span>

------------------------------------------------------------------------

<span id="SEC22"></span>

### 4.3.8 Multiplication

Both the `` `*' `` and the `` `@' `` operators perform multiplication. The difference is that `` `@' `` performs in an element-by-element sense, while `` `*' `` performs in an inner product sense. The operands of `` `@' `` must have matching dimensions and labels; each element of its left operand is multiplied by the corresponding element of the right operand. For example,

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>( 1, 2, 3 ) @ ( 4, 5, 6 )</code></pre></td>
</tr>
</tbody>
</table>

returns the vector `(4,10,18)`.

When `` `*' `` is applied to matrices, the number of columns of the left operand must equal the number of rows of the right operand, and the corresponding labels must match. The result is a matrix that has the same number of rows as the left operand and the same number of columns as the right operand.

If one of the operands of `` `*' `` is a vector and the other is a matrix, the vector is (conceptually) converted to a matrix before the multiplication is performed. If on the left, it is converted to a matrix with one row; if on the right, it is converted to a matrix with one column.

Multiplication of two vectors gives their inner product.

<span id="IDX129"></span> <span id="IDX130"></span> The `` `/' `` operator performs division. Like `` `@' ``, it performs in an element-by-element sense.

If either operand of any of these operators is a scalar, then the operation is performed in an element-by-element sense. For example

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>2*(1,2,3)</code></pre></td>
</tr>
</tbody>
</table>

gives `(2,4,6)`---every element of the vector is multiplied by the scalar.

<span id="IDX131"></span> <span id="IDX132"></span> The `` `%' `` operator performs the modulus operation, producing the remainder when the left operand is divided by the right operand. For example, `(2,2.5,3)%2` returns the vector `(0,0.5,1)`.

The result has the same sign as the left operand. If this operator is applied to a table, then the operation is performed on each member of the table.

<span id="Addition"></span>

------------------------------------------------------------------------

<span id="SEC23"></span>

### 4.3.9 Addition

The "addition" operators are the binary operators `` `+' `` and `` `-' ``. If their operands are numeric, then they perform the normal addition and subtraction operations.

<span id="IDX133"></span> <span id="IDX134"></span> <span id="IDX135"></span> When the `` `+' `` operator is applied to character strings, it catenates them. The `` `-' `` operator is not defined for character strings.

Between two tables, `` `+' `` combines their members in the resulting table. Conceptually, the members of the left operand are inserted in this new table first, followed by the members of the right operand. This means that if the operands have a member with the same name, the value of that member in the resulting table comes from the right operand. For example, if `t` is a table that contains the member "foo", then the result of

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>t + { foo = NULL }</code></pre></td>
</tr>
</tbody>
</table>

is identical to `t` except that its member "foo" has the value NULL.

When the `` `-' `` operator is applied to tables, the result is a table that has all the members of the left operand except those that are also in the right operand. For example

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>{x;y;z}-{x;y}</code></pre></td>
</tr>
</tbody>
</table>

returns a table that has the single member "z".

If just one of the operands is a table, then the operation is performed between the other operand and each member of the table.

<span id="Relation"></span>

------------------------------------------------------------------------

<span id="SEC24"></span>

### 4.3.10 Relation

The relation operators `` `<' ``, `` `>' ``, `` `<=' ``, `` `>=' ``, `` `==' ``, and `` `!=' `` return "true" (1) or "false" (0) to reflect the truth of the expression. For example,

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>(1:5) &lt; 3</code></pre></td>
</tr>
</tbody>
</table>

returns `(1,1,0,0,0)`.

If both operands are arrays, then their dimensions and labels must match.

Unlike most of the operators, `` `==' `` and `` `!=' `` allow NULL as an operand. In that case, the other operand is simply checked to see if it is or is not a NULL.

If one of these operators is applied to a table, then that operation is performed on each member of the table.

<span id="And"></span>

------------------------------------------------------------------------

<span id="SEC25"></span>

### 4.3.11 And

The `` `&' `` operator performs the logical "and" operation in an element-by-element sense. For example,

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>x = 1:5;
x &gt; 2 &amp; x &lt; 4</code></pre></td>
</tr>
</tbody>
</table>

prints `(0,0,1,0,0)`.

If this operator is applied to a table, then the operation is performed on each member of that table.

<span id="Or"></span>

------------------------------------------------------------------------

<span id="SEC26"></span>

### 4.3.12 Or

The `` `|' `` operator performs the logical "or" operation in an element-by-element sense. For example,

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>x = 1:5;
x &lt; 2 | x &gt; 4</code></pre></td>
</tr>
</tbody>
</table>

prints `(1,0,0,0,1)`.

If this operator is applied to a table, then the operation is performed on each member of that table.

<span id="Short And"></span>

------------------------------------------------------------------------

<span id="SEC27"></span>

### 4.3.13 Short And

The `` `&&' `` operator performs the "short-circuit" logical "and" operation. Both operands are evaluated for "truth" as if they were the test of an `if` statement. If the left operand is "false", then the right operand is not evaluated. If both operands are "true", the result of the operation is 1; otherwise the result is 0. Note that this operation is quite different from that of the `` `&' `` operator, which works element-by-element.

The following example code is from the `solve` function:

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>if (options != NULL &amp;&amp; members (options) == &quot;pos&quot;)
{
  A = chol (A);
else
  A = factor (A);
}</code></pre></td>
</tr>
</tbody>
</table>

The variable `options` is first checked to see if it's NULL. Only if it is not NULL is the `member` function called. That's just what we want, since it would be an error to call `member` with a NULL argument.

<span id="Short Or"></span>

------------------------------------------------------------------------

<span id="SEC28"></span>

### 4.3.14 Short Or

The `` `||' `` operator performs the "short-circuit" logical "or" operation. Both operands are evaluated for "truth" as if they were the test of an `if` statement. If the left operand is "true", then the right operand is not evaluated. If either operand is "true", the result of the operation is 1; otherwise the result is 0. Note that this operation is quite different from that of the `` `|' `` operator, which works element-by-element.

In the statement

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>if (options == NULL || options.tol == NULL) { tol = 1e-6; }</code></pre></td>
</tr>
</tbody>
</table>

the variable `options` is first checked to see if it's NULL. Only if it is not NULL is the member reference `options.tol` evaluated.

<span id="Generate"></span>

------------------------------------------------------------------------

<span id="SEC29"></span>

### 4.3.15 Generate

Numeric vectors may be generated with the `` `:' `` operator. An expression like `i:j` generates a vector that starts with the value of `i`. If `j` is greater than `i`, each successive element is 1 greater than the previous one, with the last element less than or equal to `j`. If `j` is less than `i`, each successive element is 1 less than the previous one, with the last element greater than or equal to `j`.

The `` `:' `` operator also has a ternary form, as in `i:j:k`. This does the same thing as `i:j` except that successive elements differ by `k` instead of 1.

For complex operands, the operation can be described conceptually in the complex plane. A line is drawn between the points `i` and `j`. Then the resulting vector contains the points located on that line segment beginning at `i`, proceeding toward `j`, spaced a distance `k` (or 1, if `k` is not given) apart.

<span id="Append"></span>

------------------------------------------------------------------------

<span id="SEC30"></span>

### 4.3.16 Append

The `` `,' `` operator "appends" its operands. If the operands are vectors, then the result is a new vector containing both the operands. If the operands are matrices, then the result is a new matrix containing the left operand on the left and the right operand on the right.

If this operator is applied to a table, then the operation is performed on each member of that table.

<span id="Assign"></span>

------------------------------------------------------------------------

<span id="SEC31"></span>

### 4.3.17 Assign

The assignment operators are `` `=' ``, `` `+=' ``, `` `-=' ``, `` `*=' ``, `` `/=' ``, `` `@=' ``, and `` `%=' ``. The `` `=' `` operator returns the value of the right operand, setting the left operand to that value in the process. For example,

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>a = b = c = 1;</code></pre></td>
</tr>
</tbody>
</table>

assigns 1 to the variables `a`, `b`, and `c`. The assignment operators associate right to left, so first `c` is given the value 1. The result of that expression, `c = 1`, is 1, so that value is used with `b` as if it read `b = 1`.

Notice that a test like

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>if (i = j) ...</code></pre></td>
</tr>
</tbody>
</table>

is entirely different than

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>if (i == j) ...</code></pre></td>
</tr>
</tbody>
</table>

In the first example, `i` is assigned the value of `j` and then that value is tested by the `if` statement. In the second example, the `if` statement tests the equality of `i` and `j`. So if `i` is 1 and `j` is 2, the first example tests true (as well as changing the value of `i`) and the second one tests false.

Individual elements of an array may be changed; for example

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>x[3;4:6] = 0, 0, 0;</code></pre></td>
</tr>
</tbody>
</table>

sets to 0 the elements of `x` in row 3 and columns 4 through 6. The right operand is converted to the same type as the left operand, if possible, and the dimensions must agree. However, if the right operand is a scalar, then it is filled to the appropriate size. Thus, the previous example could just as well be written

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>x[3;4:6] = 0;</code></pre></td>
</tr>
</tbody>
</table>

One more thing about array assignments: If the variable on the left is a vector, but you specify two dimensions for it, then that variable will be converted into a matrix. Likewise, if the variable on the left is a matrix, but you specify only one dimension, then it will be converted into a vector. For example, in the code

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>A = B = [ 1, 2, 3 ];
A[2] = B[;2] = 9;</code></pre></td>
</tr>
</tbody>
</table>

`A` and `B` both begin as matrices. The second element of each array is then changed to 9. In the end, though, `A` is changed to a vector because only one dimension was given for it. `B` remains as a matrix.

The other assignment operators (`` `+=' ``, `` `-=' ``, etc.) are simply for convenience. The expression `i+=j` means the same thing as `i=i+j`, and `i-=j` means the same thing as `i=i-j`. If the left-hand side is an expression, you should keep in mind that it will be evaluated twice. For example,

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>x[ func() ] += 1</code></pre></td>
</tr>
</tbody>
</table>

will actually make two calls to the function `func`.

<span id="Expressions"></span>

------------------------------------------------------------------------

<span id="SEC32"></span>

## 4.4 Expressions

Assignments are made in the normal fashion: `a=5` sets the variable `` `a' `` to contain the scalar 5. Variables are not declared prior to use, but rather take on the structure and type of whatever is assigned to them. You could, for example, enter

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>a=1;
a=[a,a];</code></pre></td>
</tr>
</tbody>
</table>

in which case the variable `` `a' `` is first a scalar and then a matrix. A list of the previously defined variables (except functions) is given by the `` `who()' `` function, and a variable can be deleted by assigning NULL to it.

In addition to simple variables, elements and members can also be specified on the left hand side of an assignment. For example, the statement

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>A[ 1:4; 1:4 ] = 3;</code></pre></td>
</tr>
</tbody>
</table>

assigns 3 to all of the elements of the first 4-by-4 partition of matrix `` `A' ``, leaving the other elements of `A` unchanged. Values can be assigned to members in the same way. For example, the statements

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>A = [ 1,2,3; 4,5,6 ];
time = [ 1.1, 2.2, 3.3 ];
A.rid = [ &quot;first&quot;; &quot;second&quot; ]
A.cid = time</code></pre></td>
</tr>
</tbody>
</table>

assign the row and column labels of `` `A' ``.

<span id="Statements"></span>

------------------------------------------------------------------------

<span id="SEC33"></span>

## 4.5 Statements

Statements are terminated by a question mark, a semicolon, or a newline. Using a question mark or newline causes the value of the statement to be printed; with a semicolon the printing is suppressed. A newline terminates a statement only if it does not occur within parentheses, brackets, or braces.

Statement termination is implied by the closing brace of an "if", "for", or "while" statement or "function" expression. Printing is enabled when the terminator is implied. For example,

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>for (i in 1:10) { i }</code></pre></td>
</tr>
</tbody>
</table>

prints all of the integers from 1 to 10.

<span id="IDX136"></span> <span id="IDX137"></span> <span id="IDX138"></span> When real or complex numbers are printed, `algae` prints 4 significant digits by default. This can be changed with the `digits` function.

<span id="IDX139"></span> <span id="IDX140"></span> Comments are introduced with the `` `#' `` character. That character and any that follow it on the same line are ignored (excluding the newline).

<span id="Functions"></span>

------------------------------------------------------------------------

<span id="SEC34"></span>

## 4.6 Functions

Functions are defined by a function expression, which consists of the keyword "function", followed by a parenthesized list of arguments, followed by a set of statements enclosed by braces. For example, Algae's `max` function is defined by something like

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>max = function (x) { return x[imax(x)]; };</code></pre></td>
</tr>
</tbody>
</table>

Functions are just another class of entity; the statement above defines a function and then assigns it to the variable `max`.

<span id="IDX141"></span> The arguments are variables that are local to the function. On entry, they take on the values of the formal arguments in the calling expression. Passing more arguments than are in the function's definition is an error. If fewer arguments are passed, then NULL's are passed in place of the missing arguments.

<span id="IDX142"></span> The function reference needn't be an identifier--a function expression works just fine. For example,

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td> </td>
<td class="example"><pre><code>child = (his_functions + her_functions).reproduce();</code></pre></td>
</tr>
</tbody>
</table>

would combine the tables `his_functions` and `her_functions`, reference the member `reproduce`, call it with no arguments, and then assign the result to `child`. Notice that, since `` `.' `` and `` `()' `` have the same precedence, their left-to-right associativity causes the member reference to occur first and then the function call. In an expression like `sin(1).type`, the function call is performed first.

When a function is compiled, information is included that relates its operations to the file name and line numbers of the source code. If an error occurs, this information is useful in tracking down its cause. In some cases, this information is undesirable and may be removed with the `strip` function. The `message` function is such a case.

<span id="Data"></span>

------------------------------------------------------------------------

|  |  |  |  |  |  |  |  |  |  |  |
|----|----|----|----|----|----|----|----|----|----|----|
| \[ [\<\<](algae_4.html#SEC7) \] | \[ [\>\>](algae_5.html#SEC35) \] |   |   |   |   |   | \[[Top](algae.html#SEC_Top)\] | \[[Contents](algae_toc.html#SEC_Contents)\] | \[[Index](algae_10.html#SEC57)\] | \[ [?](algae_abt.html#SEC_About) \] |

\
This document was generated by *K. Scott Hunziker* on *October, 31 2001* using [*texi2html*](http://www.mathematik.uni-kl.de/~obachman/Texi2html%0A)
