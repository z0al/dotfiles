{ config, lib, ... }:

let
  cfg = config.dot.programs.openscad;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "openscad@snapshot"
    ];
  };
}
