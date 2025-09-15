{
  description = "A very basic flake";

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
      overlays = [ (import ./nix/overlays/claude-code.nix) ];
      pkgs = import nixpkgs {
        inherit system overlays;
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
        system = system;
        specialArgs = inputs;
        modules = [
          # macOSの構成を管理するモジュール
          ./nix/nix-darwin

          # モジュール版home-manager
          home-manager.darwinModules.home-manager
          {
            users.users.${username}.home = "/Users/${username}";
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${username} = import ./nix/home-manager;
            };
          }

          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "grtw2116";
            };
          }
        ];
        pkgs = pkgs;
      };
    };
}
