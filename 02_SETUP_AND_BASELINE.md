# 02 SETUP AND BASELINE — claude-orchestra

## Repository Overview

**Type:** Shell/bash configuration/template repo (no package manager, no compiled code)  
**Purpose:** Organization layer / routing system for Claude Code tool ecosystems  
**Language:** Shell scripts (Bash)  
**License:** MIT  

---

## What This Repo Does

Claude Orchestra is a framework that organizes skills, agents, MCPs, and plugins into themed "orchestras" with auto-routing, conductors, and quality gates. It does NOT bundle third-party skills — it provides the routing infrastructure and template configuration.

---

## Repository Structure

```
claude-orchestra/
├── README.md
├── CONTRIBUTING.md
├── LICENSE
├── CLAUDE-rule-snippet.md
├── orchestra-system.md
├── install.sh                     # <-- main installer script
├── assets/
│   ├── banner.svg
│   └── diagram.svg
├── skills/
│   ├── orchestra-router/SKILL.md
│   └── orchestra-intake/SKILL.md
├── hooks/
│   └── orchestra-route.sh         # <-- routing hook script
├── docs/
│   ├── HOW-IT-WORKS.md
│   ├── SETUP.md
│   └── CREATE-YOUR-ORCHESTRA.md
├── examples/
│   └── my-20-orchestras.md
└── .github/
    └── ISSUE_TEMPLATE/
        └── new-orchestra.md
```

---

## Shell Scripts Found

| File | Purpose |
|------|---------|
| `install.sh` | Idempotent installer; copies skills, hooks, and config to `~/.claude` |
| `hooks/orchestra-route.sh` | UserPromptSubmit hook; injects routing directive on every prompt |

---

## Testing / CI Status

**No automated tests found.** This is a pure configuration/template repository with:
- No `package.json`
- No `pyproject.toml`
- No `Makefile`
- No GitHub Actions workflows
- No test runners

The CONTRIBUTING.md notes that the only testable component is the installer, which can be tested manually:
```bash
CLAUDE_DIR=$(mktemp -d) ./install.sh
```

---

## Installation Instructions

```bash
git clone https://github.com/Momo2323-ui/claude-orchestra
cd claude-orchestra
./install.sh        # requires jq; backs up settings.json; idempotent
```

The installer:
1. Copies `orchestra-router` + `orchestra-intake` → `~/.claude/skills/`
2. Copies `orchestra-route.sh` → `~/.claude/hooks/` (+ `chmod +x`)
3. Copies `orchestra-system.md` → `~/.claude/rules/` (only if not present)
4. Registers the hook under `hooks.UserPromptSubmit` in `settings.json` (via jq merge)
5. Appends the orchestra rule to `~/.claude/CLAUDE.md` (only if not already present)

---

## Dependencies

| Dependency | When Required |
|-----------|---------------|
| `jq` | Install time (for safe `settings.json` merge) |
| `git` | Clone time |
| `bash` | Run install.sh |
| Claude Code | Runtime |

---

## Baseline Summary

- **Repo type:** Docs/skills/template system (not a runnable application)
- **Testable code:** Only `install.sh` and `orchestra-route.sh` are scripts
- **Test coverage:** None (manual testing only for installer)
- **Active development:** Unknown (no PR/issue activity found)
- **Stars:** 6 (upstream)
- **Forks:** 2 (upstream)