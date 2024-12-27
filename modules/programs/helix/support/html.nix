{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.helix;
  package = pkgs.vscode-langservers-extracted;

  html-lang-server-bin = "${package}/bin/vscode-html-language-server";
in

{
  config.d.programs.helix = lib.mkIf cfg.enable {
    packages = [ package ];

    languages = {
      language = [{
        name = "html";

        indent = {
          tab-width = 2;
          unit = "\t";
        };

        language-servers = [ "vscode-html-language-server" ];
      }];

      language-server = {
        vscode-html-language-server.command = html-lang-server-bin;
      };
    };
  };
}
