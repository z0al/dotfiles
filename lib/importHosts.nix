lib:

let
  inherit (import ./rakeLeaves.nix lib) rakeLeaves;

  user = "z0al";

  homeManagerDefaults = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      _ = {
        inherit user;
        hmModules = rakeLeaves ../home;
      };
    };
  };

  nixosHostDefaults = {
    system = "x86_64-linux";
    output = "nixosConfigurations";

    specialArgs = {
      _ = {
        inherit user;
        sysModules = rakeLeaves ../system/nixos;
      };
    };
  };
in

{
  importHosts = dir:
    lib.mapAttrs
      (n: v: (lib.mergeAny nixosHostDefaults {
        modules = [
          v.system
          {
            home-manager = lib.mergeAny homeManagerDefaults {
              users.${user} = import v.home;
            };
          }
        ];
      }))
      (rakeLeaves dir);
}
