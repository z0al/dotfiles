{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.vscode;
in

{
  options.programs.vscode.enableNodeIntegration = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enableNodeIntegration {
    programs.vscode.profiles.default = {
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
