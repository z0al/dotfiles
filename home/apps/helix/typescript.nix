{ pkgs, ... }:

let
  cfg = {
    language-servers = [
      "typescript-language-server"
      "eslint"
    ];

    auto-format = true;
    indent = {
      tab-width = 2;
      unit = "\t";
    };
  };
in

{
  home.packages = with pkgs.nodePackages; [
    typescript-language-server
    # html, css, json, and eslint
    vscode-langservers-extracted
  ];

  programs.helix.languages = {
    language = [
      (cfg // {
        name = "html";
        language-servers = [ "vscode-html-language-server" ];
      })
      (cfg // {
        name = "css";
        language-servers = [ "vscode-css-language-server" ];
      })
      (cfg // {
        name = "json";
        language-servers = [ "vscode-json-language-server" ];
      })
      (cfg // { name = "tsx"; })
      (cfg // { name = "typescript"; })
      (cfg // { name = "jsx"; })
      (cfg // { name = "javascript"; })
    ];

    language-server = {
      eslint = {
        args = [ "--stdio" ];
        command = "vscode-eslint-language-server";
        config = {
          format = true;
          nodePath = "";
          onIgnoredFiles = "off";
          packageManager = "npm";
          quiet = false;
          rulesCustomizations = [ ];
          run = "onType";
          useESLintClass = false;
          validate = "on";
          codeAction = {
            disableRuleComment = {
              enable = true;
              location = "separateLine";
            };
            showDocumentation.enable = true;
          };
          codeActionOnSave.mode = "all";
          experimental = { };
          problems.shortenToSingleLine = false;
          workingDirectory.mode = "auto";
        };
      };
    };
  };
}
