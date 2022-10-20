{ config, lib, ... }:

{
  boot = {
    loader = {
      timeout = 1;

      # Use the GRUB 2 boot loader
      grub = {
        enable = true;
        version = 2;
        useOSProber = true;

        device = "nodev";
        efiSupport = true;

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
