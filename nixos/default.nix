{ config, lib, pkgs, inputs, username, ... }:

{
  imports = [];

  # System
  system.stateVersion = "22.05";
  nixpkgs.config.allowUnfree = true;

  # User Management
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "networkmanager" ];
  };

  # X Window System
  services.xserver.enable = true;

  # GNOME
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.defaultSession = "gnome-xorg";

  services.gnome = {
    games.enable = false;
    core-developer-tools.enable = false;
  };

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    gnome-tour
    gnome.gnome-music
  ];

  # Shell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # Environment
  environment = {
    shells = [ pkgs.fish ];

    systemPackages = with pkgs; [
      ## Web
      brave
      firefox

      ## Editors
      vim

      ## Utils
      curl
      git
      gnupg
      killall
      tree
      pfetch
    ];
  };

  # Localization
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";

  # Fonts
  fonts = {
    enableDefaultFonts = true;

    fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [ "FiraCode" ];
      })
    ];
  };

  # Nix
  nix = {
    settings = {
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 14d";
    };

    package = pkgs.nixFlakes;
    registry.nixpkgs.flake = inputs.nixpkgs;

    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}