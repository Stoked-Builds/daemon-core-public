---
title: Architecture Overview
description: Technical architecture of the DaemonCore kernel and its components.
order: 2
---

# Architecture Overview

DaemonCore follows a layered architecture designed for deterministic execution and safe multi-agent coordination.

## System Layers

### Kernel Layer

The kernel defines what a DaemonCore host is allowed to be and do:

- **Lineage & CKC** - Canonical Kernel Chain, module ancestry, integrity metadata
- **Safety invariants** - Non-negotiable rules all execution must respect
- **Capability envelope** - Maximum capabilities; runtime can only reduce, never increase
- **Identity framework** - Structure for identity overlays as behavioural modifiers
- **Governance limits** - What governance can restrict, and what it cannot override

### Runtime Layer

The runtime performs execution within kernel constraints:

- MAX bus handlers and message routing
- Scheduler implementation
- IPC utilities
- Tool execution and sandboxing

### Agent Layer

Agents operate within the capability envelope:

- Receive structured instructions via MAX Bus
- Produce outputs (plans, code, patches, analyses)
- Never directly access kernel state or queues
- Reason, plan, and generate deterministically

## Boot Sequence

DaemonCore follows a strict boot sequence:

1. **Kernel Load** - Load kernel.md and boot.md
2. **Identity Handshake** - Declare vendor, model, version
3. **Environment Report** - Report host class, network, sandbox level
4. **Profile Application** - Apply host profile and safety scaling
5. **Context Load** - Load tone, memory, global context
6. **Vendor Load** - Load vendor-scoped persona
7. **Project Boot** - Load project-specific configuration
8. **Session Resume** - Check for and resume existing session

## Safety Scaling

Safety scales based on environment:

| EXECUTION_MODE | Autonomy | Approval Gates |
|----------------|----------|----------------|
| Sandbox | Low | All operations require approval |
| Controlled | Medium | Destructive operations require approval |
| Dangerous | High | Audit-only, no blocking gates |

## Multi-Agent Coordination

Agents coordinate via the Kernel Exchange Bus:

- Messages written to `exchange/queues/{agent}/`
- Session locks prevent collisions
- Transcripts archived for audit
- State updates propagate cleanly
