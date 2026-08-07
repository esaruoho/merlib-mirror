#!/usr/bin/env python

''' Student Number Checksum Generator --
    generates the last digit of a student
    number given the first eight digits.
    based on C code written by Richard Bean 14/3/1996
    <s329970@student.uq.edu.au>
'''

import string

def gen_uq_student_checksum( digits ):

    if len(digits) != 8: 
        raise ValueError, 'expected string of 8 digits'

    s = map( string.atoi, digits )
    return  ( 110
              - 1 * ( s[0] + s[3] + s[6] )
	      - 3 * ( s[1] + s[4] + s[7] )
	      + 3 * ( s[2] + s[5] )
	    ) % 10;

def is_valid_student_number( studno ):
    if len(studno) != 9:
        raise ValueError, 'expected string of 9 digits'
    chkval = string.atoi( studno[8] )
    return chkval == gen_uq_student_checksum( studno[:8] )

def usage():
    import sys
    sys.stderr.write( __doc__+'\n' )
    sys.stderr.write( 'usage: %s 16082895\n' % sys.argv[0] )
    sys.exit(2)

if __name__ == '__main__':
    import sys

    if len(sys.argv) != 2: usage()

    if len(sys.argv[1]) == 8: 
	print 'check digit is', gen_uq_student_checksum( sys.argv[1] )
    elif len(sys.argv[1]) == 9: 
	if is_valid_student_number( sys.argv[1] ):
	    print 'student number is valid'
	    sys.exit(0)
	else:
	    print 'student number is NOT valid'
	    sys.exit(1)
    else:
        usage()

