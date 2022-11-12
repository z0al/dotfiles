{ suites }:

{
  imports = [
    suites.sandbox
  ];

  users.users.z0al = {
    # Allow mounting & accessing of shared folders.
    extraGroups = [ "vboxsf" ];
    password = "demo";
  };

  security = {
    sudo.wheelNeedsPassword = false;
  };

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

  hardware.cpu.amd.updateMicrocode = true;
  virtualisation.virtualbox.guest.enable = true;
}
