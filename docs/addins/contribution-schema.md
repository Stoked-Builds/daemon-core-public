# Add-in Contribution Schema v1

This document describes the contribution schema for DaemonCore add-ins. Contributions are declarative payloads that add-ins use to extend the platform without executing code.

## Overview

Add-ins declare contributions in their manifest.json under the `contributions` key. Each contribution type has a specific schema and is processed by the runtime at install time.

## Manifest Integration

```json
{
  "id": "my-addin",
  "name": "My Add-in",
  "version": "0.1.0",
  "contributions": {
    "themes": [...],
    "knowledge": [...],
    "commands": [...],
    "roles": [...]
  }
}
```

## Contribution Types

### 1. Themes

Theme contributions provide CSS custom property tokens and optional static assets for operator UI branding.

**Schema:**

```json
{
  "id": "dark-mode",
  "name": "Dark Mode",
  "description": "High contrast dark theme",
  "tokens": {
    "colors": {
      "primary": "#7c3aed",
      "secondary": "#a78bfa",
      "background": "#1a1a2e",
      "surface": "#25253a",
      "text": "#e4e4e7"
    },
    "fonts": {
      "heading": "Inter, sans-serif",
      "body": "Inter, sans-serif",
      "mono": "JetBrains Mono, monospace"
    }
  },
  "assets": {
    "logo": "assets/logo-dark.svg",
    "favicon": "assets/favicon-dark.png"
  }
}
```

**Required fields:**
- `id` - Unique identifier (lowercase, alphanumeric with hyphens)
- `name` - Human-readable name
- `tokens` - Object containing token categories

**Token categories:**
- `colors` - Color values (hex, rgb, rgba, hsl, hsla)
- `fonts` - Font family strings
- `spacing` - Spacing values
- `borders` - Border definitions

### 2. Knowledge Packs

Knowledge contributions provide documentation and runbooks that appear in the help system.

**Schema:**

```json
{
  "id": "homelab-runbooks",
  "title": "HomeLab Runbooks",
  "description": "Operational runbooks for home infrastructure",
  "category": "runbooks",
  "docs": [
    {
      "path": "docs/backup-procedures.md",
      "title": "Backup Procedures",
      "tags": ["backup", "disaster-recovery"]
    },
    {
      "path": "docs/network-troubleshooting.md",
      "title": "Network Troubleshooting",
      "tags": ["network", "debug"]
    }
  ]
}
```

**Required fields:**
- `id` - Unique identifier
- `title` - Pack title
- `docs` - Array of document entries

**Categories:**
- `runbooks` - Operational procedures
- `guides` - How-to guides
- `reference` - Reference documentation
- `tutorials` - Learning tutorials

### 3. Slash Commands

Command contributions register declarative commands that route to built-in handlers.

**Schema:**

```json
{
  "name": "status",
  "description": "Show system status",
  "handler": "builtin:status",
  "args": {
    "verbose": false
  },
  "aliases": ["st", "stat"]
}
```

**Required fields:**
- `name` - Command name (used as `/name`)
- `handler` - Built-in handler reference

**Built-in handlers:**
- `builtin:status` - System status
- `builtin:help` - Help system
- `builtin:list` - List items
- `builtin:search` - Search functionality

### 4. Agent Roles

Role contributions provide selectable agent roles and profiles.

**Schema:**

```json
{
  "id": "code-reviewer",
  "name": "Code Reviewer",
  "description": "Focused on code quality and security review",
  "type": "role",
  "path": "roles/code-reviewer.md",
  "vendors": ["claude", "codex"],
  "capabilities": ["fs", "git"]
}
```

**Required fields:**
- `id` - Unique identifier
- `name` - Human-readable name
- `type` - Either `role` or `profile`

**Optional fields:**
- `path` - Path to role definition markdown
- `vendors` - Compatible vendors (empty = all)
- `capabilities` - Required capabilities

## Validation

Contributions are validated against the JSON schema at:
- `docs/schemas/contribution-schema-v1.json`

Invalid contributions cause installation warnings but do not block add-in installation.

## Lifecycle

1. **Install** - Contributions are extracted and indexed
2. **Enable** - Contributions become active in the system
3. **Disable** - Contributions are deactivated but retained
4. **Uninstall** - Contributions are removed from index

## Best Practices

1. Use descriptive, unique IDs
2. Provide helpful descriptions
3. Test contributions with the validation schema
4. Keep asset paths relative to add-in root
5. Prefer declarative over executable contributions
