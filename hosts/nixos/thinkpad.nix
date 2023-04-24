{ config, hardware, ... }:

{
  imports = with hardware.nixosModules; [
    lenovo-thinkpad
    lenovo-thinkpad-x1
    lenovo-thinkpad-x1-7th-gen
  ];

  # Home
  d.hm = [{
    d.apps = {
      slack.enable = true;
      brave.withOkta = true;
      vscode.withCopilot = false;
      zoom.enable = true;
    };
  }];

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  # File system
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/1b305785-6f58-4201-beec-6c3630226383";
    fsType = "ext4";
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/3248-1C8A";
    fsType = "vfat";
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/3562fa9f-d228-40bd-83a6-e3ac4906148a"; }
  ];

  # Enable swap on luks
  boot.initrd.luks.devices."luks-874ce448-a8e5-41b3-b117-3d99d2b65331" = {
    device = "/dev/disk/by-uuid/874ce448-a8e5-41b3-b117-3d99d2b65331";
    keyFile = "/crypto_keyfile.bin";
  };

  boot.initrd.luks.devices."luks-47687f16-c092-4627-9da1-bdacee69bbe1" = {
    device = "/dev/disk/by-uuid/47687f16-c092-4627-9da1-bdacee69bbe1";
  };

  # Enable touchpad support
  services.xserver.libinput.enable = true;

  # Power management
  powerManagement.cpuFreqGovernor = "performance";
}
