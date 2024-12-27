{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.helix;
  package = pkgs.vscode-langservers-extracted;

  css-lang-server-bin = "${package}/bin/vscode-css-language-server";
in

{
  config.d.programs.helix = lib.mkIf cfg.enable {
    packages = [ package ];

    languages = {
      language = [{
        name = "css";

        indent = {
          tab-width = 2;
          unit = "\t";
        };

        language-servers = [ "vscode-css-language-server" ];
      }];

      language-server = {
        vscode-css-language-server.command = css-lang-server-bin;
      };
    };
  };
}
