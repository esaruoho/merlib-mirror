---
title: "Refreshing with WM_PAINT"
source_domain: amasci.com
source_path: ~htak/win32asm/wingdi02.htm
order: 3474
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T05:56:48Z
extractor: site_to_paper.py (pandoc)
---

# Refreshing with WM_PAINT

*Source page: `~htak/win32asm/wingdi02.htm`*

# Refreshing with WM_PAINT

One of the weaknesses of **windraw1** is that a drawn image can become broken. If you cover a part of the circle with another window and then move that window away, you are left with a partial circle. Windows expects you to redraw that portion, and it signals you by posting a WM_PAINT message.

- [WM_PAINT, BeginPaint, and EndPaint](#paint)
- [An example program](#example)

\[ [Back to Win32 ASM Page](win32asm.htm) \]

### <span id="paint"></span>WM_PAINT, BeginPaint, and EndPaint

The WM_PAINT message is sent when the client area of a window requires repainting. One such case is when portions of the client area are "uncovered" by closing, moving, or resizing an overlapping window. Because the display DC does not hold the image that is supposed to be there, the uncovered portion must be redrawn by the application.\
When handling WM_PAINT, always call both BeginPaint and EndPaint, even if you don't do any graphics. These functions handle the special needs of the WM_PAINT message. If you don't handle this message, DefWindowProc will call these functions for you.\
BeginPaint returns a DC handle, and EndPaint releases it. So it's not necessary to call GetDC and ReleaseDC.

## <span id="example"></span>An example program

The example program, **windraw2.asm**, draws a circle in the client area of the "main" window, and maintains it. Most of the code is the same as **windraw1.asm**, so we show only what is different.

- [Message dispatch](#example1)
- [Painting](#example2)

### <span id="example1"></span>Message dispatch

We respond to WM_PAINT, instead of WM_LBUTTONDOWN.

    ; The window procedure...where messages for one class of windows
    ;   are processed.
    ;
    ; Parameters are hWnd, message, wParam, lParam.
    ;   hWnd is the window receiving this message.
    ;   message is the message ID.
    ;   wParam and lParam depend on the message ID.
    ;
    ; Must preserve EBX, ESI, and EDI.
    ;
            extrn   DefWindowProc:near,PostQuitMessage:near

            .code
    WndProc:
            mov     eax,[esp+4+4]   ; message ID
            cmp     eax,WM_DESTROY  ; about to start window destruction
            je      on_destroy
            cmp     eax,WM_PAINT    ; paint command
            je      on_paint
            jmp     DefWindowProc   ; delegate other message processing

### <span id="example2"></span>Painting

The old mouse button handler now becomes the new WM_PAINT handler. Because of the message, we must use BeginPaint and EndPaint. We define a PAINTSTRUCT that's needed by these two functions.\
Now, when the window is uncovered, it will be restored. It will also restore after a resizing of the window.

    ; Process WM_PAINT.  Some window area needs repainting.
    ;
    ; wParam is ???.
    ; lParam is ???.
    ;
    ; Return zero if processed.
    ;
    ; Must preserve EBX, ESI, and EDI.
    ;
            .data
            align   4
    wndDC   dd 0            ; DC handle (hDC) of window client area

    ps      PAINTSTRUCT     <>      ; this would normally be on the stack

            .code

            extrn BeginPaint:near,EndPaint:near
            extrn Ellipse:near

    on_paint:
            mov     eax,[esp+4+0]           ; hWnd
            push    offset ps               ; lpPaint
            push    eax
            call    BeginPaint
            mov     [wndDC],eax             ; hDC for window

            push    large 150               ; y, lower right
            push    large 150               ; x
            push    large 50                ; y, upper left
            push    large 50                ; x
            push    [wndDC]                 ; hDC
            call    Ellipse

            mov     eax,[esp+4+0]           ; hWnd
            push    offset ps               ; lpPaint
            push    eax
            call    EndPaint

            xor     eax,eax
            ret     16

------------------------------------------------------------------------
