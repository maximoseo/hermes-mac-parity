#!/bin/bash
# Hermes Desktop — one-line macOS bootstrap (no gh/git/brew required; curl only)
set -uo pipefail
BASE="https://raw.githubusercontent.com/maximoseo/hermes-mac-parity/master"
WORK="$HOME/hermes-mac-parity"
echo "== Downloading the Maximo SEO Hermes parity bundle"
mkdir -p "$WORK/rules" "$WORK/skills" && cd "$WORK"
curl -fsSL "$BASE/rules/AGENTS.md" -o rules/AGENTS.md
curl -fsSL "$BASE/rules/CLAUDE.md" -o rules/CLAUDE.md 2>/dev/null || true
curl -fsSL "$BASE/install-mac.sh" -o install-mac.sh
echo "== Downloading the skills bundle (92MB)..."
curl -fsSL "$BASE/skills/agents-skills.tar.gz" -o skills/agents-skills.tar.gz
chmod +x install-mac.sh
echo "== Running the installer"
bash install-mac.sh
