# DaemonCore — Project Boot

**Project:** daemon-core-public
**Kernel:** Requires Global Kernel

---

## Overview

This is the project boot sequence for **daemon-core-public**. It works for all vendors (Claude, Codex/Flux, Gemini, etc.) without vendor-specific logic.

**Entry point & prerequisites:**

This `boot.md` is the **project-level entry point**. Agents should load this file first.

The project boot **requires** the Global Kernel and must not proceed without it.

- Global Kernel (**required**): `/Users/markstokes/Source/.daemoncore/kernel/boot.md`
- Vendor identity resolved by Global Kernel
- Environment profile applied by Global Kernel

**Path rule:** Never hard-code `/Users/<name>/...` paths. Use `~` and repo-relative paths only.

---

## Boot Sequence

### Step 1: Kernel Verification

Load the Global Kernel boot contract:

- Required location: `/Users/markstokes/Source/.daemoncore/kernel/boot.md`

If the Global Kernel boot contract is found:
- Load it
- Resolve vendor identity (Claude, Codex, Gemini, etc.)
- Apply environment profile
- Load vendor-specific global configuration

If the Global Kernel boot contract is **not** found:
- HARD FAIL
- Report: `BOOT FAILURE: Global kernel not found at /Users/markstokes/Source/.daemoncore/kernel/boot.md`
- Abort project boot immediately
- Do **not** invent, infer, or substitute alternative paths

---

### Step 2: Project Context Loading

Load project context:

1. **Project Configuration**
   - Load `.daemoncore/repo.config.json`
   - Understand project type, scope, and constraints

2. **Domain Context**
   - Load `.daemoncore/domain.md`
   - Understand project purpose, domain concepts, boundaries

3. **Cognition State** (if exists)
   - Check `.daemoncore/cognition/backlog/` for active work items
   - Check `.daemoncore/cognition/ideas/` for future items

---

### Step 3: Repository State Assessment

Check current repository state:

```bash
git branch --show-current
git status --short
git log --oneline -3
```

Report brief status:

```
Project: daemon-core-public
Branch: <branch-name>
Status: <clean | uncommitted changes>
Recent work: <1-line summary>
```

---

### Step 4: Session State Detection

Check for active session state:

**Exchange location:** `.daemoncore/exchange/` (project-local)

Check for:

1. **Queued work**
   - `.daemoncore/exchange/queues/`
2. **Session artifacts**
   - `.daemoncore/exchange/artifacts/`
   - `.daemoncore/exchange/transcripts/`

Report session status:

```
Session: <fresh | continuing from <timestamp>>
Queued work: <count> items
```

---

### Step 5: Vendor-Specific Initialization

Load vendor-specific project configuration (thin overlay only):

**For Claude:**
- File: `./.claude/init.md` or `.daemoncore/vendors/claude/init.md`

#### Claude Model Default (Operator Check)

**Goal:** Use **Sonnet** for standard implementation work to balance coding quality and token efficiency.

**Constraint:** DaemonCore cannot force Claude’s model selection via repo configuration. This is a **user-level** Claude Code setting.

**Operator action (once per machine):**

Ensure Claude Code default model is set to **Sonnet**:

```json
{
  "defaultModel": "sonnet"
}
```

**Guidance:**
- Sonnet is the default for implementation tasks
- Opus should be selected explicitly for architecture or deep refactors
- 1M context variants only when working with large repos/specs

**For Codex/Flux:**
- File: `./.codex/init.md` or `.daemoncore/vendors/codex/init.md`

**For Gemini:**
- File: `./.gemini/init.md` or `.daemoncore/vendors/gemini/init.md`

---

### Step 6: Boot Announcement

Announce successful boot:

```
daemon-core-public boot complete.

Project: daemon-core-public
Branch: <branch-name>
Session: <fresh | continuing>

Context loaded:
- Project configuration
- Domain context
- Repository status
- Vendor configuration (<vendor>)

Ready. What would you like to work on?
```

---

## Boot Failure Handling

### Global Kernel Not Found

```
BOOT FAILURE: Global kernel not found at /Users/markstokes/Source/.daemoncore/kernel/boot.md
```

### Project Not Initialized

```
BOOT FAILURE: Project not initialized
```

---

## Version

**Boot Template Version:** 1.1  
**Compatibility:** DaemonCore Kernel v0.6.0+