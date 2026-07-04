# Editorial Guardrails — DaemonCore Public Content

Version: 1.0
Last Updated: 2025-12-12

This document defines the guardrails for all public-facing DaemonCore content.
All content must pass this checklist before publication.

---

## 1. Core Positioning

### Safe to Say

- DaemonCore is a **governance layer** for multi-agent AI systems
- It operates **beneath orchestration** — not alongside it
- It defines **what agents are allowed to do** (capability envelopes)
- It enforces **safety boundaries** that cannot be bypassed
- It provides **vendor isolation** for multi-provider operation
- It enables **deterministic agent behavior** through structured boot
- It's the **OS-level foundation** for AI systems

### Never Say

- Details of specific enforcement mechanisms
- Implementation specifics (how boundaries are enforced technically)
- Patent-pending features or approaches
- Internal project codenames or timelines
- Competitive claims about specific companies' products
- Revenue projections or business plans
- Anything about pricing or commercial terms

---

## 2. Technical Content Rules

### Safe Technical Topics

- High-level architecture (stack diagrams, layer descriptions)
- Boot sequence concepts (phases, not implementation)
- Safety scaling concepts (Sandbox/Controlled/Dangerous modes)
- Vendor isolation concepts (separation, not mechanisms)
- Multi-agent coordination concepts (handoff, isolation)
- Environment awareness concepts (host classes, profiles)

### Restricted Technical Topics

- CKC (Canonical Kernel Chain) implementation details
- MAX Bus message formats and protocols
- Specific scheduling algorithms
- Lineage verification mechanisms
- Capability envelope enforcement code
- Internal state management structures

### Banned Technical Topics

- Any patent-pending mechanisms
- Any cryptographic or verification approaches
- Any novel coordination algorithms
- Anything marked "INTERNAL" in the kernel docs

---

## 3. Comparison Rules

### Safe Comparisons

- Position DaemonCore in the stack relative to other categories
- Describe what existing tools do well (respectfully)
- Explain where existing approaches stop (factually)
- Show how DaemonCore complements existing tools

### Comparison Don'ts

- No trash talk about competitors
- No claims about competitors' internal systems
- No "better than X" statements
- No claims we can't substantiate publicly
- No disparagement of open-source projects
- No speculation about big tech's internal platforms

---

## 4. Availability & Roadmap Rules

### Safe to Say

- "Kernel specification is public and available for review"
- "The system is under active development"
- "Follow the blog/GitHub for updates"
- "Public materials reflect current direction"

### Never Say

- Specific launch dates or timelines
- Pricing or licensing commitments
- Enterprise availability promises
- Feature commitments for specific dates
- "Coming soon" with dates attached
- Partner or customer names without permission

---

## 5. Publication Checklist

Before any content is published, verify:

### Content Review

- [ ] No implementation details leaked
- [ ] No patent-sensitive mechanisms described
- [ ] No internal codenames or project names
- [ ] No specific timelines or dates promised
- [ ] No competitive trash talk
- [ ] No claims about competitors' internal systems

### Positioning Check

- [ ] Governance layer framing is clear
- [ ] "Beneath orchestration" positioning is maintained
- [ ] "Not an orchestrator/framework" is clear when relevant
- [ ] OS-level foundation messaging is consistent

### Technical Accuracy

- [ ] Stack diagrams show correct layer order
- [ ] No contradictions with existing public content
- [ ] Links to related pages are valid
- [ ] No typos in key terminology (DaemonCore, not Daemon Core in most contexts)

### Legal/IP Safety

- [ ] No patent-pending mechanisms described
- [ ] No novel algorithms exposed
- [ ] No internal documentation quoted
- [ ] No third-party trademarks misused

---

## 6. Terminology Consistency

### Preferred Terms

| Use This | Not This |
|----------|----------|
| DaemonCore | Daemon Core (except in legacy content) |
| governance layer | orchestration layer |
| capability envelope | permissions |
| safety boundaries | safety features |
| vendor isolation | vendor separation |
| boot sequence | initialization |

### Terms to Use Carefully

- **Kernel** — Use when referring to the DaemonCore Kernel specifically
- **Agent** — Always clarify "AI agent" context if ambiguous
- **Orchestration** — Always position as above DaemonCore, not synonymous
- **Safety** — Always emphasize architectural nature, not advisory

---

## 7. Review Process

### For Routine Updates

1. Self-review against this checklist
2. Commit with "content: " prefix
3. Deploy via standard pipeline

### For New Pages or Major Changes

1. Self-review against this checklist
2. Create PR for review
3. Mark with "needs-content-review" label
4. Merge only after approval

### For Sensitive Topics

1. Flag in advance before writing
2. Get guidance on positioning
3. Extended review before publication

---

## 8. Escalation

If uncertain about any content:

1. Check this guardrails document first
2. Review existing published content for precedent
3. If still unclear, flag for review before publishing

When in doubt, leave it out.

---

**Remember:** Our goal is to clearly position DaemonCore as the governance layer
for AI systems without revealing IP-sensitive implementation details. Clarity
over cleverness. Safety over speed.
