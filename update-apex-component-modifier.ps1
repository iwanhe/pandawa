# ============================================================
# update-apex-component-modifier.ps1
# Update skill apex-component-modifier dari upstream:
#   https://github.com/avhrst/apex-component-modifier
#
# Struktur baru (repo avhrst):
#   .claude/skills/apex/     → skill APEX component modifier
#   .claude/skills/sqlcl/    → skill SQLcl (BARU)
#   .claude/commands/        → slash commands (apex-describe, apex-export, apex-learn, sqlcl)
#   .claude/agents/          → sub-agents reviewer
#
# Target install (Claude.ai skills):
#   D:\0. KCSI\Github\pandawa\skills\apex-component-modifier\
#
# Dijalankan dari: D:\0. KCSI\Github\pandawa\
# ============================================================

$ErrorActionPreference = "Stop"

$SKILLS_ROOT = "D:\0. KCSI\Github\pandawa\skills"
$TARGET_APEX = "$SKILLS_ROOT\apex-component-modifier"
$TARGET_SQLCL = "$SKILLS_ROOT\sqlcl"
$TMP_DIR = "$env:TEMP\apex-skill-update"
$REPO_URL = "https://github.com/avhrst/apex-component-modifier.git"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host " Update apex-component-modifier" -ForegroundColor Cyan
Write-Host " Source: $REPO_URL" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# --- 1. Clone repo ke temp dir ---
Write-Host "[1/5] Cloning repo upstream..." -ForegroundColor Yellow
if (Test-Path $TMP_DIR) {
    Remove-Item -Recurse -Force $TMP_DIR
}
git clone $REPO_URL $TMP_DIR --depth 1 --quiet
if ($LASTEXITCODE -ne 0) { throw "Git clone gagal." }
Write-Host "      OK: repo di-clone ke $TMP_DIR" -ForegroundColor Green

# --- 2. Backup skill lama ---
$BACKUP_DIR = "$SKILLS_ROOT\_backup_apex_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
Write-Host ""
Write-Host "[2/5] Backup skill lama ke $BACKUP_DIR ..." -ForegroundColor Yellow
if (Test-Path $TARGET_APEX) {
    Copy-Item -Recurse -Force $TARGET_APEX $BACKUP_DIR
    Write-Host "      OK: backup di $BACKUP_DIR" -ForegroundColor Green
} else {
    Write-Host "      SKIP: folder lama tidak ditemukan, tidak perlu backup." -ForegroundColor DarkYellow
}

# --- 3. Update skill apex (apex-component-modifier) ---
Write-Host ""
Write-Host "[3/5] Update skill apex-component-modifier..." -ForegroundColor Yellow

# Hapus & buat ulang target
if (Test-Path $TARGET_APEX) {
    Remove-Item -Recurse -Force $TARGET_APEX
}
New-Item -ItemType Directory -Force $TARGET_APEX | Out-Null

# Copy semua isi .claude/skills/apex/ ke target
$SRC_APEX = "$TMP_DIR\.claude\skills\apex"
Copy-Item -Recurse -Force "$SRC_APEX\*" $TARGET_APEX

Write-Host "      OK: skill apex diperbarui." -ForegroundColor Green
Write-Host "      Files:" -ForegroundColor Gray
Get-ChildItem -Recurse $TARGET_APEX -File | ForEach-Object {
    Write-Host ("         " + $_.FullName.Replace($TARGET_APEX, "").TrimStart('\')) -ForegroundColor Gray
}

# --- 4. Install skill sqlcl (BARU) ---
Write-Host ""
Write-Host "[4/5] Install skill sqlcl (baru)..." -ForegroundColor Yellow

if (-not (Test-Path $TARGET_SQLCL)) {
    New-Item -ItemType Directory -Force $TARGET_SQLCL | Out-Null
}

$SRC_SQLCL = "$TMP_DIR\.claude\skills\sqlcl"
Copy-Item -Recurse -Force "$SRC_SQLCL\*" $TARGET_SQLCL

Write-Host "      OK: skill sqlcl diinstall." -ForegroundColor Green
Write-Host "      Files:" -ForegroundColor Gray
Get-ChildItem -Recurse $TARGET_SQLCL -File | ForEach-Object {
    Write-Host ("         " + $_.FullName.Replace($TARGET_SQLCL, "").TrimStart('\')) -ForegroundColor Gray
}

# --- 5. Tampilkan info commands & agents (tidak di-copy karena untuk Claude Code, bukan claude.ai) ---
Write-Host ""
Write-Host "[5/5] Info: Commands & Agents (untuk Claude Code saja)" -ForegroundColor Yellow
Write-Host "      Jika pakai Claude Code, copy manual:" -ForegroundColor Gray
Write-Host "      - $TMP_DIR\.claude\commands\ → .claude\commands\ di project kamu" -ForegroundColor Gray
Write-Host "      - $TMP_DIR\.claude\agents\   → .claude\agents\ di project kamu" -ForegroundColor Gray
Write-Host ""
Write-Host "      Commands tersedia:" -ForegroundColor Gray
Get-ChildItem "$TMP_DIR\.claude\commands\" -File | ForEach-Object { Write-Host "         /$($_.BaseName)" -ForegroundColor Gray }
Write-Host "      Agents tersedia:" -ForegroundColor Gray
Get-ChildItem "$TMP_DIR\.claude\agents\" -File | ForEach-Object { Write-Host "         $($_.BaseName)" -ForegroundColor Gray }

# --- Cleanup ---
Remove-Item -Recurse -Force $TMP_DIR

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host " SELESAI!" -ForegroundColor Green
Write-Host ""
Write-Host " Skill diperbarui:" -ForegroundColor White
Write-Host "   apex-component-modifier → $TARGET_APEX" -ForegroundColor White
Write-Host "   sqlcl (baru)            → $TARGET_SQLCL" -ForegroundColor White
Write-Host ""
Write-Host " Yang baru di versi ini:" -ForegroundColor White
Write-Host "   global-patterns: +authorization, +automation, +lov, +map_region," -ForegroundColor White
Write-Host "                    +navigation, +page_branch, +page_computation," -ForegroundColor White
Write-Host "                    +page_process, +page_validation, +web_source" -ForegroundColor White
Write-Host "   skill sqlcl: SQLcl MCP references & templates" -ForegroundColor White
Write-Host "========================================" -ForegroundColor Cyan
