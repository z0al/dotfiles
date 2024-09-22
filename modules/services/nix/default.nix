{ config, lib, inputs, ... }:

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
    # FIXME: should be fixed by LnL7/nix-darwin#1083
    # registry.nixpkgs.flake = lib.mkForce inputs.nixpkgs-unstable;

    extraOptions = ''
      experimental-features = nix-command flakes
      warn-dirty = false
    '';
  };

  d.programs.fish.interactiveShellInit = ''
    source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
  '';
}
