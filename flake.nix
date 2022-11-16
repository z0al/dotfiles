{
  description = "My NixOS ❄ Configuration";

  inputs = {
    stable.url = "github:nixos/nixpkgs/nixos-22.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    hm.url = "github:nix-community/home-manager/release-22.05";
    hm.inputs.nixpkgs.follows = "stable";

    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";

    # Literally only imported for the `rakeLeaves` helper
    digga.url = "github:divnix/digga";
    digga.inputs.nixpkgs.follows = "stable";
    digga.inputs.nixlib.follows = "stable";
    digga.inputs.home-manager.follows = "hm";
  };

  outputs =
    { self
    , stable
    , unstable
    , hm
    , utils
    , digga
    } @ inputs:
    let
      inherit (utils.lib) mkFlake mergeAny;
      inherit (digga.lib) rakeLeaves;

      user = "z0al";

      homeManagerDefaults = {
        useGlobalPkgs = true;
        useUserPackages = true;

        extraSpecialArgs = {
          _ = {
            inherit user;
            hmModules = rakeLeaves ./home;
          };
        };
      };

      nixosHostDefaults = {
        channelName = "stable";
        system = "x86_64-linux";
        output = "nixosConfigurations";

        specialArgs = {
          _ = {
            inherit user;
            sysModules = rakeLeaves ./system/nixos;
          };
        };
      };

      importHosts = dir:
        with stable.lib;
        mapAttrs
          (n: v: (mergeAny nixosHostDefaults {
            modules = [
              hm.nixosModules.home-manager
              ./system/shared
              v.system
              {
                home-manager = mergeAny homeManagerDefaults {
                  users.${user} = import v.home;
                };
              }
            ];
          }))
          (rakeLeaves dir);
    in
    mkFlake {
      inherit self inputs;

      channelsConfig = {
        allowUnfree = true;
      };

      channels = {
        stable = { };
        unstable = { };
      };

      hosts = mergeAny (importHosts ./hosts) {
        # custom host attributes go here
      };
    };
}
