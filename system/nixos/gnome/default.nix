{ pkgs, lib, ... }:

{
  myUser.imports = [
    ./settings
    ./extensions.nix
  ];

  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbOptions = "lv3:ralt_switch,compose:sclk";
  };

  # Enable the GNOME desktop environment
  services.xserver = {
    desktopManager.gnome.enable = true;

    displayManager = {
      gdm.enable = true;

      # "gnome" -> Wayland
      # "gnome-xorg" -> X11
      defaultSession = lib.mkDefault "gnome-xorg";
    };
  };

  services.gnome = {
    games.enable = false;
    core-developer-tools.enable = false;
    gnome-remote-desktop.enable = false;
    gnome-keyring.enable = true;
  };

  programs = {
    gnome-terminal.enable = false;
    gnome-disks.enable = true;
    evince.enable = true; #           # Document viewer
    file-roller.enable = true; #      # Archive manager
    seahorse.enable = true; #         # Passwords and Keys
  };

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    gnome-photos
    gnome-tour
    gnome.geary
    gnome.gnome-music
    gnome.gnome-screenshot
    gnome.gnome-terminal
    gnome.yelp
  ];
}
