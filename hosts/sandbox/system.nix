{ config, lib, user, profiles, ... }:

{
  imports = with profiles; [
    base
    gnome
  ];

  # User configuration
  users.users.${user} = {
    extraGroups = [ "vboxsf" ];
    password = "demo";
  };

  security = {
    sudo.wheelNeedsPassword = false;
  };

  # Hardware
  boot = {
    loader.grub.enable = true;

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
