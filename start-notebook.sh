#!/usr/bin/env bash
# Launches the Jupyter Notebook server in the background, rooted at ./notebooks,
# with the SageMath kernel available. Safe to re-run (restarts any existing server).
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NOTEBOOK_DIR="$PROJECT_DIR/notebooks"
LOG_DIR="/tmp/logs"
PORT="${JUPYTER_PORT:-8888}"

mkdir -p "$NOTEBOOK_DIR" "$LOG_DIR"

# Stop any previously running instance.
pkill -f "jupyter-notebook" 2>/dev/null || true
sleep 1

cd "$NOTEBOOK_DIR"
nohup jupyter notebook \
  --ip=0.0.0.0 \
  --port="$PORT" \
  --no-browser \
  --allow-root \
  --NotebookApp.token='' \
  --NotebookApp.password='' \
  --NotebookApp.allow_origin='*' \
  --NotebookApp.disable_check_xsrf=True \
  --NotebookApp.allow_remote_access=True \
  --notebook-dir="$NOTEBOOK_DIR" \
  > "$LOG_DIR/jupyter.log" 2>&1 &
disown

sleep 3
echo "==> Jupyter Notebook started, serving $NOTEBOOK_DIR on port $PORT."
echo "==> Logs: $LOG_DIR/jupyter.log"
tail -n 10 "$LOG_DIR/jupyter.log"
