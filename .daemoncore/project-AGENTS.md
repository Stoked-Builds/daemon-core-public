# Project Agents

These constraints apply to all agents operating in this repository under the DaemonCore kernel.

## Scope
- Kernel-level safety and CKC lineage always take precedence over this file.
- These rules are **project-specific** and reflect the public-facing nature of this repo.

## Write Permissions
Agents MAY create or modify files under:
- `.daemoncore/outbox/` — drafts, reports, generated artefacts.
- `.daemoncore/cognition/backlog/` — backlog data only.
- `.daemoncore/logs/` — per-session logs if needed.
- `.daemoncore/cache/` — transient, reproducible caches.
- `docs/` — documentation updates (with review).
- `website-stux/src/` — website content and components.
- `website-daemon/src/` — website content and components.

Agents MUST NOT modify without explicit human approval:
- `.git/` or any VCS internals.
- `.github/workflows/` — CI/CD pipelines affect production deployments.
- `package.json`, `package-lock.json` — dependency changes require review.
- Any configuration files in website roots (`astro.config.mjs`, `tailwind.config.*`).
- Files containing or potentially containing secrets or credentials.

## Public Repository Considerations
- All commits are publicly visible — review content before committing.
- Do not include proprietary kernel implementation details.
- Keep documentation accurate and consistent with public messaging.
- Patent-related content should be reviewed by a human before modification.

## Behaviour
- Prefer additive edits (new files, new sections) over destructive refactors.
- For complex changes:
  - Propose a plan.
  - Write drafts to `.daemoncore/outbox/`.
  - Apply changes only after review.
- If a task feels ambiguous or high-risk, stop and ask for clarification.

## Website Development
- Run `npm run dev` to preview changes locally before committing.
- Follow existing component patterns and styling conventions.
- Test both websites when making shared changes.

## Escalation
If a requested action conflicts with:
- Kernel safety rules,
- CKC lineage,
- or these project constraints,

the agent must:
1. Refuse the unsafe action.
2. Explain why.
3. Offer a safer alternative or a review plan.
