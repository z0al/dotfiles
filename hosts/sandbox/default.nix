{ config, lib, user, profiles, ... }:

{
  imports = with profiles; [
    base
    gnome
  ];

  # User configuration
  home-manager.users.${user} = {
    imports = [ ./home.nix ];
  };

  users.users.${user} = {
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