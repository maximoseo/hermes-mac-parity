#!/bin/bash
# Hermes Desktop — Maximo SEO fleet parity installer (macOS)
# Owner: Tomer / Maximo SEO. Installs rules, skills and CLIs; auth steps are printed.
set -uo pipefail
echo "== 1/5 Homebrew tools"
command -v brew >/dev/null || { echo "Install Homebrew first: https://brew.sh"; exit 1; }
brew list gh >/dev/null 2>&1 || brew install gh
brew list node >/dev/null 2>&1 || brew install node
brew list doppler >/dev/null 2>&1 || brew install doppler/tap/doppler

echo "== 2/5 Hermes + agent home dirs"
mkdir -p ~/.hermes ~/.agents/skills ~/.claude ~/.cursor

echo "== 3/5 Rules (v13 standing rules — Plannotator cancelled)"
cp rules/AGENTS.md ~/.hermes/AGENTS.md
cp rules/AGENTS.md ~/.agents/AGENTS.md
cp rules/CLAUDE.md ~/.claude/CLAUDE.md 2>/dev/null
cp rules/AGENTS.md ~/.cursor/AGENTS.md

echo "== 4/5 Skills (Maximo SEO fleet skill library)"
tar xzf skills/agents-skills.tar.gz -C ~/.agents/ 2>/dev/null && echo "skills installed: $(ls ~/.agents/skills | wc -l | tr -d ' ')"

echo "== 5/5 Memory CLI (shared Mem0 + Supermemory)"
command -v memory-cli >/dev/null || npm i -g @maximo/memory-cli 2>/dev/null || echo "memory-cli: install later (ask Hermes)"

echo
echo "DONE — 2 one-time auth steps (run once):"
echo "  gh auth login                  # GitHub as maximoseo"
echo "  doppler login                  # Doppler (then: doppler setup)"
echo "Then restart Hermes Desktop."
