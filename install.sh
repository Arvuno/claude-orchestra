#!/usr/bin/env bash
#
# Claude Orchestra — installer
# Installs the orchestra system into your ~/.claude:
#   • skills/orchestra-router, skills/orchestra-intake
#   • hooks/orchestra-route.sh  (+ registers it in settings.json — safely, via jq)
#   • rules/orchestra-system.md (the constitution template)
#   • appends the orchestra rule to your CLAUDE.md (only if not already present)
#
# Idempotent: safe to run more than once. Backs up settings.json before changing it.
# No sudo required. Re-running refreshes the two managed skills + hook; your own
# rules/orchestra-system.md and the rest of your config are preserved.

set -euo pipefail

CLAUDE_DIR="${CLAUDE_DIR:-$HOME/.claude}"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOOK_CMD="bash $CLAUDE_DIR/hooks/orchestra-route.sh"
SETTINGS="$CLAUDE_DIR/settings.json"

say() { printf '  %s\n' "$1"; }
echo "🎼 Installing Claude Orchestra into $CLAUDE_DIR"

# --- 0. prerequisites ---------------------------------------------------------
if ! command -v jq >/dev/null 2>&1; then
  echo "✗ 'jq' is required to safely merge settings.json. Install it first:"
  echo "    macOS:  brew install jq"
  echo "    Debian: sudo apt-get install jq"
  exit 1
fi

mkdir -p "$CLAUDE_DIR/skills" "$CLAUDE_DIR/hooks" "$CLAUDE_DIR/rules"

# --- 1. skills ----------------------------------------------------------------
# Clean replace: on macOS/BSD `cp -R src dest` NESTS into an existing dest dir
# (creating skills/orchestra-router/orchestra-router) instead of overwriting.
# Removing dest first guarantees a deterministic refresh on every platform.
for s in orchestra-router orchestra-intake; do
  rm -rf "$CLAUDE_DIR/skills/$s"
  cp -R "$REPO_DIR/skills/$s" "$CLAUDE_DIR/skills/$s"
done
say "✓ skills → $CLAUDE_DIR/skills/{orchestra-router,orchestra-intake}"

# --- 2. hook ------------------------------------------------------------------
cp "$REPO_DIR/hooks/orchestra-route.sh" "$CLAUDE_DIR/hooks/orchestra-route.sh"
chmod +x "$CLAUDE_DIR/hooks/orchestra-route.sh"
say "✓ hook → $CLAUDE_DIR/hooks/orchestra-route.sh"

# --- 3. constitution ----------------------------------------------------------
if [ -f "$CLAUDE_DIR/rules/orchestra-system.md" ]; then
  say "• rules/orchestra-system.md already exists — left untouched (yours wins). Template is at:"
  say "  $REPO_DIR/orchestra-system.md"
else
  cp "$REPO_DIR/orchestra-system.md" "$CLAUDE_DIR/rules/orchestra-system.md"
  say "✓ constitution → $CLAUDE_DIR/rules/orchestra-system.md (fill in your tools!)"
fi

# --- 4. register the hook in settings.json (safe jq merge) --------------------
if [ ! -f "$SETTINGS" ]; then
  echo '{}' > "$SETTINGS"
fi
cp "$SETTINGS" "$SETTINGS.bak.$(date +%Y%m%d-%H%M%S)"

# Add the UserPromptSubmit hook entry only if orchestra routing isn't already wired —
# match ANY command that references "orchestra-route" (any path/filename), so we don't
# double-inject for users who already route via a differently-named hook.
already="$(jq '
  [.hooks.UserPromptSubmit // [] | .[]? | .hooks[]? | select((.command // "") | test("orchestra-route"))] | length
' "$SETTINGS")"

if [ "$already" -gt 0 ]; then
  say "• hook already registered in settings.json — skipped"
else
  tmp="$(mktemp)"
  jq --arg c "$HOOK_CMD" '
    .hooks //= {} |
    .hooks.UserPromptSubmit //= [] |
    .hooks.UserPromptSubmit += [ { "hooks": [ { "type": "command", "command": $c } ] } ]
  ' "$SETTINGS" > "$tmp" && mv "$tmp" "$SETTINGS"
  say "✓ hook registered in settings.json (backup saved alongside)"
fi

# --- 5. append the orchestra rule to CLAUDE.md (idempotent) -------------------
CLAUDE_MD="$CLAUDE_DIR/CLAUDE.md"
# Match the rule by its text, not a specific heading level — so an existing
# "### Rule 13 — Orchestra System (NON-NEGOTIABLE)" also counts as already-present.
MARKER="Orchestra System (NON-NEGOTIABLE)"
touch "$CLAUDE_MD"
if grep -qF "$MARKER" "$CLAUDE_MD"; then
  say "• orchestra rule already in CLAUDE.md — skipped"
else
  {
    echo ""
    # Extract the fenced rule block from the snippet file
    awk '/^```markdown$/{f=1;next} /^```$/{if(f)exit} f' "$REPO_DIR/CLAUDE-rule-snippet.md"
  } >> "$CLAUDE_MD"
  say "✓ orchestra rule appended to CLAUDE.md"
fi

echo "🎼 Done. Open a new Claude Code session — the router fires on your next prompt."
echo "   Next: edit $CLAUDE_DIR/rules/orchestra-system.md and fill the rosters with your tools."
