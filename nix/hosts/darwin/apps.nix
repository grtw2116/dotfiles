{ ... }: {
  nixpkgs.config.allowUnfree = true;

  homebrew = {
    enable = true;

    onActivation = {
      # homebrewのgitレポジトリから最新版をフェッチ
      autoUpdate = true;

      # 古いcask、formulae、App Storeアプリを更新
      upgrade = true;

      # 生成されたbrewfileに載っていないパッケージをアンインストール
      cleanup = "zap";
    };

    # masを使用してMac App Storeアプリをインストール
    # 重要：Apple Accountに紐付けるために、最初にApp Storeから**手動で**インストールする必要あり
    # masApps = { Kindle = 302584613; };

    # `brew install`でインストールするパッケージ
    # brews = [
    # ];

    # `brew install --cask`でインストールするパッケージ
    casks = [
      "ghostty"
      "karabiner-elements"
      "claude"
      "virtual-desktop-streamer"
      "anki"
      "linearmouse"
      "sonobus"
      "antigravity"
      "chatgpt"
      "craft"
      "raspberry-pi-imager"
      "splashtop-business"
      "visual-studio-code"
      "obsidian"
      "discord"
    ];
  };
}

