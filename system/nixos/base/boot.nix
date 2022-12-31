{
  boot = {
    loader = {
      timeout = 1;

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };

      grub = {
        enable = true;
        version = 2;
        useOSProber = true;

        device = "nodev";
        efiSupport = true;

        enableCryptodisk = true;
        configurationLimit = 25;
      };
    };
  };
}
