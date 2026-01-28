# dc.changeset (Codex instruction)
- Version: v1.0

Produce a reviewer-ready changeset summary.

## Invoke
- In chat: **“Follow `.daemoncore/codex/commands/dc.changeset.md`.”**
- Inline trigger (comments/docstrings): `DC:DC_CHANGESET`

## Parameters
```
/dc.changeset intent:"..." paths:"a,b,c" [testing:"..."] [risks:"..."]
```

## Operating rules (Codex)
- Prefer repo-visible actions (edit files, create patches, update docs).
- If an action requires runtime/kernel/external system access, **do not pretend**—write a `NEEDS RUNTIME` note and specify what output/file you would need.
- Do not invent missing project context; ask for the missing file/path/output.

### Command rules
- No implied testing.

## Procedure
- If grounding tooling exists, run it.
- Summarise changes strictly from known context.
- Clearly state what was not verified.

## Expected output
- Markdown changeset only

## Notes
- This file is the Codex-equivalent of the original Claude slash command.
