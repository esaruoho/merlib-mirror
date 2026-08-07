#include <stdio.h>
#include <stdlib.h>
int
main(int argc, char **argv)
{
	int             a[12966][6], r, c, n, s, x, z, g, h, y;

	if (argc != 2) {
		printf("usage: %s decimals\n", argv[0]);
		exit(1);
	}
	z = atoi(argv[1]);
	g = z * 1.43067;
	if ((g & 1) == 0)
		g++;
	h = z * 0.420451;
	if ((h & 1) == 0)
		h++;
	x = 16;
	y = 5;
	s = 25;
one:
	c = 1;
	for (n = 0; n <= z; n++) {
		a[n][1] = x / y;
		if (a[n][1])
			x -= a[n][1] * y;
		x *= 10;
		a[n][4] = a[n][1];
	}
	while (y == 5 || c < h) {
		c += 2;
		r = a[0][4];
		for (n = 0; n <= z; n++) {
			a[n][3] = r / s;
			if (a[n][3])
				r -= a[n][3] * s;
			r *= 10;
			r += a[n + 1][4];
		}
		r = a[0][3];
		for (n = 0; n <= z; n++) {
			a[n][4] = a[n][3];
			a[n][2] = r / c;
			if (a[n][2])
				r -= a[n][2] * c;
			r *= 10;
			r += a[n + 1][3];
		}



		if ((c & 3) == 1) {
			for (n = z; n >= 0; n--) {
				a[n][3] = a[n][1] + a[n][2];
				if (a[n][3] > 9) {
					a[n][3] -= 10;
					a[n - 1][2]++;
				}
				a[n][1] = a[n][3];
			}
		}
		if ((c & 3) == 3) {
			for (n = z; n >= 0; n--) {
				a[n][3] = a[n][1] - a[n][2];
				if (a[n][3] < 0) {
					a[n][3] += 10;
					a[n - 1][2]++;
				}
				a[n][1] = a[n][3];
			}
		}
		if (y == 5 && c == g) {
			for (n = 0; n <= z; n++)
				a[n][5] = a[n][3];
			x = 4;
			y = 239;
			s = 57121;
			goto one;
		}
	}

	for (n = z; n >= 0; n--) {
		a[n][4] = a[n][5] - a[n][3];
		if (a[n][4] < 0) {
			a[n][4] += 10;
			a[n - 1][3]++;
		}
	}
	for (n = 0; n < z; n++)
		printf("%d", a[n][4]);
	return 0;
}
