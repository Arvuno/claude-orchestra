# Contributing

Thanks for wanting to improve Claude Orchestra! This is a small, focused project — the goal is to
keep the *system* clean and adaptable, not to become a giant skill collection.

## Good contributions

- **New orchestra ideas** — a coherent domain the default 20 don't cover, with the 10-field structure.
- **Better docs** — clearer setup, troubleshooting, or "create your own" guidance.
- **Installer improvements** — more robust `settings.json` handling, other shells/OSes.
- **Bug fixes** — anything that doesn't work as described.

## Please don't

- **Don't add third-party skill code.** This repo is the organization layer, not a skill bundle.
  Link to skills at their source instead — it keeps us legal and gives authors credit.
- **Don't add personal config.** Examples must be generic or anonymized.

## How

1. Fork, branch, make your change.
2. If you touched the installer, test it against a temp dir:
   `CLAUDE_DIR=$(mktemp -d) ./install.sh` and confirm it's idempotent.
3. Open a PR describing what and why.

## Conduct

Be kind, be clear, assume good faith. That's it.
