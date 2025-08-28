{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.presets.typescript;

  languages = [
    "jsx"
    "tsx"
    "javascript"
    "typescript"
  ];

  configure = lang: {
    name = lang;

    indent = {
      tab-width = 2;
      unit = "\t";
    };

    language-servers = [
      "typescript-language-server"
      "eslint"
    ];
  };

  eslint-lang-server-bin = "${pkgs.vscode-langservers-extracted}/bin/vscode-eslint-language-server";
in

{
  config.my.programs.helix = lib.mkIf cfg.enable {
    packages = with pkgs; [
      typescript-language-server
      vscode-langservers-extracted
    ];

    languages = {
      language = map configure languages;

      language-server = {
        typescript-language-server = {
          command = lib.getExe pkgs.typescript-language-server;
        };

        eslint = {
          command = eslint-lang-server-bin;

          args = [ "--stdio" ];
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
              showDocumentation.enable = true;
              disableRuleComment = {
                enable = true;
                location = "separateLine";
              };
            };
            codeActionOnSave.mode = "all";
            experimental = { };
            problems.shortenToSingleLine = false;
            workingDirectory.mode = "auto";
          };
        };
      };
    };
  };
}
