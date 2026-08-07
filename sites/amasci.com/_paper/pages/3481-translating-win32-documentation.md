---
title: "Translating Win32 Documentation"
source_domain: amasci.com
source_path: ~htak/win32asm/winxlate.htm
order: 3481
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T05:56:48Z
extractor: site_to_paper.py (pandoc)
---

# Translating Win32 Documentation

*Source page: `~htak/win32asm/winxlate.htm`*

# Translating Win32 Documentation

The official Win32 API documentation is written for C and C++ programmers. If you want someone to translate it all to ASM, you'll be waiting a long, long time -- it's that big. So it's a good idea to learn how to translate the API function syntax from C code into ASM code.

- [Standard Win32 calls](#win32call)
- [COM interface](#comcall)
- [Size of data types](#datasize)
- [Register save conventions](#regsave)
- [Callbacks](#callbacks)

[Back to Win32 ASM Page](win32asm.htm)

### <span id="win32call"></span>Standard Win32 calls

The routines you'll use most in ASM will be the core Win32 API functions. Most of the functions have a fixed number of arguments, and these functions use the **stdcall** calling convention. The few that have a variable number of arguments (e.g., wsprintf) use the **cdecl** calling convention.\
A typical API function is shown in the following definition format:

return-type function-name ( arg-type-1 arg-name-1, ... );

So, for example, the definition of SetWindowText looks like

BOOL SetWindowText ( HWND hWnd, LPCTSTR lpString );

In all cases, the arguments will be pushed starting with the rightmost argument. So to call the above function, you push the arguments before calling like this:

Push lpString\
Push hWnd\
Call SetWindowText

If you know what the types HWND and LPCTSTR mean, you will be able to convert the call to something like this:

            push    offset title1        ; address of new title string
            push    dword ptr [ebp+8]    ; hwnd from wndproc arg list
            call    SetWindowText        ; BOOL result (success/fail) in EAX
            ; arguments already popped by SetWindowText

The above illustrates the **stdcall** calling convention used by most of the Win32 API functions. SetWindowText pops the arguments so that you won't need to. If it had used the **cdecl** calling convention, you would've needed to reset ESP with an extra instruction, as in the following:

            add     esp,8      ; pop two DWORD arguments

Because SetWindowText uses a character string, the documentation is actually referring to two functions: SetWindowTextA, which uses a string of ANSI (8-bit) characters, and SetWindowTextW, which uses a string of (wide 16-bit) Unicode characters. In a C program, the include file **windows.h** has macros that automatically control and redefine these documented names to their Unicode/ANSI-specific ones. Thus the typical program will use only the documented names.\
In MASM and TASM we can use a text macro to supply the default name:

            SetWindowText    equ    <SetWindowTextA>    ; use ANSI in Win95

You can, if you like, use a more elaborate technique to select which name you want as default.

### <span id="comcall"></span>COM (and OLE2 and ActiveX) interface

There is also an object-based COM interface (sometimes known as OLE2 or ActiveX) which uses another calling convention. There is an extra hidden argument, which is the address of the interface record, and the function is called indirectly via an address table known as the **vtable**.\
The COM interface is usually programmed in C++. The syntax for a function call is typically

interface_pointer -\> function ( arglist )

The arguments are pushed in the reverse order, just like SDK functions. The extra argument is the interface pointer which is pushed last. Then we use it to access the vtable and call the function. You will need to know the exact storage order of the function addresses. Assuming interface_pointer is in memory, the instructions would be something like

            ; ...
            ; insert argument stacking here
            ; ...
            mov     eax,[interface_pointer]
            push    eax          ; push interface pointer
            mov     ecx,[eax]    ; 1st dword of interface is vtable addr
            call    [ecx+8]      ; call the third function
            ; arguments already popped

String data in COM interfaces should **<u>always</u>** be in Unicode.

### <span id="datasize"></span>Size of data types

One type, TCHAR, is special. Its size depends on whether the C program defaults to ANSI (**char**) or Unicode **(short**).\
Some unsigned types are prefixed with U. Pointers are prefixed by P or LP. Handles are prefixed by H.\
Some sizes and the types that have them include:

BYTE: **char** (signed), BYTE (unsigned)\
WORD: **short** (signed), WORD (unsigned), ATOM (unsigned)\
QWORD: **double** (floating point)\
DWORD: **int** (signed), DWORD (unsigned), handles, pointers, and hopefully everything else that's not a **struct** or related to the previous types

### <span id="regsave"></span>Register save conventions

The core Win32 functions will preserve the values of EBP, EBX, ESI, EDI, and DF. On entry, the direction flag, DF, is expected to be cleared for ascending mode in string ops.

### <span id="callbacks"></span>Callbacks

Windows uses a few callback functions, the most familiar is the window procedure. These functions must follow the register save conventions used by the API functions. All of the callbacks use the **stdcall** calling convention.\
Because arguments are pushed in reverse order, the first listed argument is always immediately after the stacked EIP. If you use the standard prolog:

            push    ebp
            mov     ebp,esp
            sub     esp,4    ; example for allocating one local DWORD

then you can access the first argument as \[ebp+8\], the second argument as \[ebp+12\], and so on. The size of each argument is a multiple of four bytes (DWORD). Most arguments are integers, handles, or pointers: all of these are only one DWORD in size.\
The standard prolog must have a matching epilog:

            mov     esp,ebp
            pop     ebp

The arguments can be popped off with the return instruction:

            ret     16        ; example for four DWORD arguments

------------------------------------------------------------------------
