{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.fish;
  cfgEnv = config.environment;
in

{
  options.d.programs.fish = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    init = mkOption {
      type = types.lines;
      default = "";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs.fishPlugins; [
      sponge
      autopair-fish
    ];

    programs.fish = {
      enable = true;
      useBabelfish = true;

      # Autoload plugins
      vendor.config.enable = true;
      vendor.functions.enable = true;
      vendor.completions.enable = true;

      shellAliases = cfgEnv.shellAliases // {
        unset = "set -e";
      };

      interactiveShellInit = ''
        set -U fish_greeting

        ${cfg.init}
      '';
    };
  };
}
