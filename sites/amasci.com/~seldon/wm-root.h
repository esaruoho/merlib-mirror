/***************************************************************************\
           WM-Root.h - Will Mengarini - Version 1.00 - Mo 23 Jan 95

===ABBREVIATIONS===

Long identifiers are one of the most valuable forms of self-documentation.
It's not longness per se, though, but intelligibility, that matters, and a
methodology of abbreviation that minimizes length and thereby reduces the
*overall* typing burden can make us more willing to tolerate that burden in
the places where it does most good. This is the justification for organizing
a system of abbreviations.

I use some standard abbreviations for the most common fundamental types,
keywords, & syntactic constructs in the language. These are used consistently
in all my code. The theory is that learning these abbreviations, which can
apply to all programs, will in the long run be cheaper than learning
abbreviations that apply to more specific domains. It works for me: I can
still read Cobol I coded 15 years ago, even though then I was using a
completely /different/ set of abbreviations. I think this is because all
Algol-family languages share a common set of constructs & concepts, so once
the practice of abbreviating the most common of them has become a habit, it's
obvious what the standard set of abbreviations means, especially since
they're used everyplace. Application-specific abbreviations can be totally
obscure to someone who doesn't know the app. The extra space you get on code
lines from using general C++ abbreviations can reduce the need for
abbreviations that are specific to an application or a project.

These are the abbreviations I'm using in data types:

    C char
   UC unsigned char
    D double
   LD long double
    H handle
    I int
    K const
    L long
   UL unsigned long
    U unsigned
    V void

These abbreviations incidentally allow fundamental type names to be
consistent with my convention of starting class names with uppercase letters,
but object & function names with lowercase letters.

Note that "K" up there ("const") is actually not a complete type, but a
type specifier (r.7.1) implemented with a #define. This means it can be
combined with any other type, including user-defined classes. I wanted to
do this with stuff like LD, but there's a different meaning for "L" in the
denotation of wide-char literals that I was afraid would interfere.

In learning these, it helps a lot to learn to read them as their meanings
rather than as their abbreviations: when you see "K I", don't think "kei ai",
think "const int".

These are my abbreviations for constructs other than data types:

    #define E        (ostream &) cerr <<
    #define N        << endl
    #define O        (ostream &) cout <<
    #define W(width) setw(width) <<

The (ostream &) casts are necessary because Borland C++ 3.1 follows the
standard that not even trivial type conversions are done when searching for
possible template function instantiations. Because cout & cerr are objects
of class ostream_withassign, template <> operator <<() isn't instantiated
correctly on them unless they're cast. (As of early 1995 the C++ standards
committee intends to change that rule, but our compilers still enforce it.)

Here's an example of those abbreviations in use:
  V writeLogFooter ( K C *errorFile, K I errorLine, K C *condition ) K;
Note that if "void", "const", "char", & "int" were all spelled out, this
declaration wouldn't've fit on one code line. The abbreviation of "const"
as "K" is particularly important to minimizing the pain of achieving
const-correctness, which can increase the efficiency of compiler output.

==ARGUMENT TYPES IN DOCUMENTATION===

Functions are often assigned names visually identical to English words that
denote analogous but more abstract actions than what the functions do, so
that the distinction can't be made from context. For example, there's a
category of activities we refer to as "searching", so it's reasonable to
instruct someone to "do a search"; but some module might also contain a
function with the name "search", so "do a search" could mean either running
search() or writing your own code to "do a search". To distinguish these
cases, when I'm talking about a C++ function I always follow the identifier
with parentheses. Unfortunately, while that was enough in C, now in C++ we
have yet another ambiguity: search() could be overloaded, & one of the
forms might have no args, so "do a search()" could mean
  search();
or
  search( we_foo, we_happy_foo );
I've found that when writing documentation I need to refer to a group of
overloaded functions far more often than to any individual function, so
in documentation I write "search()" to mean "search( [anything] )",
& "search(V)" to mean that
  search();
should be executed. (Remember that "V" abbreviates "void".) This is not a
good reason for coding prototypes like
  I search(V);
instead of
  I search();
because when writing actual code, as opposed to documentation, correct C++ is
always unambiguous, & should be used in its most concise form to make room
on the line for long names.

===CLASS LAYOUT===

Stroustrup 91 pp372ff argues that the unit of design & documentation in C++
should not be the class, but components composed of several classes.
I define a module as a component between which & the rest of a system
there is a two-way barrier to the repercussions of change. Usually this
is best achieved by defining an API for the module, & trying to code the
implementation in a way that allows it to be modified without affecting
the interface. In C++, the interface goes in the .h & the implementation
goes in the .cpp; so I put the documentation of the API in the .h as well,
in a header block like this one.

Because the class is /not/ a unit of design & documentation, I think Coplien
is wrong in /Advanced C++/ (1992) when on pp38ff he advocates the form
  class Oof {
  public:
    //Full documentation of interface
  private:
    //Implementation
  };
as "the Orthodox Canonical Class Form" [sic]; my heterodox preference is for
  class Oof {
    //all data members
  public:
    //public methods
  private:
    //private methods
  };
because a class is part of an implementation, not part of an interface,
& the first thing a maintenance programmer needs to know about a class
is what it costs to instantiate its objects; that is, how big are all its
data members together, & are they of types that require special handling
(such as pointer initialization, possibly to object-owned data) in [cd]tors.

A variation on that becomes necessary when local enum{}s are used, since
they need to be seen by the compiler before the rest of the class, but
typically need to be public. I code that as
  struct Oof {
    //enum{}s
  private:
    //all data members
  public:
    //public methods
  private:
    //private methods
  };
using the struct/class distinction only to select whether the first block
of members is public or private; I don't use structs as archaisms.

===INDENTATION===

The leading keyword of a control structure is always comarginal with its
closing brace. This is necessary to ensure that there's room on the line that
begins with the concluding brace for a comment that quotes the initial line
of the control structure; if the closing brace were comarginal with the
enclosed statements, its indentation would more often prevent a full quote.

I think the Ada form
    IF condition THEN
      action
    ELSIF someOtherCondition THEN
      someOtherAction
    ELSIF yetAnotherCondition THEN
      yetAnotherAction
    ELSE
      defaultAction
    ENDIF;
is easier to read than the Pascal form
    IF condition THEN
      BEGIN
        action
      END
    ELSE IF someOtherCondition THEN
      BEGIN
        someOtherAction
      END
    ELSE IF yetAnotherCondition THEN
      BEGIN
        yetAnotherAction
      END
    ELSE
      BEGIN
        defaultAction
      END;
not just because it takes fewer lines of code (which matters), but also
because it has fewer visually-separate lexemes needed to denote each concept
that in the mind of the programmer is a single semantic unit. In C++, I code
    if( condition ){
      action;
    }else if( someOtherCondition ){
      someOtherAction;
    }else if( yetAnotherCondition ){
      yetAnotherAction;
    }else{
      defaultAction;
    }//if( condition )
to get the effect of Ada's fewer lexemes; in particular, I code "}else{"
rather than "} else {" because I want to think of it as 1 lexeme, not 3.
Also, the analogous prettyprint leaves a bit more room in "}else if(){"s.

The biggest conflict between me & the lexical analyzer occurs in switch(){}
statements, for which my most radical prettyprint is
    switch( whatever ){ case value0:{
      action0;
    }break;case value1:{
      action1;
    }break;case value2:{
      action2;
    }break;case value3:{
      action3;
    }break;default:{
      action4;
    }}//switch( whatever )
The theory is that all & only code lines that are part of the control
structure should be comarginal with its leading keyword.

That concept is most valuable where it's most difficult to implement:
statements like break & continue, which, altho they're part of the control
structure, are usually nested within contained control structures of which
they're not part. I deal with this by putting a semicolon left of the nested
control statement; the semicolon is comarginal with the other lexemes of the
control structures of which the nested control statement is intended to be
part, but the nested control statement itself is indented in the usual way to
show its relationship to the structures that control when it's executed. In
    for( the first time; until the last time; time after time ){
      while( wondering in front of my monitor ){
        if( programming is an endless task ){
    ;     continue;
        }else{
          why end every statement with a semicolon;
        }//if()
      }//while()
    }//for()
the position of the semicolon clearly shows that the continue is intended to
be part of the for(){} control structure. (Keep reading.)

This points out a fallacy in the argument that comments are bad because they
might not describe what the code actually does. In this case, the ";" is
a comment that does not describe what the code actually does; the continue is
part of the while(){}, not the for(){}. However, it's precious for just that
reason, since it indicates that when the continue was coded, it was
/intended/ to be part of the for(){}, & so the code as it stands doesn't
correspond to the original intent of the programmer. (It's likely in a
situation like this that the inner while(){} was an afterthought, & the
need to replace the continue with a labeled goto wasn't noticed.) It would
be a mistake to just reposition the ";" to correctly document the control
structure; instead, spotting a discrepancy like this (or a discrepancy
between narrative documentation & what the code actually does) is a reason
to stop & carefully reread all the code, figuring out what was originally
intended, & whether the intent later changed (PVCS archives can help with
this) or the intial implementation of the intent was wrong, & what the
consequences have been. THIS ACTUALLY HAPPENED: it was a switch(){} inside
a while(){}, where the switch(){} contained what was intended to be a break
out of the while(){}; the fault resulted from converting to a switch(){} what
had been an if(){}else if(){}else{}. Furthermore, the fault was spotted
before it was ever executed, just because, during the process of stepping
thru nearby code with Turbo Debugger, the misplaced ";" was noticed.

I consider function calls like exit() & die() to be part of the "structure"
that constitutes the function they're in; global functions have their
structure lexemes in column 1; classes have them comarginal with "class", but
their methods as well as their data members are indented.

Here is a version of an esoteric control structure that I've found myself
using several times in my programming career. I've usually developed my own
form for it in whatever programming language I was using; it's shown here in
a C++ form that duplicates the semantics of a control structure Knuth
defended in /Structured Programming with Goto Statements/ (1974).

    /*Knuth structure*/ switch( db.mode ){ default:{
  ;   now8( false,,"Program failure, systems level: db.mode is garbage" );
    }case DB::addOrUpdate:{
      if( dbStatus == errorCode_notFound ){
    ;   goto doAdd;
      }else{
    ;   goto doUpdate;
      }
    }case DB::addOnly:{
      if( dbStatus == errorCode_notFound ){
    ;   goto doAdd;
      }else{
  ;     now8( false, errorCode_recordAlreadyExists, );
      }
    }case DB::updateOnly:{
      if( dbStatus == errorCode_recordNotFound ){
  ;     now8( false, errorCode_recordNotFound, );
      }else{
    ;   goto doUpdate;
      }
    }case DB::readOnly:{
      if( dbStatus == errorCode_recordNotFound ){
  ;     now8( false, errorCode_recordNotFound, );
      }else{
    ;   goto endKnuthStructure;
      }
    }}doUpdate:{
      //...
    ; goto endKnuthStructure;
    }doAdd:{
      //...
    ; goto endKnuthStructure;
    }endKnuthStructure://switch( db.mode )

===PRAGMAS AS DOCUMENTATION===

I sometimes use "#pragma fix" as documentation of a needed fix. This
is because it's becoming increasingly popular for program editors to offer
syntax highlighting; the Borland C++ 3.1 DOS IDE does it, & #pragma lines
stand out in bright green, whereas comment lines are gray. This usually makes
it optimal to disable the "illformed #pragma" warning during early system
development, but to enable it when the project is on the final stretch, since
by then there should be few warning messages of any type, & remaining needed
fixes are thus pointed out by the compiler.

===SPACING===

In Pascal, I used to write code laid out like this:
   J := Round (Exp (Ln (10.0)) * I));
Pascal has no exponentiation operator, so it has to be coded explicitly with
nested function calls, including Round() to convert the real to an integer if
necessary. Compare your experience reading that layout with this one:
   J := Round(   Exp(  Ln(10.0)*I  )   );
This second format is much easier to read, but it broke all the rules
about spaces around "()" and "*". Subsequent experience inclines me
to use that new formatting approach in most of my one-line invocations.

What's fascinating here--and this is an insight into software standardization
methodology--is that the old rules were broken FOR THE SAME REASON THEY WERE
ORIGINALLY DEVELOPED: to separate the elements of expressions so they could
be easily seen. In an authoritarian programming environment, non-managerial
coders would be afraid to break such rules (had they been standardized), and
the rules would thereby have defeated their own purpose. Such standardization
is a realistic fear: Cobol syntactically *requires* formatting in my older,
inferior, style.

My preference now is for code like
  if( condition ) ...
&
  function(  arg,  fn(i),  fn( i + j/k ),  arg  )
except that declarations & definitions of functions have layouts like
  function ( Type1, Type2, Type3, Type4 )
because the space after the function's name is easily recognized by
editor macros that produce selection menus of all the classes & functions
in a file. Note that this can't be done with parameterized macros.

\***************************************************************************/

#ifndef WM_ROOT_H
#define WM_ROOT_H

//This #include begins with nested #includes of Borland's standard headers,
//so everything can be precompiled & forgotten about. This is also safer
//than selectively #including needed headers, since it gets dibs on the
//standard library's namespace; if you accidentally use a standard library
//name, you'll get an error message immediately, instead of only discovering
//it when you decide you need that header. (Current C++ implementations don't
//yet support namespaces as explicit constructs in the language.)

#include <ALLOC.H>
#include <ASSERT.H>
#include <BCD.H>
#include <BIOS.H>
#include <CONIO.H>
#include <CTYPE.H>
#include <DIR.H>
#include <DIRECT.H>
#include <DOS.H>
#include <ERRNO.H>
#include <FCNTL.H>
#include <FLOAT.H>
#include <FSTREAM.H>
#include <GENERIC.H>
#include <IO.H>
#include <IOMANIP.H>
#include <IOSTREAM.H>
#include <LIMITS.H>
#include <LOCALE.H>
#include <MATH.H>
#include <MEM.H>
#include <NEW.H>
#include <PROCESS.H>
#include <SETJMP.H>
#include <SIGNAL.H>
#include <STDARG.H>
#include <STDDEF.H>
#include <STDIO.H>
#include <STDIOSTR.H>
#include <STDLIB.H>
#include <STRING.H>
#include <STRSTREA.H>
#include <SYS/STAT.H>
#include <TIME.H>
#include <VALUES.H>

//pedef bool            B;
typedef char            C;
typedef double          D;
#define                 E (ostream &) cerr <<
#define                 F(fillC) setfill(fillC) <<
#define                 H handle
typedef int             I;
#define                 K const
typedef long            L;
typedef long double     LD;
#define                 N << endl
#define                 O (ostream &) cout <<
#define                 P(precision) setprecision(precision) <<
#define                 S << P(0) setfill(' ')
typedef unsigned        U;
typedef unsigned char   UC;
typedef unsigned long   UL;
typedef void            V;
#define                 W(width) setw(width) <<

  //These
  //  typedef long     L;
  //  #define          U unsigned
  //  U L kludgetest;
  //give "Syntax error: 'L' previously declared as something else".
  //No combination of #defines with typedefs is possible.
  //2 #defines together work, but the L"widestring" syntax could fail.

#if sizeof(size_t) == sizeof(U)
  #define size_t_max UINT_MAX
#elif sizeof(size_t) == sizeof(L)
  #define size_t_max ULONG_MAX
#else
  #error Unable to recognize sizeof(size_t)
#endif

//I occasionally use a class that's just a placeholder. It was originally
//used in a container-class API that had a method for removing an object
//from a container in the process of copying it into a target variable;
//merely deleting the object was coded as copying it into a bit-bucket
//variable, which was named "nul" (MS-DOS's name for its bit bucket).
//(This was concise because the method was an operator, not a function.)

//The object was named "nul" & the class was named "Nul", but coding
//  class Nul {} nul;
//would require a .cpp file just to contain the single copy of the nul object
//that is in fact just syntactic sugar, not an actually-desired named area of
//storage. The following approach avoids that.

struct Nul { Nul(){} };
#define nul Nul()

//Borland C++ v3.1 allows the user to frob an IDE radio button or a command-
//line compiler option specifying whether or not comments nest. The following
//const int is useful in proving that this compiler option actually has no
//effect. There are several such options in Borland C++, specifyable but
//actually ignored by the compiler; another is significant identifier length.

K commentsNest = /*/*/0*/**/1; //Andy Koenig's /C...Pitfalls/ (Doug McIlroy)

#endif //#ifndef WM_ROOT_H
