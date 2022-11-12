{
  imports = [
    ./common.nix
  ];

  boot.loader.grub = {
    enable = true;
    version = 2;
    useOSProber = true;

    device = "nodev";
    efiSupport = true;

    configurationLimit = 25;
  };
}
