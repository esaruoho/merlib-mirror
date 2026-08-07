#include <stdio.h>
/* Library Number Checksum Generator --
** generates the last digit of a student
** number given the first eight digits.
** written by Richard Bean 14/3/1996
** s329970@student.uq.edu.au
**
** note that if the first 7 digits
** of the library number are 2406710
** these may be omitted i.e.
** libcheck 329970
** gives the same results as
** libcheck 2406710329970
*/

void usage(void)
{
        printf("Usage: libcheck 2406710329970\n");
        exit(1);
}

int main(int argc, char **argv)
{
        int a, n, x, p = 0; 
	char t[2]="\0\0";
        if (argc != 2) usage();
        x = strlen(argv[1]);
        for (n = 0; n < x; n++)
        {
                t[0] = argv[1][n];
                a = atoi(t);
                if ((n - x) & 1 && a < 9) 
			a = (a+a) % 9;
                p += a;
        }
        printf("%d\n", (10 - p % 10) % 10);
        return 0;
}
