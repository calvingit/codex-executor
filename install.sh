#!/usr/bin/env bash

set -euo pipefail

ROOT="${CODEX_EXECUTOR_HOME:-$HOME/.agents/skills/codex-executor}"

mkdir -p "$(dirname "$ROOT")"

if command -v git >/dev/null 2>&1; then
  git clone https://github.com/calvingit/codex-executor.git "$ROOT"
else
  echo "git is required"
  exit 1
fi

echo "Installed codex-executor to $ROOT"

echo "Copy or link this skill directory into your Agent skills directory."
