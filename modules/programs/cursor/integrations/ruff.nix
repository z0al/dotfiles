{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.cursor;
in

{
  options.programs.cursor.enableRuffIntegration = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enableRuffIntegration {
    programs.cursor.profiles.default = {
      extensions = with pkgs.vscode-marketplace; [
        charliermarsh.ruff
      ];

      userSettings = {
        "[python]" = {
          "editor.defaultFormatter" = "charliermarsh.ruff";
        };
        "ruff.format.args" = [
          "--line-length"
          "80"
        ];
      };
    };
  };
}
