{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.lazygit;
  lazygit = "${pkgs.lazygit}/bin/lazygit";
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
    home.shellAliases = {
      gi = lazygit;
    };

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
}
