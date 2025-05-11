{ config, lib, ... }:

let
  cfg = config.my.programs.ghostty;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "ghostty"
    ];
  };
}
