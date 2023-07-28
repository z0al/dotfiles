{ config, hardware, user, ... }:

{
  # Hardware
  imports = with hardware.nixosModules; [
    common-gpu-intel
    lenovo-thinkpad
    lenovo-thinkpad-x1
    lenovo-thinkpad-x1-7th-gen
  ];

  boot.kernelModules = [ "kvm-intel" ];
  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];

  # File system
  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-partlabel/boot";
    fsType = "vfat";
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-label/nix";
    fsType = "ext4";
    neededForBoot = true;
  };

  boot.initrd.luks.devices."crypted" = {
    device = "/dev/disk/by-partlabel/crypted";
  };

  # Enable touchpad support
  services.xserver.libinput.enable = true;

  # Power management
  powerManagement.cpuFreqGovernor = "performance";

  # Home manager
  d.hm = [{
    d.apps = {
      slack.enable = true;
      brave.withOkta = true;
      vscode.withCopilot = false;
      zoom.enable = true;
    };

    d.cli = {
      aws.enable = true;
      kubectl.enable = true;
    };
  }];
}
