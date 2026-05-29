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

# Single-instance: this start-mirror.sh becomes the SOLE owner. Kill any other
# start-mirror.sh supervisors AND any mirror-worker processes still running, so
# orphans from previous Cloudcity-Boot cycles or guardian respawns can never
# stack. (2026-05-29 — "mirror-worker orphans should not exist".) Supervisors
# are killed first so none survives to respawn a worker we're about to clear.
# The log-tail pane (mirror-worker.log) and the guardian are excluded. Wrapped
# in set +e/-e so pgrep's no-match exit can't trip set -euo pipefail.
set +e
SELF_PID=$$
for p in $(pgrep -f "start-mirror.sh" 2>/dev/null); do
  [ "$p" = "$SELF_PID" ] && continue
  kill -9 "$p" 2>/dev/null
done
pgrep -fl "mirror-worker" 2>/dev/null \
  | grep -vE "mirror-worker\.log|merlib-mirror-guardian" \
  | awk '{print $1}' \
  | while read -r p; do kill -9 "$p" 2>/dev/null; done
sleep 1
set -e
echo "[start-mirror] cleared any pre-existing supervisors/workers — sole instance now"

# Pull latest before starting
git pull --rebase --autostash 2>/dev/null || git pull 2>/dev/null || true

# Supervisor loop: respawn the worker if it crashes (SIGKILL from OOM, an
# unhandled exception, anything that takes the process down). Sleep a few
# seconds between respawns to avoid a tight crash-loop. The worker writes
# .worker.pid itself, so each respawn picks up where the queue left off.
while true; do
  ./mirror-worker
  EXIT=$?
  echo "[supervisor] mirror-worker exited with $EXIT — respawning in 5s"
  sleep 5
done
