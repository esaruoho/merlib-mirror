---
title: "Introduction to Console Applications and Files"
source_domain: amasci.com
source_path: ~htak/win32asm/conapp.htm
order: 3460
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T05:56:48Z
extractor: site_to_paper.py (pandoc)
---

# Introduction to Console Applications and Files

*Source page: `~htak/win32asm/conapp.htm`*

# Introduction to Console Applications and Files

We first look at a Console Application (Console App, for short) that copies files. The program, called "cp", shows how to parse command line arguments, and how to read and write files sequentially.\
A Console App is supplied with three open "standard" files, allowing us to create a DOS- or C-like program, including I/O redirection from within a DOS box.

- [Preliminaries](#prelim)
- [Starting a Program](#startup)
- [Retrieving the Command Line Arguments, and the Win32 API](#cmdline)
- [Opening Files](#openfiles)
- [Reading and Writing Files](#fileio)
- [Closing Files and Terminating the Program](#cleanup)
- [Parsing the Command Line](#parsecmd)
- [Error Routines and Standard Files](#errmsg)
- [Linking/Creating an Executable](#exefile)

\[ [Back to Win32 ASM Page](win32asm.htm) \]

### <span id="prelim"></span>Preliminaries

Win32 apps run in 32-bit segments using the FLAT memory model. Your program is thus automatically in protected mode. The addresses generated and used by your program are known as ***linear addresses***. Four segment registers (CS, DS, ES, and SS) are set up so that it doesn't matter which segment you use to address a given location (linear address). The only segment override needed is for the FS segment, which is used to hold an exception handling chain and info related to multithreading.\
MASM and TASM default to 16-bit 8086 mode, which makes the newer 32-bit instructions unavailable. So with these assemblers, we must tell them to allow, at the least, 386 instructions. With the latest versions, these assemblers allow "simplified" segment directives which are enabled with the .MODEL directive.

            .386
            .model    flat

An important assembler option is **case-sensitive** external names. All Win32 API names are case-sensitive.\
In TASM, the case-sensitive switch is either /MX or /ML. If you plan to use the PUBLICDLL directive, you'll need to use /ML, which makes all programmer-defined symbols case-sensitive.

### <span id="startup"></span>Starting a Program

All programs (Console Apps and standard GUI Apps) have a "start address" where execution begins. Microsoft and Borland, however, use different means to specify this address.

**Microsoft**: The start address is a PUBLIC symbol. When we invoke the MS linker, we specify a /ENTRY: switch to set the start address. If we specify `/ENTRY:start`, we will need to define a PUBLIC symbol called `_start` (note the prepended underscore).

**Borland**: The start address is the symbol specified in the END directive. It needn't be PUBLIC.

            public _start    ; public status ignored by Borland linker

            .code            ; simplified segment directive
       _start:

            ; rest of program

            end    _start    ; address ignored by MS linker

### <span id="cmdline"></span>Retrieving the Command Line Arguments, and the Win32 API

We first look at the API function, and show the parsing code later. GetCommandLine is the API function that returns a pointer (in EAX) to a null- (zero-) terminated string containing the command line. The entire command line is provided, which includes the expanded name of the EXE file. It has no arguments, so all you need to do is write:

            .data
        cmd_line_ptr   dd    0

            extrn   GetCommandLine:near

            .code
            call    GetCommandLine
            mov     [cmd_line_ptr],eax

            call    parse_cmd_line    ; our own parser

Or so it would seem. That's what all the documents and all the programming books would show. Although the function returns a string pointer, there are two kinds of strings: those containing 8-bit ANSI characters, and those containing 16-bit Unicode characters. And, consequently, there are actually two real names associated with this function: GetCommandLineA (A for ANSI) and GetCommandLineW (W for wide Unicode). The C or C++ programmer references an "include" file that redefines (with a macro) GetCommandLine as one of the two real names depending on whether a special (macro) variable has been defined or not. We can use a similar trick in MASM and TASM.\
Win95 and Win98 internally use ANSI, and because most of the Unicode versions of the API are disabled, we will use the ANSI versions. NT's native mode is Unicode, so using the Unicode versions under NT avoids the internal translation from ANSI to Unicode.\
The Win32 API is implemented in ***DLL's*** (dynamic link libraries). These libraries remain separate from your .EXE file. Unlike DOS, the API is not accessed with INT's. Like ordinary ***static*** (linked-in) libraries, the ordinary call-return stack mechanism is used to access the functions in the DLL's. There is a slight overhead due to the need to use indirection. Special ***import*** libraries are needed to create the indirect links. Microsoft and Borland, again, use different means to accomplish this.

**Microsoft**: There is a separate .LIB file for each DLL, so you need to list each DLL that's accessed. The LIB for KERNEL32.DLL is called KERNEL32.LIB, and similarly for all other DLL's. You only need to use one of the two links each .LIB file provides: a link to a JMP stub, or a indirect data link. The name of the JMP stub link is a "decorated" version of the API name: prepend an underscore and append "@" + number of argument bytes in decimal. Thus the GetCommandLineA link is called `_GetCommandLineA@0`. The indirect data link is almost the same: replace the prepended underscore with \_\_imp\_\_. Thus the indirect data link is called `__imp__GetCommandLineA@0`. The two are used differently:

            extrn   _GetCommandLineA@0:near
            call    _GetCommandLineA@0                ; direct CALL

            extrn   __imp__GetCommandLineA@0:dword    ; must be DWORD !!!
            call    __imp__GetCommandLineA@0          ; indirect CALL

**Borland**: In TASM 4.0, most of the Win32 API is gathered into a single IMPORT32.LIB file. The link name is exactly the same as the API name. There is only one link name, the name of a JMP stub, and you access it with a direct call.

            extrn   GetCommandLineA:near
            call    GetCommandLineA                   ; direct call

As I've mentioned, in both linkers, the direct call does not jump into the DLL! The JMP stub is an indirect JMP that makes the final leap into the DLL. Despite appearances, the Microsoft indirect call eliminates the JMP and, consequently, is the faster call.\
My current solution to handling both Microsoft and Borland libraries is to use the documented API names, handle the A/W pair of names in WIN32HST.INC, and use an include file containing ***text macros*** to rename all of the link names for the Microsoft libraries. Sophisticated macros can be used to minimize the number of declared names, but such macros can be incompatible between the two assemblers. ***Be aware that WIN32HST.INC is incomplete. Many of the Win32 constants and structures are missing.***

            ; Don't include vclib.inc, if using Borland linker
            include vclib.inc    ; Microsoft (Visual C++) link names

            include win32hst.inc ; constants, structures, and dual names

Within VCLIB.INC are two entries:

        GetCommandLineA equ <_GetCommandLineA@0>
        GetCommandLineW equ <_GetCommandLineW@0>

Within WIN32HST.INC is a conditional and two entries:

        if UNICODE
        ; ...
        GetCommandLine equ GetCommandLineW
        ; ...
        else
        ; ...
        GetCommandLine equ GetCommandLineA
        ; ...
        endif

### <span id="openfiles"></span>Opening Files

Assuming we have extracted two file names out of the command line, we can proceed to the actual file transfer. To open a file, we use CreateFile, which has seven arguments. Let's look at the function as documented by VC++.

    HANDLE CreateFile(
      LPCTSTR lpFileName,                         // pointer to name of the file
      DWORD dwDesiredAccess,                      // access (read-write) mode
      DWORD dwShareMode,                          // share mode
      LPSECURITY_ATTRIBUTES lpSecurityAttributes, // pointer to security descriptor
      DWORD dwCreationDistribution,               // how to create
      DWORD dwFlagsAndAttributes,                 // file attributes
      HANDLE hTemplateFile                        // handle to file with attributes to copy
     );

Each of these seven arguments must be put on the stack, in reverse order, before the function is called. All of the above arguments are 32-bits. The LP and lp prefixes means the argument is a pointer. We need to specify a minimum of four arguments to do any I/O. Unspecified arguments must be zero. (The operator "large" is needed for TASM 4.0.)\
The API documents a lot of constants by name. Below, you see them in all upper case letters, as per C custom. A number of them have been defined in WIN32HST.INC.

            .data
        source_filename_ptr dd 0
        dest_filename_ptr   dd 0

        source_file_handle dd 0
        dest_file_handle   dd 0

            extrn   CreateFile:near

            .code
            push    large 0    ; template file
            push    large FILE_ATTRIBUTE_NORMAL
            push    large OPEN_EXISTING
            push    large 0    ; security attributes
            push    large 0    ; share mode
            push    large GENERIC_READ
            push    [source_filename_ptr]
            call    CreateFile
            cmp     eax,INVALID_HANDLE_VALUE
            je      bad_source
            mov     [source_file_handle],eax

            push    large 0    ; template file
            push    large FILE_ATTRIBUTE_NORMAL
            push    large CREATE_ALWAYS
            push    large 0    ; security attributes
            push    large 0    ; share mode
            push    large GENERIC_WRITE
            push    [dest_filename_ptr]
            call    CreateFile
            cmp     eax,INVALID_HANDLE_VALUE
            je      bad_dest
            mov     [dest_file_handle],eax

If you're familiar with the way C is typically implemented, you'll notice that the arguments are not popped off the stack. The Win32 API functions do this for you. This is the ***stdcall*** calling convention. The only exceptions are the functions that have a variable number of arguments. The conventional ***cdecl*** calling convention, generated by C compilers, is used by these excepted functions, in which case, arguments are popped after a return. In the core Win32 API, there is only one function that uses the **cdecl** calling convention -- wsprintf (it has two versions wsprintfA and wsprintfW).\
The Win32 functions also preserve the EBX, ESI, EDI, and EBP registers, so you can expect these registers to have the same values before and after the call. The direction flag, DF, must be cleared, so that string ops in the API operate in ascending mode. The flag remains cleared when the function returns.

### <span id="fileio"></span>Reading and Writing Files

With the files open, we can now do the copying. The ReadFile and WriteFile functions access a byte stream file, just like DOS, and fread() and fwrite() in C. Each data transfer can be of arbitrary length, and end-of-file is signaled by returning zero bytes transferred.

        BUFFER_SIZE    equ    32768

            .data
        bytes_read    dd 0
        bytes_written dd 0

            .data?
        temp_buffer   db BUFFER_SIZE dup(?)

            extrn   ReadFile:near,WriteFile:near

            .code
        copy_loop:
            push    large 0        ; ptr to OVERLAPPED structure
            push    offset bytes_read
            push    large BUFFER_SIZE    ; maximum bytes to transfer
            push    offset temp_buffer
            push    [source_file_handle]
            call    ReadFile
            cmp     [bytes_read],0

            je      end_copy

            push    large 0        ; ptr to OVERLAPPED structure
            push    offset bytes_written
            push    [bytes_read]   ; write all bytes that were read
            push    offset temp_buffer
            push    [dest_file_handle]
            call    WriteFile
            jmp     copy_loop
        end_copy:

### <span id="cleanup"></span>Closing Files and Terminating the Program

Although files are normally closed on exit, we will clean up after ourselves with CloseHandle. We terminate the program using ExitProcess.

            extrn   CloseHandle:near,ExitProcess:near

            .code
            push    [source_file_handle]
            call    CloseHandle

            push    [dest_file_handle]
            call    CloseHandle

            push    large 0    ; exit code
            call    ExitProcess

### <span id="parsecmd"></span>Parsing the Command Line

The GetCommandLine function returns a pointer to a zero (null) terminated string. It includes the expanded EXE file name of our running program.

            .data?
        cmd_line_2    db    1024 dup(?)    ; space for extracted arguments

            .code
        parse_cmd_line:
            mov     esi,[cmd_line_ptr]    ; source
            mov     edi,offset cmd_line_2 ; destination
            call    scan_blanks
            call    scan_arg    ; skip EXE name

            call    scan_blanks
            mov     [source_filename_ptr],edi
            call    scan_arg

            call    scan_blanks
            mov     [dest_filename_ptr],edi
            call    scan_arg

            ret

We'll first perform the usual leading blank elimination.

        tab    equ    9

            .code
        scan_blanks_1:
            inc     esi
        scan_blanks:
            mov     al,[esi]
            cmp     al,' '
            je      scan_blanks_1
            cmp     al,tab
            je      scan_blanks_1
            ret     ; ESI points to first nonblank

File names, in the latest versions of Windows, can have embedded spaces, which can be signaled by quoting. We'll strip away the quotes. The CreateFile function requires zero (null) terminated strings, so we'll add it in.

        scan_arg:
            mov     al,[esi]
            cmp     al,0
            je      exit_scan_arg
            cmp     al,'"'
            je      scan_quoted
        scan_unquoted:
            mov     [edi],al
            inc     esi
            inc     edi
            mov     al,[esi]
            cmp     al,0
            je      exit_scan_arg

            cmp     al,' '
            je      exit_scan_arg
            cmp     al,tab
            je      exit_scan_arg
            cmp     al,'"'
            je      exit_scan_arg
            jmp     scan_unquoted
        scan_quoted:
            inc     esi    ; skip quote
            mov     al,[esi]
            cmp     al,0
            je      exit_scan_arg
            cmp     al,'"'
            je      exit_quoted
        scan_quoted_1:
            mov     [edi],al
            inc     esi
            inc     edi
            mov     al,[esi]
            cmp     al,0
            je      exit_scan_arg
            cmp     al,'"'
            je      exit_quoted
            jmp     scan_quoted_1
        exit_quoted:
            inc     esi    ; skip quote
        exit_scan_arg:
            mov     byte ptr [edi],0    ; terminate destination string
            inc     edi
            ret            ; esi points past argument

### <span id="errmsg"></span>Error Routines and Standard Files

Here we display the open failure messages.\
A standard GUI app is not guaranteed to receive any "standard files". However, a Console App does get the equivalent of C's stdin, stdout, and stderr. (The DOS equivalent of file handles 0, 1, and 2). Both "stdin" and "stdout" can be redirected at the command line in a DOS box. The handles are retrieved by GetStdHandle.

            .data
    bad_source_msg  db "Can't open source file",13,10
    bad_source_msg_len equ $ - bad_source_msg

    bad_dest_msg    db "Can't open destination file",13,10
    bad_dest_msg_len equ $ - bad_dest_msg

            extrn   GetStdHandle:near

            .code
    bad_source:
            mov     esi,offset bad_source_msg
            mov     ecx,bad_source_msg_len
            jmp     error_exit
    bad_dest:
            mov     esi,offset bad_dest_msg
            mov     ecx,bad_dest_msg_len
    error_exit:
            push    large 0 ; ptr to OVERLAPPED structure
            push    offset bytes_written
            push    ecx             ; byte count
            push    esi             ; byte buffer

            push    large STD_OUTPUT_HANDLE
            call    GetStdHandle

            push    eax
            call    WriteFile

            push    large 0    ; exit code

            call    ExitProcess

### <span id="exefile"></span>Linking/Creating an Executable

Most x86 assemblers (including MASM) will produce Intel OMF files with a default file extension of .OBJ. Most linkers that generate DOS executables will not be able to create Win32 executables. Two linkers are illustrated below. Microsoft's Win32 linker is (ambiguously) called LINK. Borland's linker is TLINK32.

**Microsoft**: The 32-bit linker has the same name as the 16-bit linker. LINK expects to receive object files in a UNIX-like COFF format with a default extension of .OBJ. If a .OBJ file is not a COFF file, the linker (ver. 3.0 does this) automatically converts the OMF file to COFF. The resulting file is not retained.\
On a side note, the latest versions of MASM can create Win32 COFF files directly. NASM is another assembler that can generate Win32 COFF files.\
As noted before, there will be one .LIB file for each DLL linked in. The API functions we've used are all in KERNEL32.DLL, so only one .LIB file needs to be linked in. Win32 views a Console App as a special "subsystem", so we need to specify that (/subsystem:console).\
And, as noted before, an entry point must be specified.\
    The option names are case-insensitive.\
The following assumes that some environment variables have been set up.

        link cp kernel32.lib /entry:start /subsystem:console

**Borland**: TLINK32 can only handle OMF files. So linking in COFF files (for example, the DirectX .LIB files, or the .OBJ files created by VC++) is not possible.\
Under Win95, if TLINK32 fails to work in a DOS box, run it in MS-DOS compatibility mode.\
The linker options shown below are for producing: an executable (/Tpe), a console app (/ap), and case-sensitive linking (/c). Linker options (unlike the assembler options) are case-sensitive.\
As noted before, most of the core Win32 API is collected into a single library, IMPORT32.LIB.\
The following assumes that some environment variables have been set up.

        tlink32 /Tpe /ap /c  cp,,,import32.lib

------------------------------------------------------------------------
