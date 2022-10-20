{ config, lib, ... }:

{
  boot = {
    loader = {
      timeout = 1;

      # Use the systemd-boot EFI boot loader
      systemd-boot = {
        enable = true;
        configurationLimit = 50;
      };

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-label/BOOT";
    fsType = "vfat";
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };
}
