{
  description = "My NixOS ❄ Configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
      username = "z0al";

      # Possible values:
      # - catppuccin-macchiato
      # - catppuccin-mocha
      # - dracula (soon)
      theme = "catppuccin-mocha";
    in
    {
      nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager username theme;
        }
      );
    };
}
