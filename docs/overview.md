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

# What is DaemonCore?

DaemonCore is an **autonomous agent kernel** — a high‑level operating environment that helps AI assistants behave in a more predictable, consistent, and human‑aligned way.

Rather than defining the internals of any AI model, DaemonCore focuses on the structure surrounding them.

## The Challenge Today

AI assistants are powerful, but they often feel:

- **Forgetful** — every conversation starts from zero  
- **Inconsistent** — their behaviour varies between sessions  
- **Unbounded** — it’s not always clear what they should or shouldn’t do  
- **Uncoordinated** — multiple assistants cannot reliably stay aligned  

DaemonCore addresses these issues by providing a simple, shared operating environment.

## How DaemonCore Helps

DaemonCore offers a small set of guiding structures:

### Predictable Start‑Up  
Assistants begin their work with the same basic expectations, ensuring more stable behaviour across sessions and tasks.

### Provider Neutrality  
DaemonCore is designed to support multiple AI providers without leaking details between them.

### Awareness of Context  
Assistants can work with a clearer sense of what project or problem they are helping with, without carrying unnecessary long‑term memory.

### Boundaries and Scope  
DaemonCore puts human control first. Assistants work within defined limits, keeping sensitive or irreversible actions in the hands of the user.

### Lightweight Continuity  
Within reasonable boundaries, assistants can understand the general direction of work and maintain focus from one interaction to the next.

## What DaemonCore Is Not

- Not an AI model  
- Not a chatbot interface  
- Not a prompt library  
- Not tied to any single provider  

Think of it as the conceptual “operating environment” that modern AI assistants have been missing.

## Design Principles

1. **Predictability** — similar inputs should lead to similar behaviour  
2. **Transparency** — assistants operate with clear expectations  
3. **Safety‑first** — human control is central  
4. **Composability** — usable across many workflows  
5. **Human‑centred design** — assistants support, not replace, decision‑making  