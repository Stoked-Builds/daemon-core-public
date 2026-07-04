# Project Context

## Project Name
DaemonCore Public

## Description
Public-facing repository for DaemonCore — an Autonomous Agent Kernel for Human-AI Collaboration. Contains documentation, marketing websites, and public communications for the DaemonCore project.

## Workspace Ownership & Authority
- Owner: Stoked Builds / Mark Stokes
- This workspace is subordinate to the DaemonCore kernel safety rules.
- Do not assume authority outside this repository without explicit human instruction.

## Tech Stack
- Astro (static site generator)
- TypeScript / JavaScript
- Tailwind CSS
- GitHub Pages (deployment)
- Markdown (documentation)

## Purpose of This Workspace
- Host public documentation explaining DaemonCore concepts and architecture.
- Serve two websites: stux.run (Stux OS umbrella) and daemon.stux.run (DaemonCore).
- Provide onboarding materials for users and developers.
- Anchor public-facing content in a human-owned source of truth.

## Key Directories
- `docs/` — Public markdown documentation
- `website-stux/` — Stux OS website (stux.run)
- `website-daemon/` — DaemonCore website (daemon.stux.run)
- `.github/workflows/` — CI/CD deployment pipelines

## Safety & Boundaries
- Do not modify `.github/workflows/` without explicit human approval.
- Avoid destructive operations unless explicitly requested.
- Treat any credentials or API keys as off-limits.
- When unsure, propose a plan in `.daemoncore/outbox/` instead of changing core project files.
- This is a public repository — be mindful of what content is committed.
