---
title: "More on Messages and Threads"
source_domain: amasci.com
source_path: ~htak/win32asm/winmsg.htm
order: 3496
reachable_from_entry: false
images: 0
internal_links: 3
extracted: 2026-08-07T17:10:08Z
extractor: site_to_paper.py (pandoc)
---

# More on Messages and Threads

*Source page: `~htak/win32asm/winmsg.htm`*

# More on Messages and Threads

- [Threads and windows](#windowthread)
- [Preempting or nonpreempting?](#preemptornot)
- [Threads and message queues](#msgqueue)
- [Thread blocking and SendMessage](#blocking)
- [Same-thread sends](#samethread)
- [Forms of message transmission](#calltypes)

[Back to Introduction to Messages](window03.htm)\
[Back to Win32 ASM Page](win32asm.htm)

### <span id="windowthread"></span>Threads and windows

Whenever a window is created, it is "bound" to the current thread. That thread is the only thread that can execute the window procedure for that particular window. Consequently, it is the only thread that can process messages for that window. In a sense, the thread "owns" the window.\
However, another window (of the same class) can be created in another thread, allowing the two windows to process messages concurrently. Because more than one thread can be executing a given window procedure, the following discussions talk about functions being "called by the thread" instead.

### <span id="preemptornot"></span>Preempting or nonpreempting?

While the thread system is preemptive, the message system is not. A thread is preempted solely to let other threads run. A thread is never preempted to change its point of execution. Thus a thread, in general, won't respond immediately to new messages. \[But see [same-thread sends](#samethread).\]\
That's because message systems have three basic components: senders, queues, and receivers. A sender routine will put a message in some designated queue, and a receiver routine must pull it out before a message handler can process it. If a receiver routine isn't called by a thread, the thread cannot handle any messages sitting in the queue. Windows provides two functions for receiving messages: GetMessage and PeekMessage.

### <span id="msgqueue"></span>Threads and message queues

"Posted" messages are delivered to threads. That means each thread that expects messages will have its own message queue. Because each window is associated with exactly one thread, PostMessage can determine which thread to post to (without needing a thread argument).\
"Sent" messages are, on the surface, delivered to windows. Because threads do the work of handling received messages, "sent" messages must actually be delivered to threads. Except for same-thread messages \[see [Same-thread sends](#samethread)\], such messages must be placed in a thread message queue -- one that is associated with the destination window. Whether or not this queue is the same as the "PostMessage" queue is unimportant. It's only important for the system to know if a message is from a "SendMessage" function or a "PostMessage" function.

### <span id="blocking"></span>Thread blocking and SendMessage

When sending a message to a window, the sending function may need to wait for a ***reply***. While it is waiting, the thread which called the function is said to be ***blocked***. This situation prevents the thread from handling any messages for other windows it "owns". Thus window contents don't get updated, and when a window is uncovered, it doesn't get redrawn.\
When SendMessage sends a message to a window in another thread, it waits for a reply which is issued when the receiving thread calls ReplyMessage. An explicit reply is usually not necessary because when a window procedure exits, ReplyMessage is automatically called. An explicit ReplyMessage will be necessary to avoid ***deadlock*** if there is chain of unfinished SendMessage calls that involves more than one thread in a circular fashion. \[See [Deadlock Theory](hardcore.htm#deadlock).\]\
For example:

The SendMessage chain

(window A, thread 1) --\> (B, thread 2) --\> ... --\> (C, thread n) --\> (D, \[back to\] thread 1)

will deadlock when C (in thread n) sends a message to D, if none of the window procedures have called ReplyMessage. If any of the invoked window procedures (other than D) call ReplyMessage before calling SendMessage, the chain is broken.

### <span id="samethread"></span>Same-thread sends

SendMessage, a thread blocking function, is used quite often to send a message to a window in the **same** thread. Under normal rules, this function would put the message on a queue and then force the thread to wait for itself to reply. Since it's waiting, it can't reply--**deadlock**. In this special case, a "same-thread" send, Windows will directly call the proper window procedure as if it were a subroutine. In effect, this is thread **preemption** for the purpose of responding to new messages.\
Because it doesn't require the message to be pulled out of a queue, this behavior allows messages to be processed without a message loop. For example, CreateWindowEx can invoke your special WM_CREATE code, and draw the window frame before your app enters its message loop. Also, any window (created in the same thread) can be updated immediately by sending it the appropriate message.\
But be aware that this immediate response occurs **only** when a message is sent (with SendMessage) to a window in the **same** thread.

### <span id="calltypes"></span>Forms of message transmission

SendMessage is a thread blocking function. It always waits for a reply.\
SendMessageTimeout blocks like SendMessage, but it unblocks if the receiver takes too long to reply. You specify the timeout interval.\
SendNotifyMessage is a nonblocking function. It doesn't wait for a reply, unless the destination window is in the same thread.\
SendMessageCallback is another nonblocking function. It also doesn't wait for a reply, unless the destination window is in the same thread. You specify a callback routine which will be executed when the receiving thread replies.\
PostMessage is completely nonblocking. It never waits for a reply. You must target a window. The window determines which thread will receive the message.\
PostThreadMessage is nonblocking and can't target a window. You must target a thread.\
PostQuitMessage is nonblocking and posts a WM_QUIT message to the current thread.\
\

------------------------------------------------------------------------
