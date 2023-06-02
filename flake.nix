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

    nix-index.url = "github:Mic92/nix-index-database";
    nix-index.inputs.nixpkgs.follows = "stable";
  };

  outputs =
    { self
    , stable
    , darwin
    , hm
    , hardware
    , persistence
    , utils
    , ...
    } @ inputs:
    let
      inherit (utils.lib) mkFlake;
      inherit (stable.lib.filesystem) listFilesRecursive;
      inherit (stable.lib) listToAttrs hasSuffix removeSuffix removePrefix;

      nixosConfig = {
        system = "x86_64-linux";

        specialArgs = {
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

      mkHosts = dir: listToAttrs (map
        (file:
          let
            base =
              if hasSuffix "darwin" dir
              then darwinConfig else nixosConfig;

            extend = {
              modules = base.modules ++ [ file ];
            };
          in
          {
            name = removeSuffix ".nix" (baseNameOf file);
            value = base // extend;
          }
        )
        (listFilesRecursive dir));

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
              (listFilesRecursive ./overlays);
        };
        unstable = { };
      };

      hostDefaults = {
        channelName = "stable";
        modules = [ ./system ];

        extraArgs = {
          user = "z0al";
          theme = "catppuccin";
          version = "22.11";
        };
      };

      hosts =
        (mkHosts ./hosts/nixos) //
        (mkHosts ./hosts/darwin);
    };
}
