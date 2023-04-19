{ config, lib, profiles, user, ... }:

{
  imports = with profiles; [
    base
    gnome
    docker
  ];
  
  # File System
  fileSystems."/" = {
    device = "none";
    fsType = "tmpfs";
    options = [ "defaults" "size=2G" "mode=755" ];
  };

  fileSystems."/boot/efi" = { 
    device = "/dev/disk/by-uuid/523B-2008";
    fsType = "vfat";
  };

  fileSystems."/nix" = { 
    device = "/dev/disk/by-uuid/216d850d-c4ef-4351-8f8c-bebd78e6242e";
    fsType = "ext4";
  };

  # Boot
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks.devices."crypted" = {
    device =  "/dev/disk/by-uuid/5e640cf6-6076-4214-a34b-8c9ffcaf2f78";
  };

  # Graphics
  services.xserver.videoDrivers = [ "nvidia" ];
}
