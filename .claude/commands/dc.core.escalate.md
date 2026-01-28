# dc.escalate
- Version: v1.0

Escalate an issue for decision.

Usage:
/dc.escalate to:<role> subject:"..." decision:"..." context:"..." [priority:p1|p2|p3]

Instructions:
- Discover escalation rules from the Kernel.
- If boundary tooling exists, run it.
- Send a concise escalation (situation, impact, decision).

Rules:
- One decision per escalation.
- No invented urgency.

Output:
- Escalation id
- Delivery confirmation