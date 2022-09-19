{ lib, inputs, nixpkgs, nixpkgs-unstable, home-manager, username, theme, ... }:

let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;

  pkgs-unstable = import nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true;
  };

  mkHost = host:
    lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit inputs pkgs-unstable username theme;
      };

      modules = [
        ../nixos
        (./. + "/${host}/configuration.nix")
        {
          networking.hostName = host;
        }
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs pkgs-unstable username theme; };
          home-manager.users.${username} = {
            imports = [
              ../home
              (./. + "/${host}/home.nix")
            ];
          };
        }
      ];
    };
in
{
  sandbox = mkHost "sandbox";
}
