{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.delta;
  delta = "${pkgs.delta}/bin/delta";
in

{
  options.my.programs.delta = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.programs.git.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.variables = {
      GIT_PAGER = delta;
    };

    hm.programs.git.delta = {
      enable = true;

      options = {
        hyperlinks = true;
        line-numbers = true;
        hunk-header-style = "syntax";
      };
    };

    # Integration with lazygit
    my.programs.lazygit.pager = "${delta} --paging=never";
  };
}
