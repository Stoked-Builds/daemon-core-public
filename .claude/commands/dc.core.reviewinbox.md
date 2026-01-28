# dc.reviewinbox
- Version: v1.0

Open a received message.

Usage:
/dc.reviewinbox role:<role> [id:<id>] [index:n]

Instructions:
- Ask the Kernel how to retrieve messages.
- Load and render the message faithfully.
- Do not mutate or acknowledge.

Rules:
- No schema assumptions.

Output:
- Message metadata
- Message body