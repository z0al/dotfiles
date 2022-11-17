{ pkgs, ... }:

{
  imports = [
    ./grub.nix
    ./hardware.nix
    ./network.nix
    ./users.nix
  ];

  # Desktop
  fonts.enableDefaultFonts = true;
  i18n.defaultLocale = "en_US.UTF-8";

  # Shell
  users.defaultUserShell = pkgs.fish;
  environment.shellAliases = {
    open = "xdg-open &> $HOME/.xdg-open.log";
  };

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
