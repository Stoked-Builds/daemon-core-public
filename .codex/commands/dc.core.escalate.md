# dc.escalate (Codex instruction)
- Version: v1.0

Escalate an issue for decision.

## Invoke
- In chat: **“Follow `.daemoncore/codex/commands/dc.escalate.md`.”**
- Inline trigger (comments/docstrings): `DC:DC_ESCALATE`

## Parameters
```
/dc.escalate to:<role> subject:"..." decision:"..." context:"..." [priority:p1|p2|p3]
```

## Operating rules (Codex)
- Prefer repo-visible actions (edit files, create patches, update docs).
- If an action requires runtime/kernel/external system access, **do not pretend**—write a `NEEDS RUNTIME` note and specify what output/file you would need.
- Do not invent missing project context; ask for the missing file/path/output.

### Command rules
- One decision per escalation.
- No invented urgency.

## Procedure
- Discover escalation rules from the Kernel.
- If boundary tooling exists, run it.
- Send a concise escalation (situation, impact, decision).

## Expected output
- Escalation id
- Delivery confirmation

## Notes
- This file is the Codex-equivalent of the original Claude slash command.
