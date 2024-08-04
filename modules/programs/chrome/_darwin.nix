{ config, lib, ... }:

let
  cfg = config.d.programs.chrome;
in

{
  config = lib.mkIf cfg.enable {
    homebrew = {
      casks = [
        "google-chrome"
      ];
    };
  };
}
