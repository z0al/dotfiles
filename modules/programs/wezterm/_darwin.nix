{ config, lib, ... }:

let
  cfg = config.d.programs.ghostty;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "wezterm@nightly"
    ];
  };
}
