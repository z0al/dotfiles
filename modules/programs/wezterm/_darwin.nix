{ config, lib, ... }:

let
  cfg = config.my.programs.wezterm;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "wezterm@nightly"
    ];
  };
}
