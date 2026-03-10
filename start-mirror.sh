#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

# Set up Homebrew environment (macOS only)
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Source API keys from .env if present (not committed to repo)
if [[ -f .env ]]; then
  set -a; source .env; set +a
fi

echo "=== MERLib Mirror ==="
echo "Mirroring the Internet's Modern Energy Research into a Library"
echo "Repo: $(pwd)"
echo "Started: $(date)"
echo ""

# Pull latest before starting
git pull --rebase --autostash 2>/dev/null || git pull 2>/dev/null || true

exec ./mirror-worker
