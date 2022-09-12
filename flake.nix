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
    in {
      nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs username nixpkgs home-manager;
        }
      );
    };
}


# ./
# |-- bin/
# |   `-- install.sh
# |   `-- update.sh
# |   `-- upgrade.sh
# |-- hosts/
# |   |-- desktop
# |   |   |-- default.nix (imports default modules & hardware configuration)
# |   |   |-- hardware-configuration.nix
# |   |   |-- modules.nix
# |   |-- laptop
# |   |-- work
# |   |-- sandbox
# |   |-- default.nix
# |
# |-- modules/
# |   |-- gnome (wm, keybindings, default apps ..etc)
# |   |-- coding
# |   |-- system (dconf, fonts, themes ..etc)
# |   |-- media (spotify, vlc, gimp, sound ..etc)
# |   |-- terminal (shells (zsh, fish), terminal (alacritty, kitty), tmux, startship, bat ..etc)
# |   |-- web
# |   |-- gaming
# |   |-- work
# |   |-- default.nix (shared modules)
# |-- config/   synmlinked to ~/.config for things e.g. nvim
# |-- flakes.nix
#
# TODO: make a vm and start the repo strucuture there for a vm host then we can try to use a live CD later
