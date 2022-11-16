{ config, lib, _, ... }:

{
  imports = with _.sysModules; [
    base
    boot.grub
    gnome
  ];

  # User configuration
  users.users.${_.user} = {
    extraGroups = [ "vboxsf" ];
    password = "demo";
  };

  security = {
    sudo.wheelNeedsPassword = false;
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
