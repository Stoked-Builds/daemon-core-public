# dc.handoff (Codex instruction)
- Version: v1.0

Hand work to another role.

## Invoke
- In chat: **“Follow `.daemoncore/codex/commands/dc.handoff.md`.”**
- Inline trigger (comments/docstrings): `DC:DC_HANDOFF`

## Parameters
```
/dc.handoff to:<role> subject:"..." did:"..." next:"..." blockers:"..."
```

## Operating rules (Codex)
- Prefer repo-visible actions (edit files, create patches, update docs).
- If an action requires runtime/kernel/external system access, **do not pretend**—write a `NEEDS RUNTIME` note and specify what output/file you would need.
- Do not invent missing project context; ask for the missing file/path/output.

### Command rules
- No claimed completion unless complete.

## Procedure
- Discover handoff rules from the Kernel.
- If validation tooling exists, run it.
- Send a factual handoff (done, next, blockers).

## Expected output
- Handoff id
- Delivery confirmation

## Notes
- This file is the Codex-equivalent of the original Claude slash command.
