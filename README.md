# dotfiles

macOS (nix-darwin) / WSL2 (NixOS-WSL) / Windows 向けの個人dotfiles。

## 対応環境

| 環境 | ツール | 設定先 |
|---|---|---|
| macOS (Apple Silicon) | nix-darwin + home-manager | `nix/hosts/darwin/`, `nix/home/` |
| WSL2 (NixOS-WSL) | NixOS + home-manager | `nix/hosts/wsl/`, `nix/home/` |
| Windows本体 | PowerShell + winget | `windows/setup.ps1` |

## リポジトリ構成

```
dotfiles/
├── flake.nix              # Nixエントリポイント (Mac + WSL2)
├── flake.lock
├── nvim/                  # Neovim設定 (全環境共通)
├── ghostty/               # Ghostty設定 (macOSのみ)
├── windows/
│   └── setup.ps1          # Windows本体セットアップスクリプト
└── nix/
    ├── hosts/
    │   ├── darwin/        # macOS固有の設定
    │   │   ├── system.nix # nix-darwinシステム設定 (Finder, Dock等)
    │   │   └── apps.nix   # Homebrew cask管理
    │   └── wsl/
    │       └── system.nix # NixOS-WSLシステム設定
    └── home/              # home-manager設定 (Mac/WSL共通)
        ├── default.nix
        ├── apps.nix       # パッケージ管理 (Mac固有はisDarwinで分岐)
        ├── git.nix
        ├── neovim.nix
        └── shell.nix
```

---

## macOS セットアップ

### 前提条件

- [Nix](https://nixos.org/download/) インストール済み

### 適用

```bash
darwin-rebuild switch --flake github:grtw2116/dotfiles#grtw2116s-macbook-air
```

初回は `nix run nix-darwin -- switch --flake .` を使用。

---

## WSL2 (NixOS) セットアップ

### 1. NixOS-WSLのインストール

[NixOS-WSL releases](https://github.com/nix-community/NixOS-WSL/releases) から最新の `.wsl` をダウンロード。

```powershell
# PowerShell
wsl --import NixOS $env:USERPROFILE\NixOS .\nixos-wsl.tar.gz
wsl -d NixOS
```

### 2. dotfilesの適用

```bash
# NixOS内
git clone https://github.com/grtw2116/dotfiles ~/dotfiles
cd ~/dotfiles
sudo nixos-rebuild switch --flake .#nixos
```

---

## Windows本体 セットアップ

PowerShellを**管理者**として実行:

```powershell
Set-ExecutionPolicy Bypass -Scope Process
git clone https://github.com/grtw2116/dotfiles $env:USERPROFILE\dotfiles
cd $env:USERPROFILE\dotfiles
.\windows\setup.ps1
```

インストールされるもの:

- Neovim
- lazygit
- ripgrep
- eza
- Git

Neovim設定は `%LOCALAPPDATA%\nvim` → `dotfiles/nvim/` のシンボリックリンクで同期。

> [!NOTE]
> シンボリックリンク作成には**開発者モード**が必要です。
> 設定 → プライバシーとセキュリティ → 開発者向け → 開発者モード をオンにしてください。
