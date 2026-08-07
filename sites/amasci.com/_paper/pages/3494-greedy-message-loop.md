---
title: "Greedy Message Loop"
source_domain: amasci.com
source_path: ~htak/win32asm/wingmsg.htm
order: 3494
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T17:10:08Z
extractor: site_to_paper.py (pandoc)
---

# Greedy Message Loop

*Source page: `~htak/win32asm/wingmsg.htm`*

# Greedy Message Loop

Some people (notably game programmers) want to do some background processing when there are no messages to process. For them, we show a "greedy" message loop. Instead of giving up the time slice, we use as much of it as we can by replacing GetMessage with PeekMessage.

        .data
    msgbuf MSG    <>

        .code
        call    setup
    msg_loop:
        push    large PM_REMOVE
        push    large 0       ; uMsgFilterMax
        push    large 0       ; uMsgFilterMin
        push    large 0       ; hWnd (filter), 0 = all windows
        push    offset msgbuf ; lpMsg
        call    PeekMessage   ; returns nonzero (true) if there's a message
        or      eax,eax
        jnz     got_msg

        call    do_background_process
        jmp     msg_loop

    got_msg:
        cmp     msgbuf.msg_message,WM_QUIT
        je      end_msg_loop

        call    dispatch_message
        jmp     msg_loop

    end_msg_loop:
        call    cleanup

The above code is extremely greedy. It will use up time if there is no background processing to do. It will also use up time when no windows are being displayed. Because of preemption, we do not prevent other programs from running. But because we are using our entire time slice, we are slowing them down.\
The less greedy version, below, uses a flag to signal an active, greedy state. The flag can be switched by a message handler.

    ACTIVE_FLAG equ 1

        .data
    flags  dd    ACTIVE_FLAG
    msgbuf MSG   <>

        .code
        call    setup
    msg_loop:
        test    flags,ACTIVE_FLAG ; are we active ?
        jz      get_next_msg  ; no, don't be greedy

        push    large PM_NOREMOVE ; ***** LEAVE MESSAGE IN QUEUE *****
        push    large 0       ; uMsgFilterMax
        push    large 0       ; uMsgFilterMin
        push    large 0       ; hWnd (filter), 0 = all windows
        push    offset msgbuf ; lpMsg
        call    PeekMessage   ; returns nonzero (true) if there's a message
        or      eax,eax
        jnz     get_next_msg

        call    do_background_process
        jmp     msg_loop

    get_next_msg:
        push    large 0       ; uMsgFilterMax
        push    large 0       ; uMsgFilterMin
        push    large 0       ; hWnd (filter), 0 = all windows
        push    offset msgbuf ; lpMsg
        call    GetMessage    ; returns FALSE if message is WM_QUIT
        or      eax,eax
        jz      end_msg_loop

        call    dispatch_message
        jmp     msg_loop

    end_msg_loop:
        call    cleanup

------------------------------------------------------------------------
