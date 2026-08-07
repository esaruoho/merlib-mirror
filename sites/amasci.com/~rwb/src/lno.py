#!/usr/bin/env python

''' Library Number Checksum Generator --
    generates the last digit of a student
    number given the first eight digits.
    based on C code written by Richard Bean 14/3/1996
    <s329970@student.uq.edu.au>

    Note that if the first 7 digits
    of the library number are 2406710
    these may be omitted i.e.
     lno.py 329970
    gives the same results as
     lno.py 2406710329970
'''

import string

def gen_uq_library_checksum( digits ):
    p = 0
    x = len(digits)
    for n in range(x):
        a = string.atoi( digits[n] )
	if (n-x)&1 and a<9:
		 p = p + (a+a)%9
	else:
		 p = p + a
    return (10 - p % 10) % 10

def usage():
    sys.stderr.write( __doc__ + '\n' )
    sys.stderr.write( 'usage: %s 2406710329970\n' % sys.argv[0] )
    sys.exit(2)

if __name__ == '__main__':
    import sys

    if len(sys.argv) != 2: usage()
    print gen_uq_library_checksum( sys.argv[1] )

