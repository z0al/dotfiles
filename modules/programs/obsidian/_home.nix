{ lib, ... }:

{
  config = {
    programs.obsidian = {
      enable = lib.mkDefault false;
      package = lib.mkDefault null;
    };
  };
}
