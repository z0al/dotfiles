{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.vscode;

  languages = [
    "css"
    "html"
    "javascript"
    "javascriptreact"
    "json"
    "jsonc"
    "markdown"
    "scss"
    "typescript"
    "typescriptreact"
  ];

  languageSettings = lib.listToAttrs (map
    (lang: {
      name = "[${lang}]";
      value = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
    })
    languages);
in

{
  my.programs.vscode = lib.mkIf cfg.enable {
    extensions = with pkgs.vscode-marketplace; [
      esbenp.prettier-vscode
    ];

    settings = languageSettings // {
      "prettier.enable" = true;
      "prettier.semi" = true;
      "prettier.useTabs" = true;
    };
  };
}
