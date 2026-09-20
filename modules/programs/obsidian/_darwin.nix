{ config, lib, ... }:

let
  cfg = config.my.programs.obsidian;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "obsidian"
    ];
  };
}
