# Agent Configuration

This runbook covers agent setup and profile management.

## Vendor Selection

Agents identify themselves by vendor:
- `claude` - Anthropic Claude
- `codex` - OpenAI Codex
- `flux` - OpenAI GPT (architect role)
- `gemini` - Google Gemini
- `deepseek` - DeepSeek

## Profile Configuration

Profiles define agent roles:

### Developer Profile
- Implementation focused
- Small, safe changes
- Follows existing patterns

### Architect Profile
- Design focused
- System-wide perspective
- Trade-off analysis

### Reviewer Profile
- Quality focused
- Security analysis
- Best practice enforcement

## Setting Active Profile

Profiles are set per-session:

```bash
daemoncore profile set developer
```

Or via contribution activation:

```bash
daemoncore contributions activate role developer
```

## Environment Variables

Key environment settings:

| Variable | Values | Description |
|----------|--------|-------------|
| `HOST_CLASS` | Laptop, Pi, Gaming-PC, Supercloud | Hardware tier |
| `EXECUTION_MODE` | Sandbox, Controlled, Dangerous | Safety level |
| `SANDBOX_LEVEL` | Hard, Medium, Soft | Restriction level |

## Troubleshooting

### Agent not loading profile

1. Verify profile exists in `agents/profiles/`
2. Check profile is vendor-compatible
3. Ensure profile path is correct in contributions
