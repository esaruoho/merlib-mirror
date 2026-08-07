/*
  PM Example 1
*/

#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#include "pm.h"

#define COUNT 21

int main(int argc, char *argv[])
{
  PMAtmosphere at;
  PMWind       w;
  PMWindData   wd[2];
  PMBullet     b;
  PMBC         bcs[2];
  PMFirearm    f;
  PMTrajectory tj;
  PMOutputData td[COUNT];
  PMOutput     ot;
  double       v, x_moa, z_moa;
  int          i;

  /* Atmosphere */
  at.mode = PM_ATMOS_STANDARD;
  pm_set_value(&at.altitude, PM_UNITS_FT, 0);
  if (PM_RETURN_SUCCESS != pm_atmosphere(&at))
  {
    printf("Failure in pm_atmosphere(), Error code = %ld\n", pm_get_last_error());
  }

  /* Wind */
  w.data  = wd;
  w.count = 1;

  pm_set_value(&wd[0].range, PM_UNITS_YD, 0.0);
  pm_set_value(&wd[0].wind_x, PM_UNITS_MPH, 10.0);
  pm_set_value(&wd[0].wind_y, PM_UNITS_MPH, 0.0);
  pm_set_value(&wd[0].wind_z, PM_UNITS_MPH, 0.0);

  /* Bullet */
  pm_set_value(&b.weight, PM_UNITS_GRN, 168.0);
  pm_set_value(&b.caliber, PM_UNITS_IN, 0.308);

  b.bcs = bcs;
  b.drag_func = PM_DRAG_FUNCTION_G1;
  b.count = 1;

  pm_set_value(&bcs[0].velocity, PM_UNITS_FPS, 0.0);
  bcs[0].bc = 0.5;

  /* Firearm */
  pm_set_value(&f.chrono_velocity, PM_UNITS_FPS, 3000.0);
  pm_set_value(&f.chrono_distance, PM_UNITS_FT, 10.0);
  pm_set_value(&f.elevation, PM_UNITS_RAD, 0.0);
  pm_set_value(&f.windage, PM_UNITS_RAD, 0.0);
  pm_set_value(&f.line_of_sight, PM_UNITS_RAD, 0.0);
  pm_set_value(&f.cant, PM_UNITS_RAD, 0.0);
  pm_set_value(&f.sight_height, PM_UNITS_IN, 1.5);
  pm_set_value(&f.sight_offset, PM_UNITS_IN, 0.0);

  /* Trajectory */
  tj.atmosphere = &at;
  tj.bullet     = &b;
  tj.firearm    = &f;
  tj.wind       = &w;

  tj.range_min  = 0;
  tj.range_inc  = 50;
  tj.range_max  = (COUNT - 1)*tj.range_inc;
  tj.range_zero = 200;

  ot.count      = COUNT;
  ot.data       = td;

  pm_trajectory_set_option(&tj, PM_TRAJ_CORRECT_WINDAGE, 0);
  pm_trajectory_set_option(&tj, PM_TRAJ_CORRECT_ELEVATION, 1);
  pm_trajectory_set_option(&tj, PM_TRAJ_CORRECT_CHRONO, 1);
  pm_trajectory_set_option(&tj, PM_TRAJ_TRAJECTORY, 1);
  pm_trajectory_set_option(&tj, PM_TRAJ_RANGE_METRIC, 0);
  pm_trajectory_set_option(&tj, PM_TRAJ_POINT_BLANK_RANGE, 1);

  if (PM_RETURN_SUCCESS == pm_trajectory(&tj, &ot))
  {

    printf("%6s %6s %6s %6s %6s %6s %6s %6s %6s %6s\n", 
      "Range", "Drop", "Drop", "Wind", "Wind", "Vel", "Mach", "Energy", "Mom", "Time");
    printf("%6s %6s %6s %6s %6s %6s %6s %6s %6s %6s\n", 
      "(yard)", "(in)", "(moa)", "(in)", "(moa)", "(f/s)", "", "(f-lb)", "(lb-s)", "(s)");

    for (i = 0; i < ot.count; i++)
    {
      pm_output_drop(&ot.data[i], PM_UNITS_MOA, &z_moa);
      pm_output_windage(&ot.data[i], PM_UNITS_MOA, &x_moa);

      pm_get_value(&ot.data[i].range, PM_UNITS_YD, &v);
      printf("%6.1f ", v);
      pm_get_value(&ot.data[i].drop, PM_UNITS_IN, &v);
      printf("%6.1f %6.1f ", v, z_moa);
      pm_get_value(&ot.data[i].windage, PM_UNITS_IN, &v);
      printf("%6.1f %6.1f ", v, x_moa);
      pm_get_value(&ot.data[i].velocity, PM_UNITS_FPS, &v);
      printf("%6.1f ", v);
      pm_get_value(&ot.data[i].mach, PM_UNITS_NONE, &v);
      printf("%6.3f ", v);
      pm_get_value(&ot.data[i].energy, PM_UNITS_FTLB, &v);
      printf("%6.1f ", v);
      pm_get_value(&ot.data[i].momentum, PM_UNITS_LBS, &v);
      printf("%6.3f ", v);
      pm_get_value(&ot.data[i].time, PM_UNITS_SEC, &v);
      printf("%6.3f\n", v);
    }

    pm_get_value(&ot.pbr_max_range, PM_UNITS_YD, &v);
    printf("\nMaximum point blank range = %f\n", v);
    pm_get_value(&ot.pbr_zero_range, PM_UNITS_YD, &v);
    printf("Maximum point blank zero = %f\n", v);
    pm_get_value(&ot.pbr_mid_range, PM_UNITS_YD, &v);
    printf("Range at maximum height = %f\n", v);
  } 
  else
  {
    printf("Failure in pm_trajectory, Error code = %ld\n", pm_get_last_error());
  }

  return (0);
}
