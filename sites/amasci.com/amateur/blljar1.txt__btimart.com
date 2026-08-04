Bill B. note:
    Subscribe to the REAL BellJar, this is just the heavily-stripped-down 
    freeware version.

**************************************************************************
*  -----------------------------------                 ----------------  *  
*   the Bell Jar (electronic version)                   #1 (July 1994)   *  
*  -----------------------------------                 ----------------  *  
*                                                                        *
*  This newsletter contains material which has been extracted from the   *
*  hard-copy newsletter of the same name. Devoted to the vacuum          *
*  experimenter, the intent of "the Bell Jar" is to broaden interest     *
*  in vacuum technology through useful discussions of theory and         *
*  technique, and to present ways in which a variety of apparatus may    *
*  be assembled using common and inexpensive materials. Information      *
*  on "the Bell Jar" may be obtained by sending email to the editor,     *
*  Steve Hansen, at shansen@tiac.net or by writing to 35 Windsor Dr.,    *
*  Amherst, NH 03031. Please feel free to circulate this electronic      *
*  version, intact, to others who might be interested in the subject     *
*  matter. New numbers will be mailed at approx. 6 to 8 week intervals.  *
*  Email subscriptions are free and may be obtained by contacting the    *
*  editor. Comments, contributions and criticisms are always welcome.    *
**************************************************************************

In this issue:

   Some vacuum basics: Units of pressure, pumps and some common 
                       applications for vacuum 

   A Homebuilt Transmission Electron Microscope

   A Useful List of Suppliers

                       ***********************

SOME VACUUM BASICS

This article is condensed from material originally presented in Volume 1
(1992) of "the Bell Jar". 

I. Introduction

This article is only meant to provide a very cursory overview of vacuum, 
how to produce a vacuum and and some of the more common applications of 
vacuum technology. Some noteworthy books will be referenced at the 
conclusion.

A vacuum system typically consists of one or more pumps which are connected
to a chamber. The former produces the vacuum, the latter contains whatever 
apparatus requires the use of the vacuum. In between the two may be 
various combinations of tubing, fittings and valves. These are required 
for the system to operate but each introduces other complications such as 
leaks, additional surface area for outgassing and added resistance to the
flow of gas from the chamber to the pumps. Additionally, one or more vacuum
gauges are usually connected to the system to monitor pressure.

II. The More Common Units of Pressure Measurement

Traditionally, the pressure in a system is stated in terms of the height 
of a column of mercury that may be supported by the pressure in the system.
At one standard atmosphere the force is 1.03 kg/sq cm (about 14.7 pounds 
per sq. inch). This pressure will support a mercury column 760 millimeter 
high (as in a barometer). One millimeter of mercury is the equivalent of 
1 Torr. A thousandth of a millimeter is referred to as a micron of mercury 
or, in more current terminology, 1 milliTorr (mTorr). To be proper in the 
modern scientific world, the SI system of units is used. Here pressure is
referred to in terms of newtons/sq. meter or Pascal (Pa). To convert Torr
to Pascal, divide by 0.0075. 

Measurement of pressure in a vacuum  system is done with any of a variety 
of gauges which work through somewhat indirect means e.g. thermal 
conductivity of the gas or the electrical properties of the gas when 
ionized. The former are typically used at higher pressures (1 to 1000 
mTorr), the latter in lower ranges.

III. Means of Producing Vacuum

Low grade vacuum may be reached using a variety of means. In the range to
several 10s of Torr, sealed reciprocating piston compressors (as are 
commonly found in refrigerators) may be used. Piston compressors have 
the disadvantage of the dead space which exists above the piston. This,
plus leakage past the piston, limits the degree of vacuum that can be
achieved. 

Better vacuum may be obtained with a rotary, oil sealed pump. This type 
of pump has a rotating off-center cylindrical rotor that "sweeps" air 
through the cylindrical housing in which the rotor is located. Air is 
kept from passing from between the vacuum and pressure sides by means of 
either a set of two vanes which are arranged across the diameter of the 
rotor or by means of a sliding single vane mounted in the housing. The 
entire mechanism of this type of pump is immersed in oil. The oil 
lubricates the moving parts and also acts as the sealing agent. 

Single stage rotary compressors, as are used in some air conditioners, are 
usually good to 1 Torr. (These are typically manufactured by Matsushita 
and are rather tall and narrow with the wiring at the top of the unit. 
The inlet is at the bottom/side and the exhaust is at the top. Piston 
compressors are more squat and, as the internal mechanism is spring 
mounted, they can be identified by a characteristic 'clunking' sound when 
shaken.) Air conditioners from GE, Whirlpool, Westinghouse and Sharp
commonly use rotary compressors.

To get below 1 Torr, a two stage (i.e. one stage in series with another) 
rotary pump should be used. Some success may be achieved by connecting 
two rotary air conditioner compressors in series. However, operation may 
be erratic. There is a type of rotary compressor which is used for the 
recharging of refrigeration systems. For less demanding applications, 
these can offer an economical alternative to industrial grade vacuum pumps.
These refrigeration service pumps can be had for under $400, even in larger
capacities (i.e. 3 to 4 cfm), and will readily reach 20 milliTorr.

New, the industrial grade pumps (Welch, Alcatel, etc.) can cost well over
$1000. However, a number of suppliers stock rebuilt pumps. In the smaller
sizes, fully rebuilt and warranted pumps may be obtained for $500 or so.
While the specifications on these industrial pumps will usually state an
ultimate vacuum of 0.1 milliTorr, this level of vacuum is usually only
attainable under ideal circumstances. A more practical value is 5-10 
milliTorr.

At lower pressures, what is termed high vacuum, air doesn't respond very 
well to being squeezed and pushed around by pistons and rotors. At these 
pressures gas molecules don't really flow. They more or less wander into 
the pump. The most common type of pump for use in the high vacuum realm
is the diffusion pump. This pump, invented by Irving Langmuir in 1916,
utilizes a jet of vapor (generated by the boiling of hydrocarbon
or synthetic oil) which forces, by momentum transfer, these stray
molecules into the high pressure side of the pump. Since these pumps only
work at low pressures, the outlet of a diffusion pump must be coupled to
a mechanical 'backing' pump. Diffusion pumps are simple, quiet and only
require simple (but sometimes tedious) maintenance. The major 
disadvantages are the backstreaming of oil toward the vacuum chamber 
(which may be minimized with baffles and or cold traps) and the 
catastrophic results from accidently opening the system to atmospheric 
pressure: the oil breaks down and goes everywhere. Mercury was the original
pumping fluid. Mercury does not break down and higher forepressures may 
be tolerated. However, mercury also has a higher vapor pressure and liquid
nitrogen cold traps are mandatory to prevent contamination. Oil pumps 
generally operate at a forepressure in the range of 100 mTorr or less. 
Ultimate pressures of 0.01 to 0.001 mTorr are readily achievable with 
small apparatus and simple baffles. Most of today's pumps have 3 stages 
with inlet sizes ranging from 2 inches on up. Pumping speed is related to 
the inlet area of the pump. A typical 2 inch pump will have a speed of 
about 100 liters/sec. For most amateur and small scale laboratory 
applications, pumps with inlets of 2 to 4 inches are the most convenient 
and economical to use.

A variety of other styles of high vacuum pump have been developed but 
these are usually difficult to use in the type of environment we are 
discussing here (i.e. the home and small lab) and are more expensive to 
maintain and service. Such pumps include the turbomolecular (or turbo) 
pump, which is built roughly like a turbine, and the gas capture pumps 
(ion, cryoabsorption, and sublimation) which either entrap gas within a 
material or bury the gas under a constantly deposited film of metal. Most 
of these pumps are used in applications where extreme cleanliness is
required or where very high vacuums need to be attained. However, the 
turbo is seeing increased use in more common applications. Wide range 
turbo pumps which have very modest roughing requirements are  now coming 
on the market.

IV. Ranges and Applications of Vacuum

The minimum configuration of a system is dependent upon the most aggressive
planned application. Here are some guidelines for the tailoring of an 
amateur's vacuum system based upon intended use. Elements of this section
are based upon material originally published by Franklin B. Lee in his 
booklet of projects "Experiments in High Vacuum" dating from ca. 1960. 
My thanks to Mr. Lee for permitting the use of his material. 

  Low grade vacuum where a vacuum serves only as a source of
  pressure, as for example the application of a 'suction' at one
  end of a pipe to cause the same flow which could be produced by
  a pressure at the other end.

  Air avoidance applications where it is merely desired to avoid
  some undesirable physical or chemical property of one or more of
  the constituents of air such as friction, convection currents,
  heat conduction, radiation absorption, or oxidation.

  Thermodynamic applications where the temperature at which a
  chemical or physical process proceeds depends upon the absolute
  pressure of the system.

  High purity environments where any foreign material at all is an
  impurity as gases dissolve in liquids and solids in amounts
  proportional to their pressure.

  Atomic and molecular beam applications. As the distance that a
  molecular or atomic particle can travel is directly dependent
  upon the space between the stray molecules in its surroundings,
  beams of these particles will move in an increasingly unimpeded
  fashion as the ambient pressure is lowered (i.e. the mean free
  path increases at higher degrees of vacuum). 

Some of the more common applications of vacuum technology,
arranged by the required degree of vacuum, are as follows:

10 to 100 Torr 			

Hardly qualifying as a vacuum in the realm of experimental physics, this 
is about the correct level of vacuum for the pulsed ultraviolet nitrogen 
laser. Such lasers are simple to build and produce prodigious amounts 
of pulsed radiation. Some will even work at atmospheric pressure.

1 to 10 Torr

Continously pumped carbon dioxide lasers work in this range. Sealed 
He-Ne lasers are backfilled to the lower end of this pressure range.

0.1 to 1.0 Torr

The ambient pressure in gas filled discharge tubes e.g. neon and 
fluorescent lamps and gas filled electronic tubes. This range represents 
the upper decade for plasma pinch devices. The popular "plasma sphere" 
globes are backfilled to about 1 Torr. Sputter coating is commonly done 
in this range (or slightly higher); non electronic applications include 
vacuum melting.

0.01 to 0.1 Torr

Familiar applications include radiometers, incandescent light bulbs, and 
thermos bottles (dewars). Pulse plasma z-pinch apparatus such as the 
'pseudospark' or 'hollow cathode' and coaxial plasma focus devices are 
receiving a great deal of attention for intense soft x-ray generation 
and the production of high current electron and ion beams.

10e-3 to 10e-2 Torr

Pulsed z-pinch devices for x-ray generation. High quality (L.L. Bean?) 
thermos bottles. 

10e-4 to 10e-3 Torr

Cold cathode x-ray and 'Crookes' tubes, vacuum spectrographs, mass 
spectrometers, and evaporated films. Vacuum spark pulsed x-ray devices 
perform well in this range. While not particularly familiar with the device, 
I believe that this is about the right range for the Tesla 'button' lamp.

10e-6 to 10e-4 Torr

The beginning of serious vacuum, at least for the amateur. "Traditional" 
applications include low current dc particle accelerators (e.g. Van de 
Graaff), hot cathode x-ray tubes, electron microscopes, electronic tubes 
and other small particle accelerators (betatron, cyclotron, linac). Lower 
decade pressure range for vacuum spark devices (electron beam/x-ray) 
including MeV range pulsed accelerators.

Below 10e-6 Torr

Larger accelerators, surface science, photo electric research, high purity 
films.

V. Further Reading

Saul Dushman's "Scientific Foundations of Vacuum Technique" (John Wiley, 
1962) and John Yarwood's "High Vacuum Technique" (John Wiley, 1945) are 
both excellent books. Yarwood, while being more dated, has a stronger 
emphasis on laboratory practice. Much of this is applicable to today's 
amateur. Both of these books are out of print but should be available 
from a university library or through your local library's interlibrary
loan service.

The American Vacuum Society has begun a series of reprints of classic
vacuum books. Recommended are "Handbook of Electron Tube and Vacuum
Techniques" (Rosebury), "Vacuum Sealing Techniques" (Roth), "The Physical
Basis of Ultrahigh Vacuum" (Redhead, Hobson and Kornelsen). These are
all available from the American Institute of Physics, c/o AIDC, P.O. Box 20,
Williston, VT 05495 for $35 each ($28 to members of AIP member societies) 
plus $2.75 shipping for the first book, $.75 each additional book. The
toll free number is 1-800-488-book.

                      ***********************

A HOMEBUILT TRANSMISSION ELECTRON MICROSCOPE

Chris Frye began working on his TEM over 20 years ago. Apparently tBJ 
has helped to revive Chris' interest and work has recently been 
progressing in earnest. 

The microscope is based on the RCA EMU series of instrument. In trying 
to replicate some of the specifications and features of the commercial 
instruments, Chris is somewhat fearful of needless overdesign and 
complexity in the machine - features which an amateur machine need not 
possess. The final instrument may include some further simplifications.

This article is condensed from Cris' full account which appeared in the 
Spring 1994 issue of tBJ. It represents Chris' current status and outlook.
Chris also owns a commercial SEM, a 1977 vintage ISI Super IIIA. The 
restoration of this instrument will be the subject of a future article.

Chris is interested in corresponding with anyone who has knowedge of or
interest in electron microscopes. He may be reached at 2116 Linden Lane, 
Silver Spring, MD 20910-1705. 

Readers who are interested in TEMs should also check out the two simple 
microscopes that were described in Scientific American's "Amateur 
Scientist" column of September, 1973. 
           ___________________________________________________

The TEM is constructed as a vertical column which is assembled on top of
the high vacuum pumping system. Starting from the top there is a simple 
electron gun consisting of a neoprene stopper and a couple of 6 mm ID 
glass tubes holding 5 mm steel electrodes. A thoriated tungsten filament 
is connected to the electrodes by screws. This structure is encased in a 
brass cylinder which holds the brass cathode. The outside wall of the 
electron gun column is made from a Pyrex cylinder epoxy cemented to the 
brass plate holding the neoprene stopper at the top and to the brass 
anode at the bottom. The stopper, being mechanically unstable, is less 
than ideal and some more elegant (but still cheap) alternatives to this 
design are being sought.

During operation, 5 to 6 volts are applied across the filament with 50 kV 
to the cathode cylinder. After the electrons pass through the anode (which 
is maintained at ground potential) they pass through a copper bellows and 
into the condenser lens aperture holder. The copper bellows is used so 
that the gun may be aligned to the condenser lens aperture. Very narrow
apertures are required in all of the lenses to keep beam divergence angles 
down to about 10e-2 to 10e-3 radians. This has the effect of increasing 
image contrast, depth of field and reducing lens aberrations. Now the 
electrons pass through the condenser lens coil where the magnetic field 
of the coil focuses them to a spot at the specimen holder. A brass 
specimen holder is seated in a mechanical stage which has been milled 
from 1/2" aluminum stock.  

The diversity of metals is due to what was on hand at the time. Brass 
and aluminum were used interchangeably where a non-ferrous metal was 
required. Of course, the main column, lens coil enclosures and pole pieces 
are made from soft 99.92% pure iron. The mechanical stage movement in 
the X and Y directions is accomplished by advancing a 2 mm metal rod 
through an O-ring via a gear and screw arrangement. After the electrons 
pass through the specimen (which must be less than 1000 Angstroms thick),
they enter the pole pieces of the objective lens coil. They pass through
the pole piece aperture and are focused by the coil current to a
vicinity somewhere above the permanent magnet intermediate lens. (This 
lens is just below the brass bellows underneath the objective lens coil.) 
A permanent magnet is used as an intermediate lens which focuses the 
electrons to the vicinity of the projector lens  (the lowest lens) where 
they then pass through the projector lens pole pieces and then are brought 
to a final focus on a tiltable phosphorescent screen. The final image is 
viewed through the glass viewing port which is located just above the 
screen.

At this time many of the components have been constructed or obtained.
Some of the materials have been hard to locate. These include bulk 
quantities of AWG 24 magnet wire for the lenses, copper or brass bellows, 
thoriated tungsten filaments and lead impregnated glass for the viewing 
port. (The lead in this latter item is to shield the operator from any 
x-rays which might be produced by the 50 keV electron beam.)

Rather than building the vacuum system from scratch, a used system was
acquired from E. McGrath Co. It is comprised of a Varian EVAC200 7 cfm 
direct drive mechanical pump, an NRC H-4-SP four inch diffusion pump, 
a handwheel actuated manifold valve, an NRC cold trap, and a Hastings 
VT-6 dual T/C and cold cathode gauges with controller. All of this is 
mounted on a heavy Unistrut frame. At 250 lbs., it was a real chore to 
move it  to the upstairs converted bedroom lab. Duniway Stockroom supplied 
the miscellaneous fittings and vacuum hose. The cooling lines are now 
connected to the upstairs bathroom sink. 

The last phase of this project involves the high voltage (50 kV at 300 
microamps) and lens (120 volts, adjustable constant current to about 
2.5 milliamps) power supplies. The lens supplies are fairly straight 
forward. The high voltage supply is another issue. While the absolute
voltage is not that critical, any drift from the nominal value will
cause aberrations in the image. A drift rate not exceeding 1 volt per 
minute is the design goal.

The basic supply has been obtained. This is a modular unit which came
from OE Technologies. Some sort of regulator will have to be added. Just 
placing a big capacitor across the output might work but some sort of 
active regulation would be preferable. When asking various people for 
advice on high voltage regulation, the responses were like "Are you kidding"
or "No such stability exists."  However, in looking at John Strong's 
"Procedures in Experimental Physics" (reprinted by Lindsay Publications), 
a Geiger counter regulator circuit shown on page 296 claims a drift of less
than 0.1 volts per hour with an output of 1500 volts. Obviously, this 
would have to be scaled a bit and a modern higher voltage replacement for 
the obsolete type 57 tubes would have to be found. Perhaps the type of
high voltage beam regulator tube used in TV sets would work.


       ******************************************************

"the Bell Jar": CONTENT SUMMARY FOR 1992-1994; PLANS FOR 1995

1992-Vacuum basics, elements of an amateur's system, conversion of 
refrigeration and auto a/c compressors to vacuum service, a discharge
tube gauge, magnetically driven plasma accelerators demonstrated with
a rail gun, history of vacuum units, a mini system for fabricating
graded density optical filters, a universal thermocouple gauge 
controller.

1993-Plasma apparatus developed from microwave ovens, vacuum system
operation, a coaxial plasma gun, synthesizing fullerenes, easy 
fabrication of glass to metal seals, reconfigurable vacuum chambers  
standard glassware components, a baffle chiller made from a room 
dehumidifier, exploding wires, units of outgassing, Magdeburg hemispheres 
made from plastic pipe fittings, production of low temperatures, a 
homebuilt diffusion pump, principle of the pseudospark electron beam 
source.

1994-Experiments with x-rays produced by receiving tubes, building a 
multiplate chamber pseudospark electron beam source, a kit of components 
for conducting gaseous discharge and electron beam experiments, building 
a simple cathode ray tube, a De Forest style audion triode, electron 
optics kits from the 50's and 60's, a simple chilled baffle for small 
diffusion pumps, an amateur's homemade transmission electron microscope, 
compression fittings from the sink drain, simple electrical feedthroughs,
amateurs rebuild a large vacuum coater for telescope mirror making, original
thought experiments in vacuum, a 250 kV impulse transformer, a cheap
oil mist filter, simple ways of making electron and ion optics, a radio
using the homemade vacuum triode, cleaning procedures for epoxy bonding.

Plans for 1995 (and probably beyond) include simple apparatus for 
classroom use, simple Pirani and Penning gauges, a windowed vacuum tube 
for transmitting electron beams into the air, ideas for original research, 
a shock tube for simulating micrometeorite impacts, the Mather device, 
a crossed-field tube capable of initiating nuclear reactions, a 1-1/2" 
diffusion pump, topics in ultra-high vacuum, novel high voltage pulse 
and dc power supplies, vacuum coating, demonstrating the multipactor 
(electron multiplication) effect.


                                                           *************tBJ
