{
  description = "Nix設定ファイル (macOS / NixOS-WSL)";

  inputs = {
    # macOS用
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    mac-app-util.url = "github:hraban/mac-app-util";

    # Linux/WSL用
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # 共通
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs-darwin, nixpkgs, darwin, home-manager, mac-app-util, nixos-wsl, ... }:
    let
      username = "grtw2116";

      # --- macOS ---
      darwinSystem = "aarch64-darwin";
      darwinHostname = "grtw2116s-macbook-air";
      darwinSpecialArgs = inputs // { inherit username; hostname = darwinHostname; };

      # --- NixOS (WSL2) ---
      wslSystem = "x86_64-linux";
      wslHostname = "nixos";
      wslSpecialArgs = inputs // { inherit username; hostname = wslHostname; };
    in {
      darwinConfigurations."${darwinHostname}" = darwin.lib.darwinSystem {
        system = darwinSystem;
        specialArgs = darwinSpecialArgs;
        modules = [
          # macOSの構成を管理するモジュール
          ./nix/hosts/darwin/system.nix

          # システム全体 / homebrewでインストールするアプリケーション
          ./nix/hosts/darwin/apps.nix

          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = darwinSpecialArgs;
              users.${username}.imports =
                [ ./nix/home mac-app-util.homeManagerModules.default ];
            };
          }
        ];
      };

      nixosConfigurations."${wslHostname}" = nixpkgs.lib.nixosSystem {
        system = wslSystem;
        specialArgs = wslSpecialArgs;
        modules = [
          nixos-wsl.nixosModules.default
          ./nix/hosts/wsl/system.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = wslSpecialArgs;
              users.${username}.imports = [ ./nix/home ];
            };
          }
        ];
      };
    };
}
