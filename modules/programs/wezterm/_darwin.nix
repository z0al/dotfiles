{ config, lib, ... }:

let
  cfg = config.dot.programs.wezterm;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "wezterm@nightly"
    ];
  };
}
