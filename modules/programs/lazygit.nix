{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.lazygit;
  toYAML = lib.generators.toYAML { };
in

{
  options.my.programs.lazygit = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.programs.git.enable;
    };

    pager = mkOption {
      type = types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      lazygit
    ];

    environment.shellAliases = {
      lz = lib.getExe pkgs.lazygit;
    };

    xdg.configFile."lazygit/config.yml".text = toYAML {
      disableStartupPopups = true;

      git.paging = {
        colorArg = "always";
        pager = cfg.pager;
      };
    };
  };
}
