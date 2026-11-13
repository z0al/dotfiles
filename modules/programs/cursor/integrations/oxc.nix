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
  options.programs.cursor.enableOxcIntegration = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enableOxcIntegration {
    programs.cursor.profiles.default = {
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
