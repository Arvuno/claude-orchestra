# Contributing to Claude Orchestra

Thank you for your interest in contributing! This guide covers everything you need to know to contribute effectively.

## Quick Links

- [Code of Conduct](#code-of-conduct)
- [What to Contribute](#what-to-contribute)
- [Development Setup](#development-setup)
- [Making Changes](#making-changes)
- [Submitting Changes](#submitting-changes)
- [Branch Strategy](#branch-strategy)

---

## Code of Conduct

We expect all contributors to be respectful and constructive. Disagreements happen, but courtesy is non-negotiable:
- Assume good intent
- Be clear and concise
- Keep feedback focused on ideas, not people

---

## What to Contribute

### ✅ Welcome

- **New orchestras** — A coherent domain not covered by the default 20, using the 10-field orchestra structure
- **Documentation improvements** — Clearer setup guides, troubleshooting sections, or "create your own" walkthroughs
- **Installer enhancements** — More robust `settings.json` handling, support for additional shells/OSes
- **Bug fixes** — Anything that doesn't work as documented

### ❌ Not Accepted

- **Third-party skill code** — This repo is the organization layer, not a skill bundle. Link to skills at their source to keep the project legal and give authors credit
- **Personal configurations** — Examples must be generic or anonymized

---

## Development Setup

### Prerequisites

- `git`
- `jq` (for the installer)

### Clone and Install

```bash
git clone https://github.com/Momo2323-ui/claude-orchestra
cd claude-orchestra
```

### Test the Installer

If you modify the installer, test it against a temporary directory:

```bash
CLAUDE_DIR=$(mktemp -d) ./install.sh
```

The installer is idempotent — running it twice produces the same result.

---

## Making Changes

### 1. Fork the Repository

Fork `Momo2323-ui/claude-orchestra` to your GitHub account.

### 2. Create a Feature Branch

```bash
git checkout -b docs/add-your-feature
```

### 3. Make Your Changes

- Keep changes focused and atomic
- Follow existing code style
- Test installer changes with a temp directory

### 4. Commit Your Changes

```bash
git commit -m "docs: add your feature description"
```

---

## Submitting Changes

### 1. Push to Your Fork

```bash
git push origin docs/add-your-feature
```

### 2. Open a Pull Request

Submit a PR targeting the `main` branch of `Momo2323-ui/claude-orchestra`.

**Include in your PR:**
- Clear title and description
- What the change does and why
- Any testing performed
- Screenshots for docs changes if applicable

---

## Branch Strategy

| Branch Type | Prefix | Example |
|------------|--------|---------|
| Documentation | `docs/` | `docs/add-contributing-guide` |
| CI/CD | `ci/` | `ci/add-codeql` |
| Bug fixes | `fix/` | `fix/install-script-error` |

---

## Questions?

Open an issue on the repository for questions about contributing.