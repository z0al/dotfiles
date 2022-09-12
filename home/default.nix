{ config, pkgs, username, ... }:

{
  imports =
    # (import ./audio) ++
    # (import ./develop) ++
    # (import ./video) ++
    (import ./shell);

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";

    stateVersion = "22.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
