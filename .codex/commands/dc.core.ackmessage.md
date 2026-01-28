# dc.ackmessage (Codex instruction)
- Version: v1.0

Acknowledge or close a message.

## Invoke
- In chat: **“Follow `.daemoncore/codex/commands/dc.ackmessage.md`.”**
- Inline trigger (comments/docstrings): `DC:DC_ACKMESSAGE`

## Parameters
```
/dc.ackmessage role:<role> id:<id> status:ack|done note:"..."
```

## Operating rules (Codex)
- Prefer repo-visible actions (edit files, create patches, update docs).
- If an action requires runtime/kernel/external system access, **do not pretend**—write a `NEEDS RUNTIME` note and specify what output/file you would need.
- Do not invent missing project context; ask for the missing file/path/output.

### Command rules
- Do not assume side effects.

## Procedure
- Discover acknowledgement semantics from the Kernel.
- Apply acknowledgement if permitted.
- Send follow-up only if Kernel requires it.

## Expected output
- Acknowledgement status
- Any follow-up ids

## Notes
- This file is the Codex-equivalent of the original Claude slash command.
