{ config, pkgs, lib, username, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  users.users.${username} = {
    # For convenience since it's a VM. Don't use in production
    password = "sandbox";

    # Allow mounting & accessing of shared folders.
    extraGroups = [ "vboxsf" ];
  };

  security.sudo.wheelNeedsPassword = false;

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  fileSystems."/".device = "/dev/disk/by-label/nixos";

  services.xserver.displayManager = {
    autoLogin = {
      enable = true;
      user = "${username}";
    };
  };

  # Networking
  networking.hostName = "sandbox";
}
