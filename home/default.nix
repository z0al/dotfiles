{ pkgs-unstable, username, ... }:

{
  imports = [
    ./dev
    ./gnome
    ./shell
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";

    stateVersion = "22.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Used to configuer themes, keybindings, etc.
  dconf.enable = true;

  # Programs
  home.packages = with pkgs-unstable; [
    logseq
    spotify
  ];
}
