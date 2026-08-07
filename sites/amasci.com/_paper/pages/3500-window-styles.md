---
title: "Window Styles"
source_domain: amasci.com
source_path: ~htak/win32asm/winwnd.htm
order: 3500
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T17:10:08Z
extractor: site_to_paper.py (pandoc)
---

# Window Styles

*Source page: `~htak/win32asm/winwnd.htm`*

# Window Styles

\[ [Back to Win32 ASM Page.](win32asm.htm) \]

Class styles\
CS_VREDRAW: client area redrawn when vertical size changes\
CS_HREDRAW: client area redrawn when horizontal size changes\
CS_KEYCVTWINDOW: undocumented ???\
CS_NOKEYCVT: undocumented ???\
CS_DBLCLKS: enable double clicks detection\
CS_CLASSDC: persistent DC created, shared by all windows\
CS_OWNDC: persistent DC created for each window\
CS_PARENTDC: window borrows (inherits) parent's DC\
CS_NOCLOSE: Close option deleted from system menu, close button disabled\
CS_SAVEBITS: save covered portion of screen for repaint after window removal\
CS_BYTEALIGNWINDOW\
CS_BYTEALIGNCLIENT\
CS_GLOBALCLASS

Window styles\
WS_OVERLAPPED\
WS_POPUP\
WS_CHILD

WS_DISABLED: no keyboard input or mouse click detected, overrides all enables

WS_VISIBLE: make visible using given coordinates and size\
WS_MINIMIZE: make visible in minimized form\
WS_MAXIMIZE: make visible in maximized form

WS_CLIPSIBLING: don't redraw area covered by sibling\
WS_CLIPCHILDREN: don't redraw area covered by children

WS_VSCROLL: show and enable vertical scroll bar\
WS_HSCROLL: show and enable horizontal scroll bar\
WS_THICKFRAME: show and enable thick sizing border

WS_BORDER: show thin border\
WS_DLGFRAME: show dialog box border\
WS_CAPTION: show and enable caption (title bar) and thin border\
WS_SYSMENU: show and enable system menu icon\
WS_MINIMIZEBOX: show and enable minimize button\
WS_MAXIMIZEBOX: show and enable maximize button

If there's no caption

WS_TABSTOP: mark as tab stop\
WS_GROUP: mark as group box

Extended styles

WS_EX_WINDOWEDGE: 3-d window border\
WS_EX_CLIENTEDGE: 3-d client border\
WS_EX_STATICEDGE: 3-d (child?) border

WS_EX_DLGMODALFRAME: double border, can be used with WS_CAPTION\
WS_EX_TRANSPARENT: make transparent (see-through) window\
WS_EX_CONTEXTHELP: show and enable context help button

WS_EX_LEFTSCROLLBAR: put vertical scrollbar on left instead of usual right\
WS_EX_RIGHT: right alignment (ragged left) instead of usual left alignment, works only with WS_EX_RTLREADING languages\
WS_EX_RTLREADING: right to left reading instead of usual left to right

WS_EX_TOPMOST: marks as topmost window, this style creates two sets of windows, topmost and nontopmost

WS_EX_MDICHILD: make an MDI child window style\
WS_EX_TOOLWINDOW: make a tool window style\
WS_EX_APPWINDOW: make minimized window show up on taskbar\
WS_EX_CONTROLPARENT: enable tab stops of children\
WS_EX_NOPARENTNOTIFY: child window doesn't send WM_PARENTNOTIFY on creation and destruction\
WS_EX_ACCEPTFILES: drag-and-drop target for files\

------------------------------------------------------------------------
