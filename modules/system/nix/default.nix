{ config, inputs, ... }:

{
  nix = {
    settings = {
      auto-optimise-store = true;
      trusted-users = [ "root" config.d.user.name ];
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 10d";
    };

    # https://yusef.napora.org/blog/pinning-nixpkgs-flake/
    registry.nixpkgs.flake = inputs.nixpkgs-unstable;

    extraOptions = ''
      experimental-features = nix-command flakes
      warn-dirty = false
    '';
  };

  d.programs.fish.init = ''
    source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
  '';
}
