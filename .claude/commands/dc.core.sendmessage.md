# dc.sendmessage
- Version: v1.0

Send a message via the DaemonCore MAX bus.

Usage:
/dc.sendmessage to:<role> topic:<topic> subject:"..." body:"..." [priority:p1|p2|p3]

Instructions:
- Discover MAX bus + message contract from the Kernel.
- Validate required fields using the Kernel contract.
- Send the message to the target role.
- Do not assume routing, queues, or formats.

Rules:
- Do not invent defaults.
- Do not send if validation fails.

Output:
- Message id
- Target role
- Delivery status