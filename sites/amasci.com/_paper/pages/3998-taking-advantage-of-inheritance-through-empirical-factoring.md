---
title: "Taking Advantage of Inheritance Through Empirical Factoring"
source_domain: amasci.com
source_path: ~johnnyb/computers/FactoringInheritance/factoringinheritance.html
order: 3998
reachable_from_entry: false
images: 0
internal_links: 39
extracted: 2026-08-07T17:10:45Z
extractor: site_to_paper.py (pandoc)
---

# Taking Advantage of Inheritance Through Empirical Factoring

*Source page: `~johnnyb/computers/FactoringInheritance/factoringinheritance.html`*

# Taking Advantage of Inheritance Through Empirical Factoring

**Jonathan Bartlett**

**December 1998**

\

## <span id="SECTION00010000000000000000">Contents</span>

- <a href="factoringinheritance.html" id="tex2html24">Contents</a>
- <a href="factoringinheritance.html#SECTION00020000000000000000" id="tex2html25">Why Object-Orientation is Important</a>
  - <a href="factoringinheritance.html#SECTION00021000000000000000" id="tex2html26">The Usefulness of Operational Definitions</a>
  - <a href="factoringinheritance.html#SECTION00022000000000000000" id="tex2html27">Inheriting For Reuse</a>
  - <a href="factoringinheritance.html#SECTION00023000000000000000" id="tex2html28">Creating Inheritance Trees Empirically</a>
- <a href="factoringinheritance.html#SECTION00030000000000000000" id="tex2html29">Rules of Object-Oriented Inheritance</a>
  - <a href="factoringinheritance.html#SECTION00031000000000000000" id="tex2html30">Finding the Greatest Common Factor<sup>7</sup></a>
  - <a href="factoringinheritance.html#SECTION00032000000000000000" id="tex2html31">Changing States, not Classes</a>
  - <a href="factoringinheritance.html#SECTION00033000000000000000" id="tex2html32">Access of Non-Constant Data</a>
  - <a href="factoringinheritance.html#SECTION00034000000000000000" id="tex2html33">Unused Data Rule</a>
  - <a href="factoringinheritance.html#SECTION00035000000000000000" id="tex2html34">Compatibility of Subclass Methods</a>
- <a href="factoringinheritance.html#SECTION00040000000000000000" id="tex2html35">Conclusions</a>
  - <a href="factoringinheritance.html#SECTION00041000000000000000" id="tex2html36">The Intended Result - Stable Intermediate Forms</a>
  - <a href="factoringinheritance.html#SECTION00042000000000000000" id="tex2html37">Empiricism over Mysticism</a>
  - <a href="factoringinheritance.html#SECTION00043000000000000000" id="tex2html38">With a Grain of Salt</a>
- <a href="factoringinheritance.html#SECTION00050000000000000000" id="tex2html39">Bibliography</a>

# <span id="SECTION00020000000000000000">Why Object-Orientation is Important</span>

Object oriented programming is the current revolution in programming techniques. Object-oriented programming attempts to make extendable, reusable systems. It does this by creating a dynamic typing system, where new types and typing rules can be created by the programmer. This allows the programmer to customize his environment to better suit the problem, encapsulating the underlying structure and semantics of the programming language to suit the current structure and semantics of the problem at hand. However, just like any other methodology, it can be used both poorly and well. This paper intends to give some of the goals and criteria for the judgment and production of object-oriented systems.

## <span id="SECTION00021000000000000000">The Usefulness of Operational Definitions</span>

Traditional definitions of objects, generalizations, etc. in history have generally been definitions that consist of *what attributes* different objects in the world have. A chair would be defined as a piece of furniture with four legs, a seat, and a back. However, the problem with defining a chair in terms of its attributes is that there are many chairs with three legs, which have no backs, or have similar variations. What makes them still be called a chair?

Operational definitions are the answer to this problem. Operational definitions, instead of listing the attributes of an object, list the functions of an object. An operational definition of a chair would be *something a person sits on*. Therefore, all sorts of shapes and sizes of furniture can be chairs, as long as a person can sit on it. This allows a person to be able to treat all chairs similarly without having to worry about how the chair's structure enables its function. I don't have to figure out how a bean bag chair holds me up, all I have to know is that I can sit on it.

Similarly, object-oriented programming allows the programmer to publicly describe objects based on what they can do (their methods) rather than on what they look like (their implementation). This allows algorithms to operate on all similarly functioning classes equally well, without having to know anything about their implementation. This leads to three main advantages to object-oriented programming.

- Programs do not have to explicitly know the exact types of data they deal with in order to use them - they must only know the set of methods which they implement
- Programmers can add additional classes and integrate them with existing programs without having to change anything in the existing program (except for a recompile in some languages)<a href="#fnm1" id="footfnm1"><sup>1</sup></a>
- Programmers can declare a general set of methods to which other classes must conform, enabling other methods and objects to use any of these declarations without knowing the specific type of the object
- Programs can minimize dependency problems by being dependent on a common, stable set of classes.<a href="#fnm2" id="footfnm2"><sup>2</sup></a>

## <span id="SECTION00022000000000000000">Inheriting For Reuse</span>

There are two main reasons for inheritance in object-oriented systems - interface reuse and implementation reuse. Implementation reuse is also called private inheritance. It uses another piece of code as its base, but limits and expands its interface for a new situation. However, since the interface of the object was not inherited, it cannot be used in the same algorithms as the superclass.<a href="#foot29" id="tex2html1"><sup>3</sup></a> This kind of inheritance does not produce the same kinds of advantages that interface reuse brings. In fact, many theorists think that it should not be allowed at all and should only be simulated through aggregation(is-composed-of) relationships.

Interface (also called facility) reuse is a much more powerful feature of object-oriented systems. Interface reuse means that all subclasses must implement all of the interface of the superclass. Data and implementation can be inherited too, but that is not the major consideration. Interface reuse allows objects and classes to be used in algorithms that did not know of their existence. This is done by defining new classes in terms of existing interfaces.<a href="#foot30" id="tex2html2"><sup>4</sup></a> This kind of reuse gives the greatest amount of flexibility and extensibility to object-oriented systems. Therefore, this paper will focus on interface reuse and inheritance and not implementation reuse.

## <span id="SECTION00023000000000000000">Creating Inheritance Trees Empirically</span>

The object-oriented field needs a set of criteria to judge the correctness of inheritance trees. Codd's rules of relational databases were meant to bring the best utilization of the relational design model. Codd's rules were made to put as much of the burden on the DBMS as possible. The rules of object-oriented programming are made to put as much of the work on the class hierarchy as possible. These rules will make the programmer make the best use of object-oriented principles, and will make the best use of the facilities available within object-oriented programming languages.

These rules only work when applied to existing class definitions. Class definitions can be reworked to take better advantage of these rules, but that is outside the scope of this paper. There are many existing papers describing the process of creating good class definitions, and I will not duplicate their work.<a href="#foot96" id="tex2html3"><sup>5</sup></a> However, the inheritance hierarchy should only be created after all classes and class methods have been defined. As will be shown, inheritance is an empirical matter which is decided from examining the commonalities within existing classes and methods. Inheritance is not decided by formulating conceptions beforehand and trying to impose inheritance on classes.<a href="#foot33" id="tex2html4"><sup>6</sup></a>

# <span id="SECTION00030000000000000000">Rules of Object-Oriented Inheritance</span>

## <span id="SECTION00031000000000000000">Finding the Greatest Common Factor</span><a href="#foot35" id="tex2html5"><sup>7</sup></a>

Inheritance in object-oriented systems can be viewed as a factoring process. The way to find the greatest common factor between two numbers is to show all of the prime factors for which each are composed and then find all of the factors that exist in both sets. The same method is employed when dealing with inheritance. A superclass is simply a set of methods which is in common between two already-defined classes. Thus, a superclass could be considered a *factor* of existing classes. This paper will refer to factors and superclasses synonymously. Most work in the field of object-oriented programming has dealt with creating subclasses from superclasses, which is called subclassing. However, this paper deals with the empirical process of creating superclasses from subclasses, which I will call factoring.

Object-oriented systems should have all common and similarly functioning methods of any two classes factored into at least one common superclass. This means that any two classes which share *any* method(s) should also share a superclass. For example, if we wrote a program that could read a variety of file systems (MSDOS, Mac HFS, ISO9660, etc.), we could put each file system in its own class. Now, each file system would probably have a getFile(filename) method. Therefore, all of our file systems would need a common superclass that would have a getFile(filename) method,<a href="#foot38" id="tex2html6"><sup>8</sup></a> which would probably be called the Filesystem class.<a href="#foot39" id="tex2html7"><sup>9</sup></a>

This factoring of classes into superclasses has one really great benefit - algorithms can use a variety of different subclasses without having to know which one it is using. For example, in our file system case, a program could be passed a Filesystem object (an instance of any of the subclasses), and it could simply call getFile without caring which Filesystem subclass it was using, or even having to know which Filesystem subclasses are available at compile time. Therefore, as more and more Filesystem subclasses are implemented, programs using the generic Filesystem class would not have to be modified in order to use the new file systems. This prevents any algorithm from being locked into a specific implementation of a class and allows it to use any class that can perform the same function. According to Singer,

> A primary benefit of using specialization relationships in analysis is to improve the clarity of the model . . . It also allows one to easily refer to the common properties of many types without enumerating them each time . . . It also allows use of the supertype in the program to represent uses of the subtype and to be able to add additional subtypes without affecting any of the properties or behavior of the supertype.<a href="#foot41" id="tex2html8"><sup>10</sup></a>

The one problem with this is, however, that all of the common methods among subclasses must accept the same inputs and have the same runtime errors defined. For example, the getFile method must be able to take a filename of any length for all of the file systems. This, however, is not a problem if specific errors are defined in the superclass to be checked, such as file name too long or file not found. One thing to notice, however, is that there are two types of factors involved in factoring classes, feature factors and ISA factors.<a href="#foot43" id="tex2html9"><sup>11</sup></a>

### <span id="SECTION00031100000000000000">ISA Factors</span>

An ISA factor<a href="#foot45" id="tex2html10"><sup>12</sup></a> is what most people refer to as a superclass. It means that the classes which have common methods *are a type of* that common object. In our file system example, the Filesystem class was an ISA factor, because each class *is a* Filesystem. It is important for any class to only have one ISA factor.<a href="#foot48" id="tex2html11"><sup>13</sup></a> Often times, ISA factors share data and implementation methods as well as the interface specifications (methods), although this is not required.

### <span id="SECTION00031200000000000000">Feature Factors</span>

A feature factor is simply a list of operations that many classes have in common. They are called feature factors because they simply list methods that are available, and they are usually grouped around a specific function. The factors themselves only contain the interface, and contain no data or implementation specifics. For example, there could be a system where many different object types (text, graphics, etc.) could be sent to the printer with the printMe(printer) method. This would mean that there could be a feature factor called Printable which contained the method printMe(printer). Any class that wanted to be able to be printed would have Printable as a factor. Also, since feature factors are simply a list of abilities of an object, a class could implement as many feature factors as desired.<a href="#foot52" id="tex2html12"><sup>14</sup></a> This is similar to multiple inheritance, but it doesn't have the complexity involved with inheriting code and data. Feature factors are also called *interfaces* in Java and *Mixin Classes*<a href="#foot55" id="tex2html13"><sup>15</sup></a> in systems that support multiple inheritance. In systems that implement late binding such as Perl and Smalltalk, feature factors don't need to be explicitly declared, but they should be at least documented for clarification.

### <span id="SECTION00031300000000000000">Deciding Between ISA and Feature Factors</span>

Theoretically, all factorizations could be done with feature factors instead of ISA factors. However, many applications benefit from a single inheritance line of code reuse, because it prevents code rewriting. The best way to decide which factors should be ISA factors is to figure out which factors will share the most code between subclasses.

### <span id="SECTION00031400000000000000">Using Factors Well</span>

In order to make the best use of feature factors and ISA factors within a program, method interfaces should specify the highest superclass or factor available that can get the job done. For example, in the file system situation, if a program only used behaviors that were available in the Filesystem supertype yet specified a specific file system like Mac HFS in its interface, it would lose the flexibility that was gained through factoring. It would be unnecessarily tied to the specific implementation.

## <span id="SECTION00032000000000000000">Changing States, not Classes</span>

The next rule of object-oriented programming is that objects should never change their class type, only their states within a class. For example, it would be erroneous for me to create a superclass Person, and then two subclasses of person, Executive and Worker. The problem is that when an object changes its class, the operations available change as well. So, if a client class were holding a Worker, and the person suddenly got promoted to an Executive, the assumed operations available would change, and client classes would no longer be able to assume that any of the class's operations were available. It would instead have to continually test for which type it was holding in order to find out which operations were available. This would nullify all of the advantages of object-oriented programming. This can be avoided by having things such as age and occupation be attributes of a class, and not subclasses of them.<a href="#foot59" id="tex2html14"><sup>16</sup></a>

Subclasses *must* differ from their superclass by either overrided methods or by extending its set of methods. Usually both will occur. Changes in attribute *values* should not create a change in class, only a change in state. This prevents breaks in the inheritance chain which are unnecessary and could lead to multiple inheritance and object state changes. For example, if there was a class Ball which had a method called bounce(), there should not be subclasses for red and blue balls, because the operation of the ball has not changed. If we were to later add subclasses to Ball which could each be red or blue, we would have to resort to multiple inheritance or interfaces (feature factors) in order to account for all of the variations. This whole mess could be avoided by simply adding setColor and getColor methods to Ball and leaving the color as a changeable attribute, not as a part of the type.<a href="#foot62" id="tex2html15"><sup>17</sup></a>

## <span id="SECTION00033000000000000000">Access of Non-Constant Data</span>

All access to non-constant data should be in the form of a method call, not a direct memory access. This is actually a class design rule, not an inheritance rule. However, the impact it has on inheritance warranted its inclusion here.

The reason for this rule is this - if the implementation of the class ever changes in such a way as to have that value calculated instead of stored, the other classes which use that class would have to be rewritten. Inheritance also becomes difficult because subclasses are forced to share implementation with the superclass, not just the interface. For example, if a subclass calculated a value instead of storing it, it would break compatibility with the superclass. Data in a class should be considered the private property of the class, and access should be explicitly given or restricted through method calls only.<a href="#foot64" id="tex2html16"><sup>18</sup></a>

## <span id="SECTION00034000000000000000">Unused Data Rule</span>

This rule is for ISA factors (superclasses which declare both the interface and implementation). No subclass of an ISA factor should leave data elements of the factor unused.<a href="#foot66" id="tex2html17"><sup>19</sup></a> This creates waste of memory by the system, which can readily cause problems if the subclass is instantiated several times. Also, it can lead to unintended side-effects later down the road.

Having unused data is is usually a symptom of either of these two problems:

- The factor is used as an ISA factor when it should only be a feature factor
- The factor, although it is an ISA factor, declares too many implementation details.

These two situations are very similar, and the diagnosis is mostly a judgment call. The only difference is in the solutions. The solution to the first problem is this: First, move the common methods to a feature factor. Then, put the superclass and the subclass in different inheritance hierarchies,<a href="#foot69" id="tex2html18"><sup>20</sup></a> but have them both implement the same feature factor. The solution to the second problem is to create a third class which is also a subclass of the given ISA factor. The implementation details in the superclass which conflict with the subclass would be moved to the newly created class. This normally leaves the superclass as an abstract class.

For example, a system could have classes for a WagedWorker class and an Executive class.<a href="#foot70" id="tex2html19"><sup>21</sup></a> Because the WagedWorker and the Executive both have the computePay method, the Executive class is declared as a subclass of the WagedWorker class. However, the WagedWorker's pay is calculated based on the hoursWorked and payPerHour data elements which are stored in the class, while the Executive's pay is calculated solely on the basis of salary. However, instances of the Executive class will still contain the hoursWorked and payPerHour data fields, since they are a part of the WagedWorker superclass, even though they now have no use. As mentioned, this could be solved in two ways.

- The WagedWorker and the Executive classes could be put into separate inheritance lines, and a feature factor, called PaidJob, could be defined which would be included by both the WagedWorker and the Executive classes
- Instead of just being a feature factor, the PaidJob class could be an ISA factor that only has the declaration of the computePay method without the implementation. Then, the WagedWorker and the Executive classes would each inherit from it.

## <span id="SECTION00035000000000000000">Compatibility of Subclass Methods</span>

As mentioned earlier, in order to be useful, classes which inherit methods from other classes (either feature factors or ISA factors) must be compatible with the same types of data and sequences of operations. What this means is that everywhere a superclass (or factor) is expected, any subclass could be substituted and it would work properly. This is known as the Liskov substitution principle. Essentially, this means that in a given situation, all subclasses of a superclass must perform their operations in a way that is compatible with the subclass.<a href="#foot74" id="tex2html20"><sup>22</sup></a> This means that simply having the same method name and parameters may not be enough. Subclasses must also produce the same types of errors (subclasses cannot invent their own), and be able to be executed in the same sequence as the superclass.<a href="#foot75" id="tex2html21"><sup>23</sup></a>

Subclasses cannot be more restrictive than superclasses classes on parameters passed to their methods, they can be more restrictive on their returns. Otherwise, the client objects would have to test for class types before sending messages, thereby upsetting the whole object-oriented system.<a href="#foot76" id="tex2html22"><sup>24</sup></a> Also, they need to be able to follow the same state transition diagrams as their superclasses (factors). One of the current deficiencies of object-oriented programming is that state transition diagrams must be enforced by the programmers, not the language.

# <span id="SECTION00040000000000000000">Conclusions</span>

## <span id="SECTION00041000000000000000">The Intended Result - Stable Intermediate Forms</span>

Although these rules are useful, they can only have their greatest benefit when classes are designed with this ordering in mind. Programmers need to be looking for ways in which methods can be shared among the greatest number of classes. If this is done, after analyzing classes and deciding on the inheritance hierarchy, there should develop a set of factors which will remain relatively stable throughout software versions. Many of the common methods of existing classes will also be common with future classes. This intermediate classes will then become the stabilizing force of the software development process. According to Berard, having these stable intermediate classes are what makes an application scalable through increasingly complex versions.<a href="#foot79" id="tex2html23"><sup>25</sup></a>

## <span id="SECTION00042000000000000000">Empiricism over Mysticism</span>

As shown, the process of creating inheritance hierarchies should not be a mystical experience. Instead, it should be grounded on solid principles. Many developers follow this plan intuitively, but it is better to have it spelled out so that others do not have to rely on their gut feelings to make good programming choices. These rules should make the greatest use of object-oriented inheritance without misusing its ideas.

## <span id="SECTION00043000000000000000">With a Grain of Salt</span>

All the rules and guidelines known to man will not beat good intuition, common sense, or performance requirements. These guidelines are meant to put more of the work on the programming language and less on the programmer. Therefore, if other considerations are more pressing than ease of programming, or if these rules get in the way of programming, there is nothing sacred about any of these rules. As always, use judgment. However, I believe these rules will help programmers to see where and how their object designs could be restructured.

## <span id="SECTIONREF">Bibliography</span>

<span id="1">1</span>

Berard, Edward V. Essays on Object-Oriented Software Engineering. Englewood Cliffs, N.J.: Prentice Hall, 1993.

<span id="2">2</span>

Eliens, Anton. Principles of Object-Oriented Software Development. Wokingham, England: Addison-Wesley Publishing Company, 1995.

<span id="2">2</span>

Henderson-Sellers, Brian. A Book of Object-Oriented Knowledge: Object-Oriented Analysis, Design, and Implementation: A New Approach to Software Engineering. New York: Prentice Hall, 1992.

<span id="5">3</span>

Johnson, Ralph E. and Brian Footer. "Designing Reusable Classes" in Journal of Object Oriented Programming June/July 1988, Volume 1, Number 2, pgs 22-35. Available online at http://www.laputan.org/drc/drc.html, accessed December 7, 1998.

<span id="5">3</span>

Meyer, Bertrand, ISE. *Object-Oriented Software Construction, 2nd Edition.* Prentice Hall, 1997. Chapter 25, \`\`Using Inheritance,'' Available Online at http://www.eiffel.com/doc/manuals/technology/oosc/inheritance-design/index.html, accessed December 7, 1998.

<span id="6">4</span>

Rumbaugh, Dr. James. \`\`Disinherited! Examples of Misuse of Inheritance.'' http://www.rational.com/support/techpapers/omt/joop9302.html, February, 1993. Accessed December 7, 1998.

<span id="5">3</span>

Singer, Gilbert L. Object Technology Strategies and Tactics. New York: SIGS Books and Multimedia, 1996.

# <span id="SECTION00060000000000000000">About this document ...</span>

**Taking Advantage of Inheritance Through Empirical Factoring**

This document was generated using the [**LaTeX**2`HTML`](http://www-dsed.llnl.gov/files/programs/unix/latex2html/manual/) translator Version 98.2 beta6 (August 14th, 1998)

Copyright © 1993, 1994, 1995, 1996, [Nikos Drakos](http://cbl.leeds.ac.uk/nikos/personal.html), Computer Based Learning Unit, University of Leeds.\
Copyright © 1997, 1998, [Ross Moore](http://www-math.mpce.mq.edu.au/~ross/), Mathematics Department, Macquarie University, Sydney.

The command line arguments were:\
**latex2html** `-split 0 factoringinheritance.tex`

The translation was initiated by Jonathan Bartlett on 1999-12-14\

------------------------------------------------------------------------

#### Footnotes

<span id="fnm1">... languages)<sup>1</sup></span>  
Singer, 117.

<span id="fnm2">... classes.<sup>2</sup></span>  
Berard, 76.

<span id="foot29">... superclass.</span><a href="factoringinheritance.html#tex2html1" id="foot29"><sup>3</sup></a>  
Meyer, http://www.eiffel.com/doc/manuals/technology/oosc/inheritance-design/section_08.html.

<span id="foot30">... interfaces.</span><a href="factoringinheritance.html#tex2html2" id="foot30"><sup>4</sup></a>  
Meyer, http://www.eiffel.com/doc/manuals/technology/oosc/inheritance-design/section_09.html.

<span id="foot96">... work.</span><a href="factoringinheritance.html#tex2html3" id="foot96"><sup>5</sup></a>  
http://www.laputan.org/drc/drc.html is a great example of a paper on this subject, as well as http://www.cse.unsw.edu.au/~timm/pub/subjects/oois96/rules.html.

<span id="foot33">... classes.</span><a href="factoringinheritance.html#tex2html4" id="foot33"><sup>6</sup></a>  
The empirical method of deciding which classes inherit from others will eliminate what is, according to Rumbaugh, one of the main problems new object oriented programmers have with inheritance - using inheritance where aggregation is more appropriate.

<span id="foot35">... Factor</span><a href="factoringinheritance.html#tex2html5" id="foot35"><sup>7</sup></a>  
In this paper, base classes are often referred to as factors, because they function as a subset of the methods offered by a subclass. The least common denominator between subclasses refers to the fact that many classes have certain methods in common, and there should be superclasses defined which take advantage of the greatest common set of methods between classes.

<span id="foot38">... method,</span><a href="factoringinheritance.html#tex2html6" id="foot38"><sup>8</sup></a>  
This class would not have to define any implementation of the getFile method, only be a placeholder for it. This could be an actual class, or it could be an abstract class. The only thing is that it needs to have a getFile(filename) method defined.

<span id="foot39">... class.</span><a href="factoringinheritance.html#tex2html7" id="foot39"><sup>9</sup></a>  
There would probably be several methods that were common to all filesystems that would be implemented here.

<span id="foot41">... supertype.</span><a href="factoringinheritance.html#tex2html8" id="foot41"><sup>10</sup></a>  
Singer, 117.

<span id="foot43">... factors.</span><a href="factoringinheritance.html#tex2html9" id="foot43"><sup>11</sup></a>  
This is terminology I made up in order to better reflect the functions of the two types of superclasses. Typically, feature factors are called interfaces or mixin classes, and ISA factors are called base classes.

<span id="foot45">... factor</span><a href="factoringinheritance.html#tex2html10" id="foot45"><sup>12</sup></a>  
They are called ISA factors because the classes are a type of the superclass.

<span id="foot48">... factor.</span><a href="factoringinheritance.html#tex2html11" id="foot48"><sup>13</sup></a>  
This is also called single inheritance. Having one line of inheritance keeps the namespace from getting cluttered as well as prevent inheritance relationships which should be aggregation relationships.

<span id="foot52">... desired.</span><a href="factoringinheritance.html#tex2html12" id="foot52"><sup>14</sup></a>  
Henderson-Sellers, 247.

<span id="foot55">... Classes</span><a href="factoringinheritance.html#tex2html13" id="foot55"><sup>15</sup></a>  
implemented as abstract base classes

<span id="foot59">... them.</span><a href="factoringinheritance.html#tex2html14" id="foot59"><sup>16</sup></a>  
Johnson and Footer, http://www.laputan.org/drc/drc.html.

<span id="foot62">... type.</span><a href="factoringinheritance.html#tex2html15" id="foot62"><sup>17</sup></a>  
Rumbaugh, http://www.rational.com/support/techpapers/omt/joop9302.html.

<span id="foot64">... only.</span><a href="factoringinheritance.html#tex2html16" id="foot64"><sup>18</sup></a>  
Johnson and Footer, http://www.laputan.org/drc/drc.html.

<span id="foot66">... unused.</span><a href="factoringinheritance.html#tex2html17" id="foot66"><sup>19</sup></a>  
This does not mean that the subclass has to explicitly refer to all the data elements, only that it does not render data elements useless through overriding methods.

<span id="foot69">... hierarchies,</span><a href="factoringinheritance.html#tex2html18" id="foot69"><sup>20</sup></a>  
Note that now the two classes will no longer have a superclass/subclass relationship.

<span id="foot70">... class.</span><a href="factoringinheritance.html#tex2html19" id="foot70"><sup>21</sup></a>  
This example is shown to have other problems as well, but it illustrates the point well.

<span id="foot74">... subclass.</span><a href="factoringinheritance.html#tex2html20" id="foot74"><sup>22</sup></a>  
Eliens had a stricter view on this, saying that the operations had to duplicate the superclass behaviors exactly. However, this is almost impossible to do. The method proposed by Liskov is more pragmatic, and leaves the designer of the class responsible for determining the compatibility with the superclass.

<span id="foot75">... superclass.</span><a href="factoringinheritance.html#tex2html21" id="foot75"><sup>23</sup></a>  
http://c2.com/cgi/wiki?OoDesignPrinciples

<span id="foot76">... system.</span><a href="factoringinheritance.html#tex2html22" id="foot76"><sup>24</sup></a>  
Eliens 282 - 283

<span id="foot79">... versions.</span><a href="factoringinheritance.html#tex2html23" id="foot79"><sup>25</sup></a>  
Berard, 76.

------------------------------------------------------------------------

*Jonathan Bartlett*\
*1999-12-14*
