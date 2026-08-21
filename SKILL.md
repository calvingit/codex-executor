---
name: codex-executor
description: Use Codex CLI as a coding execution sub-agent for analysis, implementation, debugging, refactoring, testing, and review tasks.
---

# Codex Executor Skill

## Purpose

Codex CLI is an execution-focused coding agent.

The caller agent owns:
- understanding user intent
- preparing context
- defining acceptance criteria
- evaluating results

Codex owns:
- repository inspection
- implementation
- verification
- reporting changes

## Delegation

Use Codex when a task requires:
- repository exploration
- multi-file changes
- terminal execution
- debugging with real code

Do not delegate vague requests without goal and acceptance criteria.

## Model

Use Codex CLI configured defaults unless a model is explicitly required.

Reasoning guidance:
- low: small edits and simple analysis
- medium: normal coding tasks
- high: debugging and architecture changes
- xhigh: only when required

## Execution

Analysis:

```bash
codex exec --sandbox read-only --skip-git-repo-check "task"
```

Modification:

```bash
codex exec --sandbox workspace-write --full-auto --skip-git-repo-check "task"
```

Resume:

```bash
echo "follow up" | codex exec resume --last
```

## Task Requirements

Every request should include:

- workspace
- goal
- context
- constraints
- acceptance criteria
- verification commands

## Validation

Codex output is evidence, not truth.

Check:
- changed files
- diff
- test results
- build results
- assumptions

A task is complete only when implementation and verification are both reported.
