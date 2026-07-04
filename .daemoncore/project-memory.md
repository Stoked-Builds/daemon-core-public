# Project Memory

This file captures long-lived, repo-specific conventions that agents should respect.

## Stable Conventions

### Branch Naming
- `main` — primary branch, deploys to production
- `feature/<short-name>` — new features or documentation
- `bugfix/<description>` — bug fixes
- `docs/<topic>` — documentation-only changes

### Commit Style
- Use clear, descriptive commit messages
- Prefer present tense ("Add feature" not "Added feature")
- Reference issues where applicable

### Code Style
- TypeScript/JavaScript: Follow existing patterns in Astro components
- Markdown: Use UK English spelling
- CSS: Tailwind utility classes preferred

## Domain Concepts

### DaemonCore
The autonomous agent kernel — the core product this repo documents and markets.

### Stux OS
The umbrella brand/platform that DaemonCore operates within.

### Kernel
The declarative metadata and invariants layer that governs agent behaviour.

### CKC (Canonical Kernel Chain)
The lineage and integrity chain that ensures kernel consistency.

### Vendor
An AI provider (Claude, GPT, Gemini, etc.) that can operate under DaemonCore governance.

## Testing & Quality

### Local Development
```bash
# Stux OS site
cd website-stux && npm install && npm run dev

# DaemonCore site
cd website-daemon && npm install && npm run dev
```

### Quality Gates
- Sites must build without errors before deployment
- Links should be validated
- Content should be proofread for accuracy

## Agent Usage Notes

- Documentation changes should align with the public messaging strategy.
- When writing about DaemonCore features, reference existing docs for consistency.
- Prefer proposals in `.daemoncore/outbox/` for significant content changes.
- The `docs/patent-summary.md` file requires human review for any modifications.
