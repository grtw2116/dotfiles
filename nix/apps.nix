{ pkgs, ... }:
{
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
    masApps = {
      Xcode = 497799835;
    };

    # `brew install`でインストールするパッケージ
    # brews = [
    # ];

    # `brew install --cask`でインストールするパッケージ
    casks = [
      "ghostty"
      "logitech-options"
      "karabiner-elements"
      "claude"
      "godot"
      "block-goose"
      "virtual-desktop-streamer"
      "anki"
      "linearmouse"
    ];
  };
  }
}