{ pkgs, nixpkgs, _, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./docker
    ./gnome
    ./nix
  ];

  # System
  system.stateVersion = "22.05";

  nixpkgs.overlays = [
    (import ../overlays/zellij)
  ];

  nixpkgs.config.allowUnfree = true;

  # User Management
  users.users.${_.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" ];
  };

  # Enable the X11 windowing system
  services.xserver.enable = true;

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

      ## Editors
      vim

      ## Languages
      nodejs

      python3
      python3.pkgs.pip

      rustc
      cargo

      ## Utils
      cmake
      curl
      fd
      flameshot
      fzf
      git
      gnumake
      gnupg
      killall
      pfetch
      ripgrep
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
}
