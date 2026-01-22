#!/usr/bin/env bash
# Initialize the content bank structure and add reminders to CLAUDE.md and AGENTS.md
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$(dirname "$SCRIPT_DIR")"
PROJECT_ROOT="${PROJECT_ROOT:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}"
CONTENT_BANK_DIR="$PROJECT_ROOT/content-bank"

REMINDER_MARKER="<!-- CONTENT-BANK-REMINDER -->"

# Function to check if reminder already exists in a file
reminder_exists() {
  local file="$1"
  [[ -f "$file" ]] && grep -q "$REMINDER_MARKER" "$file"
}

# Function to add reminder to a file
add_reminder() {
  local file="$1"
  cat >> "$file" << 'EOF'

<!-- CONTENT-BANK-REMINDER -->
## Content Bank Skill

When writing or coding, the **content-bank** skill is available:
- **Store** - Bank reusable writing (ideas, snippets, outlines) or code patterns
- **Retrieve** - Retrieve previously banked content for your current work
- **List** - Browse topics and banked content
- Reference `skills/content-bank/SKILL.md` for details
<!-- END CONTENT-BANK-REMINDER -->
EOF
}

echo "Initializing content bank..."
echo ""

# Create content-bank directory structure
mkdir -p "$CONTENT_BANK_DIR"

# Create topics.md index
if [[ ! -f "$CONTENT_BANK_DIR/topics.md" ]]; then
  cat > "$CONTENT_BANK_DIR/topics.md" << 'EOF'
# Content Bank Topics

A navigable index of all banked content topics.

## Topics

<!-- Add topics here as you bank content -->
<!-- Format: - [topic-name](./topic-name/) - Brief description -->

*No topics yet. Bank your first idea, snippet, or outline to get started.*
EOF
  echo "Created: content-bank/topics.md"
else
  echo "Skipped: content-bank/topics.md (already exists)"
fi

# Add reminder to CLAUDE.md
CLAUDE_MD="$PROJECT_ROOT/CLAUDE.md"

if [[ -f "$CLAUDE_MD" ]]; then
  if reminder_exists "$CLAUDE_MD"; then
    echo "Skipped: CLAUDE.md (reminder already present)"
  else
    add_reminder "$CLAUDE_MD"
    echo "Updated: CLAUDE.md with content bank reminder"
  fi
else
  echo "Warning: CLAUDE.md not found at project root"
fi

# Add reminder to AGENTS.md
AGENTS_MD="$PROJECT_ROOT/AGENTS.md"

if [[ -f "$AGENTS_MD" ]]; then
  if reminder_exists "$AGENTS_MD"; then
    echo "Skipped: AGENTS.md (reminder already present)"
  else
    add_reminder "$AGENTS_MD"
    echo "Updated: AGENTS.md with content bank reminder"
  fi
else
  echo "Warning: AGENTS.md not found at project root"
fi

echo ""
echo "Content bank initialization complete!"
echo ""
echo "Structure created:"
echo "  content-bank/"
echo "  └── topics.md"
echo ""
echo "Next steps:"
echo "  1. Start drafting content"
echo "  2. Use bank:store to bank reusable ideas, snippets, or outlines"
echo "  3. Use bank:retrieve to find banked content when writing"
echo "  4. Use bank:list to browse your content bank"
