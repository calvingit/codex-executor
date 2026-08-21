# Model Selection Policy

## Principles

Model selection is a runtime strategy, not part of the Codex executor contract.

The executor should optimize:

1. Task success rate
2. Cost efficiency
3. Latency
4. Reliability

Do not always select the strongest model.

The runtime environment maps model profiles to concrete model names.

Example:

```yaml
fast: <fast coding model>
balanced: <default coding model>
deep: <reasoning coding model>
```

---

# Profiles

## fast

Use for:

- simple code lookup
- documentation changes
- formatting
- small deterministic edits
- simple test generation

Reasoning:

- low
- medium

---

## balanced

Default profile.

Use for:

- feature implementation
- bug fixes
- normal refactoring
- test writing
- code review

Reasoning:

- medium
- high when needed

---

## deep

Use for:

- architecture changes
- complex debugging
- large migrations
- concurrency issues
- unfamiliar codebases
- repeated failed attempts

Reasoning:

- high
- xhigh only when justified

---

# Reasoning Escalation

Start with the lowest sufficient reasoning level.

Increase reasoning when:

- root cause is unclear
- previous implementation failed
- multiple components interact
- correctness risk is high

Do not increase reasoning only because a task is large. Better context and verification are often more valuable.

---

# Model Escalation

Recommended escalation:

```
fast/balanced
    |
    | blocked
    v
balanced/deep
    |
    | still blocked
    v
human review or additional investigation
```

Do not blindly retry with a stronger model without improving context.

---

# Custom Model Mapping

Different environments may map profiles differently.

Example:

```yaml
fast: luna
balanced: terra
deep: sol
```

Another environment may use different model names.

The skill should depend on capability profiles, not model aliases.
