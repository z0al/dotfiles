{ config, lib, inputs, ... }:

{
  imports = with inputs.hardware.nixosModules; [
    common-pc
    common-pc-ssd
    common-cpu-amd
    common-cpu-amd-pstate
    common-gpu-nvidia-nonprime
  ];

  # File System
  d.fs.rootOnTmpfs = true;

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/523B-2008";
    fsType = "vfat";
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/216d850d-c4ef-4351-8f8c-bebd78e6242e";
    fsType = "ext4";
    neededForBoot = true;
  };

  # Boot
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks.devices."crypted" = {
    device = "/dev/disk/by-uuid/5e640cf6-6076-4214-a34b-8c9ffcaf2f78";
  };
}
