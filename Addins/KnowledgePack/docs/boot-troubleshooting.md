# Boot Troubleshooting

This runbook covers common boot issues and their resolution.

## Symptoms

### Boot Failure: Vendor files not found

**Error:**
```
BOOT FAILURE: Vendor files not found
```

**Cause:** The vendor files (e.g., `claude.md`, `claude-init.md`) are missing from the global vendor library.

**Resolution:**
1. Verify the global kernel is deployed at `~/Source/.daemoncore/`
2. Check that vendor files exist under `~/Source/.daemoncore/vendors/`
3. Run the kernel deployment script if files are missing

### Boot Failure: Invalid identity handshake

**Error:**
```
BOOT FAILURE: Invalid identity handshake
```

**Cause:** The agent didn't properly declare VENDOR, MODEL_FAMILY, MODEL_NAME, or VERSION.

**Resolution:**
1. Ensure the agent is using the correct boot sequence
2. Verify the agent supports the current kernel version
3. Check for typos in identity declaration

### Degraded Mode: Missing context files

**Warning:**
```
Boot degraded — missing tone.md, memory.md
```

**Cause:** One or more required context files are missing.

**Resolution:**
1. Check that `~/Source/.daemoncore/agents/guides/tone.md` exists
2. Check that `~/Source/.daemoncore/kernel/memory/memory.md` exists
3. Re-deploy the kernel if files are corrupted

## Diagnostic Commands

```bash
# Check kernel structure
ls -la ~/Source/.daemoncore/

# Verify vendor files
ls -la ~/Source/.daemoncore/vendors/

# Check kernel state
cat ~/Source/.daemoncore/kernel/state.md
```
