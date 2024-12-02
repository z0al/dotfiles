{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.forgit;
in

{
  options.d.programs.forgit = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.programs.git.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    d.programs.fish.plugins = with pkgs.fishPlugins; [
      forgit
    ];
  };
}
