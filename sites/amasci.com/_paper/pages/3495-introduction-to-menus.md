---
title: "Introduction to Menus"
source_domain: amasci.com
source_path: ~htak/win32asm/winmenu.htm
order: 3495
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T17:10:08Z
extractor: site_to_paper.py (pandoc)
---

# Introduction to Menus

*Source page: `~htak/win32asm/winmenu.htm`*

# Introduction to Menus

The Win32 API provides a number of functions to create menus dynamically from scratch, but the preferred way is to create ***menu templates*** and store them as ***resources*** in the EXE file. This is usually accomplished with a menu editor and a resource compiler, but here we show how to create a menu template without these special tools. The program is **winmenu.asm**.

- [The program preliminaries](#program)
- [Adding a menu to a window](#makemenu)
- [The rest of the preliminaries](#prelim2)
- [Menu template definition](#definemenu)
- [Menu dispatch](#dispatchmenu)
- [Menu actions](#menuaction)

[Back to Win32 ASM Page.](win32asm.htm)

### <span id="program"></span>The program preliminaries

First, the usual program startup -- up to just before the call to CreateWindowEx.

            .386
            .model  flat

            ; If using TLINK32, don't include vlib.inc
            include vclib.inc    ; Microsoft VC++ .lib link names

            include win32hst.inc    ; constants, structures, and entry names

            .data
            align   4
    wcx     dd      size WNDCLASSEX           ; cbSize
            dd      CS_VREDRAW or CS_HREDRAW  ; style
            dd      WndProc                   ; lpfnWndProc
            dd      0,0                       ; cbClsExtra, cbWndExtra
            dd      0                         ; hInstance
            dd      0                         ; hIcon
            dd      0                         ; hCursor
            dd      COLOR_WINDOW+1            ; hbrBackground
            dd      0                         ; lpszMenuName
            dd      wndclsname                ; lpszClassName
            dd      0                         ; hIconSm

    wndclsname db 'winmain',0

            .code

            public _start
            extrn   GetModuleHandle:near
            extrn   LoadIcon:near,LoadCursor:near
            extrn   RegisterClassEx:near

    _start:
            push    large 0         ; NULL string pointer means
            call    GetModuleHandle ; get HINSTANCE/HMODULE of EXE file
            mov     [wcx.wcx_hInstance],eax

            push    large IDI_WINLOGO
            push    large 0         ; hInstance, 0 = stock icon
            call    LoadIcon
            mov     [wcx.wcx_hIcon],eax

            push    large IDC_ARROW
            push    large 0         ; hInstance, 0 = stock cursor
            call    LoadCursor
            mov     [wcx.wcx_hCursor],eax

            push    offset wcx
            call    RegisterClassEx

            .data
            align   4
    cwargs   dd   0                  ; dwExStyle
             dd   wndclsname         ; lpszClass
             dd   wnd_title          ; lpszName
             dd   WS_VISIBLE or WS_OVERLAPPED or WS_SYSMENU or WS_THICKFRAME \
                  or WS_MINIMIZEBOX or WS_MAXIMIZEBOX  ; style
             dd   100                ; x
             dd   100                ; y
             dd   400                ; cx (width)
             dd   200                ; cy (height)
             dd   0                  ; hwndParent
             dd   0                  ; hMenu
             dd   0                  ; hInstance
             dd   0                  ; lpCreateParams

    msgbuf MSG      <>

    wnd_title db 'Window with menu',0

            .code

            extrn   CreateWindowEx:near
            extrn   GetMessage:near,DispatchMessage:near
            extrn   ExitProcess:near

            sub     esp,48            ; allocate argument list
            mov     esi,offset cwargs ; set block move source
            mov     edi,esp           ; set block move destination
            mov     ecx,12            ; number of arguments
            rep movsd
            mov     eax,[wcx.wcx_hInstance]
            mov     [esp+40],eax      ; set hInstance argument in stack

### <span id="makemenu"></span>Adding a menu to a window

Our program will define the menu template in memory. Here we create a menu "object" by calling LoadMenuIndirect, which returns a menu handle. The menu is attached to the window we are creating by setting a CreateWindowEx argument.\
You can also create a window without a menu and later add it with SetMenu. This API function can also be used to change menus. Menus can also be deleted with this API function by using a NULL (zero) menu handle.\
Menus can be further managed and manipulated via their handles.

            .code

            extrn   LoadMenuIndirect:near

            push    offset appMenuTemplate
            call    LoadMenuIndirect
            mov     [esp+36],eax    ; set hMenu argument in stack

### <span id="prelim2"></span>The rest of the preliminaries

Here we finally call CreateWindowEx, and add the message loop.

            .code
            call    CreateWindowEx

    msg_loop:
            push    large 0         ; uMsgFilterMax
            push    large 0         ; uMsgFilterMin
            push    large 0         ; hWnd (filter), 0 = all windows
            push    offset msgbuf   ; lpMsg
            call    GetMessage      ; returns FALSE if WM_QUIT
            or      eax,eax
            jz      end_loop

            push    offset msgbuf
            call    DispatchMessage

            jmp     msg_loop

    end_loop:
            push    large 0 ; (error) return code
            call    ExitProcess

### <span id="definemenu"></span>Menu template definition

The first two template entries are part of the template header. The two entries are the menu template version number, and an offset to the list of menu items. The offset allows the skipping of additional header information. Version 0 is the original NT and older Win16 template. We will be using the new version 1 template. It adds the F1 help ID to the header. Note that the offset entry in the header is set to skip this extra information. The header must be aligned on a DWORD boundary.\
Each menu item that follows the header must also be aligned on a DWORD boundary. There are five fields (entries) and a sixth field which is supplied only for a popup menu item. They are, in order: the item type, the item state, the item ID, menu structure info, the item text, and the F1 help ID.\
The item type field contains some valid combination of MFT\_ constants. It indicates the kinds of menu information to be shown. Our example uses only the MFT_STRING and MFT_SEPARATOR types. The MFT_SEPARATOR type produces the bar between the Help... and About... menu items.\
The item state field contains some valid combination of MFS\_ constants. We use only the MFS_ENABLED type. It indicates a display or selection state.\
The item ID is the ID number sent via the WM_COMMAND message to the window procedure that has the menu. Although the field is 32-bits, only 16-bits are sent via WM_COMMAND. The convention is to name them as constants beginning with IDM\_.\
The next field is the menu structure info. It is a byte field padded to a WORD boundary. Intel's little-endian number format allows us to set it and the padding with a DW directive. The API does not have standard names for the valid data of this field. We define MFR\_ constants for this purpose. There are only two: the MFR_POPUP flag signals that the items following it are part of a popup submenu. The last item in the main menu or submenu has the MFR_END flag in this field. The two flags can be combined.\
The item text is the text that will be displayed by a MFT_STRING item. In spite of the fact that we use the "A" version of LoadMenuIndirect, **the strings in the template must be in wide Unicode format**. That's why DW is used instead of DB. As in C, strings are terminated with a zero null (NUL) character. This field always exists because of the need for padding to a DWORD boundary. An '&' in the item string causes the character following it to show up underlined. The underlined character is the keyboard menu selector. So if you press and release the Alt key, the first item in the menu bar will be highlighted. Then press the 'F' key, and the File submenu will pop up. If a submenu pops up, another keypress can select an item on the submenu. To display '&' as a character, you must double it as '&', '&'.\
And finally the F1 help ID. This field must exist for a MFR_POPUP entry; it must not exist for any other. It must be aligned on a DWORD boundary.

    ;
    ; Menu item (command) IDs
    ;
    IDM_EXIT equ 101
    IDM_HELP equ 901
    IDM_ABOUT equ 902
    ;
    ; Menu template
    ;
    MFR_END equ 80h
    MFR_POPUP       equ 01h

            .data
            align   4       ; must align on DWORD boundary
    appMenuTemplate dw 1    ; menu template version
                            dw 4    ; offset from end of this word to menu item list
                            dd 0    ; menu bar help ID

                            dd MFT_STRING,MFS_ENABLED,0
                            dw MFR_POPUP                    ; first column
                            dw '&','F','i','l','e',0,0      ; pad to align 4
                            dd 0                            ; popup help ID

                            dd MFT_STRING,MFS_ENABLED,IDM_EXIT
                            dw MFR_END                      ; bottom of column
                            dw 'E','&','x','i','t',0,0      ; pad to align 4

                            dd MFT_STRING,MFS_ENABLED,0
                            dw MFR_POPUP or MFR_END         ; second column, last one
                            dw '&','H','e','l','p',0,0      ; pad to align 4
                            dd 0                            ; popup help ID

                            dd MFT_STRING,MFS_ENABLED,IDM_HELP
                            dw 0
                            dw '&','H','e','l','p','.','.','.',0

                            dd MFT_SEPARATOR,0,0
                            dw 0
                            dw 0    ; pad to align 4

                            dd MFT_STRING,MFS_ENABLED,IDM_ABOUT
                            dw MFR_END                      ; bottom of column
                            dw '&','A','b','o','u','t','.','.','.',0,0

### <span id="dispatchmenu"></span>Menu dispatch

When a menu item is selected and "activated", Windows sends a WM_COMMAND message to the window containing the menu. The menu item ID functions as the command ID passed to the window procedure in the lower sixteen bits of wParam.

            .code
            extrn   DefWindowProc:near,PostQuitMessage:near

    WndProc:
            mov     eax,[esp+4+4]   ; message ID
            cmp     eax,WM_COMMAND  ; from menu, accelerator, or control
            je      on_command
            cmp     eax,WM_DESTROY  ; window will be destroyed
            je      on_destroy
            jmp     DefWindowProc   ; delegate other message processing

    on_destroy:
            push    large 0
            call    PostQuitMessage

            xor     eax,eax
            ret     16

    on_command:
            mov     eax,[esp+4+8]   ; wParam
            and     eax,large 0FFFFh        ; command ID
            cmp     eax,IDM_EXIT
            je      on_exit_command
            cmp     eax,IDM_HELP
            je      on_help_command
            cmp     eax,IDM_ABOUT
            je      on_about_command
            xor     eax,eax         ; ignore other commands
            ret     16

### <span id="menuaction"></span>Menu actions

For terminating the program, we send a WM_CLOSE message to the "main" window. This will cause a call to DestroyWindow, by default, and send a WM_DESTROY message to our window procedure.

We use MessageBox to display messages when the non-exit menu items are selected.

            .data
    helpCaption equ wnd_title
    helpText db 'Help not implemented.',0

    aboutCaption db 'About Win32 Assembly',0
    aboutText db 'Place your copyright here.',0

            .code
            extrn   SendMessage:near
            extrn   MessageBox:near

    on_exit_command:
            ; trigger the main window close function
            mov     eax,[esp+4+0]   ; get hWnd before stack changes
            push    large 0         ; lParam
            push    large 0         ; wParam
            push    large WM_CLOSE  ; msgid
            push    eax             ; hwnd
            call    SendMessage

            xor     eax,eax
            ret     16

    on_help_command:
            mov     eax,[esp+4+0]   ; get hWnd before stack changes
            push    large MB_OK
            push    offset helpCaption
            push    offset helpText
            push    eax                     ; owner window
            call    MessageBox

            xor     eax,eax
            ret     16

    on_about_command:
            mov     eax,[esp+4+0]   ; get hWnd before stack changes
            push    large MB_OK
            push    offset aboutCaption
            push    offset aboutText
            push    eax                     ; owner window
            call    MessageBox

            xor     eax,eax
            ret     16

            end     _start

------------------------------------------------------------------------
