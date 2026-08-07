---
title: "A Little More on Messages and an Introduction to the Mouse"
source_domain: amasci.com
source_path: ~htak/win32asm/winmsg01.htm
order: 3497
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T17:10:08Z
extractor: site_to_paper.py (pandoc)
---

# A Little More on Messages and an Introduction to the Mouse

*Source page: `~htak/win32asm/winmsg01.htm`*

# A Little More on Messages and an Introduction to the Mouse

Messages are basic to Windows GUI programming. Almost everything a GUI program does is triggered by messages. Writing a program that repeatedly waits for messages, results in an ***event-driven*** style of programming, where each message represents an event.\
The messages WM_QUIT and WM_DESTROY were introduced so that an application can terminate gracefully. In this section, we introduce mouse messages that show how a program can respond to mouse events in a simple way. The mouse messages are associated with the framed area of a window, the ***client area***.\
For MS-DOS programmers, writing a window procedure is somewhat like writing an INT 21H interceptor, with the message number on the stack instead of in AH. And instead of jumping to the old DOS address for standard behavior, you call (or jump to) DefWindowProc.\
Windows produces a lot of messages, but the typical application will provide a custom response to only a small percentage of them. Most of the messages can be classified as notifications--"this happened" or "this is about to happen" messages. A few messages can be interpreted as commands.

- [Message systems](#msgsystem)
- [Messages](#send)
- [Allocation of message identifiers](#messageid)
- [The client area](#clientarea)
- [Mouse movement and buttons](#messages)
- [The example program](#example)

\[ [Back to Win32 ASM Page](win32asm.htm) \]

### <span id="msgsystem"></span>Message systems

Message systems can be viewed as a collection of senders (or ***producers***) and receivers (or ***consumers***) of messages. The messages are typically managed by holding them in queues. In this manner, messages are sent and received by storing and fetching them to and from the queue. This allows senders to signal the receivers at a convenient time, and it allows the receivers to respond at a convenient time.

Our basic GUI program handles the reception of messages in two parts: the first part inspects the message queue, and the second part actually decides how to respond to a given message. Our basic GUI program is written primarily as a receiver or consumer of messages. The senders or producers of these messages are either the Windows API functions or the Windows system itself.

### <span id="send"></span>Messages

A message is a packet of information that contains an identifying number. Numbers not reserved by Windows can be used for our own purposes. Some numbers have been given names by Windows, and we have used these names -- those starting with WM.\
Messages are delivered to a window by invoking the window's assigned window procedure. As described before, window procedures are assigned in two steps. First, by registering a window class containing the address of a window procedure; and, second, by creating a window using that class.\
Most, but not all, messages are delivered to windows. WM_QUIT is an example of a message that never goes to a window. That's why we **don't** handle it in a window procedure.\
The code that is written to respond to a message is often called the ***message handler*** for that message. Different windows can respond differently to the same message identifier. (The message "packet" itself is directed to only one window.)

### <span id="messageid"></span>Allocation of message identifiers

The message identifying numbers, or ***message identifiers***, are allocated as follows:

- 0 to 03FFh\
  Standard window messages. These are the WM\_ messages. Unused numbers are reserved by Windows. The standard controls also have message numbers in this range.
- 0400h (WM_USER) to 7FFFh\
  Class-specific messages. Each window class can define messages in this range for class-specific actions. Numbers are reused by the window classes provided by Windows, and we can reuse them for our own window classes.\
  The new common controls have numbers in this range. (For those familiar with the Win16 values, the standard controls no longer have message numbers in this range.)
- 8000h (WM_APP) to 0BFFFh\
  Application-specific messages. For messages not specific to any window class. Perhaps this set of messages should be called thread-specific messages.
- 0C000h to 0FFFFh\
  System-global messages. These numbers are reserved by the RegisterWindowMessage function. This function generates message numbers in this range.
- 10000h to 0FFFFFFFFh\
  Internal (proprietary) system messages. These numbers are reserved by Windows. Because they require more than 16 bits, these cannot be used to communicate with old 16-bit Windows programs that are running on a Win32 platform.

### <span id="clientarea"></span>The client area

The first mouse messages we will look at are usually delivered only when the cursor (which represents the mouse) is pointing to a spot in the client area.\
The client area is the display area framed by the window border. If they exist, the title, menu, and scroll bars are excluded from the client area.

### <span id="messages"></span>Mouse movement and buttons

A two-button mouse can produce the following fundamental messages whenever the cursor points to a location in the client area:

- WM_LBUTTONDOWN, when the left button is first pressed
- WM_LBUTTONUP, when the left button is first released
- WM_RBUTTONDOWN, when the right button is first pressed
- WM_RBUTTONUP, when the right button is first released
- WM_MOUSEMOVE, when the mouse is moved

## <span id="example"></span>The example program

Our example program, **winclick.asm**, reports on mouse activity within our window.

- [Prolog and class registration](#prolog)
- [Window creation and message loop](#create)
- [Message dispatch](#dispatch)
- [Mouse message handlers](#handlers)

### <span id="prolog"></span>Prolog and class registration

Here we create the basic window class.

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

### <span id="create"></span>Window creation and message loop

We create our window and set it up to display our startup title. The window width is made long enough to avoid clipping of the title text.

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

    wnd_title db 'Mouse activity',0

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

### <span id="dispatch"></span>Message dispatch

The following is one way to dispatch messages. It's not bad because there are so few messages. A bigger set of messages would be easier to handle with an address table.

       .code

            extrn   DefWindowProc:near,PostQuitMessage:near

    WndProc:
            mov     eax,[esp+4+4]           ; message ID
            cmp     eax,WM_DESTROY          ; about to start window destruction
            je      on_destroy
            cmp     eax,WM_LBUTTONDOWN      ; left mouse button pressed
            je      on_left_mouse_down
            cmp     eax,WM_LBUTTONUP        ; left mouse button released
            je      on_left_mouse_up
            cmp     eax,WM_RBUTTONDOWN      ; right mouse button pressed
            je      on_right_mouse_down
            cmp     eax,WM_RBUTTONUP        ; right mouse button released
            je      on_right_mouse_up
            cmp     eax,WM_MOUSEMOVE        ; mouse moved
            je      on_mouse_move
            jmp     DefWindowProc           ; delegate other message processing

    on_destroy:
            push    large 0
            call    PostQuitMessage

            xor     eax,eax
            ret     16

### <span id="handlers"></span>Mouse message handlers

This is where we respond to the mouse messages. The text in the title bar is changed by calling SetWindowText. The text displayed depends on the mouse activity when the cursor is pointing to within the client area. The code is left unoptimized so that it shows more clearly where the hwnd parameter is coming from. (The +4 skips the stacked EIP, and +0 is the offset of the first argument.)

           .data
            align   4
    text_ldown db 'Left mouse button down',0
    text_lup   db 'Left mouse button up',0
    text_rdown db 'Right mouse button down',0
    text_rup   db 'Right mouse button up',0
    text_mmove db 'Mouse moved',0

            .code

            extrn   SetWindowText:near

    on_left_mouse_down:
            mov     eax,[esp+4+0]   ; get hwnd before changing ESP
            push    offset text_ldown
            push    eax
            call    SetWindowText

            xor     eax,eax
            ret     16

    on_left_mouse_up:
            mov     eax,[esp+4+0]   ; get hwnd before changing ESP
            push    offset text_lup
            push    eax
            call    SetWindowText

            xor     eax,eax
            ret     16

    on_right_mouse_down:
            mov     eax,[esp+4+0]   ; get hwnd before changing ESP
            push    offset text_rdown
            push    eax
            call    SetWindowText

            xor     eax,eax

            ret     16

    on_right_mouse_up:
            mov     eax,[esp+4+0]   ; get hwnd before changing ESP
            push    offset text_rup
            push    eax
            call    SetWindowText

            xor     eax,eax
            ret     16

    on_mouse_move:
            mov     eax,[esp+4+0]   ; get hwnd before changing ESP
            push    offset text_mmove
            push    eax
            call    SetWindowText

            xor     eax,eax
            ret     16

            end     _start

------------------------------------------------------------------------
