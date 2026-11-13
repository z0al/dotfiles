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
  options.programs.vscode.enableOxcIntegration = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enableOxcIntegration {
    programs.vscode.profiles.default = {
      extensions = with pkgs.vscode-marketplace; [
        oxc.oxc-vscode
      ];

      userSettings =
        lib.genAttrs
          [
            "[css]"
            "[html]"
            "[javascript]"
            "[javascriptreact]"
            "[json]"
            "[jsonc]"
            "[markdown]"
            "[scss]"
            "[typescript]"
            "[typescriptreact]"
          ]
          (_: {
            "editor.defaultFormatter" = "oxc.oxc-vscode";
          });
    };
  };
}
