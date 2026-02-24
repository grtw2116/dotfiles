# Windows本体 Neovim セットアップスクリプト
# PowerShellで管理者として実行してください
# 実行方法: Set-ExecutionPolicy Bypass -Scope Process; .\windows\setup.ps1

#Requires -RunAsAdministrator

param(
    [string]$DotfilesPath = $PSScriptRoot + "\.."
)

$ErrorActionPreference = "Stop"
$DotfilesPath = Resolve-Path $DotfilesPath

function Write-Step {
    param([string]$Message)
    Write-Host "`n==> $Message" -ForegroundColor Cyan
}

function Write-Success {
    param([string]$Message)
    Write-Host "  [OK] $Message" -ForegroundColor Green
}

function Write-Warn {
    param([string]$Message)
    Write-Host "  [!!] $Message" -ForegroundColor Yellow
}

# ----------------------------------------------------------------
# 開発者モード確認 (シンボリックリンクに必要)
# ----------------------------------------------------------------
Write-Step "開発者モードの確認"
$devMode = Get-ItemProperty `
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" `
    -Name AllowDevelopmentWithoutDevLicense -ErrorAction SilentlyContinue
if ($devMode -and $devMode.AllowDevelopmentWithoutDevLicense -eq 1) {
    Write-Success "開発者モードが有効です"
} else {
    Write-Warn "開発者モードが無効です。シンボリックリンクを作成するには開発者モードを有効にしてください。"
    Write-Warn "設定 > プライバシーとセキュリティ > 開発者向け > 開発者モード"
    Write-Host "  続行しますか? (y/N): " -NoNewline
    $confirm = Read-Host
    if ($confirm -ne "y" -and $confirm -ne "Y") { exit 1 }
}

# ----------------------------------------------------------------
# winget でツールをインストール
# ----------------------------------------------------------------
Write-Step "Neovim のインストール (winget)"
winget install --id Neovim.Neovim --exact --accept-source-agreements --accept-package-agreements
Write-Success "Neovim インストール済み"

Write-Step "lazygit のインストール"
winget install --id JesseDuffield.lazygit --exact --accept-source-agreements --accept-package-agreements
Write-Success "lazygit インストール済み"

Write-Step "ripgrep のインストール"
winget install --id BurntSushi.ripgrep.MSVC --exact --accept-source-agreements --accept-package-agreements
Write-Success "ripgrep インストール済み"

Write-Step "eza のインストール"
winget install --id eza-community.eza --exact --accept-source-agreements --accept-package-agreements
Write-Success "eza インストール済み"

Write-Step "Git のインストール/更新"
winget install --id Git.Git --exact --accept-source-agreements --accept-package-agreements
Write-Success "Git インストール済み"

# ----------------------------------------------------------------
# Neovim 設定ディレクトリへのシンボリックリンクを作成
# ----------------------------------------------------------------
Write-Step "Neovim 設定ファイルのシンボリックリンクを作成"

$nvimSource = Join-Path $DotfilesPath "nvim"
$nvimTarget = Join-Path $env:LOCALAPPDATA "nvim"

if (Test-Path $nvimTarget) {
    if ((Get-Item $nvimTarget).LinkType -eq "SymbolicLink") {
        Write-Warn "$nvimTarget は既にシンボリックリンクです。スキップします。"
    } else {
        Write-Warn "$nvimTarget が既に存在します。バックアップして置き換えます..."
        Rename-Item $nvimTarget "$nvimTarget.bak"
        New-Item -ItemType SymbolicLink -Path $nvimTarget -Target $nvimSource | Out-Null
        Write-Success "シンボリックリンクを作成しました: $nvimTarget -> $nvimSource"
    }
} else {
    New-Item -ItemType SymbolicLink -Path $nvimTarget -Target $nvimSource | Out-Null
    Write-Success "シンボリックリンクを作成しました: $nvimTarget -> $nvimSource"
}

# ----------------------------------------------------------------
# 完了
# ----------------------------------------------------------------
Write-Host "`n" + ("=" * 60) -ForegroundColor Green
Write-Host "セットアップが完了しました!" -ForegroundColor Green
Write-Host ("=" * 60) -ForegroundColor Green
Write-Host ""
Write-Host "次のコマンドでNeovimが起動するか確認してください:"
Write-Host "  nvim" -ForegroundColor Yellow
Write-Host ""
Write-Host "注意: PATHが通っていない場合は一度PowerShellを再起動してください。"
