# dc.sendmessage (Codex instruction)
- Version: v1.0

Send a message via the DaemonCore MAX bus.

## Invoke
- In chat: **“Follow `.daemoncore/codex/commands/dc.sendmessage.md`.”**
- Inline trigger (comments/docstrings): `DC:DC_SENDMESSAGE`

## Parameters
```
/dc.sendmessage to:<role> topic:<topic> subject:"..." body:"..." [priority:p1|p2|p3]
```

## Operating rules (Codex)
- Prefer repo-visible actions (edit files, create patches, update docs).
- If an action requires runtime/kernel/external system access, **do not pretend**—write a `NEEDS RUNTIME` note and specify what output/file you would need.
- Do not invent missing project context; ask for the missing file/path/output.

### Command rules
- Do not invent defaults.
- Do not send if validation fails.

## Procedure
- Discover MAX bus + message contract from the Kernel.
- Validate required fields using the Kernel contract.
- Send the message to the target role.
- Do not assume routing, queues, or formats.

## Expected output
- Message id
- Target role
- Delivery status

## Notes
- This file is the Codex-equivalent of the original Claude slash command.
