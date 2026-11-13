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
  options.programs.cursor.enableNodeIntegration = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enableNodeIntegration {
    programs.cursor.profiles.default = {
      extensions = with pkgs.vscode-marketplace; [
        bradlc.vscode-tailwindcss
        dbaeumer.vscode-eslint
      ];

      userSettings = {
        "js/ts.updateImportsOnFileMove.enabled" = "always";
        "js/ts.preferences.preferTypeOnlyAutoImports" = true;
      };
    };
  };
}
