#!/usr/bin/env bash
# Install the Modern Software Engineering Guide as a Claude Code skill + slash commands.
# Usage:  bash claude/install.sh
# Re-runnable (idempotent). Installs into ~/.claude/.
set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${CLAUDE_HOME:-$HOME/.claude}"

echo "→ Installing into: $DEST"
mkdir -p "$DEST/skills" "$DEST/commands"

# 1) Skill (engineering-standards) — SKILL.md + SPEC.md + templates/
cp -R "$SRC_DIR/skills/engineering-standards" "$DEST/skills/"

# Keep the skill's SPEC.md in sync with the repo's canonical root SPEC.md if present
if [ -f "$SRC_DIR/../SPEC.md" ]; then
  cp "$SRC_DIR/../SPEC.md" "$DEST/skills/engineering-standards/SPEC.md"
fi

# 2) Slash commands (/mse:check, /mse:review, /mse:init, /mse:onboard, /mse:fix)
cp -R "$SRC_DIR/commands/mse" "$DEST/commands/"

echo "✓ Installed skill: engineering-standards"
echo "✓ Installed commands: /mse:check  /mse:review  /mse:init  /mse:onboard  /mse:fix"
echo
echo "Optional — make every session aware of the standard:"
echo "  add a pointer to ~/CLAUDE.md (or your global CLAUDE.md). See README §安装."
echo
echo "Done. Try:  /mse:check"
