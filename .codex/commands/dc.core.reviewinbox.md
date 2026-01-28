# dc.reviewinbox (Codex instruction)
- Version: v1.0

Open a received message.

## Invoke
- In chat: **“Follow `.daemoncore/codex/commands/dc.reviewinbox.md`.”**
- Inline trigger (comments/docstrings): `DC:DC_REVIEWINBOX`

## Parameters
```
/dc.reviewinbox role:<role> [id:<id>] [index:n]
```

## Operating rules (Codex)
- Prefer repo-visible actions (edit files, create patches, update docs).
- If an action requires runtime/kernel/external system access, **do not pretend**—write a `NEEDS RUNTIME` note and specify what output/file you would need.
- Do not invent missing project context; ask for the missing file/path/output.

### Command rules
- No schema assumptions.

## Procedure
- Ask the Kernel how to retrieve messages.
- Load and render the message faithfully.
- Do not mutate or acknowledge.

## Expected output
- Message metadata
- Message body

## Notes
- This file is the Codex-equivalent of the original Claude slash command.
