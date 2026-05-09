#!/usr/bin/env bash
set -euo pipefail

PLUGIN="sgd@sgd"
MARKETPLACE="sgd"
REPO_URL="https://github.com/rsgopal/SGD.git"
RAW_URL="https://raw.githubusercontent.com/rsgopal/SGD/main"

echo "==> Spec-Guided Development (SGD) — Claude Code plugin installer"
echo ""

# ── 1. Verify claude CLI is available ────────────────────────────────────────
if ! command -v claude &>/dev/null; then
  echo "Error: 'claude' CLI not found. Install Claude Code first:"
  echo "  https://claude.ai/code"
  exit 1
fi

# ── 2. Uninstall any existing version cleanly ────────────────────────────────
bash <(curl -fsSL "$RAW_URL/uninstall.sh")
echo ""

# ── 3. Register SGD marketplace ──────────────────────────────────────────────
echo "==> Registering SGD marketplace ..."
claude plugins marketplace add "$REPO_URL" --scope user
echo "  registered"

# ── 4. Install ────────────────────────────────────────────────────────────────
echo "==> Installing $PLUGIN ..."
claude plugins install "$PLUGIN"

echo ""
echo "Done! Restart Claude Code. SGD skills are now available:"
echo ""
echo "  /triage    — Classify a problem using the Cynefin framework before committing to an approach"
echo ""
