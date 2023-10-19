#!/usr/bin/bash

# dotfilesのレポジトリがあるパスを取得
export DOT_DIR="$(cd "$(dirname "$0")" && pwd)"

# OSごとの処理
kernel_name=$(uname)
if [ ${kernel_name} = "Darwin" ]; then
    $DOT_DIR/scripts/macos.sh
elif [ ${kernel_name} = "Linux" ]; then
    $DOT_DIR/scripts/linux.sh
fi

# リンクを張る
$DOT_DIR/scripts/link.sh
