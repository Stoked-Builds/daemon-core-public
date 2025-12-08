# What is DaemonCore?

DaemonCore is an **autonomous agent kernel** — a structured framework that governs how AI agents boot, behave, and collaborate within a human's working environment.

## The Problem

Modern AI assistants are powerful but chaotic:

- **No persistent memory** — Every session starts fresh
- **No consistent identity** — Behaviour varies unpredictably
- **No safety boundaries** — Agents can overreach without guardrails
- **No coordination** — Multiple agents can't work together coherently

## The Solution

DaemonCore provides a **kernel layer** that sits between raw AI capabilities and your projects. Think of it as an operating system for AI agents.

### Core Concepts

**Boot Sequence**
Every agent follows a deterministic boot sequence that loads context in layers: kernel rules, then global preferences, then vendor-specific behaviour, then project configuration. This ensures consistent, predictable agent behaviour.

**Vendor Isolation**
Different AI providers (Anthropic's Claude, OpenAI's GPT, Google's Gemini) have different capabilities and quirks. DaemonCore isolates vendor-specific configuration, preventing cross-contamination while enabling seamless switching.

**Environment Reporting**
Agents report their execution context at boot: What hardware are they running on? What network access do they have? What tools are available? This enables adaptive behaviour — an agent on a constrained device behaves differently than one with full resources.

**Safety Scaling**
Based on the execution environment, DaemonCore automatically adjusts what operations require approval. High-trust environments get more autonomy. Unknown or constrained environments get tighter guardrails.

**Session State**
Context persists across interactions. Agents can resume where they left off, remember project structure, and maintain working memory within defined boundaries.

## What DaemonCore Is Not

- **Not an AI model** — It works with existing models (Claude, GPT, etc.)
- **Not a chatbot framework** — It's infrastructure, not UI
- **Not a prompt library** — It's a runtime governance layer
- **Not vendor-specific** — It's designed for multi-vendor environments

## Design Philosophy

1. **Determinism** — Same inputs produce same behaviour
2. **Transparency** — Agents declare their state and capabilities
3. **Safety-first** — Restrictions are the default; permissions are earned
4. **Composability** — Components can be mixed and extended
5. **Human-in-the-loop** — Critical decisions always involve humans
