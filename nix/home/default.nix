{ username, pkgs, lib, ... }:
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
    homeDirectory = lib.mkForce (
      if pkgs.stdenv.isDarwin
      then "/Users/${username}"
      else "/home/${username}"
    );
    stateVersion = "24.11";
  };

  # Ghosttyの設定ファイルを配置 (macOSのみ)
  xdg.configFile = lib.mkIf pkgs.stdenv.isDarwin {
    "ghostty" = {
      source = ../../ghostty;
      recursive = true;
    };
  };

  # nix-darwin / home-manager standaloneから有効化
  programs.home-manager.enable = true;
}