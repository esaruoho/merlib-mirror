---
title: "Child Windows"
source_domain: amasci.com
source_path: ~htak/win32asm/winchild.htm
order: 3468
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T05:56:48Z
extractor: site_to_paper.py (pandoc)
---

# Child Windows

*Source page: `~htak/win32asm/winchild.htm`*

# Child Windows

We now look at the third and last type of window, the ***child window***. When you create a child window, you tell Windows which window will be its ***parent window***. Windows proceeds by displaying the child window "embedded" in its parent window. Whenever the parent window is minimized or made invisible, the child window becomes invisible. When the parent window is then restored or maximized, the child window reappears. A child window can also be the parent of another child window.\
The program **winchild.asm** shows key features of the parent/child relationship. The program creates four child windows, three of which are direct children of the main window. The fourth window is the child of a child window.\
Because Child1, Child2, and Child3 are at the same level, any one of them can appear "between" the other two. Because Child1 is the parent of Child4, the other children (Child2 and Child3) cannot be placed between them.\
Minimize a parent window (main window or Child1), and its children will disappear. After minimizing a parent, restoring or maximizing it will cause its children to reappear and be restored.\
As you can see, this program is very similar to the **winowner.asm** program. When you run this program and play with the child windows, you will see other behaviors that are slightly different from the other two window types.

- [The window classes](#classes)
- [Creating the main window](#createmain)
- [The message loop and program termination](#msgloop)
- [Main window procedure](#wndproc)
- [Creating the child windows](#createchildren)

\[ [Back to Win32 ASM Page](win32asm.htm) \]\

### <span id="classes"></span>The window classes

We register two window classes, one for the main parent window, and one for the child windows. To prevent the child windows from totally disappearing (we don't yet have a way of recreating them), we add CS_NOCLOSE to the child class style. Otherwise, we aren't doing anything special with the child windows, so we make their window procedures the default, DefWindowProc.\
The main window height and width is set to display all child windows.

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
    child_class     dd      size WNDCLASSEX           ; cbSize
                    dd      CS_VREDRAW or CS_HREDRAW or CS_NOCLOSE ; style
                    dd      DefWindowProc             ; lpfnWndProc
                    dd      0,0                       ; cbClsExtra, cbWndExtra
                    dd      0                         ; hInstance
                    dd      0                         ; hIcon
                    dd      0                         ; hCursor
                    dd      COLOR_WINDOW+1            ; hbrBackground
                    dd      0                         ; lpszMenuName
                    dd      child_class_name          ; lpszClassName
                    dd      0                         ; hIconSm

    child_class_name db 'childclass',0

            .code

            public _start
            extrn   GetModuleHandle:near
            extrn   LoadIcon:near,LoadCursor:near
            extrn   RegisterClassEx:near

    _start:
            push    large 0         ; NULL string pointer means
            call    GetModuleHandle ; get HINSTANCE/HMODULE of EXE file
            mov     [wcx.wcx_hInstance],eax
            mov     [child_class.wcx_hInstance],eax

            push    large IDI_WINLOGO
            push    large 0         ; hInstance, 0 = stock icon
            call    LoadIcon
            mov     [wcx.wcx_hIcon],eax
            mov     [child_class.wcx_hIcon],eax

            push    large IDC_ARROW
            push    large 0         ; hInstance, 0 = stock cursor
            call    LoadCursor
            mov     [wcx.wcx_hCursor],eax
            mov     [child_class.wcx_hCursor],eax

            push    offset wcx
            call    RegisterClassEx

            push    offset child_class
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
             dd   765                ; cx (width)
             dd   240                ; cy (height)
             dd   0                  ; hwndParent
             dd   0                  ; hMenu
             dd   0                  ; hInstance
             dd   0                  ; lpCreateParams

    msgbuf MSG      <>

    wnd_title db 'Parent of child windows',0

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
            call    create_children   ; call our special procedure

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

### <span id="createchildren"></span>Creating the child windows

Child windows are created by calling CreateWindowEx with WS_CHILD included in the *style* argument.\
When CreateWindowEx is used to create a child window, the x-y coordinates you supply are ***client coordinates***, where (0,0) is the upper left corner of the framed area, the ***client area***. Overlapped and popup windows are created with ***screen coordinates***, where (0,0) is the upper left corner of the desktop.\
The *hwndParent* argument is obviously the parent window. When the window type (set in the *style* argument) is set to WS_CHILD, this argument is treated as a parent.\
Notice that WS_CHILD replaces WS_POPUP. We have included WS_CAPTION because child windows do not automatically have a caption (title bar).\
The WS_CLIPSIBLINGS is required if movable child windows are to act rationally when they are overlapped. Remove this style option and see how crazy the child windows can behave when they overlap!\
The following code creates the large CreateWindowEx argument list by building it in a directly addressable area, and then copying it onto the stack.

            .data
            align   4
    cwp_args      dd   0                  ; dwExStyle
                  dd   child_class_name   ; lpszClass
    child_caption dd   0                  ; lpszName
                  dd   WS_VISIBLE or WS_CHILD or WS_SYSMENU or WS_THICKFRAME \
                       or WS_MINIMIZEBOX or WS_MAXIMIZEBOX or WS_CAPTION \
                       or WS_CLIPSIBLINGS ; style
    child_x       dd   0                  ; x
    child_y       dd   0                  ; y
    child_width   dd   0                  ; cx (width)
    child_height  dd   0                  ; cy (height)
    hParent       dd   0                  ; hwndParent
                  dd   0                  ; hMenu (control ID)
    hInstance     dd   0                  ; hInstance
                  dd   0                  ; lpCreateParams

    child_title1 db   'Child1',0
    child_title2 db   'Child2',0
    child_title3 db   'Child3',0
    child_title4 db   'Child4',0

            .code

    create_children:
            mov     eax,[wcx.wcx_hInstance]
            mov     [hInstance],eax    ; set hInstance argument

            mov     eax,[hMainWnd]
            mov     [hParent],eax      ; set parent to main window
            mov     [child_x],10
            mov     [child_y],10
            mov     [child_width],240
            mov     [child_height],180
            mov     [child_caption],offset child_title1
            call    create_one_child

            mov     [hParent],eax      ; set parent to previous window
            mov     [child_x],10
            mov     [child_y],10
            mov     [child_width],200
            mov     [child_height],120
            mov     [child_caption],offset child_title2
            call    create_one_child

            mov     eax,[hMainWnd]
            mov     [hParent],eax      ; set parent to main window
            mov     [child_x],260
            mov     [child_y],10
            mov     [child_width],240
            mov     [child_height],180
            mov     [child_caption],offset child_title3
            call    create_one_child

            mov     eax,[hMainWnd]
            mov     [hParent],eax      ; set parent to main window
            mov     [child_x],510
            mov     [child_y],10
            mov     [child_width],240
            mov     [child_height],180
            mov     [child_caption],offset child_title4
            call    create_one_child

            ret

    create_one_child:
            sub     esp,48            ; allocate argument list
            mov     esi,offset cwp_args ; set block move source
            mov     edi,esp           ; set block move destination
            mov     ecx,12            ; number of arguments
            rep movsd
            call    CreateWindowEx
            ret

            end     _start

------------------------------------------------------------------------
