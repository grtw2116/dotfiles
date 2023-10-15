#!/usr/bin/bash

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# dotfilesのレポジトリがあるパスを取得
export REPO_DIR="$( cd "$( dirname "$0" )/../" && pwd )"
