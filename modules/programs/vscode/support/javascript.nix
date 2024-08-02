{ config, pkgs, lib, ... }:

let
  cfg = config.d.profiles.dev.javascript;
in

{
  d.programs.vscode = lib.mkIf cfg.enable {
    extensions = with pkgs.vscode-marketplace; [
      dbaeumer.vscode-eslint
    ];

    settings = {
      "typescript.updateImportsOnFileMove.enabled" = "always";
      "javascript.updateImportsOnFileMove.enabled" = "always";
      "typescript.preferences.preferTypeOnlyAutoImports" = true;
    };
  };
}
