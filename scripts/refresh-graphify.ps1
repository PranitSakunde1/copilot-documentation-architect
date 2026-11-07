[CmdletBinding()]
param([switch]$Deep)

$ErrorActionPreference = "Stop"

if (-not (Get-Command graphify -ErrorAction SilentlyContinue)) {
    throw "Graphify CLI not found. Install with: uv tool install graphifyy"
}

if (-not (Test-Path ".git")) {
    Write-Warning "No .git directory found. Run this from the repository root."
}

if ($Deep) {
    Write-Host "Refresh the graph in Copilot Chat using: /graphify . --mode deep"
} else {
    Write-Host "Refresh the graph in Copilot Chat using: /graphify . --update"
}

Write-Host "Graphify mapping is invoked from the Copilot assistant skill, not by this wrapper."
