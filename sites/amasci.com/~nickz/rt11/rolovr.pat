; Date Rollover Patch for RT-11 V5.01c
; by Nicholas Zymaris, November 12, 1997.

; If you have Date Rollover enabled in your system, you will want to change 
; the code as indicated so that all months, and years from 1973-2099, will 
; roll over properly.  Original code in uppercase; patches use lowercase.

; Go into EDT, KED, etc. and look for the ROLOVR global label in RMONFB.MAC.  
; The RMONSJ.MAC file has identical code (except for the local labels being
; offset by one) that also needs to be changed.  Make the changes and
; re-SYSGEN your system.

ROLOVR::MOV	$DATE,R1 	; from RMONFB.MAC, (c) DEC 1984
	BEQ	2$ 		; don't roll over if no date at all
 				;   (makes it easier for 2003./2035. too)
	mov	r2,-(sp)	; Save it in case other sys routines use it
	mov	r1,r2		; Save original date
	bic	#37777,r2	; ...only the century bits
	bic	#140000,r1	; Century bits will screw up month otherwise
	MOV	R1,-(SP)
	MOV	R1,-(SP) 
	ASR	R1 		; will improperly shift century bits
	ASR	R1 
	SWAB	R1 
	BIC	#^C<17>,R1 
	ADD	PC,R1 
	MOVB	DAYTBL-.-1(R1),R1 
	CMPB	R1,#28. 
	BNE	NOLEAP 
	BIT	#3,@SP 		; works fine in 2000, 2004, 2008, ...
	BNE	NOLEAP 		;  (until 22nd century fix needed ;-)
	INCB	R1 		; 29. is max. for leap years
NOLEAP:	ASL	@SP 
	ASL	@SP 
	ASL	@SP 
	SWAB	@SP 
	BICB	#^C<37>,@SP 
	CMPB	(SP)+,R1 		; Byte compare: cty. bits don't matter
	BHIS	LSTDAY 
	ADD	#40,@SP 		; just increment day, no rollover
	BR	4$ 
LSTDAY:	BIC	#<31.*40>,@SP 		; zero out date (e.g. 0-Dec-97)
	ADD	#<1*40>+<1*2000>,@SP 	; add 1 to date and month (e.g. 1-Dec)
	CMP	@SP,#<13.*2000> 	; at "13th month"?
	BLO	4$ 			; no, don't roll over year
				; Commented out: clears one too many bits:
;	BIC	#<31.*2000>,@SP 	; clr month out (& low century bit!)
				; Use this instead:
	Bic	#<15.*2000>,@SP 	; clr month out (leave c. bit alone)
	ADD	#2001,@SP 		; Incr. yr. and day -> 1-Jan-XX
	bit	#37,@sp			; Did yr overflow? (2004., 2036.)
	bne	4$			; No, date OK, set it and that's it
	add	#<40000-40>,@sp		; Correct dt & year (use century bits)
4$:	add	r2,@sp			; Restore century bits
	MOV	(SP)+,$DATE 		; Set new system date
	mov	(sp)+,r2		; Restore R2
	BR	2$ 			; (Local labels differ in SJ monitor)
DAYTBL:	.BYTE	31.,28.,31.,30.,31.,30. ; "30 Days hath September..."
	.BYTE	31.,31.,30.,31.,30.,31. 
2$:	; continue with regular monitor code
