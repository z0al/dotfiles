{ pkgs, ... }:

{
  imports = [
    ./pkgs.nix
    ./shells.nix
    ./tmpfs.nix
  ];

  # Localization
  time.timeZone = "Europe/London";
}
