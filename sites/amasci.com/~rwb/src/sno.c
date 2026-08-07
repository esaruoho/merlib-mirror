/* Student Number Checksum Generator --
** generates the last digit of a student
** number given the first eight digits.
** written by Richard Bean 14/3/1996
** s329970@student.uq.edu.au
*/

#include <stdio.h>

void usage(void)
{
	printf("Usage: snocheck 32997094\n");
	exit(1);
}

int main(int argc, char **argv)
{
	int n, x, s[10]; 
	char t[2]="\0\0";
	if (argc != 2) usage();
	x = strlen(argv[1]);
	if (x != 8) usage();
	for (n=0; n<x; n++) 
	{
		t[0] = argv[1][n];
		s[n] = atoi(t);
	}
	n = (110-(s[0]+s[3]+s[6])-3*(s[1]+s[4]+s[7])+3*(s[2]+s[5]))%10;
	printf("%d\n",n);
	return 0;
}
