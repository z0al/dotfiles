{ pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./fs.nix
    ./hardware.nix
    ./network.nix
    ./pkgs.nix
    ./users.nix
  ];

  # Desktop
  fonts.enableDefaultFonts = true;

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Shell
  users.defaultUserShell = pkgs.fish;

  # Sound
  sound.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Security
  # Needed for Pipewire
  security.rtkit.enable = true;
}
