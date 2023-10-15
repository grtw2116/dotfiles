#!/usr/bin/bash
source "$(dirname "$0")/common-var.sh"

# Homebrewのインストール
if type brew > /dev/null; then
    echo "Homebrewはすでにインストールされています．"
else
    echo "Homebrewをインストールします．"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Homebrewのアップデート
echo "Homebrewをアップデートします．"
brew update

# Homebrewのパッケージをインストール
echo "Homebrewのパッケージをインストールします．"
brew bundle install --file "$REPO_DIR/config/homebrew/Brewfile"
