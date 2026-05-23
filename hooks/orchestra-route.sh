#!/usr/bin/env bash
# Orchestra System — UserPromptSubmit routing hook
# Injects a routing directive on every prompt so the model activates the right orchestra(s)
# and announces them. Registered in ~/.claude/settings.json under hooks.UserPromptSubmit.
#
# This hook is intentionally simple and dependency-free: it prints a directive to stdout,
# which Claude Code injects into the model's context for the turn.

cat <<'DIRECTIVE'
<orchestra-routing>
🎼 ORCHESTRA SYSTEM ACTIVE — route this request before acting.

1. If it sounds like an IDEA or BUSINESS PLAN ("I have an idea", "thinking of building",
   "plan a business", "what if I built", "is this a good idea") → fire the NEXUS meta-conductor.
2. Otherwise match intent to orchestra(s) and invoke the `orchestra-router` skill for the full
   roster. Stack multiple orchestras for compound requests.
3. ANNOUNCE the activation: 🎼 <ORCHESTRA> active · Conductor: <agent> · Using: <tools>.
4. Reserve Bench tools never auto-fire (explicit name only).

Full doctrine: ~/.claude/rules/orchestra-system.md
</orchestra-routing>
DIRECTIVE
