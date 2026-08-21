#!/usr/bin/env bash

set -euo pipefail

MODE="${1:-analysis}"
shift || true

case "$MODE" in
  analysis)
    codex exec --sandbox read-only "$@"
    ;;
  write)
    codex exec --sandbox workspace-write --full-auto "$@"
    ;;
  full)
    codex exec --sandbox danger-full-access --full-auto "$@"
    ;;
  resume)
    echo "$*" | codex exec resume --last
    ;;
  *)
    echo "Usage: codex-run.sh {analysis|write|full|resume} <prompt>"
    exit 1
    ;;
esac
