{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.lazygit;
  toYAML = lib.generators.toYAML { };
in

{
  options.d.programs.lazygit = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.programs.git.enable;
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

    hm = {
      xdg.configFile."lazygit/config.yml".text = toYAML {
        disableStartupPopups = true;

        git.paging = {
          colorArg = "always";
          pager = cfg.pager;
        };
      };
    };
  };
}
