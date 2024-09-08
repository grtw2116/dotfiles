#!/bin/bash
source "$(dirname "$0")/common-var.sh"

# Homebrewのインストール
$REPO_DIR/scripts/homebrew.sh

# tldrのインストール
npm install -g tldr
