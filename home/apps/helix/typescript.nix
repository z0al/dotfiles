{ pkgs, ... }:

let
  cfg = {
    auto-format = true;
    indent = {
      tab-width = 2;
      unit = "\t";
    };

    language-servers = [
      "typescript-language-server"
      "eslint"
    ];
  };

  lspBinPath = lang:
    with pkgs.nodePackages;

    if lang == "typescript"
    then "${typescript-language-server}/bin/typescript-language-server"
    else "${vscode-langservers-extracted}/bin/vscode-${lang}-language-server";
in

{
  home.packages = with pkgs.nodePackages; [
    typescript-language-server
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
      typescript-language-server.command = lspBinPath "typescript";
      vscode-css-language-server.command = lspBinPath "css";
      vscode-html-language-server.command = lspBinPath "html";
      vscode-json-language-server.command = lspBinPath "json";

      eslint = {
        args = [ "--stdio" ];
        command = lspBinPath "eslint";
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
