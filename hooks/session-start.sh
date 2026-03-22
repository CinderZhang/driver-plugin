#!/bin/bash
# DRIVER Session Start Hook
# Injects the using-driver skill context at session start.
# Checks for .driver.json to determine if this is a DRIVER project.

# Derive plugin root from this script's location if not set
if [ -z "$CLAUDE_PLUGIN_ROOT" ]; then
    SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
    CLAUDE_PLUGIN_ROOT="$(dirname "$SCRIPT_DIR")"
fi

SKILL_PATH="${CLAUDE_PLUGIN_ROOT}/skills/using-driver/SKILL.md"

if [ -f "$SKILL_PATH" ]; then
    echo "<EXTREMELY-IMPORTANT>"
    cat "$SKILL_PATH"
    echo "</EXTREMELY-IMPORTANT>"
fi
