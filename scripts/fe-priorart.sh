#!/usr/bin/env bash
#
# fe-priorart.sh — extract References Cited from USPTO-style patent PDFs (text layer).
#
# Requires: pdftotext (Poppler), python3
#
# For each input.pdf writes (in --out-dir):
#   <basename>_priorart.csv           — U.S. + foreign patent cites
#   <basename>_otherpublications.csv — other publications (merged, one row per citation)
#   <basename>_attorney.csv           — primary examiner + attorney/firm (one row)
#
# All CSVs use the PDF file name only in the source_pdf column (no full path).
#
# Usage:
#   ./fe-priorart.sh [--out-dir DIR] [--combined-priorart FILE] [--pages N] patent.pdf [...]
#   ./fe-priorart.sh *.pdf
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARSE_PY="${SCRIPT_DIR}/fe_priorart_parse.py"

OUT_DIR="."
COMBINED_PRIORART=""
PAGES=12
OPEN_OUT=0
ERRORS=0

usage() {
  echo "usage: $0 [--out-dir DIR] [--combined-priorart FILE] [--pages N] PDF [PDF ...]" >&2
  echo "  --out-dir             directory for *_priorart.csv etc. (default: .)" >&2
  echo "  --combined-priorart   append all *_priorart.csv data into one CSV (header once)" >&2
  echo "  --pages               last page for pdftotext -layout (default: 12)" >&2
  echo "  --open                after each PDF, open the three CSVs (macOS only)" >&2
  exit 2
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --out-dir)
      OUT_DIR="${2:-}"
      shift 2 || usage
      ;;
    --combined-priorart)
      COMBINED_PRIORART="${2:-}"
      shift 2 || usage
      ;;
    --combined-out)
      # backward alias
      COMBINED_PRIORART="${2:-}"
      shift 2 || usage
      ;;
    --pages)
      PAGES="${2:-}"
      shift 2 || usage
      ;;
    --open)
      OPEN_OUT=1
      shift
      ;;
    -h|--help)
      usage
      ;;
    *)
      break
      ;;
  esac
done

if [[ $# -lt 1 ]]; then
  usage
fi

command -v pdftotext >/dev/null 2>&1 || {
  echo "$0: pdftotext not found (install Poppler / poppler-utils)." >&2
  exit 1
}
command -v python3 >/dev/null 2>&1 || {
  echo "$0: python3 not found." >&2
  exit 1
}
[[ -f "$PARSE_PY" ]] || {
  echo "$0: missing $PARSE_PY" >&2
  exit 1
}

mkdir -p "$OUT_DIR"

combined_priorart_header=0
if [[ -n "$COMBINED_PRIORART" ]]; then
  touch "$COMBINED_PRIORART" || {
    echo "$0: cannot write --combined-priorart $COMBINED_PRIORART" >&2
    exit 1
  }
fi

for pdf in "$@"; do
  if [[ ! -f "$pdf" ]]; then
    echo "$0: not a file: $pdf" >&2
    ERRORS=1
    continue
  fi
  base="$(basename "$pdf" .pdf)"
  csv_prefix="${OUT_DIR%/}/${base}"
  tmp_txt="$(mktemp -t fe_priorart.XXXXXX.txt)"

  if ! pdftotext -layout -f 1 -l "$PAGES" -- "$pdf" "$tmp_txt" 2>/dev/null; then
    echo "$0: pdftotext failed: $pdf" >&2
    ERRORS=1
    rm -f "$tmp_txt"
    continue
  fi

  if ! python3 "$PARSE_PY" --source "$pdf" --csv-prefix "$csv_prefix" <"$tmp_txt"; then
    echo "$0: parse failed: $pdf" >&2
    ERRORS=1
    rm -f "$tmp_txt"
    continue
  fi

  rm -f "$tmp_txt"

  prior_csv="${csv_prefix}_priorart.csv"
  if [[ -n "$COMBINED_PRIORART" ]]; then
    if [[ "$combined_priorart_header" -eq 0 ]]; then
      head -n 1 "$prior_csv" >>"$COMBINED_PRIORART"
      combined_priorart_header=1
    fi
    tail -n +2 "$prior_csv" >>"$COMBINED_PRIORART"
  fi

  if [[ "$OPEN_OUT" -eq 1 ]] && [[ "$(uname -s)" == "Darwin" ]]; then
    open "${csv_prefix}_priorart.csv" "${csv_prefix}_otherpublications.csv" "${csv_prefix}_attorney.csv"
  fi
done

if [[ "$ERRORS" -ne 0 ]]; then
  exit 1
fi
exit 0
