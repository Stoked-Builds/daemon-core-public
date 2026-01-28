# Speckit Backlog Provider Contract (Add-in)

This document captures the **exact contract** the DaemonCore runtime uses to load
Speckit backlog items. The provider does **not** execute code; it reads a
filesystem-backed Speckit workspace from the target project.

## Contract Summary

The Speckit backlog provider is **file-based**:

- A project is considered Speckit-ready **only if** `specs/.specify` exists.
- Each spec lives under `specs/<spec-folder>/`.
- The provider reads `spec.md` (metadata) and `tasks.md` (task list).
- Items are returned as **features, user stories, and tasks** (epics empty).

If `specs/.specify` is missing, the runtime falls back to the Cognition backlog
and reports a warning in the provider metadata.

## Required Files & Paths

```
<repo> /
  specs /
    .specify
    <spec-folder> /
      spec.md
      tasks.md   (optional)
```

### `spec.md` format
Plain text lines of `Key: Value`. Keys are case-insensitive; spaces are
converted to underscores. Supported keys:

- `title` or `feature` → feature title
- `description` → feature description
- `story` → user story title
- `story_description` → user story description
- `status` → feature status (defaults to `backlog`)
- `priority` → user story priority
- `size` → user story size

Unknown keys are ignored.

### `tasks.md` format
One task per line:

```
[<token>] Task title | key=value;key=value
```

Status tokens map to:

| Token | Status       |
|------:|--------------|
| p     | in_progress  |
| r     | in_review    |
| d     | done         |
| b     | backlog      |
| t     | todo         |

Meta keys are optional. `tags` supports a comma-separated list. Any other
`key=value` pairs are passed through to the task record.

## Output Shape

The provider returns a snapshot with these top-level keys:

- `features` (List)
- `user_stories` (List)
- `tasks` (List)
- `epics` (List, empty for Speckit)

Example (truncated):

```json
{
  "features": [
    {
      "id": "FEATURE-SPECKIT-SAMPLE",
      "title": "Speckit Sample",
      "status": "backlog",
      "description": "Demo spec",
      "epic_id": null,
      "user_story_ids": ["FEATURE-SPECKIT-SAMPLE-US-01"]
    }
  ],
  "user_stories": [
    {
      "id": "FEATURE-SPECKIT-SAMPLE-US-01",
      "title": "As an operator...",
      "status": "todo",
      "description": "Demo story",
      "feature_id": "FEATURE-SPECKIT-SAMPLE",
      "priority": "medium",
      "size": "small",
      "tags": ["demo"]
    }
  ],
  "tasks": [
    {
      "id": "FEATURE-SPECKIT-SAMPLE-US-01-T01",
      "title": "Validate backlog ingest",
      "status": "todo",
      "description": null,
      "user_story_id": "FEATURE-SPECKIT-SAMPLE-US-01",
      "priority": "medium",
      "size": "small",
      "tags": ["demo", "ui"]
    }
  ],
  "epics": []
}
```

## How to Test Locally

1. Ensure the Speckit add-in is installed (for catalogue visibility).
2. Place Speckit files in the project:

   ```bash
   mkdir -p specs && touch specs/.specify
   mkdir -p specs/demo
   printf "Title: Speckit Demo\n" > specs/demo/spec.md
   printf "[t] First task | tags=demo\n" > specs/demo/tasks.md
   ```

3. In the Operator Dashboard, switch the Backlog provider to **Speckit**.
4. Confirm the Backlog list shows Speckit items and the provider banner clears.

## Notes

- The provider is **read-only**; backlog mutations are disabled when Speckit is active.
- The add-in should ship a `specs/` tree that can be copied into a project
  root (or unpacked there by a future install hook).
- The add-in itself does not run code for backlog generation; the runtime
  performs the parsing described above.
