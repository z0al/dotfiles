{ lib, inputs, nixpkgs, home-manager, username, ...}:

let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;
in
{
  sandbox = lib.nixosSystem {
    inherit system;

    specialArgs = {
      inherit inputs username;
    };

    modules = [
      ./sandbox
      ../nixos

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit username; };
        home-manager.users.${username} = {
          imports = [(import ../home)] ++ [(import ./sandbox/home.nix)];
        };
      }
    ];
  };
}
