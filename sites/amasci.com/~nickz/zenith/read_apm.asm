;       By N. Zymaris 12/22-23/95 from specs in APMV10.DOC
;       (APM.ZIP in Compuserve -- Zenith Data Systems Forum).
;       Returns Advanced Power Management (APM) information.
;       Info on differences between versions may be found in R. Brown's list.
;
;       Version 1.0 December 23, 1995 c. 4am.
;       Version 1.1 December 23, 1995 c. 5am: replace Int 29h calls for CRLF
;         and "No" with Int 21h so that redirection of output works OK; break
;         "Low Battery" message into two lines after testing.

	org     100h
start:  jmp     begin
crlf:   push    ax              ; Subroutine to print CR LF.
	push    dx
	call    crlf1
	db      0Dh,0Ah,"$"
crlf1:  pop     dx
	mov     ax,0900h
	int     21h
	pop     dx
	pop     ax
	ret

no:     push    ax              ; Subroutine to print "No "
	push    dx
	call    no_1
	db      "No $"
no_1:   pop     dx        
	mov     ax,0900h
	int     21h
	pop     dx
	pop     ax
	ret

unk:    push    ax              ; Subroutine to print "Unknown." if DX=FFh,
	push    dx              ;         else print "Reserved."
	
	cmp     dl,0FFh
	je      unk1
	call    unk_cmn
	db      "Unknown.$"

unk1:   call    unk_cmn
	db      "Reserved.$"

unk_cmn: pop    dx
	mov     ax,0900h
	int     21h
	pop     dx
	pop     ax
	ret

begin:  mov     ax,5300h        ; AH=53=Call APM function, AL=00=Instl. Check
	mov     bx,0h           ; System BIOS
	int     15h
	jnc     ncarry1
	jmp     carry
ncarry1: push    ax              ; Save regs. that might be or are modified
	push    bx
call    L1
	db      "APM Version: $"
L1:     pop     dx
	mov     ax,0900h
	int     21h
	pop     bx              ; Restore regs.
	pop     ax
;                         Process AX
	push    ax              ; Save for future reference
	push    dx
	xor     dx,dx
	mov     dl,ah           ; Only look at high part for now
	add     dl,30h          ; Convert BCD to ASCII
	mov     ax,0200h        ; Output a single character to stdout
	int     21h
	mov     dl,"."          ; Print a decimal point between maj&min ver#.
	int     21h
	pop     dx   

	pop     ax              ; Restore AX as returned by APM/Int 15h
	push    ax
	push    dx
	xor     dx,dx
	mov     dl,al           ; Now look only at low part
	add     dl,30h          ; BCD --> ASCII
	mov     ax,0200h        ; Output a single character to stdout
	int     21h
	call    crlf            ; Print CRLF
	pop     dx
;                         Now for BX
	mov     dl,bh           ; Should be "P(ower)"
	int     21h
	mov     dl,bl           ; Should be "M(anagement)"
	int     21h
	pop     ax
	call    L2
	db      "  <-- Signature; should be: P(ower) M(anagement).$"
L2:     pop     dx
	mov     ax,0900h
	int     21h
	call    crlf
;                         Now for CX
	call    L3
	db      "BIOS Power Management is $"
L3:     pop     dx
	mov     ax,0900h
	int     21h

	test    cx,8            ; Bit 3=BIOS PM disabled
	jz      enabled
	call    L4              ; Here if bit 3=1=disabled
	db      "Disabled.$"
L4:     pop     dx
	jmp     print1
enabled: call    L5
	db      "Enabled.$"
L5:     pop     dx
print1: mov     ax,0900h
	int     21h
	call    crlf

	test    cx,4
	jz      noslow
	call    L6
	db      "CPU Idle slows the CPU.$"
L6:     pop     dx
	jmp     print2
noslow: call    L7
	db      "CPU Idle does not slow the CPU.$"
L7:     pop     dx
print2: mov     ax,0900h
	int     21h
	call    crlf
	
	test    cx,2
	jne     bit32
	call    no
bit32:  call    L8
	db      "32-bit Protected Mode support.$"
L8:     pop     dx
	mov     ax,0900h
	int     21h
	call    crlf
	
	test    cx,1
	jne     bit16
	call    no
bit16:  call    L9
	db      "16-bit Protected Mode support.$"
L9:     pop     dx
	mov     ax,0900h
	int     21h
	call    crlf
;
;               Done with Installation check function.  Now, Get Power Status.
;
	mov     ax,530ah        ; AH=53=Call APM function, AL=0A=Get Pwr Status
	mov     bx,0001h        ; 00=System; 01=All devices controlled by BIOS
	int     15h
	jnc     ncarry2
	jmp     carry

ncarry2: call    L11
	db      "AC status: $"
L11:    pop     dx
	mov     ax,0900h
	int     21h

	cmp     bh,0
	jne     ps1
	call    L12
	db      "Offline (no AC being used).$"
L12:    pop     dx
	jmp     ps1_cmn

ps1:    cmp     bh,1
	jne     ps1a
	call    L13
	db      "Online (AC is being used).$"
L13:    pop     dx
	jmp     ps1_cmn

ps1a:   xor     dx,dx
	mov     dh,bh
	xchg    dh,dl
	call    unk             ; Unknown or reserved.

ps1_cmn: mov     ax,0900h
	int     21h
	call    crlf

	call    L14
	db      "Battery status: $"
L14:    pop     dx
	mov     ax,0900h
	int     21h

	cmp     bl,0
	jne     ps2
	call    L15
	db      "High (green LED on Zenith 433VLp when using AC).$"
L15:    pop     dx
	jmp     ps_cmn

ps2:    cmp     bl,1
	jne     ps3
	call    L16
	db      "Low (Zenith beeps, flashes red LED, and eventually suspends"
	db      0Dh,0Ah,"itself).$"
L16:    pop     dx
	jmp     ps_cmn

ps3:    cmp     bl,2
	jne     ps4
	call    L17
	db      "Critical (system about to suspend itself to avoid damage).$"
L17:    pop     dx
	jmp     ps_cmn

ps4:    cmp     bl,3
	jne     ps5
	call    L18
	db      "Charging (amber LED on Zenith 433VLp).$"
;       (This does not seem to be used on the Zenith 433VLp).
L18:    pop     dx
	jmp     ps_cmn

ps5:    xor     dx,dx
	mov     dl,bl
	call    unk             ; Unknown or reserved.
	
ps_cmn: mov     ax,0900h
	int     21h
	call    crlf

;       *********** Here on Normal Exit.  
	mov     ax,04C00h
	int     21h             ; Exit with no error (Errorlevel=0).

;       *********** Here on Int 15h Error.
carry:  call    L10
	db      "Error -- carry set on Int 15h return.$"
L10:    pop     dx
	mov     ax,0900h
	int     21h
	call    crlf

	mov     ax,04C01h
	int     21h             ; Exit with Errorlevel=1.
	
	end     start
