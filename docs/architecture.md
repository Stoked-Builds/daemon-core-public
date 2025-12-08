# DaemonCore Architecture

This document describes the high-level architecture of DaemonCore. For detailed specifications, refer to the kernel documentation.

## Layered Context Model

DaemonCore organises context in distinct layers, loaded in sequence during boot:

```
Layer 0: BIOS (Invocation trigger)
Layer 1: Global Bootloader
Layer 2: Kernel (Core rules and protocols)
Layer 3: Core Context (Tone, Memory, Global settings)
Layer 4: Vendor Persona (Claude, Codex, Gemini, etc.)
Layer 5: Role Profile (Developer, Architect, etc.)
Layer 6: Project Configuration
Layer 7: Runtime Execution
```

Each layer can extend but not override layers above it. This creates predictable, auditable agent behaviour.

## Key Components

### Kernel

The kernel defines:

- **Boot protocol** — How agents initialise
- **Identity handshake** — How agents declare who they are
- **Environment reporting** — How agents describe their context
- **Safety scaling** — How permissions adjust to environment
- **Vendor resolution** — How agent-specific config is loaded

### Vendor System

Each AI provider has isolated configuration:

```
vendors/
  claude/
    persona.md
    init.md
    capabilities.md
  codex/
    persona.md
    init.md
  gemini/
    ...
```

Agents load ONLY from their designated vendor directory. Cross-vendor loading is prohibited.

### Profile System

Profiles define role-based behaviour:

- **Developer** — Implementation-focused, code-centric
- **Architect** — Design-focused, systems-thinking
- **SysAdmin** — Operations-focused, infrastructure-aware

Profiles define WHAT agents do. Personas define HOW they think.

### Environment Schema

Agents report eight environment dimensions:

| Field | Values | Purpose |
|-------|--------|---------|
| HOST_CLASS | Pi, Laptop, Gaming-PC, Supercloud | Hardware capability |
| NETWORK_ACCESS | None, Limited, Full | Connectivity |
| SANDBOX_LEVEL | Hard, Medium, Soft | Security posture |
| EXECUTION_MODE | Sandbox, Controlled, Dangerous | Autonomy level |
| TOOLING | [shell, fs, http, git, ...] | Available tools |
| COST_SENSITIVITY | Low, Medium, High | Resource awareness |
| LATENCY_PREFERENCE | Speed, Balanced, Quality | Performance vs depth |
| BOOT_SOURCE | Local, Network, Hybrid | Config origin |

### Safety Matrix

The combination of SANDBOX_LEVEL and EXECUTION_MODE determines what operations are permitted:

- **Hard + Sandbox** — Read-only analysis only
- **Medium + Controlled** — Standard development (default)
- **Soft + Dangerous** — Maximum capability with audit logging

### Session State

DaemonCore maintains session state including:

- Current project and branch
- Active task context
- Pending clarifications
- Working memory

This enables session resume and context continuity.

## Multi-Agent Coordination

DaemonCore supports multiple agents working together via:

- **Exchange bus** — Filesystem-based message passing
- **Session locks** — Prevent concurrent conflicting operations
- **Handover protocol** — Structured context transfer between agents

## Extension Points

DaemonCore is designed for extension:

- **Custom profiles** for domain-specific roles
- **Project-level boot files** for repo-specific config
- **Modulation system** for delivery style adjustments
- **Enterprise overrides** for organisational policies

# DaemonCore Architecture

This document provides a high‑level description of the conceptual architecture behind DaemonCore. It focuses on the ideas rather than the implementation.

## A Layered Model

DaemonCore encourages assistants to think within a simple structure:

1. **Basic rules** — foundational expectations and behaviour  
2. **High‑level preferences** — broad human guidance  
3. **Provider neutrality** — model‑specific quirks stay contained  
4. **Roles and focus** — what the assistant is helping with  
5. **Project context** — the direction of work  
6. **Execution** — producing useful output within scope  

These layers establish clarity without revealing system internals.

## Key Concepts

### Shared Foundations  
All assistants begin from the same predictable starting point.

### Provider Separation  
Different AI providers operate without crossing signals.

### Roles  
Assistants adopt roles such as “developer”, “architect”, or “research helper” to guide tone and priorities.

### Human‑Centred Boundaries  
Assistants operate within well‑defined limits to preserve human control.

### Lightweight Continuity  
Assistants maintain enough context to stay on‑track without storing sensitive long‑term information.

## Multi‑Assistant Collaboration

DaemonCore supports workflows where multiple assistants may contribute across time. The goal is coordination, not complex orchestration.

## Extensibility

DaemonCore can be extended with:

- Custom roles  
- Workspace‑level guidance  
- Organisation‑specific preferences  

All without altering the foundational principles.