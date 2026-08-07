---
title: "vistxt"
source_domain: amasci.com
source_path: ~billb/viselect/vistxt.html
order: 1304
reachable_from_entry: false
images: 1
internal_links: 0
extracted: 2026-08-07T17:07:36Z
extractor: site_to_paper.py (pandoc)
---

# vistxt

*Source page: `~billb/viselect/vistxt.html`*

VISUAL ELECTRICITY                                     William J. Beaty
    6/28/95

    While working on an Electricity/Electronics exhibit for the Museum of
    Science in Boston I discovered a number of serious problems in attempting
    to explain simple electricity.  One problem was the obscure way that
    exhibit devices typically present electrical effects: by using meters. 
    Sophisticated skills are required to interpret meter readings and to
    imagine the invisible events they imply.  Exhibit designers who are
    familiar with electronics sometimes fall into the trap believing that the
    general public also has their skills, and so they include all sorts of
    digital and needle-meters as part of a display.  But the unskilled public
    sees a meter reading in quite a different way than an electronics
    specialist does, and meter readings serve more to obscure and complex-ify
    than to reveal and enlighten.

    A second problem: nearly all of the electricity explanations I found in
    children's science textbooks were wrong, so I couldn't use textbooks as a
    guide for explaining electricity at a simple level.  Go here
    for more about this.

    And third, as an electrical engineer I had a gut-level feel for electrical
    math, but my non-math picture of electricity was mostly based on the
    incorrect explanations found in K-6 textbooks.  I had been living in a
    world of electronics math, never realizing that my verbal and visual
    explanations for electrical phenomena were totally incompatible with the
    mathematical description.  My verbal and visual explanations were wrong. 
    As long as I stuck with engineering, I was fine, but if I tried to use
    non-math information to explain what I knew, I would be spreading
    misinformation.

    The device depicted here was my best shot at a solution.  It is an
    interactive realtime simulation of the behavior of charges within a wire. 
    Instead of explaining anything, instead it makes electric curent visible
    so museum visitors can play with it.  The motion of its pattern of lights
    follows the actual motion of charges, and when the device is connected
    into a real functional electrical circuit, it provides a window on the
    true nature of "electricity."  If all the individual paths in a complex
    circuit are replaced by a number of these devices, the operation of a
    complicated electrical device can be directly observed and intuitively
    understood. 

    "Visual Electricity" is simply an amp meter having a "chaselight" circuit
    as a readout device.  A Chaselight is identical to a movie marquee
    lightbulb border, with a pattern of on and off lights which advance along
    and simulate motion.  The input terminals of my device are physically
    placed near the ends of a row of LEDs, and electric current passing
    between the terminals is measured and used to drive some logic circuitry. 
    The input current does not drive the LEDs directly.  The logic circuitry
    lights up every fourth LED, and by advancing this pattern of on/off LEDs,
    a row of glowing "electrons" can be made to flow along the lights.  The
    direction and speed of chaselight action is proportional to the electric
    current direction and amperage.  To the observer this device behaves as a
    wire which contains large, visible, movable electrons. 

[![\[Schematic\]](http://www.eskimo.com/~billb/viselect/schem1.gif)](http://www.eskimo.com/~billb/viselect/schem1.gif)

    SCHEMATIC

    The input to the device is a standard current-meter circuit: a low-value
    sampling resistor connected to an opamp.  The voltage from this first
    stage is adjusted in amplitude and zero-level by the next stage.  The
    signal is then applied to a precision rectifier circuit which outputs a
    fullwave signal and a polarity signal.  The polarity signal is
    level-shifted and is used to control the fwd/rev direction of a shift
    register.  The fullwave signal is applied to a Voltage-to-Frequency (V/F)
    converter whose output is used to drive the clock of the shift register. 
    The four outputs of the shift register are buffered and applied to four
    interleaved strings of LEDs.

    OPERATION

    When a small positive current is applied via the input terminals, the
    opamps drive the V/F converter at a pulse frequency proportional to the
    amperage, the shift register begins advancing, and the pattern of lights
    starts moving slowly along the row of LEDs.  If the current is doubled,
    the frequency doubles and the pattern "flows" twice as fast.  If the
    direction of current is reversed, the polarity signal changes state, the
    shift register starts decrementing, and the LED pattern flows in the
    opposite direction.  If a very slow (1 Hz) sine wave is applied to the
    input, the LED pattern will swerve back and forth, just like the charges
    actually do within the wire. 

    The whole circuit could be made cheap and simple through use of a single
    chip microcomputer having a A/D input, such as PIC16C7x

    The above device is a wire with visible electrons.  It also is an electric
    current microscope, since it greatly amplifies the speed of electron
    motion which occurs in wires.  Contrary to popular belief, electric
    current is a very slow flow of electric charge.  At normal densities of
    electric current, electrons move at speeds on the order of inches per
    hour, like the minute hand on a clock.  Even if individual electrons could
    be seen by human eyes, their flowing motion would be invisible because
    it's just too slow.  Visual Electricity depicts this motion several
    thousand times faster than it actually is. 

    The next advancement is to add a "visible voltage" function.  This could
    be done through use of red/green LEDs, by measuring the voltage on the
    input terminals with respect to a third "ground" terminal, then driving
    the R/G LEDs with a pulse-width modulated signal.  If Visual Electricity's
    "wire" is then connected to a positive voltage source, the display turns
    red.  If negative, it turns green.  If disconnected, it could either
    maintain an "electrostatic charge" like a real wire and remain at its last
    color, or it could turn yellow (50-50 red/green).  The voltage and current
    on a single wire could then be displayed simultaneously with "electrons"
    which change color, flow along, or both.

    - Bill Beaty, 6/28/95
