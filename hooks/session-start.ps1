# DRIVER Session Start Hook (PowerShell)
# Conditional injection based on whether a DRIVER project exists.

# Derive plugin root from this script's location if not set
if (-not $env:CLAUDE_PLUGIN_ROOT) {
    $ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    $env:CLAUDE_PLUGIN_ROOT = Split-Path -Parent $ScriptDir
}

$SkillPath = Join-Path $env:CLAUDE_PLUGIN_ROOT "skills\using-driver\SKILL.md"

# Check if this is a DRIVER project
if (Test-Path ".driver.json") {
    # Active DRIVER project - inject full context
    if (Test-Path $SkillPath) {
        Write-Output "<EXTREMELY-IMPORTANT>"
        Get-Content $SkillPath -Raw
        Write-Output ""
        Write-Output "A DRIVER project exists here. Read .driver.json and check project status."
        Write-Output "</EXTREMELY-IMPORTANT>"
    }
} else {
    # No DRIVER project - single line discovery nudge
    Write-Output "DRIVER(TM) finance plugin is installed. Start a project with /finance-driver:init or see /finance-driver:help for an overview."
}
