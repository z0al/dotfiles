{ config, pkgs, ... }:

{
  programs.git.extraConfig = {
    # Used to mount .dotfiles
    safe.directory = "/mnt";
  };
}
