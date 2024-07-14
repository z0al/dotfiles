{ config, pkgs, ... }:

{
  imports = [
    ../.
    ./gnome
    ./auto-login.nix
    ./boot.nix
    ./docker.nix
    ./envfs.nix
    ./hardware.nix
    ./hidpi.nix
    ./network.nix
    ./nix-ld.nix
    ./pkgs.nix
    ./sound.nix
    ./systemd.nix
    ./tmpfs.nix
    ./trash.nix
  ];

  system.stateVersion = config.d.version;

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

  # Security
  security.polkit.enable = true;

  programs.dconf.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
