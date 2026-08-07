
/***********************************************************************

  Interpolation routines.

  Copyright (c) 2002, James B. Millard, All rights reserved.

  $Id: interp.c,v 1.11 2002/09/09 03:27:11 jbm Exp $

***********************************************************************/

#include <math.h>
#include <stdio.h>

#include "pm.h"
#include "error.h"
#include "interp.h"

/*
  Generalized interpolation routine.  The actual work is done by the
  routines passed in.
*/
pm_return pm_interpolate(void *array, size_t count, void *user,
  interp_data data, interp_locate locate, interp_interp interp, void *output)
{
  long jl, ju, jm;
  double v, vjl, vju, f, fd;

  if ((NULL == data) || (NULL == locate) || (NULL == interp) || (NULL == output))
  {
    pm_set_last_error(PM_ERROR_NULL_STRUCTURE);
    return (PM_RETURN_FAILURE);
  }

  v = data(output, user);

  jl = -1;
  ju = count;

  while (ju - jl > 1)
  {
    jm = (ju + jl)/2;
    if (v >= data(locate(array, jm, user), user))
      jl = jm;
    else
      ju = jm;
  }
  
  /* If we found values, do the linear interpolation. */

  if ((jl >= 0) && (jl < count - 1))
  {
    vju = data(locate(array, ju, user), user);
    vjl = data(locate(array, jl, user), user);

    fd = vju - vjl;

    if (fd > 0.0)
    {
      f = (v - vjl)/fd;
      interp(f, locate(array, jl, user), locate(array, ju, user), output, user);
    }
    else
    {
      interp(0.0, locate(array, jl, user), locate(array, jl, user), output, user);
    }
    return (PM_RETURN_SUCCESS);
  }
  pm_set_last_error(PM_ERROR_INTERP_NO_DATA);
  return (PM_RETURN_FAILURE);
}
