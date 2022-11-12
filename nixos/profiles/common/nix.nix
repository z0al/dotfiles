{ pkgs, inputs, ... }:

{
  nix = {
    settings = {
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 10d";
    };

    package = pkgs.nixFlakes;
    registry.nixpkgs.flake = inputs.stable;

    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
