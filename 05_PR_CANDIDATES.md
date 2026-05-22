# 05 PR_CANDIDATES — claude-orchestra

A backlog of improvement ideas for this repository. Since no open issues or PRs exist, all candidates are unsolicited contributions.

---

## Candidate 1: Fix Broken Relative Link in docs/SETUP.md

**File:** `docs/SETUP.md` line 32  
**Problem:** `[CREATE-YOUR-ORCHESTRA.md](CREATE-YOUR-ORCHESTRA.md)` links to root instead of `docs/CREATE-YOUR-ORCHESTRA.md`  
**Fix:** Change to `[CREATE-YOUR-ORCHESTRA.md](docs/CREATE-YOUR-ORCHESTRA.md)` or simply `[CREATE-YOUR-ORCHESTRA.md](CREATE-YOUR-ORCHESTRA.md)` (GitHub renders relative links within the same directory automatically)

**Type:** Bug fix (documentation)  
**Complexity:** Trivial (1-line change)  
**Effort:** ~5 min  
**PR-ready:** Yes

---

## Candidate 2: Fix Typo in Issue Template

**File:** `.github/ISSUE_TEMPLATE/new-orchestra.md` line 3  
**Problem:** `about: Proate a new orchestra` should be `about: Propose a new orchestra`  
**Type:** Typo fix  
**Complexity:** Trivial  
**Effort:** ~2 min  
**PR-ready:** Yes

---

## Candidate 3: Fix Inconsistent Table Header Formatting in Router Skill

**File:** `skills/orchestra-router/SKILL.md` lines 29-31  
**Problem:** Double pipe `||---|---||` instead of proper `|---|---|`  
**Current:**
```markdown
| Intent signals | Orchestra |
||---|---|
```
**Should be:**
```markdown
| Intent signals | Orchestra |
|---|---|
```
**Type:** Markdown cleanup  
**Complexity:** Trivial  
**Effort:** ~5 min  
**PR-ready:** Yes

---

## Candidate 4: Standardize Angle-Bracket Links in my-20-orchestras.md

**File:** `examples/my-20-orchestras.md` line 8  
**Problem:** Uses `<https://...>` raw URL syntax instead of proper markdown link format  
**Current:**
```markdown
- `[anthropics]` links to <https://github.com/anthropics/skills>
```
**Should be:**
```markdown
- `[anthropics]` links to [anthropics/skills](https://github.com/anthropics/skills)
```
**Type:** Markdown consistency  
**Complexity:** Trivial  
**Effort:** ~5 min  
**PR-ready:** Yes

---

## Candidate 5: Add Bash Shebang Validation to install.sh Comments

**File:** `install.sh` lines 1-12  
**Observation:** The script has thorough comments but could benefit from a usage example in the top comment block  
**Enhancement:** Add a brief usage section at the top:
```bash
# Usage: CLAUDE_DIR=~/.claude ./install.sh
#
# Environment variables:
#   CLAUDE_DIR  - Override default ~/.claude location (for testing)
```
**Type:** Documentation improvement  
**Complexity:** Trivial  
**Effort:** ~10 min  
**PR-ready:** Yes

---

## Candidate 6: Add ShellCheck Badge to README

**File:** `README.md`  
**Enhancement:** Add a shell script linting badge to demonstrate code quality  
```markdown
[![ShellCheck](https://github.com/Momo2323-ui/claude-orchestra/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/Momo2323-ui/claude-orchestra/actions/workflows/shellcheck.yml)
```
**Type:** CI/CD quality improvement  
**Complexity:** Medium (requires GitHub Actions workflow)  
**Effort:** ~30 min  
**PR-ready:** Yes (but requires Actions setup)

---

## Candidate 7: Add Idempotency Test for install.sh

**File:** `install.sh`  
**Enhancement:** Document and automate the idempotency test mentioned in CONTRIBUTING.md  
**Current:** The CONTRIBUTING.md says to test with `CLAUDE_DIR=$(mktemp -d) ./install.sh` but there's no automated verification  
**Type:** Testing / CI  
**Complexity:** Medium  
**Effort:** ~45 min  
**PR-ready:** Yes

---

## Candidate 8: Expand TROUBLESHOOTING Section in docs/SETUP.md

**File:** `docs/SETUP.md` lines 45-49  
**Observation:** Only 4 troubleshooting items exist; could add more common failure modes:  
- "Hook doesn't fire on WSL" 
- "Permission denied on hooks"
- "jq version too old"
**Type:** Documentation improvement  
**Complexity:** Low  
**Effort:** ~20 min  
**PR-ready:** Yes

---

## Candidate 9: Add Diagram for Router Skill Flow

**File:** `skills/orchestra-router/SKILL.md`  
**Enhancement:** The router skill describes the process in text; a simple ASCII flow diagram would improve comprehension  
**Type:** Documentation improvement  
**Complexity:** Low  
**Effort:** ~15 min  
**PR-ready:** Yes

---

## Candidate 10: Add Security Scanning Detail to orchestra-intake Skill

**File:** `skills/orchestra-intake/SKILL.md` lines 18-22  
**Observation:** The security scan step says "verify the source" but doesn't give concrete commands to run  
**Enhancement:** Add specific commands: `gh repo view <owner>/<repo>`, `npm view <package>`, etc.  
**Type:** Documentation improvement  
**Complexity:** Low  
**Effort:** ~20 min  
**PR-ready:** Yes

---

## Candidate Summary Table

| # | Candidate | Type | Effort | Complexity |
|---|-----------|------|--------|------------|
| 1 | Fix SETUP.md relative link | Bug fix | 5 min | Trivial |
| 2 | Fix issue template typo | Typo fix | 2 min | Trivial |
| 3 | Fix router table formatting | Cleanup | 5 min | Trivial |
| 4 | Standardize angle-bracket links | Consistency | 5 min | Trivial |
| 5 | Add usage docs to install.sh | Documentation | 10 min | Trivial |
| 6 | Add ShellCheck badge + workflow | CI/CD | 30 min | Medium |
| 7 | Add idempotency test | Testing | 45 min | Medium |
| 8 | Expand troubleshooting | Documentation | 20 min | Low |
| 9 | Add diagram to router skill | Documentation | 15 min | Low |
| 10 | Detail security scan commands | Documentation | 20 min | Low |

**Total candidates:** 10  
**Trivial changes:** 5  
**Medium complexity:** 2  
**Low complexity:** 3