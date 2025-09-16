{ username, lib, ... }:
{
  # サブモジュールをimport
  imports = [
    ./apps.nix
    ./git.nix
    ./neovim.nix
    ./shell.nix
  ];

  # home managerの設定
  home = {
    username = username;
    homeDirectory = lib.mkForce "/Users/${username}";
    stateVersion = "24.11";
  };

  # Ghosttyの設定ファイルを配置
  xdg.configFile = {
    "ghostty" = {
      source = ../../ghostty;
      recursive = true;
    };
  };

  # nix-darwinからhome-managerを有効化
  programs.home-manager.enable = true;
}