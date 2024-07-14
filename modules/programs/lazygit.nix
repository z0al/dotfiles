{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.lazygit;
in

{
  options.d.programs.lazygit = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    pager = mkOption {
      type = types.str;
    };
  };

  config.my.user = lib.mkIf cfg.enable {
    d.shell.aliases = {
      gi = "lazygit";
    };

    programs.lazygit = {
      enable = true;
      package = pkgs.latest.lazygit;

      settings = {
        git.paging = {
          colorArg = "always";
          pager = cfg.pager;
        };
      };
    };
  };
}
