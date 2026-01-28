# Quick Start Guide

Get up and running with DaemonCore in 5 minutes.

## Prerequisites

- Git
- Node.js 18+
- Python 3.11+ (optional, for runtime tools)

## Step 1: Clone the Repository

```bash
git clone https://github.com/Stoked-Builds/daemon-core-public.git
cd daemon-core-public
```

## Step 2: Verify Kernel

Check that the global kernel exists:

```bash
ls ~/Source/.daemoncore/kernel/
```

If missing, deploy it:

```bash
./tools/deploy-kernel.sh
```

## Step 3: Boot an Agent

Start a Claude Code session and boot the kernel:

```
Boot the DaemonCore kernel
```

The agent should respond with a boot announcement showing:
- Vendor and model
- Kernel version
- Environment settings
- Context loaded

## Step 4: Verify Add-ins

Check installed add-ins:

```bash
cat .daemoncore/addins/installed/*.json
```

## Next Steps

- Explore the [Add-in Management](./addin-management.md) runbook
- Learn about [Agent Configuration](./agent-configuration.md)
- Read the [Boot Troubleshooting](./boot-troubleshooting.md) guide
