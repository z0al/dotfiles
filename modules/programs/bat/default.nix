{ config, pkgs, lib, theme, ... }:

let
  cfg = config.d.programs.bat;
  bat = "${pkgs.bat}/bin/bat";
in

{
  options.d.programs.bat = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    theme = mkOption {
      type = types.str;
      default = theme;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.bat
    ];

    d.shell.aliases = {
      cat = bat;
    };

    d.shell.variables = {
      BAT_THEME = cfg.theme;
    };

    environment.etc."bat/config".text = ''
      --style='plain'
    '';

    my.user = {
      home.file.".config/bat/themes" = {
        recursive = true;
        source = ./themes;
        onChange = "${bat} cache --build > /dev/null";
      };
    };
  };
}
