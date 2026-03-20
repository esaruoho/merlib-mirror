# IET Self-Organizing Flow Technology: Deep Analysis

## Source Document

**Title:** Self-organizing Flow Technology -- in Viktor Schauberger's Footsteps
**Authors:** Lars Johansson, Morten Ovesen, Curt Hallberg
**Publisher:** Institute of Ecological Technology (IET), Malmö, Sweden
**Year:** 2002 (2nd edition; originally published 1997 in Swedish)
**Series:** IET Scientific and Technical Reports, No. 1
**ISBN:** 91-631-2611-7
**ISSN:** 1651-4629
**Pages:** 49

## Overview

This report is the foundational scientific document of the Institute of Ecological Technology (IET), a Swedish research group dedicated to understanding and applying the ideas of Austrian forester-naturalist Viktor Schauberger (1885-1958). The report bridges Schauberger's empirical observations about water behaviour with the language of modern chaos theory, self-organization, and nonlinear dynamics.

The authors replicated the 1952 Stuttgart experiments (Schauberger & Prof. Franz Popel) on vortex generation and particle separation, and developed new theoretical models and practical applications.

## Key Concepts

### Self-Organizing Flow

The central thesis: technology can exploit the **intrinsic order spontaneously created by a system** under the right conditions, rather than forcing the system into a desired state. This is directly analogous to Prigogine's dissipative structures -- systems far from thermodynamic equilibrium that spontaneously organize when:

1. The system is **dissipative** (open, consuming energy)
2. The system is **far from thermodynamic equilibrium**
3. Parts **co-operate** as a whole (nonlinear, self-catalytic feedback)

The bathtub vortex is the paradigmatic example: at low flow, water drains straight; at a critical flow rate, a **bifurcation** occurs and water spontaneously organizes into a stable vortex -- a macroscopic structure emerging from microscopic fluctuations.

### Free and Forced Vortices

The report distinguishes two fundamental types of rotating flow:

| Type | Angular velocity | Tangential velocity | Centripetal force | Description |
|------|-----------------|---------------------|-------------------|-------------|
| **Forced vortex** | omega = k (constant) | v_theta = kr | F = mk^2 r (increases with radius) | Rigid rotation, like a centrifuge |
| **Quasi-free vortex** | omega = k/r | v_theta = k (constant) | F = mk^2/r (decreases with radius) | Intermediate case |
| **Free vortex (potential flow)** | omega = k/r^2 | v_theta = k/r | F = mk^2/r^3 (decreases rapidly) | Energy per unit mass constant; angular momentum L = v_theta * r constant |

Real vortices are typically a **superposition**: a forced vortex core surrounded by a quasi-free outer region, separated at a characteristic boundary radius r_boundary.

### The Stuttgart Experiments (1952, replicated)

Schauberger and Popel investigated vortex flow in pipes using:

- **Rectangular vessel**: Water wells over an edge without forced rotation. At flow rates of 0.2-0.4 l/s, weak self-organizing vortex generation occurs. A thread hanging from the inlet traces a spiralling space curve with increasing wavelength and decreasing amplitude.
- **Trumpet-shaped vessel**: Tangential inlets force stronger vortex generation. Particles (coffee grounds) injected or floating on the surface are sucked toward the vortex centre, demonstrating particle concentration.

Key finding from the original Stuttgart experiments: **frictional resistance decreased** as pipes became more conical and spiralling. Copper pipes had lower flow resistance than glass. The spiralling copper pipe showed an **undulating friction curve** with apparent **negative friction** at certain flows -- as if water lost contact with the walls.

### Three Axial Flow Types

The report identifies three flow regimes in vortex-flows through pipes:

- **Type I**: All flow in the main direction; axial velocity decreases toward centre
- **Type II**: Central **reverse flow** (return flow in the centre)
- **Type III**: Three directions -- central and peripheral flow downward, intermediate region flowing in reverse (appears with strong vortex generation)

Types II and III are important for mixing and separation applications due to the stabilizing reverse flow.

## The Particle Perspective

Four forces act on a particle in a rotating flow:

1. **Inertia** (centripetal force): F = mv^2_theta_p / r
2. **Lift force** (pressure gradient): F = rho_v * v^2_theta_v * V_p / r
3. **Viscous drag** (proportional to velocity difference)
4. **Magnus effect** (rotating particles screwing through the medium)

The key result from Stoke's law analysis:

**Delta v_r = (v_theta^2 * D^2 * (rho_p - rho_v)) / (18 * mu * r)**

This means particles lighter than the fluid move toward the centre. But critically, if the particle is **retarded** relative to the fluid (in the tangential direction), even particles **heavier than water** can be pushed toward the centre -- because the expression (rho_v * v^2_theta_v - rho_p * v^2_theta_p) can be positive even when rho_v - rho_p < 0.

This explains the "tea leaf paradox" -- leaves accumulate at the centre of a stirred cup because bottom friction retards them relative to the rotating fluid.

## Flow Image Modelling

### Handkerchief Dynamics

See companion document: [handkerchief-dynamics-beltrami-torricelli-mathematical-analysis.md](handkerchief-dynamics-beltrami-torricelli-mathematical-analysis.md)

The barrel experiment produces a distinctive flow pattern: water surface is pulled down in a vortex at the centre, thrown out tangentially at the bottom, twisting the surface together. This **pull-twist-spread** dynamics is analogous to pulling a handkerchief through a hole by seizing its centre -- a stretch-and-fold operation close to the classic **horseshoe map** of chaos theory. Points initially close together are separated and lose relation to each other, driving mixing.

### Toroidal Vortex Flow

After initiation, the barrel flow self-organizes into a **toroidal vortex** -- flow vaulting around a torus while rotating faster toward the centre. This structure resembles **twisted scroll rings**, solutions to various dynamical systems.

### Chaotic Pulsation

The air funnel at the vortex centre behaves as a **nonlinear membrane spring** -- a twisted membrane stretched by subpressure. At some flows it pulsates **chaotically and aperiodically**, analogous to a dripping faucet but with air instead of water. The system may harbour **strange attractors**.

### Bifurcations in the Air Funnel

As pump speed increases:
1. Water surface dips smoothly at centre
2. At a **critical flow**, a spear-shaped air funnel suddenly appears (bifurcation)
3. Funnel widens into trumpet shape
4. At higher flow, funnel twists (Hopf bifurcation -- new frequency added)
5. Further bifurcations produce increasingly complex minimal surfaces

The air column forms a **minimum surface** -- surface tension contracts while rotating flow pulls apart, analogous to soap bubbles but with inertial forces replacing inner over-pressure.

## Applications

### Oxygenation (Chapter 4)

The **Plane Pump** -- two circular plates with radial guiding rims, brought to rotate -- creates a central subpressure that self-organizes the surrounding water into toroidal vortex flow. Three oxygenation modes:

1. **Air funnel with bubbles**: Funnel pulled down, air twisted off as fine bubbles (forceful, industrial)
2. **Stable air funnel**: Acts as active mixing surface, peaceful oxygenation (suitable for lakes/ponds)
3. **No air funnel**: Oxygen-rich surface water pulled down via inlet-suction vessel

Experimental results: With only 40W energy input, water oxygenated to ~90% saturation in 15-30 minutes. Subpressure of only 60-70% of water column height was sufficient to pull the funnel to the bottom -- the rotating water body assists the pump.

### Ion Precipitation (Section 4.3)

Aquagyro's vortex agitator facilitated precipitation of iron and manganese ions at Paltrask water supply. Manganese precipitated during gravel filtration to a greater extent than traditional compressed-air methods achieved. Iron formed complexes (possibly organically bound) that behaved differently from conventionally treated iron.

### Separation (Chapter 5)

**Self-organizing separation** differs from hydrocyclone technology: it operates at much lower pressures (0.2-0.4 l/s vs 1-3 Bar) by exploiting the free vortex region where particles lag the fluid and are pushed centreward.

Experimental results with egg-shaped inlet vessel:
- Coarse-ground coffee (0.5-1.5 mm, lighter than water): **>90% separated**
- Fine-ground coffee (0.2-0.5 mm, heavier than water): **60-70% separated**
- Sewing thread pieces (7-14 cm): virtually **100% separated**

**Barrel separation** (with plane pump): Toroidal vortex concentrates lighter particles at centre in a funnel-like structure; heavier particles sediment at bottom centre (tea-leaf effect). Pulsed subpressure extraction avoids diluting the separated concentrate.

### Oil removal from water surfaces

The ability to concentrate surface materials via the central vortex string suggests potential for oil spill cleanup -- trapping oil floating on water into a vortex funnel for separation.

### Water Treatment Applications

- **Drinking water**: Ion precipitation, particle removal
- **Industrial process water**: Laundry, food industry, paper-mill (high water consumption)
- **Sewage treatment**: Low-energy alternative to high-pressure flotation
- **Pond/lake restoration**: Oxygenation at scale, peaceful bottom-compatible method
- **River regulation**: Schauberger's principle of giving water impulses for self-organization rather than forcing it into channels

## Historical Context: Knossos Water Supply

The report draws a remarkable parallel to the Minoan civilization (2100-2000 BC). The Palace of Knossos on Crete used **conical terra-cotta pipes** where each narrow end inserted into the wide end of the next section -- giving water a "shooting" toroidal motion that prevented sediment accumulation. Arthur Evans noted these were more advanced than nearly all modern parallel-sided earthenware pipes. The Minoans also used **braking vanes** in channels and understood that water finds its own level (one pipe section ran uphill).

Spiral and vortex motifs dominate Minoan art, including depictions of **Karman vortex streets** -- water was central to their mythology and treated as sacred.

## Significance

This report establishes that Schauberger's empirical observations about water -- often dismissed as mysticism -- can be rigorously understood through:

1. **Prigogine's dissipative structures** (self-organization criteria)
2. **Bifurcation theory** (transitions between flow states)
3. **Free/forced vortex dynamics** (centripetal force analysis)
4. **Chaos theory** (strange attractors, horseshoe dynamics, stretch-and-fold mixing)
5. **Minimal surface theory** (air funnel geometry)

The practical applications -- low-energy oxygenation, particle separation without high pressure, gentle river regulation -- represent a paradigm fundamentally different from conventional forced-flow engineering.

## Bibliography (Selected)

- Alexandersson, O. *Living Water*. Gateway Books, 1990.
- Evans, A. *The Palace of Minos*. London, 1921/1930.
- Gleick, J. *Chaos -- Making a New Science*. Viking Penguin, 1987.
- Popel, F. *Rapport over preliminara undersokningar av spiralror med olika form*. IET, 1986 (orig. Stuttgart, 1952).
- Prigogine, I. & Stengers, I. *Order out of Chaos*. Bantam Books, 1984.
- Waldrop, M.M. *Complexity: The Emerging Science at the Edge of Order & Chaos*. Penguin, 1992.
