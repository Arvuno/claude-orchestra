# Setup

## Requirements

- [Claude Code](https://claude.com/claude-code)
- `jq` (for the safe `settings.json` merge) — `brew install jq` / `apt-get install jq`

## Install

```bash
git clone https://github.com/Momo2323-ui/claude-orchestra
cd claude-orchestra
./install.sh
```

The installer:

| Step | What it does | Safety |
|---|---|---|
| skills | copies `orchestra-router` + `orchestra-intake` → `~/.claude/skills/` | additive |
| hook | copies `orchestra-route.sh` → `~/.claude/hooks/` (+ `chmod +x`) | additive |
| constitution | copies `orchestra-system.md` → `~/.claude/rules/` | **only if not present** |
| settings.json | registers the hook under `hooks.UserPromptSubmit` | **backs up first, `jq` merge, never clobbers** |
| CLAUDE.md | appends the orchestra rule | **only if not already present** |

It's **idempotent** — run it as many times as you like; it won't duplicate anything.

## After install

1. Open a **new** Claude Code session (so the hook + rule load).
2. Edit `~/.claude/rules/orchestra-system.md` and fill the rosters with your tools
   → see [CREATE-YOUR-ORCHESTRA.md](CREATE-YOUR-ORCHESTRA.md).
3. Send any prompt — you'll see `🎼 ... active` announcing the orchestra that fired.

## Uninstall

```bash
# remove the files
rm -rf ~/.claude/skills/orchestra-router ~/.claude/skills/orchestra-intake
rm ~/.claude/hooks/orchestra-route.sh
# remove the hook entry from ~/.claude/settings.json (restore a .bak if you prefer)
# remove the "## Orchestra System" block from ~/.claude/CLAUDE.md
```

## Troubleshooting

- **Router doesn't fire** → did you start a *new* session after install? Hooks load at session start.
- **`jq: command not found`** → install jq, re-run `./install.sh`.
- **Want to undo a settings change** → the installer saved `~/.claude/settings.json.bak.<timestamp>`.
