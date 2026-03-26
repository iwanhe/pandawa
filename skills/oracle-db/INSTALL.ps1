# Oracle DB Skills - Installer Script
# Source: https://github.com/iwanhe/oracle-db-skills
# Run from: D:\0. KCSI\Github\pandawa\skills\oracle-db\
# Usage: .\INSTALL.ps1

$ErrorActionPreference = "Stop"
$SkillsDir = $PSScriptRoot
$TempDir = "$env:TEMP\iwanhe-oracle-db-skills"

Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "  Oracle DB Skills Installer (iwanhe fork)"        -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Target: $SkillsDir" -ForegroundColor Yellow
Write-Host ""

# Clone or pull latest
if (Test-Path "$TempDir\.git") {
    Write-Host "[1/3] Updating existing clone..." -ForegroundColor Green
    Push-Location $TempDir
    git pull origin main
    Pop-Location
} else {
    Write-Host "[1/3] Cloning iwanhe/oracle-db-skills..." -ForegroundColor Green
    git clone https://github.com/iwanhe/oracle-db-skills.git $TempDir
}

# Create all category dirs
Write-Host "[2/3] Creating directories..." -ForegroundColor Green
$categories = @("admin","appdev","architecture","containers","design","devops",
                "features","migrations","monitoring","ords","performance",
                "plsql","security","sql-dev","sqlcl")
foreach ($cat in $categories) {
    New-Item -ItemType Directory -Force -Path "$SkillsDir\$cat" | Out-Null
}

# Copy all skill files + root meta files
Write-Host "[3/3] Copying skill files..." -ForegroundColor Green
Copy-Item "$TempDir\skills\*" -Destination $SkillsDir -Recurse -Force
Copy-Item "$TempDir\SKILL.md"    "$SkillsDir\SKILL.md"    -Force
Copy-Item "$TempDir\SKILLS.md"   "$SkillsDir\SKILLS.md"   -Force
Copy-Item "$TempDir\CLAUDE.md"   "$SkillsDir\CLAUDE.md"   -Force
Copy-Item "$TempDir\AGENTS.md"   "$SkillsDir\AGENTS.md"   -Force

# Count files
$fileCount = (Get-ChildItem "$SkillsDir" -Recurse -Filter "*.md").Count
Write-Host ""
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "  Done! $fileCount skill files installed."          -ForegroundColor Green
Write-Host "==================================================" -ForegroundColor Cyan

# Cleanup temp
Remove-Item $TempDir -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Temp files cleaned up." -ForegroundColor Gray
