---
title: Frequently Asked Questions
description: Common questions about DaemonCore and multi-agent systems.
order: 3
---

# Frequently Asked Questions

## General

### What is DaemonCore?

DaemonCore is a deterministic foundation for multi-agent intelligence. It provides the structural layer that enables multiple AI agents to operate with precision, coordination, and safety.

### Is DaemonCore an AI model?

No. DaemonCore is not an AI model or assistant. It's an orchestration and governance layer that AI models (like Claude, GPT, Gemini) operate within. Think of it as the operating system for multi-agent workflows.

### What problems does DaemonCore solve?

- **Coordination** - Multiple agents working together without collision
- **Determinism** - Predictable, reproducible behaviour
- **Safety** - Configurable autonomy with approval gates
- **Vendor isolation** - Clean separation between different AI providers

## Technical

### What's a Kernel in DaemonCore?

The kernel is the core specification layer. It defines:

- What agents are allowed to do (capability ceilings)
- How agents must behave (safety invariants)
- How agents identify themselves (identity framework)
- How agents coordinate (exchange bus protocol)

The kernel is declarative configuration, not executable code.

### How does boot sequence work?

Agents follow a strict 9-phase boot sequence:

1. Kernel load
2. Identity handshake
3. Environment reporting
4. Profile application
5. Global context load
6. Vendor persona load
7. Project boot
8. Session resume
9. Modulation (optional)

Each phase must complete before the next begins.

### What's the difference between Sandbox, Controlled, and Dangerous modes?

- **Sandbox** - Read-only operations, all writes require approval
- **Controlled** - Normal operations, destructive actions require approval
- **Dangerous** - Full autonomy, audit-only (no blocking gates)

### Can I use DaemonCore with my own AI models?

Yes. DaemonCore's vendor abstraction layer supports multiple AI providers. You define vendor-specific persona and init files, and the kernel handles the rest.

## Development

### Is DaemonCore open source?

The kernel specification is public. See the [GitHub repository](https://github.com/stux-os/daemon-core-public) for details.

### How do I contribute?

Contributions welcome. Start by reading the kernel specification, then open issues or pull requests on GitHub.

### Where can I get help?

- Check this FAQ
- Read the [Architecture Overview](/daemon/architecture)
- Open an issue on GitHub
