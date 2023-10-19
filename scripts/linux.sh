#!/usr/bin/bash
source "$(dirname "$0")/common-var.sh"

# aptパッケージをインストール
$REPO_DIR/scripts/apt.sh
