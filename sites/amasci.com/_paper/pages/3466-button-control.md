---
title: "BUTTON Control"
source_domain: amasci.com
source_path: ~htak/win32asm/winbtn.htm
order: 3466
reachable_from_entry: false
images: 0
internal_links: 2
extracted: 2026-08-07T05:56:48Z
extractor: site_to_paper.py (pandoc)
---

# BUTTON Control

*Source page: `~htak/win32asm/winbtn.htm`*

# BUTTON Control

Button controls are used as triggers or toggles. Toggles may be 2-way or 3-way.

\[See [Introduction to Controls](winctl.htm)\]

### Button types and styles

Button types:

BS_PUSHBUTTON\
BS_DEFPUSHBUTTON

BS_CHECKBOX\
BS_AUTOCHECKBOX\
BS_3STATE\
BS_AUTO3STATE\
\[ See [check box example (caption options)](winbtn2.htm). \]

BS_RADIOBUTTON\
BS_AUTORADIOBUTTON

BS_GROUPBOX

BS_USERBUTTON\
BS_OWNERDRAW

Button styles:

BS_TEXT\
BS_LEFTTEXT, BS_RIGHTBUTTON

BS_ICON\
BS_BITMAP

BS_LEFT\
BS_CENTER\
BS_RIGHT\
BS_TOP\
BS_VCENTER\
BS_BOTTOM

BS_PUSHLIKE\
BS_MULTILINE\
BS_FLAT

BS_NOTIFY

### Button messages

There are some APIs for buttons and there are some general APIs like SetFocus, EnableWindow, and SetWindowText.

Button messages:

BM_GETCHECK\
BM_SETCHECK ; wParam = new check state\
BM_GETSTATE\
BM_SETSTATE ; wParam = new push state\
BM_SETSTYLE ; wParam = new style, lParam = redraw\
BM_CLICK ; simulate click\
BM_GETIMAGE\
BM_SETIMAGE ; lParam = new image handle

Button states:

BST_UNCHECKED\
BST_CHECKED\
BST_INDETERMINATE

; Button state masks for BM_GETSTATE

; get check state = 3h\
BST_PUSHED ; get push/highlight state\
BST_FOCUS ; get focus state

### Button notifications

Buttons notify their parents by sending a WM_COMMAND message to them with a notification code.

Button notification codes:

BN_CLICKED\
BN_PAINT\
BN_HILITE, BN_PUSHED\
BN_UNHILITE, BN_UNPUSHED\
BN_DISABLE\
BN_DOUBLECLICKED, BN_DBLCLK\
BN_SETFOCUS\
BN_KILLFOCUS

### Some specialized API button functions

These functions were created for use in dialogs. However, they will work for any window that has button controls. When working with dialog boxes, the Wnd argument is the dialog box.

DWORD IsDlgButtonChecked(HWND Wnd, int ButtonID)\
Same as sending BM_GETSTATE. Effectively used when a button needs to be queried by a handler for another control.

void CheckDlgButton(HWND Wnd, int ButtonID, DWORD NewState)\
Same as sending BM_SETSTATE. Effectively used when a button needs to be changed by another control handler.

void CheckRadioButton(HWND Wnd, int FirstBtnID, int LastBtnID, int SelectBtnID)\
This is a very useful function. Makes several buttons work together as a "select one" control. The buttons affected have control IDs in the range from FirstBtnID to LastBtnID. The button with the SelectBtnID is the one that gets "checked", and the others become "unchecked".

------------------------------------------------------------------------
