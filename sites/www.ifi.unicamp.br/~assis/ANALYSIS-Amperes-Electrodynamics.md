# Analysis: Ampère's Electrodynamics (Assis & Chaib, 2015)

**File:** `Amperes-Electrodynamics.pdf` (530 pages)
**Publisher:** Apeiron, Montreal (C. Roy Keys Inc.)
**ISBN:** 978-1-987980-03-5

## What This Book Is

This is the definitive modern study of Ampère's force law between current elements, including the first complete English translation of Ampère's 1826 masterpiece *Theory of Electrodynamic Phenomena, Uniquely Deduced from Experience* (the *Théorie*). It's both a physics textbook and a history-of-science treatise.

## The Core Physics: Ampère's Force Law

**Equation 2.16** — Ampère's force in modern vector notation (SI units):

```
d²F = -(μ₀/4π) · (II'/r²) · [2(ds⃗·ds⃗') - 3(r̂·ds⃗)(r̂·ds⃗')] · r̂
```

Where:
- `I`, `I'` = currents in amperes
- `ds⃗`, `ds⃗'` = infinitesimal current element vectors
- `r` = distance between elements
- `r̂` = unit vector from one element to the other

**Key properties:**
- **Central force** — directed along the line connecting both elements
- **Satisfies Newton's 3rd Law** in the strong form (action = -reaction, along the connecting line)
- Varies as **1/r²** (inverse square, like gravity and Coulomb)
- Constants: n=2, k=-1/2, h=-3/2

This is NOT the Biot-Savart law. Ampère's force acts between current *elements*, not between a current and a point. It's more fundamental.

## Why This Matters for the Weber-Torricelli-Beltrami-Schauberger-Russell Stack

### Ampère → Weber Connection (the critical link)

Ampère's force law (1822) describes the force between two **current elements** (macroscopic). Weber (1846) generalized this to a force between two **charges** in relative motion, adding velocity and acceleration dependence. The progression:

1. **Coulomb (1785):** Force between static charges → `qq'/r²`
2. **Ampère (1822):** Force between current elements → depends on angles, currents, 1/r²
3. **Weber (1846):** Force between moving charges → `qq'/r² · [1 - (ṙ/c)²/2 + rr̈/c²]`

Weber's force law *reduces to* Ampère's force when you substitute currents (moving charges in conductors). Ampère is the experimental foundation; Weber is the theoretical generalization.

### The Controversy Chapters Are the Real Payload

Parts IV and V (Chapters 11-22) document the **systematic suppression** of Ampère's approach in favor of the field concept:

- **Ch 11: Ørsted vs Ampère** — Ørsted rejected Ampère's interpretation of his own experiment
- **Ch 12: Biot & Savart vs Ampère** — They introduced their law as a replacement; Assis shows 3 errors in their "deduction" (Ch 17)
- **Ch 13: Faraday vs Ampère** — Faraday pushed field lines, rejected action-at-a-distance
- **Ch 14: Grassmann vs Ampère** — Grassmann's force (used in modern textbooks) violates Newton's 3rd law
- **Ch 15: The Field Concept vs Ampère** — How the magnetic field replaced Ampère's direct force

**Critical point from Ch 17:** Biot-Savart's law (the one taught in every physics textbook today) was NOT derived from experiment — it was a flawed "deduction" containing three distinct errors. Assis documents each one.

**Critical point from Ch 20:** Ampère's force obeys Newton's 3rd law (action-reaction along the connecting line). The modern field-based approach (Grassmann/Lorentz force) **violates** Newton's 3rd law for current elements. This violation is papered over by saying "the field carries the momentum" — but that's a patch, not a derivation.

### Maxwell's Own Words (from the Conclusion, p.491)

Maxwell himself called Ampère's force "undoubtedly the best" of the four competing formulas, because it's the only one where forces are "equal and opposite but in the straight line which joins them." And his famous quote:

> "The experimental investigation by which Ampère established the laws of the mechanical action between electric currents is one of the most brilliant achievements in science. The whole, theory and experiment, seems as if it had leaped, full grown and full armed, from the brain of the 'Newton of electricity.' It is perfect in form, and unassailable in accuracy."

Yet Maxwell then proceeded to replace Ampère's approach with field theory anyway.

## Structure of the Book

| Part | Content | Pages |
|------|---------|-------|
| I | Ampère's Force and meaning of its terms | 17-50 |
| II | Origins and evolution of the force law | 51-140 |
| III | Last period of Ampère's researches | 141-196 |
| IV | **Controversies: Scientists against Ampère** | 197-226 |
| V | **Controversies: Ampère against scientists** | 227-282 |
| VI | Translation of Ampère's first paper | 285-320 |
| VII | Analysis of Ampère's main book (*Théorie*) | 321-336 |
| VIII | **Complete English translation of the *Théorie*** | 337-488 |
| IX | Conclusion | 489-492 |
| X | Appendix (redrawn figures) | 493-514 |

## Key Takeaways for MERLib

1. **Ampère's force is the experimental bedrock** that Weber generalized into his force law. Without Ampère, there is no Weber electrodynamics.

2. **The field concept replaced Ampère not because it was better physics, but because it was more convenient mathematically** — even though it breaks Newton's 3rd law at the element level.

3. **The complete English translation of the *Théorie* (Part VIII)** is invaluable — this is Ampère's own words, his own reasoning, for the first time fully accessible in English. Previously only available in French.

4. **The experimental apparatus drawings** (Appendix A) show Ampère's actual laboratory setups — these are reproducible experiments, not thought experiments.

5. **Ampère coined the terms** "electrostatic", "electrodynamic", "electromagnetic", and "galvanometer" — he literally created the vocabulary of electrical science.

---
*Analysis by Claude, 2026-03-29. Source: www.ifi.unicamp.br/~assis*
