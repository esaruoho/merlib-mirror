#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Parse USPTO-style patent front-page text (e.g. from pdftotext -layout) and emit TSV rows.

Expected columns match fe-priorart.sh header.
"""

import csv
import os
import re
import sys


def normalize_us_number(raw):
    """Collapse spaces; treat lone '.' between digit groups as OCR comma glitch."""
    s = raw.strip()
    s = re.sub(r"\s+", "", s)
    # "5,272.871" -> "5,272,871"
    s = re.sub(r"(\d)\.(\d{3})\b", r"\1,\2", s)
    # trailing ". " before kind was "5,409,784."
    s = re.sub(r"\.+$", "", s)
    s = re.sub(r",\.", ",", s)
    s = re.sub(r"\.\,", ",", s)
    return s


def us_digit_count(raw):
    return len(re.sub(r"\D", "", normalize_us_number(raw)))


# Layout merge often appends unrelated column text on the same line.
RE_US_HEADER = re.compile(r"U\.S\.\s+PATENT\s+DOCUMENTS", re.I)
RE_FOREIGN_HEADER = re.compile(r"FOREIGN\s+PATENT\s+DOCUMENTS", re.I)
RE_OTHER_HEADER = re.compile(r"OTHER\s+PUBLICATIONS", re.I)
RE_CONTINUED = re.compile(r"\(\s*continued\s*\)", re.I)
RE_PRIMARY = re.compile(
    r"Primary\s+Examiner\s*[-–—:]\s*(.+)$",
    re.I,
)
RE_ATTORNEY = re.compile(
    r"(?:\(\s*74\s*\)\s*)?Attorney,\s*Agent,\s*(?:or\s+)?Firm\s*[-–—:\s]\s*(.+)$",
    re.I,
)

RE_STOP = re.compile(
    r"^\s*(?:\(57\)|Assistant\s+Examiner|ABSTRACT)\b|"
    r"^\s*\(\s*57\s*\)\s+.*ABSTRACT",
    re.I,
)

# US row: number block, optional kind (A, B1, ...), optional *, M/YYYY, rest = name
# Kind code is optional to handle pre-2000 USPTO format which omits it.
RE_US_ROW = re.compile(
    r"^\s*([\d,\.\s]{4,}?)\s+(?:([A-Z]\d{0,2})\s*\*?\s+)?(\d{1,2}/\d{4})\s*(.*)$",
    re.I,
)

# Foreign: country (2 letters), body, date; merged lines may trail other-column text.
RE_FOREIGN_ROW = re.compile(
    r"^\s*([A-Z]{2})\s+(.+?)\s+(\d{1,2}/\d{4})\b",
    re.I,
)

# Old-format foreign: number first, then date, then country NAME (not code).
# e.g. "3048540 7/1982 Germany .................... 123/DIG. 12"
RE_FOREIGN_ROW_OLD = re.compile(
    r"^\s*([\d,\.\s]{4,}?)\s+(\d{1,2}/\d{4})\s+([A-Za-z]+)",
    re.I,
)

# Map country names to 2-letter ISO codes for old-format foreign patents
COUNTRY_NAME_TO_CODE = {
    "germany": "DE", "france": "FR", "japan": "JP", "canada": "CA",
    "australia": "AU", "britain": "GB", "england": "GB",
    "united kingdom": "GB", "switzerland": "CH", "italy": "IT",
    "netherlands": "NL", "sweden": "SE", "norway": "NO", "finland": "FI",
    "austria": "AT", "belgium": "BE", "denmark": "DK", "spain": "ES",
    "russia": "RU", "ussr": "SU", "china": "CN", "korea": "KR",
    "india": "IN", "brazil": "BR", "mexico": "MX", "israel": "IL",
    "taiwan": "TW", "wipo": "WO", "european": "EP",
}

# Gaps wider than this are treated as column boundaries (see plan / layout notes).
MIN_LAYOUT_COLUMN_GAP = 15


def split_foreign_body(body):
    body = body.strip()
    if not body:
        return "", ""
    parts = body.rsplit(None, 1)
    if len(parts) == 1:
        return body, ""
    left, last = parts
    if re.match(r"^[A-Z]\d{0,2}$", last) and len(last) <= 3:
        return left.strip(), last
    # "WO 01/14698 A1" -> split last token A1
    parts2 = body.rsplit(None, 2)
    if len(parts2) == 3:
        a, b, c = parts2
        if re.match(r"^[A-Z]\d{0,2}$", c) and len(c) <= 3:
            return (a + " " + b).strip(), c
    return body, ""


def is_front_matter_noise(chunk):
    c = chunk.strip()
    if re.match(r"^\(\s*\d{1,2}\s*\)\s", c):
        return True
    if re.match(r"^\*+\s*Notice:", c, re.I):
        return True
    if re.match(r"^\*\s*cited\s+by\s+examiner\b", c, re.I):
        return True
    return False


def _chunk_is_us_cite_only(p):
    """True if this layout chunk is only a U.S. patent cite (strip from other-pub text)."""
    p = p.strip()
    if not p:
        return False
    m = RE_US_ROW.match(p)
    if m:
        nm = re.split(r"\s{3,}", (m.group(4) or "").strip())[0] or "x"
        if is_probable_us_row(m.group(1), (m.group(2) or "").upper(), m.group(3), nm):
            return True
    return bool(
        re.match(
            r"^[\d,\.\s]{5,}\s+[AB]\d{0,2}\s*\*?\s*\d{1,2}/\d{4}\s*$",
            p,
            re.I,
        )
    )


def clean_other_publication_text(s):
    """Drop the left-column US patent text that pdftotext merged into the same line."""
    if not s:
        return ""
    s = s.strip()
    s = RE_CONTINUED.sub("", s).strip()
    parts = [
        p.strip()
        for p in re.split(r"\s{%d,}" % MIN_LAYOUT_COLUMN_GAP, s)
        if p.strip()
    ]
    kept = [p for p in parts if not _chunk_is_us_cite_only(p)]
    if not kept:
        return s
    if len(kept) == 1:
        return kept[0].strip()
    return " ".join(x.strip() for x in kept).strip()


def _looks_like_new_other_citation(t):
    t = t.strip()
    if re.match(r"^US\s+\d", t):
        return True
    if re.match(r"^[A-Z][a-zA-Z'\-]{1,28}\s+et\s+al\.?,", t):
        return True
    if re.match(r"^[A-Z][a-zA-Z'\-]{1,28},\s*[\u201c\"“']", t):
        return True
    if re.match(r"^[A-Z][a-zA-Z'\-]{1,28},\s+[A-Z]", t):
        return True
    if len(t) > 90 and "," in t[:100]:
        if re.match(
            r"^[A-Z][a-zA-Z'\-]{1,26},\s*(?:[\u201c\"“']|[A-Z])",
            t,
        ):
            return True
    return False


def _prev_ends_complete_citation(prev):
    pe = (prev or "").rstrip()
    if len(pe) < 25:
        return False
    if re.search(r"\([12]\d{3}\)\s*\.?\s*$", pe):
        return True
    if re.search(r"no month[^.]*\.?\s*$", pe, re.I):
        return True
    if pe.endswith(").") or pe.endswith(')."') or pe.endswith(").’"):
        return True
    return False


def _should_merge_other_continuation(prev, nxt):
    """True if nxt is a wrapped continuation of the same non-patent citation."""
    nxt = (nxt or "").strip()
    if not nxt:
        return True
    if re.match(r"^\d{1,3}$", nxt):
        return False
    if _prev_ends_complete_citation(prev):
        if re.match(r"^and\s+[A-Z]", nxt):
            return False
        if _looks_like_new_other_citation(nxt):
            return False
        if re.match(r"^[A-Z]", nxt):
            if len(nxt) < 55 and re.match(
                r"^[A-Z][a-zA-Z'\-]+,\s+[A-Z]", nxt
            ):  # e.g. "Ann Arbor, MI"
                return True
            return False
    if re.match(r"^[a-z\[(]", nxt):
        return True
    if re.match(
        r"^(and|or|of|the|to|in|for|on|at|as|by|is|pp\.|no\s+month|Proceedings)\b",
        nxt,
        re.I,
    ):
        return True
    if re.match(r"^[\d\(]", nxt):
        return True
    if re.match(r"^[:,;]\s*", nxt):
        return True
    pe = (prev or "").rstrip()
    if pe and pe[-1] not in ".!?\";:" and not pe.endswith(")"):
        if not _looks_like_new_other_citation(nxt):
            return True
    if len(nxt) < 36 and "\u201c" not in nxt and '"' not in nxt and "et al" not in nxt.lower():
        if not _looks_like_new_other_citation(nxt):
            return True
    return False


def _right_chunk_starts_new_reference(b):
    """True if text after a layout gap looks like a different bibliographic entry."""
    b = (b or "").strip()
    if len(b) < 28:
        return False
    if re.match(r"^[A-Z][a-zA-Z'\-]+,\s*[\u201c\"“]", b):
        return True
    if re.match(r"^[A-Z][a-zA-Z'\-]+\s+et\s+al\.?,", b, re.I):
        return True
    if re.match(r"^[A-Z][a-zA-Z'\-]{2,25},\s+[A-Z]", b):
        return True
    if re.match(r"^Automotive Systems\b", b):
        return True
    if re.match(r"^Koebel,", b):
        return True
    if re.match(r"^Low\s+Temperatures\b", b, re.I):
        return True
    if re.match(r"^Journal of\s+", b):
        return True
    if re.match(r"^Frank,\s*[\u201c\"]", b):
        return True
    if re.match(r"^Nanba,", b):
        return True
    if re.match(r"^of\s+NO\s+with\b", b, re.I):
        return True
    return False


def split_dual_column_citations(text, depth=0):
    """Split 'Scott …      Shellef …' into two strings (two-column pdftotext bleed)."""
    text = (text or "").strip()
    if depth > 6 or len(text) < 55:
        return [text]
    # Two-column gaps are often 4+ spaces; require a new reference on the right.
    chunks = [x.strip() for x in re.split(r"\s{4,}", text) if x.strip()]
    if len(chunks) == 2:
        a, b = chunks[0], chunks[1]
        if len(a) >= 35 and len(b) >= 35 and _right_chunk_starts_new_reference(b):
            return split_dual_column_citations(a, depth + 1) + split_dual_column_citations(
                b, depth + 1
            )
    if len(chunks) > 2:
        out = []
        for c in chunks:
            out.extend(split_dual_column_citations(c, depth + 1))
        if len(out) > 1:
            return out
    return [text]


def cleanup_scott_column_bleed(s):
    """Remove a Shellef-column page/year fragment accidentally merged into Scott."""
    if "Scott" not in s:
        return s
    return re.sub(
        r"\s+\d+-\d+\s*\(\d{4}\),\s*no month[^.]*\.\s*(?=8,\s*Warrendale)",
        "",
        s,
        count=1,
    )


def attach_scott_gas_and_warrendale_tails(cites):
    """Rejoin Gas Generator / Warrendale line tails to the Scott citation (column interleave)."""
    cites = list(cites)
    i = 0
    while i < len(cites):
        cur = cites[i]
        if "Scott" in cur and "Gas Generator" not in cur:
            j = i + 1
            while j < len(cites):
                n = cites[j].strip()
                if re.search(r"Shellef", n, re.I) and "Twenty-five" in n:
                    j += 1
                    continue
                if re.match(r"^(Gas Generator|8,\s*Warrendale)", n, re.I):
                    cites[i] = cites[i].rstrip() + " " + n
                    cites.pop(j)
                    continue
                break
        i += 1
    return cites


def refine_other_citation_list(cites):
    cites = [c.strip() for c in cites if len((c or "").strip()) >= 10]
    cites = attach_scott_gas_and_warrendale_tails(cites)
    cites = [cleanup_scott_column_bleed(c) for c in cites]
    return cites


def partition_other_publications_by_layout_column(entries):
    """Split row-major L,R,L,R,... fragments into left-column then right-column streams.

    ``entries`` is a list of (cleaned_text, raw_line) in document order.  Chunks that
    share the same ``raw_line`` came from one physical pdftotext row (split on the
    wide layout gap); the first chunk is the left column, the second the right.
    Single-chunk rows (e.g. wrapped left column when the right cell is empty) go to
    the left stream.  This matches USPTO two-column 'Other publications' layout.
    """
    left_lines = []
    right_lines = []
    i = 0
    n = len(entries)
    while i < n:
        text, rl = entries[i]
        rl = (rl or "").strip()
        if not rl:
            if not is_front_matter_noise(text):
                left_lines.append(text)
            i += 1
            continue
        siblings = [text]
        j = i + 1
        while j < n and (entries[j][1] or "").strip() == rl:
            siblings.append(entries[j][0])
            j += 1
        if len(siblings) >= 2:
            if not is_front_matter_noise(siblings[0]):
                left_lines.append(siblings[0])
            if not is_front_matter_noise(siblings[1]):
                right_lines.append(siblings[1])
            for k in range(2, len(siblings)):
                if not is_front_matter_noise(siblings[k]):
                    right_lines.append(siblings[k])
        else:
            if not is_front_matter_noise(siblings[0]):
                left_lines.append(siblings[0])
        i = j
    return left_lines, right_lines


def trim_provisional_app_bleed_from_other_citation(s):
    """Strip specification / priority-application text merged after SAE Paper No. tails."""
    s = (s or "").strip()
    if not s:
        return s
    m = re.search(r"(?i)(Paper\s+No\.\s*[\d.-]+\.)", s)
    if m:
        rest = s[m.end() :].lstrip()
        if rest.lower().startswith("entitled"):
            return s[: m.end(1)].strip()
    return s


def merge_other_publication_texts(texts):
    """Merge line-broken fragments (reading order) into one string per citation."""
    texts = [clean_other_publication_text(t) for t in texts if t and len(t.strip()) >= 10]
    texts = [t for t in texts if t]
    if not texts:
        return []
    out = [texts[0]]
    for t in texts[1:]:
        if _should_merge_other_continuation(out[-1], t):
            out[-1] = (out[-1].rstrip() + " " + t.strip()).strip()
        else:
            out.append(t.strip())
    out = [x for x in out if len(x) >= 18]
    # Drop orphan "and …" fragments left when the author line was tied to a US cite row.
    out = [x for x in out if not (len(x) < 100 and re.match(r"^and\s+[A-Z]", x))]
    out = [trim_provisional_app_bleed_from_other_citation(x) for x in out]
    return out


def postprocess_other_publications(rows):
    """Replace fragmented other_publication rows with cleaned, merged entries."""
    base = [r for r in rows if r.get("record_type") != "other_publication"]
    entries = []
    for r in rows:
        if r.get("record_type") != "other_publication":
            continue
        t = clean_other_publication_text(r.get("name_or_text", ""))
        if len(t.strip()) >= 12 and not is_front_matter_noise(t):
            entries.append((t.strip(), (r.get("raw_line") or "").rstrip()))
    left_lines, right_lines = partition_other_publications_by_layout_column(entries)
    merged = merge_other_publication_texts(left_lines) + merge_other_publication_texts(
        right_lines
    )
    src = ""
    for r in rows:
        v = r.get("source_pdf")
        if v:
            src = v
            break
    pieces = []
    for m in merged:
        for piece in split_dual_column_citations(m):
            piece = (piece or "").strip()
            if len(piece) < 18:
                continue
            pieces.append(piece)
    pieces = refine_other_citation_list(pieces)
    merged_rows = []
    for piece in pieces:
        merged_rows.append(
            {
                "source_pdf": os.path.basename(src) if src else "",
                "record_type": "other_publication",
                "patent_number": "",
                "kind_code": "",
                "issue_date": "",
                "name_or_text": piece,
                "country_code": "",
                "foreign_doc": "",
                "foreign_kind": "",
                "primary_examiner": "",
                "attorney_firm": "",
                "raw_line": "",
            }
        )
    idx = next(
        (i for i, r in enumerate(base) if r.get("record_type") == "primary_examiner"),
        len(base),
    )
    return base[:idx] + merged_rows + base[idx:]


def chunk_looks_citation_text(chunk):
    """Heuristic: right-column text from OTHER PUBLICATIONS (skip drawing noise)."""
    if len(chunk) < 22:
        return False
    if re.search(r"\bSer\.\s+No\.\s*\d", chunk, re.I) and re.search(
        r"\bentitled\b", chunk, re.I
    ):
        return False
    if re.search(r"\(\s*19\d{2}\s*\)|\(\s*20\d{2}\s*\)", chunk):
        return True
    if re.search(
        r"\(\s*(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\b",
        chunk,
        re.I,
    ):
        if len(chunk) > 200:
            return False
        if any(q in chunk for q in ('"', "\u201c", "\u201d", "'", "\u2019")):
            return True
        if re.match(r"^(?:of|the|and|motive|motiv)\b", chunk, re.I):
            return True
        if re.search(r"\bp\.\s*[A-Z0-9]", chunk, re.I):
            return True
        return False
    if re.search(r"\bPaper\s+No\.\s*\d", chunk, re.I):
        return True
    if re.search(r"\bpp\.?\s*\d", chunk, re.I):
        return True
    if "Vol." in chunk or "vol." in chunk or "Proceedings" in chunk:
        return True
    if (
        "\u201c" in chunk
        or "\u201d" in chunk
        or '"' in chunk
        or "'" in chunk
        or "\u2019" in chunk
    ):
        return True
    if re.search(r"et\s+al\.?,", chunk, re.I):
        return True
    return False


def line_starts_like_us_cite(l2):
    """True when left column looks like a U.S. patent citation (not a section header row)."""
    return bool(re.match(r"^\s*[\d,\.]", l2))


def split_layout_columns(l2):
    """Split merged two-column pdftotext lines on wide whitespace runs.

    Poppler often inserts a wide gap between a foreign country code (DE, WO, …)
    and the document number; re-merge those fragments so foreign rows parse.
    """
    parts = [
        c.strip()
        for c in re.split(r"\s{%d,}" % MIN_LAYOUT_COLUMN_GAP, l2.strip())
        if c.strip()
    ]
    if not parts:
        return []
    merged = []
    i = 0
    while i < len(parts):
        if (
            i + 1 < len(parts)
            and re.match(r"^[A-Z]{2}$", parts[i])
            and not re.search(r"\d", parts[i])
        ):
            combo = parts[i] + " " + parts[i + 1]
            if RE_FOREIGN_ROW.match(combo):
                merged.append(combo)
                i += 2
                continue
        merged.append(parts[i])
        i += 1
    return merged


def split_secondary_column_gap(chunk):
    """Split when the gutter is 6–14 spaces (Poppler often uses < MIN_LAYOUT_COLUMN_GAP)."""
    chunk = (chunk or "").strip()
    if len(chunk) < 55:
        return [chunk]
    parts = [x.strip() for x in re.split(r"\s{6,}", chunk) if x.strip()]
    if len(parts) != 2:
        return [chunk]
    a, b = parts[0], parts[1]
    if len(a) < 28 or len(b) < 18:
        return [chunk]
    if _right_chunk_starts_new_reference(b) or re.match(
        r"^[A-Z][a-zA-Z'\-]+,\s+[A-Z]", b
    ):
        return [a, b]
    if re.match(r"^[A-Z][a-zA-Z'\-]+\s+[A-Z][a-zA-Z'\-]+,", b):
        return [a, b]
    return [chunk]


def split_reference_line_chunks(l2):
    """Layout-aware chunks for references tables (wide gutter, then narrow gutter)."""
    out = []
    for part in split_layout_columns(l2) or [l2]:
        out.extend(split_secondary_column_gap(part))
    return out or [l2.strip()]


def is_probable_us_row(num_raw, kind, date_m, name):
    if not date_m:
        return False
    d = us_digit_count(num_raw)
    if d < 5:
        return False
    # Kind code is optional (pre-2000 format omits it)
    if kind and not re.match(r"^[A-Z]\d{0,2}$", kind, re.I):
        return False
    if len(name.strip()) < 1:
        return False
    # reject obvious garbage names
    if re.match(r"^[\W\d_]+$", name.strip()):
        return False
    return True


def parse_text(text, source_pdf):
    lines = text.splitlines()
    rows = []

    # Scan from page 1 onward: examiner lines often appear *before* "(56) References Cited"
    # in the pdftotext reading order, so we cannot start only at (56).
    start_i = 0

    section = None
    after = False

    i = start_i
    while i < len(lines):
        line = lines[i]
        raw = line.rstrip()
        l = raw.strip()
        l2 = RE_CONTINUED.sub("", l).strip()

        if not l2:
            i += 1
            continue

        if RE_STOP.match(l2):
            after = True
            section = None
            i += 1
            continue

        if RE_US_HEADER.search(l2) and not line_starts_like_us_cite(l2):
            after = False
            section = "us"
            i += 1
            continue
        if RE_FOREIGN_HEADER.search(l2) and not line_starts_like_us_cite(l2):
            after = False
            section = "foreign"
            i += 1
            continue
        if RE_OTHER_HEADER.search(l2) and not line_starts_like_us_cite(l2):
            after = False
            section = "other"
            i += 1
            continue

        m_pe = RE_PRIMARY.search(l2)
        if m_pe:
            after = True
            section = None
            name = m_pe.group(1).strip()
            name = re.split(r"\s{2,}", name)[0]
            rows.append(
                {
                    "record_type": "primary_examiner",
                    "patent_number": "",
                    "kind_code": "",
                    "issue_date": "",
                    "name_or_text": "",
                    "country_code": "",
                    "foreign_doc": "",
                    "foreign_kind": "",
                    "primary_examiner": name,
                    "attorney_firm": "",
                    "raw_line": raw,
                }
            )
            i += 1
            continue

        m_at = RE_ATTORNEY.search(l2)
        if m_at:
            firm = m_at.group(1).strip()
            firm = re.split(r"\s{2,}", firm)[0]
            rows.append(
                {
                    "record_type": "attorney_firm",
                    "patent_number": "",
                    "kind_code": "",
                    "issue_date": "",
                    "name_or_text": "",
                    "country_code": "",
                    "foreign_doc": "",
                    "foreign_kind": "",
                    "primary_examiner": "",
                    "attorney_firm": firm,
                    "raw_line": raw,
                }
            )
            i += 1
            continue

        if section == "us":
            chunks = split_reference_line_chunks(l2)
            for chunk in chunks:
                if RE_OTHER_HEADER.search(chunk) and len(chunk) < 90:
                    section = "other"
                    break
                m = RE_US_ROW.match(chunk)
                if m:
                    num_raw, kind, idate, name = (
                        m.group(1),
                        (m.group(2) or "").upper(),
                        m.group(3),
                        m.group(4),
                    )
                    name = re.split(r"\s{3,}", name.strip())[0]
                    name = re.sub(r"\s*\.{3,}\s*[\d/]+\s*$", "", name).strip()
                    if is_probable_us_row(num_raw, kind, idate, name):
                        pnum = normalize_us_number(num_raw)
                        rows.append(
                            {
                                "record_type": "us_patent",
                                "patent_number": pnum,
                                "kind_code": kind,
                                "issue_date": idate,
                                "name_or_text": name.strip(),
                                "country_code": "",
                                "foreign_doc": "",
                                "foreign_kind": "",
                                "primary_examiner": "",
                                "attorney_firm": "",
                                "raw_line": raw,
                            }
                        )
                    continue
                chunk = chunk.strip()
                if chunk_looks_citation_text(chunk) and not is_front_matter_noise(chunk):
                    rows.append(
                        {
                            "record_type": "other_publication",
                            "patent_number": "",
                            "kind_code": "",
                            "issue_date": "",
                            "name_or_text": chunk,
                            "country_code": "",
                            "foreign_doc": "",
                            "foreign_kind": "",
                            "primary_examiner": "",
                            "attorney_firm": "",
                            "raw_line": raw,
                        }
                    )
            i += 1
            continue

        if section == "foreign":
            chunks = split_reference_line_chunks(l2)
            for chunk in chunks:
                if RE_OTHER_HEADER.search(chunk) and len(chunk) < 90:
                    section = "other"
                    break
                m = RE_FOREIGN_ROW.match(chunk)
                if m:
                    cc, body, idate = m.group(1), m.group(2), m.group(3)
                    doc, fk = split_foreign_body(body)
                    rows.append(
                        {
                            "record_type": "foreign_patent",
                            "patent_number": "",
                            "kind_code": "",
                            "issue_date": idate,
                            "name_or_text": "",
                            "country_code": cc,
                            "foreign_doc": doc,
                            "foreign_kind": fk,
                            "primary_examiner": "",
                            "attorney_firm": "",
                            "raw_line": raw,
                        }
                    )
                    continue
                # Try old-format foreign: number date country-name
                m_old = RE_FOREIGN_ROW_OLD.match(chunk)
                if m_old:
                    doc_num = normalize_us_number(m_old.group(1))
                    idate = m_old.group(2)
                    country_name = m_old.group(3).strip().lower()
                    # Strip trailing dots/classification
                    country_name = re.sub(r"\s*\.{2,}.*$", "", country_name).strip().lower()
                    cc = COUNTRY_NAME_TO_CODE.get(country_name, country_name.upper()[:2])
                    rows.append(
                        {
                            "record_type": "foreign_patent",
                            "patent_number": "",
                            "kind_code": "",
                            "issue_date": idate,
                            "name_or_text": "",
                            "country_code": cc,
                            "foreign_doc": doc_num,
                            "foreign_kind": "",
                            "primary_examiner": "",
                            "attorney_firm": "",
                            "raw_line": raw,
                        }
                    )
                    continue
                chunk = chunk.strip()
                if chunk_looks_citation_text(chunk) and not is_front_matter_noise(chunk):
                    rows.append(
                        {
                            "record_type": "other_publication",
                            "patent_number": "",
                            "kind_code": "",
                            "issue_date": "",
                            "name_or_text": chunk,
                            "country_code": "",
                            "foreign_doc": "",
                            "foreign_kind": "",
                            "primary_examiner": "",
                            "attorney_firm": "",
                            "raw_line": raw,
                        }
                    )
            i += 1
            continue

        if section == "other":
            if RE_US_HEADER.search(l2) and not line_starts_like_us_cite(l2):
                section = "us"
                i += 1
                continue
            if RE_FOREIGN_HEADER.search(l2) and not line_starts_like_us_cite(l2):
                section = "foreign"
                i += 1
                continue
            if RE_OTHER_HEADER.search(l2) and not line_starts_like_us_cite(l2):
                section = "other"
                i += 1
                continue
            if re.match(r"^\s*Page\s+\d+\s*$", l2, re.I):
                i += 1
                continue
            if l2.startswith("US ") and re.search(r"\bB\d\b", l2):
                i += 1
                continue

            chunks = split_reference_line_chunks(l2)
            saw_us = False
            saw_fr = False
            emitted = False
            for chunk in chunks:
                chunk = chunk.strip()
                if not chunk:
                    continue
                mf = RE_FOREIGN_ROW.match(chunk)
                if not mf:
                    mf_old = RE_FOREIGN_ROW_OLD.match(chunk)
                    if mf_old:
                        doc_num = normalize_us_number(mf_old.group(1))
                        idate = mf_old.group(2)
                        cname = re.sub(r"\s*\.{2,}.*$", "", mf_old.group(3)).strip().lower()
                        cc = COUNTRY_NAME_TO_CODE.get(cname, cname.upper()[:2])
                        rows.append(
                            {
                                "record_type": "foreign_patent",
                                "patent_number": "",
                                "kind_code": "",
                                "issue_date": idate,
                                "name_or_text": "",
                                "country_code": cc,
                                "foreign_doc": doc_num,
                                "foreign_kind": "",
                                "primary_examiner": "",
                                "attorney_firm": "",
                                "raw_line": raw,
                            }
                        )
                        saw_fr = True
                        emitted = True
                        continue
                if mf:
                    cc, body, idate = mf.group(1), mf.group(2), mf.group(3)
                    doc, fk = split_foreign_body(body)
                    rows.append(
                        {
                            "record_type": "foreign_patent",
                            "patent_number": "",
                            "kind_code": "",
                            "issue_date": idate,
                            "name_or_text": "",
                            "country_code": cc,
                            "foreign_doc": doc,
                            "foreign_kind": fk,
                            "primary_examiner": "",
                            "attorney_firm": "",
                            "raw_line": raw,
                        }
                    )
                    saw_fr = True
                    emitted = True
                    continue
                mu = RE_US_ROW.match(chunk)
                if mu:
                    num_raw, kind, idate, name = (
                        mu.group(1),
                        mu.group(2).upper(),
                        mu.group(3),
                        mu.group(4),
                    )
                    name = re.split(r"\s{3,}", name.strip())[0]
                    name = re.sub(r"\s*\.{3,}\s*[\d/]+\s*$", "", name).strip()
                    if is_probable_us_row(num_raw, kind, idate, name):
                        pnum = normalize_us_number(num_raw)
                        rows.append(
                            {
                                "record_type": "us_patent",
                                "patent_number": pnum,
                                "kind_code": kind,
                                "issue_date": idate,
                                "name_or_text": name.strip(),
                                "country_code": "",
                                "foreign_doc": "",
                                "foreign_kind": "",
                                "primary_examiner": "",
                                "attorney_firm": "",
                                "raw_line": raw,
                            }
                        )
                        saw_us = True
                        emitted = True
                    continue
                if len(chunk) >= 15 and not is_front_matter_noise(chunk):
                    rows.append(
                        {
                            "record_type": "other_publication",
                            "patent_number": "",
                            "kind_code": "",
                            "issue_date": "",
                            "name_or_text": chunk,
                            "country_code": "",
                            "foreign_doc": "",
                            "foreign_kind": "",
                            "primary_examiner": "",
                            "attorney_firm": "",
                            "raw_line": raw,
                        }
                    )
                    emitted = True
            if saw_us:
                section = "us"
            elif saw_fr:
                section = "foreign"
            if not emitted and len(l2.strip()) >= 12 and not is_front_matter_noise(l2.strip()):
                rows.append(
                    {
                        "record_type": "other_publication",
                        "patent_number": "",
                        "kind_code": "",
                        "issue_date": "",
                        "name_or_text": l2.strip(),
                        "country_code": "",
                        "foreign_doc": "",
                        "foreign_kind": "",
                        "primary_examiner": "",
                        "attorney_firm": "",
                        "raw_line": raw,
                    }
                )
            i += 1
            continue

        i += 1

    # ================================================================
    # RIGHT-COLUMN PRE-SCAN: catch US patent citations that appear in
    # the right column of two-column USPTO layouts BEFORE the "(56)
    # References Cited" header.  These are missed by the section-based
    # parser because the left column contains front-matter (title,
    # inventor, notice) while the right column already lists patents.
    # ================================================================
    already = {
        normalize_us_number(r.get("patent_number", ""))
        for r in rows
        if r.get("record_type") == "us_patent" and r.get("patent_number")
    }

    # Detect the patent's own number from the header to exclude it from
    # right-column scanning (it appears in "(10) Patent Number: X,XXX,XXX")
    own_number_re = re.compile(r"Patent\s+(?:No(?:\.|umber)?)\s*:?\s*([\d,\.\s]+)", re.I)
    for line in lines[:30]:  # header is always in first 30 lines
        m_own = own_number_re.search(line)
        if m_own:
            own_pnum = normalize_us_number(m_own.group(1))
            if us_digit_count(m_own.group(1)) >= 5:
                already.add(own_pnum)
            break

    # Regex for right-column patent rows: number (with OCR . for ,),
    # optional kind code, date, optional inventor name.
    # More lenient than RE_US_ROW to handle OCR artifacts and missing fields.
    RE_RIGHT_COL_PATENT = re.compile(
        r"([\d,\.\s]{5,}?)\s+([AB]\d{0,2})\s*\*?\s+(\d{1,2}/\d{4})\s*(.*?)$",
        re.I,
    )
    # Even more lenient: number + kind but no date (Poschl/Willey cases)
    RE_RIGHT_COL_NUMONLY = re.compile(
        r"([\d,\.\s]{5,}?)\s+([AB]\d{0,2})\s*\*?\s*$",
        re.I,
    )

    # Also match bare number lines (heavily indented, single chunk = right column only)
    RE_RIGHT_COL_BARE_NUM = re.compile(
        r"^([\d,\.\s]{5,}?)\s*$",
    )

    # Build a flat list of all right-column chunks across ALL lines, preserving order,
    # so we can look ahead across line boundaries for date+inventor fragments.
    all_right_chunks = []
    for li, line in enumerate(lines):
        raw = line.rstrip()
        if not raw:
            continue
        chunks = [c.strip() for c in re.split(r"\s{8,}", raw) if c.strip()]
        if not chunks:
            continue
        leading_spaces = len(raw) - len(raw.lstrip())
        if leading_spaces >= 40 and len(chunks) >= 2:
            rejoined = " ".join(chunks)
            for c in [rejoined] + chunks:
                if c.strip():
                    all_right_chunks.append(c.strip())
        elif leading_spaces >= 40 and len(chunks) == 1:
            all_right_chunks.append(chunks[0].strip())
        elif len(chunks) >= 2:
            for c in chunks[1:]:
                if c.strip():
                    all_right_chunks.append(c.strip())

    for line in lines:
        raw = line.rstrip()
        if not raw:
            continue
        # Look at chunks from wide-gap split.  For right-column-only lines
        # (no left-column text, just leading whitespace), the single chunk
        # IS the right column if the line starts with heavy indentation.
        chunks = [c.strip() for c in re.split(r"\s{8,}", raw) if c.strip()]
        if not chunks:
            continue
        # Determine which chunks to scan: if line has 2+ chunks, scan from
        # index 1 onward (right column).  If line has 1 chunk but starts
        # with >= 40 chars of leading whitespace, it IS a right-column line.
        leading_spaces = len(raw) - len(raw.lstrip())
        if len(chunks) == 1 and leading_spaces < 40:
            continue
        # If line is right-column-only (heavy indent) with 2+ chunks,
        # the wide-gap split may have broken a single patent row into
        # [number+kind, date+inventor].  Re-join them for matching.
        if leading_spaces >= 40 and len(chunks) >= 2:
            rejoined = " ".join(chunks)
            scan_chunks = [rejoined] + chunks
        elif len(chunks) >= 2:
            scan_chunks = chunks[1:]
        else:
            scan_chunks = chunks
        # Helper: try to find date+inventor in the next chunk after a number-only match
        RE_DATE_INVENTOR = re.compile(r"^(\d{1,2}/\d{4})\s+(.*?)$")

        for ci, chunk in enumerate(scan_chunks):
            chunk = chunk.strip()
            if not chunk:
                continue
            # Strip trailing classification dots (e.g. "Hunt et al. ......... 48/209")
            chunk_clean = re.sub(r"\s*\.{3,}\s*[\d/]+\s*$", "", chunk).strip()

            m = RE_RIGHT_COL_PATENT.match(chunk_clean)
            if m:
                num_raw = m.group(1)
                kind = (m.group(2) or "").upper()
                idate = m.group(3)
                name = (m.group(4) or "").strip()
                name = re.split(r"\s{3,}", name)[0] if name else ""
                # Strip trailing classification dots from name too
                name = re.sub(r"\s*\.{3,}\s*[\d/]+\s*$", "", name).strip()
                pnum = normalize_us_number(num_raw)
                if pnum in already:
                    continue
                if us_digit_count(num_raw) >= 5 and name:
                    rows.append({
                        "record_type": "us_patent",
                        "patent_number": pnum,
                        "kind_code": kind,
                        "issue_date": idate,
                        "name_or_text": name.strip(),
                        "country_code": "",
                        "foreign_doc": "",
                        "foreign_kind": "",
                        "primary_examiner": "",
                        "attorney_firm": "",
                        "raw_line": raw,
                    })
                    already.add(pnum)
                continue

            # Number + kind but no date on this chunk — look ahead for date+inventor
            m2 = RE_RIGHT_COL_NUMONLY.match(chunk_clean)
            if m2:
                num_raw = m2.group(1)
                kind = m2.group(2).upper()
                pnum = normalize_us_number(num_raw)
                if pnum in already:
                    continue
                if us_digit_count(num_raw) < 5:
                    continue
                # Look ahead for date+inventor: first in same-line chunks,
                # then in all_right_chunks (cross-line look-ahead)
                idate = ""
                name = ""
                # Same-line look-ahead
                if ci + 1 < len(scan_chunks):
                    next_chunk = scan_chunks[ci + 1].strip()
                    md = RE_DATE_INVENTOR.match(next_chunk)
                    if md:
                        idate = md.group(1)
                        name = md.group(2).strip()
                        name = re.sub(r"\s*\.{3,}\s*[\d/]+\s*$", "", name).strip()
                # Cross-line look-ahead via all_right_chunks
                if not name:
                    for arc_i, arc in enumerate(all_right_chunks):
                        if normalize_us_number(num_raw) in normalize_us_number(arc):
                            # Found our number; check NEXT chunk in the flat list
                            if arc_i + 1 < len(all_right_chunks):
                                nxt = all_right_chunks[arc_i + 1].strip()
                                md2 = RE_DATE_INVENTOR.match(nxt)
                                if md2:
                                    idate = md2.group(1)
                                    name = md2.group(2).strip()
                                    name = re.sub(r"\s*\.{3,}\s*[\d/]+\s*$", "", name).strip()
                            break
                if not name:
                    name = "(right-column, date/inventor on adjacent line)"
                rows.append({
                    "record_type": "us_patent",
                    "patent_number": pnum,
                    "kind_code": kind,
                    "issue_date": idate,
                    "name_or_text": name,
                    "country_code": "",
                    "foreign_doc": "",
                    "foreign_kind": "",
                    "primary_examiner": "",
                    "attorney_firm": "",
                    "raw_line": raw,
                })
                already.add(pnum)
                continue

            # Bare number only (no kind code, no date — severe OCR or line break)
            m3 = RE_RIGHT_COL_BARE_NUM.match(chunk_clean)
            if m3:
                num_raw = m3.group(1)
                pnum = normalize_us_number(num_raw)
                if pnum in already:
                    continue
                if us_digit_count(num_raw) < 5:
                    continue
                # Look ahead for kind+date+inventor (same-line then cross-line)
                idate = ""
                name = ""
                kind = ""
                if ci + 1 < len(scan_chunks):
                    next_chunk = scan_chunks[ci + 1].strip()
                    mn = RE_RIGHT_COL_PATENT.match(next_chunk)
                    if not mn:
                        md = RE_DATE_INVENTOR.match(next_chunk)
                        if md:
                            idate = md.group(1)
                            name = md.group(2).strip()
                if not name:
                    for arc_i, arc in enumerate(all_right_chunks):
                        if normalize_us_number(num_raw) in normalize_us_number(arc):
                            if arc_i + 1 < len(all_right_chunks):
                                nxt = all_right_chunks[arc_i + 1].strip()
                                # Try kind+date+inventor
                                mk = re.match(r"^([AB]\d{0,2})\s*\*?\s+(\d{1,2}/\d{4})\s+(.*?)$", nxt, re.I)
                                if mk:
                                    kind = mk.group(1).upper()
                                    idate = mk.group(2)
                                    name = mk.group(3).strip()
                                else:
                                    md2 = RE_DATE_INVENTOR.match(nxt)
                                    if md2:
                                        idate = md2.group(1)
                                        name = md2.group(2).strip()
                            break
                if not name:
                    name = "(right-column, bare number only — verify manually)"
                rows.append({
                    "record_type": "us_patent",
                    "patent_number": pnum,
                    "kind_code": kind,
                    "issue_date": idate,
                    "name_or_text": name,
                    "country_code": "",
                    "foreign_doc": "",
                    "foreign_kind": "",
                    "primary_examiner": "",
                    "attorney_firm": "",
                    "raw_line": raw,
                })
                already.add(pnum)

    out = []
    pdf_label = os.path.basename(source_pdf)
    for r in rows:
        r = dict(r)
        r["source_pdf"] = pdf_label
        out.append(r)
    return postprocess_other_publications(out)


PRIORART_CSV_FIELDS = [
    "source_pdf",
    "record_type",
    "patent_number",
    "kind_code",
    "issue_date",
    "inventor_or_assignee",
    "country_code",
    "foreign_document",
    "foreign_kind",
]

OTHERPUB_CSV_FIELDS = ["source_pdf", "sequence", "citation"]

ATTORNEY_CSV_FIELDS = ["source_pdf", "primary_examiner", "attorney_firm"]


def _priorart_csv_row(r):
    rt = r.get("record_type", "")
    inv = (r.get("name_or_text") or "").strip() if rt == "us_patent" else ""
    return {
        "source_pdf": r.get("source_pdf", ""),
        "record_type": rt,
        "patent_number": (r.get("patent_number") or "").strip(),
        "kind_code": (r.get("kind_code") or "").strip(),
        "issue_date": (r.get("issue_date") or "").strip(),
        "inventor_or_assignee": inv,
        "country_code": (r.get("country_code") or "").strip(),
        "foreign_document": (r.get("foreign_doc") or "").strip(),
        "foreign_kind": (r.get("foreign_kind") or "").strip(),
    }


def write_priorart_csv(path, rows):
    sub = [
        _priorart_csv_row(r)
        for r in rows
        if r.get("record_type") in ("us_patent", "foreign_patent")
    ]
    with open(path, "w", encoding="utf-8", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=PRIORART_CSV_FIELDS, quoting=csv.QUOTE_MINIMAL)
        w.writeheader()
        w.writerows(sub)


def write_otherpublications_csv(path, rows):
    cites = [
        (r.get("name_or_text") or "").strip()
        for r in rows
        if r.get("record_type") == "other_publication" and (r.get("name_or_text") or "").strip()
    ]
    src = ""
    for r in rows:
        if r.get("source_pdf"):
            src = r["source_pdf"]
            break
    with open(path, "w", encoding="utf-8", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=OTHERPUB_CSV_FIELDS, quoting=csv.QUOTE_MINIMAL)
        w.writeheader()
        for seq, block in enumerate(cites, 1):
            w.writerow({"source_pdf": src, "sequence": seq, "citation": block})


def write_attorney_csv(path, rows):
    src = ""
    for r in rows:
        if r.get("source_pdf"):
            src = r["source_pdf"]
            break
    examiner = ""
    firm = ""
    for r in rows:
        if r.get("record_type") == "primary_examiner":
            examiner = (r.get("primary_examiner") or "").strip()
        if r.get("record_type") == "attorney_firm":
            firm = (r.get("attorney_firm") or "").strip()
    with open(path, "w", encoding="utf-8", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=ATTORNEY_CSV_FIELDS, quoting=csv.QUOTE_MINIMAL)
        w.writeheader()
        w.writerow(
            {
                "source_pdf": src,
                "primary_examiner": examiner,
                "attorney_firm": firm,
            }
        )


def main():
    argv = sys.argv[1:]
    source = None
    csv_prefix = None
    i = 0
    while i < len(argv):
        if argv[i] == "--source" and i + 1 < len(argv):
            source = argv[i + 1]
            i += 2
        elif argv[i] == "--csv-prefix" and i + 1 < len(argv):
            csv_prefix = argv[i + 1]
            i += 2
        else:
            i += 1
    if not source:
        sys.stderr.write(
            "usage: fe_priorart_parse.py --source PDF_PATH --csv-prefix /path/basename_no_ext < text.txt\n"
        )
        return 2
    if not csv_prefix:
        sys.stderr.write(
            "fe_priorart_parse.py: --csv-prefix is required (writes *_priorart.csv, *_otherpublications.csv, *_attorney.csv)\n"
        )
        return 2
    text = sys.stdin.read()
    rows = parse_text(text, source)
    try:
        write_priorart_csv(csv_prefix + "_priorart.csv", rows)
        write_otherpublications_csv(csv_prefix + "_otherpublications.csv", rows)
        write_attorney_csv(csv_prefix + "_attorney.csv", rows)
    except OSError as e:
        sys.stderr.write("fe_priorart_parse.py: cannot write CSV: %s\n" % e)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main() or 0)
