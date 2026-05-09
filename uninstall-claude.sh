#!/usr/bin/env bash
set -euo pipefail

PLUGIN="sgd@sgd"
MARKETPLACE="sgd"

echo "==> Spec-Guided Development (SGD) — Claude Code plugin uninstaller"
echo ""

# ── 1. Verify claude CLI is available ────────────────────────────────────────
if ! command -v claude &>/dev/null; then
  echo "Error: 'claude' CLI not found. Install Claude Code first:"
  echo "  https://claude.ai/code"
  exit 1
fi

# ── 2. Uninstall the plugin ───────────────────────────────────────────────────
echo "==> Uninstalling $PLUGIN ..."
claude plugins uninstall "$PLUGIN" 2>/dev/null && echo "  uninstalled" || echo "  not installed — skipping"

# ── 3. Remove SGD marketplace ────────────────────────────────────────────────
echo "==> Removing SGD marketplace ..."
claude plugins marketplace remove "$MARKETPLACE" 2>/dev/null && echo "  removed" || echo "  not registered — skipping"

echo ""
echo "Done. SGD plugin removed. Restart Claude Code to apply."
