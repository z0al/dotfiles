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
  config = lib.mkIf cfg.enable {
    home.sessionVariables = {
      GIT_PAGER = delta;
    };

    programs.delta = {
      enableGitIntegration = true;

      options = {
        hyperlinks = true;
        line-numbers = true;
        hunk-header-style = "syntax";
      };
    };

    # Integration with lazygit
    programs.lazygit.settings.git.diffRenderers = [
      {
        colorArg = "always";
        command = "${delta} --paging=never";
      }
    ];
  };
}
