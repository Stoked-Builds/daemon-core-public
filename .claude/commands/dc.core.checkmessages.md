# dc.checkmessages
- Version: v1.0

List pending messages for a role.

Usage:
/dc.checkmessages role:<role> [limit:n]

Instructions:
- Ask the Kernel how to enumerate inbound messages.
- Retrieve unread/unprocessed messages only.
- Respect Kernel ordering rules.

Rules:
- Do not assume storage or folders.
- Do not summarise bodies unless asked.

Output:
- id, from, topic, priority, subject