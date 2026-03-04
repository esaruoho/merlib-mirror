#!/opt/homebrew/bin/bash
set -euo pipefail

cd "$(dirname "$0")"

# Set up Homebrew environment (for python3, etc.)
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "=== MERLib Mirror ==="
echo "Mirroring the Internet's Modern Energy Research into a Library"
echo "Repo: $(pwd)"
echo "Started: $(date)"
echo ""

# Pull latest before starting
git pull --rebase --autostash 2>/dev/null || git pull 2>/dev/null || true

exec ./mirror-worker
