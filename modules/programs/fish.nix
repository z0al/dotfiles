{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.fish;
  cfgEnv = config.environment;
in

{
  imports = with lib; [
    (mkAliasOptionModule
      [ "my" "programs" "fish" "interactiveShellInit" ]
      [ "programs" "fish" "interactiveShellInit" ])
  ];

  options.my.programs.fish = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    plugins = mkOption {
      type = types.listOf types.package;
      default = [ ];
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = cfg.plugins ++ (
      with pkgs.fishPlugins; [
        sponge
        autopair-fish
      ]
    );

    programs.fish = {
      enable = true;
      useBabelfish = true;

      # Autoload plugins
      vendor.config.enable = true;
      vendor.functions.enable = true;
      vendor.completions.enable = true;

      shellAliases = cfgEnv.shellAliases // {
        unset = "set -ge";
        unalias = "functions --erase";
      };

      interactiveShellInit = ''
        set -U fish_greeting

        # Abbreviations
        abbr -a .. --position anywhere --set-cursor -- ../%
        abbr -a ... --position anywhere --set-cursor -- ../../%
        abbr -a .... --position anywhere --set-cursor -- ../../../%

        # https://github.com/meaningful-ooo/sponge
        set sponge_purge_only_on_exit true
      '';
    };
  };
}
