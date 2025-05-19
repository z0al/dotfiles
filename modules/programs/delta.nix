{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.delta;
  delta = lib.getExe pkgs.delta;
in

{
  options.my.programs.delta = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.programs.git.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.delta
    ];

    environment.variables = {
      GIT_PAGER = delta;
    };

    my.programs.git.settings = {
      core.pager = delta;
      interactive.diffFilter = "${delta} --color-only";

      delta = {
        hyperlinks = true;
        line-numbers = true;
        hunk-header-style = "syntax";
      };
    };

    # Integration with lazygit
    my.programs.lazygit.pager = "${delta} --paging=never";
  };
}
