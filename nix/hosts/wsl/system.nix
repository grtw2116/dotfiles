{ username, ... }:

###################################################################################
#
#  NixOS-WSL System Configuration
#
#  https://github.com/nix-community/NixOS-WSL
#
###################################################################################

{
  # WSLの基本設定
  wsl = {
    enable = true;
    defaultUser = username;
  };

  # タイムゾーン設定
  time.timeZone = "Asia/Tokyo";

  # ロケール設定
  i18n.defaultLocale = "en_US.UTF-8";

  # nix自体の設定
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      max-jobs = "auto";
    };
  };

  # ユーザー設定
  users.users.${username} = {
    isNormalUser = true;
    shell = "/run/current-system/sw/bin/zsh";
  };

  environment.systemPackages = [ ];

  # zshをシステムシェルとして有効化
  programs.zsh.enable = true;

  system.stateVersion = "24.11";
}
