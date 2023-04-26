{ config, hardware, ... }:

{
  # Hardware
  imports = with hardware.nixosModules; [
    lenovo-thinkpad
    lenovo-thinkpad-x1
    lenovo-thinkpad-x1-7th-gen
  ];

  boot.kernelModules = [ "kvm-intel" ];
  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];

  # File system
   d.fs.rootOnTmpfs = true;
   fileSystems."/boot/efi" = {
    device = "/dev/disk/by-partlabel/boot";
    fsType = "vfat";
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-label/nix";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."crypted" = {
    device = "/dev/disk/by-partlabel/crypted";
  };

  # Home manager
  d.hm = [{
    d.apps = {
      slack.enable = true;
      brave.withOkta = true;
      vscode.withCopilot = false;
      zoom.enable = true;
    };
  }];

  # Enable touchpad support
  services.xserver.libinput.enable = true;

  # Power management
  powerManagement.cpuFreqGovernor = "performance";
}
