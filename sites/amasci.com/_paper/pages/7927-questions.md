---
title: "Questions"
source_domain: amasci.com
source_path: ~scs/C-faq/questions.html
order: 7927
reachable_from_entry: false
images: 0
internal_links: 66
extracted: 2026-08-07T17:15:34Z
extractor: site_to_paper.py (pandoc)
---

# Questions

*Source page: `~scs/C-faq/questions.html`*

------------------------------------------------------------------------

#### 1. Declarations and Initializations

<a href="q1.1.html" rel="subdocument">1.1 How do you decide which integer type to use?</a>

<a href="q1.4.html" rel="subdocument">1.4 What should the 64-bit type on new, 64-bit machines be?</a>

<a href="q1.7.html" rel="subdocument">1.7 What's the best way to declare and define global variables?</a>

<a href="q1.11.html" rel="subdocument">1.11 What does <code>extern</code> mean in a function declaration?</a>

<a href="q1.12.html" rel="subdocument">1.12 What's the <code>auto</code> keyword good for?</a>

<a href="q1.14.html" rel="subdocument">1.14 I can't seem to define a linked list node which contains a pointer to itself.</a>

<a href="q1.21.html" rel="subdocument">1.21 How do I declare an array of N pointers to functions returning pointers to functions returning pointers to characters?</a>

<a href="q1.22.html" rel="subdocument">1.22 How can I declare a function that returns a pointer to a function of its own type?</a>

<a href="q1.25.html" rel="subdocument">1.25 My compiler is complaining about an invalid redeclaration of a function, but I only define it once and call it once.</a>

<a href="q1.30.html" rel="subdocument">1.30 What can I safely assume about the initial values of variables which are not explicitly initialized?</a>

<a href="q1.31.html" rel="subdocument">1.31 Why can't I initialize a local array with a string?</a>

<a href="q1.32.html" rel="subdocument">1.32 What is the difference between <code>char a[] = "string";</code> and <code>char *p = "string";</code> ?</a>

<a href="q1.34.html" rel="subdocument">1.34 How do I initialize a pointer to a function?</a>

------------------------------------------------------------------------

#### 2. Structures, Unions, and Enumerations

<a href="q2.1.html" rel="subdocument">2.1 What's the difference between <code>struct x1 { ... };</code> and <code>typedef struct { ... } x2;</code> ?</a>

<a href="q2.2.html" rel="subdocument">2.2 Why doesn't "<code>struct x { ... }; x thestruct;</code>" work?</a>

<a href="q2.3.html" rel="subdocument">2.3 Can a structure contain a pointer to itself?</a>

<a href="q2.4.html" rel="subdocument">2.4 What's the best way of implementing opaque (abstract) data types in C?</a>

<a href="q2.6.html" rel="subdocument">2.6 I came across some code that declared a structure with the last member an array of one element, and then did some tricky allocation to make it act like the array had several elements. Is this legal or portable?</a>

<a href="q2.7.html" rel="subdocument">2.7 I heard that structures could be assigned to variables and passed to and from functions, but K&amp;R1 says not.</a>

<a href="q2.8.html" rel="subdocument">2.8 Why can't you compare structures?</a>

<a href="q2.9.html" rel="subdocument">2.9 How are structure passing and returning implemented?</a>

<a href="q2.10.html" rel="subdocument">2.10 Can I pass constant values to functions which accept structure arguments?</a>

<a href="q2.11.html" rel="subdocument">2.11 How can I read/write structures from/to data files?</a>

<a href="q2.12.html" rel="subdocument">2.12 How can I turn off structure padding?</a>

<a href="q2.13.html" rel="subdocument">2.13 Why does <code>sizeof</code> report a larger size than I expect for a structure type?</a>

<a href="q2.14.html" rel="subdocument">2.14 How can I determine the byte offset of a field within a structure?</a>

<a href="q2.15.html" rel="subdocument">2.15 How can I access structure fields by name at run time?</a>

<a href="q2.18.html" rel="subdocument">2.18 I have a program which works correctly, but dumps core after it finishes. Why?</a>

<a href="q2.20.html" rel="subdocument">2.20 Can I initialize unions?</a>

<a href="q2.22.html" rel="subdocument">2.22 What is the difference between an enumeration and a set of preprocessor <code>#define</code>s?</a>

<a href="q2.24.html" rel="subdocument">2.24 Is there an easy way to print enumeration values symbolically?</a>

------------------------------------------------------------------------

#### 3. Expressions

<a href="q3.1.html" rel="subdocument">3.1 Why doesn't the code "<code>a[i] = i++;</code>" work?</a>

<a href="q3.2.html" rel="subdocument">3.2 Under my compiler, the code "<code>int i = 7; printf("%d\n", i++ * i++);</code>" prints 49. Regardless of the order of evaluation, shouldn't it print 56?</a>

<a href="q3.3.html" rel="subdocument">3.3 How could the code [CENSORED] ever give 7?</a>

<a href="q3.4.html" rel="subdocument">3.4 Don't precedence and parentheses dictate order of evaluation?</a>

<a href="q3.5.html" rel="subdocument">3.5 But what about the <code>&amp;&amp;</code> and <code>||</code> operators?</a>

<a href="q3.8.html" rel="subdocument">3.8 What's a ``sequence point''?</a>

<a href="q3.9.html" rel="subdocument">3.9 So given "<code>a[i] = i++;</code>" we don't know which cell of <code>a[]</code> gets written to, but <code>i</code> does get incremented by one.</a>

<a href="q3.12.html" rel="subdocument">3.12 If I'm not using the value of the expression, should I use <code>i++</code> or <code>++i</code> to increment a variable?</a>

<a href="q3.14.html" rel="subdocument">3.14 Why doesn't the code "<code>int a = 1000, b = 1000; long int c = a * b;</code>" work?</a>

<a href="q3.16.html" rel="subdocument">3.16 Can I use <code>?:</code> on the left-hand side of an assignment expression?</a>

------------------------------------------------------------------------

#### 4. Pointers

<a href="q4.2.html" rel="subdocument">4.2 What's wrong with "<code>char *p; *p = malloc(10);</code>"?</a>

<a href="q4.3.html" rel="subdocument">4.3 Does <code>*p++</code> increment <code>p</code>, or what it points to?</a>

<a href="q4.5.html" rel="subdocument">4.5 I want to use a <code>char *</code> pointer to step over some <code>int</code>s. Why doesn't "<code>((int *)p)++;</code>" work?</a>

<a href="q4.8.html" rel="subdocument">4.8 I have a function which accepts, and is supposed to initialize, a pointer, but the pointer in the caller remains unchanged.</a>

<a href="q4.9.html" rel="subdocument">4.9 Can I use a <code>void **</code> pointer to pass a generic pointer to a function by reference?</a>

<a href="q4.10.html" rel="subdocument">4.10 I have a function which accepts a pointer to an <code>int</code>. How can I pass a constant like 5 to it?</a>

<a href="q4.11.html" rel="subdocument">4.11 Does C even have ``pass by reference''?</a>

<a href="q4.12.html" rel="subdocument">4.12 I've seen different methods used for calling functions via pointers.</a>

------------------------------------------------------------------------

#### 5. Null Pointers

<a href="q5.1.html" rel="subdocument">5.1 What is this infamous null pointer, anyway?</a>

<a href="q5.2.html" rel="subdocument">5.2 How do I get a null pointer in my programs?</a>

<a href="q5.3.html" rel="subdocument">5.3 Is the abbreviated pointer comparison ``<code>if(p)</code>'' to test for non-null pointers valid?</a>

<a href="q5.4.html" rel="subdocument">5.4 What is <code>NULL</code> and how is it <code>#define</code>d?</a>

<a href="q5.5.html" rel="subdocument">5.5 How should <code>NULL</code> be defined on a machine which uses a nonzero bit pattern as the internal representation of a null pointer?</a>

<a href="q5.6.html" rel="subdocument">5.6 If <code>NULL</code> were defined as ``<code>((char *)0)</code>,'' wouldn't that make function calls which pass an uncast <code>NULL</code> work?</a>

<a href="q5.9.html" rel="subdocument">5.9 If <code>NULL</code> and <code>0</code> are equivalent as null pointer constants, which should I use?</a>

<a href="q5.10.html" rel="subdocument">5.10 But wouldn't it be better to use <code>NULL</code>, in case the value of <code>NULL</code> changes?</a>

<a href="q5.12.html" rel="subdocument">5.12 I use the preprocessor macro "<code>#define Nullptr(type) (type *)0</code>" to help me build null pointers of the correct type.</a>

<a href="q5.13.html" rel="subdocument">5.13 This is strange. <code>NULL</code> is guaranteed to be <code>0</code>, but the null pointer is not?</a>

<a href="q5.14.html" rel="subdocument">5.14 Why is there so much confusion surrounding null pointers?</a>

<a href="q5.15.html" rel="subdocument">5.15 I'm confused. I just can't understand all this null pointer stuff.</a>

<a href="q5.16.html" rel="subdocument">5.16 Given all the confusion surrounding null pointers, wouldn't it be easier simply to require them to be represented internally by zeroes?</a>

<a href="q5.17.html" rel="subdocument">5.17 Seriously, have any actual machines really used nonzero null pointers?</a>

<a href="q5.20.html" rel="subdocument">5.20 What does a run-time ``null pointer assignment'' error mean?</a>

------------------------------------------------------------------------

#### 6. Arrays and Pointers

<a href="q6.1.html" rel="subdocument">6.1 I had the definition <code>char a[6]</code> in one source file, and in another I declared <code>extern char *a</code>. Why didn't it work?</a>

<a href="q6.2.html" rel="subdocument">6.2 But I heard that <code>char a[]</code> was identical to <code>char *a</code>.</a>

<a href="q6.3.html" rel="subdocument">6.3 So what is meant by the ``equivalence of pointers and arrays'' in C?</a>

<a href="q6.4.html" rel="subdocument">6.4 Why are array and pointer declarations interchangeable as function formal parameters?</a>

<a href="q6.7.html" rel="subdocument">6.7 How can an array be an lvalue, if you can't assign to it?</a>

<a href="q6.8.html" rel="subdocument">6.8 What is the real difference between arrays and pointers?</a>

<a href="q6.9.html" rel="subdocument">6.9 Someone explained to me that arrays were really just constant pointers.</a>

<a href="q6.11.html" rel="subdocument">6.11 I came across some ``joke'' code containing the ``expression'' <code>5["abcdef"]</code> . How can this be legal C?</a>

<a href="q6.12.html" rel="subdocument">6.12 What's the difference between <code>array</code> and <code>&amp;array</code>?</a>

<a href="q6.13.html" rel="subdocument">6.13 How do I declare a pointer to an array?</a>

<a href="q6.14.html" rel="subdocument">6.14 How can I set an array's size at compile time?</a>

<a href="q6.15.html" rel="subdocument">6.15 How can I declare local arrays of a size matching a passed-in array?</a>

<a href="q6.16.html" rel="subdocument">6.16 How can I dynamically allocate a multidimensional array?</a>

<a href="q6.17.html" rel="subdocument">6.17 Can I simulate a non-0-based array with a pointer?</a>

<a href="q6.18.html" rel="subdocument">6.18 My compiler complained when I passed a two-dimensional array to a function expecting a pointer to a pointer.</a>

<a href="q6.19.html" rel="subdocument">6.19 How do I write functions which accept two-dimensional arrays when the ``width'' is not known at compile time?</a>

<a href="q6.20.html" rel="subdocument">6.20 How can I use statically- and dynamically-allocated multidimensional arrays interchangeably when passing them to functions?</a>

<a href="q6.21.html" rel="subdocument">6.21 Why doesn't <code>sizeof</code> properly report the size of an array which is a parameter to a function?</a>

------------------------------------------------------------------------

#### 7. Memory Allocation

<a href="q7.1.html" rel="subdocument">7.1 Why doesn't the code ``<code>char *answer; gets(answer);</code>'' work?</a>

<a href="q7.2.html" rel="subdocument">7.2 I can't get <code>strcat</code> to work. I tried ``<code>char *s3 = strcat(s1, s2);</code>'' but I got strange results.</a>

<a href="q7.3.html" rel="subdocument">7.3 But the man page for <code>strcat</code> says that it takes two <code>char *</code>'s as arguments. How am I supposed to know to allocate things?</a>

<a href="q7.5.html" rel="subdocument">7.5 I have a function that is supposed to return a string, but when it returns to its caller, the returned string is garbage.</a>

<a href="q7.6.html" rel="subdocument">7.6 Why am I getting ``warning: assignment of pointer from integer lacks a cast'' for calls to <code>malloc</code>?</a>

<a href="q7.7.html" rel="subdocument">7.7 Why does some code carefully cast the values returned by <code>malloc</code> to the pointer type being allocated?</a>

<a href="q7.8.html" rel="subdocument">7.8 Why does so much code leave out the multiplication by <code>sizeof(char)</code> when allocating strings?</a>

<a href="q7.14.html" rel="subdocument">7.14 I've heard that some operating systems don't actually allocate <code>malloc</code>'ed memory until the program tries to use it. Is this legal?</a>

<a href="q7.16.html" rel="subdocument">7.16 I'm allocating a large array for some numeric work, but <code>malloc</code> is acting strangely.</a>

<a href="q7.17.html" rel="subdocument">7.17 I've got 8 meg of memory in my PC. Why can I only seem to <code>malloc</code> 640K or so?</a>

<a href="q7.19.html" rel="subdocument">7.19 My program is crashing, apparently somewhere down inside <code>malloc</code>.</a>

<a href="q7.20.html" rel="subdocument">7.20 You can't use dynamically-allocated memory after you free it, can you?</a>

<a href="q7.21.html" rel="subdocument">7.21 Why isn't a pointer null after calling <code>free</code>?</a>

<a href="q7.22.html" rel="subdocument">7.22 When I call <code>malloc</code> to allocate memory for a local pointer, do I have to explicitly <code>free</code> it?</a>

<a href="q7.23.html" rel="subdocument">7.23 When I free a dynamically-allocated structure containing pointers, do I have to free each subsidiary pointer first?</a>

<a href="q7.24.html" rel="subdocument">7.24 Must I free allocated memory before the program exits?</a>

<a href="q7.25.html" rel="subdocument">7.25 Why doesn't my program's memory usage go down when I free memory?</a>

<a href="q7.26.html" rel="subdocument">7.26 How does <code>free</code> know how many bytes to free?</a>

<a href="q7.27.html" rel="subdocument">7.27 So can I query the malloc package to find out how big an allocated block is?</a>

<a href="q7.30.html" rel="subdocument">7.30 Is it legal to pass a null pointer as the first argument to <code>realloc</code>?</a>

<a href="q7.31.html" rel="subdocument">7.31 What's the difference between <code>calloc</code> and <code>malloc</code>?</a>

<a href="q7.32.html" rel="subdocument">7.32 What is <code>alloca</code> and why is its use discouraged?</a>

------------------------------------------------------------------------

#### 8. Characters and Strings

<a href="q8.1.html" rel="subdocument">8.1 Why doesn't "<code>strcat(string, '!');</code>" work?</a>

<a href="q8.2.html" rel="subdocument">8.2 Why won't the test <code>if(string == "value")</code> correctly compare <code>string</code> against the value?</a>

<a href="q8.3.html" rel="subdocument">8.3 Why can't I assign strings to character arrays?</a>

<a href="q8.6.html" rel="subdocument">8.6 How can I get the numeric (character set) value corresponding to a character?</a>

<a href="q8.9.html" rel="subdocument">8.9 Why is <code>sizeof('a')</code> not 1?</a>

------------------------------------------------------------------------

#### 9. Boolean Expressions and Variables

<a href="q9.1.html" rel="subdocument">9.1 What is the right type to use for Boolean values in C?</a>

<a href="q9.2.html" rel="subdocument">9.2 What if a built-in logical or relational operator ``returns'' something other than 1?</a>

<a href="q9.3.html" rel="subdocument">9.3 Is <code>if(p)</code>, where <code>p</code> is a pointer, valid?</a>

------------------------------------------------------------------------

#### 10. C Preprocessor

<a href="q10.2.html" rel="subdocument">10.2 I've got some cute preprocessor macros that let me write C code that looks more like Pascal. What do y'all think?</a>

<a href="q10.3.html" rel="subdocument">10.3 How can I write a generic macro to swap two values?</a>

<a href="q10.4.html" rel="subdocument">10.4 What's the best way to write a multi-statement macro?</a>

<a href="q10.6.html" rel="subdocument">10.6 What are .h files and what should I put in them?</a>

<a href="q10.7.html" rel="subdocument">10.7 Is it acceptable for one header file to <code>#include</code> another?</a>

<a href="q10.8.html" rel="subdocument">10.8 Where are header (``<code>#include</code>'') files searched for?</a>

<a href="q10.9.html" rel="subdocument">10.9 I'm getting strange syntax errors on the very first declaration in a file, but it looks fine.</a>

<a href="q10.11.html" rel="subdocument">10.11 Where can I get a copy of a missing header file?</a>

<a href="q10.12.html" rel="subdocument">10.12 How can I construct preprocessor <code>#if</code> expressions which compare strings?</a>

<a href="q10.13.html" rel="subdocument">10.13 Does the <code>sizeof</code> operator work in preprocessor <code>#if</code> directives?</a>

<a href="q10.14.html" rel="subdocument">10.14 Can I use an <code>#ifdef</code> in a <code>#define</code> line, to define something two different ways?</a>

<a href="q10.15.html" rel="subdocument">10.15 Is there anything like an <code>#ifdef</code> for <code>typedef</code>s?</a>

<a href="q10.16.html" rel="subdocument">10.16 How can I use a preprocessor <code>#if</code> expression to detect endianness?</a>

<a href="q10.18.html" rel="subdocument">10.18 How can I preprocess some code to remove selected conditional compilations, without preprocessing everything?</a>

<a href="q10.19.html" rel="subdocument">10.19 How can I list all of the pre<code>#define</code>d identifiers?</a>

<a href="q10.20.html" rel="subdocument">10.20 I have some old code that tries to construct identifiers with a macro like "<code>#define Paste(a, b) a/**/b</code>", but it doesn't work any more.</a>

<a href="q10.22.html" rel="subdocument">10.22</a>

What does the message \`\`warning: macro replacement within a string literal'' mean?

<a href="q10.23.html" rel="subdocument">10.23 How can I use a macro argument inside a string literal in the macro expansion?</a>

<a href="q10.25.html" rel="subdocument">10.25 I've got this tricky preprocessing I want to do and I can't figure out a way to do it.</a>

<a href="q10.26.html" rel="subdocument">10.26 How can I write a macro which takes a variable number of arguments?</a>

------------------------------------------------------------------------

#### 11. ANSI/ISO Standard C

<a href="q11.1.html" rel="subdocument">11.1 What is the ``ANSI C Standard?''</a>

<a href="q11.2.html" rel="subdocument">11.2 How can I get a copy of the Standard?</a>

<a href="q11.3.html" rel="subdocument">11.3 My ANSI compiler is complaining about prototype mismatches for parameters declared <code>float</code>.</a>

<a href="q11.4.html" rel="subdocument">11.4 Can you mix old-style and new-style function syntax?</a>

<a href="q11.5.html" rel="subdocument">11.5 Why does the declaration "<code>extern f(struct x *p);</code>" give me a warning message?</a>

<a href="q11.8.html" rel="subdocument">11.8 Why can't I use <code>const</code> values in initializers and array dimensions?</a>

<a href="q11.9.html" rel="subdocument">11.9 What's the difference between <code>const char *</code><code>p</code> and <code>char * const</code><code> p</code>?</a>

<a href="q11.10.html" rel="subdocument">11.10 Why can't I pass a <code>char **</code> to a function which expects a <code>const char **</code>?</a>

<a href="q11.12.html" rel="subdocument">11.12 Can I declare <code>main</code> as <code>void</code>, to shut off these annoying ``main returns no value'' messages?</a>

<a href="q11.13.html" rel="subdocument">11.13 But what about <code>main</code>'s third argument, <code>envp</code>?</a>

<a href="q11.14.html" rel="subdocument">11.14 I believe that declaring <code>void main()</code> can't fail, since I'm calling <code>exit</code> instead of returning.</a>

<a href="q11.15.html" rel="subdocument">11.15 The book I've been using always uses <code>void main()</code>.</a>

<a href="q11.16.html" rel="subdocument">11.16 Is <code>exit(status)</code> truly equivalent to returning the same <code>status</code> from <code>main</code>?</a>

<a href="q11.17.html" rel="subdocument">11.17 How do I get the ANSI ``stringizing'' preprocessing operator `<code>#</code>' to stringize the macro's value instead of its name?</a>

<a href="q11.18.html" rel="subdocument">11.18 What does the message ``warning: macro replacement within a string literal'' mean?</a>

<a href="q11.19.html" rel="subdocument">11.19 I'm getting strange syntax errors inside lines I've <code>#ifdef</code>fed out.</a>

<a href="q11.20.html" rel="subdocument">11.20 What are <code>#pragma</code>s ?</a>

<a href="q11.21.html" rel="subdocument">11.21 What does ``<code>#pragma once</code>'' mean?</a>

<a href="q11.22.html" rel="subdocument">11.22 Is <code>char a[3] = "abc";</code> legal?</a>

<a href="q11.24.html" rel="subdocument">11.24 Why can't I perform arithmetic on a <code>void *</code> pointer?</a>

<a href="q11.25.html" rel="subdocument">11.25 What's the difference between <code>memcpy</code> and <code>memmove</code>?</a>

<a href="q11.26.html" rel="subdocument">11.26 What should <code>malloc(0)</code> do?</a>

<a href="q11.27.html" rel="subdocument">11.27 Why does the ANSI Standard not guarantee more than six case-insensitive characters of external identifier significance?</a>

<a href="q11.29.html" rel="subdocument">11.29 My compiler is rejecting the simplest possible test programs, with all kinds of syntax errors.</a>

<a href="q11.30.html" rel="subdocument">11.30 Why are some ANSI/ISO Standard library routines showing up as undefined, even though I've got an ANSI compiler?</a>

<a href="q11.31.html" rel="subdocument">11.31 Does anyone have a tool for converting old-style C programs to ANSI C, or for automatically generating prototypes?</a>

<a href="q11.32.html" rel="subdocument">11.32 Why won't frobozz-cc, which claims to be ANSI compliant, accept this code?</a>

<a href="q11.33.html" rel="subdocument">11.33 What's the difference between implementation-defined, unspecified, and undefined behavior?</a>

<a href="q11.34.html" rel="subdocument">11.34 I'm appalled that the ANSI Standard leaves so many issues undefined.</a>

<a href="q11.35.html" rel="subdocument">11.35 I just tried some allegedly-undefined code on an ANSI-conforming compiler, and got the results I expected.</a>

------------------------------------------------------------------------

#### 12. Stdio

<a href="q12.1.html" rel="subdocument">12.1 What's wrong with the code "<code>char c; while((c = getchar()) != EOF) ...</code>"?</a>

<a href="q12.2.html" rel="subdocument">12.2 Why won't the code `` <code>while(!feof(infp)) { fgets(buf, MAXLINE, infp); fputs(buf, outfp); } </code>'' work?</a>

<a href="q12.4.html" rel="subdocument">12.4 My program's prompts and intermediate output don't always show up on the screen.</a>

<a href="q12.5.html" rel="subdocument">12.5 How can I read one character at a time, without waiting for the RETURN key?</a>

<a href="q12.6.html" rel="subdocument">12.6 How can I print a <code>'%'</code> character with <code>printf</code>?</a>

<a href="q12.9.html" rel="subdocument">12.9 How can <code>printf</code> use <code>%f</code> for type <code>double</code>, if <code>scanf</code> requires <code>%lf</code>?</a>

<a href="q12.10.html" rel="subdocument">12.10 How can I implement a variable field width with <code>printf</code>?</a>

<a href="q12.11.html" rel="subdocument">12.11 How can I print numbers with commas separating the thousands?</a>

<a href="q12.12.html" rel="subdocument">12.12 Why doesn't the call <code>scanf("%d", i)</code> work?</a>

<a href="q12.13.html" rel="subdocument">12.13 Why doesn't the code "<code>double d; scanf("%f", &amp;d);</code>" work?</a>

<a href="q12.15.html" rel="subdocument">12.15 How can I specify a variable width in a <code>scanf</code> format string?</a>

<a href="q12.17.html" rel="subdocument">12.17 When I read numbers from the keyboard with <code>scanf</code> <code>"%d\n"</code>, it seems to hang until I type one extra line of input.</a>

<a href="q12.18.html" rel="subdocument">12.18 I'm reading a number with <code>scanf</code> <code>%d</code> and then a string with <code>gets()</code>, but the compiler seems to be skipping the call to <code>gets()</code>!</a>

<a href="q12.19.html" rel="subdocument">12.19 I'm re-prompting the user if <code>scanf</code> fails, but sometimes it seems to go into an infinite loop.</a>

<a href="q12.20.html" rel="subdocument">12.20 Why does everyone say not to use <code>scanf</code>? What should I use instead?</a>

<a href="q12.21.html" rel="subdocument">12.21 How can I tell how much destination buffer space I'll need for an arbitrary <code>sprintf</code> call? How can I avoid overflowing the destination buffer with <code>sprintf</code>?</a>

<a href="q12.23.html" rel="subdocument">12.23 Why does everyone say not to use <code>gets()</code>?</a>

<a href="q12.24.html" rel="subdocument">12.24 Why does <code>errno</code> contain ENOTTY after a call to <code>printf</code>?</a>

<a href="q12.25.html" rel="subdocument">12.25 What's the difference between <code>fgetpos</code>/<code>fsetpos</code> and <code>ftell</code>/<code>fseek</code>?</a>

<a href="q12.26.html" rel="subdocument">12.26 Will <code>fflush(stdin)</code> flush unread characters from the standard input stream?</a>

<a href="q12.30.html" rel="subdocument">12.30 I'm trying to update a file in place, by using <code>fopen</code> mode <code>"r+"</code>, but it's not working.</a>

<a href="q12.33.html" rel="subdocument">12.33 How can I redirect <code>stdin</code> or <code>stdout</code> from within a program?</a>

<a href="q12.34.html" rel="subdocument">12.34 Once I've used <code>freopen</code>, how can I get the original stream back?</a>

<a href="q12.38.html" rel="subdocument">12.38 How can I read a binary data file properly?</a>

------------------------------------------------------------------------

#### 13. Library Functions

<a href="q13.1.html" rel="subdocument">13.1 How can I convert numbers to strings?</a>

<a href="q13.2.html" rel="subdocument">13.2 Why does <code>strncpy</code> not always write a <code>'\0'</code>?</a>

<a href="q13.5.html" rel="subdocument">13.5 Why do some versions of <code>toupper</code> act strangely if given an upper-case letter?</a>

<a href="q13.6.html" rel="subdocument">13.6 How can I split up a string into whitespace-separated fields?</a>

<a href="q13.7.html" rel="subdocument">13.7 I need some code to do regular expression and wildcard matching.</a>

<a href="q13.8.html" rel="subdocument">13.8 I'm trying to sort an array of strings with <code>qsort</code>, using <code>strcmp</code> as the comparison function, but it's not working.</a>

<a href="q13.9.html" rel="subdocument">13.9 Now I'm trying to sort an array of structures, but the compiler is complaining that the function is of the wrong type for <code>qsort</code>.</a>

<a href="q13.10.html" rel="subdocument">13.10 How can I sort a linked list?</a>

<a href="q13.11.html" rel="subdocument">13.11 How can I sort more data than will fit in memory?</a>

<a href="q13.12.html" rel="subdocument">13.12 How can I get the time of day in a C program?</a>

<a href="q13.13.html" rel="subdocument">13.13 How can I convert a <code>struct tm</code> or a string into a <code>time_t</code>?</a>

<a href="q13.14.html" rel="subdocument">13.14 How can I perform calendar manipulations?</a>

<a href="q13.15.html" rel="subdocument">13.15 I need a random number generator.</a>

<a href="q13.16.html" rel="subdocument">13.16 How can I get random integers in a certain range?</a>

<a href="q13.17.html" rel="subdocument">13.17 Each time I run my program, I get the same sequence of numbers back from <code>rand()</code>.</a>

<a href="q13.18.html" rel="subdocument">13.18 I need a random true/false value, so I'm just taking <code>rand() % 2</code>, but it's alternating 0, 1, 0, 1, 0...</a>

<a href="q13.20.html" rel="subdocument">13.20 How can I generate random numbers with a normal or Gaussian distribution?</a>

<a href="q13.24.html" rel="subdocument">13.24 I'm trying to port this old program. Why do I get ``undefined external'' errors for some library functions?</a>

<a href="q13.25.html" rel="subdocument">13.25 I get errors due to library functions being undefined even though I <code>#include</code> the right header files.</a>

<a href="q13.26.html" rel="subdocument">13.26 I'm still getting errors due to library functions being undefined, even though I'm requesting the right libraries.</a>

<a href="q13.28.html" rel="subdocument">13.28 What does it mean when the linker says that <code>_end</code> is undefined?</a>

------------------------------------------------------------------------

#### 14. Floating Point

<a href="q14.1.html" rel="subdocument">14.1 When I set a <code>float</code> variable to 3.1, why is <code>printf</code> printing it as 3.0999999?</a>

<a href="q14.2.html" rel="subdocument">14.2 Why is <code>sqrt(144.)</code> giving me crazy numbers?</a>

<a href="q14.3.html" rel="subdocument">14.3 I keep getting ``undefined: sin'' compilation errors.</a>

<a href="q14.4.html" rel="subdocument">14.4 My floating-point calculations are acting strangely and giving me different answers on different machines.</a>

<a href="q14.5.html" rel="subdocument">14.5 What's a good way to check for ``close enough'' floating-point equality?</a>

<a href="q14.6.html" rel="subdocument">14.6 How do I round numbers?</a>

<a href="q14.7.html" rel="subdocument">14.7 Where is C's exponentiation operator?</a>

<a href="q14.8.html" rel="subdocument">14.8 The pre-<code>#define</code>d constant <code>M_PI</code> seems to be missing from <code>&lt;math.h&gt;</code>.</a>

<a href="q14.9.html" rel="subdocument">14.9 How do I test for IEEE NaN and other special values?</a>

<a href="q14.11.html" rel="subdocument">14.11 What's a good way to implement complex numbers in C?</a>

<a href="q14.12.html" rel="subdocument">14.12 I'm looking for some mathematical library code.</a>

<a href="q14.13.html" rel="subdocument">14.13 I'm having trouble with a Turbo C program which crashes and says something like ``floating point formats not linked.''</a>

------------------------------------------------------------------------

#### 15. Variable-Length Argument Lists

<a href="q15.1.html" rel="subdocument">15.1 I heard that you have to <code>#include</code> <code>&lt;stdio.h&gt;</code> before calling <code>printf</code>. Why?</a>

<a href="q15.2.html" rel="subdocument">15.2 How can <code>%f</code> be used for both <code>float</code> and <code>double</code> arguments in <code>printf</code>?</a>

<a href="q15.3.html" rel="subdocument">15.3 Why don't function prototypes guard against mismatches in <code>printf</code>'s arguments?</a>

<a href="q15.4.html" rel="subdocument">15.4 How can I write a function that takes a variable number of arguments?</a>

<a href="q15.5.html" rel="subdocument">15.5 How can I write a function that takes a format string and a variable number of arguments, like <code>printf</code>, and passes them to <code>printf</code> to do most of the work?</a>

<a href="q15.6.html" rel="subdocument">15.6 How can I write a function analogous to <code>scanf</code>, that calls <code>scanf</code> to do most of the work?</a>

<a href="q15.7.html" rel="subdocument">15.7 I have a pre-ANSI compiler, without <code>&lt;stdarg.h&gt;</code>. What can I do?</a>

<a href="q15.8.html" rel="subdocument">15.8 How can I discover how many arguments a function was actually called with?</a>

<a href="q15.9.html" rel="subdocument">15.9 My compiler isn't letting me declare a function that accepts <em>only</em> variable arguments.</a>

<a href="q15.10.html" rel="subdocument">15.10 Why isn't "<code>va_arg(argp, float)</code>" working?</a>

<a href="q15.11.html" rel="subdocument">15.11 I can't get <code>va_arg</code> to pull in an argument of type pointer-to-function.</a>

<a href="q15.12.html" rel="subdocument">15.12 How can I write a function which takes a variable number of arguments and passes them to some other function ?</a>

<a href="q15.13.html" rel="subdocument">15.13 How can I call a function with an argument list built up at run time?</a>

------------------------------------------------------------------------

#### 16. Strange Problems

<a href="q16.3.html" rel="subdocument">16.3 This program crashes before it even runs!</a>

<a href="q16.4.html" rel="subdocument">16.4 I have a program that seems to run correctly, but then crashes as it's exiting.</a>

<a href="q16.5.html" rel="subdocument">16.5 This program runs perfectly on one machine, but I get weird results on another.</a>

<a href="q16.6.html" rel="subdocument">16.6 Why does the code "<code>char *p = "hello, world!"; p[0] = 'H';</code>" crash?</a>

<a href="q16.8.html" rel="subdocument">16.8 What does ``Segmentation violation'' mean?</a>

------------------------------------------------------------------------

#### 17. Style

<a href="q17.1.html" rel="subdocument">17.1 What's the best style for code layout in C?</a>

<a href="q17.3.html" rel="subdocument">17.3 Is the code "<code>if(!strcmp(s1, s2))</code>" good style?</a>

<a href="q17.4.html" rel="subdocument">17.4 Why do some people write <code>if(0 == x)</code> instead of <code>if(x == 0)</code>?</a>

<a href="q17.5.html" rel="subdocument">17.5 I came across some code that puts a <code>(void)</code> cast before each call to <code>printf</code>. Why?</a>

<a href="q17.8.html" rel="subdocument">17.8 What is Hungarian Notation''? Is it worthwhile?</a>

<a href="q17.9.html" rel="subdocument">17.9 Where can I get the ``Indian Hill Style Guide'' and other coding standards?</a>

<a href="q17.10.html" rel="subdocument">17.10 Some people say that <code>goto</code>'s are evil and that I should never use them. Isn't that a bit extreme?</a>

------------------------------------------------------------------------

#### 18. Tools and Resources

<a href="q18.1.html" rel="subdocument">18.1 I'm looking for C development tools (cross-reference generators, code beautifiers, etc.).</a>

<a href="q18.2.html" rel="subdocument">18.2 How can I track down these pesky malloc problems?</a>

<a href="q18.3.html" rel="subdocument">18.3 What's a free or cheap C compiler I can use?</a>

<a href="q18.4.html" rel="subdocument">18.4 I just typed in this program, and it's acting strangely. Can you see anything wrong with it?</a>

<a href="q18.5.html" rel="subdocument">18.5 How can I shut off the ``warning: possible pointer alignment problem'' message which <code>lint</code> gives me for each call to <code>malloc</code>?</a>

<a href="q18.7.html" rel="subdocument">18.7 Where can I get an ANSI-compatible <code>lint</code>?</a>

<a href="q18.8.html" rel="subdocument">18.8 Don't ANSI function prototypes render <code>lint</code> obsolete?</a>

<a href="q18.9.html" rel="subdocument">18.9 Are there any C tutorials or other resources on the net?</a>

<a href="q18.10.html" rel="subdocument">18.10 What's a good book for learning C?</a>

<a href="q18.13.html" rel="subdocument">18.13 Where can I find the sources of the standard C libraries?</a>

<a href="q18.14.html" rel="subdocument">18.14 I need code to parse and evaluate expressions.</a>

<a href="q18.15.html" rel="subdocument">18.15 Where can I get a BNF or YACC grammar for C?</a>

<a href="q18.15a.html" rel="subdocument">18.15a Does anyone have a C compiler test suite I can use?</a>

<a href="q18.16.html" rel="subdocument">18.16 Where and how can I get copies of all these freely distributable programs?</a>

------------------------------------------------------------------------

#### 19. System Dependencies

<a href="q19.1.html" rel="subdocument">19.1 How can I read a single character from the keyboard without waiting for the RETURN key?</a>

<a href="q19.2.html" rel="subdocument">19.2 How can I find out how many characters are available for reading, or do a non-blocking read?</a>

<a href="q19.3.html" rel="subdocument">19.3 How can I display a percentage-done indication that updates itself in place, or show one of those ``twirling baton'' progress indicators?</a>

<a href="q19.4.html" rel="subdocument">19.4 How can I clear the screen, or print things in inverse video, or move the cursor?</a>

<a href="q19.5.html" rel="subdocument">19.5 How do I read the arrow keys? What about function keys?</a>

<a href="q19.6.html" rel="subdocument">19.6 How do I read the mouse?</a>

<a href="q19.7.html" rel="subdocument">19.7 How can I do serial (``comm'') port I/O?</a>

<a href="q19.8.html" rel="subdocument">19.8 How can I direct output to the printer?</a>

<a href="q19.9.html" rel="subdocument">19.9 How do I send escape sequences to control a terminal or other device?</a>

<a href="q19.10.html" rel="subdocument">19.10 How can I do graphics?</a>

<a href="q19.11.html" rel="subdocument">19.11 How can I check whether a file exists?</a>

<a href="q19.12.html" rel="subdocument">19.12 How can I find out the size of a file, prior to reading it in?</a>

<a href="q19.13.html" rel="subdocument">19.13 How can a file be shortened in-place without completely clearing or rewriting it?</a>

<a href="q19.14.html" rel="subdocument">19.14 How can I insert or delete a line in the middle of a file?</a>

<a href="q19.15.html" rel="subdocument">19.15 How can I recover the file name given an open file descriptor?</a>

<a href="q19.16.html" rel="subdocument">19.16 How can I delete a file?</a>

<a href="q19.17.html" rel="subdocument">19.17 What's wrong with the call "<code>fopen("c:\newdir\file.dat", "r")</code>"?</a>

<a href="q19.18.html" rel="subdocument">19.18 How can I increase the allowable number of simultaneously open files?</a>

<a href="q19.20.html" rel="subdocument">19.20 How can I read a directory in a C program?</a>

<a href="q19.22.html" rel="subdocument">19.22 How can I find out how much memory is available?</a>

<a href="q19.23.html" rel="subdocument">19.23 How can I allocate arrays or structures bigger than 64K?</a>

<a href="q19.24.html" rel="subdocument">19.24 What does the error message ``DGROUP exceeds 64K'' mean?</a>

<a href="q19.25.html" rel="subdocument">19.25 How can I access memory located at a certain address?</a>

<a href="q19.27.html" rel="subdocument">19.27 How can I invoke another program from within a C program?</a>

<a href="q19.30.html" rel="subdocument">19.30 How can I invoke another program and trap its output?</a>

<a href="q19.31.html" rel="subdocument">19.31 How can my program discover the complete pathname to the executable from which it was invoked?</a>

<a href="q19.32.html" rel="subdocument">19.32 How can I automatically locate a program's configuration files in the same directory as the executable?</a>

<a href="q19.33.html" rel="subdocument">19.33 How can a process change an environment variable in its caller?</a>

<a href="q19.36.html" rel="subdocument">19.36 How can I read in an object file and jump to routines in it?</a>

<a href="q19.37.html" rel="subdocument">19.37 How can I implement a delay, or time a user's response, with sub-second resolution?</a>

<a href="q19.38.html" rel="subdocument">19.38 How can I trap or ignore keyboard interrupts like control-C?</a>

<a href="q19.39.html" rel="subdocument">19.39 How can I handle floating-point exceptions gracefully?</a>

<a href="q19.40.html" rel="subdocument">19.40 How do I... Use sockets? Do networking? Write client/server applications?</a>

<a href="q19.40b.html" rel="subdocument">19.40b How do I use BIOS calls? How can I write ISR's? How can I create TSR's?</a>

<a href="q19.41.html" rel="subdocument">19.41 But I can't use all these nonstandard, system-dependent functions, because my program has to be ANSI compatible!</a>

------------------------------------------------------------------------

#### 20. Miscellaneous

<a href="q20.1.html" rel="subdocument">20.1 How can I return multiple values from a function?</a>

<a href="q20.3.html" rel="subdocument">20.3 How do I access command-line arguments?</a>

<a href="q20.5.html" rel="subdocument">20.5 How can I write data files which can be read on other machines with different data formats?</a>

<a href="q20.6.html" rel="subdocument">20.6 How can I call a function, given its name as a string?</a>

<a href="q20.8.html" rel="subdocument">20.8 How can I implement sets or arrays of bits?</a>

<a href="q20.9.html" rel="subdocument">20.9 How can I determine whether a machine's byte order is big-endian or little-endian?</a>

<a href="q20.10.html" rel="subdocument">20.10 How can I convert integers to binary or hexadecimal?</a>

<a href="q20.11.html" rel="subdocument">20.11 Can I use base-2 constants (something like <code>0b101010</code>)?<br />
Is there a <code>printf</code> format for binary?</a>

<a href="q20.12.html" rel="subdocument">20.12 What is the most efficient way to count the number of bits which are set in a value?</a>

<a href="q20.13.html" rel="subdocument">20.13 How can I make my code more efficient?</a>

<a href="q20.14.html" rel="subdocument">20.14 Are pointers really faster than arrays? How much do function calls slow things down?</a>

<a href="q20.17.html" rel="subdocument">20.17 Is there a way to <code>switch</code> on strings?</a>

<a href="q20.18.html" rel="subdocument">20.18 Is there a way to have non-constant <code>case</code> labels (i.e. ranges or arbitrary expressions)?</a>

<a href="q20.19.html" rel="subdocument">20.19 Are the outer parentheses in <code>return</code> statements really optional?</a>

<a href="q20.20.html" rel="subdocument">20.20 Why don't C comments nest? Are they legal inside quoted strings?</a>

<a href="q20.24.html" rel="subdocument">20.24 Why doesn't C have nested functions?</a>

<a href="q20.25.html" rel="subdocument">20.25 How can I call FORTRAN (C++, BASIC, Pascal, Ada, LISP) functions from C?</a>

<a href="q20.26.html" rel="subdocument">20.26 Does anyone know of a program for converting Pascal or FORTRAN to C?</a>

<a href="q20.27.html" rel="subdocument">20.27 Can I use a C++ compiler to compile C code?</a>

<a href="q20.28.html" rel="subdocument">20.28 I need to compare two strings for close, but not necessarily exact, equality.</a>

<a href="q20.29.html" rel="subdocument">20.29 What is hashing?</a>

<a href="q20.31.html" rel="subdocument">20.31 How can I find the day of the week given the date?</a>

<a href="q20.32.html" rel="subdocument">20.32 Will 2000 be a leap year?</a>

<a href="q20.34.html" rel="subdocument">20.34 How do you write a program which produces its own source code as its output?</a>

<a href="q20.35.html" rel="subdocument">20.35 What is ``Duff's Device''?</a>

<a href="q20.36.html" rel="subdocument">20.36 When will the next Obfuscated C Code Contest be held? How can I get a copy of previous winning entries?</a>

<a href="q20.37.html" rel="subdocument">20.37 What was the <code>entry</code> keyword mentioned in K&amp;R1?</a>

<a href="q20.38.html" rel="subdocument">20.38 Where does the name ``C'' come from, anyway?</a>

<a href="q20.39.html" rel="subdocument">20.39 How do you pronounce ``<code>char</code>''?</a>

<a href="q20.40.html" rel="subdocument">20.40 Where can I get extra copies of this list?</a>

------------------------------------------------------------------------

[top](faq.html)
