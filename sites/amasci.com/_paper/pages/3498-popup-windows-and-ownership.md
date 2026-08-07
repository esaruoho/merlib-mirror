---
title: "Popup Windows and Ownership"
source_domain: amasci.com
source_path: ~htak/win32asm/winowner.htm
order: 3498
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T17:10:08Z
extractor: site_to_paper.py (pandoc)
---

# Popup Windows and Ownership

*Source page: `~htak/win32asm/winowner.htm`*

# Popup Windows and Ownership

The first window we created was an ***overlapped window***. A second type of window is the ***popup window***, or popup, for short. There doesn't appear to be any real difference between overlapped windows and popups, except for initialization. The **overlapped** window is always created with a border and a caption (title bar), but a **popup** window can be created without either. You can let Windows figure out where and how big to make your **overlapped** window by using CW_USEDEFAULT as the x, y, cx, and cy arguments of CreateWindowEx, but a **popup** window requires explicit location and size arguments.\
To make one window always appear in front of another window, we can make the "background" window the ***owner*** of the other. When the owner is minimized, the owned window will disappear. Restoring the minimized window will cause the owned window to reappear. ***Only overlapped and popup windows can be owners or be owned.*** The popup is often a dialog or a message window, so it's sensible to make a main window the owner of popups.\
The program **winowner.asm** shows key features of the owner/owned relationship. The program creates four popup windows, three of which are owned directly by the main window. The fourth window is indirectly owned by the main window.\
None of the **owned** windows will appear on the taskbar.\
Because Popup1, Popup2, and Popup3 are owned at the same level, any one of them can appear "between" the other two. Because Popup1 owns Popup4, the other popups (Popup2 and Popup3) cannot be placed between them. And none of the popups can appear "behind" the "top owner", the main window.\
If any of the windows are partially covered, clicking on any of the program windows will bring them all to the front. Minimize an owner window (main window or Popup1), and the popups it owns will disappear. After minimizing an owner, restoring or maximizing it will cause its owned popups to reappear and be restored.

- [The window classes](#classes)
- [Creating the main window](#createmain)
- [The message loop and program termination](#msgloop)
- [Main window procedure](#wndproc)
- [Creating the popup windows](#createpopup)

\[ [Back to Win32 ASM Page](win32asm.htm) \]\

### <span id="classes"></span>The window classes

We register two window classes, one for the main parent window, and one for the popup windows. To prevent the owned popup windows from totally disappearing (we don't yet have a way of recreating them), we add CS_NOCLOSE to the popup class style. Otherwise, we aren't doing anything special with the popup windows, so we make their window procedures the default, DefWindowProc.

            .386
            .model  flat

            ; If using TLINK32, don't include vclib.inc
            include vclib.inc    ; Microsoft VC++ .lib link names

            include win32hst.inc ; constants, structures, and entry names

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

            align 4
    popup_class     dd      size WNDCLASSEX           ; cbSize
                    dd      CS_VREDRAW or CS_HREDRAW or CS_NOCLOSE ; style
                    dd      DefWindowProc             ; lpfnWndProc
                    dd      0,0                       ; cbClsExtra, cbWndExtra
                    dd      0                         ; hInstance
                    dd      0                         ; hIcon
                    dd      0                         ; hCursor
                    dd      COLOR_WINDOW+1            ; hbrBackground
                    dd      0                         ; lpszMenuName
                    dd      popup_class_name          ; lpszClassName
                    dd      0                         ; hIconSm

    popup_class_name db 'popupclass',0

            .code

            public _start
            extrn   GetModuleHandle:near
            extrn   LoadIcon:near,LoadCursor:near
            extrn   RegisterClassEx:near

    _start:
            push    large 0         ; NULL string pointer means
            call    GetModuleHandle ; get HINSTANCE/HMODULE of EXE file
            mov     [wcx.wcx_hInstance],eax
            mov     [popup_class.wcx_hInstance],eax

            push    large IDI_WINLOGO
            push    large 0         ; hInstance, 0 = stock icon
            call    LoadIcon
            mov     [wcx.wcx_hIcon],eax
            mov     [popup_class.wcx_hIcon],eax

            push    large IDC_ARROW
            push    large 0         ; hInstance, 0 = stock cursor
            call    LoadCursor
            mov     [wcx.wcx_hCursor],eax
            mov     [popup_class.wcx_hCursor],eax

            push    offset wcx
            call    RegisterClassEx

            push    offset popup_class
            call    RegisterClassEx

### <span id="createmain"></span>Creating the main window

Here we create a main window. After it is created, we save its handle and call a subroutine to create the popup windows.

            .data
            align   4

    hMainWnd dd   0                  ; handle of main window

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

    wnd_title db 'Owner of popup windows',0

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
            call    CreateWindowEx
            mov     [hMainWnd],eax

            call    create_popups     ; call our special procedure

### <span id="msgloop"></span>The message loop and program termination

Here is the minimal message loop and program termination code.

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

### <span id="wndproc"></span>Main window procedure

Here is the minimal window procedure used by the main window.

            .code

            extrn   DefWindowProc:near,PostQuitMessage:near

    WndProc:
            mov     eax,[esp+4+4]           ; message ID
            cmp     eax,WM_DESTROY          ; about to start window destruction
            je      on_destroy
            jmp     DefWindowProc           ; delegate other message processing

    on_destroy:
            push    large 0
            call    PostQuitMessage

            xor     eax,eax
            ret     16

### <span id="createpopup"></span>Creating the popup windows

Popups are created by calling CreateWindowEx with WS_POPUP included in the *style* argument.\
The *hwndParent* argument is used in this case as the owner argument. When the window type (set in the *style* argument) is set to WS_OVERLAPPED or WS_POPUP, this argument is treated as an owner.\
Notice that WS_POPUP replaces WS_OVERLAPPED. Also we have added WS_CAPTION because popups do not automatically have a caption (title bar).\
The following code creates the large CreateWindowEx argument list by building it in a directly addressable area, and then copying it onto the stack.

            .data
            align   4
    cwp_args      dd   0                  ; dwExStyle
                  dd   popup_class_name   ; lpszClass
    popup_caption dd   0                  ; lpszName
                  dd   WS_VISIBLE or WS_POPUP or WS_SYSMENU or WS_THICKFRAME \
                       or WS_MINIMIZEBOX or WS_MAXIMIZEBOX or WS_CAPTION  ; style
    popup_x       dd   0                  ; x
    popup_y       dd   0                  ; y
                  dd   200                ; cx (width)
                  dd   145                ; cy (height)
    hOwner        dd   0                  ; hwndParent
                  dd   0                  ; hMenu (control ID)
    hInstance     dd   0                  ; hInstance
                  dd   0                  ; lpCreateParams

    popup_title1 db   'Popup1',0
    popup_title2 db   'Popup2',0
    popup_title3 db   'Popup3',0
    popup_title4 db   'Popup4',0

            .code

    create_popups:
            mov     eax,[wcx.wcx_hInstance]
            mov     [hInstance],eax   ; set hInstance argument

            mov     eax,[hMainWnd]
            mov     [hOwner],eax      ; set owner to main window
            mov     [popup_x],150
            mov     [popup_y],150
            mov     [popup_caption],offset popup_title1
            call    create_one_popup

            mov     [hOwner],eax      ; set owner to previous window
            mov     [popup_x],200
            mov     [popup_y],200
            mov     [popup_caption],offset popup_title2
            call    create_one_popup

            mov     eax,[hMainWnd]
            mov     [hOwner],eax      ; set owner to main window
            mov     [popup_x],450
            mov     [popup_y],150
            mov     [popup_caption],offset popup_title3
            call    create_one_popup

            mov     eax,[hMainWnd]
            mov     [hOwner],eax      ; set owner to main window
            mov     [popup_x],750
            mov     [popup_y],150
            mov     [popup_caption],offset popup_title4
            call    create_one_popup

            ret

    create_one_popup:
            sub     esp,48            ; allocate argument list
            mov     esi,offset cwp_args ; set block move source
            mov     edi,esp           ; set block move destination
            mov     ecx,12            ; number of arguments
            rep movsd
            call    CreateWindowEx
            ret

            end     _start

------------------------------------------------------------------------
