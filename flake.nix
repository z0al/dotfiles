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
      _ = {
        user = "z0al";
      };

    in
    utils.lib.mkFlake {
      inherit self inputs;

      channelsConfig = {
        allowUnfree = true;
      };

      hostDefaults = {
        channelName = "stable";
        modules = [
          # hm.nixosModules.home-manager
          ./system/shared
        ];
      };

      hosts.sandbox = {
        specialArgs = {
          inherit _;
        };

        modules = [
          ./hosts/sandbox
        ];
      };
    };
}
