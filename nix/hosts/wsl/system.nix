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
    docker-desktop.enable = true;
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

  # unfree パッケージのインストールを許可
  nixpkgs.config.allowUnfree = true;

  # ユーザー設定
  users.users.${username} = {
    isNormalUser = true;
    shell = "/run/current-system/sw/bin/zsh";
    extraGroups = [ "docker" ];
  };

  # Docker
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      daemon.settings = {
        features.cdi = true;
        cdi-spec-dirs = [ "/home/${username}/.cdi" ];
      };
    };
    daemon.settings = {
      features.cdi = true;
    };
  };

  hardware = {
    nvidia-container-toolkit = {
      enable = true;
      suppressNvidiaDriverAssertion = true;
    };
  };

  # WSL2環境ではネイティブなNVIDIAドライバ(nvml)が存在しないため、
  # nvidia-container-toolkit-cdi-generator がエラー終了します。
  # このサービスを無効化することでビルドの失敗を防ぎます。
  systemd.services.nvidia-container-toolkit-cdi-generator.enable = false;

  environment.systemPackages = [ ];

  # Tailscale VPN
  services.tailscale.enable = true;
  networking.firewall.trustedInterfaces = [ "tailscale0" ];

  # zshをシステムシェルとして有効化
  programs.zsh.enable = true;

  # NixOS上のプログラムがWSLのマウントしたGPUライブラリを見つけられるようにする
  # LD_LIBRARY_PATH は文字列で指定する必要がある
  environment.variables = {
    LD_LIBRARY_PATH = "/usr/lib/wsl/lib";
  };

  system.stateVersion = "24.11";
}
