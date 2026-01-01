---
title: Getting Started
description: Introduction to DaemonCore and initial setup instructions.
order: 1
---

# Getting Started with DaemonCore

DaemonCore is the deterministic foundation beneath multi-agent intelligence. This guide walks you through the initial concepts and setup.

## What is DaemonCore?

DaemonCore is the governance layer beneath orchestration. It defines what agents are allowed to do, validates their outputs against protocols, and enforces boundaries structurally. It provides:

- **Deterministic execution** - Same inputs produce same outputs
- **Multi-agent coordination** - Agents work together without collision
- **Safety scaling** - Configurable autonomy and approval gates
- **Vendor isolation** - Clean separation between AI model providers

## Core Concepts

### The Kernel

The kernel is the core governance layer. It handles:

- Boot sequences and identity handshakes
- Environment reporting and profile application
- Vendor-scoped persona loading
- Session state management

### Agents

Agents are the working units within DaemonCore. Each agent:

- Declares its vendor and model identity
- Operates within a capability envelope
- Communicates via structured messaging
- Respects safety constraints and approval gates

### Profiles

Profiles define agent behaviour for specific contexts:

- **Host profiles** - Hardware-specific configurations (Laptop, Pi, Gaming-PC, Supercloud)
- **Role profiles** - Task-specific behaviours (developer, architect, sysadmin)

## Next Steps

- Read the [Architecture Overview](/daemon/architecture) to understand system structure
- Explore the [FAQ](/daemon/faq) for common questions
- Check the [Blog](/daemon/blog) for updates and deep dives
