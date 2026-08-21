#!/usr/bin/env bash

set -euo pipefail

ROOT="${CODEX_EXECUTOR_HOME:-$HOME/.agents/skills/codex-executor}"
REPO="https://github.com/calvingit/codex-executor.git"

if ! command -v git >/dev/null 2>&1; then
  echo "git is required"
  exit 1
fi

if [ -d "$ROOT/.git" ]; then
  echo "Updating existing installation: $ROOT"
  git -C "$ROOT" pull --ff-only
elif [ -e "$ROOT" ]; then
  echo "Target exists but is not a git repository: $ROOT"
  exit 1
else
  echo "Installing codex-executor: $ROOT"
  mkdir -p "$(dirname "$ROOT")"
  git clone "$REPO" "$ROOT"
fi

if ! command -v codex >/dev/null 2>&1; then
  echo "Warning: codex CLI was not found in PATH"
fi

echo "Installed codex-executor to $ROOT"
echo "Copy or link this skill directory into your Agent skills directory."
