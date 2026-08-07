---
title: "Trajectory Terms"
source_domain: amasci.com
source_path: ~jbm/ballistics/traj/traj_exp.html
order: 3602
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T05:56:54Z
extractor: site_to_paper.py (pandoc)
---

# Trajectory Terms

*Source page: `~jbm/ballistics/traj/traj_exp.html`*

## Trajectory Terms

------------------------------------------------------------------------

### General

*Line of Sight* - an imaginary line from the sights to the target. It is relative to this line that all bullet drops and deflections are measured.\
\

### Input Data

*Muzzle Velocity* - the velocity of the bullet as either (1) measured at some distance from the muzzle or (2) as estimated from reloading data. The on-line ballistics page can correct for the distance to chronograph. (The velocity lost traveling to the chronograph.)\
\
*Chronograph Distance* - the distance from the muzzle of the firearm to the chronograph used for muzzle velocity measurements. If the muzzle velocity is estimated, enter 0.0 for this value -- no correction.\
\
*Ballistic Coefficient* - the ballistic coefficient for the bullet being used. It is almost always obtained from the manufacturer, but can also be measured. The ballistic coefficient is represents the ratio of the drag of the standard (e.g. G1 standard bullet) bullet to that of the bullet you are shooting. A ballistic coefficient of 0.100 means that your bullet has 10 times the drag of the standard bullet.\
\
*Drag function* - A drag function (or G function) provides the forces on a standard bullet for which the drag function was derived. A bullet's ballistic coefficient then relates the drag on any bullet to that of the standard bullet.\
\
*Bullet Weight* - the weight of the bullet in grains (7000 grains per pound).\
\
*Wind Speed*

*Range Wind* - the speed of the downrange component of the wind. It is negative for a head wind.

*Vertical Wind* - the speed of the upward component of the wind. It is negative for a downward wind component.

*Cross Wind* - the speed of the cross component of the wind. It is positive for a wind to the shooter's right.

\
\
*Sight Height* - the height of the sight (or scope) above or below from the centerline of the barrel. This is required because the bullet starts at a drop of -\[Sight Height\].\
\
*Sight Offset* - the offset of the sight (or scope) to the left or right of the centerline of the barrel.\
\
*Azimuth* l - the horizontal (side to side) angle the barrel makes with the line of sight. This value is not generally known and can be ignored if the "Azimuth Correction for zero range" option is checked.\
\
*Elevation* - the vertical angle the barrel makes with the line of sight. This value is not generally known and can be ignored if the "Elevation Correction for zero range" option is checked.\
\
*LOS Angle* - the angle between the line of sight and the ground.\
\
*Cant Angle* - the angle of the tilt of the firearm to the right or left from vertical. Positive angles are to the right.\
\
*Target Speed* - the speed of the target in miles per hour. This value is used to calculate running target leads. Negative speeds are to the shooters left, positive to the shooter's right.\
\
*Target Angle* - the angle of the target speed direction with the line of sight. A 90 degree angle is a target moving perpendicular to the line of sight. This angle is given in degrees by selecting an angle from the list.\
\
*Minimum Range* - the minimum displayed range. Data is calculated from the muzzle the maximum range, but may be displayed from the minimum to the maximum range. (e.g. with a minimum of 990, maximum range of 1010 and a range increment of 10 you would see data 990, 1000, 1010 yards).\
\
*Maximum Range* - the maximum displayed range.\
\
*Range Increment* - the increment used in displaying the calculated data.\
\
*Zero Range* - the range at which you wish the bullet to cross the line of sight.\
\
*Elevation Correction* - if checked, the elevation is changed to make the bullet cross the line of sight at the zero range -- zero drop at the zero range.\
\
*Azimuth Correction* - if checked, the azimuth is changed to make the bullet cross the line of sight at the zero range -- zero windage at the zero range. *Drop and Windage units* - sets the units used to display the drop and windage values in the calculated data.\
\
*Temperature, Pressure and Relative Humidity* - the measured or estimated air temperature (in degrees Fahrenheit), the barometric pressure (inches of Mercury) and the relative humidity (percent) at the firing position. These are required to calculate the air density and correct bullet drag.\
\
*Altitude* - Used in estimating the atmospheric conditions. This value is not used unless the Standard Conditions at Altitude checkbox is checked.\
\
*Standard Conditions at Altitude* - When checked, the temperature, pressure and humidity for standard atmospheric conditions at the entered altitude (always 0% at standard conditions) are entered in the calculation. The standard used is the ICAO standard atmosphere.\
\
*Elevation Correction* - or Drop correction, causes the elevation to be raised as required to cause the bullet to cross the line of sight at the zero range. Without this box checked, the zero range is ignored.\
\
*Azimuth Correction* - or Wind correction, causes the azimuth of the barrel to be increased as necessary to cause the bullet to cross the line of sight at the zero range.\
\

### Output Data

*Elevation* - the angle that the barrel makes with the line of sight in a vertical direction. This is the "holdover" angle in minutes of angle for the selected zero range.\
\
*Azimuth* - the angle that the barrel makes with the line of sight in a horizontal direction -- positive to the shooter's right. This is the "lead" angle in minutes of angle for the selected zero range.\
\
*Range* - distance from the shooter along the line of sight.\
\
*Velocity* - the speed of the bullet in feet per second.\
\
*Energy* - really the "Kinetic Energy" of the bullet. The kinetic energy is a measure of the maximum amount of work (force time distance) an object can do. \[It is also a measure of the work done by the firearm/case/primer/powder on the bullet.\]\
\
Energy = (wv)/(g7000)\
\
g is the acceleration due to gravity (~32.2 ft/sec/sec), w is the weight of the bullet in grains, v is the velocity in feet/sec.\
\
*Momentum* - A quantity of motion of the bullet.\
\
Momentum = (wv)/(g7000)\
\
w, g and v are as defined as above. The force on the bullet is related to the change of momentum in time:\
\
Force = (M<sub>2</sub> - M<sub>1</sub>)/(T<sub>2</sub> - T<sub>1</sub>)\
\
where M<sub>2</sub> is the momentum at time T <sub>2</sub> and M<sub>1</sub> is the momentum at time T<sub>1</sub>.\
\
*Drop* - the distance above or below the line of sight. Listed in either inches, minutes of angle or mils (6400 mils per 360 degrees or 3.375 mils per MOA). Drop is positive above the line of sight and negative below the line of sight.\
\
*Windage* - the distance to the right or left of the line of sight. Windage is positive to the shooters right and negative to the shooters left.\
\
*Lead* - the required target lead to the left or right of the line of site to hit a moving target. Lead is positive to the shooter's right and negative to the shooter's left.\
\
*Time* - the time of flight of bullet in seconds.\
\
