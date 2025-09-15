{
  description = "macOS用Nix設定ファイル";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # HomebrewそのもののインストールをNixで管理
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ nixpkgs, home-manager, nix-darwin, nix-homebrew, ... }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        config.allowUnfree = true;
      };
      username = "grtw2116";
      hostname = "grtw2116s-macbook-air";
    in {
      # Profileの更新をスクリプト化 (nix run .#update)
      apps.${system}.update = {
        type = "app";
        program = toString (pkgs.writeShellScript "update-script" ''
          set -e
          echo "Updating flake..."
          nix flake update
          echo "Updating nix-darwin..."
          darwin-rebuild switch --flake .
          echo "Update complete!"
        '');
      };

      # nix-darwin
      darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
        inherit system specialArgs;
        modules = [
          # macOSの構成を管理するモジュール
          ./nix/system.nix

          # システム全体 / homebrewでインストールするアプリケーション
          ./nix/apps.nix

          home-manager.darwinModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${username} = import ./nix/home;
            };
          }
        ];
      };
    };
}
