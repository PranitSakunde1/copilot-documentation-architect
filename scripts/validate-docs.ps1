[CmdletBinding()]
param([string]$DocsPath = "docs")

$ErrorActionPreference = "Stop"
$failed = 0
$warnings = 0

if (-not (Test-Path -LiteralPath $DocsPath -PathType Container)) {
    Write-Error "Documentation directory '$DocsPath' does not exist."
    exit 2
}

$root = (Resolve-Path -LiteralPath $DocsPath).Path
$markdownFiles = Get-ChildItem -LiteralPath $root -Recurse -File -Filter "*.md"

if ($markdownFiles.Count -eq 0) {
    Write-Host "FAIL: No Markdown files found."
    exit 1
}

Write-Host "Checking $($markdownFiles.Count) Markdown files under $root"

foreach ($file in $markdownFiles) {
    $content = Get-Content -LiteralPath $file.FullName -Raw
    $relative = [IO.Path]::GetRelativePath((Get-Location).Path, $file.FullName)

    $fenceCount = ([regex]::Matches($content, '(?m)^\x60\x60\x60')).Count
    if (($fenceCount % 2) -ne 0) {
        Write-Host "FAIL: Unbalanced code fences: $relative"
        $failed++
    }

    $mermaidMatches = [regex]::Matches($content, '(?s)```mermaid\s*(.*?)```')
    foreach ($match in $mermaidMatches) {
        if ([string]::IsNullOrWhiteSpace($match.Groups[1].Value)) {
            Write-Host "FAIL: Empty Mermaid block: $relative"
            $failed++
        }
    }

    $linkMatches = [regex]::Matches($content, '!\[[^\]]*\]\(([^)]+)\)|\[[^\]]+\]\(([^)]+)\)')
    foreach ($match in $linkMatches) {
        $target = if ($match.Groups[1].Success) { $match.Groups[1].Value } else { $match.Groups[2].Value }
        $target = $target.Trim().Trim('<','>')
        if ($target -match '^(https?://|mailto:|#|data:)') { continue }
        $target = ($target -split '#')[0]
        if ([string]::IsNullOrWhiteSpace($target)) { continue }
        $target = $target -replace '/', [IO.Path]::DirectorySeparatorChar
        $resolved = Join-Path -Path $file.DirectoryName -ChildPath $target
        if (-not (Test-Path -LiteralPath $resolved)) {
            Write-Host "FAIL: Broken relative link '$target' in $relative"
            $failed++
        }
    }

    if ($content -match '\[NEEDS VERIFICATION\]|\[fill in\]|\[not run') {
        Write-Host "WARN: Review placeholders in $relative"
        $warnings++
    }

    if ($content -match '(?i)(-----BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY-----|AKIA[0-9A-Z]{16}|gh[pousr]_[A-Za-z0-9]{20,})') {
        Write-Host "WARN: Possible secret-like content; inspect manually: $relative"
        $warnings++
    }
}

Write-Host ""
Write-Host "Validation summary: $failed failure(s), $warnings warning(s)."
if ($failed -gt 0) { exit 1 }
exit 0
