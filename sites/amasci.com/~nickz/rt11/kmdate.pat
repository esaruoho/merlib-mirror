; KMDATE modification to RT-11 V5.01c KMOVLY.MAC for Year 2000 compatibility
; by Nicholas Zymaris 10-Nov-1997

; Instructions: edit the file KMOVLY.MAC which is found on Distribution
; Diskette 5, or your custom version of it if you have changed it.  Go to the 
; following line:

;6$:	MOV	$DATE-$RMON(R0),R2

; (it has no semicolon in the actual file.)  Insert the following code after 
; it.  Existing code in in uppercase, and additions are in upper/lowercase.

; It keeps <Y2K functionality & displays years >2003 as dd-mm-yy properly.


		 	; (begin monitor code to change)
			; (R4 has the address of MONTHS in it)

	mov	r2,(pc)+	; Save date (don't use stack)
orgdat:	.word	0
	BIT	#140037,R2	; only output "No date" if 1972, not 2004
				; ** (changed from #140000) **
	Beq	10$ 		; --> routine to print out "No date" message
				; If year >1999. then 0 in low 5 bits is OK
	bic	#140000,r2	; Munge year so day, month OK
				; (if not, ^N's get into string, etc.)
7$:	MOV	@SP,R0 
	MOV	R2,-(SP) 	; push date word onto stack
	BIC	#^C<37>,@SP 	; isolate
	ASR	R2 		; (this would fail if hi bit set)
; [original code is fine here; leave it alone till after label 8$]:
8$:	.TTYOUT	(R4)+ 		; (day printed in deleted part); print month
	DEC	R2 		; or SOB R2,8$ (except on old PDP's) 
	BNE	8$ 
	TST	(SP)+ 
	MOV	(SP)+,R0 
	bit	#140000,orgdat	; Check saved date
	bne	13$		; branch if year 2004. and up
	cmp	r0,#34		; Year less than 2000.?
	blo	11$		; yes, use old monitor routine
	sub	#34,r0		; Here if year is 2000.-2003. (34-37)
	br	12$		; Print 2-digit 21st-century year

13$:	bic	#37777,orgdat 	; Isolate high bits (if any) of year
	swab	orgdat		; Shift 9 bits over
	ror	orgdat		; ...
	add	orgdat,r0	; Add it to year
	sub	#<2000.-1972.>,r0
	br	12$

11$:	ADD	#72.,R0 	; add 1972. to year offset (only old dates)
12$:	CALL	R10OUT		; Print year (1973-2099, 2 digits)

; [and continue with original monitor code]
