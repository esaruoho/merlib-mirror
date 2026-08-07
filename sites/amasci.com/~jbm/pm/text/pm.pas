unit PM;

interface

//***********************************************************************
//  Point mass ballistics .dll/.so include file.
//
//  This file defines all structures and types required for use
//  with this .dll/.so.
//
//  Copyright (c) 2002, James B. Millard, All rights reserved.
//
//***********************************************************************

//
// Constants
//
const
  PM_RETURN_FAILURE              = 0;
  PM_RETURN_SUCCESS              = 1;

//
// Errors
//
const
  PM_ERROR_NONE                  = 0;
  PM_ERROR_NULL_STRUCTURE        = 1;
  PM_ERROR_UNIT_CONVERSION       = 2;
  PM_ERROR_DIVIDE_ZERO           = 3;
  PM_ERROR_UNKNOWN_CONSTANT      = 4;
  PM_ERROR_INVALID_TEMP          = 5;
  PM_ERROR_INVALID_ALTITUDE      = 6;
  PM_ERROR_INVALID_DRAG_DATA     = 7;
  PM_ERROR_INVALID_DRAG_FUNCTION = 8;
  PM_ERROR_INVALID_RANGES        = 9;
  PM_ERROR_INVALID_MACH          = 10;
  PM_ERROR_INVALID_UNIT          = 11;
  PM_ERROR_INVALID_ATMOS_MODE    = 12;
  PM_ERROR_INVALID_DENSITY       = 13;
  PM_ERROR_INTERP_NO_DATA        = 14;

  PM_ERROR_LAST                  = 14;

//
// Units constants
//
const
  PM_UNITS_NONE                  = 0;    // dimensionless

// Angular units
  PM_UNITS_RAD                   = 1;    // radians
  PM_UNITS_MRAD                  = 2;    // millradians
  PM_UNITS_DEG                   = 3;    // degrees
  PM_UNITS_MOA                   = 4;    // minutes
  PM_UNITS_MIL                   = 5;    // mils

// Lengths
  PM_UNITS_IN                    = 6;    // inches
  PM_UNITS_MM                    = 7;    // millimeters
  PM_UNITS_FT                    = 8;    // feet
  PM_UNITS_CM                    = 9;    // centimeters
  PM_UNITS_M                     = 10;   // meters
  PM_UNITS_YD                    = 11;   // yards

// Speed
  PM_UNITS_MPH                   = 12;   // miles/hour
  PM_UNITS_KMH                   = 13;   // km/hour
  PM_UNITS_FPS                   = 14;   // feet/sec
  PM_UNITS_MPS                   = 15;   // meters/sec

// Temperature
  PM_UNITS_C                     = 16;   // centigrade
  PM_UNITS_F                     = 17;   // Fahrenheit
  PM_UNITS_R                     = 18;   // Rankine

// Air Pressure
  PM_UNITS_MB                    = 19;   // millibars
  PM_UNITS_HG                    = 20;   // inches Hg

// Weight
  PM_UNITS_GRN                   = 21;   // grains
  PM_UNITS_LB                    = 22;   // pounds
  PM_UNITS_GM                    = 23;   // grams

// Percent
  PM_UNITS_PCT                   = 24;   // percent

// Density and sectional density
  PM_UNITS_LBFT3                 = 25;   // lb/ft3
  PM_UNITS_LBIN2                 = 26;   // lb/in2

// Acceleration
  PM_UNITS_FTSEC2                = 27;   // ft/sec2
  PM_UNITS_MSEC2                 = 28;   // m/sec2

// Energy
  PM_UNITS_FTLB                  = 29;   // ft-lbs
  PM_UNITS_J                     = 30;   // Joules

// Momentum
  PM_UNITS_LBS                   = 31;   // lb-seconds
  PM_UNITS_NS                    = 32;   // Newton secs

// Time
  PM_UNITS_SEC                   = 33;   // seconds

//
// Constant identifiers -- used to identify a constant
// to be changed.
//
const
  PM_CONST_GRAVITY               = 0;    // Gravitational acceleration
  PM_CONST_EPSILON               = 1;    // Maximum integration error
  PM_CONST_ELEV_ERROR            = 2;    // Maximum elevation error
  PM_CONST_WIND_ERROR            = 3;    // Maximum windage error
  PM_CONST_ITER_COUNT            = 4;    // Maximum integration iterations
  PM_CONST_PBR_RADIUS            = 5;    // PBR radius
  PM_CONST_PBR_ELEV              = 6;    // Initial elevation for PBR calcs

//
// Atmospheric constants -- standard conditions
//
const
  PM_ATMOS_STD_TEMPERATURE       = 59.0;            // Temperature (°F)
  PM_ATMOS_STD_PRESSURE          = 29.92;           // Pressure    (in Hg)
  PM_ATMOS_STD_HUMIDITY          = 0.0;             // Humidity    (%)
  PM_ATMOS_STD_ALTITUDE          = 0.0;             // Altitude    (ft)
  PM_ATMOS_STD_MACH              = 1116.4499;       // Sound speed (ft/s)
  PM_ATMOS_STD_DENSITY           = 0.076474;        // density     (lbs/ft³)

//
// Atmospheric modes
//
const
  PM_ATMOS_STANDARD              = 0;    // Standard conditions
  PM_ATMOS_CORRECTED             = 1;    // Input conditions, corrected P
  PM_ATMOS_UNCORRECTED           = 2;    // Input conditions, uncorrected P
  PM_ATMOS_ALTITUDE              = 3;    // Standard conditions at altitude
  PM_ATMOS_USER                  = 4;    // Just use density and mach number

//
// Drag functions
//
const
  PM_DRAG_FUNCTION_G1            = 0;
  PM_DRAG_FUNCTION_G2            = 1;
  PM_DRAG_FUNCTION_G5            = 2;
  PM_DRAG_FUNCTION_G6            = 3;
  PM_DRAG_FUNCTION_G7            = 4;
  PM_DRAG_FUNCTION_G8            = 5;
  PM_DRAG_FUNCTION_GI            = 6;
  PM_DRAG_FUNCTION_CD            = 7;

//
// Trajectory options
//
const
  PM_TRAJ_CORRECT_WINDAGE        = $00000001;
  PM_TRAJ_CORRECT_ELEVATION      = $00000002;
  PM_TRAJ_CORRECT_CHRONO         = $00000004;
  PM_TRAJ_TRAJECTORY             = $00000008;
  PM_TRAJ_RANGE_METRIC           = $00000010;
  PM_TRAJ_POINT_BLANK_RANGE      = $00000020;

//
// Limits
//
const
  PM_MAX_RANGE                   = 2000;  // Yards or meters

  PM_MIN_MACH                    = 0.0;   // Minimum allowed mach number
  PM_MAX_MACH                    = 5.0;   // Maximum allowed mach number

//***********************************************************************
//  Structures
//***********************************************************************

//
// General structures
//
type
  //
  // Version info.  Structure is filled on output.
  //
  pPMVersionInfo = ^PMVersionInfo;
  PMVersionInfo = packed record
    Major : integer;
    Minor : integer;
    Build : integer;
  end;

  pPMVariable = ^PMVariable;
  PMVariable = packed record
    Units : integer;
    Value : double;
  end;

  //
  // Atmospheric modeling.
  //
  pPMAtmosphere = ^PMAtmosphere;
  PMAtmosphere = packed record
    Mode        : integer;
    Temperature : PMVariable;
    Pressure    : PMVariable;
    Humidity    : PMVariable;
    Altitude    : PMVariable;
    Mach        : PMVariable;
    Density     : PMVariable;
  end;

  //
  // Firearm.
  //
  pPMFirearm = ^PMFirearm;
  PMFirearm = packed record
    Chrono_Velocity : PMVariable;       // Measured velocity
    Chrono_Distance : PMVariable;       // Distance to chronograph
    Elevation       : PMVariable;       // Sight elevation
    Windage         : PMVariable;       // Sight windage
    Line_of_Sight   : PMVariable;       // Barrel-ground angle
    Cant            : PMVariable;       // Cant angle
    Sight_Height    : PMVariable;       // Sight height above bore
    Sight_Offset    : PMVariable;       // Lateral sight offset
  end;

  //
  // Bullet and drag modeling.  The PMCD structure is used to
  // hold BC/CD data as a function of velocity/mach number.
  //
  // The PMBullet structure holds information about a bullet
  // including an array of PMCD structures.
  //
  pPMCD = ^PMCD;
  PMCD = packed record
    Mach : double;
    CD   : double;
  end;

  pPMBC = ^PMBC;
  PMBC = packed record
    Velocity : PMVariable;
    BC       : double;
  end;

  pPMBCArray = ^PMBCArray;
  PMBCArray = array[0..0] of PMBC;

  pPMBullet = ^PMBullet;
  PMBullet = packed record
    Weight    : PMVariable;       // Weight
    Caliber   : PMVariable;       // Caliber (diameter)
    Sect_Dens : PMVariable;       // Sectional density
    Drag_Func : integer;          // Drag function, PM_DRAG_FUNCTION_XX
    Count     : integer;          // Number of BCs
    BCs       : pPMBCArray;       // Pointer to array of BCs
  end;

  //
  // Wind modeling.  PMWindData structures make a profile
  // of the wind as a function of range.  If there is only
  // one data point, it is considered constant for all ranges.
  //
  pPMWindData = ^pPMWindData;
  PMWindData = packed record
    Range  : PMVariable;
    Wind_X : PMVariable;
    Wind_Y : PMVariable;
    Wind_Z : PMVariable;
  end;

  pPMWindDataArray = ^PMWindDataArray;
  PMWindDataArray = array[0..0] of PMWindData;

  pPMWind = ^PMWind;
  PMWind = packed record
    Count : integer;
    Data  : pPMWindDataArray;
  end;

  //
  //
  pPMTrajectory = ^PMTrajectory;
  PMTrajectory = packed record
    Firearm    : pPMFirearm;
    Bullet     : pPMBullet;
    Atmosphere : pPMAtmosphere;
    Wind       : pPMWind;
    Options    : integer;
    Range_Min  : integer;
    Range_Max  : integer;
    Range_Inc  : integer;
    Range_Zero : integer;
  end;

  //
  //
  pPMOutputData = ^PMOutputData;
  PMOutputData = packed record
    Range    : PMVariable;
    Drop     : PMVariable;
    Windage  : PMVariable;
    Velocity : PMVariable;
    Mach     : PMVariable;
    Energy   : PMVariable;
    Momentum : PMVariable;
    Time     : PMVariable;
  end;

  //
  // Main data output structure(s).  It has all data calculated by
  // the trajectory function, pm_trajectory().
  //
  pPMOutputDataArray = ^PMOutputDataArray;
  PMOutputDataArray = array[0..0] of PMOutputData;

  pPMOutput = ^PMOutput;
  PMOutput = packed record
    Muzzle_Velocity : PMVariable;
    Elevation       : PMVariable;
    Windage         : PMVariable;
    PBR_Max_Range   : PMVariable;
    PBR_Mid_Range   : PMVariable;
    PBR_Zero_Range  : PMVariable;
    Count           : integer;
    Data            : pPMOutputDataArray;
  end;

//***********************************************************************
//  Functions
//***********************************************************************

//
// Fill in version information for the DLL. pm_version_date() fills in
// a date time string that is the compile date/time of the DLL. If buffer
// is NULL, the return is the number of characters required for the string.
//
function PM_Version_Info(var Vi : PMVersionInfo) : integer; stdcall;
function PM_Version_Date(Buffer : pchar; Count : integer) : integer; stdcall;

//
// Unit conversion routine.  "units" is a constant defined above.
// Converted value is in "output".  Return value is PM_RETURN_SUCCESS
// if successful, otherwise it return PM_RETURN_FAILURE.
//
function PM_Set_Value(var Variable : PMVariable; Units : integer; Value : double) : integer; stdcall
function PM_Get_Value(var Variable : PMVariable; Units : integer; var Value : double) : integer; stdcall;
function PM_Convert_Units(var From_Var, To_Var : PMVariable) : integer; stdcall;

//
// Get the integer code for the last error.  pm_get_error_string() gets
// a string description of the error.
//
function PM_Get_Last_Error : integer; stdcall;
function PM_Get_Error_String(Error : integer; Buffer : pchar; N : integer) : integer; stdcall;

//
// Get and set values for certain constants defined by PM_CONST_XXXXXXs
// above.  Return value is PM_RETURN_SUCCESS if successful, otherwise
// it return PM_RETURN_FAILURE.
//
function PM_Constant_Get_Double(Constant : integer; Units : integer; var Value : double) : integer; stdcall;
function PM_constant_Get_Integer(Constant : integer; var Value : integer) : integer; stdcall;
function PM_constant_Get_Boolean(Constant : integer; var Value : integer) : integer; stdcall;
function PM_constant_Set_Double(Constant : integer; Units : integer; Value : double) : integer; stdcall;
function PM_constant_Set_Integer(Constant : integer; Value : integer) : integer; stdcall;
function PM_constant_Set_Boolean(Constant : integer; Value : integer) : integer; stdcall;

//
// pm_atmosphere_standard() initializes the PMAtmosphere structure to
// standard conditions. The altitude is ignored.  pm_atmosphere_altitude()
// uses the filled in altitude to set the atmospheric conditions.
//
function PM_Atmosphere(var At : PMAtmosphere) : integer; stdcall;

//
// Bullet drag coefficient of the standard bullet as a function of mach number.
//
function PM_Drag_CD(Drag_Func : integer; var CD : PMCD) : integer; stdcall;

//
// pm_bullet_sect_dens() fills in the sect_dens member of the PMBullet
// structure.  It must be called before pm_bullet_cd().
//
function PM_Bullet_Sect_Dens(var Bt : PMBullet) : integer; stdcall;
function PM_Bullet_CD(var Bt : PMBullet; var At : PMAtmosphere; var CD : PMCD) : integer; stdcall;
function PM_Bullet_Sort_BCs(var Bt : PMBullet) : integer; stdcall;

//
// Main trajectory function.
//
function PM_Trajectory_Count(var Tj : PMTrajectory; var Count : integer) : integer; stdcall;
function PM_Trajectory_Size(var Tj : PMTrajectory; var Size : integer) : integer; stdcall;
function PM_Trajectory_Get_Option(var Tj : PMTrajectory; Option : integer; var On : integer) : integer; stdcall;
function PM_Trajectory_Set_Option(var Tj : PMTrajectory; Option : integer; On : integer) : integer; stdcall;
function PM_Trajectory(var Tj : PMTrajectory; var Ot : PMOutput) : integer; stdcall;

//
// Output functions
//
function PM_Output_Drop(var Data : PMOutputData; Units : integer; var Value : double) : integer; stdcall;
function PM_Output_Windage(var Data : PMOutputData; Units : integer; var Value : double) : integer; stdcall;
//
// Find the wind for the specified range.
//
function PM_Wind_Range(var W : PMWind; var Wd : PMWindData) : integer; stdcall;
function PM_Wind_Sort_Data(var W : PMWind) : integer; stdcall;

implementation

function PM_Version_Info;            external 'pm.dll' name 'pm_version_info';
function PM_Version_Date;            external 'pm.dll' name 'pm_version_date';
function PM_Set_Value;               external 'pm.dll' name 'pm_set_value';
function PM_Get_Value;               external 'pm.dll' name 'pm_get_value';
function PM_Convert_Units;           external 'pm.dll' name 'pm_convert_units';
function PM_Get_Last_Error;          external 'pm.dll' name 'pm_get_last_error';
function PM_Get_Error_String;        external 'pm.dll' name 'pm_get_error_string';
function PM_Constant_Get_Double;     external 'pm.dll' name 'pm_constant_get_double';
function PM_Constant_Get_Integer;    external 'pm.dll' name 'pm_constant_get_integer';
function PM_Constant_Get_Boolean;    external 'pm.dll' name 'pm_constant_get_boolean';
function PM_Constant_Set_Double;     external 'pm.dll' name 'pm_constant_set_double';
function PM_Constant_Set_Integer;    external 'pm.dll' name 'pm_constant_set_integer';
function PM_Constant_Set_Boolean;    external 'pm.dll' name 'pm_constant_set_boolean';
function PM_Atmosphere;              external 'pm.dll' name 'pm_atmosphere';
function PM_Drag_CD;                 external 'pm.dll' name 'pm_drag_cd';
function PM_Bullet_Sect_Dens;        external 'pm.dll' name 'pm_bullet_sect_dens';
function PM_Bullet_CD;               external 'pm.dll' name 'pm_bullet_cd';
function PM_Bullet_Sort_BCs;         external 'pm.dll' name 'pm_bullet_sort_bcs';
function PM_Trajectory_Count;        external 'pm.dll' name 'pm_trajectory_count';
function PM_Trajectory_Size;         external 'pm.dll' name 'pm_trajectory_size';
function PM_Trajectory_Get_Option;   external 'pm.dll' name 'pm_trajectory_get_option';
function PM_Trajectory_Set_Option;   external 'pm.dll' name 'pm_trajectory_set_option';
function PM_Trajectory;              external 'pm.dll' name 'pm_trajectory';
function PM_Output_Drop;             external 'pm.dll' name 'pm_output_drop';
function PM_Output_Windage;          external 'pm.dll' name 'pm_output_windage';
function PM_Wind_Range;              external 'pm.dll' name 'pm_wind_range';
function PM_Wind_Sort_Data;          external 'pm.dll' name 'pm_wind_sort_data';

end.
