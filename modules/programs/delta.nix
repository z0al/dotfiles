{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.delta;
  delta = "${pkgs.delta}/bin/delta";
in

{
  options.d.programs.delta = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.variables = {
      DELTA_PAGER = "less --mouse";
      GIT_PAGER = delta;
    };

    my.user.programs.git.delta = {
      enable = true;

      options = {
        hyperlinks = true;
        line-numbers = true;
        hunk-header-style = "syntax";
      };
    };

    # Integration with lazygit
    d.programs.lazygit.pager = "${delta} --paging=never";
  };
}
