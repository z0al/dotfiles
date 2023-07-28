{ pkgs, version, ... }:

{
  imports = [
    ./gnome
    ./auto-login.nix
    ./boot.nix
    ./docker.nix
    ./envfs.nix
    ./file-system.nix
    ./hardware.nix
    ./hidpi.nix
    ./network.nix
    ./nix-ld.nix
    ./pkgs.nix
    ./sound.nix
    ./systemd.nix
    ./trash.nix
    ./users.nix
  ];

  system.stateVersion = version;

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

  services.printing.enable = true;

  # Shell
  users.defaultUserShell = pkgs.fish;

  # Security
  security.polkit.enable = true;

  programs.dconf.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
