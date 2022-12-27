{
  description = "My NixOS ❄ Configuration";

  inputs = {
    stable.url = "github:nixos/nixpkgs/nixos-22.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    hm.url = "github:nix-community/home-manager/release-22.11";
    hm.inputs.nixpkgs.follows = "stable";

    hardware.url = "github:NixOS/nixos-hardware/master";

    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";

    # Only included for the use of these helpers:
    # - rakeLeaves
    # - flattenTree
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
    , hardware
    , utils
    , digga
    } @ inputs:
    let
      inherit (utils.lib) mkFlake mergeAny;
      inherit (digga.lib) flattenTree rakeLeaves;

      user = "z0al";

      # Supported values:
      # - Catppuccin-Mocha
      # - Catppuccin-Macchiato
      theme =
        let value = builtins.getEnv "THEME"; in
        if value != "" then value else "Catppuccin-Mocha";

      mkImportables = dir: {
        inherit user theme;
        profiles = (rakeLeaves dir);
      };

      mkOverlays = channels: dir:
        map (o: (import o channels))
          (builtins.attrValues (flattenTree (rakeLeaves dir)));

      mkHmConfig = mod: {
        home-manager = {
          users.${user}.imports = [ mod ];
          extraSpecialArgs = mkImportables ./home;
        };
      };

      mkHosts = dir: overrides:
        mergeAny
          (stable.lib.mapAttrs
            (n: v: {
              modules = [
                v.system
                (mkHmConfig v.home)
                { networking.hostName = n; }
              ];
            })
            (rakeLeaves dir))
          overrides;

    in
    mkFlake {
      inherit self inputs;

      channelsConfig = {
        allowUnfree = true;
      };

      channels = {
        stable = {
          overlaysBuilder = channels:
            mkOverlays channels ./overlays;
        };
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

      hosts = mkHosts ./hosts {
        # host-specific properties here
      };
    };
}
