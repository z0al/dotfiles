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
    d.programs = {
      fzf.enable = true;

      fish.plugins = with pkgs.fishPlugins; [
        forgit
      ];
    };

    environment.variables = {
      forgit_log = "gl";
    };
  };
}
