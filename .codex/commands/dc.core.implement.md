---
description: First-party implementation runner using DaemonCore cognition backlog (NOT Speckit). Implements one or more work items by ID, requires a .prompt file per task, and updates backlog status from todo -> in_progress -> review.
version: v1.0
vendor: codex
command: dc.core.implement
---

# dc.core.implement (Codex)

## Input

Arguments (one or more work item IDs):

- `$ARGUMENTS`

If `$ARGUMENTS` is empty, STOP and ask:

> Which work item IDs should I implement? (e.g. FEATURE-123-US-01-T02 FEATURE-123-US-01-T03)

## Operating rules (Codex)

- Prefer repo-visible actions (edit files, create patches).
- If runtime access is required, do not pretend — write a `NEEDS RUNTIME` note with exact commands and expected output.
- Do not invent missing context.

## Hard rules

- Use the **DaemonCore cognition backlog** as the source of truth (do not use Speckit).
- Work **one task at a time**.
- For each task:
  1) You MUST find its `.prompt` file before starting.
  2) You MUST set status to `in_progress` when starting.
  3) You MUST set status to `review` when finished and ready for code review.
  4) You MUST NEVER set status to `done` unless explicit approval is recorded by a reviewer agent or the operator.

If you cannot follow any rule above, STOP and tell the operator what is missing.

## Files and locations (project-local)

Backlog (prefer folder form; fall back if needed):
- `.daemoncore/cognition/backlog/backlog.json`
- `.daemoncore/cognition/backlog.json` (fallback)

Task prompts:
- `.daemoncore/cognition/prompts/ideas/<TASK_ID>.prompt`

If the exact `<TASK_ID>.prompt` file is not present:
- Search `.daemoncore/cognition/prompts/` recursively for `<TASK_ID>.prompt`
- If still not found: STOP and tell the operator: “Missing .prompt for <TASK_ID> — cannot proceed.”

## Procedure

### Step 1 — Load backlog

1. Open the backlog JSON (paths above).
2. Parse it and build an index by work item `id`.
3. Validate all requested IDs exist.

If an ID is not found, STOP and list the missing IDs.

### Step 2 — Resolve requested work into tasks

For each provided ID:
- If it is a **task**: include it.
- If it is a **story/feature/epic**: include its descendant tasks (preserve backlog order).

If the resolution results in zero tasks, STOP and explain why.

### Step 3 — Execute tasks sequentially

For each task in order:

1) Locate prompt file  
- Find `.daemoncore/cognition/prompts/ideas/<TASK_ID>.prompt` (or recursive fallback).
- Read it fully.
- If missing: STOP immediately (do not change status).

2) Mark `in_progress`  
- Update the task’s status in backlog.json to `in_progress`.
- Write the updated backlog.json to disk immediately.

3) Implement  
- Follow the `.prompt` content as the primary instruction set.
- Make changes in the repo (minimal, deterministic).
- Add/adjust tests as required by the prompt.

4) Finish + mark `review`  
- When the task is complete and ready for review, update status to `review`.
- Write backlog.json immediately.
- Provide a concise summary: files changed + what to review.

## Output expectations

- If arguments missing: ask for IDs.
- If any prompt missing: report missing prompt(s) and stop.
- After each task: short summary + status.
- End: list tasks now in `review` and remind that `done` requires approval.
