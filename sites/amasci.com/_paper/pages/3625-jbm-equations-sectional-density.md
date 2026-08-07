---
title: "JBM - Equations - Sectional Density"
source_domain: amasci.com
source_path: ~jbm/equations/secdens.html
order: 3625
reachable_from_entry: false
images: 0
internal_links: 11
extracted: 2026-08-07T05:56:55Z
extractor: site_to_paper.py (pandoc)
---

# JBM - Equations - Sectional Density

*Source page: `~jbm/equations/secdens.html`*

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

# JBM - Equations - Sectional Density

Sectional density equations and calculations. [References](#REFERENCES) and a list of [variables](#VARIABLES) are at the bottom of this page.

## Sectional Density and Ballistic Coefficient

The BC, or ballistic coefficient is defined as:

BC = w / \[i d<sup>2</sup>\]

where the diameter is specified in inches and the weight in pounds and the form factor is found using:

i = CD / CD<sub>G</sub>

The sectional density is defined as:

SD = w / d<sup>2</sup>

making the ballistic coefficient

BC = SD / i

\[NOTE: Some references define the sectional density with the mass not weight. All the listings I've seen from bullet manufacturers use weight. Most ballistics texts use mass.\]

So this means that the ballistic coefficient is proportional to the weight of the bullet and inversely proportional to the diameter squared. (Keep in mind that the ballistic coefficient is also inversely proportional to the form factor which depends on the shape of the bullet!)

Calculation of the sectional density is straight forward. For a 300 grain, .338 caliber bullet, the sectional density is:

SD = \[ 300 gr / (7000 gr/lb) \] / \[ 0.338 in \]<sup>2</sup> = 0.375 lb/in<sup>2</sup>

NOTE: With the common definition of the sectional density, the units have to be converted when used with drag functions, velocity, etc, to convert the in<sup>2</sup> to ft<sup>2</sup> resulting in a factor of 144.

## <span id="VARIABLES">Variables</span>

**d**

bullet diameter

**w**

bullet weight

**SD**

sectional density

**BC**

ballistic coefficient

**i**

form factor

**G**

"G" function

**CD**

drag coefficient

**CD<sub>G</sub>**

drag coefficient of the standard bullet

## <span id="REFERENCES">References</span>

Hatcher's Notebook, Julian S. Hatcher, Major General, USA, retired, Stackpole Books, Harrisburg, Pennsylvania, Second printing, 1966.

------------------------------------------------------------------------

<span class="small">Last update 3 October 2004, Copyright © 1996-2004 [JBM](mailto:jbm@eskimo.com) [\[V\]](http://www.htmlhelp.com/cgi-bin/validate.cgi?url=referer&input=yes)</span>
