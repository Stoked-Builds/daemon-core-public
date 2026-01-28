# dc.handoff
- Version: v1.0

Hand work to another role.

Usage:
/dc.handoff to:<role> subject:"..." did:"..." next:"..." blockers:"..."

Instructions:
- Discover handoff rules from the Kernel.
- If validation tooling exists, run it.
- Send a factual handoff (done, next, blockers).

Rules:
- No claimed completion unless complete.

Output:
- Handoff id
- Delivery confirmation