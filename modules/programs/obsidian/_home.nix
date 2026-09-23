{ lib, pkgs, ... }:

{
  config = {
    programs.obsidian = {
      enable = lib.mkDefault false;
      package = if pkgs.stdenv.isLinux then pkgs.obsidian else null;
    };
  };
}
