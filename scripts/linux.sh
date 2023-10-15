#!/usr/bin/bash
source "$(dirname "$0")/common-var.sh"

# aptパッケージをインストール
sudo $REPO_DIR/scripts/apt.sh
