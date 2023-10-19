#!/usr/bin/bash
source "$(dirname "$0")/common-var.sh"

mkdir -p "$XDG_CONFIG_HOME"

# 環境変数設定のため.zshenvはホームディレクトリにも配置
ln -sfv "$REPO_DIR/config/zsh/.zshenv" "$HOME/.zshenv"

# bashを使用する場合に備え.zshenvを.bashrcにリンク
ln -sfv "$REPO_DIR/config/zsh/.zshenv" "$HOME/.bashrc"

# $REPO_DIR/config/内のファイルを全てリンク
for p in $REPO_DIR/config/*; do
    ln -sfv "$p" "$XDG_CONFIG_HOME"
done
