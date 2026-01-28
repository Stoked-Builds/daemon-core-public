# Your First Add-in

Learn how to create a simple add-in for DaemonCore.

## Overview

Add-ins are packages that extend DaemonCore through declarative contributions. This tutorial walks through creating a theme pack add-in.

## Step 1: Create the Directory Structure

```bash
mkdir -p Addins/MyTheme/registry
```

## Step 2: Create the Manifest

Create `Addins/MyTheme/manifest.json`:

```json
{
  "id": "my-theme",
  "name": "My Custom Theme",
  "version": "0.1.0",
  "description": "A custom theme for the operator UI",
  "paths": {
    "artifact": "my-theme.zip",
    "manifest": "manifest.json",
    "attestation": "attestation.json"
  },
  "capabilities": [],
  "contributions": {
    "themes": [
      {
        "id": "my-theme",
        "name": "My Theme",
        "description": "Custom colors for my environment",
        "tokens": {
          "colors": {
            "primary": "#ff6b6b",
            "background": "#2d3436",
            "text": "#dfe6e9"
          }
        }
      }
    ]
  }
}
```

## Step 3: Create the Attestation

Create `Addins/MyTheme/attestation.json`:

```json
{
  "id": "my-theme",
  "status": "pass",
  "timestamp": "2026-01-28T00:00:00Z",
  "issuer": "self",
  "details": "Self-signed development add-in"
}
```

## Step 4: Create the Registry Entry

Create `Addins/MyTheme/registry/index.json`:

```json
{
  "addins": [
    {
      "id": "my-theme",
      "name": "My Custom Theme",
      "version": "0.1.0",
      "digest": "development",
      "paths": {
        "artifact": "my-theme.zip",
        "manifest": "manifest.json",
        "attestation": "attestation.json"
      }
    }
  ]
}
```

## Step 5: Test the Add-in

1. Add the registry source
2. Install the add-in
3. Activate the theme
4. Verify the UI changes

## Next Steps

- Add more contribution types (commands, roles)
- Create a proper artifact zip
- Generate a real digest for the artifact
