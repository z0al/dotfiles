{ config, lib, ... }:

let
  cfg = config.d.programs.openscad;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "openscad@snapshot"
    ];
  };
}
