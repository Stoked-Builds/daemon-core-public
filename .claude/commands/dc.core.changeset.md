# dc.changeset
- Version: v1.0

Produce a reviewer-ready changeset summary.

Usage:
/dc.changeset intent:"..." paths:"a,b,c" [testing:"..."] [risks:"..."]

Instructions:
- If grounding tooling exists, run it.
- Summarise changes strictly from known context.
- Clearly state what was not verified.

Rules:
- No implied testing.

Output:
- Markdown changeset only