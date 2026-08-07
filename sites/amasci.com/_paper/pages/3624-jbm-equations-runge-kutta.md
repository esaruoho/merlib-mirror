---
title: "JBM - Equations - Runge Kutta"
source_domain: amasci.com
source_path: ~jbm/equations/rk.html
order: 3624
reachable_from_entry: false
images: 0
internal_links: 12
extracted: 2026-08-07T05:56:55Z
extractor: site_to_paper.py (pandoc)
---

# JBM - Equations - Runge Kutta

*Source page: `~jbm/equations/rk.html`*

[\[Bibliography\]](../bibliography/bibliography.html)

[\[Calculations\]](../calculations/calculations.html)

[\[Downloads\]](../downloads/downloads.html)

[\[Equations\]](../equations/equations.html)

[\[FAQ\]](../faq/faq.html)

[\[JBM\]](../index.html)

[\[Links\]](../links/links.html)

[\[MPM\]](../mpm/mpm.html)

[\[PM\]](../pm/pm.html)

[\[Personal\]](../personal/personal.html)

[\[Software\]](../software/software.html)

------------------------------------------------------------------------

# JBM - Equations - Runge Kutta

Most anybody that has done numerical integration is familiar with Runge Kutta methods. The most common being the fourth order integration equations. But, the equations for simultaneous differential equations are generally not presented so I've put them here.

I'm not trying to teach Runge Kutta methods here, just present the equations for those familiar with numerical integration methods. If this is "greek" to you, take a look at any number of books on numerical methods.

## General Runge Kutta Methods

I'm presenting the common second, third and fourth order equations here for completeness. You should be able to find them just about anywhere. These were taken from Handbook of Mathematical Functions (see below). NOTE: there are other equations for the Runge Kutta method, usually differing by constants. I'm not claiming that these are the only methods or even the best.

All equations are for single integration step of the function y = F(x,y) over a step size of h.

Second order

y<sub>n+1</sub> = y<sub>n</sub> + ( k<sub>1</sub> + k<sub>2</sub> ) / 2 + O( h<sup>3</sup> )

k<sub>1</sub> = h F( x<sub>n</sub>,y<sub>n</sub> )

k<sub>2</sub> = h F( x<sub>n</sub> + h,y<sub>n</sub> + k<sub>1</sub> )

Third order

y<sub>n+1</sub> = y<sub>n</sub> + 1/6 k<sub>1</sub> + 2/3 k<sub>2</sub> + 1/6 k<sub>3</sub> + O( h<sup>4</sup> )

k<sub>1</sub> = h F( x<sub>n</sub>,y<sub>n</sub> )

k<sub>2</sub> = h F( x<sub>n</sub> + h/2, y<sub>n</sub> + k<sub>1</sub>/2 )

k<sub>3</sub> = h F( x<sub>n</sub> + h, y<sub>n</sub> -k<sub>1</sub> + 2 k<sub>2</sub> )

Fourth order:

y<sub>n+1</sub> = y<sub>n</sub> + 1/6 k<sub>1</sub> + 1/3 k<sub>2</sub> + 1/3 k<sub>3</sub> + 1/6 k<sub>4</sub> + O( h<sup>5</sup> )

k<sub>1</sub> = h F( x<sub>n</sub>,y<sub>n</sub> )

k<sub>2</sub> = h F( x<sub>n</sub> + h/2, y<sub>n</sub> + k<sub>1</sub>/2 )

k<sub>3</sub> = h F( x<sub>n</sub> + h/2, y<sub>n</sub> + k<sub>2</sub>/2 )

k<sub>4</sub> = h F( x<sub>n</sub> + h, y<sub>n</sub> + k<sub>3</sub> )

The equations of motion for a bullet in flight, are simultaneous coupled differential equations. Specifically three equations for acceleration, position and spin. These equations may have been transformed using the substitution:

d**u**/dt = d**u**/dy dy/dt = d**u**/dy u<sub>y</sub>

producing equations as a function of mach number and range:

**a** = d**u**/dt = d**u**/dy u<sub>y</sub> = -p pi/8 C<sub>D</sub>(m)/SD V **V**

d**u**/dy = -p pi/8 C<sub>D</sub>(m)/SD V/u<sub>y</sub> **V**

where **v** = **u** - **w** and **u** is the velocity relative to the ground and **w** is the wind velocity.

Integrating this equation is much easier when trajectory parameters are required as a function of range. \[This vector equation for velocity is derived in the discussion of [CD and KD](cdkd.html)\] But, it does introduce another differential equation for time.

## Simultaneous Equations of First Order

The Runge Kutta methods for coupled equations are slightly different and not seen very often (at least by me!). I've found them listed in one book, Ballistics of the Future (see below), and have listed them here for anybody that does not have access to this book (only fourth order was shown).

For two equations, dy/dx = F(x, y, z) and dz/dx = G(x, y, z), a single integration step of h is defined by:

y<sub>n+1</sub> = y<sub>n</sub> + 1/6 k<sub>1</sub> + 1/3 k<sub>2</sub> + 1/3 k<sub>3</sub> + 1/6 k<sub>4</sub> + O( h<sup>5</sup> )

z<sub>n+1</sub> = z<sub>n</sub> + 1/6 l<sub>1</sub> + 1/3 l<sub>2</sub> + 1/3 l<sub>3</sub> + 1/6 l<sub>4</sub> + O( h<sup>5</sup> )

k<sub>1</sub> = h F( x<sub>n</sub>,y<sub>n</sub>, z<sub>n</sub> )

k<sub>2</sub> = h F( x<sub>n</sub> + h/2, y<sub>n</sub> + k<sub>1</sub>/2, z<sub>n</sub> + l<sub>1</sub>/2 )

k<sub>3</sub> = h F( x<sub>n</sub> + h/2, y<sub>n</sub> + k<sub>2</sub>/2, z<sub>n</sub> + l<sub>2</sub>/2 )

k<sub>4</sub> = h F( x<sub>n</sub> + h, y<sub>n</sub> + k<sub>3</sub>, z<sub>n</sub> + l<sub>3</sub> )

l<sub>1</sub> = h G( x<sub>n</sub>,y<sub>n</sub>, z<sub>n</sub> )

l<sub>2</sub> = h G( x<sub>n</sub> + h/2, y<sub>n</sub> + k<sub>1</sub>/2, z<sub>n</sub> + l<sub>1</sub>/2 )

l<sub>3</sub> = h G( x<sub>n</sub> + h/2, y<sub>n</sub> + k<sub>2</sub>/2, z<sub>n</sub> + l<sub>2</sub>/2 )

l<sub>4</sub> = h G( x<sub>n</sub> + h, y<sub>n</sub> + k<sub>3</sub>, z<sub>n</sub> + l<sub>3</sub> )

## Simultaneous Equations of Second Order

Consider the coupled differential equations of second order:

y'' = F ( x, y, z, y', z' )\
z'' = G ( x, y, z, y', z' )

where ' denotes differentiation with respect to x.

Assume

y' = u\
z' = v

then

u' = F ( x, y, z, u, v )\
v' = G ( x, y, z, u, v )

reducing the second order differential equations to a system of four simultaneous eqations of first order.

A single integration step, h of x, is then given by:

y<sub>n+1</sub> = y<sub>n</sub> + 1/6 k<sub>1</sub> + 1/3 k<sub>2</sub> + 1/3 k<sub>3</sub> + 1/6 k<sub>4</sub> + O( h<sup>5</sup> )

z<sub>n+1</sub> = z<sub>n</sub> + 1/6 l<sub>1</sub> + 1/3 l<sub>2</sub> + 1/3 l<sub>3</sub> + 1/6 l<sub>4</sub> + O( h<sup>5</sup> )

k<sub>1</sub> = h u

k<sub>2</sub> = h ( u + m<sub>1</sub>/2 )

k<sub>3</sub> = h ( u + m<sub>2</sub>/2 )

k<sub>4</sub> = h ( u + m<sub>3</sub> )

l<sub>1</sub> = h v

l<sub>2</sub> = h ( v + p<sub>1</sub>/2 )

l<sub>3</sub> = h ( v + p<sub>2</sub>/2 )

l<sub>4</sub> = h ( v + p<sub>3</sub> )

u<sub>n+1</sub> = u<sub>n</sub> + 1/6 m<sub>1</sub> + 1/3 m<sub>2</sub> + 1/3 m<sub>3</sub> + 1/6 m<sub>4</sub> + O( h<sup>5</sup> )

v<sub>n+1</sub> = v<sub>n</sub> + 1/6 p<sub>1</sub> + 1/3 p<sub>2</sub> + 1/3 p<sub>3</sub> + 1/6 p<sub>4</sub> + O( h<sup>5</sup> )

m<sub>1</sub> = h F ( x, y, z, u, v )

m<sub>2</sub> = h F ( x + h/2, y + k<sub>1</sub>/2 , z + l<sub>1</sub>/2 , u + m<sub>1</sub>/2 , v + p<sub>1</sub>/2 )

m<sub>3</sub> = h F ( x + h/2, y + k<sub>2</sub>/2 , z + l<sub>2</sub>/2 , u + m<sub>2</sub>/2 , v + p<sub>2</sub>/2 )

m<sub>4</sub> = h F ( x + h, y + k<sub>3</sub> , z + l<sub>3</sub> , u + m<sub>3</sub> , v + p<sub>3</sub> )

p<sub>1</sub> = h G ( x, y, z, u, v )

p<sub>2</sub> = h G ( x + h/2, y + k<sub>1</sub>/2 , z + l<sub>1</sub>/2 , u + m<sub>1</sub>/2 , v + p<sub>1</sub>/2 )

p<sub>3</sub> = h G ( x + h/2, y + k<sub>2</sub>/2 , z + l<sub>2</sub>/2 , u + m<sub>2</sub>/2 , v + p<sub>2</sub>/2 )

p<sub>4</sub> = h G ( x + h, y + k<sub>3</sub> , z + l<sub>3</sub> , u + m<sub>3</sub> , v + p<sub>3</sub> )

## <span id="REFERENCES">References</span>

Ballistic of the Future, J. M. J. Kooy and J. W. H. Uytenbogaart, McGraw-Hill Book Company, Inc. New York, 1946.

Handbook of Mathematical Functions, Edited by Milton Abramowitz and Irene A. Stegun, Dover Publications, Inc., New York, 1972.

------------------------------------------------------------------------

<span class="small">Last update 3 October 2004, Copyright © 1996-2004 [JBM](mailto:jbm@eskimo.com) [\[V\]](http://www.htmlhelp.com/cgi-bin/validate.cgi?url=referer&input=yes)</span>
