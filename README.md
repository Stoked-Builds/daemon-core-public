# DaemonCore

**An Autonomous Agent Kernel for Human-AI Collaboration**

DaemonCore is a structured operating environment that enables AI agents to work alongside humans with clarity, safety, and predictability. It provides the scaffolding that transforms raw AI capabilities into disciplined, context-aware assistants that respect boundaries and maintain focus.

## Features

- **Persistent Context** — Agents understand your projects, preferences, and working style across sessions
- **Layered Boot Sequence** — Deterministic initialisation ensures consistent behaviour
- **Vendor Isolation** — Multiple AI providers (Claude, GPT, Gemini) can operate without cross-contamination
- **Safety Scaling** — Automatic adjustment of permissions based on environment trust levels
- **Multi-Agent Coordination** — Structured handoffs between specialised agents

## Documentation

- [Overview](./docs/overview.md) — Understand the core concepts
- [Architecture](./docs/architecture.md) — See how the pieces fit together
- [FAQ](./docs/faq.md) — Common questions answered
- [Patent Summary](./docs/patent-summary.md) — What the provisional filing covers

## Project Structure

```
daemon-core-public/
├── docs/                  # Public documentation (markdown)
│   ├── index.md
│   ├── overview.md
│   ├── architecture.md
│   ├── patent-summary.md
│   ├── faq.md
│   └── blog/
├── website-stux/          # stux.run — Stux OS umbrella site
│   ├── src/
│   └── public/
├── website-daemon/        # daemon.stux.run — DaemonCore site
│   ├── src/
│   └── public/
└── .github/
    └── workflows/
        ├── deploy-stux.yml
        └── deploy-daemon.yml
```

## Websites

This repo hosts two Astro-based websites:

| Site | Domain | Source | Branch |
|------|--------|--------|--------|
| Stux OS | [stux.run](https://stux.run) | `website-stux/` | `gh-pages-stux` |
| DaemonCore | [daemon.stux.run](https://daemon.stux.run) | `website-daemon/` | `gh-pages-daemon` |

### Local Development

```bash
# Stux OS site
cd website-stux && npm install && npm run dev

# DaemonCore site
cd website-daemon && npm install && npm run dev
```

### Deployment

Each site deploys automatically when changes are pushed to `main`:
- Changes to `website-stux/` trigger deployment to `gh-pages-stux`
- Changes to `website-daemon/` trigger deployment to `gh-pages-daemon`

## Status

DaemonCore is under active development. The kernel specification is stabilising, with the core boot protocol and safety framework now defined.

A provisional patent application covering the kernel architecture has been filed.

## Licence

All rights reserved. Commercial licensing terms will be established as the project matures.

---

*The future of AI assistance is structured, safe, and human-centred.*