#!/usr/bin/bash
source "$(dirname "$0")/common-var.sh"

mkdir -p "$XDG_CONFIG_HOME"

# 環境変数設定のため.zshenvはホームディレクトリにも配置
ln -sfv "$REPO_DIR/config/zsh/.zshenv" "$HOME/.zshenv"

# $REPO_DIR/config/内のファイルを全てリンク
ls $REPO_DIR/config | xargs -I{} ln -sfv $REPO_DIR/config/{} $XDG_CONFIG_HOME/{}
