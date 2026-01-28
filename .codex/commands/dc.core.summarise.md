# dc.summarise (Codex instruction)
- Version: v1.0

Summarise recent messages.

## Invoke
- In chat: **“Follow `.daemoncore/codex/commands/dc.summarise.md`.”**
- Inline trigger (comments/docstrings): `DC:DC_SUMMARISE`

## Parameters
```
/dc.summarise role:<role> [topic:<topic>] [limit:n]
```

## Operating rules (Codex)
- Prefer repo-visible actions (edit files, create patches, update docs).
- If an action requires runtime/kernel/external system access, **do not pretend**—write a `NEEDS RUNTIME` note and specify what output/file you would need.
- Do not invent missing project context; ask for the missing file/path/output.

### Command rules
- No inference beyond message content.

## Procedure
- Ask the Kernel for recent messages.
- Extract only stated information.
- Produce an action-oriented summary.

## Expected output
- Grouped summary
- Explicit next actions

## Notes
- This file is the Codex-equivalent of the original Claude slash command.
