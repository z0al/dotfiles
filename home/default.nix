{ pkgs-unstable, _, ... }:

{
  imports = [
    ./desktop
    ./dev
    ./services
    ./shell
  ];

  home = {
    username = "${_.username}";
    homeDirectory = "/home/${_.username}";

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
