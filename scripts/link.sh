#!/usr/bin/bash
source "$(dirname "$0")/common-var.sh"

mkdir -p "$XDG_CONFIG_HOME"
ln -sfv "$DOT_DIR/config/*" "$XDG_CONFIG_HOME"
