{ lib, ... }:

{
  # File Systems
  fileSystems."/boot/efi" = {
    device = lib.mkDefault "/dev/disk/by-label/BOOT";
    fsType = lib.mkDefault "vfat";
  };

  fileSystems."/" = {
    device = lib.mkDefault "/dev/disk/by-label/nixos";
    fsType = lib.mkDefault "ext4";
  };
}
