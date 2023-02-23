{
  description = "My NixOS ❄ / MacOS 🍏 Configuration";

  inputs = {
    stable.url = "github:nixos/nixpkgs/nixos-22.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin.url = "github:LnL7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "stable";

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
    , darwin
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
      theme = "Catppuccin-Mocha";

      mkImportables = dir: {
        inherit user theme;
        profiles = (rakeLeaves dir);
      };

      mkOverlays = channels: dir:
        map (o: (import o channels))
          (builtins.attrValues (flattenTree (rakeLeaves dir)));

      mkHmConfig = mod: {
        home-manager = {
          users.${ user}. imports = [ ./modules mod ];
          extraSpecialArgs = mkImportables ./home;
        };
      };

      nixosConfig = {
        system = "x86_64-linux";

        specialArgs = (mkImportables ./system/nixos) // {
          inherit hardware;
        };

        modules = [
          hm.nixosModules.home-manager
        ];
      };

      darwinConfig = {
        system = "aarch64-darwin";
        output = "darwinConfigurations";
        builder = darwin.lib.darwinSystem;

        specialArgs = mkImportables ./system/darwin;

        modules = [
          hm.darwinModules.home-manager
        ];
      };

      mkHosts = dir:
        (stable.lib.mapAttrs
          (host: module:
            let
              config =
                if stable.lib.hasPrefix "mac" host
                then darwinConfig else nixosConfig;
            in
            mergeAny
              {
                channelName = "stable";
                modules = config.modules ++ [
                  ./system/shared
                  module.system
                  (mkHmConfig module.home)
                  { networking.hostName = host; }
                ];
              }
              config)
          (rakeLeaves dir));

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

      hosts = mkHosts ./hosts;
    };
}
