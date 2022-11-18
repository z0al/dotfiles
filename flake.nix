{
  description = "My NixOS ❄ Configuration";

  inputs = {
    stable.url = "github:nixos/nixpkgs/nixos-22.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    hm.url = "github:nix-community/home-manager/release-22.05";
    hm.inputs.nixpkgs.follows = "stable";

    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";

    # Literally only included for the `rakeLeaves` helper and should
    # stay that way.
    digga.url = "github:divnix/digga/v0.11.0";
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
      inherit (utils.lib) mkFlake;
      inherit (digga.lib) rakeLeaves;

      user = "z0al";

      mkImportables = dir: {
        inherit user;
        profiles = (rakeLeaves dir);
      };

      mkHmConfig = mod: {
        home-manager = {
          users.${user}.imports = [ mod ];
          extraSpecialArgs = mkImportables ./home;
        };
      };

      mkHosts = dir:
        stable.lib.mapAttrs
          (n: v: {
            modules = [ v.system (mkHmConfig v.home) ];
          })
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

      hostDefaults = {
        channelName = "stable";
        system = "x86_64-linux";

        specialArgs = mkImportables ./system/nixos;

        modules = [
          hm.nixosModules.home-manager
          ./system/shared
        ];
      };

      hosts = mkHosts ./hosts;
    };
}
