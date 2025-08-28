{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.bat;
  bat = "${pkgs.bat}/bin/bat";
in

{
  options.my.programs.bat = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    theme = mkOption {
      type = types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.bat
    ];

    environment.shellAliases = {
      cat = bat;
    };

    environment.variables = {
      BAT_THEME = cfg.theme;
    };

    environment.etc."bat/config".text = ''
      --style='plain'
    '';

    home.file.".config/bat/themes" = {
      recursive = true;
      source = ./themes;
      onChange = "${bat} cache --build > /dev/null";
    };
  };
}
