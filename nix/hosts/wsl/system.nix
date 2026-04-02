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
        cdi-spec-dirs = [ "/home/${username}/.cdi" "/var/run/cdi" ];
      };
    };
    daemon.settings = {
      features.cdi = true;
      cdi-spec-dirs = [ "/var/run/cdi" ];
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

  # WSLのNVIDIAドライバのパス（nv_dispi.inf...）が更新される問題への対応
  system.activationScripts.wsl-nvidia-cdi-fix = {
    text = ''
      # 動的にWSLのNVIDIAドライバのパスを解決してCDI設定を生成
      SRC_TEMPLATE="/home/${username}/.cdi/nvidia.yml"
      DEST_YAML="/var/run/cdi/nvidia-wsl.yaml"
      
      if [ -f "$SRC_TEMPLATE" ]; then
        WSL_CUDA_LIB=$(readlink -f /usr/lib/wsl/lib/libcuda.so 2>/dev/null || true)
        if [ -n "$WSL_CUDA_LIB" ]; then
          NEW_DRIVER_DIR=$(basename $(dirname "$WSL_CUDA_LIB"))
          mkdir -p /var/run/cdi
          
          # テンプレートをコピー
          cp "$SRC_TEMPLATE" "$DEST_YAML"
          
          # 1. パスのハッシュ部分(nv_dispi.inf_amd64_...)を最新に置換
          sed -i -E "s/nv_dispi\.inf_amd64_[a-f0-9]{16}/$NEW_DRIVER_DIR/g" "$DEST_YAML"
          
          # 2. nvidia-ctk コマンドのパスをNix Storeキャッシュからシステム不変のパスに置換
          sed -i -E "s|/nix/store/[a-z0-9]{32}-nvidia-container-toolkit-[0-9\.]+/bin/nvidia-ctk|/run/current-system/sw/bin/nvidia-ctk|g" "$DEST_YAML"
        fi
      fi
    '';
  };

  system.stateVersion = "24.11";
}
