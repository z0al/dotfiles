{ pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./hardware.nix
    ./network.nix
    ./pkgs.nix
    ./users.nix
  ];

  # Desktop
  fonts.enableDefaultFonts = true;
  i18n.defaultLocale = "en_US.UTF-8";

  # Shell
  users.defaultUserShell = pkgs.fish;

  # File Systems
  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-label/BOOT";
    fsType = "vfat";
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };
}
