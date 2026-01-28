# Contribution Loader

The contribution loader discovers and exposes deployed contributions from installed add-ins.

## Overview

When add-ins are installed, their contributions are extracted and stored in a structured format. The contribution loader:

1. Scans installed add-ins for contribution declarations
2. Validates contributions against the schema
3. Indexes contributions by type
4. Exposes contributions to consumers (UI, CLI, agents)

## Contribution Storage

Contributions are stored in the project's `.daemoncore/addins/contributions/` directory:

```
.daemoncore/addins/contributions/
├── index.json              # Master index of all contributions
├── themes/
│   ├── index.json          # Theme contributions index
│   └── <theme-id>.json     # Individual theme definitions
├── knowledge/
│   ├── index.json          # Knowledge pack index
│   └── <pack-id>/          # Pack contents
│       ├── manifest.json
│       └── docs/
├── commands/
│   └── index.json          # Command contributions index
└── roles/
    ├── index.json          # Role contributions index
    └── <role-id>.md        # Role definition files
```

## Master Index Format

The `index.json` at the contribution root tracks all contributions:

```json
{
  "version": "1.0.0",
  "updated_at": "2026-01-28T12:00:00Z",
  "contributions": {
    "themes": ["dark-mode", "high-contrast"],
    "knowledge": ["homelab-runbooks"],
    "commands": ["status", "quick-commit"],
    "roles": ["code-reviewer", "architect"]
  },
  "sources": {
    "dark-mode": "theme-pack-v1",
    "high-contrast": "theme-pack-v1",
    "homelab-runbooks": "homelab-pack",
    "status": "command-pack-v1",
    "quick-commit": "command-pack-v1",
    "code-reviewer": "role-pack-v1",
    "architect": "role-pack-v1"
  }
}
```

## Loader Operations

### 1. Discovery

The loader scans all installed add-ins and extracts contribution declarations:

```
Input:  .daemoncore/addins/installed/<project-id>.json
Output: List of add-ins with contributions
```

### 2. Extraction

For each add-in with contributions, the loader:

1. Reads the manifest contributions block
2. Validates against contribution-schema-v1
3. Copies contribution assets to contributions directory
4. Updates the contribution index

### 3. Indexing

The loader maintains type-specific indexes for fast lookup:

- `themes/index.json` - All available themes
- `knowledge/index.json` - All knowledge packs
- `commands/index.json` - All commands
- `roles/index.json` - All roles

### 4. Activation

Some contribution types support activation state:

- **Themes**: One active theme at a time
- **Roles**: One active role per session
- **Commands**: Always active when add-in enabled
- **Knowledge**: Always indexed when add-in enabled

Active state is tracked in:
```
.daemoncore/addins/contributions/active.json
```

```json
{
  "theme": "dark-mode",
  "role": "developer"
}
```

## Consumer API

### Theme Consumer

```typescript
interface ThemeLoader {
  // Get all available themes
  listThemes(): ThemeContribution[];

  // Get active theme
  getActiveTheme(): ThemeContribution | null;

  // Set active theme
  setActiveTheme(themeId: string): void;

  // Get theme by ID
  getTheme(themeId: string): ThemeContribution | null;
}
```

### Knowledge Consumer

```typescript
interface KnowledgeLoader {
  // Get all knowledge packs
  listPacks(): KnowledgeContribution[];

  // Get pack by ID
  getPack(packId: string): KnowledgeContribution | null;

  // Search across all packs
  search(query: string): SearchResult[];
}
```

### Command Consumer

```typescript
interface CommandLoader {
  // Get all registered commands
  listCommands(): CommandContribution[];

  // Get command by name
  getCommand(name: string): CommandContribution | null;

  // Check if command exists
  hasCommand(name: string): boolean;
}
```

### Role Consumer

```typescript
interface RoleLoader {
  // Get all available roles
  listRoles(): RoleContribution[];

  // Get active role
  getActiveRole(): RoleContribution | null;

  // Set active role
  setActiveRole(roleId: string): void;

  // Get role by ID
  getRole(roleId: string): RoleContribution | null;
}
```

## Lifecycle Events

The loader emits events during contribution lifecycle:

| Event | Trigger |
|-------|---------|
| `contribution:added` | New contribution indexed |
| `contribution:removed` | Contribution removed (add-in uninstalled) |
| `contribution:activated` | Theme/role activated |
| `contribution:deactivated` | Theme/role deactivated |

## Error Handling

| Error | Cause | Resolution |
|-------|-------|------------|
| `INVALID_CONTRIBUTION` | Schema validation failed | Log warning, skip contribution |
| `DUPLICATE_ID` | Contribution ID already exists | Log warning, keep existing |
| `MISSING_ASSET` | Referenced asset not found | Log warning, skip contribution |
| `SOURCE_UNAVAILABLE` | Add-in not installed | Remove orphaned contributions |

## CLI Commands

```bash
# List all contributions
daemoncore contributions list

# List contributions by type
daemoncore contributions list --type themes

# Show contribution details
daemoncore contributions show dark-mode

# Set active theme
daemoncore contributions activate theme dark-mode

# Rebuild contribution index
daemoncore contributions rebuild
```
