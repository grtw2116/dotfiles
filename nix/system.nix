{ pkgs, username, ... }:

###################################################################################
#
#  macOS's System configuration
#
#  All the configuration options are documented here:
#    https://daiderd.com/nix-darwin/manual/index.html#sec-options
#  Incomplete list of macOS `defaults` commands :
#    https://github.com/yannbertrand/macos-defaults
#
###################################################################################

{
  # Touch IDでsudo認証
  security.pam.services.sudo_local.touchIdAuth = true;

  # タイムゾーン設定
  time.timeZone = "Asia/Tokyo";

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
    primaryUser = username;
    stateVersion = 6;
    defaults = {

      # Finderの設定
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

      # Dockの設定
      dock = {
        # 自動的にDockを隠す
        autohide = true;

        # 最近使ったアプリを非表示
        show-recents = false;

        # Dockに置くアプリ
        persistent-apps = [
          "/System/Applications/Apps.app/"
          "/System/Applications/Mail.app/"
          "/System/Applications/Calendar.app/"
          "/System/Applications/Music.app/"
          "/System/Applications/System Settings.app/"
          "/Users/${username}/Applications/Home Manager Apps/Google Chrome.app/"
          "/Users/${username}/Applications/Home Manager Apps/Notion.app/"
          "/Users/${username}/Applications/Home Manager Apps/ChatGPT.app/"
          "/Applications/Ghostty.app/"
        ];

      };

      # nix-darwinで直接サポートされていない設定
      # `defaults`コマンドで設定可能なものはここに追加
      # 参照：https://github.com/yannbertrand/macos-defaults
      NSGlobalDomain = { AppleShowAllExtensions = true; };

      CustomUserPreferences = {
        "com.apple.inputmethod.Kotoeri" = { JIMPrefCharacterForYenKey = 1; };
      };
    };
  };

  # フォント設定
  fonts = { packages = with pkgs; [ moralerspace ]; };
}

