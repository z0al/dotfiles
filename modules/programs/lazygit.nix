{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.lazygit;
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

    d.shell.aliases = {
      lz = lib.getExe pkgs.lazygit;
    };

    my.user = {
      programs.lazygit = {
        enable = true;

        settings = {
          git.paging = {
            colorArg = "always";
            pager = cfg.pager;
          };
        };
      };
    };
  };
}
