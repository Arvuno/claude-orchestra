# 04 QUALITY_AUDIT — claude-orchestra

## Search Results

### TODO/FIXME Count

**Result:** 0 matches  
Searched all `.md` and `.sh` files for `TODO|FIXME` — none found.

---

### Broken Links / HTTP References

**13 HTTP links found** — most are legitimate external resources:

| File | Line | Link | Purpose | Status |
|------|------|------|---------|--------|
| README.md | 9 | `https://img.shields.io/badge/license-MIT-green` | License badge | OK |
| README.md | 10 | `https://img.shields.io/badge/Claude_Code-ready-f5b301` | Claude Code badge | OK |
| README.md | 11 | `https://img.shields.io/badge/PRs-welcome-blue` | PRs welcome badge | OK |
| README.md | 46 | `https://github.com/Momo2323-ui/claude-orchestra` | Install instructions | OK |
| README.md | 54 | `https://github.com/Momo2323-ui/claude-orchestra` | Git clone URL | OK |
| README.md | 120 | `https://github.com/Momo2323-ui` | Author link | OK |
| docs/SETUP.md | 5 | `https://claude.com/claude-code` | Claude Code requirement | OK |
| docs/SETUP.md | 11 | `https://github.com/Momo2323-ui/claude-orchestra` | Git clone URL | OK |
| 00_STATE.md | 24, 33, 34 | `https://github.com/...` | Remote URLs | OK |
| 01_REPO_MAP.md | 77 | `https://github.com/Momo2323-ui/claude-orchestra` | Clone URL in docs | OK |
| examples/my-20-orchestras.md | 8 | `https://github.com/anthropics/skills` | Skill repo link | OK |

**No broken links detected.** All HTTP references are valid external resources.

---

### Skill File Frontmatter (YAML validation)

Both skill files have consistent frontmatter:

**`skills/orchestra-router/SKILL.md`** — lines 1-8:
```yaml
---
name: orchestra-router
description: >
  Runtime router for the orchestra system. Use at the start of EVERY task to detect intent and
  activate the right orchestra(s) automatically, then announce which fired. Matches the request
  against the orchestra triggers defined in ~/.claude/rules/orchestra-system.md and stacks
  multiple orchestras for compound requests.
---
```

**`skills/orchestra-intake/SKILL.md`** — lines 1-9:
```yaml
---
name: orchestra-intake
description: >
  Classify and file every newly installed skill, plugin, MCP, connector, or agent into the right
  orchestra — never archive. Use whenever you install/add a new repo, skill, plugin, MCP server,
  or agent ("I installed X", "added Y", "npx skills add Z", "new repo", "set up this MCP"). Runs a
  security scan, classifies the tool, places it in an orchestra with usage notes, logs it, and
  reports back. This is the self-organizing layer of the orchestra system.
---
```

**Validation:** ✅ Both have valid YAML frontmatter with `name` and `description` fields.

---

### Agents Directory

**Found:** No `agents/` directory exists in this repo.  
**Note:** The repo does not contain any YAML agent definition files.

---

### Issue Template YAML

**.github/ISSUE_TEMPLATE/new-orchestra.md** — valid YAML frontmatter:
```yaml
---
name: New orchestra proposal
about: Proate a new orchestra for a domain the default 20 don't cover
title: "[orchestra] "
labels: orchestra
---
```
**Validation:** ✅ Valid YAML (note: typo in `about` field — "Proate" should be "Propose")

---

## Quality Issues Found

### Issue 1: Typo in Issue Template

**File:** `.github/ISSUE_TEMPLATE/new-orchestra.md` line 3  
**Problem:** `about: Proate a new orchestra` should be `about: Propose a new orchestra`  
**Severity:** Low (cosmetic, in a template)

### Issue 2: Inconsistent Table Formatting in Router Skill

**File:** `skills/orchestra-router/SKILL.md` lines 29-51  
**Problem:** The quick trigger table uses pipe syntax but lacks proper markdown table headers  
```markdown
| Intent signals | Orchestra |
||---|---|
```
Should be:
```markdown
| Intent signals | Orchestra |
|---|---|
```
**Severity:** Low (renderer-tolerant, but inconsistent with markdown spec)

### Issue 3: Link in SETUP.md Points to Wrong Location

**File:** `docs/SETUP.md` line 32  
**Problem:** `[CREATE-YOUR-ORCHESTRA.md](CREATE-YOUR-ORCHESTRA.md)` links to the root, not the `docs/` subdirectory  
**Actual file location:** `docs/CREATE-YOUR-ORCHESTRA.md`  
**Severity:** Medium (would break if clicked from GitHub's rendered view of SETUP.md)

### Issue 4: Markdown Link Syntax Inconsistency

**File:** `examples/my-20-orchestras.md` line 8  
**Problem:** Uses `<https://github.com/anthropics/skills>` (angle bracket syntax) instead of standard `[text](url)` markdown  
```markdown
- `[anthropics]` links to <https://github.com/anthropics/skills>
```
Should be:
```markdown
- `[anthropics]` links to [anthropics/skills](https://github.com/anthropics/skills)
```
**Severity:** Low (cosmetic, works in most renderers)

---

## Quality Audit Summary

| Check | Result |
|-------|--------|
| TODO/FIXME | 0 found ✅ |
| Broken HTTP links | 0 found ✅ |
| YAML frontmatter (skills) | Valid ✅ |
| YAML frontmatter (issue template) | Valid (1 typo) ⚠️ |
| Agents/*.yaml files | N/A (no agents dir) ✅ |
| Markdown table headers | Inconsistent ⚠️ |
| Relative link accuracy | 1 wrong path ⚠️ |

**Overall:** Repo is well-structured with minor quality issues that can be addressed via small PRs.