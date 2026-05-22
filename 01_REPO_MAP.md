# 01 REPO MAP — claude-orchestra

## What It Is
Claude Orchestra is an **organization layer / routing system** for Claude Code tool ecosystems. It does NOT bundle third-party skills — it provides a framework that organizes skills, agents, MCPs, and plugins into themed "orchestras" with auto-routing, conductors, and quality gates. MIT licensed.

---

## Repository Structure

```
claude-orchestra/
├── README.md                      # Landing page + quick start
├── CONTRIBUTING.md                # Contribution guidelines
├── LICENSE                        # MIT License
├── CLAUDE-rule-snippet.md        # Rule block to paste into ~/.claude/CLAUDE.md
├── orchestra-system.md            # The "constitution" — defines all 20 orchestras (template)
├── install.sh                     # Idempotent installer (copies skills, hooks, rules to ~/.claude)
├── assets/
│   ├── banner.svg                 # Repo banner
│   └── diagram.svg                # How-it-works flow diagram
├── skills/
│   ├── orchestra-router/          # Skill: matches intent → activates orchestras, announces
│   │   └── SKILL.md
│   └── orchestra-intake/          # Skill: self-organizing — files new tools into orchestras
│       └── SKILL.md
├── hooks/
│   └── orchestra-route.sh         # UserPromptSubmit hook — injects routing directive every prompt
├── docs/
│   ├── HOW-IT-WORKS.md            # Architecture walkthrough (4 moving parts)
│   ├── SETUP.md                   # Installation instructions + troubleshooting
│   └── CREATE-YOUR-ORCHESTRA.md   # How to customize the orchestra template
├── examples/
│   └── my-20-orchestras.md        # Real 20-orchestra worked example with specific tools
└── .github/
    └── ISSUE_TEMPLATE/
        └── new-orchestra.md       # Feature request template for new orchestra ideas
```

---

## Core Concepts

### The 4 Moving Parts
1. **orchestra-system.md** (`~/.claude/rules/`) — Constitution defining 20 themed orchestras, each with 10 fields (mission, conductor, first chair, section, triggers, process, allowances, harness, handoff, quality gate)
2. **orchestra-route.sh** (`~/.claude/hooks/`) — UserPromptSubmit hook; injects routing directive on every prompt
3. **orchestra-router** skill — Matches user intent → activates orchestra(s) → announces (`🎼 <ORCHESTRA> active · Conductor: <agent> · Using: <tools>`)
4. **orchestra-intake** skill — Self-organizing; security-scans and files every new install into the right orchestra

### The 20 Orchestras (template taxonomy)
| # | Orchestra | Focus |
|---|---|---|
| ① | BUILD | Ship working, reviewed code |
| ② | DESIGN | Beautiful, on-brand interfaces |
| ③ | RESEARCH | Know more than the competition |
| ④ | MARKETING | Reach the right people |
| ⑤ | CONTENT | Words and creative that convert |
| ⑥ | SEO + GEO | Win search + AI answers |
| ⑦ | LEAD GEN & SALES | Find clients, close deals |
| ⑧ | PRODUCT | Build the right thing |
| ⑨ | VIDEO + MEDIA | Generate and edit video/image |
| ⑩ | ANALYTICS | Measure everything |
| ⑪ | KNOWLEDGE & MEMORY | Remember and connect everything |
| ⑫ | DOCUMENTS & REPORTS | Polished deliverables |
| ⑬ | PAID ADS | Ads that profit |
| ⑭ | AUTOMATION & OPS | Automate what repeats |
| ⑮ | AI/ML | Build AI systems |
| ⑯ | MOBILE | Ship mobile apps |
| ⑰ | PLANNING & PM | Plan before building |
| ⑱ | GROWTH & CONVERSION | Users → revenue |
| ⑲ | FINANCE | Money decisions |
| ⑳ | EXECUTIVE ADVISORY | Founder-grade strategic counsel |
| ✦ | NEXUS | Meta-conductor (idea/business-planning → sequences orchestras across lifecycle) |
| ⓪ | RESERVE BENCH | Off-domain specialists (installed, dormant, named-invoke only) |

### Install Flow
```
git clone https://github.com/Momo2323-ui/claude-orchestra
cd claude-orchestra
./install.sh   # idempotent; requires jq; backs up settings.json
```
Copies:
- `skills/orchestra-router` + `skills/orchestra-intake` → `~/.claude/skills/`
- `hooks/orchestra-route.sh` → `~/.claude/hooks/` (+ chmod +x)
- `orchestra-system.md` → `~/.claude/rules/` (only if not present)
- Registers hook under `hooks.UserPromptSubmit` in `settings.json` (jq merge, never clobbers)
- Appends orchestra rule to `~/.claude/CLAUDE.md` (only if not present)

---

## Key Files Detail

### install.sh
- **Requires:** `jq`
- **Idempotent:** safe to run multiple times
- **Backs up:** `~/.claude/settings.json` before modifying
- **Detects existing hook:** matches any command referencing `orchestra-route` to avoid double-injection

### orchestra-router/SKILL.md
- 60-line skill with quick-trigger table mapping intent signals → orchestras
- Stacks multiple orchestras for compound requests
- Always announces activation
- NEXUS meta-conductor fires on idea/business-planning signals

### orchestra-intake/SKILL.md
- 6-step process: security scan → classify → file → log → report
- Includes bulk-install fixture check (protects against test-malware in skill repos)
- Classification table maps tool type → orchestra
- Proposes new orchestra if no fit exists

### orchestra-system.md
- 180-line constitution template
- Core doctrine: one conductor per orchestra, always announce, stack complementary, nothing archived
- Full 10-field structure for each of 20 orchestras + NEXUS + Reserve Bench
- "Always-Rule": organize on every install, create new orchestras as needed

### CONTRIBUTING.md
- **Good contributions:** new orchestra ideas, better docs, installer improvements, bug fixes
- **Please don't:** don't add third-party skill code (link to source), don't add personal configs
- **Testing:** test installer against temp dir: `CLAUDE_DIR=$(mktemp -d) ./install.sh`

---

## Dependencies
- **Runtime:** Claude Code, `jq`
- **Install time:** `git`, `bash`

## CI/CD
- No GitHub Actions workflows detected
- No package manager files (no `package.json`, `pyproject.toml`, etc.)
- Shell scripts only

---

## Important Notes
- This is a **configuration/template repo**, not a skill bundle
- Third-party skills are linked to their source repos (not vendored)
- The example config (`examples/my-20-orchestras.md`) links to real tools at original repos
- Author: Moksh Mittra (@Momo2323-ui)
