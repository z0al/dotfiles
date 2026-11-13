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
  options.programs.cursor.enablePrettierIntegration = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enablePrettierIntegration {
    programs.cursor.profiles.default = {
      extensions = with pkgs.vscode-marketplace; [
        esbenp.prettier-vscode
      ];

      userSettings = {
        "prettier.enable" = true;
        "prettier.semi" = true;
        "prettier.useTabs" = true;
      }
      //
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
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          });
    };
  };
}
