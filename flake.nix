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

    persistence.url = "github:nix-community/impermanence";

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
    , persistence
    , utils
    , digga
    } @ inputs:
    let
      inherit (utils.lib) mkFlake;
      inherit (digga.lib) flattenTree rakeLeaves;


      extraArgs = {
        user = "z0al";
        theme = "Catppuccin-Mocha";
      };

      nixosConfig = {
        system = "x86_64-linux";

        extraArgs = {
          inherit hardware;
        };

        modules = [
          persistence.nixosModule
          hm.nixosModules.home-manager
          ./system/nixos
        ];
      };

      darwinConfig = {
        system = "aarch64-darwin";
        output = "darwinConfigurations";
        builder = darwin.lib.darwinSystem;

        modules = [
          hm.darwinModules.home-manager
          ./system/darwin
        ];
      };

      mkHosts = dir:
        (stable.lib.mapAttrs
          (host: module:
            let
              config =
                if stable.lib.hasSuffix "darwin" dir
                then darwinConfig else nixosConfig;
            in
            config // {
              modules = config.modules ++ [
                { home-manager.extraSpecialArgs = extraArgs; }
                module
              ];
            }
          )
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
            map (o: (import o channels))
              (builtins.attrValues
                (flattenTree (rakeLeaves ./overlays)));
        };
        unstable = { };
      };

      hostDefaults = {
        inherit extraArgs;

        channelName = "stable";
        modules = [ ./system ];
      };

      hosts =
        (mkHosts ./hosts/nixos) //
        (mkHosts ./hosts/darwin);
    };
}
