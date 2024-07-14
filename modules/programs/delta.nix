{ config, pkgs, lib, theme, ... }:

let
  cfg = config.d.programs.delta;
  pkg = pkgs.latest.delta;
in

{
  options.d.programs.delta = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    my.user.programs.git.delta = {
      enable = true;
      package = pkg;

      options = {
        line-numbers = true;
        # Note: compatible with Bat themes
        syntax-theme = theme;
        hunk-header-style = "omit";
      };
    };

    # Integration with lazygit
    d.programs.lazygit.pager = "${pkg}/bin/delta --dark --paging=never";
  };
}
