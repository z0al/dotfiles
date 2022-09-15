{ lib, inputs, nixpkgs, home-manager, username, ... }:

let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;

  mkHost = host:
    lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit inputs username;
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
          home-manager.extraSpecialArgs = { inherit inputs username; };
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
