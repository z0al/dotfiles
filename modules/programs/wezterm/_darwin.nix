{ config, lib, ... }:

let
  cfg = config.d.programs.wezterm;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "wezterm@nightly"
    ];
  };
}
