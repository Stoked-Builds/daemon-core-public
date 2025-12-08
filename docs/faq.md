# Frequently Asked Questions

## What is DaemonCore?

DaemonCore is an autonomous agent kernel — a structured framework that governs how AI agents initialise, behave, and collaborate. It provides the "operating system" layer that transforms raw AI capabilities into disciplined, context-aware assistants.

## Is DaemonCore an AI model?

No. DaemonCore works *with* existing AI models (Claude, GPT, Gemini, etc.). It provides the governance and context layer that makes these models more useful in structured workflows. Think of it as the difference between a CPU and an operating system.

## Which AI providers does DaemonCore support?

DaemonCore is designed to be vendor-agnostic. The current implementation includes support for:

- Anthropic Claude (all variants)
- OpenAI GPT models (including o1/o3)
- Google Gemini
- DeepSeek

The vendor isolation system allows new providers to be added without affecting existing configurations.

## Do I need to modify my AI provider setup?

No. DaemonCore operates as a context layer that gets loaded alongside your normal AI interactions. It doesn't require changes to API integrations or model configurations. It works by providing structured prompts and context that shape agent behaviour.

## Is DaemonCore open source?

The kernel specification and public documentation are available for review. The project uses a dual-licensing approach: open for evaluation and non-commercial use, with commercial licensing available for production deployments.

## What's the "boot sequence" everyone mentions?

The boot sequence is DaemonCore's initialisation protocol. When an agent starts, it loads context in a specific order:

1. Kernel rules (safety, identity, environment)
2. Global context (tone, memory, preferences)
3. Vendor-specific configuration
4. Role profile (developer, architect, etc.)
5. Project-specific settings

This layered loading ensures consistent, predictable behaviour regardless of which AI provider is being used.

## How does the safety system work?

DaemonCore implements "safety scaling" — the idea that agent permissions should match the trust level of the environment. A tightly sandboxed environment gets restricted permissions. A trusted development workstation gets more autonomy. This is controlled through two dimensions:

- **Sandbox Level** (Hard/Medium/Soft) — What operations are physically possible
- **Execution Mode** (Sandbox/Controlled/Dangerous) — How much approval is required

## Can multiple agents work together?

Yes. DaemonCore includes a multi-agent coordination system with:

- An exchange bus for passing messages between agents
- Session locks to prevent conflicts
- Handover protocols for transferring context

This enables workflows where different specialised agents handle different aspects of a task.

## What problem does this actually solve?

The core problem is that AI assistants are stateless and context-poor. Every conversation starts from scratch. DaemonCore solves this by:

- Maintaining persistent context across sessions
- Ensuring consistent agent behaviour
- Providing appropriate safety boundaries
- Enabling structured multi-agent workflows

## How do I get started?

Start by reading the [Overview](./overview.md) to understand the core concepts, then review the [Architecture](./architecture.md) to see how the pieces fit together. The kernel specification provides the full technical detail for implementers.

# Frequently Asked Questions

## What is DaemonCore?

DaemonCore is a high‑level operating environment that helps AI assistants behave more consistently and predictably across different types of work. It provides shared structure, not implementation details.

## Is DaemonCore an AI model?

No. DaemonCore works alongside existing AI models. It doesn’t alter their internals — it simply provides the structure around them.

## Which AI providers does DaemonCore support?

DaemonCore is designed to be vendor‑agnostic. It can work with different providers without preferring or leaking information across them.

## Do I need to change my AI integrations?

No. DaemonCore does not replace your integrations. It complements them by offering a structured environment for assistants to operate in.

## What is the DaemonCore “start‑up process”?

Instead of improvising from a blank prompt, assistants begin with a simple, predictable foundation: who they’re helping, what they’re focused on, and what the broad expectations are.

## How does DaemonCore handle safety?

DaemonCore emphasises scope and boundaries. Assistants are encouraged to stay within their designated role, keeping humans in control of important decisions.

## Can multiple assistants work together?

Yes. DaemonCore supports scenarios where different assistants operate on the same stream of work, providing enough structure to avoid conflict and maintain alignment.

## Is DaemonCore open source?

The concepts and documentation are publicly available. Licensing for commercial use will be clarified as the project matures.

## What problem does this actually solve?

It helps assistants behave less like isolated chat sessions and more like stable participants in ongoing work.