/* Latin trade algorithm, by Nick Cavenagh,
** from the paper:
*/

/*
** Nicholas J. Cavenagh,
** Latin Trade Algorithms and the Smallest Critical Set in a Latin Square.
** Journal of Automata, Languages and Combinatorics 8 (2003) 4, 567-578. 
**
** Selected Papers of the Thirteenth Australasian Workshop on Combinatorial Algorithms
** (Kingfisher Bay Resort, Fraser Island, Queensland, Australia, July 7-10, 2002) 
*/

/* Implemented in C, by Richard Bean, 18 April 2004 */

/* the program takes four arguments: filename, size, element 1, element 2 */
/* the file is in the form "1234 2341 4123" */
/* then it outputs T_1 and T_2 on the standard output */
/* disjoint mates are then easy to derive if necessary */
/* nothing is output if the theorem conditions are not met */

#define MAX 20			/* maximum number of columns */
#include <stdio.h>  /* printf(), fopen(), fscanf(), fflush() */
#include <stdlib.h> /* atoi(), exit() */
#include <string.h> /* memset() */

int
getcol (int s[3][MAX], int n, int r, int e)
{
  int a;
  for (a = 0; a < n; a++)
    if (s[r][a] == e)
      return a;
}

int
getalpha (int s[3][MAX], int n, int e)
{
  int a;
  for (a = 0; a < n; a++)
    if (s[0][a] == e)
      return s[1][a];
}

int
getbeta (int s[3][MAX], int n, int e)
{
  int a;
  for (a = 0; a < n; a++)
    if (s[1][a] == e)
      return s[2][a];
}

int
getgamma (int s[3][MAX], int n, int e)
{
  int a;
  for (a = 0; a < n; a++)
    if (s[2][a] == e)
      return s[0][a];
}

int
print (int s[3][MAX], int n)
{
  int j, i;
  for (j = 0; j < 3; j++)
    {
      for (i = 0; i < n; i++)
	if (s[j][i])
	  printf ("%3d ", s[j][i] - 1);
	else
	  printf (" -- ");
      printf ("\n");
    }
  printf ("\n");
  fflush (stdout);
}


main (int argc, char **argv)
{
  int e1, e2, i, j, p = 0, q = 0, t1[3][MAX], t2[3][MAX], ft,
    s[3][MAX], n, x, alpha[MAX + 1], beta[MAX + 1];
  FILE *f;
  if (argc != 5)
    exit (0);
  e1 = atoi (argv[3]);
  e2 = atoi (argv[4]);
  if (e1 == e2)
    exit (0);
  f = fopen (argv[1], "r");
  n = atoi (argv[2]);

  /* for (j = 0; j < 3; j++)
     for (i = 0; i < n; i++)
     fscanf (f, "%d", &(s[j][i]));
   */

  for (j = 0; j < 3; j++)
    {
      char st[MAX];
      fscanf (f, "%s", st);
      for (i = 0; i < n; i++)
	  s[j][i] = st[i] - '0';
    }

  memset (t1, 0, sizeof (t1));
  memset (t2, 0, sizeof (t2));

  x = e1;
  alpha[0] = x;
  while (x != e2)
    {
      int c;
      p++;
      if (p > n)
	exit (0);
      alpha[p] = getalpha (s, n, x);
      c = getcol (s, n, 0, x);
      t1[0][c] = s[0][c];
      t1[1][c] = s[1][c];
      t2[0][c] = s[0][c];
      t2[1][c] = s[1][c];
      x = alpha[p];
    }

  x = e1;
  beta[0] = x;
  while (x != e2)
    {
      int c;
      q++;
      if (p + q > n)
	exit (0);
      beta[q] = getbeta (s, n, x);
      c = getcol (s, n, 1, x);
      t1[1][c] = s[1][c];
      t1[2][c] = s[2][c];
      t2[1][c] = s[1][c];
      t2[2][c] = s[2][c];
      x = beta[q];
    }

  for (i = 0; i < p; i++)
    for (j = 0; j < q; j++)
      if (alpha[i] == beta[j] && (i || j))
	  exit (0);

  x = e1;
  while (x != e2)
    {
      int y, fl = 0;
      t1[2][getcol (s, n, 2, x)] = x;
      for (y = 0; y < p; y++)
	if (getgamma (s, n, x) == alpha[y])
	  fl = 1;
      if (fl)
	x = getalpha (s, n, getgamma (s, n, x));
      else
	{
	  int ff = 0, g;
	  g = getgamma (s, n, x);
	  t1[0][getcol (s, n, 0, g)] = g;
	  x = g;
	  for (y = 1; y < q; y++)
	    if (x == beta[y])
	      ff = 1;
	  while (ff)
	    {
	      int bx;
	      int gbx;
	      bx = getbeta (s, n, x);
	      gbx = getgamma (s, n, bx);
	      t1[0][getcol (s, n, 0, gbx)] = gbx;
	      x = gbx;
	      ff = 0;
	      for (y = 1; y < q; y++)
		if (x == beta[y])
		  ff = 1;
	    }
	}
    }

  x = getbeta (s, n, e1);
  ft = 1;
  while (x != e2 || ft)
    {
      int y, fl = 0;
      if (!ft)
	{
	  t2[2][getcol (s, n, 2, x)] = x;
	  for (y = 0; y < p; y++)
	    if (getgamma (s, n, x) == alpha[y])
	      fl = 1;
	}
      if (fl)
	x = getalpha (s, n, getgamma (s, n, x));
      else
	{
	  int ff = 0, g;
	  ft = 0;
	  g = getgamma (s, n, x);
	  t2[0][getcol (s, n, 0, g)] = g;
	  x = g;
	  for (y = 1; y < q; y++)
	    if (x == beta[y])
	      ff = 1;
	  while (ff)
	    {
	      int bx;
	      int gbx;
	      bx = getbeta (s, n, x);
	      gbx = getgamma (s, n, bx);
	      t2[0][getcol (s, n, 0, gbx)] = gbx;
	      x = gbx;
	      ff = 0;
	      for (y = 1; y < q; y++)
		if (x == beta[y])
		  ff = 1;
	    }
	}
    }

  print (t1, n);
  print (t2, n);
  return 0;
}
