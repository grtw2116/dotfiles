{
  description = "macOS用Nix設定ファイル";

  inputs = {
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs dependencies.
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = inputs@{ self, nixpkgs, darwin, home-manager, mac-app-util, ... }:
    let
      system = "aarch64-darwin";
      username = "grtw2116";
      hostname = "grtw2116s-macbook-air";
      overlay = final: prev: {
        sprites = final.callPackage ./nix/pkgs/sprites.nix { };
      };
      specialArgs = inputs // { inherit username hostname; };
    in {
      darwinConfigurations."${hostname}" = darwin.lib.darwinSystem {
        inherit system specialArgs;
        modules = [
          # カスタムパッケージのoverlay
          { nixpkgs.overlays = [ overlay ]; }

          # macOSの構成を管理するモジュール
          ./nix/system.nix

          # システム全体 / homebrewでインストールするアプリケーション
          ./nix/apps.nix

          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = specialArgs;
              users.${username}.imports =
                [ ./nix/home mac-app-util.homeManagerModules.default ];
            };
          }
        ];
      };
    };
}
