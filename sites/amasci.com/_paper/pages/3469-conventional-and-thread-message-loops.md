---
title: "Conventional and Thread Message Loops"
source_domain: amasci.com
source_path: ~htak/win32asm/wincmsg.htm
order: 3469
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T05:56:48Z
extractor: site_to_paper.py (pandoc)
---

# Conventional and Thread Message Loops

*Source page: `~htak/win32asm/wincmsg.htm`*

# Conventional and Thread Message Loops

## Conventional message loop

The first message loop we showed is a conventional message loop. It can be parameterized to look like the following:

        .data
    msgbuf MSG  <>

        .code
        call    setup         ; *** user defined setup ***
    msg_loop:
        push    large 0       ; uMsgFilterMax
        push    large 0       ; uMsgFilterMin
        push    large 0       ; hWnd (filter), 0 = all windows
        push    offset msgbuf ; lpMsg
        call    GetMessage    ; returns FALSE if WM_QUIT
        or      eax,eax
        jz      end_msg_loop

        call    dispatch_message  ; *** user defined dispatch ***
        jmp     msg_loop

    end_msg_loop:
        call    cleanup       ; *** user defined cleanup ***

If there are no messages waiting in the message queue, GetMessage returns control to Windows. This frees up the CPU, allowing it to be used by other programs. Alternatively, we can say that GetMessage gives up the program's ***time slice***, the maximum amount of time given to the program before preemption. All this allows the whole system to be more responsive than otherwise.

The dispatch message code for a basic GUI app is:

    dispatch_message:
        push    offset msgbuf
        call    TranslateMessage
        push    offset msgbuf
        call    DispatchMessage
        ret

The call to TranslateMessage checks for keyboard messages and, on some combinations of messages, adds WM_CHAR messages to the message queue. (What a surprise -- WM_CHAR is **not** a keyboard message!) We show the dispatch code as a subroutine, but this short sequence is usually inlined, which eliminates the call-ret overhead.

## Thread message loop

Each window runs its window proc in some thread. However, a thread can run without creating any windows. You can still pass messages to the thread with PostThreadMessage. To handle the received messages, use the conventional loop and just change the dispatch code to handle the messages directly.

    dispatch_message:
        mov     eax,msgbuf.msg_message
        cmp     eax,WM_APP+0
        je      on_app_message0
        cmp     eax,WM_APP+1
        je      on_app_message1
        ret

------------------------------------------------------------------------
