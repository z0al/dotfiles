{ lib, ... }:

{
  boot = {
    loader = {
      timeout = 1;

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };

      systemd-boot = {
        enable = lib.mkDefault false;
        configurationLimit = 10;
      };

      grub = {
        enable = lib.mkDefault false;
        version = 2;
        useOSProber = true;

        device = "nodev";
        efiSupport = true;

        # enableCryptodisk = false;
        configurationLimit = 25;
      };
    };
  };
}
