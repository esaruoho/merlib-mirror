
/***********************************************************************
  Point mass ballistics .dll/.so include file.

  This file defines all structures and types required for use 
  with this .dll/.so.

  Copyright (c) 2002, James B. Millard, All rights reserved.

  $Id: pm.h,v 1.46 2004/06/29 00:56:20 jbm Exp $

***********************************************************************/

#ifndef PM_H_
#define PM_H_

#include <string.h>

/***********************************************************************
  Following allows for compiling into a 32-bit Window's DLL.  
  If __WIN32__ is defined, EXPORT__ is defined as WINAPI _export 
  which allows for the function to be exported from the DLL.
  If it isn't defined, EXPORT__ evaluates to nothing.
***********************************************************************/
#if defined(__WIN32__) && !defined(__CONSOLE__)
  #define EXPORT__ _export _stdcall  /* required to export functions */
#else
  #define EXPORT__                   /* not exporting, so nothing */
#endif

/*
  Constants
*/
#define PM_RETURN_FAILURE              0
#define PM_RETURN_SUCCESS              1

/*
  Errors
*/
#define PM_ERROR_NONE                  0
#define PM_ERROR_NULL_STRUCTURE        1
#define PM_ERROR_UNIT_CONVERSION       2
#define PM_ERROR_DIVIDE_ZERO           3
#define PM_ERROR_UNKNOWN_CONSTANT      4
#define PM_ERROR_INVALID_TEMP          5
#define PM_ERROR_INVALID_ALTITUDE      6
#define PM_ERROR_INVALID_DRAG_DATA     7
#define PM_ERROR_INVALID_DRAG_FUNCTION 8
#define PM_ERROR_INVALID_RANGES        9
#define PM_ERROR_INVALID_MACH          10
#define PM_ERROR_INVALID_UNIT          11
#define PM_ERROR_INVALID_ATMOS_MODE    12
#define PM_ERROR_INVALID_DENSITY       13
#define PM_ERROR_INTERP_NO_DATA        14

#define PM_ERROR_LAST                  14

/*
  Units constants
*/
#define PM_UNITS_NONE                  0    /* dimensionless */

/* Angular units */
#define PM_UNITS_RAD                   1    /* radians       */
#define PM_UNITS_MRAD                  2    /* millradians   */
#define PM_UNITS_DEG                   3    /* degrees       */
#define PM_UNITS_MOA                   4    /* minutes       */
#define PM_UNITS_MIL                   5    /* mils          */

/* Lengths */
#define PM_UNITS_IN                    6    /* inches        */
#define PM_UNITS_MM                    7    /* millimeters   */
#define PM_UNITS_FT                    8    /* feet          */
#define PM_UNITS_CM                    9    /* centimeters   */
#define PM_UNITS_M                     10   /* meters        */
#define PM_UNITS_YD                    11   /* yards         */

/* Speed */
#define PM_UNITS_MPH                   12   /* miles/hour    */
#define PM_UNITS_KMH                   13   /* km/hour       */
#define PM_UNITS_FPS                   14   /* feet/sec      */
#define PM_UNITS_MPS                   15   /* meters/sec    */

/* Temperature */
#define PM_UNITS_C                     16   /* centigrade    */
#define PM_UNITS_F                     17   /* Fahrenheit    */
#define PM_UNITS_R                     18   /* Rankine       */

/* Air Pressure */
#define PM_UNITS_MB                    19   /* millibars     */
#define PM_UNITS_HG                    20   /* inches Hg     */

/* Weight */
#define PM_UNITS_GRN                   21   /* grains        */
#define PM_UNITS_LB                    22   /* pounds        */
#define PM_UNITS_GM                    23   /* grams         */

/* Percent */
#define PM_UNITS_PCT                   24   /* percent       */

/* Density and sectional density */
#define PM_UNITS_LBFT3                 25   /* lb/ft3        */
#define PM_UNITS_LBIN2                 26   /* lb/in2        */

/* Acceleration */
#define PM_UNITS_FTSEC2                27   /* ft/sec2       */
#define PM_UNITS_MSEC2                 28   /* m/sec2        */

/* Energy */
#define PM_UNITS_FTLB                  29   /* ft-lbs        */
#define PM_UNITS_J                     30   /* Joules        */

/* Momentum */
#define PM_UNITS_LBS                   31   /* lb-seconds    */
#define PM_UNITS_NS                    32   /* Newton secs   */

/* Time */
#define PM_UNITS_SEC                   33   /* seconds       */

/*
  Constant identifiers -- used to identify a constant
  to be changed.
*/
#define PM_CONST_GRAVITY               0    /* Gravitational acceleration      */
#define PM_CONST_EPSILON               1    /* Maximum integration error       */
#define PM_CONST_ELEV_ERROR            2    /* Maximum elevation error         */
#define PM_CONST_WIND_ERROR            3    /* Maximum windage error           */
#define PM_CONST_ITER_COUNT            4    /* Maximum integration iterations  */
#define PM_CONST_PBR_RADIUS            5    /* PBR radius                      */
#define PM_CONST_PBR_ELEV              6    /* Initial elevation for PBR calcs */

/*
  Atmospheric constants -- standard conditions
*/
#define PM_ATMOS_STD_TEMPERATURE       59.0            /* Temperature (°F)      */
#define PM_ATMOS_STD_PRESSURE          29.92           /* Pressure    (in Hg)   */
#define PM_ATMOS_STD_HUMIDITY          0.0             /* Humidity    (%)       */
#define PM_ATMOS_STD_ALTITUDE          0.0             /* Altitude    (ft)      */
#define PM_ATMOS_STD_MACH              1116.4499       /* Sound speed (ft/s)    */
#define PM_ATMOS_STD_DENSITY           0.076474        /* density     (lbs/ft³) */

/*
  Atmospheric modes
*/
#define PM_ATMOS_STANDARD              0    /* Standard conditions              */
#define PM_ATMOS_CORRECTED             1    /* Input conditions, corrected P    */
#define PM_ATMOS_UNCORRECTED           2    /* Input conditions, uncorrected P  */
#define PM_ATMOS_ALTITUDE              3    /* Standard conditions at altitude  */
#define PM_ATMOS_USER                  4    /* Just use density and mach number */

/*
  Drag functions
*/
#define PM_DRAG_FUNCTION_G1            0
#define PM_DRAG_FUNCTION_G2            1
#define PM_DRAG_FUNCTION_G5            2
#define PM_DRAG_FUNCTION_G6            3
#define PM_DRAG_FUNCTION_G7            4
#define PM_DRAG_FUNCTION_G8            5
#define PM_DRAG_FUNCTION_GI            6
#define PM_DRAG_FUNCTION_CD            7

/*
  Trajectory options
*/
#define PM_TRAJ_CORRECT_WINDAGE        0x00000001
#define PM_TRAJ_CORRECT_ELEVATION      0x00000002
#define PM_TRAJ_CORRECT_CHRONO         0x00000004
#define PM_TRAJ_TRAJECTORY             0x00000008
#define PM_TRAJ_RANGE_METRIC           0x00000010
#define PM_TRAJ_POINT_BLANK_RANGE      0x00000020

/*
  Limits
*/
#define PM_MAX_RANGE                   2000  /* Yards or meters */

#define PM_MIN_MACH                    0.0   /* Minimum allowed mach number */
#define PM_MAX_MACH                    5.0   /* Maximum allowed mach number */

/***********************************************************************
  Types
***********************************************************************/
typedef int pm_return;

typedef int (*qsort_compare)(const void*, const void*);

/***********************************************************************
  Structures
***********************************************************************/

/*
  Version info.  Structure is filled on output.
*/
typedef struct
{
  long major;
  long minor;
  long build;
} PMVersionInfo, *pPMVersionInfo;

/*
  Values
*/
typedef struct
{
  long   units;
  double value;
} PMVariable, *pPMVariable;

/*
  Atmospheric modeling.  
*/
typedef struct
{
  long mode;
  PMVariable temperature;        
  PMVariable pressure;
  PMVariable humidity;
  PMVariable altitude;
  PMVariable mach;
  PMVariable density;
} PMAtmosphere, *pPMAtmosphere;

/*
  Firearm.
*/
typedef struct
{
  PMVariable chrono_velocity;         /* Measured velocity       */
  PMVariable chrono_distance;         /* Distance to chrono      */ 
  PMVariable elevation;               /* Sight elevation         */
  PMVariable windage;                 /* Sight windage           */
  PMVariable line_of_sight;           /* Barrel-ground angle     */
  PMVariable cant;                    /* Cant angle              */
  PMVariable sight_height;            /* Sight height above bore */
  PMVariable sight_offset;            /* Lateral offset          */
} PMFirearm, *pPMFirearm;

/*
  Bullet and drag modeling.  The PMCD structure is used to
  hold BC/CD data as a function of velocity/mach number.

  The PMBullet structure holds information about a bullet
  including an array of PMCD structures.
*/
typedef struct
{
  double mach;
  double cd;
} PMCD, *pPMCD;

typedef struct
{
  PMVariable velocity;
  double bc;
} PMBC, *pPMBC;

typedef struct
{
  PMVariable weight;              /* Weight (grains)        */
  PMVariable caliber;             /* Caliber (inches)       */
  PMVariable sect_dens;           /* Sectional density      */
  long       drag_func;           /* Drag function          */
  long       count;               /* # of BCs or CDs        */
  pPMBC      bcs;
} PMBullet, *pPMBullet;

/*
  Wind modeling.  PMWindData structures make a profile
  of the wind as a function of range.  If there is only
  one data point, it is considered constant for all ranges.
*/
typedef struct
{
  PMVariable range;
  PMVariable wind_x;
  PMVariable wind_y;
  PMVariable wind_z;
} PMWindData, *pPMWindData;

typedef struct
{
  long        count;
  pPMWindData data;
} PMWind, *pPMWind;

/*
*/
typedef struct
{
  pPMFirearm    firearm;
  pPMBullet     bullet;
  pPMAtmosphere atmosphere;
  pPMWind       wind;
  long          options;
  long          range_min;
  long          range_max;
  long          range_inc;
  long          range_zero;
} PMTrajectory, *pPMTrajectory;

/*
*/
typedef struct
{
  PMVariable range;
  PMVariable drop;
  PMVariable windage;
  PMVariable velocity;
  PMVariable mach;
  PMVariable energy;
  PMVariable momentum;
  PMVariable time;
} PMOutputData, *pPMOutputData;

/*
  Main data output structure(s).  It has all data calculated by
  the trajectory function, pm_trajectory().
*/

typedef struct
{
  PMVariable  muzzle_velocity;         /* Actual muzzle velocity */
  PMVariable  elevation;
  PMVariable  windage;
  PMVariable  pbr_max_range;
  PMVariable  pbr_mid_range;
  PMVariable  pbr_zero_range;
  long        count;
  pPMOutputData data;
} PMOutput, *pPMOutput;

/***********************************************************************
  Functions
***********************************************************************/

/* 
  Fill in version information for the DLL. pm_version_date() fills in 
  a date time string that is the compile date/time of the DLL. If buffer 
  is NULL, the return is the number of characters required for the string. 
*/
pm_return EXPORT__ pm_version_info(pPMVersionInfo vi);
size_t EXPORT__ pm_version_date(char *buffer, size_t n);

/* 
  Unit conversion routine.  "units" is a constant defined above.  
  Converted value is in "output".  Return value is PM_RETURN_SUCCESS 
  if successful, otherwise it returns PM_RETURN_FAILURE.  
*/
pm_return EXPORT__ pm_set_value(pPMVariable variable, long units, double value);
pm_return EXPORT__ pm_get_value(pPMVariable variable, long units, double *value);
pm_return EXPORT__ pm_convert_units(pPMVariable from, pPMVariable to);

/*
*/
long EXPORT__ pm_get_last_error(void);
size_t EXPORT__ pm_get_error_string(long error, char *buffer, size_t n);

/*
  Get and set values for certain constants defined by PM_CONST_XXXXXXs
  above.  Return value is PM_RETURN_SUCCESS if successful, otherwise
  it returns PM_RETURN_FAILURE.  
*/
pm_return EXPORT__ pm_constant_get_double(long constant, long units, double *value);
pm_return EXPORT__ pm_constant_get_integer(long constant, long *value);
pm_return EXPORT__ pm_constant_get_boolean(long constant, int *value);
pm_return EXPORT__ pm_constant_set_double(long constant, long units, double value);
pm_return EXPORT__ pm_constant_set_integer(long constant, long value);
pm_return EXPORT__ pm_constant_set_boolean(long constant, int value);

/* 
  pm_atmosphere_standard() initializes the PMAtmosphere structure to 
  standard conditions. The altitude is ignored.  pm_atmosphere_altitude() 
  uses the filled in altitude to set the atmospheric conditions. 
*/
pm_return EXPORT__ pm_atmosphere(pPMAtmosphere at);

/*
  Bullet drag coefficient of the standard bullet as a function of mach number.
*/
pm_return EXPORT__ pm_drag_cd(long drag_func, pPMCD cd);

/* 
  pm_bullet_sect_dens() fills in the sect_dens member of the PMBullet 
  structure.  It must be called before pm_bullet_cd().
*/
pm_return EXPORT__ pm_bullet_sect_dens(pPMBullet bt);
pm_return EXPORT__ pm_bullet_cd(pPMBullet bt, pPMAtmosphere at, pPMCD cd);
pm_return EXPORT__ pm_bullet_sort_bcs(pPMBullet bt);

/*
  Trajectory functions.
*/
pm_return EXPORT__ pm_trajectory_count(pPMTrajectory tj, long *count);
pm_return EXPORT__ pm_trajectory_size(pPMTrajectory tj, long *size);
pm_return EXPORT__ pm_trajectory_get_option(pPMTrajectory tj, long option, int *on);
pm_return EXPORT__ pm_trajectory_set_option(pPMTrajectory tj, long option, int on);
pm_return EXPORT__ pm_trajectory(pPMTrajectory tj, pPMOutput ot);

/*
  Output functions
*/
pm_return EXPORT__ pm_output_drop(pPMOutputData data, long units, double *value);
pm_return EXPORT__ pm_output_windage(pPMOutputData data, long units, double *value);

/*
  Find the wind for the specified range.
*/
pm_return EXPORT__ pm_wind_range(pPMWind w, pPMWindData wd);
pm_return EXPORT__ pm_wind_sort_data(pPMWind w);

#endif /* PM_H_ */

