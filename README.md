# Codex Executor

A portable skill for using Codex CLI as a coding execution sub-agent.

## Purpose

Codex Executor defines how other AI agents delegate software engineering tasks to Codex CLI.

Supported workflows:

- code analysis
- implementation
- debugging
- refactoring
- testing
- code review

## Architecture

```text
User
 |
 v
Orchestrator Agent
 |
 v
Codex Executor
 |
 v
Codex CLI
 |
 v
Repository
```

## Installation

Copy this skill directory into your agent skills directory.

## Usage

Example:

```bash
codex exec --sandbox workspace-write --full-auto "Implement the requested change and run tests"
```

## Design Principles

- Codex is an execution agent, not the final authority.
- Context should be explicitly handed off.
- Completion requires verification evidence.
- Failed sessions should resume before restarting.

## Structure

```
.
├── SKILL.md
├── references
│   ├── handoff.md
│   ├── lifecycle.md
│   ├── prompt.md
│   └── verification.md
└── scripts
    └── codex-run.sh
```
