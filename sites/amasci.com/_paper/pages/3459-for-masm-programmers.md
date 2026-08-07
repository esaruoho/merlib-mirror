---
title: "For MASM programmers"
source_domain: amasci.com
source_path: ~htak/win32asm/asmdiff.htm
order: 3459
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T05:56:48Z
extractor: site_to_paper.py (pandoc)
---

# For MASM programmers

*Source page: `~htak/win32asm/asmdiff.htm`*

# For MASM programmers

# MASM and TASM differences

Example code has been tested with TASM 4.0 and VC++ 4.0.

Changes may be needed to permit assembly by MASM 6+.

1.  STRUC may need to be changed to STRUCT (add 'T' at end)
2.  EXTRN may need to be changed to EXTERN (add second 'E')
3.  EQU may need to be changed to TEXTEQU for text macros
4.  LARGE is needed by TASM 4, may need to eliminate for MASM

[Back to Win32 ASM Page.](win32asm.htm)

------------------------------------------------------------------------
