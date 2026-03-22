#!/bin/bash
# DRIVER Session Start Hook
# Conditional injection based on whether a DRIVER project exists.

# Derive plugin root from this script's location if not set
if [ -z "$CLAUDE_PLUGIN_ROOT" ]; then
    SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
    CLAUDE_PLUGIN_ROOT="$(dirname "$SCRIPT_DIR")"
fi

SKILL_PATH="${CLAUDE_PLUGIN_ROOT}/skills/using-driver/SKILL.md"

# Check if this is a DRIVER project
if [ -f ".driver.json" ]; then
    # Active DRIVER project — inject full context
    if [ -f "$SKILL_PATH" ]; then
        echo "<EXTREMELY-IMPORTANT>"
        cat "$SKILL_PATH"
        echo ""
        echo "A DRIVER project exists here. Read .driver.json and check project status."
        echo "</EXTREMELY-IMPORTANT>"
    fi
else
    # No DRIVER project — single line discovery nudge
    echo "DRIVER™ finance plugin is installed. Start a project with /finance-driver:init or see /finance-driver:help for an overview."
fi
