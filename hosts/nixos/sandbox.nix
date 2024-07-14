{ config, lib, ... }:

{
  # User configuration
  my.osUser = {
    extraGroups = [ "vboxsf" ];
    password = "demo";
  };

  my.user = {
    programs.git.extraConfig = {
      safe.directory = "*";
    };
  };

  security = {
    sudo.wheelNeedsPassword = false;
  };

  # File System
  fileSystems."/boot/efi" = {
    device = lib.mkDefault "/dev/disk/by-label/BOOT";
    fsType = lib.mkDefault "vfat";
  };

  fileSystems."/" = {
    device = lib.mkDefault "/dev/disk/by-label/nixos";
    fsType = lib.mkDefault "ext4";
  };

  # Hardware
  boot = {
    kernelModules = [ "kvm-amd" ];

    initrd.availableKernelModules = [
      "ata_piix"
      "ohci_pci"
      "ehci_pci"
      "ahci"
      "sd_mod"
      "sr_mod"
    ];
  };

  networking.useDHCP = lib.mkDefault true;

  hardware.cpu.amd.updateMicrocode = config.hardware.enableRedistributableFirmware;
  virtualisation.virtualbox.guest.enable = true;
}
