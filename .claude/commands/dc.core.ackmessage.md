# dc.ackmessage
- Version: v1.0

Acknowledge or close a message.

Usage:
/dc.ackmessage role:<role> id:<id> status:ack|done note:"..."

Instructions:
- Discover acknowledgement semantics from the Kernel.
- Apply acknowledgement if permitted.
- Send follow-up only if Kernel requires it.

Rules:
- Do not assume side effects.

Output:
- Acknowledgement status
- Any follow-up ids