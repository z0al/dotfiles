{ config, lib, ... }:

let
  cfg = config.my.programs.openscad;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "openscad@snapshot"
    ];
  };
}
