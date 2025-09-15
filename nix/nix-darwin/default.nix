{ pkgs, ... }: {
  # nix自体の設定
  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
      max-jobs = 8;
    };
  };

  # システムの設定
  system = {
    primaryUser = "grtw2116";
    stateVersion = 6;
    defaults = {
      NSGlobalDomain.AppleShowAllExtensions = true;
      finder = {
        # 隠しファイルを表示
        AppleShowAllFiles = true;

        # 全てのファイル拡張子を表示
        AppleShowAllExtensions = true;

        # パスバーを表示
        ShowPathbar = true;

        # ステータスバーを表示
        ShowStatusBar = true;
      };
      dock = {
        autohide = true;
        show-recents = false;
      };
    };
  };

  # フォント設定
  fonts = { packages = with pkgs; [ moralerspace ]; };

  # homebrewの設定
  homebrew = {
    enable = true;
    onActivation = { autoUpdate = true; };
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

