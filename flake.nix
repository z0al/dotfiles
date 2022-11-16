{
  description = "My NixOS ❄ Configuration";

  inputs = {
    stable.url = "github:nixos/nixpkgs/nixos-22.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    hm.url = "github:nix-community/home-manager/release-22.05";
    hm.inputs.nixpkgs.follows = "stable";

    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
  };

  outputs =
    { self
    , stable
    , unstable
    , hm
    , utils
    } @ inputs:
    let
      lib = import ./lib (utils.lib // stable.lib);
    in
    utils.lib.mkFlake {
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

        modules = [
          hm.nixosModules.home-manager
          ./system/shared
        ];
      };

      hosts = utils.lib.mergeAny (lib.importHosts ./hosts) {
        # custom host attributes go here
      };
    };
}
