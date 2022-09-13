{
  description = "My NixOS ❄ Configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Fish shell plugins
    fishFzf.url = "github:PatrickF1/fzf.fish";
    fishZ.url = "github:jethrokuan/z";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
      username = "z0al";
    in
    {
      nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs username nixpkgs home-manager;
        }
      );
    };
}
