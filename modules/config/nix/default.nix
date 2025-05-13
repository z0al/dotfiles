{ config, inputs, pkgs, ... }:

{
  nix = {
    enable = true;
    package = pkgs.nix;

    settings = {
      trusted-users = [ "root" config.my.user.name ];

      # https://github.com/NixOS/nix/issues/11728
      download-buffer-size = 1 * 1024 * 1024 * 1024; # 1GB
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 10d";
    };

    optimise.automatic = true;

    # https://yusef.napora.org/blog/pinning-nixpkgs-flake/
    registry.nixpkgs.flake = inputs.nixpkgs;

    extraOptions = ''
      experimental-features = nix-command flakes
      warn-dirty = false
    '';
  };
}
