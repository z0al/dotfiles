{ config, lib, pkgs, nixpkgs, inputs, username, ... }:

{
  # System
  system.stateVersion = "22.05";
  nixpkgs.config.allowUnfree = true;

  # Boot
  boot = {
    kernelPackages = pkgs.linuxPackages;

    loader = {
      timeout = 1;

      grub = {
        configurationLimit = 50;
      };
    };
  };

  # User Management
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" ];
  };

  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Enable the GNOME desktop environment
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

  # Default Shell
  users.defaultUserShell = pkgs.fish;

  # Environment
  environment = {
    shells = [ pkgs.fish ];

    # Enable bash completion for system packages
    # https://nix-community.github.io/home-manager/options.html#opt-programs.bash.enableCompletion
    pathsToLink = [ "/share/bash-completion" ];

    systemPackages = with pkgs; [
      # Shells
      bash
      fish

      ## Web
      brave
      firefox

      ## Video/Audio
      vlc

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
