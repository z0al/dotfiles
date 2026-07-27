{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.delta;
  delta = lib.getExe pkgs.delta;
in

{
  config = {
    home.sessionVariables = {
      GIT_PAGER = delta;
    };

    programs.delta = {
      enable = lib.mkDefault config.programs.git.enable;
      enableGitIntegration = true;

      options = {
        hyperlinks = true;
        line-numbers = true;
        hunk-header-style = "syntax";
      };
    };

    # Integration with lazygit
    programs.lazygit.settings.git.paging.pager =
      lib.mkIf cfg.enable "${delta} --paging=never";
  };
}
