{ config, pkgs, username, ... }:

{
  imports =
    # (import ../modules/editors) ++
    # (import ../modules/programs) ++
    # (import ../modules/services) ++
    (import ../modules/shell);

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";

    stateVersion = "22.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
