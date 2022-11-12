{
  description = "My NixOS ❄ Configuration";

  inputs = {
    stable.url = "github:nixos/nixpkgs/nixos-22.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    hm.url = "github:nix-community/home-manager/release-22.05";
    hm.inputs.nixpkgs.follows = "stable";

    digga.url = "github:divnix/digga/v0.11.0";
    digga.inputs.nixlib.follows = "stable";
    digga.inputs.nixpkgs.follows = "stable";
    digga.inputs.home-manager.follows = "hm";
  };

  outputs =
    { self
    , nixpkgs
    , stable
    , hm
    , digga
    , ...
    } @ inputs:
    digga.lib.mkFlake
      {
        inherit self inputs;

        channelsConfig = { allowUnfree = true; };

        channels = {
          stable = {
            imports = [ (digga.lib.importOverlays ./overlays) ];
          };

          unstable = { };
        };

        nixos = import ./nixos;
        home = import ./home;
      };
}
