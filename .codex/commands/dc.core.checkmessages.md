# dc.checkmessages (Codex instruction)
- Version: v1.0

List pending messages for a role.

## Invoke
- In chat: **“Follow `.daemoncore/codex/commands/dc.checkmessages.md`.”**
- Inline trigger (comments/docstrings): `DC:DC_CHECKMESSAGES`

## Parameters
```
/dc.checkmessages role:<role> [limit:n]
```

## Operating rules (Codex)
- Prefer repo-visible actions (edit files, create patches, update docs).
- If an action requires runtime/kernel/external system access, **do not pretend**—write a `NEEDS RUNTIME` note and specify what output/file you would need.
- Do not invent missing project context; ask for the missing file/path/output.

### Command rules
- Do not assume storage or folders.
- Do not summarise bodies unless asked.

## Procedure
- Ask the Kernel how to enumerate inbound messages.
- Retrieve unread/unprocessed messages only.
- Respect Kernel ordering rules.

## Expected output
- id, from, topic, priority, subject

## Notes
- This file is the Codex-equivalent of the original Claude slash command.
