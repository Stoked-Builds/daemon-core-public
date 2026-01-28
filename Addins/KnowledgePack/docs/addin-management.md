# Add-in Management

This runbook covers add-in installation, configuration, and removal.

## Installing Add-ins

### From Registry

Add-ins are installed from configured registries:

1. Add registry source to `.daemoncore/addins/sources.json`
2. Refresh the catalog
3. Install the add-in by ID

### Manual Installation

For local development:

1. Place add-in files in `Addins/<AddinName>/`
2. Ensure manifest.json and attestation.json exist
3. Add registry entry to `registry/index.json`

## Enabling/Disabling Add-ins

Add-ins can be enabled or disabled without uninstalling:

**Enable:**
```bash
daemoncore addins enable <addin-id>
```

**Disable:**
```bash
daemoncore addins disable <addin-id>
```

## Uninstalling Add-ins

To completely remove an add-in:

```bash
daemoncore addins uninstall <addin-id>
```

This removes:
- Installed state entry
- Contribution registrations
- Cached artifacts (optional)

## Troubleshooting

### Add-in not appearing in catalog

1. Check that the source is configured in `sources.json`
2. Verify the registry index.json is valid JSON
3. Refresh the catalog cache

### Add-in installation fails

1. Check the attestation status
2. Verify the artifact exists
3. Check for digest mismatches
