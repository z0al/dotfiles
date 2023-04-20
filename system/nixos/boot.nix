{ lib, ... }:

{
  boot = {
    supportedFilesystems = [ "ntfs" ];

    loader = {
      timeout = 1;

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };

      systemd-boot = {
        enable = true;
        configurationLimit = 15;
      };
    };
  };
}
