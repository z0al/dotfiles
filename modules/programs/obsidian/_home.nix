{ lib, ... }:

{
  config = {
    programs.obsidian = {
      enable = lib.mkDefault false;
      package = null;
    };
  };
}
